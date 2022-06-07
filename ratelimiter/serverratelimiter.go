package ratelimiter

import (
	"github.com/gitstliu/log4go"
	"github.com/go-redis/redis/v8"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/redisclient"
	"strconv"
	"sync"
	"time"
)

type ServerRateLimiter struct {
}

// local rate limiter
var localRateCounter = struct {
	sync.RWMutex
	m map[string]int
}{m: make(map[string]int)}

var script = `local key = KEYS[1]
local limitCount = tonumber(ARGV[1])
local startTime = tonumber(ARGV[2])
local currentTime = tonumber(ARGV[3])
local value = tonumber(ARGV[4])
local curReqCount = 0
curReqCount = redis.call('zcount', key, startTime, currentTime)
local result = 0
if (limitCount <= curReqCount) then
	return false
else
	redis.call('zadd', key, currentTime, value)
	return true
end
`

func (rateLimiter *ServerRateLimiter) FlushLimiter(info RateLimiterCtx) {
	if info.RedisAlive {
		// Remove useless key
		key := common.SERVER_RATE_PREFIX + info.Key // key[1]
		count, _ := redisclient.GetInstance().Zremrangebyscore(key, int64(0), common.UnixMilliseconds(time.Now().Add(-time.Minute*1)))
		log4go.Info("FlushLimiter, Remove useless key % v, count %v", key, count)
	}
}

func (rateLimiter *ServerRateLimiter) TryAcquire(info RateLimiterCtx) (bool, error) {
	apiCode := info.Key
	rate := strconv.FormatInt(int64(info.Rate), 10) // arg[1]
	requestId := info.RequestId                     // arg[4]
	if info.RedisAlive {
		key := common.SERVER_RATE_PREFIX + apiCode // key[1]
		to := time.Now()                           // arg[3]
		from := to.Add(-time.Minute * 1)           // arg[2]
		resp, err := redisclient.GetInstance().Eval(script,
			[]string{
				key,
			},
			[]string{
				rate,
				strconv.FormatInt(common.UnixMilliseconds(from), 10),
				strconv.FormatInt(common.UnixMilliseconds(to), 10),
				requestId.String(),
			})
		// Lua boolean false -> r Nil bulk reply
		if err == redis.Nil {
			log4go.Info("TryAcquire redis key,requestId %v", requestId)
			return false, nil
		}
		// Redis go wrong
		if err != nil {
			log4go.Error("TryAcquire eval script error,requestId %v,error %v", requestId, err)
			return false, err
		}
		// Lua boolean true -> r integer reply with value of 1 , return code == 1
		code := resp.(int64)
		log4go.Info("TryAcquire redis key %v, requestId %v,limit rate %v", key, requestId, info.Rate)
		return code == 1, nil
	}

	// fallback local rate limiter
	localRateCounter.Lock()
	if localRateCounter.m[apiCode] > info.Rate {
		return false, nil
	}
	localRateCounter.m[apiCode]++
	log4go.Info("TryAcquire local key %v, requestId %v,current rate %v, limit rate %v", apiCode, requestId, localRateCounter.m[apiCode], info.Rate)
	localRateCounter.Unlock()
	return true, nil
}

func (rateLimiter *ServerRateLimiter) Release(info RateLimiterCtx) {
	var apiCode = info.Key
	if info.RedisAlive {
		key := common.SERVER_RATE_PREFIX + apiCode
		remCount, err := redisclient.GetInstance().Zrem(key, int64(info.RequestId))
		if err != nil {
			// Err occurs, It will be released by the next time api visited (Method - FlushLimiter). The impact of the fault is small.
			log4go.Error("Release redis key %v ,requestId %v, removeCount %v, error:%v", key, info.RequestId, remCount, err)
			return
		}
		log4go.Info("Release redis key %v ,requestId %v,removeCount %v", key, info.RequestId, remCount)
	} else {
		localRateCounter.Lock()
		localRateCounter.m[apiCode]--
		log4go.Info("Release local key %v success,requestId %v,current rate %v", apiCode, info.RequestId, localRateCounter.m[apiCode])
		localRateCounter.Unlock()
	}
}

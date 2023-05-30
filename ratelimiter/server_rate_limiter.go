package ratelimiter

import (
	"github.com/go-redis/redis/v8"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/log"
	"github.com/wuxins/api-gateway/monitor"
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

var script = `local limitCount = tonumber(ARGV[1])
local startTime = tonumber(ARGV[2])
local currentTime = tonumber(ARGV[3])
local value = tonumber(ARGV[4])
local curReqCount = 0
curReqCount = redis.call('zcount', KEYS[1], startTime, currentTime)
local result = 0
if (limitCount <= curReqCount) then
	return false
else
	redis.call('zadd', KEYS[1], currentTime, value)
	return true
end
`

func (rateLimiter *ServerRateLimiter) FlushLimiter(info RateLimiterCtx) {
	if info.RedisAlive {
		// Remove useless key
		key := common.ServerRatePrefix + info.Key // key[1]
		count, _ := redisclient.GetInstance().ZRemRangeByScore(redisclient.BackgroundCtx, key, "0", strconv.FormatInt(common.UnixMilliseconds(time.Now().Add(-time.Minute*1)), 10)).Result()
		log.Pairs(map[string]interface{}{
			"key":   key,
			"count": count,
		}).Debug("FlushLimiter, Remove useless key")
	}
}

func (rateLimiter *ServerRateLimiter) TryAcquire(info RateLimiterCtx) (bool, error) {
	apiCode := info.Key
	rate := strconv.FormatInt(int64(info.Rate), 10) // arg[1]
	requestId := info.RequestId                     // arg[4]
	if info.RedisAlive {
		key := common.ServerRatePrefix + apiCode // key[1]
		to := time.Now()                         // arg[3]
		from := to.Add(-time.Minute * 1)         // arg[2]
		resp, err := redisclient.GetInstance().Eval(redisclient.BackgroundCtx, script,
			[]string{
				key,
			},
			[]string{
				rate,
				strconv.FormatInt(common.UnixMilliseconds(from), 10),
				strconv.FormatInt(common.UnixMilliseconds(to), 10),
				requestId,
			}).Result()
		// Lua boolean false -> r Nil bulk reply
		if err == redis.Nil {
			monitor.Report(monitor.Event{
				Metric:     monitor.MetricApi,
				MetricType: monitor.MetricApiRateLimited,
				Time:       time.Now().Format(common.DateFormatMs),
				Key:        requestId,
				Content: monitor.ApiRateLimitedInfo{
					RateMode:  "redis",
					ApiCode:   info.Key,
					LimitRate: info.Rate,
				},
			})
			return false, nil
		}
		// Redis go wrong
		if err != nil {
			log.Pairs(map[string]interface{}{
				"requestId": requestId,
			}).Error("TryAcquire eval script error", err)
			return false, err
		}
		// Lua boolean true -> r integer reply with value of 1 , return code == 1
		code := resp.(int64)

		log.Pairs(map[string]interface{}{
			"redisKey":  key,
			"requestId": requestId,
			"limitRate": info.Rate,
		}).Debug("TryAcquire redis key")

		return code == 1, nil
	}

	// fallback local rate limiter
	acRate := info.Rate * info.LocalRateDownPercent
	acRate = acRate / 100
	localRateCounter.Lock()
	localRateCounter.m[apiCode]++
	localRateCounter.Unlock()
	if localRateCounter.m[apiCode] > acRate {
		monitor.Report(monitor.Event{
			Metric:     monitor.MetricApi,
			MetricType: monitor.MetricApiRateLimited,
			Time:       time.Now().Format(common.DateFormatMs),
			Key:        requestId,
			Content: monitor.ApiRateLimitedInfo{
				RateMode:  "local",
				ApiCode:   info.Key,
				LimitRate: acRate,
				CurRate:   localRateCounter.m[apiCode],
			},
		})
		return false, nil
	}

	log.Pairs(map[string]interface{}{
		"localKey":    apiCode,
		"requestId":   requestId,
		"currentRate": localRateCounter.m[apiCode],
		"limitRate":   info.Rate,
	}).Debug("TryAcquire redis key")

	return true, nil
}

func (rateLimiter *ServerRateLimiter) Release(info RateLimiterCtx) {
	var apiCode = info.Key
	if info.RedisAlive {
		key := common.ServerRatePrefix + apiCode
		remCount, err := redisclient.GetInstance().ZRem(redisclient.BackgroundCtx, key, info.RequestId).Result()
		if err != nil {
			// Err occurs, It will be released by the next time api visited (Method - FlushLimiter). The impact of the fault is small.
			monitor.Report(monitor.Event{
				Metric:     monitor.MetricApi,
				MetricType: monitor.MetricApiRateRelease,
				Time:       time.Now().Format(common.DateFormatMs),
				Key:        key,
				Content:    err.Error(),
			})
			return
		}

		log.Pairs(map[string]interface{}{
			"redisKey":    key,
			"requestId":   info.RequestId,
			"removeCount": remCount,
			"limitRate":   info.Rate,
		}).Debug("Release redis key")
	} else {
		localRateCounter.Lock()
		localRateCounter.m[apiCode]--
		localRateCounter.Unlock()

		log.Pairs(map[string]interface{}{
			"localKey":    apiCode,
			"requestId":   info.RequestId,
			"currentRate": localRateCounter.m[apiCode],
		}).Debug("Release local key")
	}
}

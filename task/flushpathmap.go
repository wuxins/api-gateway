package task

import (
	"github.com/gitstliu/log4go"
	"time"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dao"
	"github.com/wuxins/api-gateway/ratelimiter"
	"github.com/wuxins/api-gateway/redisclient"
	"github.com/wuxins/api-gateway/regularpath"
)

func StartFlushPathMap() {
	for {
		flushPathMap()
		time.Sleep(time.Duration(config.GetConfigure().Sysconf.FlushPathMapSpan) * time.Millisecond)
	}
}

func flushPathMap() {

	apis := dao.GetAllApi()
	log4go.Info("GetAllApi : %v", apis)

	flushErr := regularpath.FlushPathMapByDtos(apis)

	for _, api := range apis {
		reteInfo := ratelimiter.RateLimiterCtx{
			Key:        api.ApiCode,
			Rate:       api.RateLimit,
			RedisAlive: redisclient.Alive(),
		}
		ratelimiter.GetRateLimiter(config.GetConfigure().Rate.Mode).FlushLimiter(reteInfo)
	}

	if flushErr != nil {
		err := log4go.Error("Flush Error : %v", flushErr)
		if err != nil {
			return
		}
	} else {
		log4go.Info("FlushPathMap Success!")
	}
}

package task

import (
	"encoding/json"
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dao"
	"github.com/wuxins/api-gateway/ratelimiter"
	"github.com/wuxins/api-gateway/redisclient"
	"github.com/wuxins/api-gateway/regularpath"
	"time"
)

func StartFlushPathMap() {

	flushPathMap()
	ticker := time.NewTicker(time.Duration(config.GetConfigure().Sysconf.FlushPathMapSpan) * time.Millisecond)
	defer ticker.Stop()
	for range ticker.C {
		flushPathMap()
	}
}

func flushPathMap() {

	dao.InitAllTenant()
	apis := dao.GetAllApi()
	marshal, _ := json.Marshal(apis)
	log4go.Info("GetAllApi : %v", string(marshal))

	flushErr := regularpath.FlushPathMapByDtos(apis)

	for _, api := range apis {
		reteInfo := ratelimiter.RateLimiterCtx{
			Key:        api.ApiCode,
			Rate:       api.RateLimit,
			RedisAlive: redisclient.Alive(),
		}
		ratelimiter.GetRateLimiter().FlushLimiter(reteInfo)
	}

	if flushErr != nil {
		log4go.Error("Flush Error : %v", flushErr)
	}
	log4go.Info("FlushPathMap Success!")
}

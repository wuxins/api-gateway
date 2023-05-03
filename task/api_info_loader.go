package task

import (
	"encoding/json"
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/breaker"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dao"
	"github.com/wuxins/api-gateway/dto"
	"github.com/wuxins/api-gateway/ratelimiter"
	"github.com/wuxins/api-gateway/redisclient"
	"github.com/wuxins/api-gateway/regularpath"
	"time"
)

func StartFlushPathMap() {

	flushPathMap()
	ticker := time.NewTicker(time.Duration(config.GetConfigure().System.FlushPathMapSpan) * time.Millisecond)
	defer ticker.Stop()
	for range ticker.C {
		flushPathMap()
	}
}

func flushPathMap() {

	regularpath.FlushTenants(dao.GetAllTenants())

	dto.FlushGrayRule(dao.GetAllGrayRules())

	apis := dao.GetAllApi()
	marshal, _ := json.Marshal(apis)
	log4go.Info("GetAllApi : %v", string(marshal))

	flushErr := regularpath.FlushPathMapByDtos(apis, dao.GetAllApiTenants())
	if flushErr != nil {
		log4go.Error("Flush Error : %v", flushErr)
		return
	}

	for _, api := range apis {
		reteInfo := ratelimiter.RateLimiterCtx{
			Key:        api.ApiCode,
			Rate:       api.RateLimit,
			RedisAlive: redisclient.Alive(),
		}
		ratelimiter.GetRateLimiter().FlushLimiter(reteInfo)

		breaker.FlushBreaker(api)
	}

	log4go.Info("FlushPathMap Success!")
}

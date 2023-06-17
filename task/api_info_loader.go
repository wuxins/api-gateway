package task

import (
	"encoding/json"
	"github.com/wuxins/api-gateway/breaker"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dao"
	"github.com/wuxins/api-gateway/dto"
	"github.com/wuxins/api-gateway/log"
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

	dto.FlushGrayRule(dao.GetGrayRule())

	apis := dao.GetAllApi()
	marshal, _ := json.Marshal(apis)
	log.Pair("GetAllApi", string(marshal)).Debug()

	flushErr := regularpath.FlushPathMapByDtos(apis, dao.GetAllApiTenants())
	if flushErr != nil {
		log.Error("Flush Error", flushErr)
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

	log.Info("FlushPathMap Success!")
}

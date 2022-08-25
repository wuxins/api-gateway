package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/ratelimiter"
	"github.com/wuxins/api-gateway/redisclient"
	"net/http"
)

func RateLimiterPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		regularPath := c.RegularPath

		if config.GetConfigure().Rate.Enable && regularPath.NeedRateLimit && regularPath.RateLimit > 0 {
			reteCtx := ratelimiter.RateLimiterCtx{
				Key:        regularPath.ApiCode,
				Rate:       regularPath.RateLimit,
				RedisAlive: redisclient.Alive(),
				RequestId:  c.RequestId,
			}
			acquireOk, err := ratelimiter.GetRateLimiter().TryAcquire(reteCtx)
			defer ratelimiter.GetRateLimiter().Release(reteCtx)
			if err != nil {
				fail(c, http.StatusInternalServerError, common.SysErrorMsg)
				return
			}
			if !acquireOk {
				fail(c, http.StatusInternalServerError, common.RateLimitMsg)
				return
			}
		}

		c.Next()
	}
}

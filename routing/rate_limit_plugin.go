package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/ratelimiter"
	"github.com/wuxins/api-gateway/redisclient"
	"github.com/wuxins/api-gateway/utils"
	"net/http"
)

func RateLimiterPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {
		w := c.Rw
		r := c.Req
		regularPath := c.RegularPath
		requestId := r.Header[common.HeaderRequestId][0]
		// rate limit
		if config.GetConfigure().Rate.Enable && regularPath.NeedRateLimit && regularPath.RateLimit > 0 {
			reteCtx := ratelimiter.RateLimiterCtx{
				Key:        regularPath.ApiCode,
				Rate:       regularPath.RateLimit,
				RedisAlive: redisclient.Alive(),
				RequestId:  requestId,
			}
			acquireOk, err := ratelimiter.GetRateLimiter().TryAcquire(reteCtx)
			defer ratelimiter.GetRateLimiter().Release(reteCtx)
			if err != nil {
				utils.WriteHttpResponse(w, http.StatusInternalServerError, common.SysErrorMsg, r, true)
				c.Abort()
				return
			}
			if !acquireOk {
				utils.WriteHttpResponse(w, http.StatusInternalServerError, common.RateLimitMsg, r, true)
				c.Abort()
				return
			}
		}
		c.Next()
	}
}

package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/idgenerator"
	"net/http"
	"strconv"
	"strings"
	"time"
)

func AccessControlPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req
		w := c.Rw

		w.Header().Set(common.AccessControlAllowOrigin, config.GetConfigure().CORS.AccessControlAllowOrigin)
		w.Header().Set(common.AccessControlAllowMethods, config.GetConfigure().CORS.AccessControlAllowMethods)
		w.Header().Set(common.AccessControlAllowHeaders, config.GetConfigure().CORS.AccessControlAllowHeaders)
		if strings.EqualFold("OPTIONS", strings.ToUpper(c.Req.Method)) {
			w.WriteHeader(http.StatusOK)
			c.Abort()
			return
		}

		requestId := idgenerator.GenSnowflakeId().String()
		requestTime := strconv.FormatInt(common.UnixMilliseconds(time.Now()), 10)
		c.RequestId = requestId
		c.RequestTime = requestTime
		r.Header.Set(common.HeaderRequestId, requestId)
		r.Header.Set(common.HeaderRequestTime, requestTime)

		c.Next()
	}
}

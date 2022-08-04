package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/idgenerator"
	"strconv"
	"time"
)

func AccessControlPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		w := c.Rw
		r := c.Req

		w.Header().Set(common.AccessControlAllowOrigin, "*")
		w.Header().Set(common.AccessControlAllowMethods, config.GetConfigure().Http.AccessControlAllowMethods)
		w.Header().Set(common.AccessControlAllowHeaders, config.GetConfigure().Http.AccessControlAllowHeaders)

		requestId := idgenerator.GenSnowflakeId()
		requestTime := common.UnixMilliseconds(time.Now())
		r.Header.Set(common.HeaderRequestId, requestId.String())
		r.Header.Set(common.HeaderRequestTime, strconv.FormatInt(requestTime, 10))

		c.Next()
	}
}

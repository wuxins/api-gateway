package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/idgenerator"
	"strconv"
	"time"
)

func AccessControlPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req
		requestId := idgenerator.GenSnowflakeId()
		requestTime := common.UnixMilliseconds(time.Now())
		r.Header.Set(common.HeaderRequestId, requestId.String())
		r.Header.Set(common.HeaderRequestTime, strconv.FormatInt(requestTime, 10))
		c.Next()
	}
}

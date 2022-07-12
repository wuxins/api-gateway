package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
)

func AccessControlPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {
		w := c.Rw
		w.Header().Set(common.AccessControlAllowOrigin, "*")
		w.Header().Set(common.AccessControlAllowMethods, config.GetConfigure().Sysconf.AccessControlAllowMethods)
		w.Header().Set(common.AccessControlAllowHeaders, config.GetConfigure().Sysconf.AccessControlAllowHeaders)
		c.Next()
	}
}

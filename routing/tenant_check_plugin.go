package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/utils"
	"net/http"
)

func TenantCheckPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		w := c.Rw
		r := c.Req
		regularPath := c.RegularPath
		tenant := r.Header[common.HeaderTenant]
		supportedTenants := regularPath.Tenants
		isTenantSupport := false
		if tenant != nil && len(supportedTenants) > 0 {
			for _, item := range supportedTenants {
				if tenant[0] == item.TenantCode {
					isTenantSupport = true
				}
			}
		}

		if !isTenantSupport {
			utils.WriteHttpResponse(w, http.StatusForbidden, common.TenantUnsupportedMsg, r, true)
			c.Abort()
			return
		}
		c.Next()
	}
}

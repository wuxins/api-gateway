package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/utils"
	"net/http"
	"strings"
)

func TenantCheckPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		w := c.Rw
		r := c.Req
		regularPath := c.RegularPath
		tenant := r.Header[common.HeaderTenant]
		supportedTenants := regularPath.Tenants
		if tenant != nil && len(supportedTenants) > 0 {
			for _, item := range supportedTenants {
				if tenant[0] == item.TenantCode {
					if item.NeedApiAuth == "Y" {
						// currently , support oauth2.0 client_credentials only
						if item.ApiAuthType != "0" {
							fail(c, w, common.UnauthorizedMsg, r)
							return
						}
						// expireSec := item.TokenExpireIn
						token := strings.ReplaceAll(r.Header["Authorization"][0], "Bearer ", "")
						if strings.TrimSpace(token) == "" {
							fail(c, w, common.UnauthorizedMsg, r)
							return
						}
						claims, err := common.JwtDecode(token)
						if err != nil {
							fail(c, w, common.UnauthorizedMsg, r)
							return
						}
						if item.TenantCode != claims.Issuer {
							fail(c, w, common.UnauthorizedMsg, r)
							return
						}
						c.Next()
						return
					}
				}
			}
		}

		utils.WriteHttpResponse(w, http.StatusForbidden, common.TenantUnsupportedMsg, r, true)
		c.Abort()
		return
	}
}

package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"net/http"
	"strings"
	"time"
)

func TenantCheckPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req
		regularPath := c.RegularPath
		if !regularPath.NeedApiAuth {
			c.Next()
			return
		}
		tenants := regularPath.Tenants
		if nil == tenants {
			fail(c, http.StatusUnauthorized, common.TenantUnsupportedMsg)
			return
		}
		authInfo := r.Header["Authorization"]
		if nil == authInfo {
			fail(c, http.StatusUnauthorized, common.UnauthorizedMsg)
			return
		}
		token := strings.ReplaceAll(authInfo[0], "Bearer ", common.DelimiterEmpty)
		if strings.TrimSpace(token) == common.DelimiterEmpty {
			fail(c, http.StatusUnauthorized, common.UnauthorizedMsg)
			return
		}
		claims, err := common.JwtDecode(token, config.GetConfigure().Tenant.TokenSignKey)
		if err != nil {
			fail(c, http.StatusUnauthorized, common.UnauthorizedMsg)
			return
		}
		if strings.TrimSpace(claims.Issuer) == common.DelimiterEmpty {
			fail(c, http.StatusUnauthorized, common.TenantUnsupportedMsg)
			return
		}
		if _, ok := tenants[claims.Issuer]; !ok {
			fail(c, http.StatusUnauthorized, common.TenantUnsupportedMsg)
			return
		}
		tenant := tenants[claims.Issuer]
		if !claims.VerifyExpiresAt(time.Now().Unix(), false) {
			fail(c, tenant.TokenExpireCode, tenant.TokenExpireContent)
			return
		}
		c.Next()
	}
}

package routing

import (
	"github.com/wuxins/api-gateway/common"
	"net/http"
	"strconv"
	"strings"
	"time"
)

func TenantCheckPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req
		regularPath := c.RegularPath

		tenant := r.Header[common.HeaderTenant]
		supportedTenants := regularPath.Tenants
		if tenant == nil || len(supportedTenants) <= 0 {
			fail(c, http.StatusUnauthorized, common.TenantUnsupportedMsg)
			return
		}
		for _, item := range supportedTenants {
			if tenant[0] != item.TenantCode {
				continue
			}

			c.RequestTenant = item

			if item.NeedApiAuth != "Y" {
				c.Next()
				return
			}
			// currently , support oauth2.0 client_credentials only
			if item.ApiAuth.ApiAuthType != "0" {
				fail(c, http.StatusInternalServerError, common.UnauthorizedMsg)
				return
			}
			tokenExpireReturnCode, _ := strconv.Atoi(item.ApiAuth.TokenExpireReturnCode)
			// expireSec := item.TokenExpireIn
			authInfo := r.Header["Authorization"]
			if nil == authInfo {
				fail(c, tokenExpireReturnCode, common.UnauthorizedMsg)
				return
			}
			token := strings.ReplaceAll(authInfo[0], "Bearer ", common.DelimiterEmpty)
			if strings.TrimSpace(token) == common.DelimiterEmpty {
				fail(c, tokenExpireReturnCode, common.UnauthorizedMsg)
				return
			}
			claims, err := common.JwtDecode(token, item.ApiAuth.TokenSignKey)
			if err != nil {
				fail(c, http.StatusInternalServerError, err.Error())
				return
			}
			if item.TenantCode != claims.Issuer {
				fail(c, http.StatusInternalServerError, "Token Invalid : Issuer error !")
				return
			}

			// client need request /oauth/tokens - get a new token
			if !claims.VerifyExpiresAt(time.Now().Unix(), false) {
				fail(c, tokenExpireReturnCode, common.UnauthorizedMsg)
				return
			}
			c.Next()
			return
		}
		fail(c, http.StatusUnauthorized, common.TenantUnsupportedMsg)
	}
}

package routing

import (
	"encoding/json"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/dto"
	"net/http"
	"strings"
	"time"
)

func TenantCheckPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		w := c.Rw
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
			if item.NeedApiAuth != "Y" {
				c.Next()
				return
			}
			// currently , support oauth2.0 client_credentials only
			if item.ApiAuthType != "0" {
				fail(c, http.StatusInternalServerError, common.UnauthorizedMsg)
				return
			}
			unauthorizedResp, _ := json.Marshal(&dto.Response{
				Code: item.TokenExpireCode,
			})
			// expireSec := item.TokenExpireIn
			authInfo := r.Header["Authorization"]
			if nil == authInfo {
				fail(c, http.StatusUnauthorized, string(unauthorizedResp))
				return
			}
			token := strings.ReplaceAll(authInfo[0], "Bearer ", common.DelimiterEmpty)
			if strings.TrimSpace(token) == common.DelimiterEmpty {
				fail(c, http.StatusUnauthorized, string(unauthorizedResp))
				return
			}
			claims, err := common.JwtDecode(token, item.TokenSignKey)
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
				fail(c, http.StatusUnauthorized, string(unauthorizedResp))
				return
			}
			c.Next()
			return
		}
		fail(c, http.StatusUnauthorized, common.TenantUnsupportedMsg)
	}
}

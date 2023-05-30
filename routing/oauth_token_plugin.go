package routing

import (
	"crypto/md5"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dto"
	"github.com/wuxins/api-gateway/regularpath"
	"net/http"
	"strings"
	"time"
)

func OauthTokenPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req

		authHeader := r.Header["Authorization"]
		if authHeader == nil {
			fail(c, http.StatusUnauthorized, common.UnauthorizedMsg)
			return
		}
		// Basic YWRtaW46MTIzNDU2
		authMsg := authHeader[0]
		splitAuthMsg := strings.Split(authMsg, common.DelimiterBlank)
		if len(splitAuthMsg) != 2 {
			fail(c, http.StatusUnauthorized, common.UnauthorizedMsg)
			return
		}

		// admin:123456
		decodeAuthMsg, err := base64.StdEncoding.DecodeString(splitAuthMsg[1])
		if err != nil {
			fail(c, http.StatusUnauthorized, common.UnauthorizedMsg)
			return
		}

		tenantAuthMsg := strings.Split(string(decodeAuthMsg), common.DelimiterSemicolon)
		if len(tenantAuthMsg) != 2 {
			fail(c, http.StatusUnauthorized, common.UnauthorizedMsg)
			return
		}

		key := tenantAuthMsg[0]
		secret := tenantAuthMsg[1]

		tenants := regularpath.GetTenants()
		if _, ok := tenants[key]; !ok {
			fail(c, http.StatusUnauthorized, common.TenantUnsupportedMsg)
			return
		}
		salt := tenants[key].TenantSecretSalt
		tenantSecret := tenants[key].TenantSecret
		secretSum := fmt.Sprintf("%x", md5.Sum([]byte(secret+salt)))
		if !strings.EqualFold(secretSum, tenantSecret) {
			fail(c, http.StatusUnauthorized, common.TenantSKErrorMsg)
			return
		}
		claims := jwt.StandardClaims{
			Issuer:    tenants[key].TenantCode,
			ExpiresAt: time.Now().Add(time.Duration(tenants[key].TokenExpireIn) * time.Second).In(time.Local).Unix(),
		}

		token, err := common.JwtEncode(claims, config.GetConfigure().Tenant.TokenSignKey, config.GetConfigure().Tenant.TokenSignMethod)
		if err != nil {
			fail(c, http.StatusInternalServerError, err.Error())
			return
		}

		resp, _ := json.Marshal(&dto.TokensResponse{
			ExpiresIn:   tenants[key].TokenExpireIn,
			TokenType:   "Bearer",
			AccessToken: token,
			Scope:       "read_write",
		})

		success(c, string(resp))
	}
}

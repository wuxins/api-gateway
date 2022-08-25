package routing

import (
	"encoding/base64"
	"encoding/json"
	"github.com/dgrijalva/jwt-go"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/dao"
	"github.com/wuxins/api-gateway/dto"
	"io/ioutil"
	"net/http"
	"strings"
	"time"
)

func OauthTokenPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req

		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			fail(c, http.StatusInternalServerError, err.Error())
			return
		}

		var tokenInput dto.TokensRequest
		if err = json.Unmarshal(body, &tokenInput); err != nil {
			fail(c, http.StatusInternalServerError, err.Error())
			return
		}
		tenants := dao.Tenants

		// Basic YWRtaW46MTIzNDU2
		authMsg := r.Header["Authorization"][0]
		splitAuthMsg := strings.Split(authMsg, common.DelimiterBlank)
		if len(splitAuthMsg) != 2 {
			fail(c, http.StatusInternalServerError, "Authorization info invalid:"+authMsg)
			return
		}

		// admin:123456
		decodeAuthMsg, err := base64.StdEncoding.DecodeString(splitAuthMsg[1])
		if err != nil {
			fail(c, http.StatusInternalServerError, err.Error())
			return
		}

		tenantAuthMsg := strings.Split(string(decodeAuthMsg), common.DelimiterSemicolon)
		if len(tenantAuthMsg) != 2 {
			return
		}

		for _, item := range tenants {

			if item.TenantCode != tenantAuthMsg[0] {
				continue
			}

			if item.ApiAuth.ApiAuthType != "0" {
				fail(c, http.StatusUnauthorized, "Authorization info invalid: api auth type not supported!")
				return
			}

			if item.ApiAuth.Secret != tenantAuthMsg[1] {
				fail(c, http.StatusUnauthorized, "Authorization info invalid: api auth secret incorrect!")
				return
			}
			claims := jwt.StandardClaims{
				Issuer:    item.TenantCode,
				ExpiresAt: time.Now().Add(time.Duration(item.ApiAuth.TokenExpireIn) * time.Second).In(time.Local).Unix(),
			}

			token, err := common.JwtEncode(claims, item.ApiAuth.TokenSignKey, item.ApiAuth.TokenSignMethod)
			if err != nil {
				fail(c, http.StatusInternalServerError, err.Error())
				return
			}

			resp, _ := json.Marshal(&dto.Response{
				Code: "00",
				Msg:  "Success",
				Data: &dto.TokensResponse{
					ExpiresIn:   item.ApiAuth.TokenExpireIn,
					TokenType:   "Bearer",
					AccessToken: token,
					Scope:       "read_write",
				},
			})

			success(c, string(resp))
			return
		}

		fail(c, http.StatusForbidden, common.TenantUnsupportedMsg)
	}
}

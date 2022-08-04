package routing

import (
	"encoding/base64"
	"encoding/json"
	"github.com/dgrijalva/jwt-go"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/dao"
	"github.com/wuxins/api-gateway/dto"
	"github.com/wuxins/api-gateway/utils"
	"io/ioutil"
	"net/http"
	"strings"
	"time"
)

func OauthTokenPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		w := c.Rw
		r := c.Req

		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			fail(c, w, common.SysErrorMsg, r)
			return
		}

		var tokenInput dto.TokensInput
		if err = json.Unmarshal(body, &tokenInput); err != nil {
			fail(c, w, common.UnauthorizedMsg, r)
			return
		}
		tenants := dao.Tenants

		// Basic YWRtaW46MTIzNDU2
		authMsg := r.Header["Authorization"][0]
		splitAuthMsg := strings.Split(authMsg, common.DelimiterBlank)
		if len(splitAuthMsg) != 2 {
			fail(c, w, common.UnauthorizedMsg, r)
			return
		}

		// admin:123456
		decodeAuthMsg, err := base64.StdEncoding.DecodeString(splitAuthMsg[1])
		if err != nil {
			fail(c, w, err.Error(), r)
			return
		}

		tenantAuthMsg := strings.Split(string(decodeAuthMsg), common.DelimiterSemicolon)
		if len(tenantAuthMsg) != 2 {
			return
		}

		for _, item := range tenants {

			if item.TenantCode != tenantAuthMsg[0] || item.Secret != tenantAuthMsg[1] {
				continue
			}

			claims := jwt.StandardClaims{
				Issuer:    item.TenantCode,
				ExpiresAt: time.Now().Add(time.Duration(item.TokenExpireIn) * time.Second).In(time.Local).Unix(),
			}

			token, err := common.JwtEncode(claims)
			if err != nil {
				fail(c, w, common.UnauthorizedMsg, r)
				return
			}

			resp, _ := json.Marshal(&dto.Response{
				Code: "00",
				Msg:  "Success",
				Data: &dto.TokensOutput{
					ExpiresIn:   item.TokenExpireIn,
					TokenType:   "Bearer",
					AccessToken: token,
					Scope:       "read_write",
				},
			})

			success(c, w, string(resp), r)
			return
		}
		fail(c, w, common.UnauthorizedMsg, r)
		return
	}
}

func success(c *RouterContext, w http.ResponseWriter, data string, r *http.Request) {
	utils.WriteHttpResponse(w, http.StatusOK, data, r, true)
	c.Abort()
}

func fail(c *RouterContext, w http.ResponseWriter, data string, r *http.Request) {
	utils.WriteHttpResponse(w, http.StatusInternalServerError, data, r, true)
	c.Abort()
}

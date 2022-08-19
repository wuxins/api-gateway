package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/regularpath"
	"github.com/wuxins/api-gateway/utils"
	"net/http"
	"net/url"
)

func UrlCheckPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {
		w := c.Rw
		r := c.Req

		currUrl, decodeErr := url.PathUnescape(r.URL.Path)

		if decodeErr != nil {
			utils.WriteHttpResponse(w, http.StatusInternalServerError, common.PathErrorMsg, r, true)
			c.Abort()
			return
		}

		regularPath := regularpath.CheckURLMatch(currUrl, r.Method)
		if regularPath == nil {
			utils.WriteHttpResponse(w, http.StatusForbidden, common.UnauthorizedMsg, r, true)
			c.Abort()
			return
		}
		c.RegularPath = regularPath
		c.Next()
	}
}

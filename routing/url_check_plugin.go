package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/regularpath"
	"github.com/wuxins/api-gateway/utils"
	"net/http"
	"net/url"
	"strings"
)

func UrlCheckPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {
		w := c.Rw
		r := c.Req

		if strings.EqualFold("OPTIONS", strings.ToUpper(r.Method)) {
			w.WriteHeader(http.StatusOK)
			c.Abort()
			return
		}

		currUrl, decodeErr := url.PathUnescape(r.URL.Path)

		// health check endpoint
		if currUrl == "/ping" {
			w.WriteHeader(http.StatusOK)
			_, _ = w.Write(common.StringToBytes(common.HeartbeatMsg))
			c.Abort()
			return
		}

		if currUrl == "/" {
			w.WriteHeader(http.StatusOK)
			_, _ = w.Write(common.StringToBytes(common.WelcomeMsg))
			c.Abort()
			return
		}

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

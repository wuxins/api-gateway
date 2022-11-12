package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/regularpath"
	"net/http"
	"net/url"
)

func UrlCheckPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req

		currUrl, decodeErr := url.PathUnescape(r.URL.Path)
		if decodeErr != nil {
			fail(c, http.StatusInternalServerError, common.PathErrorMsg)
			return
		}

		regularPath := regularpath.CheckURLMatch(currUrl, r.Method)
		if regularPath == nil {
			fail(c, http.StatusForbidden, common.PathErrorMsg)
			return
		}

		c.RegularPath = regularPath
		c.RequestUpstreamAddress = regularPath.Address
		c.Next()
	}
}

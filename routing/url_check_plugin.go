package routing

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/idgenerator"
	"github.com/wuxins/api-gateway/regularpath"
	"github.com/wuxins/api-gateway/utils"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"time"
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
		if currUrl == "/" {
			w.WriteHeader(http.StatusOK)
			w.Write(common.StringToBytes(common.WelcomeMsg))
			c.Abort()
			return
		}

		requestId := idgenerator.GenSnowflakeId()
		requestTime := common.UnixMilliseconds(time.Now())
		r.Header.Set(common.HeaderRequestId, requestId.String())
		r.Header.Set(common.HeaderRequestTime, strconv.FormatInt(requestTime, 10))

		if decodeErr != nil {
			utils.WriteHttpResponse(w, http.StatusInternalServerError, common.PathErrorMsg, r, true)
			c.Abort()
			return
		}

		regularPath := regularpath.CheckURLMatch(currUrl, r.Method)
		if regularPath == nil {
			utils.WriteHttpResponse(w, http.StatusUnauthorized, common.UnauthorizedMsg, r, true)
			c.Abort()
			return
		}
		c.RegularPath = regularPath
		c.Next()
	}
}

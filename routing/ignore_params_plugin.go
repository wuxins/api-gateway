package routing

import (
	"github.com/wuxins/api-gateway/common"
	"net/url"
)

func IgnoreParamsPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req
		path := c.RegularPath
		ignoreQueryParams := path.IgnoreQueryParams
		values := url.Values{}
		queryParams, _ := url.ParseQuery(r.URL.RawQuery)
		for k, v := range queryParams {
			if !common.ContainsStr(ignoreQueryParams, k) {
				values.Add(k, v[0])
			}
		}
		r.URL.RawQuery = values.Encode()
		ignoreHeaderParams := path.IgnoreHeaderParams
		for k := range r.Header {
			if common.ContainsStr(ignoreHeaderParams, k) {
				r.Header.Del(k)
			}
		}
		c.Next()
	}
}

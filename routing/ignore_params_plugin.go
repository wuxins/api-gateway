package routing

import (
	"github.com/wuxins/api-gateway/common"
	"net/url"
	"strings"
)

func IgnoreParamsPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req
		path := c.RegularPath
		requestTenant := c.RequestTenant

		ignoreQueryParams := path.IgnoreQueryParams
		tenantIgnoreQueryParams := requestTenant.IgnoreQueryParams
		if len(tenantIgnoreQueryParams) > 0 {
			tenantIgnoreQueryParamsList := strings.Split(tenantIgnoreQueryParams, common.DelimiterComma)
			for _, item := range tenantIgnoreQueryParamsList {
				ignoreQueryParams = append(ignoreQueryParams, item)
			}
		}
		values := url.Values{}
		queryParams, _ := url.ParseQuery(r.URL.RawQuery)
		for k, v := range queryParams {
			if !common.ContainsStr(ignoreQueryParams, k) {
				values.Add(k, v[0])
			}
		}
		r.URL.RawQuery = values.Encode()

		ignoreHeaderParams := path.IgnoreHeaderParams
		tenantIgnoreHeaderParams := requestTenant.IgnoreHeaderParams
		if len(tenantIgnoreHeaderParams) > 0 {
			tenantIgnoreHeaderParamsList := strings.Split(tenantIgnoreHeaderParams, common.DelimiterComma)
			for _, item := range tenantIgnoreHeaderParamsList {
				ignoreHeaderParams = append(ignoreHeaderParams, item)
			}
		}
		for k := range r.Header {
			if common.ContainsStr(ignoreHeaderParams, k) {
				r.Header.Del(k)
			}
		}

		c.Next()
	}
}

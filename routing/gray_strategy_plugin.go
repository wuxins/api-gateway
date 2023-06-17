package routing

import (
	"github.com/bytedance/sonic"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/utils"
	"math/rand"
	"strings"
	"time"
)

func GrayStrategyPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req
		regularPath := c.RegularPath
		c.RequestUpstreamAddress = regularPath.Address

		if !regularPath.NeedGray {
			c.Next()
			return
		}
		grayStrategy := regularPath.GrayRule
		if r.Header[grayStrategy.HeaderPassTag] != nil && r.Header[grayStrategy.HeaderPassTag][0] == "Y" {
			processGray(c)
			return
		}
		grayIps := grayStrategy.FeatureIpList // ip
		if len(grayIps) > 0 && strings.Contains(grayIps, utils.GetIP(r)) {
			processGray(c)
			return
		}
		if grayStrategy.Mode == 1 { // scale
			rand.Seed(time.Now().UnixNano())
			if rand.Intn(100) <= grayStrategy.ScaleRate {
				processGray(c)
				return
			}
		}
		if grayStrategy.Mode == 0 && len(grayStrategy.FeatureHeaderTags) > 0 { // feature
			featureContentMap := map[string]string{}
			_ = sonic.UnmarshalString(grayStrategy.FeatureHeaderTags, &featureContentMap)
			for key, value := range featureContentMap {
				if nil != r.Header[key] && len(value) > 0 && common.ContainsStr(strings.Split(value, common.DelimiterComma), r.Header[key][0]) {
					processGray(c)
					return
				}
			}
		}
		c.Next()
	}
}

func processGray(c *RouterContext) {
	c.Req.Header.Set(c.RegularPath.GrayRule.HeaderPassTag, "Y")
	if len(c.RegularPath.GrayAddress) > 0 {
		c.RequestUpstreamAddress = c.RegularPath.GrayAddress
	}
	c.Next()
}

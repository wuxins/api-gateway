package routing

import (
	"github.com/bytedance/sonic"
	"github.com/wuxins/api-gateway/dto"
	"math/rand"
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
		hitGray := false
		if r.Header[grayStrategy.HeaderPassTag] != nil && r.Header[grayStrategy.HeaderPassTag][0] == "Y" {
			hitGray = true
		} else {
			featureContent := grayStrategy.FeatureContent
			if grayStrategy.Mode == 0 { // feature
				if len(featureContent) > 0 {
					featureContentObj := dto.FeatureContent{}
					_ = sonic.UnmarshalString(featureContent, &featureContentObj)

					for key, value := range featureContentObj.HeaderTagMap {
						if r.Header[key] != nil && r.Header[key][0] == value {
							hitGray = true
							break
						}
					}
				}
			} else { // scale+
				rand.Seed(time.Now().UnixNano())
				if rand.Intn(100) <= grayStrategy.ScaleRate {
					hitGray = true
				}
			}
		}

		if hitGray {
			r.Header.Set(grayStrategy.HeaderPassTag, "Y")
			c.RequestUpstreamAddress = regularPath.GrayAddress
		}

		c.Next()
	}
}

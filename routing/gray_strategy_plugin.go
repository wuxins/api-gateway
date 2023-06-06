package routing

import (
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
		featureTagMap := grayStrategy.FeatureTagMap
		if grayStrategy.Mode == 0 { // feature
			if len(featureTagMap) > 0 {
				for key, value := range featureTagMap {
					if r.Header[key] != nil && r.Header[key][0] == value {
						hitGray = true
						break
					}
				}
			}
		} else { // scale
			rand.Seed(time.Now().UnixNano())
			if rand.Intn(100) <= grayStrategy.ScaleRate {
				hitGray = true
			}
		}

		if hitGray {
			r.Header.Set(grayStrategy.HeaderPassTag, "Y")
			if "N" == grayStrategy.Global { // service gray
				c.RequestUpstreamAddress = regularPath.GrayAddress
			}
		}

		c.Next()
	}
}

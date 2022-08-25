package routing

import (
	"math/rand"
	"time"
)

func GrayStrategyPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		r := c.Req
		regularPath := c.RegularPath

		grayStrategy := regularPath.GrayStrategy
		hitGray := false
		if regularPath.NeedGray && len(grayStrategy.Address) > 0 {
			featureRelease := grayStrategy.FeatureRelease
			headers := featureRelease.Headers
			if featureRelease.Enable && len(headers) > 0 {
				for key, value := range headers {
					if r.Header[key] != nil && r.Header[key][0] == value {
						hitGray = true
						break
					}
				}
			}

			if !hitGray && grayStrategy.ScaleRelease.Enable {
				rand.Seed(time.Now().UnixNano())
				if rand.Intn(100) <= grayStrategy.ScaleRelease.Percent {
					hitGray = true
				}
			}
		}

		if hitGray {
			r.Header.Set(grayStrategy.TagHeaderKey, grayStrategy.TagHeaderValue)
			c.RequestUpstreamAddress = grayStrategy.Address
		} else {
			c.RequestUpstreamAddress = regularPath.Address
		}

		c.Next()
	}
}

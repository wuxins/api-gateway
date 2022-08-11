package routing

import (
	"github.com/wuxins/api-gateway/common"
	"math/rand"
	"strings"
	"time"
)

func GrayStrategyPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {
		r := c.Req
		regularPath := c.RegularPath

		hitGray := false
		if len(regularPath.GrayAddress) > 0 {
			grayTag := r.Header[common.HeaderGrayTag]
			if grayTag != nil && strings.EqualFold(grayTag[0], "on") { // assigned gray strategy
				hitGray = true
			} else { // mass release gray strategy
				if regularPath.NeedMassRelease {
					rand.Seed(time.Now().UnixNano())
					if rand.Intn(100) <= regularPath.MassReleaseRate { // dice under mass release threshold
						hitGray = true
						r.Header[common.HeaderGrayTag][0] = "on"
					}

				}
			}
		}

		if hitGray {
			c.Set("upstreamAddress", regularPath.GrayAddress)
		} else {
			c.Set("upstreamAddress", regularPath.Address)
		}
		c.Next()
		return
	}
}

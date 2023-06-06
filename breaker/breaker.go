package breaker

import (
	"github.com/afex/hystrix-go/hystrix"
	"github.com/wuxins/api-gateway/dto"
)

func FlushBreaker(api dto.Api) {
	if api.NeedBreaker == "Y" {
		timeout := api.ReadTimeout
		if timeout <= 0 {
			timeout = 10_000
		}
		rate := api.RateLimit
		if rate <= 0 {
			rate = 10
		}
		threshold := api.BreakerErrPerThreshold
		if threshold <= 0 {
			threshold = 50
		}
		hystrix.ConfigureCommand(api.ApiCode, hystrix.CommandConfig{
			Timeout:               int(timeout),
			MaxConcurrentRequests: rate,
			ErrorPercentThreshold: threshold,
		})
	}
}

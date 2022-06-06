package loadbalance

import "github.com/wuxins/api-gateway/dao/dto"

type LoadBalancer interface {
	Select(servers []dto.UpstreamServer) (string, error)
}

func GetLoadBalancer(lbStrategies string) LoadBalancer {

	var lb LoadBalancer
	if len(lbStrategies) <= 0 || "Random" == lbStrategies {
		lb = &RandomLoadBalancer{}
	}
	return lb
}

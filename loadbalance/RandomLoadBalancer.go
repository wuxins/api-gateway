package loadbalance

import (
	"errors"
	"github.com/wuxins/api-gateway/dto"
	"math/rand"
)

type RandomLoadBalancer struct {
}

func (lb *RandomLoadBalancer) Select(servers []dto.UpstreamServer) (string, error) {
	serverSize := len(servers)
	if serverSize <= 0 {
		return "", errors.New("proxy no server available error")
	}
	if serverSize == 1 {
		return servers[0].Host, nil
	}
	return servers[rand.Intn(serverSize)].Host, nil
}

package ratelimiter

import (
	"github.com/zeromicro/go-zero/core/limit"
	"za.group/api-gateway/common"
	"za.group/api-gateway/redisclient"
)

// 线性写，并发读
var clientLimiterMap = map[string]*limit.TokenLimiter{}

type ClientRateLimiter struct {
}

func (rateLimiter *ClientRateLimiter) FlushLimiter(info RateLimiterCtx) {
	clientLimiterMap[info.Key] = limit.NewTokenLimiter(info.Rate,
		info.Rate, redisclient.GetInstance(),
		common.CLIENT_RATE_PREFIX+info.Key,
	)
}

func (rateLimiter *ClientRateLimiter) TryAcquire(info RateLimiterCtx) (bool, error) {
	if v, ok := clientLimiterMap[info.Key]; ok {
		return v.Allow(), nil
	}
	return true, nil
}

func (rateLimiter *ClientRateLimiter) Release(info RateLimiterCtx) {
	// do nothing
}

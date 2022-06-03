package ratelimiter

import "github.com/bwmarrin/snowflake"

type RateLimiterCtx struct {
	Key        string
	Rate       int
	RedisAlive bool
	RequestId  snowflake.ID
}

type RateLimiter interface {

	// FlushLimiter means Refresh limiter
	FlushLimiter(info RateLimiterCtx)

	// TryAcquire resource
	TryAcquire(info RateLimiterCtx) (bool, error)

	// Release acquired resource
	Release(info RateLimiterCtx)
}

func GetRateLimiter(mode string) RateLimiter {

	var rateLimiter RateLimiter
	if mode == "server" {
		rateLimiter = &ServerRateLimiter{}
	} else {
		rateLimiter = &ClientRateLimiter{}
	}
	return rateLimiter
}

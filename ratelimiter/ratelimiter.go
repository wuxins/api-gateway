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

func GetRateLimiter() RateLimiter {
	return &ServerRateLimiter{}
}

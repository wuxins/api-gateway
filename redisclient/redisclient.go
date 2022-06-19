package redisclient

import (
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/config"
	"github.com/zeromicro/go-zero/core/stores/redis"
	"time"
)

var client *redis.Redis
var alive = true

func Init(redisConf config.Redis) *redis.Redis {

	mode := redisConf.Mode
	addresses := redisConf.Address
	pwd := redisConf.Password
	detectAliveInterval := redisConf.DetectAliveInterval

	client = redis.New(addresses, func(r *redis.Redis) {
		r.Addr = addresses
		r.Type = mode
		r.Pass = pwd
	})

	// redis heartbeat
	go func() {
		ticker := time.NewTicker(time.Duration(detectAliveInterval) * time.Millisecond)
		for range ticker.C {
			if !client.Ping() {
				alive = false
				log4go.Debug("Redis heartbeat fail")
			} else {

				alive = true
				log4go.Debug("Redis heartbeat ok")
			}
		}
	}()

	return client
}

func GetInstance() *redis.Redis {
	return client
}

func Alive() bool {
	return alive
}

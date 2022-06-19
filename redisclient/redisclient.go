package redisclient

import (
	"context"
	"github.com/gitstliu/log4go"
	"github.com/go-redis/redis/v8"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/monitor"
	"strings"
	"time"
)

var BackgroundCtx = context.Background()
var client redis.UniversalClient
var alive = true

func Init(redisConf config.Redis) redis.UniversalClient {

	client = redis.NewUniversalClient(&redis.UniversalOptions{
		Addrs:        strings.Split(redisConf.Addresses, common.DelimiterComma),
		Password:     redisConf.Password,
		DB:           redisConf.DB,
		PoolSize:     redisConf.PoolSize,
		DialTimeout:  time.Duration(redisConf.DialTimeout) * time.Millisecond,
		ReadTimeout:  time.Duration(redisConf.ReadTimeout) * time.Millisecond,
		WriteTimeout: time.Duration(redisConf.WriteTimeout) * time.Millisecond,
		IdleTimeout:  time.Duration(redisConf.IdleTimeout) * time.Millisecond,
		MinIdleConns: redisConf.MinIdleConns,
		MaxRetries:   redisConf.MaxRetries,
	})

	go func() {
		ticker := time.NewTicker(time.Duration(redisConf.DetectAliveInterval) * time.Millisecond)
		defer ticker.Stop()
		for range ticker.C {
			_, err := client.Ping(BackgroundCtx).Result()
			if err != nil {
				alive = false
				monitor.Report(monitor.Event{
					Metric:     monitor.MetricApi,
					MetricType: monitor.MetricApiRedisBreakdown,
					Time:       time.Now().Format(common.DateFormatMs),
					Content:    err.Error(),
				})
			} else {
				alive = true
				log4go.Debug("Redis heartbeat ok")
			}
		}
	}()

	return client
}

func GetInstance() redis.UniversalClient {
	return client
}

func Alive() bool {
	return alive
}

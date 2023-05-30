package idgenerator

import (
	"github.com/bwmarrin/snowflake"
	"github.com/go-redis/redis/v8"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/log"
	"github.com/wuxins/api-gateway/redisclient"
	"time"
)

var node *snowflake.Node

func InitSnowflakeNode(redisClient redis.UniversalClient) {
	snowflake.Epoch = time.Now().UnixNano() / 1000000
	incr, err := redisClient.Incr(redisclient.BackgroundCtx, common.SnowflakeNodeKey).Result()
	if err != nil {
		log.Fatal("InitSnowflakeNode error", err)
	}
	log.Pair("InitSnowflakeNode id", incr).Info()
	node, _ = snowflake.NewNode(incr)
}

func GenSnowflakeId() snowflake.ID {
	return node.Generate()
}

func GenSnowflakeIdAsString() string {
	return node.Generate().String()
}

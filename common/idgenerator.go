package common

import (
	"github.com/bwmarrin/snowflake"
	"github.com/gitstliu/log4go"
	"github.com/zeromicro/go-zero/core/stores/redis"
	"time"
)

var node *snowflake.Node

func InitSnowflakeNode(redis *redis.Redis) {
	snowflake.Epoch = time.Now().UnixNano() / 1000000
	incr, err := redis.Incr(SNOWFLAKE_NODE_KEY)
	if err != nil {
		log4go.Error("InitSnowflakeNode error %v", err)
		panic(err)
	}
	log4go.Info("Initial snowflake node id :%v", incr)
	node, _ = snowflake.NewNode(incr)
}

func GenSnowflakeId() snowflake.ID {
	return node.Generate()
}

func GenSnowflakeIdAsString() string {
	return node.Generate().String()
}

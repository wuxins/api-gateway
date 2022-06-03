package main

import (
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dbclient"
	"github.com/wuxins/api-gateway/monitor"
	"github.com/wuxins/api-gateway/redisclient"
	"github.com/wuxins/api-gateway/server"
	"github.com/wuxins/api-gateway/task"
)

func main() {

	// log init
	log4go.LoadConfiguration(config.GetConfigure().Sysconf.LogConfigFile)
	defer log4go.Close()

	// monitor init
	monitorDog := monitor.Init(*config.GetConfigure().Monitor)
	defer monitorDog.Close()

	// db init
	dbclient.Init(*config.GetConfigure().DB)

	// redis init
	redisClient := redisclient.Init(*config.GetConfigure().Redis)

	// snowflake generator init
	common.InitSnowflakeNode(redisClient)

	// async db api info loader
	go task.StartFlushPathMap()

	// start proxy server
	server.Start()
}

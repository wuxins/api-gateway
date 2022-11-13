package main

import (
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dbclient"
	"github.com/wuxins/api-gateway/idgenerator"
	"github.com/wuxins/api-gateway/monitor"
	"github.com/wuxins/api-gateway/redisclient"
	"github.com/wuxins/api-gateway/server"
	"github.com/wuxins/api-gateway/task"
	_ "net/http/pprof"
	"os"
	"os/signal"
	"syscall"
)

func main() {

	// log init
	log4go.LoadConfiguration(config.GetConfigure().System.LogConfigFile)
	defer log4go.Close()

	// monitor init
	monitorDog := monitor.Init(*config.GetConfigure().Proxy.Monitor)
	defer monitorDog.Close()

	// db init
	dbclient.Init(*config.GetConfigure().DB)

	// redis init
	redisClient := redisclient.Init(*config.GetConfigure().Redis)

	// snowflake generator init
	idgenerator.InitSnowflakeNode(redisClient)

	// async db api info loader
	go task.StartFlushPathMap()

	// run server
	startServer()
}

func startServer() {

	// start proxy server
	proxyHttpServer := server.NewProxyHttpServer()
	go func() {
		proxyHttpServer.Start()
	}()

	/*httpsServ := server.NewHttpsServer()
	go func() {
		httpsServ.Start()
	}()*/

	httpServer := server.NewHttpServer()
	go func() {
		httpServer.Start()
	}()

	quit := make(chan os.Signal)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit

	proxyHttpServer.Stop()

	//httpsServ.Stop()
	httpServer.Stop()
}

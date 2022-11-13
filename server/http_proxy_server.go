package server

import (
	"context"
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/routing"
	"net/http"
	"strconv"
	"time"
)

var (
	httpProxyServerHandler *http.Server
	httpConf               *config.Http
)

type httpProxyServer struct {
}

func (s *httpProxyServer) Start() {
	httpConf = config.GetConfigure().Proxy.Http
	serverPort := httpConf.ServicePort
	if serverPort <= 0 {
		log4go.Error("Http proxy server start without port, exit !")
		return
	}
	httpProxyServerHandler = &http.Server{
		Addr:        ":" + strconv.Itoa(serverPort),
		Handler:     routing.NewRouterHandler(),
		ReadTimeout: time.Duration(httpConf.ServerReadTimeout) * time.Millisecond,
		IdleTimeout: time.Duration(httpConf.ServerKeepalive) * time.Millisecond,
	}
	log4go.Info("Http proxy server started at %v", serverPort)
	if err := httpProxyServerHandler.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log4go.Error("Http proxy server started error %v", err)
	}
}

func (s *httpProxyServer) Stop() {
	ctx, cancel := context.WithTimeout(context.Background(), time.Duration(httpConf.GracefulShutdownTimeout)*time.Millisecond)
	defer cancel()
	err := httpProxyServerHandler.Shutdown(ctx)
	if err != nil {
		log4go.Error("Http proxy server shutdown error %v", err)
	}
	log4go.Info("Http proxy server shutdown gracefully !")
}

package server

import (
	"context"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/log"
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
		log.Fatal("Http proxy server start without port, exit!")
	}
	httpProxyServerHandler = &http.Server{
		Addr:        ":" + strconv.Itoa(serverPort),
		Handler:     routing.NewRouterHandler(),
		ReadTimeout: time.Duration(httpConf.ServerReadTimeout) * time.Millisecond,
		IdleTimeout: time.Duration(httpConf.ServerKeepalive) * time.Millisecond,
	}
	log.Pair("port", serverPort).Info("Http proxy server started!")
	if err := httpProxyServerHandler.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log.Fatal("Http proxy server started error", err)
	}
}

func (s *httpProxyServer) Stop() {
	ctx, cancel := context.WithTimeout(context.Background(), time.Duration(httpConf.GracefulShutdownTimeout)*time.Millisecond)
	defer cancel()
	err := httpProxyServerHandler.Shutdown(ctx)
	if err != nil {
		log.Error("Http proxy server shutdown error", err)
	}
	log.Info("Http proxy server shutdown gracefully!")
}

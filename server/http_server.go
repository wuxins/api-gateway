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
	httpServerHandler *http.Server
	httpConf          *config.Http
)

type httpServer struct {
}

func (s *httpServer) Start() {
	httpConf = config.GetConfigure().Http
	serverPort := httpConf.ServicePort
	if serverPort <= 0 {
		log4go.Error("Server start without port, exit !")
		return
	}
	httpServerHandler = &http.Server{
		Addr:        ":" + strconv.Itoa(serverPort),
		Handler:     routing.NewRouterHandler(),
		ReadTimeout: time.Duration(httpConf.ServerReadTimeout) * time.Millisecond,
		IdleTimeout: time.Duration(httpConf.ServerKeepalive) * time.Millisecond,
	}
	log4go.Info("Server started at %v", serverPort)
	if err := httpServerHandler.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log4go.Error("Server started error %v", err)
	}
}

func (s *httpServer) Stop() {
	ctx, cancel := context.WithTimeout(context.Background(), time.Duration(httpConf.GracefulShutdownTimeout)*time.Millisecond)
	defer cancel()
	err := httpServerHandler.Shutdown(ctx)
	if err != nil {
		log4go.Error("Server shutdown error %v", err)
	}
	log4go.Info("Http server shutdown gracefully !")
}

package server

import (
	"context"
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/facade/handler"
	"net/http"
	"strconv"
	"time"
)

var (
	httpsServerHandler *http.Server
)

type httpsServer struct {
}

func (s *httpsServer) Start() {
	serverPort := config.GetConfigure().Sysconf.ServicePort
	if serverPort <= 0 {
		log4go.Error("Server start without port, exit !")
		return
	}
	httpServerHandler = &http.Server{
		Addr:        ":" + strconv.Itoa(serverPort),
		Handler:     nil,
		ReadTimeout: time.Duration(config.GetConfigure().Sysconf.ServerReadTimeout) * time.Millisecond,
		IdleTimeout: time.Duration(config.GetConfigure().Sysconf.ServerKeepalive) * time.Millisecond,
	}
	http.HandleFunc("/", handler.CommonHandler)
	log4go.Info("Server started at %v", serverPort)
	if err := httpServerHandler.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log4go.Error("Server started error %v", err)
	}
}

func (s *httpsServer) Stop() {
	shutdownTimeout := config.GetConfigure().Sysconf.GracefulShutdownTimeout
	ctx, cancel := context.WithTimeout(context.Background(), time.Duration(shutdownTimeout)*time.Millisecond)
	defer cancel()
	err := httpServerHandler.Shutdown(ctx)
	if err != nil {
		log4go.Error("Server shutdown error %v", err)
	}
	log4go.Info("Http server shutdown gracefully !")
}

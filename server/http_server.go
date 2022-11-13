package server

import (
	"context"
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/config"
	"net/http"
	"strconv"
	"time"
)

var (
	httpServerHandler *http.Server
)

type httpServer struct {
}

func (s *httpServer) Start() {

	port := config.GetConfigure().Http.ServicePort

	httpServerHandler = &http.Server{
		Addr: ":" + strconv.Itoa(port),
	}
	log4go.Info("Http server started at %v", port)
	if err := httpServerHandler.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log4go.Error("Http server started error %v", err)
	}

}

func (s *httpServer) Stop() {
	ctx, cancel := context.WithTimeout(context.Background(), time.Duration(httpConf.GracefulShutdownTimeout)*time.Millisecond)
	defer cancel()
	err := httpServerHandler.Shutdown(ctx)
	if err != nil {
		log4go.Error("Http server shutdown error %v", err)
	}
	log4go.Info("Http server shutdown gracefully !")
}

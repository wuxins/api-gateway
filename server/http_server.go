package server

import (
	"context"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/log"
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
	log.Pair("port", port).Info("Http server started!")
	if err := httpServerHandler.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log.Fatal("Http server started error", err)
	}

}

func (s *httpServer) Stop() {
	ctx, cancel := context.WithTimeout(context.Background(), time.Duration(httpConf.GracefulShutdownTimeout)*time.Millisecond)
	defer cancel()
	err := httpServerHandler.Shutdown(ctx)
	if err != nil {
		log.Error("Http server shutdown error", err)
	}
	log.Info("Http server shutdown gracefully!")
}

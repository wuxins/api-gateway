package server

import (
	"context"
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/facade/handler"
	"net/http"
	"os"
	"os/signal"
	"strconv"
	"sync"
	"syscall"
	"time"
)

func Start() {

	serverPort := config.GetConfigure().Sysconf.ServicePort
	if serverPort <= 0 {
		log4go.Error("Server start without port, exit !")
		return
	}
	server := &http.Server{
		Addr:        ":" + strconv.Itoa(serverPort),
		Handler:     nil,
		ReadTimeout: time.Duration(config.GetConfigure().Sysconf.ServerReadTimeout) * time.Millisecond,
		IdleTimeout: time.Duration(config.GetConfigure().Sysconf.ServerKeepalive) * time.Millisecond,
	}
	http.HandleFunc("/", handler.CommonHandler)

	shutdownTimeout := config.GetConfigure().Sysconf.GracefulShutdownTimeout
	var wg sync.WaitGroup
	exit := make(chan os.Signal)
	signal.Notify(exit, syscall.SIGINT, syscall.SIGTERM)
	go func() {
		<-exit
		wg.Add(1)
		ctx, cancel := context.WithTimeout(context.Background(), time.Duration(shutdownTimeout)*time.Millisecond)
		defer cancel()
		err := server.Shutdown(ctx)
		if err != nil {
			log4go.Error("Server shutdown error %v", err)
		}
		wg.Done()
	}()
	log4go.Info("Server started at %v", serverPort)
	err := server.ListenAndServe()
	log4go.Info("Server commencing shutdown , waiting for active requests to complete with timeout %v", shutdownTimeout)
	wg.Wait()
	if err != nil && err != http.ErrServerClosed {
		panic(err)
	}
	log4go.Info("Server shutdown gracefully !")
}

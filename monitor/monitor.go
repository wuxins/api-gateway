package monitor

import (
	"github.com/sirupsen/logrus"
	"github.com/wuxins/api-gateway/config"
	"gopkg.in/natefinch/lumberjack.v2"
)

var log *logrus.Logger

func Init(monitor config.Monitor) {
	log = logrus.New()
	log.SetFormatter(&logrus.JSONFormatter{
		DisableTimestamp: true,
	})
	log.SetOutput(&lumberjack.Logger{
		Filename:   "monitor.log",
		MaxSize:    100,
		MaxBackups: 100,
		MaxAge:     3,
		Compress:   true,
	})
}

func Report(event Event) {
	log.Info(event)
}

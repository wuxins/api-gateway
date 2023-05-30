package log

import (
	"github.com/sirupsen/logrus"
	"gopkg.in/natefinch/lumberjack.v2"
	"path"
	"runtime"
	"strconv"
)

var log *logrus.Logger

func Init(logLevel string) {

	log = logrus.New()
	level := logrus.InfoLevel
	switch {
	case logLevel == "debug":
		level = logrus.DebugLevel
	case logLevel == "info":
		level = logrus.InfoLevel
	case logLevel == "error":
		level = logrus.ErrorLevel
	default:
		level = logrus.InfoLevel
	}
	log.SetLevel(level)
	log.SetReportCaller(true)
	log.SetFormatter(&logrus.TextFormatter{
		TimestampFormat: "2006-01-02 15:04:05",
		FullTimestamp:   true,
		CallerPrettyfier: func(frame *runtime.Frame) (function string, file string) {
			return frame.Function, path.Base(frame.File) + ":" + strconv.Itoa(frame.Line)
		},
	})
	log.SetOutput(&lumberjack.Logger{
		Filename:   "gateway.log",
		MaxSize:    100,
		MaxBackups: 100,
		MaxAge:     3,
		Compress:   true,
	})
}

func Println(v ...interface{}) {
	log.Info(v)
}

func Debug(v ...interface{}) {
	log.Debug(v)
}

func Info(v ...interface{}) {
	log.Info(v)
}

func Pair(key string, value interface{}) *logrus.Entry {
	return log.WithField(key, value)
}

func Pairs(fields map[string]interface{}) *logrus.Entry {
	return log.WithFields(fields)
}

func WithError(err error) *logrus.Entry {
	return log.WithError(err)
}

func Warn(v ...interface{}) {
	log.Warn(v)
}

func Error(v ...interface{}) {
	log.Error(v)
}

func Fatal(v ...interface{}) {
	log.Fatal(v)
}

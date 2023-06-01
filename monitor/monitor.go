package monitor

import (
	"bytes"
	"github.com/bytedance/sonic"
	"github.com/sirupsen/logrus"
	"github.com/wuxins/api-gateway/config"
	"gopkg.in/natefinch/lumberjack.v2"
)

var log *logrus.Logger

func Init(monitor config.Monitor) {

	filename := "monitor.log"
	maxSize := 50
	maxBackups := 100
	maxAge := 30
	if len(monitor.Filename) > 0 {
		filename = monitor.Filename
	}
	if monitor.RotateMaxSize > 0 {
		maxSize = monitor.RotateMaxSize
	}
	if monitor.RotateMaxBackups > 0 {
		maxBackups = monitor.RotateMaxBackups
	}
	if monitor.RotateMaxAge > 0 {
		maxAge = monitor.RotateMaxAge
	}

	log = logrus.New()
	log.SetFormatter(&Formatter{})
	log.SetOutput(&lumberjack.Logger{
		Filename:   filename,
		MaxSize:    maxSize,
		MaxBackups: maxBackups,
		MaxAge:     maxAge,
		Compress:   monitor.RotateCompress,
	})
}

func Report(event Event) {
	output, _ := sonic.MarshalString(&event)
	log.Info(output)
}

type Formatter struct{}

func (m *Formatter) Format(entry *logrus.Entry) ([]byte, error) {
	var b *bytes.Buffer
	if entry.Buffer != nil {
		b = entry.Buffer
	} else {
		b = &bytes.Buffer{}
	}
	b.WriteString(entry.Message + "\n")
	return b.Bytes(), nil
}

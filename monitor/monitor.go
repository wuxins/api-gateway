package monitor

import (
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/config"
)

var monitorLogger = log4go.Logger{}

const M = 1024 * 1024

func Init(monitor config.Monitor) log4go.Logger {

	fileDir := monitor.LogDir
	fileName := monitor.LogFileName
	rotateSize := monitor.LogRotateMaxsize
	rotateMaxLines := monitor.LogRotateMaxLines
	if len(fileDir) <= 0 {
		fileDir = ""
	}
	if len(fileName) <= 0 {
		fileDir = "monitor.log"
	}
	if rotateSize <= 0 {
		rotateSize = 100
	}
	if rotateMaxLines <= 0 {
		rotateMaxLines = 500000
	}

	writer := log4go.NewFileLogWriter(fileDir+fileName, true)
	writer.SetFormat("%M")
	writer.SetRotateDaily(false)
	writer.SetRotateSize(rotateSize * M)
	writer.SetRotateLines(rotateMaxLines)
	monitorLogger.AddFilter("file", log4go.INFO, writer)
	return monitorLogger
}

func Report(event Event) {
	monitorLogger.Info(event)
}

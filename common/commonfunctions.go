package common

import (
	"bytes"
	"compress/gzip"
	"time"

	"github.com/gitstliu/log4go"
)

type TimeSpan struct {
	startNS int64
	endNS   int64
}

type NodeToRecord interface {
	ToRecord() string
}

func PanicHandler() {
	if r := recover(); r != nil {
		log4go.Error("Run time Error %v", r)
		panic(r)
	}
}

func (this *TimeSpan) Start() {
	this.startNS = time.Now().UnixNano()
}

func (this *TimeSpan) End() {
	this.endNS = time.Now().UnixNano()
}

func (this *TimeSpan) GetTimeSpanMS() float64 {

	return float64(this.endNS-this.startNS) / 1000000
}

func InterfacesToStrings(src []interface{}) []string {
	result := []string{}
	for _, value := range src {
		result = append(result, value.(string))
	}
	return result
}

func EncodeGzipBytes(meta []byte) []byte {
	b := bytes.Buffer{}
	w := gzip.NewWriter(&b)
	defer w.Close()

	w.Write(meta)
	w.Flush()

	return b.Bytes()
}

func StringToBytes(value string) []byte {
	return []byte(value)
}

func ContainsStr(items []string, item string) bool {
	for _, eachItem := range items {
		if eachItem == item {
			return true
		}
	}
	return false
}

// UnixMilliseconds go support millisecond function until go 1.17+
//
//	func (t Time) UnixMilli() int64 {
//		return t.unixSec()*1e3 + int64(t.nsec())/1e6
//	}
//	func (t Time) UnixNano() int64 {
//		return (t.unixSec())*1e9 + int64(t.nsec())
//	}
//
// (t.unixSec())*1e9 + int64(t.nsec()) / 1e6 = t.unixSec()*1e3 + int64(t.nsec())/1e6
func UnixMilliseconds(t time.Time) int64 {
	return time.Now().UnixNano() / 1e6
}

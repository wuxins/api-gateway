package utils

import (
	"bytes"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/monitor"
	"io/ioutil"
	"net/http"
	"strconv"
	"strings"
	"time"
)

func WriteHttpResponse(w http.ResponseWriter, status int, body string, r *http.Request, enableMonitor bool) {

	value := r.Header[common.HeaderContentEncoding]
	IsGzipEncode := value != nil && strings.EqualFold(value[0], "gzip")
	var bodyBytes []byte
	if IsGzipEncode {
		bodyBytes = common.EncodeGzipBytes(common.StringToBytes(body))
	} else {
		bodyBytes = common.StringToBytes(body)
	}
	w.WriteHeader(status)
	if enableMonitor {
		requestBody, _ := ioutil.ReadAll(r.Body)
		r.Body = ioutil.NopCloser(bytes.NewBuffer(requestBody))
		requestStartTime, _ := strconv.ParseInt(r.Header[common.HeaderRequestTime][0], 10, 64)
		now := time.Now()
		monitor.Report(monitor.Event{
			Metric:     monitor.MetricApi,
			MetricType: monitor.MetricApiAccLog,
			Time:       now.Format(common.DateFormatMs),
			Key:        r.Header[common.HeaderRequestId][0],
			Content: monitor.ApiTransportMetric{
				Url:        r.URL.Path,
				Method:     r.Method,
				ReqHeader:  r.Header,
				ReqBody:    string(requestBody),
				Status:     status,
				RespHeader: w.Header(),
				RespBody:   body,
				StartTime:  requestStartTime,
				EndTime:    common.UnixMilliseconds(now),
				Cost:       common.UnixMilliseconds(now) - requestStartTime,
			},
		})
	}
	_, err := w.Write(bodyBytes)
	if err != nil {
		return
	}
}

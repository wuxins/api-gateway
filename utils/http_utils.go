package utils

import (
	"bytes"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/monitor"
	"io/ioutil"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"time"
)

func WriteHttpResponse(w http.ResponseWriter, status int, body string, requestId string, requestTime string, r *http.Request, enableMonitor bool) {

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
		requestStartTime, _ := strconv.ParseInt(requestTime, 10, 64)
		now := time.Now()
		bodyMaxSize := config.GetConfigure().Proxy.Monitor.BodyMaxSize
		reqBody := string(requestBody)
		if len(reqBody) > bodyMaxSize {
			reqBody = reqBody[0:bodyMaxSize]
		}
		respBody := body
		if len(respBody) > bodyMaxSize {
			respBody = respBody[0:bodyMaxSize]
		}
		queryParams, _ := url.Parse(r.RequestURI)
		monitor.Report(monitor.Event{
			Metric:     monitor.MetricApi,
			MetricType: monitor.MetricApiAccLog,
			Time:       now.Format(common.DateFormatMs),
			Key:        requestId,
			Content: monitor.ApiTransportMetric{
				Url:        r.URL.Path,
				Method:     r.Method,
				ReqHeader:  r.Header,
				ReqQuery:   queryParams.RawQuery,
				ReqBody:    reqBody,
				Status:     status,
				RespHeader: w.Header(),
				RespBody:   respBody,
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

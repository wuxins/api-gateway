package routing

import (
	"bytes"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/monitor"
	"github.com/wuxins/api-gateway/regularpath"
	"github.com/wuxins/api-gateway/utils"
	"io/ioutil"
	"net/http"
	"net/http/httputil"
	"net/url"
	"strconv"
	"time"
)

func Routing(w http.ResponseWriter, r *http.Request, regularPath *regularpath.RegularPath) error {

	tranPath, tranErr := regularpath.GetTranURL(r.URL.Path, regularPath)
	if tranErr != nil {
		return tranErr
	}
	remoteUrlMeta, urlParseMetaErr := url.Parse(tranPath)
	if urlParseMetaErr != nil {
		return urlParseMetaErr
	}
	remote, err := url.Parse(regularPath.UpstreamHost)
	if err != nil {
		return err
	}
	proxy := httputil.NewSingleHostReverseProxy(remote)
	proxy.Transport = regularPath.Transport

	if regularPath.NeedMonitor {
		bodyBytes, _ := ioutil.ReadAll(r.Body)
		r.Body = ioutil.NopCloser(bytes.NewBuffer(bodyBytes))
		proxy.ModifyResponse = func(res *http.Response) error {
			respBody, respErr := ioutil.ReadAll(res.Body)
			if respErr != nil {
				return respErr
			}
			requestStartTime, _ := strconv.ParseInt(r.Header[common.HeaderRequestTime][0], 10, 64)
			now := time.Now()
			monitor.Report(monitor.Event{
				Metric:     monitor.MetricApi,
				MetricType: monitor.MetricApiAccLog,
				Time:       now.Format(common.DateFormatMs),
				Key:        r.Header[common.HeaderRequestId][0],
				Content: monitor.ApiTransportMetric{
					Url:        regularPath.SrcURL,
					Method:     r.Method,
					ReqHeader:  r.Header,
					ReqBody:    string(bodyBytes),
					Status:     res.StatusCode,
					RespHeader: w.Header(),
					RespBody:   string(respBody),
					StartTime:  requestStartTime,
					EndTime:    common.UnixMilliseconds(now),
					Cost:       common.UnixMilliseconds(now) - requestStartTime,
				},
			})
			respErr = res.Body.Close()
			if respErr != nil {
				return respErr
			}
			res.Body = ioutil.NopCloser(bytes.NewBuffer(respBody))
			return respErr
		}
	}

	proxy.ErrorHandler = func(writer http.ResponseWriter, request *http.Request, routeErr error) {
		if routeErr != nil {
			utils.WriteHttpResponse(writer, http.StatusBadGateway, routeErr.Error(), r, regularPath)
		}
	}

	r.URL.Path = remoteUrlMeta.Path
	r.Host = remote.Host
	proxy.ServeHTTP(w, r)

	return nil
}

package routing

import (
	"bytes"
	"io/ioutil"
	"net/http"
	"net/http/httputil"
	"net/url"
	"strconv"
	"time"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/monitor"
	"github.com/wuxins/api-gateway/regularpath"
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
	proxy.Transport = config.GetConfigure().Routing.Transport

	proxy.ModifyResponse = func(res *http.Response) error {
		if regularPath.NeedMonitor {
			respBody, respErr := ioutil.ReadAll(res.Body)
			if respErr != nil {
				return respErr
			}
			requestStartTime, _ := strconv.ParseInt(r.Header[common.HEADER_REQUEST_TIME][0], 10, 64)
			now := time.Now()
			monitor.Report(monitor.Event{
				Metric:     "API",
				MetricType: "ACCESS_LOG",
				Time:       common.UnixMilliseconds(now),
				Key:        r.Header[common.HEADER_REQUEST_ID][0],
				Content: monitor.ApiTransportMetric{
					Url:       regularPath.SrcURL,
					Method:    r.Method,
					ReqHeader: r.Header,
					//ReqBody:    string(reqBody),
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
		return nil
	}

	r.URL.Path = remoteUrlMeta.Path
	r.Host = remote.Host
	proxy.ServeHTTP(w, r)

	return nil
}

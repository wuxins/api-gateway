package routing

import (
	"bytes"
	"errors"
	"github.com/afex/hystrix-go/hystrix"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/monitor"
	"github.com/wuxins/api-gateway/regularpath"
	"io/ioutil"
	"net/http"
	"net/http/httputil"
	"net/url"
	"strconv"
	"time"
)

func BreakerProxyPlugin() func(c *RouterContext) {

	return func(c *RouterContext) {

		if c.RegularPath.NeedBreaker {
			_ = hystrix.Do(c.RegularPath.ApiCode, func() error {
				err := BizRouting(c)
				if err != nil {
					return errors.New(err.Error())
				}
				return nil
			}, func(err error) error {
				fail(c, http.StatusServiceUnavailable, err.Error())
				return nil
			})
		} else {
			err := BizRouting(c)
			if err != nil {
				fail(c, http.StatusServiceUnavailable, err.Error())
			}
		}

		c.Abort()
	}
}

func BizRouting(c *RouterContext) error {

	w := c.Rw
	r := c.Req
	regularPath := c.RegularPath

	tranPath, tranErr := regularpath.GetTranURL(r.URL.Path, regularPath)
	if tranErr != nil {
		return tranErr
	}

	remoteUrlMeta, urlParseMetaErr := url.Parse(tranPath)
	if urlParseMetaErr != nil {
		return urlParseMetaErr
	}

	remote, err := url.Parse(c.RequestUpstreamAddress)
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
			requestStartTime, _ := strconv.ParseInt(c.RequestTime, 10, 64)
			now := time.Now()
			bodyMaxSize := config.GetConfigure().Proxy.Monitor.BodyMaxSize
			reqBody := string(bodyBytes)
			if len(reqBody) > bodyMaxSize {
				reqBody = reqBody[0:bodyMaxSize]
			}
			respBodyStr := string(respBody)
			if len(respBodyStr) > bodyMaxSize {
				respBodyStr = respBodyStr[0:bodyMaxSize]
			}
			queryParams, _ := url.Parse(r.RequestURI)
			monitor.Report(monitor.Event{
				Metric:     monitor.MetricApi,
				MetricType: monitor.MetricApiAccLog,
				Time:       now.Format(common.DateFormatMs),
				Key:        c.RequestId,
				Content: monitor.ApiTransportMetric{
					Url:        r.URL.Path,
					Method:     r.Method,
					ReqHeader:  r.Header,
					ReqQuery:   queryParams.RawQuery,
					ReqBody:    reqBody,
					Status:     res.StatusCode,
					RespHeader: w.Header(),
					RespBody:   respBodyStr,
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
	var res error

	proxy.ErrorHandler = func(writer http.ResponseWriter, request *http.Request, routeErr error) {
		res = routeErr
	}

	r.URL.Path = remoteUrlMeta.Path
	r.Host = remote.Host

	proxy.ServeHTTP(w, r)

	return res
}

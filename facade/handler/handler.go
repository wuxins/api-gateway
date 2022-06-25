package handler

import (
	"bytes"
	"github.com/bwmarrin/snowflake"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/idgenerator"
	"github.com/wuxins/api-gateway/monitor"
	"github.com/wuxins/api-gateway/ratelimiter"
	"github.com/wuxins/api-gateway/redisclient"
	"github.com/wuxins/api-gateway/regularpath"
	"github.com/wuxins/api-gateway/routing"
	"io/ioutil"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"time"
)

func CommonHandler(w http.ResponseWriter, r *http.Request) {

	w.Header().Set(common.AccessControlAllowOrigin, "*")
	w.Header().Set(common.AccessControlAllowMethods, config.GetConfigure().Sysconf.AccessControlAllowMethods)
	w.Header().Set(common.AccessControlAllowHeaders, config.GetConfigure().Sysconf.AccessControlAllowHeaders)

	if strings.EqualFold("OPTIONS", strings.ToUpper(r.Method)) {
		w.WriteHeader(200)
		return
	}

	requestId := idgenerator.GenSnowflakeId()
	r.Header.Set(common.HeaderRequestId, requestId.String())
	r.Header.Set(common.HeaderRequestTime, strconv.FormatInt(common.UnixMilliseconds(time.Now()), 10))

	initRegularPath := &regularpath.RegularPath{
		SrcURL:      r.URL.Path,
		NeedMonitor: true,
	}
	currUrl, decodeErr := url.PathUnescape(r.URL.Path)
	if currUrl == "/" {
		writeResponse(w, 200, common.WelcomeMsg, r, initRegularPath)
		return
	}
	if decodeErr != nil {
		writeResponse(w, 200, common.PathErrorMsg, r, initRegularPath)
		return
	}

	regularPath := regularpath.CheckURLMatch(currUrl, r.Method)
	if regularPath == nil {
		writeResponse(w, 200, common.UnauthorizedMsg, r, initRegularPath)
		return
	}

	tenant := r.Header[common.HeaderTenant]
	supportedTenants := regularPath.Tenants
	isTenantSupport := false
	if tenant != nil && len(supportedTenants) > 0 {
		for _, item := range supportedTenants {
			if tenant[0] == item.TenantCode {
				isTenantSupport = true
			}
		}
	}

	if !isTenantSupport {
		writeResponse(w, 200, common.ChannelUnsupportedMsg, r, regularPath)
		return
	}

	if regularPath.NeedFallback {
		writeResponse(w, 200, regularPath.Fallback, r, regularPath)
		return
	}

	routeWithRateLimit(w, r, regularPath, requestId)
}

func routeWithRateLimit(w http.ResponseWriter, r *http.Request, regularPath *regularpath.RegularPath, requestId snowflake.ID) {

	// rate limit
	if config.GetConfigure().Rate.Enable && regularPath.NeedRateLimit && regularPath.RateLimit > 0 {
		reteCtx := ratelimiter.RateLimiterCtx{
			Key:        regularPath.ApiCode,
			Rate:       regularPath.RateLimit,
			RedisAlive: redisclient.Alive(),
			RequestId:  requestId,
		}
		acquireOk, err := ratelimiter.GetRateLimiter().TryAcquire(reteCtx)
		defer ratelimiter.GetRateLimiter().Release(reteCtx)
		if err != nil {
			writeResponse(w, 200, common.SysErrorMsg, r, regularPath)
			return
		}
		if !acquireOk {
			writeResponse(w, 200, common.RateLimitMsg, r, regularPath)
			return
		}
	}
	// route
	routingErr := routing.Routing(w, r, regularPath)
	if routingErr != nil {
		monitor.Report(monitor.Event{
			Metric:     monitor.MetricApi,
			MetricType: monitor.MetricApiRouteErr,
			Time:       time.Now().Format(common.DateFormatMs),
			Key:        strconv.FormatInt(int64(requestId), 10),
			Content:    routingErr.Error(),
		})
		writeResponse(w, 200, common.SysErrorMsg, r, regularPath)
		return
	}
}

func writeResponse(w http.ResponseWriter, status int, body string, r *http.Request, regularPath *regularpath.RegularPath) {

	value := r.Header[common.HeaderContentEncoding]
	IsGzipEncode := value != nil && strings.EqualFold(value[0], "gzip")
	var bodyBytes []byte
	if IsGzipEncode {
		bodyBytes = common.EncodeGzipBytes(common.StringToBytes(body))
	} else {
		bodyBytes = common.StringToBytes(body)
	}
	w.WriteHeader(status)
	if regularPath.NeedMonitor {
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

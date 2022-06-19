package handler

import (
	"github.com/bwmarrin/snowflake"
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/idgenerator"
	"github.com/wuxins/api-gateway/monitor"
	"github.com/wuxins/api-gateway/ratelimiter"
	"github.com/wuxins/api-gateway/redisclient"
	"github.com/wuxins/api-gateway/regularpath"
	"github.com/wuxins/api-gateway/routing"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"time"
)

func CommonHandler(w http.ResponseWriter, r *http.Request) {

	requestId := idgenerator.GenSnowflakeId()
	r.Header.Set(common.HEADER_REQUEST_ID, requestId.String())
	r.Header.Set(common.HEADER_REQUEST_TIME, strconv.FormatInt(common.UnixMilliseconds(time.Now()), 10))

	initRegularPath := &regularpath.RegularPath{
		SrcURL:      r.URL.Path,
		NeedMonitor: true,
	}
	currUrl, decodeErr := url.PathUnescape(r.URL.Path)
	if currUrl == "/" {
		writeResponse(w, 200, common.WELCOME_MSG, r, initRegularPath)
		return
	}
	if decodeErr != nil {
		writeResponse(w, 200, common.PATH_ERROR_MSG, r, initRegularPath)
		return
	}

	regularPath := regularpath.CheckURLMatch(currUrl)
	if regularPath == nil {
		writeResponse(w, 200, common.UNAUTHIRIZED_MSG, r, initRegularPath)
		return
	}

	if regularPath.Method != r.Method {
		writeResponse(w, 200, common.REQ_METHOD_UNSUPPORTED_MSG, r, regularPath)
		return
	}

	tenant := r.Header[common.HEADER_TENANT]
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
		log4go.Info("Routing tenant:%v,but supported tenants:%v", tenant, supportedTenants)
		writeResponse(w, 200, common.CHANNEL_UNSUPPORTED_MSG, r, regularPath)
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
			writeResponse(w, 200, common.SYS_ERROR_MSG, r, regularPath)
		}
		if !acquireOk {
			writeResponse(w, 200, common.RATE_LIMiT_MSG, r, regularPath)
			return
		}
	}
	// route
	routingErr := routing.Routing(w, r, regularPath)
	if routingErr != nil {
		log4go.Error("Routing error : %v", routingErr)
		writeResponse(w, 200, common.SYS_ERROR_MSG, r, regularPath)
		return
	}
}

func writeResponse(w http.ResponseWriter, status int, body string, r *http.Request, regularPath *regularpath.RegularPath) {

	value := r.Header[common.HEADER_CONTENT_ENCODING]
	IsGzipEncode := value != nil && strings.EqualFold(value[0], "gzip")
	var bodyBytes []byte
	if IsGzipEncode {
		bodyBytes = common.EncodeGzipBytes(common.StringToBytes(body))
	} else {
		bodyBytes = common.StringToBytes(body)
	}
	w.WriteHeader(status)
	if regularPath.NeedMonitor {
		requestStartTime, _ := strconv.ParseInt(r.Header[common.HEADER_REQUEST_TIME][0], 10, 64)
		now := time.Now()
		monitor.Report(monitor.Event{
			Metric:     "API",
			MetricType: "ACCESS_LOG",
			Time:       common.UnixMilliseconds(now),
			Key:        r.Header[common.HEADER_REQUEST_ID][0],
			Content: monitor.ApiTransportMetric{
				Url:       r.URL.Path,
				Method:    r.Method,
				ReqHeader: r.Header,
				//ReqBody: strings(r.Body),
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

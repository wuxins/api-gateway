package handler

import (
	"github.com/bwmarrin/snowflake"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/idgenerator"
	"github.com/wuxins/api-gateway/monitor"
	"github.com/wuxins/api-gateway/ratelimiter"
	"github.com/wuxins/api-gateway/redisclient"
	"github.com/wuxins/api-gateway/regularpath"
	"github.com/wuxins/api-gateway/routing"
	"github.com/wuxins/api-gateway/utils"
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
		w.WriteHeader(http.StatusOK)
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
		utils.WriteHttpResponse(w, http.StatusOK, common.WelcomeMsg, r, initRegularPath)
		return
	}
	if decodeErr != nil {
		utils.WriteHttpResponse(w, http.StatusInternalServerError, common.PathErrorMsg, r, initRegularPath)
		return
	}

	regularPath := regularpath.CheckURLMatch(currUrl, r.Method)
	if regularPath == nil {
		utils.WriteHttpResponse(w, http.StatusUnauthorized, common.UnauthorizedMsg, r, initRegularPath)
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
		utils.WriteHttpResponse(w, http.StatusForbidden, common.ChannelUnsupportedMsg, r, regularPath)
		return
	}

	if regularPath.NeedFallback {
		utils.WriteHttpResponse(w, http.StatusOK, regularPath.Fallback, r, regularPath)
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
			utils.WriteHttpResponse(w, http.StatusInternalServerError, common.SysErrorMsg, r, regularPath)
			return
		}
		if !acquireOk {
			utils.WriteHttpResponse(w, http.StatusInternalServerError, common.RateLimitMsg, r, regularPath)
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
		utils.WriteHttpResponse(w, 200, common.SysErrorMsg, r, regularPath)
		return
	}
}

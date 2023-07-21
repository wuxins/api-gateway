package monitor

import "net/http"

var MetricApi = "API"
var MetricApiAccLog = "ACC_LOG"
var MetricApiRouteErr = "ROUTE_ERR"
var MetricApiRateLimited = "RATE_LIMITED"
var MetricApiRateRelease = "RATE_RElEASE"
var MetricApiRedisBreakdown = "REDIS_BREAKDOWN"

// Event monitor information
type Event struct {
	// what business, mandatory
	Metric string
	// what scenario, secondary category under Metric, allow null
	MetricType string
	// what time, mandatory
	Time string
	// happening key info
	Key string
	// happening detail info
	Content interface{}
}

// ApiTransportMetric records the api http request&response
type ApiTransportMetric struct {
	Url        string
	Method     string
	ReqHeader  http.Header
	ReqQuery   string
	ReqBody    string
	Status     int
	RespHeader http.Header
	RespBody   string
	StartTime  int64
	EndTime    int64
	Cost       int64
}

// ApiRateLimitedInfo records the api rate info while rate limited
type ApiRateLimitedInfo struct {
	RateMode  string
	ApiCode   string
	CurRate   int
	LimitRate int
}

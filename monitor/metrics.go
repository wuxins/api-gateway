package monitor

import "net/http"

// Event monitor information
type Event struct {
	// what business, mandatory
	Metric string
	// what scenario, secondary category under Metric, allow null
	MetricType string
	// what time, mandatory
	Time int64
	// what's happening
	Content interface{}
	// happening key info
	Key string
}

// ApiTransportMetric records the api http request&response
type ApiTransportMetric struct {
	Url        string
	Method     string
	ReqHeader  http.Header
	ReqBody    string
	Status     int
	RespHeader http.Header
	RespBody   string
	StartTime  int64
	EndTime    int64
	Cost       int64
}

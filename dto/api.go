package dto

type Api struct {
	ApiCode                string `gorm:"api_code"`
	Method                 string `gorm:"method"`
	Address                string `gorm:"address"`
	GrayContent            string `gorm:"gray_content"`
	SrcUrl                 string `gorm:"src_url"`
	DesUrl                 string `gorm:"des_url"`
	NeedRateLimit          string `gorm:"need_rate_limit"`
	RateLimit              int    `gorm:"rate_limit"`
	NeedBreaker            string `gorm:"need_breaker"`
	BreakerErrPerThreshold int    `gorm:"breaker_err_per_threshold"`
	NeedFallback           string `gorm:"need_fallback"`
	Fallback               string `gorm:"fallback"`
	NeedMonitor            string `gorm:"need_monitor"`
	NeedApiAuth            string `gorm:"need_api_auth"`
	ReadTimeout            int64  `gorm:"read_timeout"`
	IgnoreHeaderParams     string `gorm:"ignore_header_params"`
	IgnoreQueryParams      string `gorm:"ignore_query_params"`
	TenantCodes            string `gorm:"tenant_codes"`
	NeedGray               string `gorm:"need_gray"`
	GrayStrategy           GrayStrategy
}

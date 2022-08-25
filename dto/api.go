package dto

type Api struct {
	Id                 int64  `gorm:"id"`
	Name               string `gorm:"name"`
	ApiCode            string `gorm:"api_code"`
	Method             string `gorm:"method"`
	Address            string `gorm:"address"`
	GrayContent        string `gorm:"gray_content"`
	SrcUrl             string `gorm:"src_url"`
	DesUrl             string `gorm:"des_url"`
	NeedRateLimit      string `gorm:"need_rate_limit"`
	RateLimit          int    `gorm:"rate_limit"`
	NeedFallback       string `gorm:"need_fallback"`
	Fallback           string `gorm:"fallback"`
	NeedMonitor        string `gorm:"need_monitor"`
	ReadTimeout        int64  `gorm:"read_timeout"`
	IgnoreHeaderParams string `gorm:"ignore_header_params"`
	IgnoreQueryParams  string `gorm:"ignore_query_params"`
	Tenants            []ApiTenant
	NeedGray           string `gorm:"need_gray"`
	GrayStrategy       GrayStrategy
}

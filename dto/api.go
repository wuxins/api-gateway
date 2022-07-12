package dto

type Api struct {
	Id            int64  `gorm:"id"`
	Name          string `gorm:"name"`
	ApiCode       string `gorm:"api_code"`
	Method        string `gorm:"method"`
	Addresses     string `gorm:"addresses"`
	SrcUrl        string `gorm:"src_url"`
	DesUrl        string `gorm:"des_url"`
	NeedRateLimit string `gorm:"need_rate_limit"`
	RateLimit     int    `gorm:"rate_limit"`
	NeedFallback  string `gorm:"need_fallback"`
	Fallback      string `gorm:"fallback"`
	NeedMonitor   string `gorm:"need_monitor"`
	ReadTimeout   int64  `gorm:"read_timeout"`
	Tenants       []Tenant
}

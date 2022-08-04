package dto

type Tenant struct {
	Name          string `gorm:"name"`
	TenantCode    string `gorm:"tenant_code"`
	NeedApiAuth   string `gorm:"need_api_auth"`
	ApiAuthType   string `gorm:"api_auth_type"`
	Secret        string `gorm:"secret"`
	TokenExpireIn int    `gorm:"token_expire_in"`
}

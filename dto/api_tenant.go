package dto

type ApiTenant struct {
	ApiCode         string `gorm:"api_code"`
	Name            string `gorm:"name"`
	TenantCode      string `gorm:"tenant_code"`
	NeedApiAuth     string `gorm:"need_api_auth"`
	ApiAuthType     string `gorm:"api_auth_type"`
	Secret          string `gorm:"secret"`
	TokenSignKey    string `gorm:"token_sign_key"`
	TokenSignMethod string `gorm:"token_sign_method"`
	TokenExpireIn   int    `gorm:"token_expire_in"`
	TokenExpireCode string `gorm:"token_expire_code"`
}

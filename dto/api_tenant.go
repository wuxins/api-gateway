package dto

type ApiTenant struct {
	ApiCode        string `gorm:"api_code"`
	Name           string `gorm:"name"`
	TenantCode     string `gorm:"tenant_code"`
	NeedApiAuth    string `gorm:"need_api_auth"`
	ApiAuthContent string `gorm:"api_auth_content"`
	ApiAuth        ApiAuth
}

package dto

type ApiTenant struct {
	Name       string `gorm:"name"`
	TenantCode string `gorm:"tenant_code"`
	ApiCode    string `gorm:"api_code"`
}

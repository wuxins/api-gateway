package dto

type Tenant struct {
	TenantCode            string `gorm:"tenant_code"`
	Secret                string `gorm:"secret"`
	TokenSignKey          string `gorm:"token_sign_key"`
	TokenSignMethod       string `gorm:"token_sign_method"`
	TokenExpireIn         int    `gorm:"token_expire_in"`
	TokenExpireReturnCode string `gorm:"token_expire_return_code"`
}

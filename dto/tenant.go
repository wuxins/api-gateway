package dto

type Tenant struct {
	TenantKey          string `gorm:"tenant_key"`
	TenantSecret       string `gorm:"tenant_secret"`
	TenantSecretSalt   string `gorm:"tenant_secret_salt"`
	TokenExpireIn      int    `gorm:"token_expire_in"`
	TokenExpireCode    int    `gorm:"token_expire_code"`
	TokenExpireContent string `gorm:"token_expire_content"`
}

package dto

type Tenant struct {
	Name               string `gorm:"name"`
	TenantCode         string `gorm:"tenant_code"`
	NeedApiAuth        string `gorm:"need_api_auth"`
	ApiAuthContent     string `gorm:"api_auth_content"`
	ApiAuth            ApiAuth
	IgnoreHeaderParams string `gorm:"ignore_header_params"`
	IgnoreQueryParams  string `gorm:"ignore_query_params"`
}

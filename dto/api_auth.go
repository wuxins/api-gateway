package dto

type ApiAuth struct {
	ApiAuthType           string
	Secret                string
	TokenSignKey          string
	TokenSignMethod       string
	TokenExpireIn         int
	TokenExpireReturnCode string
}

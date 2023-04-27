package dao

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dbclient"
	"github.com/wuxins/api-gateway/dto"
)

func GetAllApi() []dto.Api {

	var apis []dto.Api
	dbclient.GetDB().Raw(common.ApiSql, config.GetConfigure().System.Env).Scan(&apis)
	return apis
}

func GetAllTenants() []dto.Tenant {

	var tenants []dto.Tenant
	dbclient.GetDB().Raw(common.TenantSql, config.GetConfigure().System.Env).Scan(&tenants)
	return tenants
}

func GetAllApiTenants() []dto.ApiTenant {
	var apiTenants []dto.ApiTenant
	dbclient.GetDB().Raw(common.ApiTenantSql, config.GetConfigure().System.Env).Scan(&apiTenants)
	return apiTenants
}

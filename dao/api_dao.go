package dao

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dbclient"
	"github.com/wuxins/api-gateway/dto"
)

var Tenants []dto.Tenant

func InitAllTenant() {

	var tenants []dto.Tenant
	dbclient.GetDB().Raw(common.TenantSql).Scan(&tenants)
	Tenants = tenants
}

func GetAllApi() []dto.Api {

	var apis []dto.Api
	dbclient.GetDB().Raw(common.ApiSql, config.GetConfigure().Sysconf.Env).Scan(&apis)

	var apiTenants []dto.ApiTenant
	dbclient.GetDB().Raw(common.ApiTenantSql).Scan(&apiTenants)

	for idx, _ := range apis {
		var tenants []dto.ApiTenant
		for index := range apiTenants {
			apiTenant := apiTenants[index]
			if apis[idx].ApiCode == apiTenant.ApiCode {
				tenants = append(tenants, apiTenant)
			}
		}
		apis[idx].Tenants = tenants
	}

	return apis
}

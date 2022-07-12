package dao

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dbclient"
	dto2 "github.com/wuxins/api-gateway/dto"
)

func GetAllApi() []dto2.Api {

	var apis []dto2.Api
	dbclient.GetDB().Raw(common.ApiSql, config.GetConfigure().Sysconf.Env).Scan(&apis)

	var apiTenants []dto2.Tenant
	dbclient.GetDB().Raw(common.ApiTenantSql).Scan(&apiTenants)

	for idx, _ := range apis {
		var tenants []dto2.Tenant
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

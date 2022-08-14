package dao

import (
	jsoniter "github.com/json-iterator/go"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dbclient"
	"github.com/wuxins/api-gateway/dto"
)

var Tenants []dto.Tenant

func InitAllTenant() {

	var tenants []dto.Tenant
	dbclient.GetDB().Raw(common.TenantSql, config.GetConfigure().Sysconf.Env).Scan(&tenants)
	for index, _ := range tenants {
		_ = jsoniter.UnmarshalFromString(tenants[index].ApiAuthContent, &tenants[index].ApiAuth)
		tenants[index].ApiAuthContent = common.DelimiterEmpty
	}
	Tenants = tenants
}

func GetAllApi() []dto.Api {

	var apis []dto.Api
	dbclient.GetDB().Raw(common.ApiSql, config.GetConfigure().Sysconf.Env, config.GetConfigure().Sysconf.Env).Scan(&apis)

	var apiTenants []dto.ApiTenant
	dbclient.GetDB().Raw(common.ApiTenantSql, config.GetConfigure().Sysconf.Env).Scan(&apiTenants)

	for idx, _ := range apis {
		var tenants []dto.ApiTenant
		for index := range apiTenants {
			apiTenant := apiTenants[index]
			if apis[idx].ApiCode == apiTenant.ApiCode {
				_ = jsoniter.UnmarshalFromString(apiTenant.ApiAuthContent, &apiTenant.ApiAuth)
				_ = jsoniter.UnmarshalFromString(apiTenant.AccessControlContent, &apiTenant.AccessControl)
				apiTenant.ApiAuthContent = common.DelimiterEmpty
				apiTenant.AccessControlContent = common.DelimiterEmpty
				tenants = append(tenants, apiTenant)
			}
		}
		apis[idx].Tenants = tenants
		_ = jsoniter.UnmarshalFromString(apis[idx].GrayContent, &apis[idx].GrayStrategy)
		apis[idx].GrayContent = common.DelimiterEmpty
	}

	return apis
}

package dao

import (
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/config"
	"github.com/wuxins/api-gateway/dao/dto"
	"github.com/wuxins/api-gateway/dbclient"
)

func GetAllApi() []dto.Api {

	var apis []dto.Api
	dbclient.GetDB().Raw(common.API_SQL, config.GetConfigure().Env).Scan(&apis)

	var apiTenants []dto.Tenant
	dbclient.GetDB().Raw(common.API_TENANT_SQL).Scan(&apiTenants)

	var serverHosts []dto.UpstreamServer
	dbclient.GetDB().Raw(common.API_UPSTREAM_SERVER_SQL, config.GetConfigure().Env).Scan(&serverHosts)

	for idx, _ := range apis {
		var tenants []dto.Tenant
		for index := range apiTenants {
			apiTenant := apiTenants[index]
			if apis[idx].ApiCode == apiTenant.ApiCode {
				tenants = append(tenants, apiTenant)
			}
		}
		apis[idx].Tenants = tenants

		var servers []dto.UpstreamServer
		for index := range serverHosts {
			server := serverHosts[index]
			if apis[idx].ApiCode == server.ApiCode {
				servers = append(servers, server)
			}
		}
		apis[idx].Servers = servers
	}

	return apis
}

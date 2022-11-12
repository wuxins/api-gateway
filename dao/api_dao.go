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

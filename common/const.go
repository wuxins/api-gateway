package common

var ConfLoadMode = "API_CONFIG_MODE"
var ConfLoadModeNacos = "nacos"

var NacosAddress = "NACOS_ADDRESS"
var NacosNamespace = "NACOS_NAMESPACE"
var NacosDataid = "NACOS_DATAID"
var NacosGroup = "NACOS_GROUP"

var ServerRatePrefix = "GW_SR_"
var SnowflakeNodeKey = "GW_SN_ND"

var DelimiterComma = ","

var DateFormatMs = "2006-01-02 15:04:05.000"

var HeaderTenant = "G-Tenant"
var HeaderRequestId = "G-Req-Id"
var HeaderRequestTime = "G-Req-Time"
var HeaderContentEncoding = "Content-Encoding"

var AccessControlAllowOrigin = "Access-Control-Allow-Origin"
var AccessControlAllowMethods = "Access-Control-Allow-Methods"
var AccessControlAllowHeaders = "Access-Control-Allow-Headers"

var WelcomeMsg = "Welcome!"
var UnauthorizedMsg = "Unauthorized access!"
var SysErrorMsg = "System Error!"
var PathErrorMsg = "Path can not be decoded!"
var ChannelUnsupportedMsg = "Tenant not supported!"
var RateLimitMsg = "Rate limited!"

//SELECT
//	a.id,
//	a.name,
//	a.api_code,
//	a.method,
//	a.src_url,
//	a.des_url,
//	av.read_timeout,
//	av.need_rate_limit,
//	av.rate_limit,
//	av.need_monitor,
//	av.need_fallback,
//	av.fallback,
//	s.addresses
//FROM api_version av
//	JOIN api a ON a.api_code = av.api_code
//	JOIN service s ON s.service_code = a.service_code
//WHERE av.env = ? AND av.is_deleted = 'N' AND a.is_deleted = 'N' AND s.is_deleted = 'N'

var ApiSql = "SELECT\n    a.id,\n    a.name,\n    a.api_code,\n    a.method,\n    a.src_url,\n    a.des_url,\n    av.read_timeout,\n    av.need_rate_limit,\n    av.rate_limit,\n    av.need_monitor,\n    av.need_fallback,\n    av.fallback,\n    s.addresses\nFROM api_version av\n         JOIN api a ON a.api_code = av.api_code\n         JOIN service s ON s.service_code = a.service_code\nWHERE av.env = ? AND av.is_deleted = 'N' AND a.is_deleted = 'N' AND s.is_deleted = 'N'"

//SELECT
//    apt.api_code, t.tenant_code, t.name
//FROM
//    tenant t
//        JOIN
//    api_tenant apt ON apt.tenant_code = t.tenant_code
//WHERE
//    t.is_deleted = 'N'
//        AND apt.is_deleted = 'N'

var ApiTenantSql = "SELECT \n    apt.api_code, t.tenant_code, t.name\nFROM\n    tenant t\n        JOIN\n    api_tenant apt ON apt.tenant_code = t.tenant_code\nWHERE\n    t.is_deleted = 'N'\n        AND apt.is_deleted = 'N'"

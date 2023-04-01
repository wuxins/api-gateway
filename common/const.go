package common

var ConfLoadMode = "CONFIG_MODE"
var ConfLoadModeNacos = "nacos"
var ConfLoadModeLocal = "local"

var NacosAddress = "NACOS_ADDRESS"
var NacosNamespace = "NACOS_NAMESPACE"
var NacosDataid = "NACOS_DATAID"
var NacosGroup = "NACOS_GROUP"

var ServerRatePrefix = "GW_SR_"
var SnowflakeNodeKey = "GW_SN_ND"

var DelimiterComma = ","
var DelimiterEmpty = ""
var DelimiterBlank = " "
var DelimiterSemicolon = ":"

var DateFormatMs = "2006-01-02 15:04:05.000"

var HeaderTenant = "G-Tenant"
var HeaderRequestId = "G-Req-Id"
var HeaderRequestTime = "G-Req-Time"
var HeaderGrayTag = "G-Gray-Tag"
var HeaderContentEncoding = "Content-Encoding"

var AccessControlAllowOrigin = "Access-Control-Allow-Origin"
var AccessControlAllowMethods = "Access-Control-Allow-Methods"
var AccessControlAllowHeaders = "Access-Control-Allow-Headers"

var WelcomeMsg = "Welcome!"
var HeartbeatMsg = "pong!"
var UnauthorizedMsg = "Unauthorized access!"
var SysErrorMsg = "System Error!"
var PathErrorMsg = "Path can not be decoded!"
var TenantUnsupportedMsg = "Tenant not supported!"
var RateLimitMsg = "Rate limited!"

var JwtSignKey = "my_sign_key"

/**
SELECT
	a.NAME,
	a.api_code,
	av.method,
	av.src_url,
	av.des_url,
	av.read_timeout,
	av.need_rate_limit,
	av.rate_limit,
	av.need_monitor,
	av.need_fallback,
	av.fallback,
	av.ignore_header_params,
	av.ignore_query_params,
	sv.address
FROM
	t_api_version av
	JOIN t_api a ON a.api_code = av.api_code
	AND av.env = ?
	JOIN t_upstream_service s ON s.service_code = av.service_code
	JOIN t_upstream_service_version sv ON sv.service_code = s.service_code
	AND sv.env = av.env
WHERE
	av.is_deleted = 'N'
	AND a.is_deleted = 'N'
	AND s.is_deleted = 'N'
	AND sv.is_deleted = 'N'
*/
var ApiSql = "SELECT\n\ta.NAME,\n\ta.api_code,\n\tav.method,\n\tav.src_url,\n\tav.des_url,\n\tav.read_timeout,\n\tav.need_rate_limit,\n\tav.rate_limit,\n\tav.need_monitor,\n\tav.need_fallback,\n\tav.fallback,\n\tav.ignore_header_params,\n\tav.ignore_query_params,\n\tsv.address\nFROM\n\tt_api_version av\n\tJOIN t_api a ON a.api_code = av.api_code\n\tAND av.env = ?\n\tJOIN t_upstream_service s ON s.service_code = av.service_code\n\tJOIN t_upstream_service_version sv ON sv.service_code = s.service_code\n\tAND sv.env = av.env\nWHERE\n\tav.is_deleted = 'N'\n\tAND a.is_deleted = 'N'\n\tAND s.is_deleted = 'N'\n\tAND sv.is_deleted = 'N'"

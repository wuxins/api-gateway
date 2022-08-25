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
	a.id,
	a.NAME,
	a.api_code,
	a.method,
	a.src_url,
	a.des_url,
	av.read_timeout,
	av.need_rate_limit,
	av.rate_limit,
	av.need_monitor,
	av.need_fallback,
	av.fallback,
	av.ignore_header_params,
	av.ignore_query_params,
	se.address,
	se.need_gray,
	se.gray_content
FROM
	api_env av
	JOIN api a ON a.api_code = av.api_code
	AND av.env = ?
	JOIN upstream_service s ON s.service_code = a.service_code
	JOIN upstream_service_env se ON se.service_code = s.service_code
	AND se.env = ?
WHERE
	av.is_deleted = 'N'
	AND a.is_deleted = 'N'
	AND s.is_deleted = 'N'
	AND se.is_deleted = 'N'
*/

var ApiSql = "SELECT\n\ta.id,\n\ta.NAME,\n\ta.api_code,\n\ta.method,\n\ta.src_url,\n\ta.des_url,\n\tav.read_timeout,\n\tav.need_rate_limit,\n\tav.rate_limit,\n\tav.need_monitor,\n\tav.need_fallback,\n\tav.fallback,\n\tav.ignore_header_params,\n\tav.ignore_query_params,\n\tse.address,\n\tse.need_gray,\n\tse.gray_content\nFROM\n\tapi_env av\n\tJOIN api a ON a.api_code = av.api_code\n\tAND av.env = ?\n\tJOIN upstream_service s ON s.service_code = a.service_code\n\tJOIN upstream_service_env se ON se.service_code = s.service_code\n\tAND se.env = ?\nWHERE\n\tav.is_deleted = 'N'\n\tAND a.is_deleted = 'N'\n\tAND s.is_deleted = 'N'\n\tAND se.is_deleted = 'N'"

/**
SELECT
	apt.api_code,
	t.NAME,
	t.tenant_code,
	te.need_api_auth,
	te.api_auth_content,
	te.ignore_header_params,
	te.ignore_query_params
FROM
	tenant t,
	api_tenant apt,
	tenant_env te
WHERE
	t.tenant_code = apt.tenant_code
	AND apt.tenant_code = te.tenant_code
	AND t.is_deleted = 'N'
	AND apt.is_deleted = 'N'
	AND te.is_deleted = 'N'
	AND te.env = ?
*/

var ApiTenantSql = "SELECT\n\tapt.api_code,\n\tt.NAME,\n\tt.tenant_code,\n\tte.need_api_auth,\n\tte.api_auth_content,\n\tte.ignore_header_params,\n\tte.ignore_query_params\nFROM\n\ttenant t,\n\tapi_tenant apt,\n\ttenant_env te\nWHERE\n\tt.tenant_code = apt.tenant_code\n\tAND apt.tenant_code = te.tenant_code\n\tAND t.is_deleted = 'N'\n\tAND apt.is_deleted = 'N'\n\tAND te.is_deleted = 'N'\n\tAND te.env = ?"

/**
SELECT
	t.NAME,
	t.tenant_code,
	te.need_api_auth,
	te.api_auth_content,
	te.ignore_header_params,
	te.ignore_query_params
FROM
	tenant t
	JOIN tenant_env te ON t.tenant_code = te.tenant_code
	AND te.env = ?
WHERE
	te.is_deleted = 'N'
	AND t.is_deleted = 'N'
*/

var TenantSql = "SELECT\n\tt.NAME,\n\tt.tenant_code,\n\tte.need_api_auth,\n\tte.api_auth_content,\n\tte.ignore_header_params,\n\tte.ignore_query_params\nFROM\n\ttenant t\n\tJOIN tenant_env te ON t.tenant_code = te.tenant_code\n\tAND te.env = ?\nWHERE\n\tte.is_deleted = 'N'\n\tAND t.is_deleted = 'N'"

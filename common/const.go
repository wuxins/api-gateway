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
SELECT a.id,
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
       se.address
FROM api_version av
         JOIN api a ON a.api_code = av.api_code
    AND av.env = ?
         JOIN upstream_service s ON s.service_code = a.service_code
         JOIN upstream_service_env se ON se.service_code = s.service_code AND se.env = av.env
WHERE av.is_deleted = 'N'
  AND a.is_deleted = 'N'
  AND s.is_deleted = 'N'
  AND se.is_deleted = 'N'
*/
var ApiSql = "SELECT a.id,\n       a.NAME,\n       a.api_code,\n       a.method,\n       a.src_url,\n       a.des_url,\n       av.read_timeout,\n       av.need_rate_limit,\n       av.rate_limit,\n       av.need_monitor,\n       av.need_fallback,\n       av.fallback,\n       av.ignore_header_params,\n       av.ignore_query_params,\n       se.address\nFROM api_version av\n         JOIN api a ON a.api_code = av.api_code\n    AND av.env = ?\n         JOIN upstream_service s ON s.service_code = a.service_code\n         JOIN upstream_service_env se ON se.service_code = s.service_code AND se.env = av.env\nWHERE av.is_deleted = 'N'\n  AND a.is_deleted = 'N'\n  AND s.is_deleted = 'N'\n  AND se.is_deleted = 'N'"

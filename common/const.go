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
//	s.host
//FROM api_version av
//JOIN api a ON a.api_code = av.api_code
//JOIN upstream_service s ON s.service_code = a.service_code
//WHERE av.env = ? AND av.is_deleted = 'N' AND a.is_deleted = 'N' AND s.is_deleted = 'N'

var ApiSql = "SELECT\n\ta.id,\n\ta.name,\n\ta.api_code,\n\ta.method,\n\ta.src_url,\n\ta.des_url,\n\tav.read_timeout,\n\tav.need_rate_limit,\n\tav.rate_limit,\n\tav.need_monitor,\n\tav.need_fallback,\n\tav.fallback,\n\ts.host\nFROM api_version av\n\tJOIN api a ON a.api_code = av.api_code\n\tJOIN upstream_service s ON s.service_code = a.service_code\nWHERE av.env = ? AND av.is_deleted = 'N' AND a.is_deleted = 'N' AND s.is_deleted = 'N'"

//SELECT apt.api_code,
//    t.name,
//    t.tenant_code,
//    t.need_api_auth,
//    t.api_auth_type,
//    t.secret,
//    t.token_expire_in,
//    t.token_sign_key,
//    t.token_sign_method,
//    t.token_expire_code
//FROM tenant t
//JOIN
//api_tenant apt ON apt.tenant_code = t.tenant_code
//WHERE t.is_deleted = 'N'
//AND apt.is_deleted = 'N'

var ApiTenantSql = "SELECT apt.api_code,\n    t.name,\n    t.tenant_code,\n    t.need_api_auth,\n    t.api_auth_type,\n    t.secret,\n    t.token_expire_in,\n    t.token_sign_key,\n    t.token_sign_method,\n    t.token_expire_code\nFROM tenant t\nJOIN\napi_tenant apt ON apt.tenant_code = t.tenant_code\nWHERE t.is_deleted = 'N'\nAND apt.is_deleted = 'N'"

var TenantSql = "select name, tenant_code, need_api_auth, api_auth_type, secret, token_sign_key, token_sign_method, token_expire_in, token_expire_code from tenant"

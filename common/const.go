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
//	se.address,
//	se.gray_address
//FROM api_env av
//JOIN api a ON a.api_code = av.api_code and av.env = ?
//JOIN upstream_service s ON s.service_code = a.service_code
//join upstream_service_env se on se.service_code = s.service_code and se.env = ?
//WHERE av.is_deleted = 'N' AND a.is_deleted = 'N' AND s.is_deleted = 'N' AND se.is_deleted = 'N'

var ApiSql = "SELECT\n\ta.id,\n\ta.name,\n\ta.api_code,\n\ta.method,\n\ta.src_url,\n\ta.des_url,\n\tav.read_timeout,\n\tav.need_rate_limit,\n\tav.rate_limit,\n\tav.need_monitor,\n\tav.need_fallback,\n\tav.fallback,\n\tse.address,\n\tse.gray_address\nFROM api_env av\nJOIN api a ON a.api_code = av.api_code and av.env = ?\nJOIN upstream_service s ON s.service_code = a.service_code\njoin upstream_service_env se on se.service_code = s.service_code and se.env = ?\nWHERE av.is_deleted = 'N' AND a.is_deleted = 'N' AND s.is_deleted = 'N' AND se.is_deleted = 'N'"

//SELECT apt.api_code,
//	t.name,
//	t.tenant_code,
//	te.need_api_auth,
//	te.api_auth_type,
//	te.secret,
//	te.token_expire_in,
//	te.token_sign_key,
//	te.token_sign_method,
//	te.token_expire_code
//	FROM tenant t,
//	api_tenant apt,
//	tenant_env te
//WHERE t.tenant_code = apt.tenant_code
//	and apt.tenant_code = te.tenant_code
//	and t.is_deleted = 'N'
//	AND apt.is_deleted = 'N'
//	AND te.is_deleted = 'N'
//	and te.env = ?

var ApiTenantSql = "SELECT apt.api_code,\n\tt.name,\n\tt.tenant_code,\n\tte.need_api_auth,\n\tte.api_auth_type,\n\tte.secret,\n\tte.token_expire_in,\n\tte.token_sign_key,\n\tte.token_sign_method,\n\tte.token_expire_code\n\tFROM tenant t,\n\tapi_tenant apt,\n\ttenant_env te\nWHERE t.tenant_code = apt.tenant_code\n\tand apt.tenant_code = te.tenant_code\n\tand t.is_deleted = 'N'\n\tAND apt.is_deleted = 'N'\n\tAND te.is_deleted = 'N'\n\tand te.env = ?"

//select t.name,
//	t.tenant_code,
//	te.need_api_auth,
//	te.api_auth_type,
//	te.secret,
//	te.token_sign_key,
//	te.token_sign_method,
//	te.token_expire_in,
//	te.token_expire_code
//	from tenant t
//	join tenant_env te on t.tenant_code = te.tenant_code and te.env = ?
//WHERE te.is_deleted = 'N'
//AND t.is_deleted = 'N'

var TenantSql = "select t.name,\n\tt.tenant_code,\n\tte.need_api_auth,\n\tte.api_auth_type,\n\tte.secret,\n\tte.token_sign_key,\n\tte.token_sign_method,\n\tte.token_expire_in,\n\tte.token_expire_code\n\tfrom tenant t\n\tjoin tenant_env te on t.tenant_code = te.tenant_code and te.env = ?\nWHERE te.is_deleted = 'N'\nAND t.is_deleted = 'N'"

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
var BreakerErrorMsg = "Circuit Breaker Open!"
var PathErrorMsg = "Path can not be decoded!"
var TenantUnsupportedMsg = "Tenant not supported!"
var TenantSKErrorMsg = "Tenant SK error!"
var TenantTokenExpireMsg = "Tenant token expired!"
var RateLimitMsg = "Rate limited!"

var JwtSignKey = "my_sign_key"

/*
select av.api_code,
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
       av.need_api_auth,
       av.tenant_codes,
       us.address
from t_api_version av
         join t_api a on a.api_code = av.api_code and av.env = ?
         join t_upstream_service_version us on us.service_code = av.service_code and us.env = av.env
where av.is_deleted = 'N'
  and a.is_deleted = 'N'
  and us.is_deleted = 'N';
*/
var ApiSql = "select av.api_code,\n       av.method,\n       av.src_url,\n       av.des_url,\n       av.read_timeout,\n       av.need_rate_limit,\n       av.rate_limit,\n       av.need_monitor,\n       av.need_fallback,\n       av.fallback,\n       av.ignore_header_params,\n       av.ignore_query_params,\n       av.need_api_auth,\n       av.tenant_codes,\n       us.address\nfrom t_api_version av\n         join t_api a on a.api_code = av.api_code and av.env = ?\n         join t_upstream_service_version us on us.service_code = av.service_code and us.env = av.env\nwhere av.is_deleted = 'N'\n  and a.is_deleted = 'N'\n  and us.is_deleted = 'N'"

/*
select env,
       tenant_key,
       tenant_secret,
       token_expire_in,
       token_expire_code,
       token_expire_content
from t_tenant_version
where env = ?
  and is_deleted = 'N';
*/
var TenantSql = "select env,\n       tenant_key,\n       tenant_secret,\n       token_expire_in,\n       token_expire_code,\n       token_expire_content\nfrom t_tenant_version\nwhere env = ?\n  and is_deleted = 'N'"

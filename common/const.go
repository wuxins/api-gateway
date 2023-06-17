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
       us.address,
       us.gray_address
from t_api_version av
         join t_api a on a.api_code = av.api_code and av.env = ?
         join t_upstream_service_version us on us.service_code = av.service_code and us.env = av.env
where av.is_deleted = 'N'
  and a.is_deleted = 'N'
  and us.is_deleted = 'N';
*/
var ApiSql = "select av.api_code,\n       av.method,\n       av.src_url,\n       av.des_url,\n       av.read_timeout,\n       av.need_rate_limit,\n       av.rate_limit,\n       av.need_monitor,\n       av.need_fallback,\n       av.fallback,\n       av.ignore_header_params,\n       av.ignore_query_params,\n       av.need_api_auth,\n       us.address,\n       us.gray_address\nfrom t_api_version av\n         join t_api a on a.api_code = av.api_code and av.env = ?\n         join t_upstream_service_version us on us.service_code = av.service_code and us.env = av.env\nwhere av.is_deleted = 'N'\n  and a.is_deleted = 'N'\n  and us.is_deleted = 'N'"

/*
select tenant_code,
       tenant_key,
       tenant_secret,
       tenant_secret_salt,
       token_expire_in,
       token_expire_code,
       token_expire_content
from t_tenant_version
where env = ?
  and is_deleted = 'N';
*/
var TenantSql = "select tenant_code,\n       tenant_key,\n       tenant_secret,\n       tenant_secret_salt,\n       token_expire_in,\n       token_expire_code,\n       token_expire_content\nfrom t_tenant_version\nwhere env = ?\n  and is_deleted = 'N'"

/**
select att.api_code,
       ttv.tenant_code,
       ttv.tenant_key,
       ttv.tenant_secret,
       ttv.tenant_secret_salt,
       ttv.token_expire_in,
       ttv.token_expire_code,
       ttv.token_expire_content
from t_tenant_version ttv
         join t_tenant tt on tt.tenant_code = ttv.tenant_code
         join t_api_tenant att on att.tenant_code = ttv.tenant_code
where att.is_deleted = 'N'
  and tt.is_deleted = 'N'
  and ttv.is_deleted = 'N'
  and ttv.env = ?
*/
var ApiTenantSql = "select att.api_code,\n       ttv.tenant_code,\n       ttv.tenant_key,\n       ttv.tenant_secret,\n       ttv.tenant_secret_salt,\n       ttv.token_expire_in,\n       ttv.token_expire_code,\n       ttv.token_expire_content\nfrom t_tenant_version ttv\n         join t_tenant tt on tt.tenant_code = ttv.tenant_code\n         join t_api_tenant att on att.tenant_code = ttv.tenant_code\nwhere att.is_deleted = 'N'\n  and tt.is_deleted = 'N'\n  and ttv.is_deleted = 'N'\n  and ttv.env = ?"

/**
SELECT mode,
	scale_rate,
	feature_ip_list,
	feature_header_tags,
	header_pass_tag,
	rule_code
FROM
	t_gray_rule_version
WHERE
	is_deleted = 'N'
	AND active = 'Y'
	AND env = ?;
*/
var GrayRuleSql = "SELECT mode,\n\tscale_rate,\n\tfeature_ip_list,\n\tfeature_header_tags,\n\theader_pass_tag,\n\trule_code\nFROM\n\tt_gray_rule_version\nWHERE\n\tis_deleted = 'N'\n\tAND active = 'Y'\n\tAND env = ?"

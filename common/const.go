package common

var CONF_LOAD_MODE_NACOS = "nacos"
var CONF_LOAD_MODE_LOCAL = "local"

var NACOS_ADDRESS = "NACOS_ADDRESS"
var NACOS_NAMESPACE = "NACOS_NAMESPACE"
var NACOS_DATAID = "NACOS_DATAID"
var NACOS_GROUP = "NACOS_GROUP"

var CLIENT_RATE_PREFIX = "GW_CR_"
var SERVER_RATE_PREFIX = "GW_SR_"
var SNOWFLAKE_NODE_KEY = "GW_SN_ND"

var HEADER_TENANT = "G-Tenant"
var HEADER_REQUEST_ID = "G-Req-Id"
var HEADER_REQUEST_TIME = "G-Req-Time"
var HEADER_CONTENT_ENCODING = "Content-Encoding"

var WELCOME_MSG = "{\"code\":\"00\",\"msg\":\"Welcome!\",\"success\":true}"
var UNAUTHIRIZED_MSG = "{\"code\":\"50000\",\"msg\":\"Unauthorized access!\",\"success\":false}"
var SYS_ERROR_MSG = "{\"code\":\"50001\",\"msg\":\"System Error!\",\"success\":false}"
var PATH_ERROR_MSG = "{\"code\":\"50002\",\"msg\":\"Path can not be decoded!\",\"success\":false}"
var REQ_METHOD_UNSUPPORTED_MSG = "{\"code\":\"50003\",\"msg\":\"Request method not supported!\",\"success\":false}"
var CHANNEL_UNSUPPORTED_MSG = "{\"code\":\"50004\",\"msg\":\"Request channel not supported!\",\"success\":false}"
var RATE_LIMiT_MSG = "{\"code\":\"50005\",\"msg\":\"Rate limited!\",\"success\":false}"

//SELECT a.id,
//       a.name,
//       a.api_code,
//       a.method,
//       av.read_timeout,
//       av.src_url,
//       av.des_url,
//       av.need_rate_limit,
//       av.rate_limit,
//       av.need_monitor,
//       av.need_fallback,
//       av.fallback
//FROM api_version av
//         JOIN
//     api a ON a.api_code = av.api_code
//WHERE av.env = ?
//  AND av.is_deleted = 'N'
//  AND a.is_deleted = 'N'

var API_SQL = "SELECT a.id,\n       a.name,\n       a.api_code,\n       a.method,\n       av.read_timeout,\n       av.src_url,\n       av.des_url,\n       av.need_rate_limit,\n       av.rate_limit,\n       av.need_monitor,\n       av.need_fallback,\n       av.fallback\nFROM api_version av\n         JOIN\n     api a ON a.api_code = av.api_code\nWHERE av.env = ?\n  AND av.is_deleted = 'N'\n  AND a.is_deleted = 'N'"

/**
SELECT
    apt.api_code, t.tenant_code, t.name
FROM
    tenant t
        JOIN
    api_tenant apt ON apt.tenant_code = t.tenant_code
WHERE
    t.is_deleted = 'N'
        AND apt.is_deleted = 'N'
*/
var API_TENANT_SQL = "SELECT \n    apt.api_code, t.tenant_code, t.name\nFROM\n    tenant t\n        JOIN\n    api_tenant apt ON apt.tenant_code = t.tenant_code\nWHERE\n    t.is_deleted = 'N'\n        AND apt.is_deleted = 'N'"

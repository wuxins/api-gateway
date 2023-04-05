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
         join t_api a on a.api_code = av.api_code and av.env = 'DEV'
         join t_upstream_service_version us on us.service_code = av.service_code and us.env = av.env
where av.is_deleted = 'N'
  and a.is_deleted = 'N'
  and us.is_deleted = 'N';

select env,
       tenant_key,
       tenant_secret,
       token_expire_in,
       token_expire_code,
       token_expire_content
from t_tenant_version
where env = 'DEV'
  and is_deleted = 'N';


select *
from t_api;

select *
from t_api_version;

select *
from t_upstream_service_version;

select *
from t_tenant;

select *
from t_tenant_version;
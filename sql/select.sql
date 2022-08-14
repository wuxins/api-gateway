SELECT *
FROM api_gateway.environment;
SELECT *
FROM api_gateway.tenant;
SELECT *
FROM api_gateway.upstream_service;
select *
from api_gateway.api;
SELECT *
FROM api_gateway.api_tenant;
SELECT *
FROM api_gateway.tenant_env;
SELECT *
FROM api_gateway.upstream_service_env;
select *
from api_gateway.api_env;
select *
from api_gateway.change_log;

SELECT a.id,
       a.name,
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
       se.address,
       se.gray_content
FROM api_env av
         JOIN api a ON a.api_code = av.api_code and av.env = 'dev'
         JOIN upstream_service s ON s.service_code = a.service_code
         join upstream_service_env se on se.service_code = s.service_code and se.env = 'dev'
WHERE av.is_deleted = 'N'
  AND a.is_deleted = 'N'
  AND s.is_deleted = 'N'
  AND se.is_deleted = 'N';

select t.name,
       t.tenant_code,
       te.access_control_content,
       te.need_api_auth,
       te.api_auth_content
from tenant t
         join tenant_env te on t.tenant_code = te.tenant_code and te.env = 'dev'
WHERE te.is_deleted = 'N'
  AND t.is_deleted = 'N';

SELECT apt.api_code,
       t.name,
       t.tenant_code,
       te.access_control_content,
       te.need_api_auth,
       te.api_auth_content
FROM tenant t,
     api_tenant apt,
     tenant_env te
WHERE t.tenant_code = apt.tenant_code
  and apt.tenant_code = te.tenant_code
  and t.is_deleted = 'N'
  AND apt.is_deleted = 'N'
  AND te.is_deleted = 'N'
  and te.env = 'dev';
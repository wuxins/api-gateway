SELECT * FROM api_gateway.environment;
SELECT * FROM api_gateway.tenant;
SELECT * FROM api_gateway.tenant_env;
SELECT * FROM api_gateway.upstream_service;
SELECT * FROM api_gateway.upstream_service_env;

select count(1) from api_gateway.api;
SELECT count(1) FROM api_gateway.api_tenant;
select count(1) from api_gateway.api_env;


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
       av.fallback
FROM api_version av
         JOIN
     api a ON a.api_code = av.api_code
         JOIN
     service s ON s.service_code = a.service_code
         JOIN
     api_tenant at ON at.api_code = a.

WHERE av.env = 'dev'
  AND av.is_deleted = 'N'
  AND s.is_deleted = 'N'
  AND a.is_deleted = 'N';


SELECT
    a.id,
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
    s.addresses
FROM api_version av
         JOIN api a ON a.api_code = av.api_code
         JOIN service s ON s.service_code = a.service_code
WHERE av.env = 'dev' AND av.is_deleted = 'N' AND a.is_deleted = 'N' AND s.is_deleted = 'N'
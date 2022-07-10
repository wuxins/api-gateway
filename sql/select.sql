select * from api;
select * from `group`;
select * from tenant;
select * from api_group;
select * from api_tenant;
select * from api_version;


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
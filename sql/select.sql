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
    AND av.env = 'dev'
         JOIN upstream_service s ON s.service_code = a.service_code
         JOIN upstream_service_env se ON se.service_code = s.service_code AND se.env = av.env
WHERE av.is_deleted = 'N'
  AND a.is_deleted = 'N'
  AND s.is_deleted = 'N'
  AND se.is_deleted = 'N'
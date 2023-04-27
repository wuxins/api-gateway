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

select *
from t_report_config;

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('登录', 'life-login', 'http://svc-zains-bm-login-service:8080', '刘轶材');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('客户', 'life-customer', 'http://svc-zains-bm-customer-service:8080', '刘轶材');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('字典', 'life-dict', 'http://svc-zains-bm-dict-service:8080', '刘轶材');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('保单', 'life-policy', 'http://svc-zains-bm-policy-service:8080', '刘轶材、池深深');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('B端用户', 'life-user', 'http://svc-zains-bm-user-service:8080', '池深深');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('支付', 'life-payment', 'http://svc-zains-bm-payment-service:8080', '池深深');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('渠道', 'life-channel', 'http://svc-zains-bm-channel-service:8080', '曾中雄');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('营销', 'life-market', 'http://svc-zains-bm-market-service:8080', '曾中雄');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('产品', 'life-product', 'http://svc-zains-bm-product-service:8080', '曾中雄');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('计算', 'life-calculate', 'http://svc-zains-bm-calculate-service:8080', '曾中雄');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('投保单', 'life-insure', 'http://svc-zains-bm-insure-service:8080', '关棋文');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('订单', 'life-order', 'http://svc-zains-bm-order-service:8080', '关棋文');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('理赔', 'life-claim', 'http://svc-zains-bm-claim-service:8080', '韦帅');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('单证', 'life-document', 'http://svc-zains-bm-document-service:8080', '李征');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('任务', 'life-task', 'http://svc-zains-bm-task-service:8080', '邹天龙');

insert into api_gateway.t_report_config (service_name, service_code, address, maintainer)
values ('账务', 'life-bcp', 'http://svc-zains-bm-bcp-service:8080', '邹龙章');
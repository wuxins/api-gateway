TRUNCATE `api_gateway`.`api`;
TRUNCATE `api_gateway`.`api_env`;
TRUNCATE `api_gateway`.`api_tenant`;
TRUNCATE `api_gateway`.`environment`;
TRUNCATE `api_gateway`.`tenant`;
TRUNCATE `api_gateway`.`tenant_env`;
TRUNCATE `api_gateway`.`upstream_service`;
TRUNCATE `api_gateway`.`upstream_service_env`;
TRUNCATE `api_gateway`.`change_log`;

INSERT INTO api_gateway.environment (name, env)
VALUES ('开发环境', 'dev'),
       ('测试环境', 'test');

INSERT INTO api_gateway.tenant (name, tenant_code)
VALUES ('银行', 'bling'),
       ('官网', 'website'),
       ('代理人', 'agent');

INSERT INTO api_gateway.upstream_service (name, service_code)
VALUES ('保单服务', 'life-policy'),
       ('订单服务', 'life-order');

INSERT INTO api_gateway.api (name, api_code, method, service_code, src_url, des_url, maintainer, description)
VALUES ('获取保单列表', 'A00001', 'GET', 'life-policy', '/life-policy/policies', '/life-policy/outer/policies', '野区蔡徐坤', '获取保单列表'),
       ('获取保单详情', 'A00002', 'GET', 'life-policy', '/life-policy/policies/{{policyNo}}', '/life-policy/outer/policies/{{policyNo}}', '中单川建国', '获取保单详情'),
       ('获取订单列表', 'A00003', 'GET', 'life-order', '/life-order/orders', '/life-order/outer/orders', '对抗郭德纲', '获取订单列表');

INSERT INTO api_gateway.api_tenant (api_code, tenant_code)
VALUES ('A00001', 'bling'),
       ('A00001', 'website'),
       ('A00001', 'agent'),
       ('A00002', 'bling'),
       ('A00002', 'website'),
       ('A00002', 'agent'),
       ('A00003', 'bling'),
       ('A00003', 'website'),
       ('A00003', 'agent');

INSERT INTO api_gateway.api_env (api_code, env, need_rate_limit, rate_limit, need_fallback, fallback, need_monitor, read_timeout)
VALUES ('A00001', 'dev', 'Y', 100, 'N', null, 'Y', 10000),
       ('A00002', 'dev', 'Y', 100, 'N', null, 'Y', 10000),
       ('A00003', 'dev', 'Y', 100, 'N', null, 'Y', 10000),
       ('A00001', 'test', 'Y', 300, 'N', null, 'Y', 10000),
       ('A00002', 'test', 'Y', 300, 'N', null, 'Y', 10000),
       ('A00003', 'test', 'Y', 300, 'N', null, 'Y', 10000);
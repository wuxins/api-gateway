TRUNCATE `api`;
TRUNCATE `api_version`;
TRUNCATE `environment`;
TRUNCATE `upstream_service`;
TRUNCATE `upstream_service_env`;
TRUNCATE `api_group`;

INSERT INTO environment (name, env)
VALUES ('开发环境', 'dev'),
       ('测试环境', 'test');

INSERT INTO upstream_service (name, service_code)
VALUES ('保单服务', 'life-policy'),
       ('订单服务', 'life-order');

INSERT INTO upstream_service_env (service_code, env, address)
VALUES ('life-policy', 'dev', 'http://localhost:6666'),
       ('life-policy', 'test', 'http://localhost:6666'),
       ('life-order', 'dev', 'http://localhost:6666'),
       ('life-order', 'test', 'http://localhost:6666');

INSERT INTO api (name, api_code, method, service_code, src_url, des_url, maintainer, description)
VALUES ('获取保单列表', 'A00001', 'GET', 'life-policy', '/life-policy/policies', '/life-policy/outer/policies', '野区蔡徐坤',
        '获取保单列表'),
       ('获取保单详情', 'A00002', 'GET', 'life-policy', '/life-policy/policies/{{policyNo}}',
        '/life-policy/outer/policies/{{policyNo}}', '中单川建国', '获取保单详情'),
       ('获取订单列表', 'A00003', 'GET', 'life-order', '/life-order/orders', '/life-order/outer/orders', '对抗郭德纲', '获取订单列表');

INSERT INTO api_version (api_code, env, need_rate_limit, rate_limit, need_fallback, fallback, need_monitor,
                         read_timeout)
VALUES ('A00001', 'dev', 'Y', 100, 'N', null, 'Y', 10000),
       ('A00002', 'dev', 'Y', 100, 'N', null, 'Y', 10000),
       ('A00003', 'dev', 'Y', 100, 'N', null, 'Y', 10000),
       ('A00001', 'test', 'Y', 300, 'N', null, 'Y', 10000),
       ('A00002', 'test', 'Y', 300, 'N', null, 'Y', 10000),
       ('A00003', 'test', 'Y', 300, 'N', null, 'Y', 10000);
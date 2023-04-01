INSERT INTO `api_gateway`.`upstream_service`(`name`, `service_code`)
VALUES ('登录', 'life-login');
INSERT INTO `api_gateway`.`upstream_service`(`name`, `service_code`)
VALUES ('客户', 'life-customer');

INSERT INTO `api_gateway`.`upstream_service_env`(`service_code`, `env`, `address`)
VALUES ('life-login', 'dev', 'http://svc-zains-bm-login-service:8080');
INSERT INTO `api_gateway`.`upstream_service_env`(`service_code`, `env`, `address`)
VALUES ('life-customer', 'dev', 'http://svc-zains-bm-customer-service:8080');

INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `service_code`, `maintainer`,
                                `description`)
VALUES ('C端客户登录', 'A00001', 'POST', '/life-login/api/users/login', '/life-login/api/users/login', 'life-login',
        'yicai.liu', 'C端客户登录');

INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`,
                                        `need_monitor`, `read_timeout`, `ignore_header_params`, `ignore_query_params`)
VALUES ('A00001', 'dev', 'Y', 100, 'N', NULL, 'Y', 100000, NULL, NULL);

INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `service_code`, `maintainer`,
                                `description`)
VALUES ('查询客户详情', 'B00001', 'GET', '/life-customer/api/customers', '/life-customer/api/customers', 'life-customer',
        'yicai.liu', '查询客户详情');

INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`,
                                        `need_monitor`, `read_timeout`, `ignore_header_params`, `ignore_query_params`)
VALUES ('B00001', 'dev', 'Y', 100, 'N', NULL, 'Y', 100000, NULL, NULL);

INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `service_code`, `maintainer`,
                                `description`)
VALUES ('查询被保人列表', 'B00002', 'GET', '/life-customer/api/customers/insureds', '/life-customer/api/customers/insureds',
        'life-customer', 'yicai.liu', '查询被保人列表');

INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`,
                                        `need_monitor`, `read_timeout`, `ignore_header_params`, `ignore_query_params`)
VALUES ('B00002', 'dev', 'Y', 100, 'N', NULL, 'Y', 100000, NULL, NULL);

INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `service_code`, `maintainer`,
                                `description`)
VALUES ('查询商品列表', 'C00001', 'GET', '/life-channel/api/goods', '/life-channel/api/goods',
        'life-channel', 'zhongxiong.zeng', '查询商品列表');

INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`,
                                        `need_monitor`, `read_timeout`, `ignore_header_params`, `ignore_query_params`)
VALUES ('C00001', 'dev', 'Y', 100, 'N', NULL, 'Y', 100000, NULL, NULL);

INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `service_code`, `maintainer`,
                                `description`)
VALUES ('查询试算因子', 'C00002', 'GET', '/life-channel/api/goods/{{goodsCode}}/premium-factors',
        '/life-channel/api/goods/{{goodsCode}}/premium-factors', 'life-channel', 'zhongxiong.zeng', '查询试算因子');

INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`,
                                        `need_monitor`, `read_timeout`, `ignore_header_params`, `ignore_query_params`)
VALUES ('C00002', 'dev', 'Y', 100, 'N', NULL, 'Y', 100000, NULL, NULL);

INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `service_code`, `maintainer`,
                                `description`)
VALUES ('查询试商品因子范围', 'C00003', 'GET', '/life-channel/api/goods/{{goodsCode}}/premium-factors/ranges',
        '/life-channel/api/goods/{{goodsCode}}/premium-factors/ranges',
        'life-channel', 'zhongxiong.zeng', '查询试商品因子范围');

INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`,
                                        `need_monitor`, `read_timeout`, `ignore_header_params`, `ignore_query_params`)
VALUES ('C00003', 'dev', 'Y', 100, 'N', NULL, 'Y', 100000, NULL, NULL);

INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `service_code`, `maintainer`,
                                `description`)
VALUES ('查询投保因子', 'C00004', 'GET', '/life-channel/api/goods/{{goodsCode}}/insure-factors',
        '/life-channel/api/goods/{{goodsCode}}/insure-factors', 'life-channel', 'zhongxiong.zeng', '查询投保因子');

INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`,
                                        `need_monitor`, `read_timeout`, `ignore_header_params`, `ignore_query_params`)
VALUES ('C00004', 'dev', 'Y', 100, 'N', NULL, 'Y', 100000, NULL, NULL);

INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `service_code`, `maintainer`,
                                `description`)
VALUES ('查询商品结构', 'C00005', 'GET', '/life-channel/api/goods/{{goodsCode}}/struct',
        '/life-channel/api/goods/{{goodsCode}}/struct', 'life-channel', 'zhongxiong.zeng', '查询商品结构');

INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`,
                                        `need_monitor`, `read_timeout`, `ignore_header_params`, `ignore_query_params`)
VALUES ('C00005', 'dev', 'Y', 100, 'N', NULL, 'Y', 100000, NULL, NULL);

INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `service_code`, `maintainer`,
                                `description`)
VALUES ('功能试算（包含折扣码和优惠券）', 'C00006', 'POST', '/life-market/api/calculators/trial',
        '/life-market/api/calculators/trial', 'life-market', 'zhongxiong.zeng', '功能试算（包含折扣码和优惠券）');

INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`,
                                        `need_monitor`, `read_timeout`, `ignore_header_params`, `ignore_query_params`)
VALUES ('C00006', 'dev', 'Y', 100, 'N', NULL, 'Y', 100000, NULL, NULL);
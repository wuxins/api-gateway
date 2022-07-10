TRUNCATE `api_gateway`.`api`;
TRUNCATE `api_gateway`.`api_version`;
TRUNCATE `api_gateway`.`group`;
TRUNCATE `api_gateway`.`api_group`;
TRUNCATE `api_gateway`.`tenant`;
TRUNCATE `api_gateway`.`api_tenant`;

INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('限流大小', 'API 编码', '方法', '前端访问源地址', '后台路由目标地址', '是否降级','负责人');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00001', 'GET', '/life-policy/policies', '/life-policy/outer/policies', 'N','刘轶材');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00002', 'GET', '/life-policy/policies/{{policyNo}}', '/life-policy/outer/policies/{{policyNo}}', 'N','刘轶材');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00003', 'GET', '/life-policy/pos/validation', '/life-policy/outer/pos/validation', 'TODO','吕晓龙');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00004', 'POST', '/life-policy/pos/application', '/life-policy/outer/pos/application', 'TODO','吕晓龙');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00005', 'GET', '/life-policy/pos/calculation', '/life-policy/outer/pos/calculation', 'TODO','吕晓龙');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00006', 'GET', '/life-policy/pos/customer/applications', '/life-policy/outer/pos/customer/applications', 'TODO','吕晓龙');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00007', 'GET', '/life-policy/pos/applications/search', '/life-policy/outer/pos/applications/search', 'TODO','吕晓龙');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00008', 'GET', '/life-policy/pos/{{applyNo}}', '/life-policy/outer/pos/{{applyNo}}', 'TODO','吕晓龙');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00009', 'GET', '/life-policy/pos/changeReason', '/life-policy/outer/pos/changeReason', 'TODO','吕晓龙');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00010', 'POST', '/life-login/login', '/life-login/outer/login', 'TODO','胡天佑');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00011', 'POST', '/life-login/isLogin', '/life-login/outer/isLogin', 'TODO','胡天佑');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00012', 'POST', '/life-insure/insures', '/life-insure/outer/insures', 'TODO','关棋文');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00013', 'GET', '/life-insure/insures/{{insureNo}}', '/life-insure/outer/insures/{{insureNo}}', 'TODO','关棋文');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00014', 'PUT', '/life-insure/insures/{{insureNo}}/status', '/life-insure/outer/insures/{{insureNo}}/status', 'TODO','关棋文');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00015', 'POST', '/life-insure/insures/searches', '/life-insure/outer/insures/searches', 'TODO','关棋文');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00016', 'POST', '/life-bill/bill/search', '/life-bill/outer/bill/search', 'N','赵萌');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00017', 'GET', '/life-dict/dicts/keys/{{key}}', '/life-dict/outer/dicts/keys/{{key}}', 'TODO','秦越鹏');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00018', 'GET', '/life-order/orders/{{orderNo}}', '/life-order/outer/orders/{{orderNo}}', 'TODO','关棋文');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00019', 'POST', '/life-order/orders/{{orderNo}}/payments', '/life-order/outer/orders/{{orderNo}}/payments', 'TODO','关棋文');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00020', 'GET', '/life-order/orders/{{orderNo}}/payments/{{paymentNo}}', '/life-order/outer/orders/{{orderNo}}/payments/{{paymentNo}}', 'TODO','关棋文');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00021', 'GET', '/life-order/orders/cards', '/life-order/outer/orders/cards', 'TODO','关棋文');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00022', 'POST', '/life-customer/customers/verification-code', '/life-customer/outer/customers/verification-code', 'TODO','胡天佑');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00023', 'POST', '/life-customer/customers/verification-code/checkout', '/life-customer/outer/customers/verification-code/checkout', 'TODO','胡天佑');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00024', 'PUT', '/life-customer/customers/changes', '/life-customer/outer/customers/changes', 'TODO','胡天佑');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00025', 'GET', '/life-customer/customers/insureds/searches', '/life-customer/outer/customers/insureds/searches', 'TODO','胡天佑');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00026', 'GET', '/life-customer/customer', '/life-customer/outer/customer', 'TODO','胡天佑');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00027', 'POST', '/life-claim/claims/fileSrcNo/operate', '/life-claim/outer/claims/fileSrcNo/operate', 'N','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00028', 'POST', '/life-claim/claims/file/key', '/life-claim/outer/claims/file/key', 'N','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00029', 'GET', '/life-claim/claims/public/hospitals', '/life-claim/outer/claims/public/hospitals', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00030', 'GET', '/life-claim/claims/private/hospitals', '/life-claim/outer/claims/private/hospitals', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00031', 'POST', '/life-claim/claims/dynamic/detail', '/life-claim/outer/claims/dynamic/detail', 'N','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00032', 'GET', '/life-claim/claims/{{fileCode}}', '/life-claim/outer/claims/{{fileCode}}', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00033', 'POST', '/life-claim/claims/file/fileSrcNo', '/life-claim/outer/claims/file/fileSrcNo', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00034', 'POST', '/life-claim/claims/mobile/download', '/life-claim/outer/claims/mobile/download', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00035', 'POST', '/life-claim/claims/mobile/upload', '/life-claim/outer/claims/mobile/upload', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00036', 'GET', '/life-claim/claims/applications/{{claimId}}', '/life-claim/outer/claims/applications/{{claimId}}', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00037', 'GET', '/life-claim/claims/insureds', '/life-claim/outer/claims/insureds', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00038', 'POST', '/life-claim/claims/draft', '/life-claim/outer/claims/draft', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00039', 'POST', '/life-claim/h5/fileSrcNo/operate', '/life-claim/outer/h5/fileSrcNo/operate', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('100', 'A00040', 'POST', '/life-claim/claims/evidence', '/life-claim/outer/claims/evidence', '100','韦帅');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00041', 'GET', '/life-market/{{goodsCode}}/trial-factors/ranges', '/life-market/outer/{{goodsCode}}/trial-factors/ranges', 'TODO','曾中雄');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00042', 'POST', '/life-market/calculators/trial', '/life-market/outer/calculators/trial', 'TODO','曾中雄');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00043', 'GET', '/life-market/goods-code/trial-factors', '/life-market/outer/goods-code/trial-factors', 'TODO','曾中雄');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00044', 'GET', '/life-market/goods/{{goodsCode}}/struct', '/life-market/outer/goods/{{goodsCode}}/struct', 'TODO','曾中雄');
INSERT INTO `api_gateway`.`api`(`name`, `api_code`, `method`, `src_url`, `des_url`, `description`,`maintainer`) VALUES ('TODO', 'A00045', 'GET', '/life-market/{{goodsCode}}/factors', '/life-market/outer/{{goodsCode}}/factors', 'TODO','曾中雄');

INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00001', 'dev', 'http://svc-zains-bm-policy-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00002', 'dev', 'http://svc-zains-bm-policy-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00003', 'dev', 'http://svc-zains-bm-policy-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00004', 'dev', 'http://svc-zains-bm-policy-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00005', 'dev', 'http://svc-zains-bm-policy-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00006', 'dev', 'http://svc-zains-bm-policy-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00007', 'dev', 'http://svc-zains-bm-policy-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00008', 'dev', 'http://svc-zains-bm-policy-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00009', 'dev', 'http://svc-zains-bm-policy-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00010', 'dev', 'http://svc-zains-bm-login-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00011', 'dev', 'http://svc-zains-bm-login-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00012', 'dev', 'http://svc-zains-bm-insure-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00013', 'dev', 'http://svc-zains-bm-insure-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00014', 'dev', 'http://svc-zains-bm-insure-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00015', 'dev', 'http://svc-zains-bm-insure-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00016', 'dev', 'http://svc-zains-bm-bill-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00017', 'dev', 'http://svc-zains-bm-dict-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00018', 'dev', 'http://svc-zains-bm-order-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00019', 'dev', 'http://svc-zains-bm-order-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00020', 'dev', 'http://svc-zains-bm-order-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00021', 'dev', 'http://svc-zains-bm-order-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00022', 'dev', 'http://svc-zains-bm-customer-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00023', 'dev', 'http://svc-zains-bm-customer-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00024', 'dev', 'http://svc-zains-bm-customer-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00025', 'dev', 'http://svc-zains-bm-customer-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00026', 'dev', 'http://svc-zains-bm-customer-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00027', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00028', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00029', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00030', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00031', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00032', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00033', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00034', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00035', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00036', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00037', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00038', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00039', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00040', 'dev', 'http://svc-zains-bm-claim-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00041', 'dev', 'http://svc-zains-bm-market-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00042', 'dev', 'http://svc-zains-bm-market-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00043', 'dev', 'http://svc-zains-bm-market-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00044', 'dev', 'http://svc-zains-bm-market-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');
INSERT INTO `api_gateway`.`api_version`(`api_code`, `env`, `upstream_host`, `need_rate_limit`, `rate_limit`, `need_fallback`, `fallback`, `need_monitor`, `read_timeout`) VALUES ('A00045', 'dev', 'http://svc-zains-bm-market-service.zains:8080', 'Y', '100', 'N', '{"success":"true}', 'Y', '10000');

INSERT INTO `api_gateway`.`tenant`(`name`, `tenant_code`) VALUES ('银保', 'bling');
INSERT INTO `api_gateway`.`tenant`(`name`, `tenant_code`) VALUES ('官网', 'website');

INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('API 编码', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('API 编码', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00001', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00001', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00002', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00002', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00003', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00003', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00004', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00004', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00005', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00005', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00006', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00006', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00007', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00007', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00008', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00008', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00009', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00009', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00010', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00010', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00011', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00011', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00012', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00012', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00013', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00013', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00014', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00014', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00015', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00015', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00016', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00016', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00017', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00017', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00018', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00018', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00019', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00019', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00020', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00020', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00021', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00021', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00022', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00022', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00023', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00023', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00024', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00024', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00025', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00025', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00026', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00026', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00027', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00027', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00028', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00028', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00029', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00029', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00030', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00030', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00031', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00031', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00032', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00032', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00033', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00033', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00034', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00034', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00035', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00035', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00036', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00036', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00037', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00037', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00038', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00038', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00039', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00039', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00040', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00040', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00041', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00041', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00042', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00042', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00043', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00043', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00044', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00044', 'website');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00045', 'bling');
INSERT INTO `api_gateway`.`api_tenant`(`api_code`, `tenant_code`) VALUES ('A00045', 'website');

INSERT INTO `api_gateway`.`group`(`name`, `group_code`) VALUES ('模块名称', '模块编码');
INSERT INTO `api_gateway`.`group`(`name`, `group_code`) VALUES ('保单', 'life-policy');
INSERT INTO `api_gateway`.`group`(`name`, `group_code`) VALUES ('登录', 'life-login');
INSERT INTO `api_gateway`.`group`(`name`, `group_code`) VALUES ('投保单', 'life-insure');
INSERT INTO `api_gateway`.`group`(`name`, `group_code`) VALUES ('账单', 'life-bill');
INSERT INTO `api_gateway`.`group`(`name`, `group_code`) VALUES ('字典', 'life-dict');
INSERT INTO `api_gateway`.`group`(`name`, `group_code`) VALUES ('订单', 'life-order');
INSERT INTO `api_gateway`.`group`(`name`, `group_code`) VALUES ('客户', 'life-customer');
INSERT INTO `api_gateway`.`group`(`name`, `group_code`) VALUES ('理赔', 'life-claim');
INSERT INTO `api_gateway`.`group`(`name`, `group_code`) VALUES ('营销', 'life-market');

INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('API 编码', '模块编码');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00001', 'life-policy');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00002', 'life-policy');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00003', 'life-policy');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00004', 'life-policy');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00005', 'life-policy');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00006', 'life-policy');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00007', 'life-policy');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00008', 'life-policy');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00009', 'life-policy');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00010', 'life-login');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00011', 'life-login');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00012', 'life-insure');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00013', 'life-insure');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00014', 'life-insure');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00015', 'life-insure');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00016', 'life-bill');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00017', 'life-dict');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00018', 'life-order');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00019', 'life-order');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00020', 'life-order');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00021', 'life-order');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00022', 'life-customer');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00023', 'life-customer');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00024', 'life-customer');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00025', 'life-customer');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00026', 'life-customer');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00027', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00028', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00029', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00030', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00031', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00032', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00033', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00034', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00035', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00036', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00037', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00038', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00039', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00040', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00041', 'life-claim');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00042', 'life-market');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00043', 'life-market');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00044', 'life-market');
INSERT INTO `api_gateway`.`api_group`(`api_code`, `group_code`) VALUES ('A00045', 'life-market');
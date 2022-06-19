use api_gateway;

INSERT INTO `api`
VALUES (100000000, '获取保单列表', 'A001', 'GET', '/life-policy/policies',
        '/life-policy/outer/policies', '获取保单列表', now(), now(), 'system', 'system', 'N'),
       (100000001, '获取保单详情', 'A002', 'GET', '/life-policy/policies/{{policyNo}}',
        '/life-policy/outer/policies/{{policyNo}}', '获取保单详情', now(), now(), 'system', 'system', 'N');

INSERT INTO `api_group`
VALUES (100000001, 'A001', 'life-policy', now(), now(), 'system', 'system', 'N'),
       (100000002, 'A002', 'life-policy', now(), now(), 'system', 'system', 'N');

INSERT INTO `api_tenant`
VALUES (100000000, 'A001', 'bling', now(), now(), 'system', 'system', 'N'),
       (100000001, 'A001', 'website', now(), now(), 'system', 'system', 'N'),
       (100000002, 'A002', 'bling', now(), now(), 'system', 'system', 'N'),
       (100000003, 'A002', 'website', now(), now(), 'system', 'system', 'N');

INSERT INTO `group`
VALUES (100000000, '保单', 'life-policy', now(), now(), 'system', 'system', 'N');

INSERT INTO `tenant`
VALUES (100000000, '银保', 'bling', now(), now(), 'system', 'system', 'N'),
       (100000001, '官网', 'website', now(), now(), 'system', 'system', 'N');

INSERT INTO `api_version`
VALUES (100000000, 'A001', 'dev', 'http://test:8888', 'Y', 100, 'N', NULL, 'Y', 5000,
        now(), now(), 'system', 'system', 'N'),
       (100000001, 'A001', 'test', 'http://test:8888', 'Y', 100, 'N', NULL, 'Y', 5000,
        now(), now(), 'system', 'system', 'N'),
       (100000002, 'A001', 'prd', 'http://test:8888', 'N', NULL, 'N', NULL, 'Y', 0,
        now(), now(), 'system', 'system', 'N'),
       (100000003, 'A002', 'dev', 'http://test:8888', 'N', NULL, 'N', NULL, 'Y', 0,
        now(), now(), 'system', 'system', 'N'),
       (100000004, 'A002', 'test', 'http://test:8888', 'N', NULL, 'N', NULL, 'Y', 0,
        now(), now(), 'system', 'system', 'N'),
       (100000005, 'A002', 'prd', 'http://test:8888', 'N', NULL, 'N', NULL, 'Y', 0,
        now(), now(), 'system', 'system', 'N');
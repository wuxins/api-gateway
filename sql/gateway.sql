-- ----------------------------
-- Table structure for t_api
-- ----------------------------
DROP TABLE IF EXISTS `t_api`;
CREATE TABLE `t_api`
(
    `id`           bigint(0)                                                NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'api name',
    `api_code`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'api code',
    `status`       tinyint(0)                                               NOT NULL DEFAULT 0 COMMENT 'api status (0-develop,1-test,2-online) ing',
    `maintainer`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'api who maintain',
    `description`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT 'api introduction',
    `gmt_created`  datetime(0)                                              NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime(0)                                              NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`      varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_code` (`api_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Api define'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_api_group
-- ----------------------------
DROP TABLE IF EXISTS `t_api_group`;
CREATE TABLE `t_api_group`
(
    `id`           bigint(0)                                              NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api code',
    `group_code`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT 'api group code',
    `gmt_created`  datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`      varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_api_group` (`api_code`, `group_code`, `is_deleted`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Api group mapping'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_api_version
-- ----------------------------
DROP TABLE IF EXISTS `t_api_version`;
CREATE TABLE `t_api_version`
(
    `id`                        bigint(0)                                                NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`                  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'api code',
    `method`                    varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL COMMENT 'api request method',
    `src_url`                   varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'api request origin url',
    `des_url`                   varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'api proxy forwarding url',
    `service_code`              varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'api service code',
    `content_type`              varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'api content type',
    `tenant_codes`              varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL COMMENT 'api tenant codes',
    `env`                       varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL COMMENT 'api env',
    `inner`                     char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT 'N' COMMENT 'inner api',
    `need_rate_limit`           char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT 'N' COMMENT 'rate limit switch',
    `rate_limit`                int(0)                                                   NULL     DEFAULT NULL COMMENT 'rate limit size',
    `need_breaker`              char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT 'N' COMMENT 'breaker switch',
    `breaker_err_per_threshold` int(0)                                                   NULL     DEFAULT NULL COMMENT 'breaker error percent threshold',
    `need_fallback`             char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT 'N' COMMENT 'fallback switch',
    `fallback`                  varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT 'fallback information',
    `need_monitor`              char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT 'Y' COMMENT 'monitor switch',
    `need_api_auth`             char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT 'Y' COMMENT 'api auth switch',
    `read_timeout`              int(0)                                                   NULL     DEFAULT 0 COMMENT 'api request timeout',
    `ignore_header_params`      varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT 'ignore header params',
    `ignore_query_params`       varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT 'ignore query params',
    `gmt_created`               datetime(0)                                              NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified`              datetime(0)                                              NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`                   varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`                  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`                char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_code` (`api_code`, `env`, `is_deleted`) USING BTREE,
    UNIQUE INDEX `idx_url_method` (`method`, `src_url`, `env`, `is_deleted`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Api version define'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_environment
-- ----------------------------
DROP TABLE IF EXISTS `t_environment`;
CREATE TABLE `t_environment`
(
    `id`           bigint(0)                                              NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'environment name',
    `env`          varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'environment code',
    `gmt_created`  datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`      varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_code` (`env`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Api environment define'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group`
(
    `id`           bigint(0)                                              NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT 'api group name',
    `group_code`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT 'api group code',
    `gmt_created`  datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`      varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_code` (`group_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Api classification'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_upstream_service
-- ----------------------------
DROP TABLE IF EXISTS `t_upstream_service`;
CREATE TABLE `t_upstream_service`
(
    `id`           bigint(0)                                              NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'service name',
    `service_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'service code',
    `gmt_created`  datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`      varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_code` (`service_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Api service define'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_upstream_service_version
-- ----------------------------
DROP TABLE IF EXISTS `t_upstream_service_version`;
CREATE TABLE `t_upstream_service_version`
(
    `id`           bigint(0)                                               NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `service_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'service code',
    `env`          varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'environment code',
    `address`      varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'service addresses',
    `gmt_created`  datetime(0)                                             NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime(0)                                             NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`      varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_code_env` (`service_code`, `env`, `is_deleted`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Upstream service version info'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_tenant_version
-- ----------------------------
DROP TABLE IF EXISTS `t_tenant_version`;
CREATE TABLE `t_tenant_version`
(
    `id`                   bigint(0)                                               NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`                 varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'tenant name',
    `env`                  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'tenant env',
    `tenant_key`           varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'tenant app key',
    `tenant_secret`        varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tenant app secret',
    `token_expire_in`      int(0)                                                  NOT NULL COMMENT 'token expire in',
    `token_expire_code`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'token expire return code',
    `token_expire_content` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'token expire return content',
    `gmt_created`          datetime(0)                                             NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified`         datetime(0)                                             NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`              varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`             varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`           char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_code` (`tenant_key`, `env`, `is_deleted`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Tenant version define'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_api_version_request
-- ----------------------------
DROP TABLE IF EXISTS `t_api_version_request`;
CREATE TABLE `t_api_version_request`
(
    `id`           bigint(0)                                                NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'api code',
    `env`          varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL COMMENT 'api env',
    `param_type`   varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci    NULL     DEFAULT NULL COMMENT 'api request param:body、query、path',
    `field_type`   varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'field type',
    `field_name`   varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'field',
    `gmt_created`  datetime(0)                                              NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime(0)                                              NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`      varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_api_code_env` (`api_code`, `env`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Api version request'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_api_version_response
-- ----------------------------
DROP TABLE IF EXISTS `t_api_version_response`;
CREATE TABLE `t_api_version_response`
(
    `id`           bigint(0)                                                NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'api code',
    `env`          varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL COMMENT 'api env',
    `field_type`   varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'field type',
    `field_name`   varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'field',
    `gmt_created`  datetime(0)                                              NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime(0)                                              NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`      varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_api_code_env` (`api_code`, `env`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Api version response'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_report_config
-- ----------------------------
DROP TABLE IF EXISTS `t_report_config`;
CREATE TABLE `t_report_config`
(
    `id`                   bigint(0)                                                NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `service_name`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'service name',
    `service_code`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'api service code',
    `env`                  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL COMMENT 'api env',
    `address`              varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'service addresses',
    `maintainer`           varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'who maintain',
    `need_rate_limit`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT 'N' COMMENT 'rate limit switch',
    `rate_limit`           int(0)                                                   NULL     DEFAULT NULL COMMENT 'rate limit size',
    `need_fallback`        char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT 'N' COMMENT 'fallback switch',
    `fallback`             varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT 'fallback information',
    `need_monitor`         char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT 'Y' COMMENT 'monitor switch',
    `read_timeout`         int(0)                                                   NULL     DEFAULT 0 COMMENT 'api request timeout',
    `ignore_header_params` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT 'ignore header params',
    `ignore_query_params`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT 'ignore query params',
    `gmt_created`          datetime(0)                                              NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified`         datetime(0)                                              NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
    `creator`              varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`             varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`           char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_code` (`service_code`, `env`, `is_deleted`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = 'Api version define'
  ROW_FORMAT = Compact;

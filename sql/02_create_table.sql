use
api_gateway;

drop table if exists `environment`;
CREATE TABLE `environment`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) NOT NULL COMMENT 'environment name',
    `env`          varchar(8)  NOT NULL COMMENT 'environment code',
    `gmt_created`  datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_code` (`env`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api environment define';

drop table if exists `upstream_service`;
CREATE TABLE `upstream_service`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) NOT NULL COMMENT 'service name',
    `service_code` varchar(32) NOT NULL COMMENT 'service code',
    `gmt_created`  datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_code` (`service_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api service define';

drop table if exists `api`;
CREATE TABLE `api`
(
    `id`           bigint       NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32)  NOT NULL COMMENT 'api name',
    `api_code`     varchar(32)  NOT NULL COMMENT 'api code',
    `method`       varchar(8)   NOT NULL COMMENT 'api request method',
    `src_url`      varchar(64)  NOT NULL COMMENT 'api request origin url',
    `des_url`      varchar(128) NOT NULL COMMENT 'api proxy forwarding url',
    `service_code` varchar(32)  NOT NULL COMMENT 'api service code',
    `maintainer`   varchar(64)  NOT NULL COMMENT 'api who maintain',
    `description`  varchar(2048)         DEFAULT NULL COMMENT 'api introduction',
    `gmt_created`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45)  NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45)  NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_url_method` (`method`, `src_url`),
    UNIQUE KEY `idx_code` (`api_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api define';

drop table if exists `upstream_service_env`;
CREATE TABLE `upstream_service_env`
(
    `id`           bigint       NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `service_code` varchar(32)  NOT NULL COMMENT 'service code',
    `env`          varchar(8)   NOT NULL COMMENT 'environment code',
    `address`      varchar(512) NOT NULL COMMENT 'service addresses',
    `gmt_created`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45)  NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45)  NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_code_env` (`service_code`, `env`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api service env info';

drop table if exists `api_version`;
CREATE TABLE `api_version`
(
    `id`                   bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`             varchar(32) NOT NULL COMMENT 'api code',
    `env`                  varchar(8)  NOT NULL COMMENT 'api env',
    `need_rate_limit`      char(1)              DEFAULT 'N' COMMENT 'rate limit switch',
    `rate_limit`           int                  DEFAULT NULL COMMENT 'rate limit size',
    `need_fallback`        char(1)              DEFAULT 'N' COMMENT 'fallback switch',
    `fallback`             varchar(2048)        DEFAULT NULL COMMENT 'fallback information',
    `need_monitor`         char(1)              DEFAULT 'Y' COMMENT 'monitor switch',
    `read_timeout`         int                  DEFAULT 0 COMMENT 'api request timeout',
    `ignore_header_params` varchar(1024)        DEFAULT NULL COMMENT 'ignore header params',
    `ignore_query_params`  varchar(1024)        DEFAULT NULL COMMENT 'ignore query params',
    `gmt_created`          datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified`         datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`              varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`             varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`           char(1)     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_code_env` (`api_code`, `env`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api version configuration';

drop table if exists `group`;
CREATE TABLE `group`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32)          DEFAULT NULL COMMENT 'api group name',
    `group_code`   varchar(32)          DEFAULT NULL COMMENT 'api group code',
    `gmt_created`  datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_code` (`group_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api classification';

drop table if exists `api_group`;
CREATE TABLE `api_group`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`     varchar(32) NOT NULL COMMENT 'api code',
    `group_code`   varchar(32)          DEFAULT NULL COMMENT 'api group code',
    `gmt_created`  datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_api_group` (`api_code`, `group_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api group mapping';

drop table if exists `audit_apply_info`;
CREATE TABLE `audit_apply_info`
(
    `id`           bigint        NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `type`         varchar(8)    NOT NULL COMMENT 'apply type',
    `apply_id`     bigint        NOT NULL COMMENT 'apply item id',
    `content`      varchar(2048) NOT NULL COMMENT 'apply content',
    `status`       char(1)       NOT NULL COMMENT 'apply status(0-submit,1-effective,2-cancel)',
    `gmt_created`  datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45)   NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45)   NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)       NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='apply audit info';


drop table if exists `t_environment`;
CREATE TABLE `t_environment`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) NOT NULL COMMENT 'environment name',
    `env`          varchar(8)  NOT NULL COMMENT 'environment code',
    `gmt_created`  datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_code` (`env`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api environment define';

drop table if exists `t_upstream_service`;
CREATE TABLE `t_upstream_service`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) NOT NULL COMMENT 'service name',
    `service_code` varchar(32) NOT NULL COMMENT 'service code',
    `gmt_created`  datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_code` (`service_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api service define';

drop table if exists `t_api`;
CREATE TABLE `t_api`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) NOT NULL COMMENT 'api name',
    `api_code`     varchar(32) NOT NULL COMMENT 'api code',
    `maintainer`   varchar(64) NOT NULL COMMENT 'api who maintain',
    `description`  varchar(2048)        DEFAULT NULL COMMENT 'api introduction',
    `gmt_created`  datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45) NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)     NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_code` (`api_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api define';

drop table if exists `t_upstream_service_version`;
CREATE TABLE `t_upstream_service_version`
(
    `id`           bigint       NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `service_code` varchar(32)  NOT NULL COMMENT 'service code',
    `env`          varchar(8)   NOT NULL COMMENT 'environment code',
    `address`      varchar(512) NOT NULL COMMENT 'service addresses',
    `gmt_created`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`      varchar(45)  NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`     varchar(45)  NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_code_env` (`service_code`, `env`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Upstream service version info';

drop table if exists `t_api_version`;
CREATE TABLE `t_api_version`
(
    `id`                   bigint       NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`             varchar(32)  NOT NULL COMMENT 'api code',
    `method`               varchar(8)   NOT NULL COMMENT 'api request method',
    `src_url`              varchar(64)  NOT NULL COMMENT 'api request origin url',
    `des_url`              varchar(128) NOT NULL COMMENT 'api proxy forwarding url',
    `service_code`         varchar(32)  NOT NULL COMMENT 'api service code',
    `env`                  varchar(8)   NOT NULL COMMENT 'api env',
    `need_rate_limit`      char(1)               DEFAULT 'N' COMMENT 'rate limit switch',
    `rate_limit`           int                   DEFAULT NULL COMMENT 'rate limit size',
    `need_fallback`        char(1)               DEFAULT 'N' COMMENT 'fallback switch',
    `fallback`             varchar(2048)         DEFAULT NULL COMMENT 'fallback information',
    `need_monitor`         char(1)               DEFAULT 'Y' COMMENT 'monitor switch',
    `read_timeout`         int                   DEFAULT 0 COMMENT 'api request timeout',
    `ignore_header_params` varchar(1024)         DEFAULT NULL COMMENT 'ignore header params',
    `ignore_query_params`  varchar(1024)         DEFAULT NULL COMMENT 'ignore query params',
    `gmt_created`          datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `gmt_modified`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT 'record updated time',
    `creator`              varchar(45)  NOT NULL DEFAULT 'system' COMMENT 'who created the record',
    `modifier`             varchar(45)  NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`           char(1)      NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_url_method` (`method`, `src_url`),
    UNIQUE KEY `idx_code` (`api_code`,`env`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api version define';
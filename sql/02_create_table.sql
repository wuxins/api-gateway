use api_gateway;

drop table if exists `environment`;
CREATE TABLE `environment`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) NOT NULL COMMENT 'environment name',
    `env`          varchar(8)  NOT NULL COMMENT 'environment code',
    `created_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`   varchar(255) DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`   varchar(255) DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_code` (`env`)
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
    `created_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`   varchar(255) DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`   varchar(255) DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_code` (`service_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api service define';

drop table if exists `tenant`;
CREATE TABLE `tenant`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) NOT NULL COMMENT 'api tenant name',
    `tenant_code`  varchar(32) NOT NULL COMMENT 'api tenant api id',
    `created_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`   varchar(255) DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`   varchar(255) DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_code` (`tenant_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api tenant or invoker';

drop table if exists `api`;
CREATE TABLE `api`
(
    `id`           bigint       NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32)  NOT NULL COMMENT 'api name',
    `api_code`     varchar(32)  NOT NULL COMMENT 'api code',
    `method`       varchar(8)   NOT NULL COMMENT 'api request method',
    `service_code` varchar(32)  NOT NULL COMMENT 'api service code',
    `src_url`      varchar(64)  NOT NULL COMMENT 'api request origin url',
    `des_url`      varchar(128) NOT NULL COMMENT 'api proxy forwarding url',
    `maintainer`   varchar(64)  NOT NULL COMMENT 'api who maintain',
    `description`  varchar(2048) DEFAULT NULL COMMENT 'api introduction',
    `created_time` datetime      DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time` datetime      DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`   varchar(255)  DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`   varchar(255)  DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)       DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_code` (`api_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api define';

drop table if exists `api_tenant`;
CREATE TABLE `api_tenant`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`     varchar(32) NOT NULL COMMENT 'api code',
    `tenant_code`  varchar(32)  DEFAULT NULL COMMENT 'api tenant code',
    `created_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`   varchar(255) DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`   varchar(255) DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_api_group` (`api_code`, `tenant_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api tenant mapping';

drop table if exists `tenant_env`;
CREATE TABLE `tenant_env`
(
    `id`                bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `tenant_code`       varchar(32) NOT NULL COMMENT 'api tenant api id',
    `env`               varchar(8)  NOT NULL COMMENT 'environment code',
    `need_api_auth`     char(1)      DEFAULT 'Y' COMMENT 'api auth switch',
    `api_auth_type`     char(1)      DEFAULT '0' COMMENT 'api auth type: 01 (Client mode)',
    `secret`            varchar(255) COMMENT 'api auth api secret',
    `token_sign_key`    varchar(64) COMMENT 'api token sign key',
    `token_sign_method` varchar(8) COMMENT 'api token sign method: (HS256,HS384,HS512)',
    `token_expire_in`   int COMMENT 'api token expire time',
    `token_expire_code` varchar(16) COMMENT 'api token expire time',
    `created_time`      datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time`      datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`        varchar(255) DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`        varchar(255) DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`        char(1)      DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_code` (`tenant_code`, `env`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api tenant or invoker env info';

drop table if exists `upstream_service_env`;
CREATE TABLE `upstream_service_env`
(
    `id`           bigint       NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `service_code` varchar(32)  NOT NULL COMMENT 'service code',
    `env`          varchar(8)   NOT NULL COMMENT 'environment code',
    `host`         varchar(512) NOT NULL COMMENT 'service addresses',
    `created_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`   varchar(255) DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`   varchar(255) DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_code` (`service_code`, `env`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api service env info';

drop table if exists `api_env`;
CREATE TABLE `api_env`
(
    `id`              bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`        varchar(32) NOT NULL COMMENT 'api code',
    `env`             varchar(8)  NOT NULL COMMENT 'api env',
    `need_rate_limit` char(1)       DEFAULT 'N' COMMENT 'rate limit switch',
    `rate_limit`      int           DEFAULT NULL COMMENT 'rate limit size',
    `need_fallback`   char(1)       DEFAULT 'N' COMMENT 'fallback switch',
    `fallback`        varchar(2048) DEFAULT NULL COMMENT 'fallback information',
    `need_monitor`    char(1)       DEFAULT 'Y' COMMENT 'monitor switch',
    `read_timeout`    int           DEFAULT 0 COMMENT 'api request timeout',
    `created_time`    datetime      DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time`    datetime      DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`      varchar(255)  DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`      varchar(255)  DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`      char(1)       DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_code` (`api_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api env configuration';

drop table if exists `group`;
CREATE TABLE `group`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32)  DEFAULT NULL COMMENT 'api group name',
    `group_code`   varchar(32)  DEFAULT NULL COMMENT 'api group code',
    `created_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`   varchar(255) DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`   varchar(255) DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_code` (`group_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api classification';

drop table if exists `api_group`;
CREATE TABLE `api_group`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`     varchar(32) NOT NULL COMMENT 'api code',
    `group_code`   varchar(32)  DEFAULT NULL COMMENT 'api group code',
    `created_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`   varchar(255) DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`   varchar(255) DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_api_group` (`api_code`, `group_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api group mapping';

drop table if exists `api_version_changelog`;
CREATE TABLE `api_version_changelog`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_id`       varchar(32) NOT NULL COMMENT 'api code',
    `before`       varchar(32) NOT NULL COMMENT 'before content',
    `after`        varchar(32) NOT NULL COMMENT 'after content',
    `tenant_code`  varchar(32) NOT NULL COMMENT 'api tenant, if (*) means common rules, other wise special tenant',
    `created_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
    `updated_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT 'record updated time',
    `created_by`   varchar(255) DEFAULT 'system' COMMENT 'who created the record',
    `updated_by`   varchar(255) DEFAULT 'system' COMMENT 'who updated the record',
    `is_deleted`   char(1)      DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100000000
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='Api version change log';

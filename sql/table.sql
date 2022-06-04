drop table if exists `api`;
CREATE TABLE `api`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) NOT NULL COMMENT 'api name',
    `api_code`     varchar(32) NOT NULL COMMENT 'api code',
    `method`       varchar(8)  NOT NULL COMMENT 'api request method',
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

drop table if exists `tenant`;
CREATE TABLE `tenant`
(
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32) NOT NULL COMMENT 'api tenant name',
    `tenant_code`  varchar(32) NOT NULL COMMENT 'api tenant code',
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

drop table if exists `api_version`;
CREATE TABLE `api_version`
(
    `id`              bigint       NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `api_code`        varchar(32)  NOT NULL COMMENT 'api code',
    `env`             varchar(32)  NOT NULL COMMENT 'api env',
    `src_url`         varchar(64)  NOT NULL COMMENT 'api request origin url',
    `des_url`         varchar(128) NOT NULL COMMENT 'api proxy forwarding url',
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
  ROW_FORMAT = COMPACT COMMENT ='Api configuration';
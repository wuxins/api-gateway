use api_gateway;


drop table if exists `service`;
CREATE TABLE `service`
(
    `id`           bigint       NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32)  NOT NULL COMMENT 'service name',
    `service_code` varchar(32)  NOT NULL COMMENT 'service code',
    `addresses`    varchar(512) NOT NULL COMMENT 'service addresses',
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


drop table if exists `api`;
CREATE TABLE `api`
(
    `id`           bigint       NOT NULL AUTO_INCREMENT COMMENT 'primary key',
    `name`         varchar(32)  NOT NULL COMMENT 'api name',
    `api_code`     varchar(32)  NOT NULL COMMENT 'api code',
    `method`       varchar(8)   NOT NULL COMMENT 'api request method',
    `service_code` varchar(8)   NOT NULL COMMENT 'api service code',
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
    `tenant_code`     varchar(32)  NOT NULL COMMENT 'api tenant, if (*) means common rules, other wise special tenant',
    `upstream_host`   varchar(128) NOT NULL COMMENT 'api upstream server host',
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
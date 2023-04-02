-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pid`         bigint(0) NULL DEFAULT NULL COMMENT '上级部门',
    `sub_count`   int(0) NULL DEFAULT 0 COMMENT '子部门数目',
    `name`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
    `dept_sort`   int(0) NULL DEFAULT 999 COMMENT '排序',
    `enabled`     bit(1)                                                  NOT NULL COMMENT '状态',
    `create_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `update_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE,
    INDEX         `inx_pid` (`pid`) USING BTREE,
    INDEX         `inx_enabled` (`enabled`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '部门'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept`
VALUES (18, NULL, 1, '保险研发', 999, b'1', 'admin', 'admin', '2023-02-24 22:13:48', '2023-02-28 11:53:11');
INSERT INTO `sys_dept`
VALUES (19, 18, 0, '开发', 999, b'1', 'admin', 'admin', '2023-02-24 22:14:17', '2023-02-24 22:14:17');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`
(
    `dict_id`     bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
    `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
    `create_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `update_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '数据字典'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict`
VALUES (1, 'user_status', '用户状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict`
VALUES (4, 'dept_status', '部门状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict`
VALUES (5, 'job_status', '岗位状态', NULL, NULL, '2019-10-27 20:31:36', NULL);

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail`
(
    `detail_id`   bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `dict_id`     bigint(0) NULL DEFAULT NULL COMMENT '字典id',
    `label`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典标签',
    `value`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
    `dict_sort`   int(0) NULL DEFAULT NULL COMMENT '排序',
    `create_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `update_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`detail_id`) USING BTREE,
    INDEX         `FK5tpkputc6d9nboxojdbgnpmyb` (`dict_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '数据字典详情'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
INSERT INTO `sys_dict_detail`
VALUES (1, 1, '激活', 'true', 1, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail`
VALUES (2, 1, '禁用', 'false', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail`
VALUES (3, 4, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail`
VALUES (4, 4, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail`
VALUES (5, 5, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail`
VALUES (6, 5, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`
(
    `job_id`      bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
    `enabled`     bit(1)                                                  NOT NULL COMMENT '岗位状态',
    `job_sort`    int(0) NULL DEFAULT NULL COMMENT '排序',
    `create_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `update_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`job_id`) USING BTREE,
    UNIQUE INDEX `uniq_name` (`name`) USING BTREE,
    INDEX         `inx_enabled` (`enabled`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '岗位'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job`
VALUES (11, '开发', b'1', 2, NULL, 'admin', '2019-03-31 13:39:30', '2023-02-24 22:15:17');
INSERT INTO `sys_job`
VALUES (12, '测试', b'1', 5, NULL, 'admin', '2019-03-31 13:39:43', '2023-02-24 22:15:27');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pid`         bigint(0) NULL DEFAULT NULL COMMENT '上级菜单ID',
    `sub_count`   int(0) NULL DEFAULT 0 COMMENT '子菜单数目',
    `type`        int(0) NULL DEFAULT NULL COMMENT '菜单类型',
    `title`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
    `name`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
    `component`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
    `menu_sort`   int(0) NULL DEFAULT NULL COMMENT '排序',
    `icon`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
    `path`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
    `i_frame`     bit(1) NULL DEFAULT NULL COMMENT '是否外链',
    `cache`       bit(1) NULL DEFAULT b'0' COMMENT '缓存',
    `hidden`      bit(1) NULL DEFAULT b'0' COMMENT '隐藏',
    `permission`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
    `create_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `update_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`menu_id`) USING BTREE,
    UNIQUE INDEX `uniq_title` (`title`) USING BTREE,
    UNIQUE INDEX `uniq_name` (`name`) USING BTREE,
    INDEX         `inx_pid` (`pid`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 123
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '系统菜单'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, NULL, 6, 0, '系统管理', NULL, NULL, 1, 'system', 'system', b'0', b'0', b'0', NULL, NULL, NULL,
        '2018-12-18 15:11:29', NULL);
INSERT INTO `sys_menu`
VALUES (2, 1, 3, 1, '用户管理', 'User', 'system/user/index', 2, 'peoples', 'user', b'0', b'0', b'0', 'user:list', NULL,
        NULL, '2018-12-18 15:14:44',
        NULL);
INSERT INTO `sys_menu`
VALUES (3, 1, 3, 1, '角色管理', 'Role', 'system/role/index', 3, 'role', 'role', b'0', b'0', b'0', 'roles:list', NULL, NULL,
        '2018-12-18 15:16:07',
        NULL);
INSERT INTO `sys_menu`
VALUES (5, 1, 3, 1, '菜单管理', 'Menu', 'system/menu/index', 5, 'menu', 'menu', b'0', b'0', b'0', 'menu:list', NULL, NULL,
        '2018-12-18 15:17:28',
        NULL);
INSERT INTO `sys_menu`
VALUES (6, NULL, 3, 0, '系统监控', NULL, NULL, 10, 'monitor', 'monitor', b'0', b'0', b'0', NULL, NULL, NULL,
        '2018-12-18 15:17:48', NULL);
INSERT INTO `sys_menu`
VALUES (9, 6, 0, 1, 'SQL监控', 'Sql', 'monitor/sql/index', 18, 'sqlMonitor', 'druid', b'0', b'0', b'0', NULL, NULL, NULL,
        '2018-12-18 15:19:34',
        NULL);
INSERT INTO `sys_menu`
VALUES (10, NULL, 5, 0, '组件管理', NULL, NULL, 50, 'zujian', 'components', b'0', b'0', b'0', NULL, NULL, NULL,
        '2018-12-19 13:38:16', NULL);
INSERT INTO `sys_menu`
VALUES (11, 10, 0, 1, '图标库', 'Icons', 'components/icons/index', 51, 'icon', 'icon', b'0', b'0', b'0', NULL, NULL, NULL,
        '2018-12-19 13:38:49',
        NULL);
INSERT INTO `sys_menu`
VALUES (15, 10, 0, 1, '富文本', 'Editor', 'components/Editor', 52, 'fwb', 'tinymce', b'0', b'0', b'0', NULL, NULL, NULL,
        '2018-12-27 11:58:25', NULL);
INSERT INTO `sys_menu`
VALUES (30, 36, 0, 1, '代码生成', 'GeneratorIndex', 'generator/index', 32, 'dev', 'generator', b'0', b'1', b'0', NULL, NULL,
        NULL,
        '2019-01-11 15:45:55', NULL);
INSERT INTO `sys_menu`
VALUES (33, 10, 0, 1, 'Markdown', 'Markdown', 'components/MarkDown', 53, 'markdown', 'markdown', b'0', b'0', b'0', NULL,
        NULL, NULL,
        '2019-03-08 13:46:44', NULL);
INSERT INTO `sys_menu`
VALUES (34, 10, 0, 1, 'Yaml编辑器', 'YamlEdit', 'components/YamlEdit', 54, 'dev', 'yaml', b'0', b'0', b'0', NULL, NULL,
        NULL, '2019-03-08 15:49:40',
        NULL);
INSERT INTO `sys_menu`
VALUES (35, 1, 3, 1, '部门管理', 'Dept', 'system/dept/index', 6, 'dept', 'dept', b'0', b'0', b'0', 'dept:list', NULL, NULL,
        '2019-03-25 09:46:00',
        NULL);
INSERT INTO `sys_menu`
VALUES (36, NULL, 4, 0, '系统工具', NULL, '', 30, 'sys-tools', 'sys-tools', b'0', b'0', b'0', NULL, NULL, NULL,
        '2019-03-29 10:57:35', NULL);
INSERT INTO `sys_menu`
VALUES (37, 1, 3, 1, '岗位管理', 'Job', 'system/job/index', 7, 'Steve-Jobs', 'job', b'0', b'0', b'0', 'job:list', NULL,
        NULL, '2019-03-29 13:51:18',
        NULL);
INSERT INTO `sys_menu`
VALUES (38, 36, 0, 1, '接口文档', 'Swagger', 'tools/swagger/index', 36, 'swagger', 'swagger2', b'0', b'0', b'0', NULL, NULL,
        NULL,
        '2019-03-29 19:57:53', NULL);
INSERT INTO `sys_menu`
VALUES (39, 1, 3, 1, '字典管理', 'Dict', 'system/dict/index', 8, 'dictionary', 'dict', b'0', b'0', b'0', 'dict:list', NULL,
        NULL,
        '2019-04-10 11:49:04', NULL);
INSERT INTO `sys_menu`
VALUES (41, 6, 0, 1, '在线用户', 'OnlineUser', 'monitor/online/index', 10, 'Steve-Jobs', 'online', b'0', b'0', b'0', NULL,
        NULL, NULL,
        '2019-10-26 22:08:43', NULL);
INSERT INTO `sys_menu`
VALUES (44, 2, 0, 2, '用户新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'user:add', NULL, NULL, '2019-10-29 10:59:46',
        NULL);
INSERT INTO `sys_menu`
VALUES (45, 2, 0, 2, '用户编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'user:edit', NULL, NULL, '2019-10-29 11:00:08',
        NULL);
INSERT INTO `sys_menu`
VALUES (46, 2, 0, 2, '用户删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'user:del', NULL, NULL, '2019-10-29 11:00:23',
        NULL);
INSERT INTO `sys_menu`
VALUES (48, 3, 0, 2, '角色创建', NULL, '', 2, '', '', b'0', b'0', b'0', 'roles:add', NULL, NULL, '2019-10-29 12:45:34',
        NULL);
INSERT INTO `sys_menu`
VALUES (49, 3, 0, 2, '角色修改', NULL, '', 3, '', '', b'0', b'0', b'0', 'roles:edit', NULL, NULL, '2019-10-29 12:46:16',
        NULL);
INSERT INTO `sys_menu`
VALUES (50, 3, 0, 2, '角色删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'roles:del', NULL, NULL, '2019-10-29 12:46:51',
        NULL);
INSERT INTO `sys_menu`
VALUES (52, 5, 0, 2, '菜单新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'menu:add', NULL, NULL, '2019-10-29 12:55:07',
        NULL);
INSERT INTO `sys_menu`
VALUES (53, 5, 0, 2, '菜单编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'menu:edit', NULL, NULL, '2019-10-29 12:55:40',
        NULL);
INSERT INTO `sys_menu`
VALUES (54, 5, 0, 2, '菜单删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'menu:del', NULL, NULL, '2019-10-29 12:56:00',
        NULL);
INSERT INTO `sys_menu`
VALUES (56, 35, 0, 2, '部门新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dept:add', NULL, NULL, '2019-10-29 12:57:09',
        NULL);
INSERT INTO `sys_menu`
VALUES (57, 35, 0, 2, '部门编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dept:edit', NULL, NULL, '2019-10-29 12:57:27',
        NULL);
INSERT INTO `sys_menu`
VALUES (58, 35, 0, 2, '部门删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dept:del', NULL, NULL, '2019-10-29 12:57:41',
        NULL);
INSERT INTO `sys_menu`
VALUES (60, 37, 0, 2, '岗位新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'job:add', NULL, NULL, '2019-10-29 12:58:27',
        NULL);
INSERT INTO `sys_menu`
VALUES (61, 37, 0, 2, '岗位编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'job:edit', NULL, NULL, '2019-10-29 12:58:45',
        NULL);
INSERT INTO `sys_menu`
VALUES (62, 37, 0, 2, '岗位删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'job:del', NULL, NULL, '2019-10-29 12:59:04',
        NULL);
INSERT INTO `sys_menu`
VALUES (64, 39, 0, 2, '字典新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dict:add', NULL, NULL, '2019-10-29 13:00:17',
        NULL);
INSERT INTO `sys_menu`
VALUES (65, 39, 0, 2, '字典编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dict:edit', NULL, NULL, '2019-10-29 13:00:42',
        NULL);
INSERT INTO `sys_menu`
VALUES (66, 39, 0, 2, '字典删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dict:del', NULL, NULL, '2019-10-29 13:00:59',
        NULL);
INSERT INTO `sys_menu`
VALUES (80, 6, 0, 1, '服务监控', 'ServerMonitor', 'monitor/server/index', 14, 'codeConsole', 'server', b'0', b'0', b'0',
        'monitor:list', NULL,
        'admin', '2019-11-07 13:06:39', '2020-05-04 18:20:50');
INSERT INTO `sys_menu`
VALUES (82, 36, 0, 1, '生成配置', 'GeneratorConfig', 'generator/config', 33, 'dev', 'generator/config/:tableName', b'0',
        b'1', b'1', '', NULL, NULL,
        '2019-11-17 20:08:56', NULL);
INSERT INTO `sys_menu`
VALUES (83, 10, 0, 1, '图表库', 'Echarts', 'components/Echarts', 50, 'chart', 'echarts', b'0', b'1', b'0', '', NULL, NULL,
        '2019-11-21 09:04:32',
        NULL);
INSERT INTO `sys_menu`
VALUES (116, 36, 0, 1, '生成预览', 'Preview', 'generator/preview', 999, 'java', 'generator/preview/:tableName', b'0', b'1',
        b'1', NULL, NULL, NULL,
        '2019-11-26 14:54:36', NULL);
INSERT INTO `sys_menu`
VALUES (118, NULL, 4, 0, '网关管理', NULL, NULL, 999, 'app', 'gateway', b'0', b'0', b'0', NULL, 'admin', 'admin',
        '2023-02-24 22:17:06',
        '2023-03-03 14:36:47');
INSERT INTO `sys_menu`
VALUES (119, 118, 0, 1, '环境管理', 'env', 'gateway/env/index', 999, 'list', 'env', b'0', b'0', b'0', 'environment:list',
        'admin', 'admin',
        '2023-02-24 22:20:18', '2023-03-03 14:33:51');
INSERT INTO `sys_menu`
VALUES (120, 118, 0, 1, '分组管理', 'group', 'gateway/group/index', 999, 'list', 'group', b'0', b'0', b'0', 'group:list',
        'admin', 'admin',
        '2023-02-25 20:00:52', '2023-03-03 14:34:41');
INSERT INTO `sys_menu`
VALUES (121, 118, 0, 1, '上游应用', 'upstreamService', 'gateway/service/index', 999, 'list', 'upstreamService', b'0', b'0',
        b'0',
        'upstreamService:list', 'admin', 'admin', '2023-02-25 20:02:09', '2023-03-03 14:34:50');
INSERT INTO `sys_menu`
VALUES (122, 118, 0, 1, 'API管理', 'api', 'gateway/api/index', 999, 'list', 'apiVersion', b'0', b'0', b'0',
        'apiVersion:list', 'admin', 'admin',
        '2023-02-25 20:02:54', '2023-03-03 14:34:58');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`     bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
    `level`       int(0) NULL DEFAULT NULL COMMENT '角色级别',
    `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
    `data_scope`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据权限',
    `create_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `update_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`role_id`) USING BTREE,
    UNIQUE INDEX `uniq_name` (`name`) USING BTREE,
    INDEX         `role_name_index` (`name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 1, '-', '全部', NULL, 'admin', '2018-11-23 11:04:37', '2023-03-07 20:11:48');
INSERT INTO `sys_role`
VALUES (3, '开发人员', 3, NULL, '全部', 'admin', 'admin', '2023-02-24 22:21:20', '2023-03-03 14:11:28');

-- ----------------------------
-- Table structure for sys_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_depts`;
CREATE TABLE `sys_roles_depts`
(
    `role_id` bigint(0) NOT NULL,
    `dept_id` bigint(0) NOT NULL,
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE,
    INDEX     `FK7qg6itn5ajdoa9h9o78v9ksur` (`dept_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色部门关联'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus`
(
    `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
    `role_id` bigint(0) NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`menu_id`, `role_id`) USING BTREE,
    INDEX     `FKcngg2qadojhi3a651a5adkvbq` (`role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色菜单关联'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
INSERT INTO `sys_roles_menus`
VALUES (1, 1);
INSERT INTO `sys_roles_menus`
VALUES (2, 1);
INSERT INTO `sys_roles_menus`
VALUES (3, 1);
INSERT INTO `sys_roles_menus`
VALUES (5, 1);
INSERT INTO `sys_roles_menus`
VALUES (35, 1);
INSERT INTO `sys_roles_menus`
VALUES (37, 1);
INSERT INTO `sys_roles_menus`
VALUES (39, 1);
INSERT INTO `sys_roles_menus`
VALUES (44, 1);
INSERT INTO `sys_roles_menus`
VALUES (45, 1);
INSERT INTO `sys_roles_menus`
VALUES (46, 1);
INSERT INTO `sys_roles_menus`
VALUES (48, 1);
INSERT INTO `sys_roles_menus`
VALUES (49, 1);
INSERT INTO `sys_roles_menus`
VALUES (50, 1);
INSERT INTO `sys_roles_menus`
VALUES (52, 1);
INSERT INTO `sys_roles_menus`
VALUES (53, 1);
INSERT INTO `sys_roles_menus`
VALUES (54, 1);
INSERT INTO `sys_roles_menus`
VALUES (56, 1);
INSERT INTO `sys_roles_menus`
VALUES (57, 1);
INSERT INTO `sys_roles_menus`
VALUES (58, 1);
INSERT INTO `sys_roles_menus`
VALUES (60, 1);
INSERT INTO `sys_roles_menus`
VALUES (61, 1);
INSERT INTO `sys_roles_menus`
VALUES (62, 1);
INSERT INTO `sys_roles_menus`
VALUES (64, 1);
INSERT INTO `sys_roles_menus`
VALUES (65, 1);
INSERT INTO `sys_roles_menus`
VALUES (66, 1);
INSERT INTO `sys_roles_menus`
VALUES (118, 1);
INSERT INTO `sys_roles_menus`
VALUES (119, 1);
INSERT INTO `sys_roles_menus`
VALUES (120, 1);
INSERT INTO `sys_roles_menus`
VALUES (121, 1);
INSERT INTO `sys_roles_menus`
VALUES (122, 1);
INSERT INTO `sys_roles_menus`
VALUES (118, 3);
INSERT INTO `sys_roles_menus`
VALUES (119, 3);
INSERT INTO `sys_roles_menus`
VALUES (120, 3);
INSERT INTO `sys_roles_menus`
VALUES (121, 3);
INSERT INTO `sys_roles_menus`
VALUES (122, 3);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`        bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `dept_id`        bigint(0) NULL DEFAULT NULL COMMENT '部门名称',
    `username`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
    `nick_name`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
    `gender`         varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
    `phone`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
    `email`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `avatar_name`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
    `avatar_path`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像真实路径',
    `password`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
    `is_admin`       bit(1) NULL DEFAULT b'0' COMMENT '是否为admin账号',
    `enabled`        bigint(0) NULL DEFAULT NULL COMMENT '状态：1启用、0禁用',
    `create_by`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `update_by`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `pwd_reset_time` datetime(0) NULL DEFAULT NULL COMMENT '修改密码的时间',
    `create_time`    datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
    `update_time`    datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`user_id`) USING BTREE,
    UNIQUE INDEX `UK_kpubos9gc2cvtkb0thktkbkes` (`email`) USING BTREE,
    UNIQUE INDEX `username` (`username`) USING BTREE,
    UNIQUE INDEX `uniq_username` (`username`) USING BTREE,
    UNIQUE INDEX `uniq_email` (`email`) USING BTREE,
    INDEX            `FK5rwmryny6jthaaxkogownknqp` (`dept_id`) USING BTREE,
    INDEX            `FKpq2dhypk2qgt68nauh2by22jb` (`avatar_name`) USING BTREE,
    INDEX            `inx_enabled` (`enabled`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '系统用户'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 18, 'admin', '管理员', '男', '18888888888', '201507802@qq.com', 'avatar-20200806032259161.png',
        '/Users/jie/Documents/work/me/admin/eladmin/~/avatar/avatar-20200806032259161.png',
        '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'1', 1, NULL, 'admin', '2020-05-03 16:38:31',
        '2018-08-23 09:11:56',
        '2023-02-28 11:52:23');
INSERT INTO `sys_user`
VALUES (3, 18, 'qiwen.guan', 'QQ', '男', '18688888888', '18688888888@za.group', NULL, NULL,
        '$2a$10$o1v./jpACwYvynp.Dux/QehHOjIB6QMc9cqkfR3xu8dDVSNEa1Ot2', b'0', 1, 'admin', 'admin', NULL,
        '2023-02-27 18:03:12',
        '2023-03-07 21:35:20');

-- ----------------------------
-- Table structure for sys_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_jobs`;
CREATE TABLE `sys_users_jobs`
(
    `user_id` bigint(0) NOT NULL COMMENT '用户ID',
    `job_id`  bigint(0) NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`, `job_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users_jobs
-- ----------------------------
INSERT INTO `sys_users_jobs`
VALUES (1, 11);
INSERT INTO `sys_users_jobs`
VALUES (3, 11);

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles`
(
    `user_id` bigint(0) NOT NULL COMMENT '用户ID',
    `role_id` bigint(0) NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
    INDEX     `FKq4eq273l04bpu4efj0jd0jb98` (`role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '用户角色关联'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
INSERT INTO `sys_users_roles`
VALUES (1, 1);
INSERT INTO `sys_users_roles`
VALUES (3, 3);
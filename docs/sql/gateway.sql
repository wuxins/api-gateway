/*
 Navicat Premium Data Transfer

 Source Server         : 中台sit
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : rm-3nshepo7yhgy42tcm.mysql.rds.aliyuncs.com:3303
 Source Schema         : api_gateway

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 09/06/2023 15:11:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(0) NULL DEFAULT NULL COMMENT '上级部门',
  `sub_count` int(0) NULL DEFAULT 0 COMMENT '子部门数目',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `dept_sort` int(0) NULL DEFAULT 999 COMMENT '排序',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  INDEX `inx_pid`(`pid`) USING BTREE,
  INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (18, NULL, 1, '保险研发', 999, b'1', 'admin', 'admin', '2023-02-24 22:13:48', '2023-02-28 11:53:11');
INSERT INTO `sys_dept` VALUES (19, 18, 0, '开发', 999, b'1', 'admin', 'admin', '2023-02-24 22:14:17', '2023-02-24 22:14:17');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'user_status', '用户状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict` VALUES (4, 'dept_status', '部门状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict` VALUES (5, 'job_status', '岗位状态', NULL, 'admin', '2019-10-27 20:31:36', '2023-06-01 19:25:31');

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail`  (
  `detail_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint(0) NULL DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `dict_sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `FK5tpkputc6d9nboxojdbgnpmyb`(`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
INSERT INTO `sys_dict_detail` VALUES (1, 1, '激活', 'true', 1, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail` VALUES (2, 1, '禁用', 'false', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (3, 4, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (4, 4, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail` VALUES (5, 5, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (6, 5, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
  INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (11, '开发', b'1', 2, NULL, 'admin', '2019-03-31 13:39:30', '2023-02-24 22:15:17');
INSERT INTO `sys_job` VALUES (12, '测试', b'1', 5, NULL, 'admin', '2019-03-31 13:39:43', '2023-02-24 22:15:27');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(0) NULL DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int(0) NULL DEFAULT 0 COMMENT '子菜单数目',
  `type` int(0) NULL DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `menu_sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `i_frame` bit(1) NULL DEFAULT NULL COMMENT '是否外链',
  `cache` bit(1) NULL DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) NULL DEFAULT b'0' COMMENT '隐藏',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE INDEX `uniq_title`(`title`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
  INDEX `inx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, NULL, 6, 0, '系统管理', NULL, NULL, 1, 'system', 'system', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:11:29', NULL);
INSERT INTO `sys_menu` VALUES (2, 1, 3, 1, '用户管理', 'User', 'system/user/index', 2, 'peoples', 'user', b'0', b'0', b'0', 'user:list', NULL, NULL, '2018-12-18 15:14:44', NULL);
INSERT INTO `sys_menu` VALUES (3, 1, 3, 1, '角色管理', 'Role', 'system/role/index', 3, 'role', 'role', b'0', b'0', b'0', 'roles:list', NULL, NULL, '2018-12-18 15:16:07', NULL);
INSERT INTO `sys_menu` VALUES (5, 1, 3, 1, '菜单管理', 'Menu', 'system/menu/index', 5, 'menu', 'menu', b'0', b'0', b'0', 'menu:list', NULL, NULL, '2018-12-18 15:17:28', NULL);
INSERT INTO `sys_menu` VALUES (6, NULL, 3, 0, '系统监控', NULL, NULL, 10, 'monitor', 'monitor', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:17:48', NULL);
INSERT INTO `sys_menu` VALUES (9, 6, 0, 1, 'SQL监控', 'Sql', 'monitor/sql/index', 18, 'sqlMonitor', 'druid', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:19:34', NULL);
INSERT INTO `sys_menu` VALUES (10, NULL, 5, 0, '组件管理', NULL, NULL, 50, 'zujian', 'components', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-19 13:38:16', NULL);
INSERT INTO `sys_menu` VALUES (11, 10, 0, 1, '图标库', 'Icons', 'components/icons/index', 51, 'icon', 'icon', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-19 13:38:49', NULL);
INSERT INTO `sys_menu` VALUES (15, 10, 0, 1, '富文本', 'Editor', 'components/Editor', 52, 'fwb', 'tinymce', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-27 11:58:25', NULL);
INSERT INTO `sys_menu` VALUES (30, 36, 0, 1, '代码生成', 'GeneratorIndex', 'generator/index', 32, 'dev', 'generator', b'0', b'1', b'0', NULL, NULL, NULL, '2019-01-11 15:45:55', NULL);
INSERT INTO `sys_menu` VALUES (33, 10, 0, 1, 'Markdown', 'Markdown', 'components/MarkDown', 53, 'markdown', 'markdown', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-08 13:46:44', NULL);
INSERT INTO `sys_menu` VALUES (34, 10, 0, 1, 'Yaml编辑器', 'YamlEdit', 'components/YamlEdit', 54, 'dev', 'yaml', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-08 15:49:40', NULL);
INSERT INTO `sys_menu` VALUES (35, 1, 3, 1, '部门管理', 'Dept', 'system/dept/index', 6, 'dept', 'dept', b'0', b'0', b'0', 'dept:list', NULL, NULL, '2019-03-25 09:46:00', NULL);
INSERT INTO `sys_menu` VALUES (36, NULL, 4, 0, '系统工具', NULL, '', 30, 'sys-tools', 'sys-tools', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-29 10:57:35', NULL);
INSERT INTO `sys_menu` VALUES (37, 1, 3, 1, '岗位管理', 'Job', 'system/job/index', 7, 'Steve-Jobs', 'job', b'0', b'0', b'0', 'job:list', NULL, NULL, '2019-03-29 13:51:18', NULL);
INSERT INTO `sys_menu` VALUES (38, 36, 0, 1, '接口文档', 'Swagger', 'tools/swagger/index', 36, 'swagger', 'swagger2', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-29 19:57:53', NULL);
INSERT INTO `sys_menu` VALUES (39, 1, 3, 1, '字典管理', 'Dict', 'system/dict/index', 8, 'dictionary', 'dict', b'0', b'0', b'0', 'dict:list', NULL, NULL, '2019-04-10 11:49:04', NULL);
INSERT INTO `sys_menu` VALUES (41, 6, 0, 1, '在线用户', 'OnlineUser', 'monitor/online/index', 10, 'Steve-Jobs', 'online', b'0', b'0', b'0', NULL, NULL, NULL, '2019-10-26 22:08:43', NULL);
INSERT INTO `sys_menu` VALUES (44, 2, 0, 2, '用户新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'user:add', NULL, NULL, '2019-10-29 10:59:46', NULL);
INSERT INTO `sys_menu` VALUES (45, 2, 0, 2, '用户编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'user:edit', NULL, NULL, '2019-10-29 11:00:08', NULL);
INSERT INTO `sys_menu` VALUES (46, 2, 0, 2, '用户删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'user:del', NULL, NULL, '2019-10-29 11:00:23', NULL);
INSERT INTO `sys_menu` VALUES (48, 3, 0, 2, '角色创建', NULL, '', 2, '', '', b'0', b'0', b'0', 'roles:add', NULL, NULL, '2019-10-29 12:45:34', NULL);
INSERT INTO `sys_menu` VALUES (49, 3, 0, 2, '角色修改', NULL, '', 3, '', '', b'0', b'0', b'0', 'roles:edit', NULL, NULL, '2019-10-29 12:46:16', NULL);
INSERT INTO `sys_menu` VALUES (50, 3, 0, 2, '角色删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'roles:del', NULL, NULL, '2019-10-29 12:46:51', NULL);
INSERT INTO `sys_menu` VALUES (52, 5, 0, 2, '菜单新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'menu:add', NULL, NULL, '2019-10-29 12:55:07', NULL);
INSERT INTO `sys_menu` VALUES (53, 5, 0, 2, '菜单编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'menu:edit', NULL, NULL, '2019-10-29 12:55:40', NULL);
INSERT INTO `sys_menu` VALUES (54, 5, 0, 2, '菜单删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'menu:del', NULL, NULL, '2019-10-29 12:56:00', NULL);
INSERT INTO `sys_menu` VALUES (56, 35, 0, 2, '部门新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dept:add', NULL, NULL, '2019-10-29 12:57:09', NULL);
INSERT INTO `sys_menu` VALUES (57, 35, 0, 2, '部门编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dept:edit', NULL, NULL, '2019-10-29 12:57:27', NULL);
INSERT INTO `sys_menu` VALUES (58, 35, 0, 2, '部门删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dept:del', NULL, NULL, '2019-10-29 12:57:41', NULL);
INSERT INTO `sys_menu` VALUES (60, 37, 0, 2, '岗位新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'job:add', NULL, NULL, '2019-10-29 12:58:27', NULL);
INSERT INTO `sys_menu` VALUES (61, 37, 0, 2, '岗位编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'job:edit', NULL, NULL, '2019-10-29 12:58:45', NULL);
INSERT INTO `sys_menu` VALUES (62, 37, 0, 2, '岗位删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'job:del', NULL, NULL, '2019-10-29 12:59:04', NULL);
INSERT INTO `sys_menu` VALUES (64, 39, 0, 2, '字典新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dict:add', NULL, NULL, '2019-10-29 13:00:17', NULL);
INSERT INTO `sys_menu` VALUES (65, 39, 0, 2, '字典编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dict:edit', NULL, NULL, '2019-10-29 13:00:42', NULL);
INSERT INTO `sys_menu` VALUES (66, 39, 0, 2, '字典删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dict:del', NULL, NULL, '2019-10-29 13:00:59', NULL);
INSERT INTO `sys_menu` VALUES (80, 6, 0, 1, '服务监控', 'ServerMonitor', 'monitor/server/index', 14, 'codeConsole', 'server', b'0', b'0', b'0', 'monitor:list', NULL, 'admin', '2019-11-07 13:06:39', '2020-05-04 18:20:50');
INSERT INTO `sys_menu` VALUES (82, 36, 0, 1, '生成配置', 'GeneratorConfig', 'generator/config', 33, 'dev', 'generator/config/:tableName', b'0', b'1', b'1', '', NULL, NULL, '2019-11-17 20:08:56', NULL);
INSERT INTO `sys_menu` VALUES (83, 10, 0, 1, '图表库', 'Echarts', 'components/Echarts', 50, 'chart', 'echarts', b'0', b'1', b'0', '', NULL, NULL, '2019-11-21 09:04:32', NULL);
INSERT INTO `sys_menu` VALUES (116, 36, 0, 1, '生成预览', 'Preview', 'generator/preview', 999, 'java', 'generator/preview/:tableName', b'0', b'1', b'1', NULL, NULL, NULL, '2019-11-26 14:54:36', NULL);
INSERT INTO `sys_menu` VALUES (118, NULL, 7, 0, '网关管理', NULL, NULL, 999, 'app', 'gateway', b'0', b'0', b'0', NULL, 'admin', 'admin', '2023-02-24 22:17:06', '2023-03-03 14:36:47');
INSERT INTO `sys_menu` VALUES (119, 118, 4, 1, '环境管理', 'env', 'gateway/env/index', 222, 'list', 'env', b'0', b'0', b'0', 'environment:list', 'admin', 'admin', '2023-02-24 22:20:18', '2023-03-29 21:02:41');
INSERT INTO `sys_menu` VALUES (120, 118, 4, 1, '分组管理', 'group', 'gateway/group/index', 333, 'list', 'group', b'0', b'0', b'0', 'group:list', 'admin', 'admin', '2023-02-25 20:00:52', '2023-03-29 21:02:51');
INSERT INTO `sys_menu` VALUES (121, 118, 5, 1, '上游应用', 'upstreamService', 'gateway/service/index', 444, 'list', 'upstreamService', b'0', b'0', b'0', 'upstreamService:list', 'admin', 'admin', '2023-02-25 20:02:09', '2023-03-29 21:03:00');
INSERT INTO `sys_menu` VALUES (122, 118, 6, 1, 'API管理', 'api', 'gateway/api/index', 111, 'list', 'apiVersion', b'0', b'0', b'0', 'apiVersion:list', 'admin', 'admin', '2023-02-25 20:02:54', '2023-03-29 21:02:05');
INSERT INTO `sys_menu` VALUES (123, 118, 5, 1, '租户管理', 'tenant', 'gateway/tenant/index', 555, 'list', 'tenant', b'0', b'0', b'0', 'tenant:list', 'admin', 'admin', '2023-03-29 21:06:14', '2023-03-29 21:06:14');
INSERT INTO `sys_menu` VALUES (124, 118, 0, 1, 'API文档', 'docs', 'gateway/docs/index', 999, 'list', 'docs', b'0', b'0', b'0', 'docs:list', 'admin', 'admin', '2023-04-24 17:49:49', '2023-05-10 16:21:25');
INSERT INTO `sys_menu` VALUES (125, 118, 5, 1, '灰度规则', 'gray', 'gateway/gray/index', 777, 'list', 'gray', b'0', b'0', b'0', 'gray:list', 'admin', 'admin', '2023-05-05 11:45:03', '2023-05-05 11:45:03');
INSERT INTO `sys_menu` VALUES (126, 122, 0, 2, '新增API', NULL, NULL, 111, NULL, NULL, b'0', b'0', b'0', 'apiVersion:add', 'admin', 'admin', '2023-05-12 10:32:38', '2023-05-12 10:32:38');
INSERT INTO `sys_menu` VALUES (127, 122, 0, 2, '同步API', NULL, NULL, 222, NULL, NULL, b'0', b'0', b'0', 'apiVersion:sync', 'admin', 'admin', '2023-05-12 10:33:29', '2023-05-12 10:33:29');
INSERT INTO `sys_menu` VALUES (128, 122, 0, 2, '修改API', NULL, NULL, 333, NULL, NULL, b'0', b'0', b'0', 'apiVersion:edit', 'admin', 'admin', '2023-05-12 10:33:49', '2023-05-12 10:33:49');
INSERT INTO `sys_menu` VALUES (129, 122, 0, 2, '删除API', NULL, NULL, 444, NULL, NULL, b'0', b'0', b'0', 'apiVersion:del', 'admin', 'admin', '2023-05-12 10:34:20', '2023-05-12 10:34:20');
INSERT INTO `sys_menu` VALUES (130, 125, 0, 2, '添加灰度', NULL, NULL, 111, NULL, NULL, b'0', b'0', b'0', 'gray:add', 'admin', 'admin', '2023-05-12 10:36:10', '2023-05-12 10:43:37');
INSERT INTO `sys_menu` VALUES (131, 125, 0, 2, '修改灰度', NULL, NULL, 222, NULL, NULL, b'0', b'0', b'0', 'gray:edit', 'admin', 'admin', '2023-05-12 10:36:53', '2023-05-12 10:43:49');
INSERT INTO `sys_menu` VALUES (132, 125, 0, 2, '删除灰度', NULL, NULL, 333, NULL, NULL, b'0', b'0', b'0', 'gray:del', 'admin', 'admin', '2023-05-12 10:37:58', '2023-05-12 10:43:59');
INSERT INTO `sys_menu` VALUES (133, 123, 0, 2, '新增租户', NULL, NULL, 111, NULL, NULL, b'0', b'0', b'0', 'tenant:add', 'admin', 'admin', '2023-05-12 10:39:02', '2023-05-12 10:45:42');
INSERT INTO `sys_menu` VALUES (134, 123, 0, 2, '修改租户', NULL, NULL, 222, NULL, NULL, b'0', b'0', b'0', 'tenant:edit', 'admin', 'admin', '2023-05-12 10:39:38', '2023-05-12 10:39:38');
INSERT INTO `sys_menu` VALUES (135, 123, 0, 2, '删除租户', NULL, NULL, 333, NULL, NULL, b'0', b'0', b'0', 'tenant:del', 'admin', 'admin', '2023-05-12 10:40:05', '2023-05-12 10:40:05');
INSERT INTO `sys_menu` VALUES (136, 123, 0, 2, '同步租户', NULL, NULL, 444, NULL, NULL, b'0', b'0', b'0', 'tenant:sync', 'admin', 'admin', '2023-05-12 10:40:27', '2023-05-12 10:46:02');
INSERT INTO `sys_menu` VALUES (137, 121, 0, 2, '新增应用', NULL, NULL, 111, NULL, NULL, b'0', b'0', b'0', 'upstreamService:add', 'admin', 'admin', '2023-05-12 10:41:51', '2023-05-12 10:46:25');
INSERT INTO `sys_menu` VALUES (138, 121, 0, 2, '修改应用', NULL, NULL, 222, NULL, NULL, b'0', b'0', b'0', 'upstreamService:edit', 'admin', 'admin', '2023-05-12 10:42:14', '2023-05-12 10:42:14');
INSERT INTO `sys_menu` VALUES (139, 121, 0, 2, '删除应用', NULL, NULL, 333, NULL, NULL, b'0', b'0', b'0', 'upstreamService:del', 'admin', 'admin', '2023-05-12 10:42:37', '2023-05-12 10:42:37');
INSERT INTO `sys_menu` VALUES (140, 121, 0, 2, '同步应用', NULL, NULL, 444, NULL, NULL, b'0', b'0', b'0', 'upstreamService:sync', 'admin', 'admin', '2023-05-12 10:43:12', '2023-05-12 10:43:12');
INSERT INTO `sys_menu` VALUES (141, 125, 0, 2, '同步灰度', NULL, NULL, 444, NULL, NULL, b'0', b'0', b'0', 'gray:sync', 'admin', 'admin', '2023-05-12 10:45:08', '2023-05-12 10:45:23');
INSERT INTO `sys_menu` VALUES (142, 119, 0, 2, '新增环境', NULL, NULL, 111, NULL, NULL, b'0', b'0', b'0', 'environment:add', 'admin', 'admin', '2023-05-12 11:18:58', '2023-05-12 11:19:52');
INSERT INTO `sys_menu` VALUES (143, 119, 0, 2, '修改环境', NULL, NULL, 222, NULL, NULL, b'0', b'0', b'0', 'environment:edit', 'admin', 'admin', '2023-05-12 11:19:14', '2023-05-12 11:19:14');
INSERT INTO `sys_menu` VALUES (144, 119, 0, 2, '删除环境', NULL, NULL, 333, NULL, NULL, b'0', b'0', b'0', 'environment:del', 'admin', 'admin', '2023-05-12 11:19:36', '2023-05-12 11:19:36');
INSERT INTO `sys_menu` VALUES (145, 120, 0, 2, '新增分组', NULL, NULL, 111, NULL, NULL, b'0', b'0', b'0', 'group:add', 'admin', 'admin', '2023-05-12 11:32:04', '2023-05-12 11:32:04');
INSERT INTO `sys_menu` VALUES (146, 120, 0, 2, '修改分组', NULL, NULL, 222, NULL, NULL, b'0', b'0', b'0', 'group:edit', 'admin', 'admin', '2023-05-12 11:32:21', '2023-05-12 11:32:21');
INSERT INTO `sys_menu` VALUES (147, 120, 0, 2, '删除分组', NULL, NULL, 333, NULL, NULL, b'0', b'0', b'0', 'group:del', 'admin', 'admin', '2023-05-12 11:32:47', '2023-05-12 11:32:47');
INSERT INTO `sys_menu` VALUES (148, 122, 0, 2, '下载API', NULL, NULL, 555, NULL, NULL, b'0', b'0', b'0', 'apiVersion:download', 'admin', 'admin', '2023-05-12 14:15:32', '2023-05-12 14:15:32');
INSERT INTO `sys_menu` VALUES (149, 119, 0, 2, '下载环境', NULL, NULL, 555, NULL, NULL, b'0', b'0', b'0', 'environment:download', 'admin', 'admin', '2023-05-12 14:16:29', '2023-05-12 14:16:29');
INSERT INTO `sys_menu` VALUES (150, 120, 0, 2, '下载分组', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'group:download', 'admin', 'admin', '2023-05-12 14:17:10', '2023-05-12 14:17:10');
INSERT INTO `sys_menu` VALUES (151, 121, 0, 2, '下载应用', NULL, NULL, 555, NULL, NULL, b'0', b'0', b'0', 'upstreamService:download', 'admin', 'admin', '2023-05-12 14:17:44', '2023-05-12 14:17:56');
INSERT INTO `sys_menu` VALUES (152, 123, 0, 2, '下载租户', NULL, NULL, 555, NULL, NULL, b'0', b'0', b'0', 'tenant:download', 'admin', 'admin', '2023-05-12 14:18:26', '2023-05-12 14:19:16');
INSERT INTO `sys_menu` VALUES (153, 125, 0, 2, '下载灰度', NULL, NULL, 555, NULL, NULL, b'0', b'0', b'0', 'gray:download', 'admin', 'admin', '2023-05-12 14:19:01', '2023-05-12 14:19:01');
INSERT INTO `sys_menu` VALUES (154, 122, 0, 2, '发布API', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'apiVersion:publish', 'admin', 'admin', '2023-05-12 17:58:53', '2023-05-12 17:58:53');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `level` int(0) NULL DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
  INDEX `role_name_index`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 1, '-', '全部', NULL, 'admin', '2018-11-23 11:04:37', '2023-05-12 11:09:58');
INSERT INTO `sys_role` VALUES (3, '开发人员', 3, NULL, '全部', 'admin', 'admin', '2023-02-24 22:21:20', '2023-05-12 16:07:50');
INSERT INTO `sys_role` VALUES (4, '发布人员', 3, NULL, '全部', 'admin', 'admin', '2023-05-12 10:12:41', '2023-05-12 11:34:17');

-- ----------------------------
-- Table structure for sys_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_depts`;
CREATE TABLE `sys_roles_depts`  (
  `role_id` bigint(0) NOT NULL,
  `dept_id` bigint(0) NOT NULL,
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE,
  INDEX `FK7qg6itn5ajdoa9h9o78v9ksur`(`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色部门关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus`  (
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`, `role_id`) USING BTREE,
  INDEX `FKcngg2qadojhi3a651a5adkvbq`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
INSERT INTO `sys_roles_menus` VALUES (1, 1);
INSERT INTO `sys_roles_menus` VALUES (2, 1);
INSERT INTO `sys_roles_menus` VALUES (3, 1);
INSERT INTO `sys_roles_menus` VALUES (5, 1);
INSERT INTO `sys_roles_menus` VALUES (6, 1);
INSERT INTO `sys_roles_menus` VALUES (35, 1);
INSERT INTO `sys_roles_menus` VALUES (37, 1);
INSERT INTO `sys_roles_menus` VALUES (39, 1);
INSERT INTO `sys_roles_menus` VALUES (41, 1);
INSERT INTO `sys_roles_menus` VALUES (44, 1);
INSERT INTO `sys_roles_menus` VALUES (45, 1);
INSERT INTO `sys_roles_menus` VALUES (46, 1);
INSERT INTO `sys_roles_menus` VALUES (48, 1);
INSERT INTO `sys_roles_menus` VALUES (49, 1);
INSERT INTO `sys_roles_menus` VALUES (50, 1);
INSERT INTO `sys_roles_menus` VALUES (52, 1);
INSERT INTO `sys_roles_menus` VALUES (53, 1);
INSERT INTO `sys_roles_menus` VALUES (54, 1);
INSERT INTO `sys_roles_menus` VALUES (56, 1);
INSERT INTO `sys_roles_menus` VALUES (57, 1);
INSERT INTO `sys_roles_menus` VALUES (58, 1);
INSERT INTO `sys_roles_menus` VALUES (60, 1);
INSERT INTO `sys_roles_menus` VALUES (61, 1);
INSERT INTO `sys_roles_menus` VALUES (62, 1);
INSERT INTO `sys_roles_menus` VALUES (64, 1);
INSERT INTO `sys_roles_menus` VALUES (65, 1);
INSERT INTO `sys_roles_menus` VALUES (66, 1);
INSERT INTO `sys_roles_menus` VALUES (80, 1);
INSERT INTO `sys_roles_menus` VALUES (118, 1);
INSERT INTO `sys_roles_menus` VALUES (119, 1);
INSERT INTO `sys_roles_menus` VALUES (120, 1);
INSERT INTO `sys_roles_menus` VALUES (121, 1);
INSERT INTO `sys_roles_menus` VALUES (122, 1);
INSERT INTO `sys_roles_menus` VALUES (123, 1);
INSERT INTO `sys_roles_menus` VALUES (124, 1);
INSERT INTO `sys_roles_menus` VALUES (125, 1);
INSERT INTO `sys_roles_menus` VALUES (41, 3);
INSERT INTO `sys_roles_menus` VALUES (80, 3);
INSERT INTO `sys_roles_menus` VALUES (118, 3);
INSERT INTO `sys_roles_menus` VALUES (119, 3);
INSERT INTO `sys_roles_menus` VALUES (120, 3);
INSERT INTO `sys_roles_menus` VALUES (121, 3);
INSERT INTO `sys_roles_menus` VALUES (122, 3);
INSERT INTO `sys_roles_menus` VALUES (123, 3);
INSERT INTO `sys_roles_menus` VALUES (124, 3);
INSERT INTO `sys_roles_menus` VALUES (125, 3);
INSERT INTO `sys_roles_menus` VALUES (126, 3);
INSERT INTO `sys_roles_menus` VALUES (128, 3);
INSERT INTO `sys_roles_menus` VALUES (129, 3);
INSERT INTO `sys_roles_menus` VALUES (130, 3);
INSERT INTO `sys_roles_menus` VALUES (131, 3);
INSERT INTO `sys_roles_menus` VALUES (132, 3);
INSERT INTO `sys_roles_menus` VALUES (133, 3);
INSERT INTO `sys_roles_menus` VALUES (134, 3);
INSERT INTO `sys_roles_menus` VALUES (135, 3);
INSERT INTO `sys_roles_menus` VALUES (137, 3);
INSERT INTO `sys_roles_menus` VALUES (138, 3);
INSERT INTO `sys_roles_menus` VALUES (139, 3);
INSERT INTO `sys_roles_menus` VALUES (145, 3);
INSERT INTO `sys_roles_menus` VALUES (146, 3);
INSERT INTO `sys_roles_menus` VALUES (147, 3);
INSERT INTO `sys_roles_menus` VALUES (148, 3);
INSERT INTO `sys_roles_menus` VALUES (150, 3);
INSERT INTO `sys_roles_menus` VALUES (151, 3);
INSERT INTO `sys_roles_menus` VALUES (152, 3);
INSERT INTO `sys_roles_menus` VALUES (153, 3);
INSERT INTO `sys_roles_menus` VALUES (41, 4);
INSERT INTO `sys_roles_menus` VALUES (80, 4);
INSERT INTO `sys_roles_menus` VALUES (118, 4);
INSERT INTO `sys_roles_menus` VALUES (119, 4);
INSERT INTO `sys_roles_menus` VALUES (121, 4);
INSERT INTO `sys_roles_menus` VALUES (122, 4);
INSERT INTO `sys_roles_menus` VALUES (123, 4);
INSERT INTO `sys_roles_menus` VALUES (125, 4);
INSERT INTO `sys_roles_menus` VALUES (127, 4);
INSERT INTO `sys_roles_menus` VALUES (136, 4);
INSERT INTO `sys_roles_menus` VALUES (140, 4);
INSERT INTO `sys_roles_menus` VALUES (141, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门名称',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `is_admin` bit(1) NULL DEFAULT b'0' COMMENT '是否为admin账号',
  `enabled` bigint(0) NULL DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `pwd_reset_time` datetime(0) NULL DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `UK_kpubos9gc2cvtkb0thktkbkes`(`email`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_email`(`email`) USING BTREE,
  INDEX `FK5rwmryny6jthaaxkogownknqp`(`dept_id`) USING BTREE,
  INDEX `FKpq2dhypk2qgt68nauh2by22jb`(`avatar_name`) USING BTREE,
  INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 18, 'admin', '管理员', '男', '18888888888', '201507802@qq.com', 'avatar-20200806032259161.png', '/Users/jie/Documents/work/me/admin/eladmin/~/avatar/avatar-20200806032259161.png', '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'1', 1, NULL, 'admin', '2020-05-03 16:38:31', '2018-08-23 09:11:56', '2023-02-28 11:52:23');
INSERT INTO `sys_user` VALUES (3, 18, 'qiwen.guan', 'QQ', '男', '18688888888', '18688888888@za.group', NULL, NULL, '$2a$10$o1v./jpACwYvynp.Dux/QehHOjIB6QMc9cqkfR3xu8dDVSNEa1Ot2', b'0', 1, 'admin', 'admin', NULL, '2023-02-27 18:03:12', '2023-04-17 16:16:01');
INSERT INTO `sys_user` VALUES (4, 18, 'yong.ding', '丁老板', '男', '19945720790', 'yong.ding@za.group', NULL, NULL, '$2a$10$0qszcVmb4yVta9YOrvG9y.uGnMaV06RKE2dGsIMX0B.OoN6I..3s2', b'0', 1, 'admin', 'admin', NULL, '2023-05-12 10:15:47', '2023-05-12 10:15:47');

-- ----------------------------
-- Table structure for sys_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_jobs`;
CREATE TABLE `sys_users_jobs`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `job_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users_jobs
-- ----------------------------
INSERT INTO `sys_users_jobs` VALUES (1, 11);
INSERT INTO `sys_users_jobs` VALUES (3, 11);
INSERT INTO `sys_users_jobs` VALUES (4, 12);

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKq4eq273l04bpu4efj0jd0jb98`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
INSERT INTO `sys_users_roles` VALUES (1, 1);
INSERT INTO `sys_users_roles` VALUES (3, 3);
INSERT INTO `sys_users_roles` VALUES (4, 4);

-- ----------------------------
-- Table structure for t_api
-- ----------------------------
DROP TABLE IF EXISTS `t_api`;
CREATE TABLE `t_api`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api name',
  `api_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api code',
  `status` tinyint(0) NOT NULL DEFAULT 0 COMMENT 'api status (0-develop,1-test,2-online) ing',
  `maintainer` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api who maintain',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'api introduction',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`api_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000604 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Api define' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_api
-- ----------------------------
INSERT INTO `t_api` VALUES (100000000, '文件上传通用', 'VDI2000', 0, 'system', 'upload:(文件上传通用)', '2023-04-09 21:38:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000001, '根据fileUniqueCode获取字节码', 'VDI2001', 0, 'system', 'download:(根据fileUniqueCode获取字节码)', '2023-04-09 21:38:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000002, '文件上传', 'VDI2002', 0, 'system', 'uploadFile:(文件上传)', '2023-04-09 21:38:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000003, '根据fileUniqueCode获取文件', 'VDI2003', 0, 'system', 'downloadFile:(根据fileUniqueCode获取文件)', '2023-04-09 21:38:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000004, 'getRoles', 'VDI2010', 0, 'system', 'getRoles', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000005, 'addRole', 'VDI2011', 0, 'system', 'addRole', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000006, 'updateRole', 'VDI2012', 0, 'system', 'updateRole', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000007, 'deleteRole', 'VDI2013', 0, 'system', 'deleteRole', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000008, 'bindingUserRole', 'VDI2014', 0, 'system', 'bindingUserRole', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000009, 'unbindingUserRole', 'VDI2015', 0, 'system', 'unbindingUserRole', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000010, 'bindingRolePrivilege', 'VDI2016', 0, 'system', 'bindingRolePrivilege', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000011, 'unbindingRolePrivilege', 'VDI2017', 0, 'system', 'unbindingRolePrivilege', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000012, 'getPrivileges', 'VDI2018', 0, 'system', 'getPrivileges', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000013, 'addPrivilege', 'VDI2019', 0, 'system', 'addPrivilege', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000014, 'updatePrivilege', 'VDI2020', 0, 'system', 'updatePrivilege', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000015, 'deletePrivilege', 'VDI2021', 0, 'system', 'deletePrivilege', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000016, 'getMenus', 'VDI2022', 0, 'system', 'getMenus', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000017, 'addMenus', 'VDI2023', 0, 'system', 'addMenus', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000018, 'updateMenu', 'VDI2024', 0, 'system', 'updateMenu', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000019, 'deleteMenu', 'VDI2025', 0, 'system', 'deleteMenu', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000020, 'bindingRolePrivilege', 'VDI2026', 0, 'system', 'bindingRolePrivilege', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000021, 'unbindingRolePrivilege', 'VDI2027', 0, 'system', 'unbindingRolePrivilege', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000022, 'getUser', 'VDI2028', 0, 'system', 'getUser', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000023, 'logout', 'VDI2029', 0, 'system', 'logout', '2023-04-09 21:38:52', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000024, 'getSalt', 'VDI2030', 0, 'system', 'getSalt', '2023-04-09 21:38:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000025, 'login', 'VDI2031', 0, 'system', 'login', '2023-04-09 21:38:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000026, 'getUsers', 'VDI2032', 0, 'system', 'getUsers', '2023-04-09 21:38:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000027, 'addUser', 'VDI2033', 0, 'system', 'addUser', '2023-04-09 21:38:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000028, 'updateUser', 'VDI2034', 0, 'system', 'updateUser', '2023-04-09 21:38:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000029, 'resetPwd', 'VDI2035', 0, 'system', 'resetPwd', '2023-04-09 21:38:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000030, 'login', 'VDI2036', 0, 'system', 'login', '2023-04-09 21:38:55', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000031, 'getUserINfo', 'VDI2037', 0, 'system', 'getUserINfo', '2023-04-09 21:38:55', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000032, 'getUserInfoByUserId', 'VDI2038', 0, 'system', 'getUserInfoByUserId', '2023-04-09 21:38:55', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000033, 'getUserInfoBySecurityToken', 'VDI2039', 0, 'system', 'getUserInfoBySecurityToken', '2023-04-09 21:38:55', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000034, '分页查询产品', 'VDI2041', 0, 'system', 'getProducts:(分页查询产品)', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000035, '查询产品', 'VDI2042', 0, 'system', 'getProduct:(查询产品)', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000036, '添加产品', 'VDI2043', 0, 'system', 'addProduct:(添加产品)', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000037, '更新产品', 'VDI2044', 0, 'system', 'updateProduct:(更新产品)', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000038, '更改产品状态\n<p>\n下架产品', 'VDI2045', 0, 'system', 'offline:(更改产品状态\n<p>\n下架产品)', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000039, '更改产品状态\n<p>\n上架产品', 'VDI2046', 0, 'system', 'online:(更改产品状态\n<p>\n上架产品)', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000040, '查询所有产品的名称和code', 'VDI2047', 0, 'system', 'selectProductCodeAndName:(查询所有产品的名称和code)', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000041, '查询约定', 'VDI2048', 0, 'system', 'getAgreement:(查询约定)', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000042, '添加约定', 'VDI2049', 0, 'system', 'addAgreement:(添加约定)', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000043, '更新约定', 'VDI2050', 0, 'system', 'updateAgreement:(更新约定)', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000044, 'getProductFormulas', 'VDI2051', 0, 'system', 'getProductFormulas', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000045, 'getProductLiabilities', 'VDI2052', 0, 'system', 'getProductLiabilities', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000046, 'getProductAgreement', 'VDI2053', 0, 'system', 'getProductAgreement', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000047, 'getProduct', 'VDI2054', 0, 'system', 'getProduct', '2023-04-09 21:38:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000048, '根据keys查询国际化列表', 'VDI2056', 0, 'system', 'getI18nLang:(根据keys查询国际化列表)', '2023-04-09 21:39:14', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000049, '根据keys查询字典项列表', 'VDI2057', 0, 'system', 'getDictByDictKeys:(根据keys查询字典项列表)', '2023-04-09 21:39:14', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000050, '根据key查询字典项', 'VDI2058', 0, 'system', 'getDictByDictKey:(根据key查询字典项)', '2023-04-09 21:39:14', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000051, '根据key查询字典项', 'VDI2059', 0, 'system', 'getDictByKeyCode:(根据key查询字典项)', '2023-04-09 21:39:14', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000052, 'loadAll', 'VDI2060', 0, 'system', 'loadAll', '2023-04-09 21:39:14', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000053, 'getI18nLang', 'VDI2061', 0, 'system', 'getI18nLang', '2023-04-09 21:39:14', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000054, 'getDictByDictKeys', 'VDI2062', 0, 'system', 'getDictByDictKeys', '2023-04-09 21:39:14', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000055, 'getDictByDictKeysLang', 'VDI2063', 0, 'system', 'getDictByDictKeysLang', '2023-04-09 21:39:14', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000056, 'getDictByDictKeyLang', 'VDI2064', 0, 'system', 'getDictByDictKeyLang', '2023-04-09 21:39:14', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000057, 'getDictByDictKeyCodeLang', 'VDI2065', 0, 'system', 'getDictByDictKeyCodeLang', '2023-04-09 21:39:14', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000063, '获取客户详情', 'KDG2000', 0, 'system', 'getCustomerDetails:(获取客户详情：包含客户基本信息、证件、联系方式、地址、邮箱等\r\n应用场景：C端客户信息查询（理赔、投保单、保单明细等）)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000064, '更新客户信息\r\n应用场景', 'KDG2001', 0, 'system', 'updateCustomer:(更新客户信息\r\n应用场景：C端客户资料更改（联系方式、营销DM标识、地址、国籍），其中国籍需要走保全)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000065, '获取被保人信息列表\r\n应用场景', 'KDG2002', 0, 'system', 'getCustomerInsured:(获取被保人信息列表\r\n应用场景：C端客户信息查询（客户被保人列表）)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000066, '查询客户证件状态\r\n应用场景', 'KDG2003', 0, 'system', 'getCustomerCertStatus:(查询客户证件状态\r\n应用场景：C端客户投保时前端需要check，如已注册，需要提醒客户用已注册账号登录)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000067, '发送验证码\r\n应用场景', 'KDG2004', 0, 'system', 'sendVerificationCode:(发送验证码\r\n应用场景：C端修改客户信息，需要客户SMS确认)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000068, '验证码校验\r\n应用场景', 'KDG2005', 0, 'system', 'checkVerificationCode:(验证码校验\r\n应用场景：C端修改客户信息，需要客户SMS确认)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000069, '客户级批改前置校验', 'KDG2006', 0, 'system', 'correctRuleCheck:(客户级批改前置校验)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000070, '客户级批改\r\n使用场景', 'KDG2007', 0, 'system', 'correct:(客户级批改\r\n使用场景：是否抽烟、是否接受营销信息)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000071, '客户查看批改列表', 'KDG2008', 0, 'system', 'getCorrectList:(客户查看批改列表)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000072, '查看税务国家列表', 'KDG2009', 0, 'system', 'getTaxCountries:(查看税务国家列表)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000073, '查看两个保单客户之间的关系', 'KDG2010', 0, 'system', 'getPolicyCustomerRelation:(查看两个保单客户之间的关系)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000074, '查看两个保单客户之间的关系', 'KDG2011', 0, 'system', 'getPolicyCustomerRelationByDest:(查看两个保单客户之间的关系)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000075, '10名客户列表查询', 'KDG2012', 0, 'system', 'getPersons:(10名客户列表查询)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000076, '获取客户详情', 'KDG2013', 0, 'system', 'getCustomerDetails:(获取客户详情：包含客户基本信息、证件、联系方式、地址、邮箱等\r\n应用场景：保全查客户详情)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000077, 'searchCustomer', 'KDG2014', 0, 'system', 'searchCustomer', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000078, '客户级批改前置校验', 'KDG2015', 0, 'system', 'correctRuleCheck:(客户级批改前置校验)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000079, '客户级批改\r\n使用场景', 'KDG2016', 0, 'system', 'correct:(客户级批改\r\n使用场景：是否抽烟、是否接受营销信息)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000080, '客户级批改分页查询', 'KDG2017', 0, 'system', 'pageCorrectList:(客户级批改分页查询)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000081, '客户级批改详情', 'KDG2018', 0, 'system', 'correctInfo:(客户级批改详情)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000082, '客户级批改搜索', 'KDG2019', 0, 'system', 'searchCorrectList:(客户级批改搜索)', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000083, 'createCustomer', 'KDG2020', 0, 'system', 'createCustomer', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000084, 'createPolicyCustomer', 'KDG2021', 0, 'system', 'createPolicyCustomer', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000085, 'createPerson', 'KDG2022', 0, 'system', 'createPerson', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000086, 'updateCustomer', 'KDG2023', 0, 'system', 'updateCustomer', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000087, 'updatePolicyCustomer', 'KDG2024', 0, 'system', 'updatePolicyCustomer', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000088, 'getPolicyCustomerRelation', 'KDG2025', 0, 'system', 'getPolicyCustomerRelation', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000089, 'updatePerson', 'KDG2026', 0, 'system', 'updatePerson', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000090, 'getHolderCustomerDetails', 'KDG2027', 0, 'system', 'getHolderCustomerDetails', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000091, 'getCustomerBasics', 'KDG2028', 0, 'system', 'getCustomerBasics', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000092, 'getCustomerDetails', 'KDG2029', 0, 'system', 'getCustomerDetails', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000093, 'getCustomerRelation', 'KDG2030', 0, 'system', 'getCustomerRelation', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000094, 'getPolicyCustomerBasics', 'KDG2031', 0, 'system', 'getPolicyCustomerBasics', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000095, 'getPolicyCustomerDetails', 'KDG2032', 0, 'system', 'getPolicyCustomerDetails', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000096, 'getPersonDetails', 'KDG2033', 0, 'system', 'getPersonDetails', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000097, 'getCustomerByCert', 'KDG2034', 0, 'system', 'getCustomerByCert', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000098, 'generatePolicyCustomer', 'KDG2035', 0, 'system', 'generatePolicyCustomer', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000099, 'authPolicyCustomer', 'KDG2036', 0, 'system', 'authPolicyCustomer', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000100, 'createBeneficiary', 'KDG2037', 0, 'system', 'createBeneficiary', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000101, 'createPayee', 'KDG2038', 0, 'system', 'createPayee', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000102, 'updateBeneficiary', 'KDG2039', 0, 'system', 'updateBeneficiary', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000103, 'updatePayee', 'KDG2040', 0, 'system', 'updatePayee', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000104, 'correct', 'KDG2041', 0, 'system', 'correct', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000105, 'searchCorrectList', 'KDG2042', 0, 'system', 'searchCorrectList', '2023-04-10 10:10:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000109, 'getProductFile', 'PDG2007', 0, 'system', 'getProductFile', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000110, '新增产品文件', 'PDG2008', 0, 'system', 'addProductFile:(新增产品文件)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000111, '更新产品文件', 'PDG2009', 0, 'system', 'updateProductFile:(更新产品文件)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000112, '删除产品文件', 'PDG2010', 0, 'system', 'deleteProductFile:(删除产品文件)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000113, '添加产品机构币种', 'PDG2014', 0, 'system', 'addProductCurrency:(添加产品机构币种)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000114, '更新产品机构币种', 'PDG2015', 0, 'system', 'updateProductCurrency:(更新产品机构币种)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000115, '删除产品机构币种', 'PDG2016', 0, 'system', 'deleteProductCurrency:(删除产品机构币种)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000116, 'getProductCollocation', 'PDG2021', 0, 'system', 'getProductCollocation', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000117, '新增产品搭配关系', 'PDG2022', 0, 'system', 'addProductCollocation:(新增产品搭配关系)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000118, '更新产品搭配关系', 'PDG2023', 0, 'system', 'updateProductCollocation:(更新产品搭配关系)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000119, '删除产品搭配关系', 'PDG2024', 0, 'system', 'deleteProductCollocation:(删除产品搭配关系)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000120, 'getProductLiabilities', 'PDG2025', 0, 'system', 'getProductLiabilities', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000121, '新增产品责任', 'PDG2026', 0, 'system', 'addProductLiability:(新增产品责任)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000122, '更新产品责任', 'PDG2027', 0, 'system', 'updateProductLiability:(更新产品责任)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000123, '获取保额责任配置', 'PDG2028', 0, 'system', 'getProductLiabilitySumInsured:(获取保额责任配置)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000124, '删除产品责任', 'PDG2029', 0, 'system', 'deleteProductLiability:(删除产品责任)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000125, '添加保额责任配置', 'PDG2030', 0, 'system', 'addProductLiabilitySumInsured:(添加保额责任配置)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000126, '删除保额责任配置', 'PDG2031', 0, 'system', 'deletedProductLiabilitySumInsured:(删除保额责任配置)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000127, '获取风险保额责任配置', 'PDG2032', 0, 'system', 'getProductLiabilityRiskInsured:(获取风险保额责任配置)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000128, '添加风险保额责任配置', 'PDG2033', 0, 'system', 'addProductLiabilityRiskInsured:(添加风险保额责任配置)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000129, '删除风险保额责任配置', 'PDG2034', 0, 'system', 'deletedProductLiabilityRiskInsured:(删除风险保额责任配置)', '2023-04-10 15:02:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000146, 'workbench后管审核结果通知接口', 'QDG2000', 0, 'system', 'auditResults:(workbench后管审核结果通知接口)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000147, '查询投保单详情(B端使用)', 'QDG2001', 0, 'system', 'queryInsureInfoForManage:(查询投保单详情(B端使用))', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000148, '查询投保单列表接口(B端使用)', 'QDG2002', 0, 'system', 'insureConditionSearch:(查询投保单列表接口(B端使用))', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000149, '创建投保单前置校验', 'QDG2003', 0, 'system', 'insureApplicationCheck:(创建投保单前置校验)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000150, '创建核保问卷', 'QDG2004', 0, 'system', 'createUwQuestions:(创建核保问卷)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000151, '获取下一个问题', 'QDG2005', 0, 'system', 'uwQuestionLoops:(获取下一个问题)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000152, '获取核保问卷结果', 'QDG2006', 0, 'system', 'uwQuestionsResult:(获取核保问卷结果)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000153, '更新投保单状态', 'QDG2007', 0, 'system', 'updateInsureStatus:(更新投保单状态)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000154, '查询投保单详情', 'QDG2008', 0, 'system', 'queryInsureInfo:(查询投保单详情)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000155, '支付结果查询', 'QDG2009', 0, 'system', 'insurePaymentResult:(支付结果查询)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000156, '投保单OTP验证接口', 'QDG2010', 0, 'system', 'insureOtpValidate:(投保单OTP验证接口)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000157, '被保人下结论接口', 'QDG2011', 0, 'system', 'insuresConclusion:(被保人下结论接口)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000158, '查询投保单列表接口', 'QDG2012', 0, 'system', 'insureConditionSearch:(查询投保单列表接口)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000159, '创建上传文件srcNo', 'QDG2013', 0, 'system', 'createFileSrcNo:(创建上传文件srcNo)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000160, '查询文件详情', 'QDG2014', 0, 'system', 'queryFileSrcDetail:(查询文件详情)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000161, '文件操作', 'QDG2015', 0, 'system', 'insureFileSrcOperate:(文件操作)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000162, '文件上传', 'QDG2016', 0, 'system', 'insureFileUpload:(文件上传)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000163, '批量生效文件', 'QDG2017', 0, 'system', 'insureEffectiveFile:(批量生效文件)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000164, '文件下载', 'QDG2018', 0, 'system', 'insureFileDownload:(文件下载)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000165, '业务校验接口', 'QDG2019', 0, 'system', 'insureValidation:(业务校验接口)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000166, '获取ocr文件上传状态', 'QDG2020', 0, 'system', 'insureOcrUploadStatus:(获取ocr文件上传状态)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000167, '获取ocr识别信息与客户信息差异', 'QDG2021', 0, 'system', 'insureOcrFilesDifferences:(获取ocr识别信息与客户信息差异)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000168, '更新审核任务附件', 'QDG2022', 0, 'system', 'insureUpdateTaskAttachments:(更新审核任务附件)', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000169, 'createInsure', 'QDG2023', 0, 'system', 'createInsure', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000170, 'updateInsure', 'QDG2024', 0, 'system', 'updateInsure', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000171, 'queryInsureInfo', 'QDG2025', 0, 'system', 'queryInsureInfo', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000172, 'updateInsureStatus', 'QDG2026', 0, 'system', 'updateInsureStatus', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000173, 'insureToPolicy', 'QDG2027', 0, 'system', 'insureToPolicy', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000174, 'insureConditionSearch', 'QDG2028', 0, 'system', 'insureConditionSearch', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000175, 'uwQuestionsResult', 'QDG2029', 0, 'system', 'uwQuestionsResult', '2023-04-10 16:46:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000176, '支付结果查询', 'KDK2000', 0, 'system', 'payResult:(支付结果查询)', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000177, '查询用户银行卡', 'KDK2001', 0, 'system', 'cards:(查询用户银行卡)', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000178, '查询订单详情', 'KDK2002', 0, 'system', 'queryOrderInfo:(查询订单详情)', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000179, '更新订单状态', 'KDK2003', 0, 'system', 'updateOrderStatus:(更新订单状态)', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000180, '批量查询', 'KDK2004', 0, 'system', 'orderConditionSearch:(批量查询)', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000181, '查询订单详情', 'KDK2005', 0, 'system', 'queryOrderInfo:(查询订单详情)', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000182, 'createOrder', 'KDK2006', 0, 'system', 'createOrder', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000183, 'queryOrderInfo', 'KDK2007', 0, 'system', 'queryOrderInfo', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000184, 'updateOrderStatus', 'KDK2008', 0, 'system', 'updateOrderStatus', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000185, 'payRequest', 'KDK2009', 0, 'system', 'payRequest', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000186, 'refund', 'KDK2010', 0, 'system', 'refund', '2023-04-11 10:17:46', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000187, 'getCustomerDetails', 'LDK2020', 0, 'system', 'getCustomerDetails', '2023-04-11 11:55:19', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000188, 'getRoles', 'RDK2000', 0, 'system', 'getRoles', '2023-04-11 17:03:58', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000189, 'addRole', 'RDK2001', 0, 'system', 'addRole', '2023-04-11 17:03:58', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000190, 'updateRole', 'RDK2002', 0, 'system', 'updateRole', '2023-04-11 17:03:58', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000191, 'deleteRole', 'RDK2003', 0, 'system', 'deleteRole', '2023-04-11 17:03:58', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000192, 'bindingUserRole', 'RDK2004', 0, 'system', 'bindingUserRole', '2023-04-11 17:03:58', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000193, 'unbindingUserRole', 'RDK2005', 0, 'system', 'unbindingUserRole', '2023-04-11 17:03:58', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000194, 'bindingRolePrivilege', 'RDK2006', 0, 'system', 'bindingRolePrivilege', '2023-04-11 17:03:58', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000195, 'unbindingRolePrivilege', 'RDK2007', 0, 'system', 'unbindingRolePrivilege', '2023-04-11 17:03:58', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000196, 'getPrivileges', 'RDK2008', 0, 'system', 'getPrivileges', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000197, 'addPrivilege', 'RDK2009', 0, 'system', 'addPrivilege', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000198, 'updatePrivilege', 'RDK2010', 0, 'system', 'updatePrivilege', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000199, 'deletePrivilege', 'RDK2011', 0, 'system', 'deletePrivilege', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000200, 'getMenus', 'RDK2012', 0, 'system', 'getMenus', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000201, 'addMenus', 'RDK2013', 0, 'system', 'addMenus', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000202, 'updateMenu', 'RDK2014', 0, 'system', 'updateMenu', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000203, 'deleteMenu', 'RDK2015', 0, 'system', 'deleteMenu', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000204, 'bindingRolePrivilege', 'RDK2016', 0, 'system', 'bindingRolePrivilege', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000205, 'unbindingRolePrivilege', 'RDK2017', 0, 'system', 'unbindingRolePrivilege', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000206, 'getUser', 'RDK2018', 0, 'system', 'getUser', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000207, 'logout', 'RDK2019', 0, 'system', 'logout', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000208, 'getSalt', 'RDK2020', 0, 'system', 'getSalt', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000209, 'login', 'RDK2021', 0, 'system', 'login', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000210, 'getUsers', 'RDK2022', 0, 'system', 'getUsers', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000211, 'addUser', 'RDK2023', 0, 'system', 'addUser', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000212, 'updateUser', 'RDK2024', 0, 'system', 'updateUser', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000213, 'resetPwd', 'RDK2025', 0, 'system', 'resetPwd', '2023-04-11 17:19:56', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000214, 'calculate', 'ODL2000', 0, 'system', 'calculate', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000215, 'getRateTables', 'ODL2001', 0, 'system', 'getRateTables', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000216, '查询费率表', 'ODL2002', 0, 'system', 'getRateTable:(查询费率表)', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000217, '添加费率表', 'ODL2003', 0, 'system', 'addRateTable:(添加费率表)', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000218, '更新费率表', 'ODL2004', 0, 'system', 'updateRateTable:(更新费率表)', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000219, '删除费率表', 'ODL2005', 0, 'system', 'deleteRateTable:(删除费率表)', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000220, 'queryRateTableValue', 'ODL2006', 0, 'system', 'queryRateTableValue', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000221, 'selectRateTableCodeAndName', 'ODL2007', 0, 'system', 'selectRateTableCodeAndName', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000222, 'selectRateTableFactors', 'ODL2008', 0, 'system', 'selectRateTableFactors', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000223, 'getRateTableTemplate', 'ODL2009', 0, 'system', 'getRateTableTemplate', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000224, 'getRateTables', 'ODL2010', 0, 'system', 'getRateTables', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000225, '查询公式', 'ODL2011', 0, 'system', 'getFormula:(查询公式)', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000226, '添加公式', 'ODL2012', 0, 'system', 'addFormula:(添加公式)', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000227, '更新公式', 'ODL2013', 0, 'system', 'updateFormula:(更新公式)', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000228, '删除公式', 'ODL2014', 0, 'system', 'deleteFormula:(删除公式)', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000229, 'calculate', 'ODL2015', 0, 'system', 'calculate', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000230, 'selectFormulaCodeAndName', 'ODL2016', 0, 'system', 'selectFormulaCodeAndName', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000231, 'selectFormulaFactors', 'ODL2017', 0, 'system', 'selectFormulaFactors', '2023-04-12 14:39:25', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000232, '上传文件', 'PDL2032', 0, 'system', 'uploadFile:(上传文件)', '2023-04-12 15:22:34', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000233, '下载文件', 'PDL2033', 0, 'system', 'downloadFile:(下载文件)', '2023-04-12 15:22:34', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000234, '创建上传文件的srcNo', 'PDL2034', 0, 'system', 'createFileSrcNo:(创建上传文件的srcNo)', '2023-04-12 15:22:34', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000235, 'srcNo关联文件操作', 'PDL2035', 0, 'system', 'createFileSrcNo:(srcNo关联文件操作)', '2023-04-12 15:22:34', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000236, '查询文件详情', 'PDL2036', 0, 'system', 'fileSrcNoDetail:(查询文件详情)', '2023-04-12 15:22:34', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000237, '文件上传', 'PDL2037', 0, 'system', 'upload:(文件上传)', '2023-04-12 15:22:34', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000238, '批量生效文件', 'PDL2038', 1, 'system', 'effectiveFiles:(批量生效文件)', '2023-04-12 15:22:34', '2023-06-07 20:46:12', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000239, '文件下载', 'PDL2039', 1, 'system', 'downloadFile:(文件下载)', '2023-04-12 15:22:34', '2023-06-07 20:46:12', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000240, '查询保单续期计划', 'KDM2000', 0, 'system', 'getRenewalPolicyPremiumSchedule:(查询保单续期计划)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000241, 'createRenewalPolicySchedule', 'KDM2001', 0, 'system', 'createRenewalPolicySchedule', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000242, '保全申请', 'KDM2002', 0, 'system', 'posApply:(保全申请)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000243, '保全搜索', 'KDM2003', 0, 'system', 'posSearch:(保全搜索)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000244, '查询保全明细', 'KDM2004', 0, 'system', 'getPosTransactions:(查询保全明细)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000245, '查询保全申请交易列表', 'KDM2005', 0, 'system', 'getPosTransactionsByApplyNo:(查询保全申请交易列表)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000246, '查询保单的保全列表', 'KDM2006', 0, 'system', 'getPosTransactionsByPolicyNo:(查询保单的保全列表)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000247, '查询保全变更明细', 'KDM2007', 0, 'system', 'getPosChangeProps:(查询保全变更明细)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000248, '客户保全列表查询', 'KDM2008', 0, 'system', 'getPosCustomerTransactions:(客户保全列表查询)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000249, '保全校验', 'KDM2009', 0, 'system', 'posValidation:(保全校验)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000250, 'cancelPos', 'KDM2010', 0, 'system', 'cancelPos', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000251, 'getPosLock', 'KDM2011', 0, 'system', 'getPosLock', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000252, 'checkPosLock', 'KDM2012', 0, 'system', 'checkPosLock', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000253, 'updatePos', 'KDM2013', 0, 'system', 'updatePos', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000254, 'callback', 'KDM2014', 0, 'system', 'callback', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000255, 'genBizNo', 'KDM2015', 0, 'system', 'genBizNo', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000256, 'posApply', 'KDM2016', 0, 'system', 'posApply', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000257, 'posCalculation', 'KDM2017', 0, 'system', 'posCalculation', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000258, 'cancelPos', 'KDM2018', 0, 'system', 'cancelPos', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000259, 'posSearch', 'KDM2019', 0, 'system', 'posSearch', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000260, 'getPosDetail', 'KDM2020', 0, 'system', 'getPosDetail', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000261, 'posAudit', 'KDM2021', 0, 'system', 'posAudit', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000262, 'getPosCustomerTransactions', 'KDM2022', 0, 'system', 'getPosCustomerTransactions', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000263, 'getPosBills', 'KDM2023', 0, 'system', 'getPosBills', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000264, 'createPosPayee', 'KDM2024', 0, 'system', 'createPosPayee', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000265, '多条件分页查询保单列表\n应用场景', 'KDM2025', 0, 'system', 'searchPolicy:(多条件分页查询保单列表\n应用场景：B端页面查询保单概览信息)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000266, '查询保单具体详情\n应用场景', 'KDM2026', 0, 'system', 'getPolicyInfo:(查询保单具体详情\n应用场景：B端页面查询保单详情)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000267, '分页查询保单列表\n应用场景', 'KDM2027', 0, 'system', 'getPolicyList:(分页查询保单列表\n应用场景：C端页面查询保单概览信息)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000268, '查询保单具体详情\n应用场景', 'KDM2028', 0, 'system', 'getPolicyInfo:(查询保单具体详情\n应用场景：C端页面查询保单详情)', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000269, 'generate', 'KDM2029', 0, 'system', 'generate', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000270, 'correct', 'KDM2030', 0, 'system', 'correct', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000271, 'getPolicyList', 'KDM2031', 0, 'system', 'getPolicyList', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000272, 'getPolicyInfo', 'KDM2032', 0, 'system', 'getPolicyInfo', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000273, 'getPolicyInfoByInsureNo', 'KDM2033', 0, 'system', 'getPolicyInfoByInsureNo', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000274, 'getInsuredPolicyListByCondition', 'KDM2034', 0, 'system', 'getInsuredPolicyListByCondition', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000275, 'getInsuredPolicyListByCustomerNo', 'KDM2035', 0, 'system', 'getInsuredPolicyListByCustomerNo', '2023-04-13 10:40:53', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000276, '分页查询Goods', 'PDM2000', 0, 'system', 'getGoodsList:(分页查询Goods)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000277, '通过GoodsCode查询Goods详细数据', 'PDM2001', 0, 'system', 'getGoods:(通过GoodsCode查询Goods详细数据)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000278, '新增Goods', 'PDM2002', 0, 'system', 'addGoods:(新增Goods)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000279, '修改Goods', 'PDM2003', 0, 'system', 'updateGoods:(修改Goods)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000280, '更改Goods的状态', 'PDM2004', 0, 'system', 'updateGoodsStatus:(更改Goods的状态)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000281, '查询所有Goods的Code和Name', 'PDM2005', 0, 'system', 'getGoodsNameAndCode:(查询所有Goods的Code和Name)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000282, 'zipGoods', 'PDM2006', 0, 'system', 'zipGoods', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000283, '查询所有的GoodsFile', 'PDM2007', 0, 'system', 'getGoodsFiles:(查询所有的GoodsFile)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000284, '新增GoodsFile', 'PDM2008', 0, 'system', 'addGoodsFile:(新增GoodsFile)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000285, '删除GoodsFile', 'PDM2009', 0, 'system', 'deleteGoodsFile:(删除GoodsFile)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000286, '分页查询package', 'PDM2010', 0, 'system', 'getPackages:(分页查询package)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000287, '查询Package', 'PDM2011', 0, 'system', 'getPackage:(查询Package)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000288, '查询package的code和name', 'PDM2012', 0, 'system', 'getPackage:(查询package的code和name)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000289, '新增Package', 'PDM2013', 0, 'system', 'addPackage:(新增Package)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000290, '修改package', 'PDM2014', 0, 'system', 'updatePackage:(修改package)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000291, '删除package', 'PDM2015', 0, 'system', 'deletePackage:(删除package)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000292, '查询商品佣金', 'PDM2016', 0, 'system', 'getGoodsCommission:(查询商品佣金)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000293, '更新商品佣金', 'PDM2017', 0, 'system', 'updateGoodsCommission:(更新商品佣金)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000294, '删除商品佣金', 'PDM2018', 0, 'system', 'deleteCommission:(删除商品佣金)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000295, '查询商品等级的因子', 'PDM2019', 0, 'system', 'getGoodsLevelFactor:(查询商品等级的因子)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000296, '更新商品等级的因子', 'PDM2020', 0, 'system', 'updateGoodsLevelFactors:(更新商品等级的因子)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000297, '通过code查询Channel详情', 'PDM2021', 0, 'system', 'getChannel:(通过code查询Channel详情)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000298, '新增Channel', 'PDM2022', 0, 'system', 'addChannel:(新增Channel)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000299, '修改Channel', 'PDM2023', 0, 'system', 'updateChannel:(修改Channel)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000300, '删除Channel', 'PDM2024', 0, 'system', 'deleteChannel:(删除Channel)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000301, 'getGoodsFormula', 'PDM2025', 0, 'system', 'getGoodsFormula', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000302, 'getGoodsLiabilities', 'PDM2026', 0, 'system', 'getGoodsLiabilities', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000303, 'getGoodsFactor', 'PDM2027', 0, 'system', 'getGoodsFactor', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000304, 'getGoodsPremiumFactorsRanges', 'PDM2028', 0, 'system', 'getGoodsPremiumFactorsRanges', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000305, '获取goods列表', 'PDM2029', 0, 'system', 'goodsList:(获取goods列表)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000306, '获取试算因子', 'PDM2030', 0, 'system', 'trialFactor:(获取试算因子)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000307, '获取商品因子范围', 'PDM2031', 0, 'system', 'range:(获取商品因子范围)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000308, '获取试算因子', 'PDM2032', 0, 'system', 'insureFactor:(获取试算因子)', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000309, 'goodsStruct', 'PDM2033', 0, 'system', 'goodsStruct', '2023-04-13 15:12:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000310, 'addCampaignCateGiftWithPurchase', 'RDM2000', 0, 'system', 'addCampaignCateGiftWithPurchase', '2023-04-13 17:22:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000311, 'query', 'RDM2001', 0, 'system', 'query', '2023-04-13 17:22:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000312, 'addCampaignCatePremiumDiscount', 'RDM2002', 0, 'system', 'addCampaignCatePremiumDiscount', '2023-04-13 17:22:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000313, 'query', 'RDM2003', 0, 'system', 'query', '2023-04-13 17:22:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000314, 'addCampaign', 'RDM2004', 0, 'system', 'addCampaign', '2023-04-13 17:22:06', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000315, 'queryCampaign', 'RDM2005', 0, 'system', 'queryCampaign', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000316, 'addCampaignRule', 'RDM2006', 0, 'system', 'addCampaignRule', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000317, 'queryCampaign', 'RDM2007', 0, 'system', 'queryCampaign', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000318, 'getInventoryCode', 'RDM2008', 0, 'system', 'getInventoryCode', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000319, 'addInventoryCode', 'RDM2009', 0, 'system', 'addInventoryCode', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000320, '功能试算（包含折扣码和优惠券）\n一次性算出保费、征费、折扣金额\n', 'RDM2010', 0, 'system', 'trialCalculation:(功能试算（包含折扣码和优惠券）\n一次性算出保费、征费、折扣金额\n试算层级：\nSA premium levy: 精确到责任层级\nunderwriting campaign coupon: 只精确到Goods层级。)', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000321, '计算未来N年的保费', 'RDM2011', 0, 'system', 'trialForNYear:(计算未来N年的保费)', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000322, 'getCampaignDetailByPromotionCode', 'RDM2012', 0, 'system', 'getCampaignDetailByPromotionCode', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000323, 'payRequest', 'RDM2013', 0, 'system', 'payRequest', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000324, 'createOrder', 'RDM2014', 0, 'system', 'createOrder', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000325, 'updateOrder', 'RDM2015', 0, 'system', 'updateOrder', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000326, 'getGroups', 'RDM2016', 0, 'system', 'getGroups', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000327, 'getGroup', 'RDM2017', 0, 'system', 'getGroup', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000328, 'addGroup', 'RDM2018', 0, 'system', 'addGroup', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000329, 'updateGroup', 'RDM2019', 0, 'system', 'updateGroup', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000330, 'deleteGroup', 'RDM2020', 0, 'system', 'deleteGroup', '2023-04-13 17:22:07', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000332, 'sendCoupons', 'SDM2016', 0, 'system', 'sendCoupons', '2023-04-13 18:30:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000333, 'add', 'VDM2000', 0, 'system', 'add', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000334, 'get', 'VDM2001', 0, 'system', 'get', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000335, 'delete', 'VDM2002', 0, 'system', 'delete', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000336, 'add', 'VDM2003', 0, 'system', 'add', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000337, 'get', 'VDM2004', 0, 'system', 'get', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000338, 'delete', 'VDM2005', 0, 'system', 'delete', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000339, 'id查询任务备注表', 'VDM2006', 0, 'system', 'findById:(id查询任务备注表)', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000340, '删除任务操作历史表', 'VDM2007', 0, 'system', 'delete:(删除任务操作历史表)', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000341, '查询任务操作历史表分页数据', 'VDM2008', 0, 'system', 'queryTaskActionLogPage:(查询任务操作历史表分页数据)', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000342, 'id查询任务操作历史表', 'VDM2009', 0, 'system', 'findById:(id查询任务操作历史表)', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000343, '根据taskId 查找', 'VDM2010', 0, 'system', 'findByTaskNo:(根据taskId 查找)', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000344, '新增任务', 'VDM2011', 0, 'system', 'add:(新增任务)', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000345, 'delete', 'VDM2012', 0, 'system', 'delete', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000346, 'update', 'VDM2013', 0, 'system', 'update', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000347, 'taskSearch', 'VDM2014', 0, 'system', 'taskSearch', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000348, 'id查询任务表', 'VDM2015', 0, 'system', 'findByTranCode:(id查询任务表)', '2023-04-13 21:08:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000354, 'queryPayments', 'GDN2000', 0, 'system', 'queryPayments', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000355, '查询用户的支付方式(当前登录态)', 'GDN2001', 0, 'system', 'queryPayments:(查询用户的支付方式(当前登录态))', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000356, 'pay', 'GDN2002', 0, 'system', 'pay', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000357, 'getPayStatus', 'GDN2003', 0, 'system', 'getPayStatus', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000358, '绑卡', 'GDN2004', 0, 'system', 'bindCard:(绑卡)', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000359, 'detachCard', 'GDN2005', 0, 'system', 'detachCard', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000360, '查询卡信息', 'GDN2006', 0, 'system', 'getBankCardInfo:(查询卡信息)', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000361, '获取第三方卡绑定信息', 'GDN2007', 0, 'system', 'getBankCardThirdBinding:(获取第三方卡绑定信息)', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000362, 'refund', 'GDN2008', 0, 'system', 'refund', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000363, 'getPaymentInfo', 'GDN2009', 0, 'system', 'getPaymentInfo', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000364, 'getCustomerBankCards', 'GDN2010', 0, 'system', 'getCustomerBankCards', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000365, '查询用户卡信息(当前登录态)', 'GDN2011', 0, 'system', 'getCustomerBankCards:(查询用户卡信息(当前登录态))', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000366, 'updateCustomerBankCard', 'GDN2012', 0, 'system', 'updateCustomerBankCard', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000367, '更新卡信息(当前登录态)', 'GDN2013', 0, 'system', 'updateCustomerBankCard:(更新卡信息(当前登录态))', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000368, 'receivePaymentResult', 'GDN2014', 0, 'system', 'receivePaymentResult', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000369, '查询支付记录列表', 'GDN2015', 0, 'system', 'getPaymentChargeList:(查询支付记录列表)', '2023-04-14 09:43:29', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000370, 'updateRenewalPolicySchedule', 'QDN2001', 0, 'system', 'updateRenewalPolicySchedule', '2023-04-14 16:32:31', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000371, 'updateRenewalPolicyPremiumSchedule', 'QDN2002', 0, 'system', 'updateRenewalPolicyPremiumSchedule', '2023-04-14 16:32:31', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000372, 'getProductAgreementList', 'RDQ2020', 0, 'system', 'getProductAgreementList', '2023-04-17 17:13:05', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000373, 'calRefundBills', 'QDS2064', 0, 'system', 'calRefundBills', '2023-04-19 16:45:28', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000374, 'loadPolicyPayee', 'KDT2061', 0, 'system', 'loadPolicyPayee', '2023-04-20 10:56:24', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000375, 'calculate', 'RDT2040', 0, 'system', 'calculate', '2023-04-20 17:44:55', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000376, '查询卡信息', 'ODU2039', 0, 'system', 'getBankCardInfo:(查询卡信息)', '2023-04-21 14:45:49', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000377, '新增任务', 'QDU2008', 0, 'system', 'add:(新增任务)', '2023-04-21 16:55:02', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000378, 'delete', 'QDU2009', 0, 'system', 'delete', '2023-04-21 16:55:02', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000379, 'update', 'QDU2010', 0, 'system', 'update', '2023-04-21 16:55:02', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000380, 'taskSearch', 'QDU2011', 0, 'system', 'taskSearch', '2023-04-21 16:55:02', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000381, 'id查询任务表', 'QDU2012', 0, 'system', 'findByTranCode:(id查询任务表)', '2023-04-21 16:55:02', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000382, 'getCustomerBankCards', 'QDU2037', 0, 'system', 'getCustomerBankCards', '2023-04-21 16:57:54', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000383, 'calculatePayFrequencyType', 'QDU2054', 0, 'system', 'calculatePayFrequencyType', '2023-04-21 16:58:03', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000384, 'calculateSumInsured', 'QDU2055', 0, 'system', 'calculateSumInsured', '2023-04-21 16:58:03', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000385, 'getTemplateDetail', 'ODW2050', 0, 'system', 'getTemplateDetail', '2023-04-23 14:34:17', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000386, 'election', 'ODW2051', 0, 'system', 'election', '2023-04-23 14:34:17', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000387, 'getElectionIP', 'ODW2052', 0, 'system', 'getElectionIP', '2023-04-23 14:34:17', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000388, 'heathCheck', 'ODW2053', 0, 'system', 'heathCheck', '2023-04-23 14:34:17', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000389, 'execJob', 'ODW2054', 0, 'system', 'execJob', '2023-04-23 14:34:17', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000390, '创建索引', 'PDX2067', 0, 'system', 'create:(创建索引)', '2023-04-24 15:23:16', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000391, '删除索引', 'PDX2068', 0, 'system', 'delete:(删除索引)', '2023-04-24 15:23:16', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000392, '查询文档', 'RDY2030', 0, 'system', 'getDocument:(查询文档)', '2023-04-25 17:13:19', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000393, 'myBillList', 'UDZ2000', 0, 'system', 'myBillList', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000394, '账单支付订单', 'UDZ2001', 0, 'system', 'payOrder:(账单支付订单)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000395, 'codeDetail', 'UDZ2002', 0, 'system', 'codeDetail', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000396, 'firstNoDiscount', 'UDZ2003', 0, 'system', 'firstNoDiscount', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000397, 'listCodes', 'UDZ2004', 0, 'system', 'listCodes', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000398, 'checkHolder', 'UDZ2005', 0, 'system', 'checkHolder', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000399, '根据商品ID获取商品计划列表', 'UDZ2006', 0, 'system', 'goodsPlan:(根据商品ID获取商品计划列表)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000400, 'saRange', 'UDZ2007', 0, 'system', 'saRange', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000401, 'ageCheck', 'UDZ2008', 0, 'system', 'ageCheck', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000402, 'planIdTransfer', 'UDZ2009', 0, 'system', 'planIdTransfer', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000403, 'insuredTotal', 'UDZ2010', 0, 'system', 'insuredTotal', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000404, '税务信息国家列表', 'UDZ2011', 0, 'system', 'taxCountryList:(税务信息国家列表)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000405, 'goodsStatus', 'UDZ2012', 0, 'system', 'goodsStatus', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000406, 'premium', 'UDZ2013', 0, 'system', 'premium', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000407, 'premiumBatch', 'UDZ2014', 0, 'system', 'premiumBatch', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000408, 'premiumForNextYear', 'UDZ2015', 0, 'system', 'premiumForNextYear', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000409, 'premiumForNYear', 'UDZ2016', 0, 'system', 'premiumForNYear', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000410, 'premiumForLiability', 'UDZ2017', 0, 'system', 'premiumForLiability', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000411, 'factorsDynamic', 'UDZ2018', 0, 'system', 'factorsDynamic', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000412, '试算-根据保费计算现金价值、身故赔偿、征费等', 'UDZ2019', 0, 'system', 'premiumSaving:(试算-根据保费计算现金价值、身故赔偿、征费等)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000413, '获取最大保费接口', 'UDZ2020', 0, 'system', 'premiumMax:(获取最大保费接口)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000414, 'continueUWLoop', 'UDZ2021', 0, 'system', 'continueUWLoop', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000415, 'getUwOutcome', 'UDZ2022', 0, 'system', 'getUwOutcome', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000416, 'createUwApplication', 'UDZ2023', 0, 'system', 'createUwApplication', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000417, '验证banca的token信息， 会绑定session\n两种登录', 'UDZ2024', 0, 'system', 'validateTokenInfo:(验证banca的token信息， 会绑定session\n两种登录方式\n1.openId  未授权客户\n2.userId  已授权客户\n同时会把bank的 hkid、email、phone依次优先级匹配life账号，如果匹配账号到就进行绑定\n如果是注册的新用户将在life登录接口完成绑定，最后进行职业和worldcheck校验，)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000418, 'clickWindow', 'UDZ2025', 0, 'system', 'clickWindow', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000419, '查询保单列表', 'UDZ2026', 0, 'system', 'list:(查询保单列表)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000420, '保单详情', 'UDZ2027', 0, 'system', 'detail:(保单详情)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000421, '保单总现价', 'UDZ2028', 0, 'system', 'cashValueTotal:(保单总现价)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000422, 'keepalive', 'UDZ2029', 0, 'system', 'keepalive', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000423, 'location', 'UDZ2030', 0, 'system', 'location', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000424, 'health', 'UDZ2031', 0, 'system', 'health', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000425, 'addWhiteIp', 'UDZ2032', 0, 'system', 'addWhiteIp', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000426, 'addWorldCheckList', 'UDZ2033', 0, 'system', 'addWorldCheckList', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000427, 'request', 'UDZ2034', 0, 'system', 'request', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000428, 'confirm', 'UDZ2035', 0, 'system', 'confirm', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000429, 'channel', 'UDZ2036', 0, 'system', 'channel', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000430, 'webhook', 'UDZ2037', 0, 'system', 'webhook', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000431, 'result', 'UDZ2038', 0, 'system', 'result', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000432, '订单列表', 'UDZ2039', 0, 'system', 'list:(订单列表)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000433, '订单详情', 'UDZ2040', 0, 'system', 'detail:(订单详情)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000434, 'submit', 'UDZ2041', 0, 'system', 'submit', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000435, '获取投保因子', 'UDZ2042', 0, 'system', 'factorsLevel:(获取投保因子)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000436, 'summaryCal', 'UDZ2043', 0, 'system', 'summaryCal', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000437, 'calBatch', 'UDZ2044', 0, 'system', 'calBatch', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000438, 'checkSa', 'UDZ2045', 0, 'system', 'checkSa', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000439, 'confirm', 'UDZ2046', 0, 'system', 'confirm', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000440, 'uwConfirm', 'UDZ2047', 0, 'system', 'uwConfirm', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000441, '1.更换营销码  2.不使用营销码  3.如果没有传订单号，则只', 'UDZ2048', 0, 'system', 'updatePromoCode:(1.更换营销码  2.不使用营销码  3.如果没有传订单号，则只进行校验功能\n<p>\n1.2 都需要更新订单账单)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000442, 'emailCheck', 'UDZ2049', 0, 'system', 'emailCheck', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000443, '国籍校验', 'UDZ2050', 0, 'system', 'nationalityCheck:(国籍校验)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000444, 'sign in with username/pwd, third', 'UDZ2051', 0, 'system', 'signIn:(sign in with username/pwd, third-party, telephone/code or email/code/pwd)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000445, 'sign out, remove the token from ', 'UDZ2052', 0, 'system', 'signOut:(sign out, remove the token from cache)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000446, 'isRegistered', 'UDZ2053', 0, 'system', 'isRegistered', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000447, 'check whether insured exist', 'UDZ2054', 0, 'system', 'checkExistInsuredByCertiInfo:(check whether insured exist)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000448, 'check whether certi binded to us', 'UDZ2055', 0, 'system', 'isCertiBinded:(check whether certi binded to user account)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000449, 'user registration verification c', 'UDZ2056', 0, 'system', 'verificationCode:(user registration verification code)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000450, 'verify email code', 'UDZ2057', 0, 'system', 'checkVerifiedCode:(verify email code)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000451, '退保请求并计算保费', 'UDZ2058', 0, 'system', 'posRequest:(退保请求并计算保费)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000452, '退保请求并计算保费', 'UDZ2059', 0, 'system', 'posConfirm:(退保请求并计算保费)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000453, '查询保全列表', 'UDZ2060', 0, 'system', 'posList:(查询保全列表)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000454, '更改保单续期代扣保全', 'UDZ2061', 0, 'system', 'policyWithhold:(更改保单续期代扣保全)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000455, '查询保全详情', 'UDZ2062', 0, 'system', 'posOnlineDetail:(查询保全详情)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000456, '查询保全详情, 目前只有犹豫期退保使用', 'UDZ2063', 0, 'system', 'posDetail:(查询保全详情, 目前只有犹豫期退保使用)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000457, 'checkApplyPos', 'UDZ2064', 0, 'system', 'checkApplyPos', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000458, 'modifyBeneficiary', 'UDZ2065', 0, 'system', 'modifyBeneficiary', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000459, '查询用户详情', 'UDZ2066', 0, 'system', 'detail:(查询用户详情)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000460, '登录状态下查询我的被保人列表', 'UDZ2067', 0, 'system', 'getMyInsuredList:(登录状态下查询我的被保人列表)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000461, '客户风险校验', 'UDZ2068', 0, 'system', 'worldCheck:(客户风险校验)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000462, 'World check', 'UDZ2069', 0, 'system', 'hasPolicyAndOrder:(World check)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000463, '2FA页面详情', 'UDZ2070', 0, 'system', 'get2FaDetail:(2FA页面详情)', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000464, 'downLoadFile', 'UDZ2071', 0, 'system', 'downLoadFile', '2023-04-26 20:44:12', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000465, 'query', 'UDZ2075', 0, 'system', 'query', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000466, 'queryPolicyTotalList', 'UDZ2079', 0, 'system', 'queryPolicyTotalList', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000467, 'checkCouponInfo', 'UDZ2080', 0, 'system', 'checkCouponInfo', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000468, 'downloadAttachment', 'UDZ2081', 0, 'system', 'downloadAttachment', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000469, 'insuredWidgetsInfo', 'UDZ2087', 0, 'system', 'insuredWidgetsInfo', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000470, 'savingWidgetsInfo', 'UDZ2088', 0, 'system', 'savingWidgetsInfo', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000471, 'queryStandardIrr', 'UDZ2091', 0, 'system', 'queryStandardIrr', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000472, '是否实名', 'UDZ2103', 0, 'system', 'authCustomerCheck:(是否实名)', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000473, '投保申请授权', 'UDZ2104', 0, 'system', 'authCustomer:(投保申请授权)', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000474, '投保申请授权信息查询', 'UDZ2105', 0, 'system', 'getAuthCustomerInfo:(投保申请授权信息查询)', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000475, '订单提交', 'UDZ2106', 0, 'system', 'submit:(订单提交)', '2023-04-26 20:53:35', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000476, '核保确认', 'UDZ2107', 0, 'system', 'uwConfirm:(核保确认)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000477, '更新订单状态为待支付(H5调用)', 'UDZ2108', 0, 'system', 'modifyOrderStatus:(更新订单状态为待支付(H5调用))', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000478, '客户实名接口(bling调用)', 'UDZ2109', 0, 'system', 'orderAuthCustomer:(客户实名接口(bling调用))', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000479, '投保单确认(bling调用)', 'UDZ2110', 0, 'system', 'confirm:(投保单确认(bling调用))', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000480, '订单详情', 'UDZ2111', 0, 'system', 'detail:(订单详情)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000481, '核保一问一答', 'UDZ2112', 0, 'system', 'continueUWLoop:(核保一问一答)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000482, '获取核保结论', 'UDZ2113', 0, 'system', 'getUwOutcome:(获取核保结论)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000483, '创建核保问卷', 'UDZ2114', 0, 'system', 'createUwApplication:(创建核保问卷)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000484, '试算', 'UDZ2115', 0, 'system', 'premium:(试算)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000485, '根据商品ID获取商品计划列表', 'UDZ2116', 0, 'system', 'goodsPlan:(根据商品ID获取商品计划列表)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000486, '查询并验证营销码', 'UDZ2117', 0, 'system', 'codeDetail:(查询并验证营销码)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000487, '获取投保因子', 'UDZ2118', 0, 'system', 'factorsLevel:(获取投保因子)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000488, '投保申请单详细信息查询', 'UDZ2119', 0, 'system', 'getApplicationOrder:(投保申请单详细信息查询)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000489, '投保申请单状态查询', 'UDZ2120', 0, 'system', 'getApplicationOrderStatus:(投保申请单状态查询)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000490, '投保申请单支付结果通知', 'UDZ2121', 0, 'system', 'payResults:(投保申请单支付结果通知)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000491, '投保申请单权益演示', 'UDZ2122', 0, 'system', 'benefitsIllustrations:(投保申请单权益演示)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000492, '投保申请单校验(bling调用)', 'UDZ2123', 0, 'system', 'applicationCheck:(投保申请单校验(bling调用))', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000493, '客户是否注册', 'UDZ2124', 0, 'system', 'checkChannelUser:(客户是否注册)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000494, '证件号是否绑定客户', 'UDZ2125', 0, 'system', 'isCertiBinded:(证件号是否绑定客户)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000495, '手机号和邮箱是否注册', 'UDZ2126', 0, 'system', 'isRegistered:(手机号和邮箱是否注册)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000496, '客户是否理赔过', 'UDZ2127', 0, 'system', 'hasClaim:(客户是否理赔过)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000497, '客户是否有支付订单，出过保单，或超过风险保额', 'UDZ2128', 0, 'system', 'userBizInfo:(客户是否有支付订单，出过保单，或超过风险保额)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000498, 'storeHkidInfo', 'UDZ2129', 0, 'system', 'storeHkidInfo', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000499, '设置弹窗状态为不弹窗', 'UDZ2130', 0, 'system', 'clickWindow:(设置弹窗状态为不弹窗)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000500, 'Bling查询保单列表过度版本', 'UDZ2133', 0, 'system', 'policyList:(Bling查询保单列表过度版本)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000501, '被保人人脸比对', 'UDZ2142', 0, 'system', 'compareFace:(被保人人脸比对)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000502, '被保人confirm或reject信息', 'UDZ2143', 0, 'system', 'conclusion:(被保人confirm或reject信息)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000503, 'checkInsuredSa', 'UDZ2156', 0, 'system', 'checkInsuredSa', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000504, 'ocrUploadStatus', 'UDZ2162', 0, 'system', 'ocrUploadStatus', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000505, '更改保单的successive policy holder', 'UDZ2174', 0, 'system', 'successiveHolder:(更改保单的successive policy holder)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000506, '客户是否已经购买过某产品', 'UDZ2183', 0, 'system', 'hasOrderedProduct:(客户是否已经购买过某产品)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000507, 'uploadFile', 'UDZ2186', 0, 'system', 'uploadFile', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000508, '用户上传ocr', 'UDZ2187', 0, 'system', 'ocrFile:(用户上传ocr)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000509, 'reUploadFile', 'UDZ2188', 0, 'system', 'reUploadFile', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000510, '上傳审核文件', 'UDZ2189', 0, 'system', 'uploadFile:(上傳审核文件)', '2023-04-26 20:53:36', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000511, 'deleteCustomerInfo', 'QD02000', 0, 'system', 'deleteCustomerInfo', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000512, 'deleteOrderInfo', 'QD02001', 0, 'system', 'deleteOrderInfo', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000513, 'deleteOrderALLInfo', 'QD02002', 0, 'system', 'deleteOrderALLInfo', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000514, 'expireOrder', 'QD02003', 0, 'system', 'expireOrder', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000515, 'createOrder', 'QD02004', 0, 'system', 'createOrder', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000516, 'updateOrder', 'QD02005', 0, 'system', 'updateOrder', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000517, 'cancelOrder', 'QD02006', 0, 'system', 'cancelOrder', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000518, 'payOrder', 'QD02007', 0, 'system', 'payOrder', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000519, 'queryOrderInfo', 'QD02008', 0, 'system', 'queryOrderInfo', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000520, 'listOrderByHolder', 'QD02009', 0, 'system', 'listOrderByHolder', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000521, 'listOrderByInsuredCustomerId', 'QD02010', 0, 'system', 'listOrderByInsuredCustomerId', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000522, 'listOrderByCustomerId', 'QD02011', 0, 'system', 'listOrderByCustomerId', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000523, 'queryOrderList', 'QD02012', 0, 'system', 'queryOrderList', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000524, 'updateOrderUserInfo', 'QD02013', 0, 'system', 'updateOrderUserInfo', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000525, 'modifyOrderStatus', 'QD02014', 0, 'system', 'modifyOrderStatus', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000526, 'queryConditionOrderList', 'QD02015', 0, 'system', 'queryConditionOrderList', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000527, 'paymentAuditIssuance', 'QD02016', 0, 'system', 'paymentAuditIssuance', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000528, 'payConfimRequest', 'QD02017', 0, 'system', 'payConfimRequest', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000529, 'payOrderAndRefund', 'QD02018', 0, 'system', 'payOrderAndRefund', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000530, 'orderOTPCheck', 'QD02019', 0, 'system', 'orderOTPCheck', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000531, 'queryPaymentOrderList', 'QD02020', 0, 'system', 'queryPaymentOrderList', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000532, 'updateOrderUWOutcome', 'QD02021', 0, 'system', 'updateOrderUWOutcome', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000533, 'createOrderdUwApplication', 'QD02022', 0, 'system', 'createOrderdUwApplication', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000534, 'getOrderNo', 'QD02023', 0, 'system', 'getOrderNo', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000535, 'insuredConclusion', 'QD02024', 0, 'system', 'insuredConclusion', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000536, 'certiOCRVerify', 'QD02025', 0, 'system', 'certiOCRVerify', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000537, 'declareInfo', 'QD02026', 0, 'system', 'declareInfo', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000538, 'payOrderRenew', 'QD02027', 0, 'system', 'payOrderRenew', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000539, '删除订单信息', 'QD02028', 0, 'system', 'deleteOrderInfo:(删除订单信息)', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000540, 'listOrderByCustomerId', 'QD02029', 0, 'system', 'listOrderByCustomerId', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000541, 'saveIpCheckFlow', 'QD02030', 0, 'system', 'saveIpCheckFlow', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000542, 'querySavingCoupon', 'QD02031', 0, 'system', 'querySavingCoupon', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000543, 'addSavingCoupon', 'QD02032', 0, 'system', 'addSavingCoupon', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000544, 'queryCoupon', 'QD02033', 0, 'system', 'queryCoupon', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000545, 'addCoupon', 'QD02034', 0, 'system', 'addCoupon', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000546, 'orderDeleteHistoryUwDataTask', 'QD02035', 0, 'system', 'orderDeleteHistoryUwDataTask', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000547, 'orderAuthCustomer', 'QD02036', 0, 'system', 'orderAuthCustomer', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000548, 'orderPaySuccessToIssue', 'QD02037', 0, 'system', 'orderPaySuccessToIssue', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000549, 'hc', 'QD02038', 0, 'system', 'hc', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000550, 'run', 'QD02039', 0, 'system', 'run', '2023-04-27 16:32:47', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000551, 'process issuance, all logic whic', 'QD02040', 0, '黄宏渊', 'processIssuance:(process issuance, all logic which related to issuance system will be via this\nfunction invoke implement method need by transaction type)', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000552, '检查发起规则', 'QD02041', 0, '黄宏渊', 'checkProposalRule:(检查发起规则)', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000553, 'get inform question from xd', 'QD02042', 0, '黄宏渊', 'getInformQuestion:(get inform question from xd)', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000554, 'snatch summary review result', 'QD02043', 0, '黄宏渊', 'getSummaryReview:(snatch summary review result)', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000555, 'payment process ,dispatch reques', 'QD02044', 0, '黄宏渊', 'paymentProcess:(payment process ,dispatch request by Payment action)', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000556, 'query bizapply info by source co', 'QD02045', 0, '黄宏渊', 'queryBizapplyInfo:(query bizapply info by source code or bizapply id)', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000557, 'continueUWLoop', 'QD02046', 0, '黄宏渊', 'continueUWLoop', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000558, 'createUWApplication', 'QD02047', 0, '黄宏渊', 'createUWApplication', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000559, 'get uw outcome', 'QD02048', 0, '黄宏渊', 'getUWApplicationOutcome:(get uw outcome)', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000560, 'getUWMultiApplicationOutcome', 'QD02049', 0, '黄宏渊', 'getUWMultiApplicationOutcome', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000561, 'update uw factors', 'QD02050', 0, '黄宏渊', 'updateUWFactors:(update uw factors)', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000562, 'anonymize uw date', 'QD02051', 0, '黄宏渊', 'anonymizeUWData:(anonymize uw date)', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000563, 'snatchUWCfg', 'QD02052', 0, '黄宏渊', 'snatchUWCfg', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000564, 'deleteOrderUwDataPatchJob', 'QD02053', 0, '黄宏渊', 'deleteOrderUwDataPatchJob', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000565, 'applicationCreate', 'QD02054', 0, '黄宏渊', 'applicationCreate', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000566, 'underwriting', 'QD02055', 0, '黄宏渊', 'underwriting', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000567, 'markAsComplete', 'QD02056', 0, '黄宏渊', 'markAsComplete', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000568, 'outcome', 'QD02057', 0, '黄宏渊', 'outcome', '2023-04-27 16:34:02', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000569, 'reinstatementPay', 'QD02058', 0, '黄宏渊', 'reinstatementPay', '2023-04-27 16:34:02', '2023-06-09 14:05:35', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000570, 'reinstatementCompliance', 'QD02059', 0, '黄宏渊', 'reinstatementCompliance', '2023-04-27 16:34:02', '2023-06-09 14:05:35', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000571, 'ok页面', 'QD02060', 0, '黄宏渊', 'ok:(ok页面)', '2023-04-27 16:34:02', '2023-06-09 14:05:35', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000572, 'health页面', 'QD02061', 0, '黄宏渊', 'health:(health页面)', '2023-04-27 16:34:02', '2023-06-09 14:05:35', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000573, 'getInfo', 'QD02062', 0, '黄宏渊', 'getInfo', '2023-04-27 16:34:02', '2023-06-09 14:05:35', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000574, 'health页面', 'QD02063', 0, 'system', 'health:(health页面)', '2023-04-27 16:39:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000575, '保费试算-在线出单', 'QD02064', 0, 'system', 'calculatePremium:(保费试算-在线出单)', '2023-04-27 16:39:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000576, '创建投保单 <br/>\n入参', 'QD02065', 0, 'system', 'createIssuance:(创建投保单 <br/>\n入参：IssuanceTransactionTypeEnum 交易类型，1:核保并创建投保单,2:核保并创建投保单，并确认投保单,3:核保加费出单\nIssuanceSceneTypeEnum:1:graphene,2:安安人寿)', '2023-04-27 16:39:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000577, '出单 <br/>', 'QD02066', 0, 'system', 'confirmIssuance:(出单 <br/>)', '2023-04-27 16:39:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000578, '取消核保-在线出单', 'QD02067', 0, 'system', 'cancelIssuance:(取消核保-在线出单)', '2023-04-27 16:39:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000579, 'pendingIssuance', 'QD02068', 0, 'system', 'pendingIssuance', '2023-04-27 16:39:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000580, '核保通过修改保单<br/>', 'QD02069', 0, 'system', 'modifyIssuance:(核保通过修改保单<br/>)', '2023-04-27 16:39:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000581, '查询投保单信息，根据bizapplyid和goodsplanid', 'QD02070', 0, 'system', 'queryIssuanceByCondition:(查询投保单信息，根据bizapplyid和goodsplanid必填)', '2023-04-27 16:39:48', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000582, '投保申请单支付校验(bling调用)', 'QD02123', 1, 'system', 'applicationPaymentCheck:(投保申请单支付校验(bling调用))', '2023-04-27 16:59:00', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000583, 'syncSavingUwInfo', 'QEV2019', 0, '黄宏渊', 'syncSavingUwInfo', '2023-05-22 16:32:51', '2023-06-09 14:05:35', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000592, 'sss', '1661660613543198720', 0, 'system', NULL, '2023-05-25 17:08:57', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000593, 'getUwInfoByOrderNo', 'SEY2020', 0, '黄宏渊', 'getUwInfoByOrderNo', '2023-05-25 18:27:46', '2023-06-09 14:05:35', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000594, 'getProductCategoryByProductId', 'SEY2021', 0, '黄宏渊', 'getProductCategoryByProductId', '2023-05-25 18:27:46', '2023-06-09 14:05:35', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000595, 'getApplyInfo', '1661927952943677440', 0, 'system', 'getApplyInfo', '2023-05-26 10:51:15', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000596, 'getProductIdByOrderNo', 'REZ2004', 0, 'system', 'getProductIdByOrderNo', '2023-05-26 17:38:38', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000597, 'findKey', '1664110128195960832', 0, 'system', 'find specific key', '2023-06-01 11:22:26', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000598, 'get_test', '1664112073048588288', 0, 'system', 'get test', '2023-06-01 11:30:10', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000601, '1111', 'RFB2002', 0, 'system', 'ss', '2023-06-02 17:40:33', '2023-06-07 17:21:56', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000602, 'getBizApplyUWMultiApplicationOutcome', 'OFF2020', 0, '黄宏渊', 'getBizApplyUWMultiApplicationOutcome', '2023-06-06 14:51:37', '2023-06-09 14:05:34', 'system', 'system', 'N');
INSERT INTO `t_api` VALUES (100000603, 'getBizApplyUWApplicationOutcome', 'OFF2021', 0, '黄宏渊', 'getBizApplyUWApplicationOutcome', '2023-06-06 14:51:37', '2023-06-09 14:05:34', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_api_group
-- ----------------------------
DROP TABLE IF EXISTS `t_api_group`;
CREATE TABLE `t_api_group`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `api_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api code',
  `group_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'api group code',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_api_code`(`api_code`) USING BTREE,
  INDEX `idx_group_code`(`group_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000004 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Api group mapping' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_api_group
-- ----------------------------
INSERT INTO `t_api_group` VALUES (100000003, 'QDN2002', 'NB', '2023-04-17 20:35:28', '2023-04-17 20:35:28', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_api_tenant
-- ----------------------------
DROP TABLE IF EXISTS `t_api_tenant`;
CREATE TABLE `t_api_tenant`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `api_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api code',
  `tenant_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'api tenant code',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_api_code`(`api_code`) USING BTREE,
  INDEX `idx_tenant_code`(`tenant_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000007 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Api tenant mapping' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_api_tenant
-- ----------------------------
INSERT INTO `t_api_tenant` VALUES (100000004, 'QDN2002', 'Bling', '2023-04-17 20:35:28', '2023-04-17 20:35:28', 'system', 'system', 'N');
INSERT INTO `t_api_tenant` VALUES (100000005, 'KDM2028', 'Bling', '2023-04-21 11:00:36', '2023-04-21 11:00:36', 'system', 'system', 'N');
INSERT INTO `t_api_tenant` VALUES (100000006, 'KDM2028', 'ARK', '2023-04-21 11:00:36', '2023-04-21 11:00:36', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_api_version
-- ----------------------------
DROP TABLE IF EXISTS `t_api_version`;
CREATE TABLE `t_api_version`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `api_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api code',
  `method` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api request method',
  `src_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api request origin url',
  `des_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api proxy forwarding url',
  `service_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api service code',
  `content_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api content type',
  `env` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api env',
  `inner` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT 'inner api',
  `need_rate_limit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT 'rate limit switch',
  `rate_limit` int(0) NULL DEFAULT NULL COMMENT 'rate limit size',
  `need_breaker` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT 'breaker switch',
  `breaker_err_per_threshold` int(0) NULL DEFAULT 50 COMMENT 'error per threshold',
  `need_fallback` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT 'fallback switch',
  `fallback` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'fallback information',
  `need_monitor` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT 'monitor switch',
  `need_api_auth` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT 'api auth switch',
  `read_timeout` int(0) NOT NULL DEFAULT 10000 COMMENT 'api request timeout',
  `ignore_header_params` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ignore header params',
  `ignore_query_params` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ignore query params',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`api_code`, `env`, `is_deleted`) USING BTREE,
  UNIQUE INDEX `idx_url_method`(`method`, `src_url`, `env`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000622 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Api version define' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_api_version
-- ----------------------------
INSERT INTO `t_api_version` VALUES (100000000, 'VDI2000', 'POST', '/life-document/api/files/upload', '/life-document/api/files/upload', 'life-document', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:16', '2023-04-09 21:38:16', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000001, 'VDI2001', 'GET', '/life-document/api/files/download/{{fileUniqueCode}}', '/life-document/api/files/download/{{fileUniqueCode}}', 'life-document', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:16', '2023-04-09 21:38:16', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000003, 'VDI2003', 'GET', '/life-document/api/files/downloadFile/{{fileUniqueCode}}', '/life-document/api/files/downloadFile/{{fileUniqueCode}}', 'life-document', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:16', '2023-04-09 21:38:16', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000004, 'VDI2010', 'GET', '/life-user/roles', '/life-user/roles', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000005, 'VDI2011', 'POST', '/life-user/role', '/life-user/role', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000006, 'VDI2012', 'PUT', '/life-user/roles/{{roleCode}}', '/life-user/roles/{{roleCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000007, 'VDI2013', 'DELETE', '/life-user/roles/{{roleCode}}', '/life-user/roles/{{roleCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000008, 'VDI2014', 'POST', '/life-user/roles/{{account}}/binding', '/life-user/roles/{{account}}/binding', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000009, 'VDI2015', 'POST', '/life-user/roles/{{account}}/unbinding', '/life-user/roles/{{account}}/unbinding', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000010, 'VDI2016', 'POST', '/life-user/roles/{{roleCode}}/binding/privilege', '/life-user/roles/{{roleCode}}/binding/privilege', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000011, 'VDI2017', 'POST', '/life-user/roles/{{roleCode}}/unbinding/privilege', '/life-user/roles/{{roleCode}}/unbinding/privilege', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000012, 'VDI2018', 'GET', '/life-user/privileges', '/life-user/privileges', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000013, 'VDI2019', 'POST', '/life-user/privilege', '/life-user/privilege', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000014, 'VDI2020', 'PUT', '/life-user/privileges/{{privilegeCode}}', '/life-user/privileges/{{privilegeCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000015, 'VDI2021', 'DELETE', '/life-user/privileges/{{privilegeCode}}', '/life-user/privileges/{{privilegeCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000016, 'VDI2022', 'GET', '/life-user/menus', '/life-user/menus', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000017, 'VDI2023', 'POST', '/life-user/menu', '/life-user/menu', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000018, 'VDI2024', 'PUT', '/life-user/menus/{{resourceCode}}', '/life-user/menus/{{resourceCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000019, 'VDI2025', 'DELETE', '/life-user/menus/{{resourceCode}}', '/life-user/menus/{{resourceCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000020, 'VDI2026', 'POST', '/life-user/menus/{{resourceCode}}/binding/privilege', '/life-user/menus/{{resourceCode}}/binding/privilege', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000021, 'VDI2027', 'POST', '/life-user/menus/{{resourceCode}}/unbinding/privilege', '/life-user/menus/{{resourceCode}}/unbinding/privilege', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000022, 'VDI2028', 'GET', '/life-user/user/{{token}}', '/life-user/user/{{token}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000023, 'VDI2029', 'POST', '/life-user/logout/{{token}}', '/life-user/logout/{{token}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000024, 'VDI2030', 'GET', '/life-user/salt', '/life-user/salt', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000025, 'VDI2031', 'POST', '/life-user/login', '/life-user/login', 'life-user', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000026, 'VDI2032', 'GET', '/life-user/users', '/life-user/users', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000027, 'VDI2033', 'POST', '/life-user/user', '/life-user/user', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000028, 'VDI2034', 'PUT', '/life-user/users/{{userNo}}', '/life-user/users/{{userNo}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000029, 'VDI2035', 'PUT', '/life-user/users/{{userNo}}/resetPwd', '/life-user/users/{{userNo}}/resetPwd', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:53', '2023-04-09 21:38:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000030, 'VDI2036', 'POST', '/life-login/api/users/login', '/life-login/api/users/login', 'life-login', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:55', '2023-04-09 21:38:55', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000031, 'VDI2037', 'GET', '/life-login/api/users', '/life-login/api/users', 'life-login', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:55', '2023-04-09 21:38:55', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000032, 'VDI2038', 'GET', '/life-login/inner/users/{{userId}}', '/life-login/inner/users/{{userId}}', 'life-login', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:55', '2023-04-09 21:38:55', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000033, 'VDI2039', 'GET', '/life-login/inner/users/tokens/{{securityToken}}', '/life-login/inner/users/tokens/{{securityToken}}', 'life-login', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:56', '2023-04-09 21:38:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000034, 'VDI2041', 'POST', '/life-product/manage/products', '/life-product/manage/products', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000035, 'VDI2042', 'GET', '/life-product/manage/product/{{productCode}}', '/life-product/manage/product/{{productCode}}', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000036, 'VDI2043', 'POST', '/life-product/manage/product', '/life-product/manage/product', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000037, 'VDI2044', 'PUT', '/life-product/manage/product', '/life-product/manage/product', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000038, 'VDI2045', 'PUT', '/life-product/manage/product/{{productCode}}/status/offline', '/life-product/manage/product/{{productCode}}/status/offline', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000039, 'VDI2046', 'PUT', '/life-product/manage/product/{{productCode}}/status/online', '/life-product/manage/product/{{productCode}}/status/online', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000040, 'VDI2047', 'GET', '/life-product/manage/products/code-and-name', '/life-product/manage/products/code-and-name', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000041, 'VDI2048', 'GET', '/life-product/manage/{{productCode}}/agreement/{{agreementCode}}', '/life-product/manage/{{productCode}}/agreement/{{agreementCode}}', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000042, 'VDI2049', 'POST', '/life-product/manage/{{productCode}}/agreement', '/life-product/manage/{{productCode}}/agreement', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000043, 'VDI2050', 'PUT', '/life-product/manage/{{productCode}}/agreement', '/life-product/manage/{{productCode}}/agreement', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000044, 'VDI2051', 'GET', '/life-product/inner/product/{{productCode}}/formulas', '/life-product/inner/product/{{productCode}}/formulas', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000045, 'VDI2052', 'GET', '/life-product/inner/product/{{productCode}}/liabilities', '/life-product/inner/product/{{productCode}}/liabilities', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000046, 'VDI2053', 'GET', '/life-product/inner/product/{{productCode}}/agreement/{{agreementCode}}', '/life-product/inner/product/{{productCode}}/agreement/{{agreementCode}}', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000047, 'VDI2054', 'GET', '/life-product/inner/product/{{productCode}}', '/life-product/inner/product/{{productCode}}', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000048, 'VDI2056', 'GET', '/life-dict/api/i18ns/keys', '/life-dict/api/i18ns/keys', 'life-dict', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:39:15', '2023-04-09 21:39:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000049, 'VDI2057', 'GET', '/life-dict/api/dicts/keys', '/life-dict/api/dicts/keys', 'life-dict', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:39:15', '2023-04-09 21:39:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000050, 'VDI2058', 'GET', '/life-dict/api/dicts/keys/{{key}}', '/life-dict/api/dicts/keys/{{key}}', 'life-dict', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:39:15', '2023-04-09 21:39:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000051, 'VDI2059', 'GET', '/life-dict/api/dicts/keys/{{key}}/codes/{{code}}', '/life-dict/api/dicts/keys/{{key}}/codes/{{code}}', 'life-dict', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:39:15', '2023-04-09 21:39:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000052, 'VDI2060', 'GET', '/life-dict/inner/dicts', '/life-dict/inner/dicts', 'life-dict', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:39:15', '2023-04-09 21:39:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000053, 'VDI2061', 'GET', '/life-dict/inner/i18ns/keys/languages/{{lang}}', '/life-dict/inner/i18ns/keys/languages/{{lang}}', 'life-dict', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:39:15', '2023-04-09 21:39:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000054, 'VDI2062', 'GET', '/life-dict/inner/dicts/keys', '/life-dict/inner/dicts/keys', 'life-dict', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:39:15', '2023-04-09 21:39:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000055, 'VDI2063', 'GET', '/life-dict/inner/dicts/keys/languages/{{lang}}', '/life-dict/inner/dicts/keys/languages/{{lang}}', 'life-dict', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:39:15', '2023-04-09 21:39:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000056, 'VDI2064', 'GET', '/life-dict/inner/dicts/keys/{{key}}/languages/{{lang}}', '/life-dict/inner/dicts/keys/{{key}}/languages/{{lang}}', 'life-dict', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:39:15', '2023-04-09 21:39:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000057, 'VDI2065', 'GET', '/life-dict/inner/dicts/keys/{{key}}/codes/{{code}}/languages/{{lang}}', '/life-dict/inner/dicts/keys/{{key}}/codes/{{code}}/languages/{{lang}}', 'life-dict', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:39:15', '2023-04-09 21:39:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000058, 'KDG2000', 'GET', '/life-customer/api/customers', '/life-customer/api/customers', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000059, 'KDG2001', 'PUT', '/life-customer/api/customers', '/life-customer/api/customers', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000060, 'KDG2002', 'GET', '/life-customer/api/customers/insureds', '/life-customer/api/customers/insureds', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000061, 'KDG2003', 'POST', '/life-customer/api/customers/certificates/status', '/life-customer/api/customers/certificates/status', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000062, 'KDG2004', 'POST', '/life-customer/api/customers/verification-code', '/life-customer/api/customers/verification-code', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000063, 'KDG2005', 'POST', '/life-customer/api/customers/verification-code/{{verificationCode}}', '/life-customer/api/customers/verification-code/{{verificationCode}}', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000064, 'KDG2006', 'POST', '/life-customer/api/customers/corrections/types/{{correctType}}/checks', '/life-customer/api/customers/corrections/types/{{correctType}}/checks', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000065, 'KDG2007', 'POST', '/life-customer/api/customers/corrections/types/{{correctType}}', '/life-customer/api/customers/corrections/types/{{correctType}}', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000066, 'KDG2008', 'GET', '/life-customer/api/customers/corrections', '/life-customer/api/customers/corrections', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000067, 'KDG2009', 'GET', '/life-customer/api/taxes/countries', '/life-customer/api/taxes/countries', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000068, 'KDG2010', 'GET', '/life-customer/api/policy-customers/relations', '/life-customer/api/policy-customers/relations', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000069, 'KDG2011', 'GET', '/life-customer/api/policy-customers/dest/relations', '/life-customer/api/policy-customers/dest/relations', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000070, 'KDG2012', 'GET', '/life-customer/manage/persons', '/life-customer/manage/persons', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000071, 'KDG2013', 'GET', '/life-customer/manage/customers/{{customerNo}}', '/life-customer/manage/customers/{{customerNo}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000072, 'KDG2014', 'POST', '/life-customer/manage/customers/searches', '/life-customer/manage/customers/searches', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000073, 'KDG2015', 'POST', '/life-customer/manage/customers/corrections/types/{{correctType}}/checks', '/life-customer/manage/customers/corrections/types/{{correctType}}/checks', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000074, 'KDG2016', 'POST', '/life-customer/manage/customers/corrections/types/{{correctType}}', '/life-customer/manage/customers/corrections/types/{{correctType}}', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000075, 'KDG2017', 'GET', '/life-customer/manage/customers/corrections', '/life-customer/manage/customers/corrections', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000076, 'KDG2018', 'GET', '/life-customer/manage/customers/corrections/{{correctNo}}', '/life-customer/manage/customers/corrections/{{correctNo}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000077, 'KDG2019', 'POST', '/life-customer/manage/customers/corrections/searches', '/life-customer/manage/customers/corrections/searches', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000078, 'KDG2020', 'POST', '/life-customer/inner/customers', '/life-customer/inner/customers', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000079, 'KDG2021', 'POST', '/life-customer/inner/policy-customers', '/life-customer/inner/policy-customers', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000080, 'KDG2022', 'POST', '/life-customer/inner/persons', '/life-customer/inner/persons', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000081, 'KDG2023', 'PUT', '/life-customer/inner/customers/{{customerNo}}', '/life-customer/inner/customers/{{customerNo}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000082, 'KDG2024', 'PUT', '/life-customer/inner/policy-customers/{{policyCustomerNo}}', '/life-customer/inner/policy-customers/{{policyCustomerNo}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000083, 'KDG2025', 'GET', '/life-customer/inner/policy-customers/relations', '/life-customer/inner/policy-customers/relations', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000084, 'KDG2026', 'PUT', '/life-customer/inner/persons/{{personNo}}', '/life-customer/inner/persons/{{personNo}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000085, 'KDG2027', 'GET', '/life-customer/inner/customers/holders/{{customerNo}}', '/life-customer/inner/customers/holders/{{customerNo}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000086, 'KDG2028', 'GET', '/life-customer/inner/customers/basics', '/life-customer/inner/customers/basics', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000087, 'KDG2029', 'GET', '/life-customer/inner/customers/{{customerNo}}', '/life-customer/inner/customers/{{customerNo}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000088, 'KDG2030', 'GET', '/life-customer/inner/customers/relations', '/life-customer/inner/customers/relations', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000089, 'KDG2031', 'GET', '/life-customer/inner/policy-customers/basics', '/life-customer/inner/policy-customers/basics', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000090, 'KDG2032', 'GET', '/life-customer/inner/policy-customers/{{policyCustomerNo}}', '/life-customer/inner/policy-customers/{{policyCustomerNo}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000091, 'KDG2033', 'GET', '/life-customer/inner/persons/{{personNo}}', '/life-customer/inner/persons/{{personNo}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000092, 'KDG2034', 'GET', '/life-customer/inner/customers/certTypes/{{certType}}/certNos/{{certNo}}', '/life-customer/inner/customers/certTypes/{{certType}}/certNos/{{certNo}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000093, 'KDG2035', 'POST', '/life-customer/inner/policy-customers/generates', '/life-customer/inner/policy-customers/generates', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000094, 'KDG2036', 'POST', '/life-customer/inner/policy-customers/auths', '/life-customer/inner/policy-customers/auths', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000095, 'KDG2037', 'POST', '/life-customer/inner/beneficiaries', '/life-customer/inner/beneficiaries', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000096, 'KDG2038', 'POST', '/life-customer/inner/payees', '/life-customer/inner/payees', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000097, 'KDG2039', 'PUT', '/life-customer/inner/beneficiaries', '/life-customer/inner/beneficiaries', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000098, 'KDG2040', 'PUT', '/life-customer/inner/payees', '/life-customer/inner/payees', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000099, 'KDG2041', 'POST', '/life-customer/inner/customers/corrections/types/{{correctType}}', '/life-customer/inner/customers/corrections/types/{{correctType}}', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000100, 'KDG2042', 'POST', '/life-customer/inner/customers/corrections/searches', '/life-customer/inner/customers/corrections/searches', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000101, 'VDI2050', 'PUT', '/life-product/manage/{{productCode}}/agreement', '/life-product/manage/{{productCode}}/agreement', 'life-product', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000102, 'VDI2049', 'POST', '/life-product/manage/{{productCode}}/agreement', '/life-product/manage/{{productCode}}/agreement', 'life-product', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000103, 'VDI2048', 'GET', '/life-product/manage/{{productCode}}/agreement/{{agreementCode}}', '/life-product/manage/{{productCode}}/agreement/{{agreementCode}}', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000104, 'VDI2047', 'GET', '/life-product/manage/products/code-and-name', '/life-product/manage/products/code-and-name', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000105, 'VDI2046', 'PUT', '/life-product/manage/product/{{productCode}}/status/online', '/life-product/manage/product/{{productCode}}/status/online', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000106, 'VDI2045', 'PUT', '/life-product/manage/product/{{productCode}}/status/offline', '/life-product/manage/product/{{productCode}}/status/offline', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000107, 'VDI2044', 'PUT', '/life-product/manage/product', '/life-product/manage/product', 'life-product', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000108, 'VDI2043', 'POST', '/life-product/manage/product', '/life-product/manage/product', 'life-product', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000109, 'VDI2042', 'GET', '/life-product/manage/product/{{productCode}}', '/life-product/manage/product/{{productCode}}', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000110, 'VDI2041', 'POST', '/life-product/manage/products', '/life-product/manage/products', 'life-product', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000111, 'PDG2007', 'GET', '/life-product/manage/{{productCode}}/product-files', '/life-product/manage/{{productCode}}/product-files', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000112, 'PDG2008', 'POST', '/life-product/manage/{{productCode}}/product-file', '/life-product/manage/{{productCode}}/product-file', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000113, 'PDG2009', 'PUT', '/life-product/manage/{{productCode}}/product-file', '/life-product/manage/{{productCode}}/product-file', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000114, 'PDG2010', 'DELETE', '/life-product/manage/{{productCode}}/product-file', '/life-product/manage/{{productCode}}/product-file', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000115, 'PDG2014', 'POST', '/life-product/manage/product-currency', '/life-product/manage/product-currency', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000116, 'PDG2015', 'PUT', '/life-product/manage/product-currency', '/life-product/manage/product-currency', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000117, 'PDG2016', 'DELETE', '/life-product/manage/product-currency', '/life-product/manage/product-currency', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000118, 'PDG2021', 'GET', '/life-product/manage/{{productCode}}/product-collocations', '/life-product/manage/{{productCode}}/product-collocations', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000119, 'PDG2022', 'POST', '/life-product/manage/{{productCode}}/product-collocation', '/life-product/manage/{{productCode}}/product-collocation', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000120, 'PDG2023', 'PUT', '/life-product/manage/{{productCode}}/product-collocation', '/life-product/manage/{{productCode}}/product-collocation', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000121, 'PDG2024', 'DELETE', '/life-product/manage/{{productCode}}/product-collocation', '/life-product/manage/{{productCode}}/product-collocation', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000122, 'PDG2025', 'GET', '/life-product/manage/{{productCode}}/liabilities', '/life-product/manage/{{productCode}}/liabilities', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000123, 'PDG2026', 'POST', '/life-product/manage/{{productCode}}/liability', '/life-product/manage/{{productCode}}/liability', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000124, 'PDG2027', 'PUT', '/life-product/manage/{{productCode}}/liability', '/life-product/manage/{{productCode}}/liability', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000125, 'PDG2028', 'GET', '/life-product/manage/{{productCode}}/liability/sum-insureds', '/life-product/manage/{{productCode}}/liability/sum-insureds', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000126, 'PDG2029', 'DELETE', '/life-product/manage/{{productCode}}/liability', '/life-product/manage/{{productCode}}/liability', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000127, 'PDG2030', 'POST', '/life-product/manage/{{productCode}}/liability/sum-insured', '/life-product/manage/{{productCode}}/liability/sum-insured', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000128, 'PDG2031', 'DELETE', '/life-product/manage/{{productCode}}/liability/sum-insured', '/life-product/manage/{{productCode}}/liability/sum-insured', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000129, 'PDG2032', 'GET', '/life-product/manage/{{productCode}}/liability/risk-insureds', '/life-product/manage/{{productCode}}/liability/risk-insureds', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000130, 'PDG2033', 'POST', '/life-product/manage/{{productCode}}/liability/risk-insured', '/life-product/manage/{{productCode}}/liability/risk-insured', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000131, 'PDG2034', 'DELETE', '/life-product/manage/{{productCode}}/liability/risk-insured', '/life-product/manage/{{productCode}}/liability/risk-insured', 'life-product', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000154, 'PDG2025', 'GET', '/life-product/manage/{{productCode}}/liabilities', '/life-product/manage/{{productCode}}/liabilities', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 15:02:47', '2023-04-10 15:02:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000157, 'QDG2000', 'PUT', '/life-insure/manage/insures/{{insureNo}}/audit-results', '/life-insure/manage/insures/{{insureNo}}/audit-results', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000158, 'QDG2001', 'GET', '/life-insure/manage/insures/{{insureNo}}', '/life-insure/manage/insures/{{insureNo}}', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000159, 'QDG2002', 'POST', '/life-insure/manage/insures/searches', '/life-insure/manage/insures/searches', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000160, 'QDG2003', 'POST', '/life-insure/api/insures/pre-validation', '/life-insure/api/insures/pre-validation', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000161, 'QDG2004', 'POST', '/life-insure/api/insures/{{insureNo}}/questionnaires', '/life-insure/api/insures/{{insureNo}}/questionnaires', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000162, 'QDG2005', 'POST', '/life-insure/api/insures/{{insureNo}}/questionnaires/{{questionnaireNo}}/loops', '/life-insure/api/insures/{{insureNo}}/questionnaires/{{questionnaireNo}}/loops', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000163, 'QDG2006', 'GET', '/life-insure/api/insures/{{insureNo}}/questionnaires/{{questionnaireNo}}/results', '/life-insure/api/insures/{{insureNo}}/questionnaires/{{questionnaireNo}}/results', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000164, 'QDG2007', 'PUT', '/life-insure/api/insures/{{insureNo}}/status', '/life-insure/api/insures/{{insureNo}}/status', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000165, 'QDG2008', 'GET', '/life-insure/api/insures/{{insureNo}}', '/life-insure/api/insures/{{insureNo}}', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000166, 'QDG2009', 'GET', '/life-insure/api/insures/{{insureNo}}/payments/{{paymentNo}}', '/life-insure/api/insures/{{insureNo}}/payments/{{paymentNo}}', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000167, 'QDG2010', 'POST', '/life-insure/api/insures/{{insureNo}}/otps', '/life-insure/api/insures/{{insureNo}}/otps', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000168, 'QDG2011', 'PUT', '/life-insure/api/insures/{{insureNo}}/conclusions', '/life-insure/api/insures/{{insureNo}}/conclusions', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000169, 'QDG2012', 'POST', '/life-insure/api/insures/searches', '/life-insure/api/insures/searches', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000170, 'QDG2013', 'POST', '/life-insure/api/insures/files/fileSrcNos', '/life-insure/api/insures/files/fileSrcNos', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000171, 'QDG2014', 'GET', '/life-insure/api/insures/files/{{fileSrcNo}}', '/life-insure/api/insures/files/{{fileSrcNo}}', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000172, 'QDG2015', 'PUT', '/life-insure/api/insures/files/{{fileSrcNo}}', '/life-insure/api/insures/files/{{fileSrcNo}}', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000173, 'QDG2016', 'POST', '/life-insure/api/insures/files/{{fileSrcNo}}', '/life-insure/api/insures/files/{{fileSrcNo}}', 'life-insure', 'multipart/form-data', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000174, 'QDG2017', 'PUT', '/life-insure/api/insures/files/batches/{{fileSrcNo}}', '/life-insure/api/insures/files/batches/{{fileSrcNo}}', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000175, 'QDG2018', 'GET', '/life-insure/api/insures/files/{{fileUniqueCode}}/documents', '/life-insure/api/insures/files/{{fileUniqueCode}}/documents', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000176, 'QDG2019', 'POST', '/life-insure/api/insures/{{insureNo}}/validation', '/life-insure/api/insures/{{insureNo}}/validation', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000177, 'QDG2020', 'GET', '/life-insure/api/insures/{{insureNo}}/ocr/status', '/life-insure/api/insures/{{insureNo}}/ocr/status', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000178, 'QDG2021', 'POST', '/life-insure/api/insures/{{insureNo}}/ocrFiles/differences', '/life-insure/api/insures/{{insureNo}}/ocrFiles/differences', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000179, 'QDG2022', 'POST', '/life-insure/api/insures/{{insureNo}}/tasks/attachments', '/life-insure/api/insures/{{insureNo}}/tasks/attachments', 'life-insure', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000180, 'QDG2023', 'POST', '/life-insure/inner/insures', '/life-insure/inner/insures', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000181, 'QDG2024', 'PUT', '/life-insure/inner/insures/{{insureNo}}', '/life-insure/inner/insures/{{insureNo}}', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000182, 'QDG2025', 'GET', '/life-insure/inner/insures/{{insureNo}}', '/life-insure/inner/insures/{{insureNo}}', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000183, 'QDG2026', 'PUT', '/life-insure/inner/insures/{{insureNo}}/status', '/life-insure/inner/insures/{{insureNo}}/status', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000184, 'QDG2027', 'POST', '/life-insure/inner/insures/{{insureNo}}/policies', '/life-insure/inner/insures/{{insureNo}}/policies', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000185, 'QDG2028', 'POST', '/life-insure/inner/insures/searches', '/life-insure/inner/insures/searches', 'life-insure', 'application/json', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000186, 'QDG2029', 'GET', '/life-insure/inner/insures/{{insureNo}}/questionnaires/{{questionnaireNo}}/results', '/life-insure/inner/insures/{{insureNo}}/questionnaires/{{questionnaireNo}}/results', 'life-insure', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-10 16:46:48', '2023-04-10 16:46:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000187, 'KDK2000', 'GET', '/life-order/api/orders/{{orderNo}}/payments/{{paymentNo}}', '/life-order/api/orders/{{orderNo}}/payments/{{paymentNo}}', 'life-order', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000188, 'KDK2001', 'GET', '/life-order/api/orders/cards', '/life-order/api/orders/cards', 'life-order', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000189, 'KDK2002', 'GET', '/life-order/api/orders/{{orderNo}}', '/life-order/api/orders/{{orderNo}}', 'life-order', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000190, 'KDK2003', 'PUT', '/life-order/api/orders/{{orderNo}}/status', '/life-order/api/orders/{{orderNo}}/status', 'life-order', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000191, 'KDK2004', 'POST', '/life-order/api/orders/searches', '/life-order/api/orders/searches', 'life-order', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000192, 'KDK2005', 'GET', '/life-order/manage/orders/{{orderNo}}/status', '/life-order/manage/orders/{{orderNo}}/status', 'life-order', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000193, 'KDK2006', 'POST', '/life-order/inner/order', '/life-order/inner/order', 'life-order', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000194, 'KDK2007', 'GET', '/life-order/inner/orders/{{orderNo}}', '/life-order/inner/orders/{{orderNo}}', 'life-order', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000195, 'KDK2008', 'PUT', '/life-order/inner/orders/{{orderNo}}/status', '/life-order/inner/orders/{{orderNo}}/status', 'life-order', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000196, 'KDK2009', 'POST', '/life-order/inner/orders/{{orderNo}}/payments', '/life-order/inner/orders/{{orderNo}}/payments', 'life-order', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000197, 'KDK2010', 'POST', '/life-order/inner/orders/{{orderNo}}/refund', '/life-order/inner/orders/{{orderNo}}/refund', 'life-order', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 10:17:46', '2023-04-11 10:17:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000198, 'LDK2020', 'POST', '/life-customer/test/messages/{{type}}', '/life-customer/test/messages/{{type}}', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 11:55:19', '2023-04-11 11:55:19', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000200, 'RDK2000', 'GET', '/life-user/manage/roles', '/life-user/manage/roles', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:03:58', '2023-04-11 17:03:58', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000201, 'RDK2001', 'POST', '/life-user/manage/role', '/life-user/manage/role', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:03:58', '2023-04-11 17:03:58', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000202, 'RDK2002', 'PUT', '/life-user/manage/roles/{{roleCode}}', '/life-user/manage/roles/{{roleCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:03:58', '2023-04-11 17:03:58', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000203, 'RDK2003', 'DELETE', '/life-user/manage/roles/{{roleCode}}', '/life-user/manage/roles/{{roleCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:03:58', '2023-04-11 17:03:58', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000204, 'RDK2004', 'POST', '/life-user/manage/roles/{{account}}/binding', '/life-user/manage/roles/{{account}}/binding', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:03:58', '2023-04-11 17:03:58', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000205, 'RDK2005', 'POST', '/life-user/manage/roles/{{account}}/unbinding', '/life-user/manage/roles/{{account}}/unbinding', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:03:58', '2023-04-11 17:03:58', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000206, 'RDK2006', 'POST', '/life-user/manage/roles/{{roleCode}}/binding/privilege', '/life-user/manage/roles/{{roleCode}}/binding/privilege', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:03:58', '2023-04-11 17:03:58', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000207, 'RDK2007', 'POST', '/life-user/manage/roles/{{roleCode}}/unbinding/privilege', '/life-user/manage/roles/{{roleCode}}/unbinding/privilege', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:03:58', '2023-04-11 17:03:58', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000208, 'RDK2008', 'GET', '/life-user/manage/privileges', '/life-user/manage/privileges', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000209, 'RDK2009', 'POST', '/life-user/manage/privilege', '/life-user/manage/privilege', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000210, 'RDK2010', 'PUT', '/life-user/manage/privileges/{{privilegeCode}}', '/life-user/manage/privileges/{{privilegeCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000211, 'RDK2011', 'DELETE', '/life-user/manage/privileges/{{privilegeCode}}', '/life-user/manage/privileges/{{privilegeCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000212, 'RDK2012', 'GET', '/life-user/manage/menus', '/life-user/manage/menus', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000213, 'RDK2013', 'POST', '/life-user/manage/menu', '/life-user/manage/menu', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000214, 'RDK2014', 'PUT', '/life-user/manage/menus/{{resourceCode}}', '/life-user/manage/menus/{{resourceCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000215, 'RDK2015', 'DELETE', '/life-user/manage/menus/{{resourceCode}}', '/life-user/manage/menus/{{resourceCode}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000216, 'RDK2016', 'POST', '/life-user/manage/menus/{{resourceCode}}/binding/privilege', '/life-user/manage/menus/{{resourceCode}}/binding/privilege', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000217, 'RDK2017', 'POST', '/life-user/manage/menus/{{resourceCode}}/unbinding/privilege', '/life-user/manage/menus/{{resourceCode}}/unbinding/privilege', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000218, 'RDK2018', 'GET', '/life-user/manage/user/{{token}}', '/life-user/manage/user/{{token}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000219, 'RDK2019', 'POST', '/life-user/manage/logout/{{token}}', '/life-user/manage/logout/{{token}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000220, 'RDK2020', 'GET', '/life-user/manage/salt', '/life-user/manage/salt', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000221, 'RDK2021', 'POST', '/life-user/manage/login', '/life-user/manage/login', 'life-user', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000222, 'RDK2022', 'GET', '/life-user/manage/users', '/life-user/manage/users', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000223, 'RDK2023', 'POST', '/life-user/manage/user', '/life-user/manage/user', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000224, 'RDK2024', 'PUT', '/life-user/manage/users/{{userNo}}', '/life-user/manage/users/{{userNo}}', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000225, 'RDK2025', 'PUT', '/life-user/manage/users/{{userNo}}/resetPwd', '/life-user/manage/users/{{userNo}}/resetPwd', 'life-user', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-11 17:19:56', '2023-04-11 17:19:56', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000226, 'ODL2000', 'POST', '/life-calculate/inner/formula/calculators', '/life-calculate/inner/formula/calculators', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000227, 'ODL2001', 'POST', '/life-calculate/manage/rate-tables', '/life-calculate/manage/rate-tables', 'life-calculate', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000228, 'ODL2002', 'GET', '/life-calculate/manage/rate-table/{{rateTableCode}}', '/life-calculate/manage/rate-table/{{rateTableCode}}', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000229, 'ODL2003', 'POST', '/life-calculate/manage/rate-table', '/life-calculate/manage/rate-table', 'life-calculate', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000230, 'ODL2004', 'PUT', '/life-calculate/manage/rate-table', '/life-calculate/manage/rate-table', 'life-calculate', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000231, 'ODL2005', 'DELETE', '/life-calculate/manage/rate-table', '/life-calculate/manage/rate-table', 'life-calculate', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000232, 'ODL2006', 'GET', '/life-calculate/rate-table/{{rateTableCode}}/value', '/life-calculate/rate-table/{{rateTableCode}}/value', 'life-calculate', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000233, 'ODL2007', 'GET', '/life-calculate/manage/rate-tables/code-and-name', '/life-calculate/manage/rate-tables/code-and-name', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000234, 'ODL2008', 'GET', '/life-calculate/manage/rate-tables/factors', '/life-calculate/manage/rate-tables/factors', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000235, 'ODL2009', 'GET', '/life-calculate/manage/rate-tables/template', '/life-calculate/manage/rate-tables/template', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000236, 'ODL2010', 'POST', '/life-calculate/manage/formulas', '/life-calculate/manage/formulas', 'life-calculate', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000237, 'ODL2011', 'GET', '/life-calculate/manage/formula/{{formulaCode}}', '/life-calculate/manage/formula/{{formulaCode}}', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000238, 'ODL2012', 'POST', '/life-calculate/manage/formula', '/life-calculate/manage/formula', 'life-calculate', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000239, 'ODL2013', 'PUT', '/life-calculate/manage/formula', '/life-calculate/manage/formula', 'life-calculate', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000240, 'ODL2014', 'DELETE', '/life-calculate/manage/formula', '/life-calculate/manage/formula', 'life-calculate', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000241, 'ODL2015', 'POST', '/life-calculate/manage/formula/calculators', '/life-calculate/manage/formula/calculators', 'life-calculate', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000242, 'ODL2016', 'GET', '/life-calculate/manage/formulas/code-and-name', '/life-calculate/manage/formulas/code-and-name', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000243, 'ODL2017', 'GET', '/life-calculate/manage/formulas/factors', '/life-calculate/manage/formulas/factors', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000244, 'ODL2017', 'GET', '/life-calculate/manage/formulas/factors', '/life-calculate/manage/formulas/factors', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000245, 'ODL2016', 'GET', '/life-calculate/manage/formulas/code-and-name', '/life-calculate/manage/formulas/code-and-name', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000246, 'ODL2015', 'POST', '/life-calculate/manage/formula/calculators', '/life-calculate/manage/formula/calculators', 'life-calculate', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000247, 'ODL2014', 'DELETE', '/life-calculate/manage/formula', '/life-calculate/manage/formula', 'life-calculate', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000248, 'ODL2013', 'PUT', '/life-calculate/manage/formula', '/life-calculate/manage/formula', 'life-calculate', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000249, 'ODL2012', 'POST', '/life-calculate/manage/formula', '/life-calculate/manage/formula', 'life-calculate', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000250, 'ODL2011', 'GET', '/life-calculate/manage/formula/{{formulaCode}}', '/life-calculate/manage/formula/{{formulaCode}}', 'life-calculate', 'application/x-www-form-urlencoded;charset=UTF-8', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000251, 'ODL2010', 'POST', '/life-calculate/manage/formulas', '/life-calculate/manage/formulas', 'life-calculate', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 14:39:25', '2023-04-12 14:39:25', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000252, 'PDL2032', 'POST', '/life-document/manage/files/uploadFile', '/life-document/manage/files/uploadFile', 'life-document', 'multipart/form-data', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 15:22:34', '2023-04-12 15:22:34', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000253, 'PDL2033', 'GET', '/life-document/manage/files/downloadFile/{{fileUniqueCode}}', '/life-document/manage/files/downloadFile/{{fileUniqueCode}}', 'life-document', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 15:22:34', '2023-04-12 15:22:34', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000254, 'PDL2034', 'POST', '/life-document/api/files/fileSrcNo', '/life-document/api/files/fileSrcNo', 'life-document', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 15:22:34', '2023-04-12 15:22:34', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000255, 'PDL2035', 'POST', '/life-document/api/files/fileSrcNo/operate', '/life-document/api/files/fileSrcNo/operate', 'life-document', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 15:22:34', '2023-04-12 15:22:34', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000256, 'PDL2036', 'GET', '/life-document/api/files/detail/{{fileSrcNo}}', '/life-document/api/files/detail/{{fileSrcNo}}', 'life-document', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 15:22:34', '2023-04-12 15:22:34', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000257, 'PDL2037', 'POST', '/life-document/api/files/common/upload', '/life-document/api/files/common/upload', 'life-document', 'multipart/form-data', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 15:22:34', '2023-04-12 15:22:34', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000258, 'PDL2038', 'PUT', '/life-document/api/files/effective/batch/{{fileSrcNo}}', '/life-document/api/files/effective/batch/{{fileSrcNo}}', 'life-document', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 15:22:34', '2023-04-12 15:22:34', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000259, 'PDL2039', 'GET', '/life-document/api/files/common/download/{{fileUniqueCode}}', '/life-document/api/files/common/download/{{fileUniqueCode}}', 'life-document', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 15:22:34', '2023-04-12 15:22:34', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000260, 'KDM2000', 'GET', '/life-policy/policy/{{policyNo}}/premium/schedule', '/life-policy/policy/{{policyNo}}/premium/schedule', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000261, 'KDM2001', 'GET', '/life-policy/test1', '/life-policy/test1', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000262, 'KDM2002', 'POST', '/life-policy/application', '/life-policy/application', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000263, 'KDM2003', 'POST', '/life-policy/_search', '/life-policy/_search', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000264, 'KDM2004', 'GET', '/life-policy/{{posNo}}', '/life-policy/{{posNo}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000265, 'KDM2005', 'GET', '/life-policy/applications/{{applyNo}}/pos-items', '/life-policy/applications/{{applyNo}}/pos-items', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000266, 'KDM2006', 'GET', '/life-policy/policy/{{policyNo}}/pos-items', '/life-policy/policy/{{policyNo}}/pos-items', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000267, 'KDM2007', 'GET', '/life-policy/applications/{{applyNo}}/change-props', '/life-policy/applications/{{applyNo}}/change-props', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000268, 'KDM2008', 'GET', '/life-policy/customer/{{customerNo}}/pos-items', '/life-policy/customer/{{customerNo}}/pos-items', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000269, 'KDM2009', 'POST', '/life-policy/validation', '/life-policy/validation', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000270, 'KDM2010', 'PUT', '/life-policy/{{posNo}}/cancellation', '/life-policy/{{posNo}}/cancellation', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000271, 'KDM2011', 'GET', '/life-policy/{{lockRelationType}}/lock', '/life-policy/{{lockRelationType}}/lock', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000272, 'KDM2012', 'GET', '/life-policy/{{transType}}/lock-validation', '/life-policy/{{transType}}/lock-validation', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000273, 'KDM2013', 'PUT', '/life-policy/{{posNo}}', '/life-policy/{{posNo}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000274, 'KDM2014', 'PUT', '/life-policy/compliance/{{taskNo}}', '/life-policy/compliance/{{taskNo}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000275, 'KDM2015', 'GET', '/life-policy/manage/pos/biz-no', '/life-policy/manage/pos/biz-no', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000276, 'KDM2016', 'POST', '/life-policy/manage/pos/application', '/life-policy/manage/pos/application', 'life-policy', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000277, 'KDM2017', 'POST', '/life-policy/manage/pos/calculation', '/life-policy/manage/pos/calculation', 'life-policy', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000278, 'KDM2018', 'PUT', '/life-policy/manage/pos/{{posNo}}/cancellation', '/life-policy/manage/pos/{{posNo}}/cancellation', 'life-policy', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000279, 'KDM2019', 'POST', '/life-policy/manage/pos/_search', '/life-policy/manage/pos/_search', 'life-policy', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000280, 'KDM2020', 'GET', '/life-policy/manage/pos/{{posNo}}', '/life-policy/manage/pos/{{posNo}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000281, 'KDM2021', 'PUT', '/life-policy/manage/pos/auditing', '/life-policy/manage/pos/auditing', 'life-policy', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000282, 'KDM2022', 'GET', '/life-policy/manage/pos/customer/{{customerNo}}/pos-items', '/life-policy/manage/pos/customer/{{customerNo}}/pos-items', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000283, 'KDM2023', 'GET', '/life-policy/manage/pos/{{posNo}}/bills', '/life-policy/manage/pos/{{posNo}}/bills', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000284, 'KDM2024', 'POST', '/life-policy/manage/pos/payee', '/life-policy/manage/pos/payee', 'life-policy', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000285, 'KDM2025', 'GET', '/life-policy/manage/policies/searches', '/life-policy/manage/policies/searches', 'life-policy', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000286, 'KDM2026', 'GET', '/life-policy/manage/policies/{{policyNo}}', '/life-policy/manage/policies/{{policyNo}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000287, 'KDM2027', 'GET', '/life-policy/api/policies', '/life-policy/api/policies', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000288, 'KDM2028', 'GET', '/life-policy/api/policies/{{policyNo}}', '/life-policy/api/policies/{{policyNo}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'Y', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-21 10:56:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000289, 'KDM2029', 'POST', '/life-policy/inner/policies', '/life-policy/inner/policies', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000290, 'KDM2030', 'POST', '/life-policy/inner/policies/{{policyNo}}/corrections/{{correctType}}', '/life-policy/inner/policies/{{policyNo}}/corrections/{{correctType}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000291, 'KDM2031', 'GET', '/life-policy/inner/roles/{{roleType}}/customers/{{policyCustomerNo}}/policies', '/life-policy/inner/roles/{{roleType}}/customers/{{policyCustomerNo}}/policies', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000292, 'KDM2032', 'GET', '/life-policy/inner/policies/{{policyNo}}', '/life-policy/inner/policies/{{policyNo}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000293, 'KDM2033', 'GET', '/life-policy/inner/policies/insures/{{insureNo}}', '/life-policy/inner/policies/insures/{{insureNo}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000294, 'KDM2034', 'POST', '/life-policy/inner/insureds/customers/policies/searches', '/life-policy/inner/insureds/customers/policies/searches', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000295, 'KDM2035', 'GET', '/life-policy/inner/insureds/customers/{{customerNo}}/policies', '/life-policy/inner/insureds/customers/{{customerNo}}/policies', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000296, 'PDM2000', 'POST', '/life-channel/manage/goodsList', '/life-channel/manage/goodsList', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000297, 'PDM2001', 'GET', '/life-channel/manage/goods/{{goodsCode}}', '/life-channel/manage/goods/{{goodsCode}}', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000298, 'PDM2002', 'POST', '/life-channel/manage/goods', '/life-channel/manage/goods', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000299, 'PDM2003', 'PUT', '/life-channel/manage/goods', '/life-channel/manage/goods', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000300, 'PDM2004', 'PUT', '/life-channel/manage/goods/{{goodsCode}}/status', '/life-channel/manage/goods/{{goodsCode}}/status', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000301, 'PDM2005', 'GET', '/life-channel/manage/goods/{{goodsCode}}/name-and-code', '/life-channel/manage/goods/{{goodsCode}}/name-and-code', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000302, 'PDM2006', 'GET', '/life-channel/manage/goods/{{goodsCode}}/zip', '/life-channel/manage/goods/{{goodsCode}}/zip', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000303, 'PDM2007', 'GET', '/life-channel/manage/goods/{{goodsCode}}/goods-files', '/life-channel/manage/goods/{{goodsCode}}/goods-files', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000304, 'PDM2008', 'POST', '/life-channel/manage/goods/{{goodsCode}}/goods-file', '/life-channel/manage/goods/{{goodsCode}}/goods-file', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000305, 'PDM2009', 'DELETE', '/life-channel/manage/goods/{{goodsCode}}/goods-file', '/life-channel/manage/goods/{{goodsCode}}/goods-file', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000306, 'PDM2010', 'POST', '/life-channel/manage/packages', '/life-channel/manage/packages', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000307, 'PDM2011', 'GET', '/life-channel/manage/package/{{packageCode}}', '/life-channel/manage/package/{{packageCode}}', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000308, 'PDM2012', 'GET', '/life-channel/manage/package/name-and-code', '/life-channel/manage/package/name-and-code', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000309, 'PDM2013', 'POST', '/life-channel/manage/package', '/life-channel/manage/package', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000310, 'PDM2014', 'PUT', '/life-channel/manage/package', '/life-channel/manage/package', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000311, 'PDM2015', 'DELETE', '/life-channel/manage/package', '/life-channel/manage/package', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000312, 'PDM2016', 'GET', '/life-channel/manage/goods/{{goodsCode}}/goods-commission', '/life-channel/manage/goods/{{goodsCode}}/goods-commission', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000313, 'PDM2017', 'PUT', '/life-channel/manage/goods/{{goodsCode}}/goods-commission', '/life-channel/manage/goods/{{goodsCode}}/goods-commission', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000314, 'PDM2018', 'DELETE', '/life-channel/manage/goods/{{goodsCode}}/goods-commission', '/life-channel/manage/goods/{{goodsCode}}/goods-commission', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000315, 'PDM2019', 'GET', '/life-channel/manage/goods/{{goodsCode}}/goods-level-factors', '/life-channel/manage/goods/{{goodsCode}}/goods-level-factors', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000316, 'PDM2020', 'PUT', '/life-channel/manage/goods/{{goodsCode}}/goods-level-factors', '/life-channel/manage/goods/{{goodsCode}}/goods-level-factors', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000317, 'PDM2021', 'GET', '/life-channel/manage/channel/{{code}}', '/life-channel/manage/channel/{{code}}', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000318, 'PDM2022', 'POST', '/life-channel/manage/channel', '/life-channel/manage/channel', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000319, 'PDM2023', 'PUT', '/life-channel/manage/channel/{{code}}', '/life-channel/manage/channel/{{code}}', 'life-channel', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000320, 'PDM2024', 'DELETE', '/life-channel/manage/channel/{{code}}', '/life-channel/manage/channel/{{code}}', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000321, 'PDM2025', 'GET', '/life-channel/inner/goods/{{goodsCode}}/formulas', '/life-channel/inner/goods/{{goodsCode}}/formulas', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000322, 'PDM2026', 'GET', '/life-channel/inner/goods/{{goodsCode}}/liabilities', '/life-channel/inner/goods/{{goodsCode}}/liabilities', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000323, 'PDM2027', 'POST', '/life-channel/inner/goods/{{goodsCode}}/factors', '/life-channel/inner/goods/{{goodsCode}}/factors', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000324, 'PDM2028', 'GET', '/life-channel/inner/goods/{{goodsCode}}/premium-factors/ranges', '/life-channel/inner/goods/{{goodsCode}}/premium-factors/ranges', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000325, 'PDM2029', 'GET', '/life-channel/api/goods', '/life-channel/api/goods', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000326, 'PDM2030', 'GET', '/life-channel/api/goods/{{goodsCode}}/premium-factors', '/life-channel/api/goods/{{goodsCode}}/premium-factors', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000327, 'PDM2031', 'GET', '/life-channel/api/goods/{{goodsCode}}/premium-factors/ranges', '/life-channel/api/goods/{{goodsCode}}/premium-factors/ranges', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000328, 'PDM2032', 'GET', '/life-channel/api/goods/{{goodsCode}}/insure-factors', '/life-channel/api/goods/{{goodsCode}}/insure-factors', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000329, 'PDM2033', 'GET', '/life-channel/api/goods/{{goodsCode}}/struct', '/life-channel/api/goods/{{goodsCode}}/struct', 'life-channel', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 15:12:15', '2023-04-13 15:12:15', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000330, 'RDM2000', 'POST', '/life-market/manage/campaign/campaign-cate-gift-with-purchase', '/life-market/manage/campaign/campaign-cate-gift-with-purchase', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000331, 'RDM2001', 'GET', '/life-market/manage/campaign/{{campaignCode}}/campaign-cate-gift-with-purchase', '/life-market/manage/campaign/{{campaignCode}}/campaign-cate-gift-with-purchase', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000332, 'RDM2002', 'POST', '/life-market/manage/campaign/campaign-cate-premium-discount', '/life-market/manage/campaign/campaign-cate-premium-discount', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000333, 'RDM2003', 'GET', '/life-market/manage/campaign/{{campaignCode}}/campaign-cate-premium-discount', '/life-market/manage/campaign/{{campaignCode}}/campaign-cate-premium-discount', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000334, 'RDM2004', 'POST', '/life-market/manage/campaign', '/life-market/manage/campaign', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000335, 'RDM2005', 'GET', '/life-market/manage/campaign/{{campaignCode}}', '/life-market/manage/campaign/{{campaignCode}}', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000336, 'RDM2006', 'POST', '/life-market/manage/campaign/campaign-rule', '/life-market/manage/campaign/campaign-rule', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000337, 'RDM2007', 'GET', '/life-market/manage/campaign/{{campaignCode}}/campaign-rule', '/life-market/manage/campaign/{{campaignCode}}/campaign-rule', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000338, 'RDM2008', 'GET', '/life-market/manage/inventory/{{inventoryCode}}/campaign-inventory-code', '/life-market/manage/inventory/{{inventoryCode}}/campaign-inventory-code', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000339, 'RDM2009', 'POST', '/life-market/manage/inventory/campaign-inventory-code', '/life-market/manage/inventory/campaign-inventory-code', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000340, 'RDM2010', 'POST', '/life-market/api/calculators/trial', '/life-market/api/calculators/trial', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000341, 'RDM2011', 'POST', '/life-market/api/calculators/trial-for-n-year', '/life-market/api/calculators/trial-for-n-year', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000342, 'RDM2012', 'GET', '/life-market/api/campaigns/promotions/{{promotionCode}}', '/life-market/api/campaigns/promotions/{{promotionCode}}', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000343, 'RDM2013', 'POST', '/life-market/api/orders/{{orderNo}}/payments', '/life-market/api/orders/{{orderNo}}/payments', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000344, 'RDM2014', 'POST', '/life-market/api/insure', '/life-market/api/insure', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000345, 'RDM2015', 'PUT', '/life-market/api/insure', '/life-market/api/insure', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000346, 'RDM2016', 'GET', '/life-market/manage/coupon/groups', '/life-market/manage/coupon/groups', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000347, 'RDM2017', 'GET', '/life-market/manage/coupon/group/{{groupCode}}', '/life-market/manage/coupon/group/{{groupCode}}', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000348, 'RDM2018', 'POST', '/life-market/manage/coupon/group', '/life-market/manage/coupon/group', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000349, 'RDM2019', 'PUT', '/life-market/manage/coupon/group/{{groupCode}}', '/life-market/manage/coupon/group/{{groupCode}}', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000350, 'RDM2020', 'DELETE', '/life-market/manage/coupon/group/{{groupCode}}', '/life-market/manage/coupon/group/{{groupCode}}', 'life-market', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 17:22:07', '2023-04-13 17:22:07', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000351, 'SDM2016', 'POST', '/life-market/coupon/customer/items', '/life-market/coupon/customer/items', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 18:30:35', '2023-04-13 18:30:35', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000352, 'VDM2000', 'POST', '/life-task/manage/tasks/attachments', '/life-task/manage/tasks/attachments', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000353, 'VDM2001', 'GET', '/life-task/manage/tasks/{{taskNo}}/attachments', '/life-task/manage/tasks/{{taskNo}}/attachments', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000354, 'VDM2002', 'DELETE', '/life-task/manage/tasks/attachments/{{attachmentNo}}', '/life-task/manage/tasks/attachments/{{attachmentNo}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000355, 'VDM2003', 'POST', '/life-task/manage/tasks/{{taskNo}}/comments', '/life-task/manage/tasks/{{taskNo}}/comments', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000356, 'VDM2004', 'GET', '/life-task/manage/tasks/{{taskNo}}/comments', '/life-task/manage/tasks/{{taskNo}}/comments', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000357, 'VDM2005', 'DELETE', '/life-task/manage/tasks/comments/{{commentNo}}', '/life-task/manage/tasks/comments/{{commentNo}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000358, 'VDM2006', 'GET', '/life-task/manage/tasks/comments/{{id}}', '/life-task/manage/tasks/comments/{{id}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000359, 'VDM2007', 'DELETE', '/life-task/task/action-log/{{id}}', '/life-task/task/action-log/{{id}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000360, 'VDM2008', 'GET', '/life-task/task/action-logs', '/life-task/task/action-logs', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000361, 'VDM2009', 'GET', '/life-task/task/action-log/{{id}}', '/life-task/task/action-log/{{id}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000362, 'VDM2010', 'GET', '/life-task/task/{{taskNo}}/action-logs', '/life-task/task/{{taskNo}}/action-logs', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000363, 'VDM2011', 'POST', '/life-task/manage/task', '/life-task/manage/task', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000364, 'VDM2012', 'DELETE', '/life-task/manage/tasks/{{taskNo}}', '/life-task/manage/tasks/{{taskNo}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000365, 'VDM2013', 'PUT', '/life-task/manage/tasks/{{tranCode}}', '/life-task/manage/tasks/{{tranCode}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000366, 'VDM2014', 'POST', '/life-task/manage/tasks/_search', '/life-task/manage/tasks/_search', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000367, 'VDM2015', 'GET', '/life-task/manage/tasks/{{tranCode}}', '/life-task/manage/tasks/{{tranCode}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000368, 'GDN2000', 'GET', '/life-payment/api/payment/customer/{{customerNo}}/payments', '/life-payment/api/payment/customer/{{customerNo}}/payments', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000369, 'GDN2001', 'GET', '/life-payment/api/payment/customer/payments', '/life-payment/api/payment/customer/payments', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000370, 'GDN2002', 'POST', '/life-payment/api/payment', '/life-payment/api/payment', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000371, 'GDN2003', 'GET', '/life-payment/api/payment/{{paymentNo}}/status', '/life-payment/api/payment/{{paymentNo}}/status', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000372, 'GDN2004', 'POST', '/life-payment/api/payment/bank-card', '/life-payment/api/payment/bank-card', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000373, 'GDN2005', 'POST', '/life-payment/api/payment/bank-cards/{{bankCardId}}/detach', '/life-payment/api/payment/bank-cards/{{bankCardId}}/detach', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000374, 'GDN2006', 'GET', '/life-payment/api/payment/bank-cards/{{bankCardId}}', '/life-payment/api/payment/bank-cards/{{bankCardId}}', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000375, 'GDN2007', 'GET', '/life-payment/api/payment/bank-cards/binding/{{thirdSourceId}}', '/life-payment/api/payment/bank-cards/binding/{{thirdSourceId}}', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000376, 'GDN2008', 'POST', '/life-payment/api/payment/{{paymentNo}}/refund', '/life-payment/api/payment/{{paymentNo}}/refund', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000377, 'GDN2009', 'POST', '/life-payment/api/payments', '/life-payment/api/payments', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000378, 'GDN2010', 'GET', '/life-payment/api/payment/customer/{{customerNo}}/bank-cards', '/life-payment/api/payment/customer/{{customerNo}}/bank-cards', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000379, 'GDN2011', 'GET', '/life-payment/api/payment/customer/bank-cards', '/life-payment/api/payment/customer/bank-cards', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000380, 'GDN2012', 'PUT', '/life-payment/api/payment/customer/{{customerNo}}/bank-card', '/life-payment/api/payment/customer/{{customerNo}}/bank-card', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000381, 'GDN2013', 'PUT', '/life-payment/api/payment/customer/bank-card', '/life-payment/api/payment/customer/bank-card', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000382, 'GDN2014', 'POST', '/life-payment/api/payment/result', '/life-payment/api/payment/result', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000383, 'GDN2015', 'POST', '/life-payment/api/payment/charges/_search', '/life-payment/api/payment/charges/_search', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 09:43:29', '2023-04-14 09:43:29', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000384, 'QDN2001', 'PUT', '/life-policy/policy/schedule', '/life-policy/policy/schedule', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-14 16:32:31', '2023-04-14 16:32:31', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000385, 'QDN2002', 'PUT', '/life-policy/policy/premium/schedule', '/life-policy/policy/premium/schedule', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'Y', 10000, NULL, NULL, '2023-04-14 16:32:31', '2023-04-20 20:56:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000386, 'RDQ2020', 'GET', '/life-product/inner/product/{{productCode}}/agreements/{{agreementCodeList}}', '/life-product/inner/product/{{productCode}}/agreements/{{agreementCodeList}}', 'life-product', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'Y', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-17 17:13:05', '2023-04-17 17:13:05', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000387, 'QDS2064', 'POST', '/life-policy/manage/pos/{{policyNo}}/refund/bills', '/life-policy/manage/pos/{{policyNo}}/refund/bills', 'life-policy', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-19 16:45:28', '2023-04-19 16:45:28', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000388, 'KDT2061', 'GET', '/life-policy/manage/pos/policy/{{policyNo}}/payee', '/life-policy/manage/pos/policy/{{policyNo}}/payee', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-20 10:56:24', '2023-04-20 10:56:24', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000389, 'RDT2040', 'POST', '/life-market/manage/calculators/policy/trial', '/life-market/manage/calculators/policy/trial', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-20 17:44:55', '2023-04-20 17:44:55', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000390, 'ODU2039', 'GET', '/life-payment/manage/payment/bank-cards/{{bankCardId}}', '/life-payment/manage/payment/bank-cards/{{bankCardId}}', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-21 14:45:49', '2023-04-21 14:45:49', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000391, 'QDU2008', 'POST', '/life-task/task', '/life-task/task', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-21 16:55:02', '2023-04-21 16:55:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000392, 'QDU2009', 'DELETE', '/life-task/tasks/{{taskNo}}', '/life-task/tasks/{{taskNo}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-21 16:55:02', '2023-04-21 16:55:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000393, 'QDU2010', 'PUT', '/life-task/tasks/{{tranCode}}', '/life-task/tasks/{{tranCode}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-21 16:55:02', '2023-04-21 16:55:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000394, 'QDU2011', 'POST', '/life-task/tasks/_search', '/life-task/tasks/_search', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-21 16:55:02', '2023-04-21 16:55:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000395, 'QDU2012', 'GET', '/life-task/tasks/{{tranCode}}', '/life-task/tasks/{{tranCode}}', 'life-task', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-21 16:55:02', '2023-04-21 16:55:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000396, 'QDU2037', 'GET', '/life-payment/manage/payment/customer/{{customerNo}}/bank-cards', '/life-payment/manage/payment/customer/{{customerNo}}/bank-cards', 'life-payment', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-21 16:57:54', '2023-04-21 16:57:54', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000397, 'QDU2054', 'POST', '/life-market/manage/calculators/policy/payFrequencyType/trial', '/life-market/manage/calculators/policy/payFrequencyType/trial', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-21 16:58:03', '2023-04-21 16:58:03', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000398, 'QDU2055', 'POST', '/life-market/manage/calculators/policy/sumInsured/trial', '/life-market/manage/calculators/policy/sumInsured/trial', 'life-market', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-21 16:58:03', '2023-04-21 16:58:03', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000399, 'ODW2050', 'GET', '/life-customer/api/template', '/life-customer/api/template', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-23 14:34:17', '2023-04-23 14:34:17', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000400, 'ODW2051', 'GET', '/life-customer/election', '/life-customer/election', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-23 14:34:17', '2023-04-23 14:34:17', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000401, 'ODW2052', 'GET', '/life-customer/election/master', '/life-customer/election/master', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-23 14:34:17', '2023-04-23 14:34:17', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000402, 'ODW2053', 'GET', '/life-customer/health', '/life-customer/health', 'life-customer', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-23 14:34:17', '2023-04-23 14:34:17', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000403, 'ODW2054', 'POST', '/life-customer/job/{{jobName}}', '/life-customer/job/{{jobName}}', 'life-customer', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-23 14:34:17', '2023-04-23 14:34:17', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000404, 'PDX2067', 'POST', '/life-policy/index/create', '/life-policy/index/create', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-24 15:23:16', '2023-04-24 15:23:16', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000405, 'PDX2068', 'POST', '/life-policy/index/delete/{{indexName}}', '/life-policy/index/delete/{{indexName}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-24 15:23:16', '2023-04-24 15:23:16', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000406, 'RDY2030', 'GET', '/life-policy/document/{{policyNo}}', '/life-policy/document/{{policyNo}}', 'life-policy', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-25 17:13:19', '2023-04-25 17:13:19', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000407, 'UDZ2000', 'POST', '/za-insure-partner/bill/renew/myBillList', '/za-insure-partner/bill/renew/myBillList', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000408, 'UDZ2001', 'POST', '/za-insure-partner/bill/order/create', '/za-insure-partner/bill/order/create', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000409, 'UDZ2002', 'POST', '/za-insure-partner/campaign/code/detail', '/za-insure-partner/campaign/code/detail', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000410, 'UDZ2003', 'POST', '/za-insure-partner/campaign/first/fullPrice', '/za-insure-partner/campaign/first/fullPrice', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000411, 'UDZ2004', 'POST', '/za-insure-partner/campaign/code/list', '/za-insure-partner/campaign/code/list', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000412, 'UDZ2005', 'POST', '/za-insure-partner/campaign/checkHolder', '/za-insure-partner/campaign/checkHolder', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000413, 'UDZ2006', 'POST', '/za-insure-partner/market/plans/list', '/za-insure-partner/market/plans/list', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000414, 'UDZ2007', 'POST', '/za-insure-partner/market/sa/range', '/za-insure-partner/market/sa/range', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000415, 'UDZ2008', 'POST', '/za-insure-partner/market/ageCheck', '/za-insure-partner/market/ageCheck', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000416, 'UDZ2009', 'POST', '/za-insure-partner/market/planIdTransfer', '/za-insure-partner/market/planIdTransfer', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000417, 'UDZ2010', 'POST', '/za-insure-partner/market/goods/insured/total', '/za-insure-partner/market/goods/insured/total', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000418, 'UDZ2011', 'POST', '/za-insure-partner/market/tax/countryList', '/za-insure-partner/market/tax/countryList', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000419, 'UDZ2012', 'POST', '/za-insure-partner/market/goods/status', '/za-insure-partner/market/goods/status', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000420, 'UDZ2013', 'POST', '/za-insure-partner/calculate/premium', '/za-insure-partner/calculate/premium', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000421, 'UDZ2014', 'POST', '/za-insure-partner/calculate/premiumBatch', '/za-insure-partner/calculate/premiumBatch', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000422, 'UDZ2015', 'POST', '/za-insure-partner/calculate/premiumForNextYear', '/za-insure-partner/calculate/premiumForNextYear', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000423, 'UDZ2016', 'POST', '/za-insure-partner/calculate/premiumForNYear', '/za-insure-partner/calculate/premiumForNYear', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000424, 'UDZ2017', 'POST', '/za-insure-partner/calculate/premiumForLiability', '/za-insure-partner/calculate/premiumForLiability', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000425, 'UDZ2018', 'POST', '/za-insure-partner/calculate/factorsDynamic', '/za-insure-partner/calculate/factorsDynamic', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000426, 'UDZ2019', 'POST', '/za-insure-partner/calculate/premiumSaving', '/za-insure-partner/calculate/premiumSaving', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000427, 'UDZ2020', 'POST', '/za-insure-partner/calculate/premiumMax', '/za-insure-partner/calculate/premiumMax', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000428, 'UDZ2021', 'POST', '/za-insure-partner/bizapply/uwLoop', '/za-insure-partner/bizapply/uwLoop', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000429, 'UDZ2022', 'POST', '/za-insure-partner/bizapply/uwOutcome', '/za-insure-partner/bizapply/uwOutcome', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000430, 'UDZ2023', 'POST', '/za-insure-partner/bizapply/createUwApplication', '/za-insure-partner/bizapply/createUwApplication', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000431, 'UDZ2024', 'POST', '/za-insure-partner/channel/validate/token', '/za-insure-partner/channel/validate/token', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000432, 'UDZ2025', 'POST', '/za-insure-partner/channel/click-window', '/za-insure-partner/channel/click-window', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000433, 'UDZ2026', 'POST', '/za-insure-partner/policy/list', '/za-insure-partner/policy/list', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000434, 'UDZ2027', 'GET', '/za-insure-partner/policy/detail/{{policyNo}}', '/za-insure-partner/policy/detail/{{policyNo}}', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000435, 'UDZ2028', 'POST', '/za-insure-partner/policy/cashValue/total', '/za-insure-partner/policy/cashValue/total', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000436, 'UDZ2029', 'POST', '/za-insure-partner/common/keepalive', '/za-insure-partner/common/keepalive', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:12', '2023-04-26 20:44:12', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000437, 'UDZ2030', 'POST', '/za-insure-partner/common/ip/location', '/za-insure-partner/common/ip/location', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000438, 'UDZ2031', 'POST', '/za-insure-partner/common/health', '/za-insure-partner/common/health', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000439, 'UDZ2032', 'POST', '/za-insure-partner/common/addWhiteIp', '/za-insure-partner/common/addWhiteIp', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000440, 'UDZ2033', 'POST', '/za-insure-partner/common/addWorldCheckList', '/za-insure-partner/common/addWorldCheckList', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000441, 'UDZ2034', 'POST', '/za-insure-partner/pay/request', '/za-insure-partner/pay/request', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000442, 'UDZ2035', 'POST', '/za-insure-partner/pay/confirm', '/za-insure-partner/pay/confirm', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000443, 'UDZ2036', 'POST', '/za-insure-partner/pay/channel', '/za-insure-partner/pay/channel', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000444, 'UDZ2037', 'POST', '/za-insure-partner/pay/zabank/webhook', '/za-insure-partner/pay/zabank/webhook', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000445, 'UDZ2038', 'POST', '/za-insure-partner/pay/result', '/za-insure-partner/pay/result', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000446, 'UDZ2039', 'POST', '/za-insure-partner/order/list', '/za-insure-partner/order/list', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000447, 'UDZ2040', 'GET', '/za-insure-partner/order/detail/{{orderNo}}', '/za-insure-partner/order/detail/{{orderNo}}', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000448, 'UDZ2041', 'POST', '/za-insure-partner/order/submit', '/za-insure-partner/order/submit', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000449, 'UDZ2042', 'POST', '/za-insure-partner/order/level/factors', '/za-insure-partner/order/level/factors', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000450, 'UDZ2043', 'POST', '/za-insure-partner/order/summary/cal', '/za-insure-partner/order/summary/cal', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000451, 'UDZ2044', 'POST', '/za-insure-partner/order/summary/calBatch', '/za-insure-partner/order/summary/calBatch', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000452, 'UDZ2045', 'POST', '/za-insure-partner/order/check/sa', '/za-insure-partner/order/check/sa', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000453, 'UDZ2046', 'POST', '/za-insure-partner/order/confirm', '/za-insure-partner/order/confirm', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000454, 'UDZ2047', 'POST', '/za-insure-partner/order/uwConfirm', '/za-insure-partner/order/uwConfirm', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000455, 'UDZ2048', 'POST', '/za-insure-partner/order/update/promoCode', '/za-insure-partner/order/update/promoCode', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000456, 'UDZ2049', 'POST', '/za-insure-partner/order/emailCheck', '/za-insure-partner/order/emailCheck', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000457, 'UDZ2050', 'POST', '/za-insure-partner/order/nationalityCheck', '/za-insure-partner/order/nationalityCheck', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000458, 'UDZ2051', 'POST', '/za-insure-partner/user/sign/in', '/za-insure-partner/user/sign/in', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000459, 'UDZ2052', 'GET', '/za-insure-partner/user/sign/out', '/za-insure-partner/user/sign/out', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000460, 'UDZ2053', 'POST', '/za-insure-partner/user/isRegistered', '/za-insure-partner/user/isRegistered', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000461, 'UDZ2054', 'POST', '/za-insure-partner/user/insured/exist', '/za-insure-partner/user/insured/exist', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000462, 'UDZ2055', 'POST', '/za-insure-partner/user/isCertiBinded', '/za-insure-partner/user/isCertiBinded', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000463, 'UDZ2056', 'POST', '/za-insure-partner/user/verification/code', '/za-insure-partner/user/verification/code', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000464, 'UDZ2057', 'POST', '/za-insure-partner/user/checkVerifiedCode', '/za-insure-partner/user/checkVerifiedCode', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000465, 'UDZ2058', 'POST', '/za-insure-partner/pos/close/request', '/za-insure-partner/pos/close/request', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000466, 'UDZ2059', 'POST', '/za-insure-partner/pos/close/confirm', '/za-insure-partner/pos/close/confirm', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000467, 'UDZ2060', 'POST', '/za-insure-partner/pos/list', '/za-insure-partner/pos/list', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000468, 'UDZ2061', 'POST', '/za-insure-partner/pos/policy/withhold', '/za-insure-partner/pos/policy/withhold', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000469, 'UDZ2062', 'POST', '/za-insure-partner/pos/online/detail', '/za-insure-partner/pos/online/detail', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000470, 'UDZ2063', 'POST', '/za-insure-partner/pos/detail', '/za-insure-partner/pos/detail', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000471, 'UDZ2064', 'POST', '/za-insure-partner/pos/apply/check', '/za-insure-partner/pos/apply/check', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000472, 'UDZ2065', 'POST', '/za-insure-partner/pos/policy/modify/beneficiary', '/za-insure-partner/pos/policy/modify/beneficiary', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000473, 'UDZ2066', 'POST', '/za-insure-partner/user/customer/detail', '/za-insure-partner/user/customer/detail', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000474, 'UDZ2067', 'GET', '/za-insure-partner/user/customer/insured_list', '/za-insure-partner/user/customer/insured_list', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000475, 'UDZ2068', 'POST', '/za-insure-partner/user/customer/check', '/za-insure-partner/user/customer/check', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000476, 'UDZ2069', 'POST', '/za-insure-partner/user/customer/hasPolicyAndOrder', '/za-insure-partner/user/customer/hasPolicyAndOrder', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000477, 'UDZ2070', 'POST', '/za-insure-partner/user/customer/detail/2FA', '/za-insure-partner/user/customer/detail/2FA', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000478, 'UDZ2071', 'GET', '/za-insure-partner/file/downLoad/{{url}}.file', '/za-insure-partner/file/downLoad/{{url}}.file', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:44:13', '2023-04-26 20:44:13', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000479, 'UDZ2075', 'POST', '/za-insure-partner/campaign/query', '/za-insure-partner/campaign/query', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000480, 'UDZ2079', 'POST', '/za-insure-partner/campaign/queryPolicyTotalList', '/za-insure-partner/campaign/queryPolicyTotalList', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000481, 'UDZ2080', 'POST', '/za-insure-partner/campaign/checkCouponInfo', '/za-insure-partner/campaign/checkCouponInfo', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000482, 'UDZ2081', 'GET', '/za-insure-partner/campaign/downloadAttachment', '/za-insure-partner/campaign/downloadAttachment', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000483, 'UDZ2087', 'POST', '/za-insure-partner/market/widgets/insured', '/za-insure-partner/market/widgets/insured', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000484, 'UDZ2088', 'POST', '/za-insure-partner/market/widgets/savings', '/za-insure-partner/market/widgets/savings', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000485, 'UDZ2091', 'POST', '/za-insure-partner/market/queryStandardIrr', '/za-insure-partner/market/queryStandardIrr', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000486, 'UDZ2103', 'POST', '/za-insure-partner/ocf/v1/api/applications/authorizations/checks', '/za-insure-partner/ocf/v1/api/applications/authorizations/checks', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000487, 'UDZ2104', 'POST', '/za-insure-partner/ocf/v1/api/applications/authorizations', '/za-insure-partner/ocf/v1/api/applications/authorizations', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000488, 'UDZ2105', 'GET', '/za-insure-partner/ocf/v1/api/applications/authorizations', '/za-insure-partner/ocf/v1/api/applications/authorizations', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000489, 'UDZ2106', 'POST', '/za-insure-partner/ocf/v1/api/order/submit', '/za-insure-partner/ocf/v1/api/order/submit', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000490, 'UDZ2107', 'POST', '/za-insure-partner/ocf/v1/api/order/uwConfirm', '/za-insure-partner/ocf/v1/api/order/uwConfirm', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000491, 'UDZ2108', 'POST', '/za-insure-partner/ocf/v1/api/order/status', '/za-insure-partner/ocf/v1/api/order/status', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000492, 'UDZ2109', 'POST', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/authCustomers', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/authCustomers', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000493, 'UDZ2110', 'POST', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/confirms', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/confirms', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000494, 'UDZ2111', 'GET', '/za-insure-partner/ocf/v1/api/order/detail/{{orderNo}}', '/za-insure-partner/ocf/v1/api/order/detail/{{orderNo}}', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000495, 'UDZ2112', 'POST', '/za-insure-partner/ocf/v1/api/bizapply/uwLoop', '/za-insure-partner/ocf/v1/api/bizapply/uwLoop', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000496, 'UDZ2113', 'POST', '/za-insure-partner/ocf/v1/api/bizapply/uwOutcome', '/za-insure-partner/ocf/v1/api/bizapply/uwOutcome', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000497, 'UDZ2114', 'POST', '/za-insure-partner/ocf/v1/api/bizapply/createUwApplication', '/za-insure-partner/ocf/v1/api/bizapply/createUwApplication', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000498, 'UDZ2115', 'POST', '/za-insure-partner/ocf/v1/api/calculate/premium', '/za-insure-partner/ocf/v1/api/calculate/premium', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000499, 'UDZ2116', 'POST', '/za-insure-partner/ocf/v1/api/market/plans/list', '/za-insure-partner/ocf/v1/api/market/plans/list', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000500, 'UDZ2117', 'POST', '/za-insure-partner/ocf/v1/api/campaign/code/detail', '/za-insure-partner/ocf/v1/api/campaign/code/detail', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000501, 'UDZ2118', 'POST', '/za-insure-partner/ocf/v1/api/level/factors', '/za-insure-partner/ocf/v1/api/level/factors', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000502, 'UDZ2119', 'GET', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000503, 'UDZ2120', 'GET', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/status', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/status', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000504, 'UDZ2121', 'POST', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/payments/results', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/payments/results', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000505, 'UDZ2122', 'GET', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/benefits/illustrations', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/benefits/illustrations', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000506, 'UDZ2123', 'POST', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/checks', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/checks', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000507, 'UDZ2124', 'POST', '/za-insure-partner/user/bling/checkChannelUser', '/za-insure-partner/user/bling/checkChannelUser', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000508, 'UDZ2125', 'POST', '/za-insure-partner/user/bling/isCertiBinded', '/za-insure-partner/user/bling/isCertiBinded', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000509, 'UDZ2126', 'POST', '/za-insure-partner/user/bling/isRegistered', '/za-insure-partner/user/bling/isRegistered', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000510, 'UDZ2127', 'GET', '/za-insure-partner/user/bling/hasClaim/{{customerId}}', '/za-insure-partner/user/bling/hasClaim/{{customerId}}', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000511, 'UDZ2128', 'POST', '/za-insure-partner/user/bling/userBizFlag', '/za-insure-partner/user/bling/userBizFlag', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000512, 'UDZ2129', 'POST', '/za-insure-partner/user/bling/storeHkidInfo', '/za-insure-partner/user/bling/storeHkidInfo', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000513, 'UDZ2130', 'POST', '/za-insure-partner/user/bling/click-window', '/za-insure-partner/user/bling/click-window', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000514, 'UDZ2133', 'GET', '/za-insure-partner/anan-api/v1/life-policy/policy/list', '/za-insure-partner/anan-api/v1/life-policy/policy/list', 'za-insure-partner', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000515, 'UDZ2142', 'POST', '/za-insure-partner/insured/faceCompare', '/za-insure-partner/insured/faceCompare', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000516, 'UDZ2143', 'POST', '/za-insure-partner/insured/conclusion', '/za-insure-partner/insured/conclusion', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000517, 'UDZ2156', 'POST', '/za-insure-partner/order/check/insuredSa', '/za-insure-partner/order/check/insuredSa', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000518, 'UDZ2162', 'POST', '/za-insure-partner/order/ocrUpload/status', '/za-insure-partner/order/ocrUpload/status', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000519, 'UDZ2174', 'POST', '/za-insure-partner/pos/policy/successiveHolder', '/za-insure-partner/pos/policy/successiveHolder', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000520, 'UDZ2183', 'POST', '/za-insure-partner/user/customer/hasOrderedProduct', '/za-insure-partner/user/customer/hasOrderedProduct', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000521, 'UDZ2186', 'POST', '/za-insure-partner/file/uploadCache', '/za-insure-partner/file/uploadCache', 'za-insure-partner', 'multipart/form-data', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000522, 'UDZ2187', 'POST', '/za-insure-partner/file/supplement/ocrFile', '/za-insure-partner/file/supplement/ocrFile', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000523, 'UDZ2188', 'POST', '/za-insure-partner/file/supplement/reUploadFile', '/za-insure-partner/file/supplement/reUploadFile', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000524, 'UDZ2189', 'POST', '/za-insure-partner/file/review/upload', '/za-insure-partner/file/review/upload', 'za-insure-partner', 'multipart/form-data', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-26 20:53:36', '2023-04-26 20:53:36', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000525, 'QD02000', 'POST', '/za-graphene-order-scenario/order/curl/deleteCustomerInfo', '/za-graphene-order-scenario/order/curl/deleteCustomerInfo', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000526, 'QD02001', 'POST', '/za-graphene-order-scenario/order/curl/deleteOrderInfo/{{orderNo}}/{{customerId}}', '/za-graphene-order-scenario/order/curl/deleteOrderInfo/{{orderNo}}/{{customerId}}', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000527, 'QD02002', 'POST', '/za-graphene-order-scenario/order/curl/deleteOrderALLInfo', '/za-graphene-order-scenario/order/curl/deleteOrderALLInfo', 'za-graphene-order-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000528, 'QD02003', 'POST', '/za-graphene-order-scenario/order/curl/expireOrder/{{orderNo}}', '/za-graphene-order-scenario/order/curl/expireOrder/{{orderNo}}', 'za-graphene-order-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000529, 'QD02004', 'POST', '/za-graphene-order-scenario/[/createOrder]', '/za-graphene-order-scenario/[/createOrder]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000530, 'QD02005', 'POST', '/za-graphene-order-scenario/[/updateOrder]', '/za-graphene-order-scenario/[/updateOrder]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000531, 'QD02006', 'POST', '/za-graphene-order-scenario/[/cancelOrder]', '/za-graphene-order-scenario/[/cancelOrder]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000532, 'QD02007', 'POST', '/za-graphene-order-scenario/[/payOrder]', '/za-graphene-order-scenario/[/payOrder]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000533, 'QD02008', 'POST', '/za-graphene-order-scenario/[/queryOrderInfo]', '/za-graphene-order-scenario/[/queryOrderInfo]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000534, 'QD02009', 'POST', '/za-graphene-order-scenario/[/listOrderByHolder]', '/za-graphene-order-scenario/[/listOrderByHolder]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000535, 'QD02010', 'POST', '/za-graphene-order-scenario/[/listOrderByInsuredCustomerIds]', '/za-graphene-order-scenario/[/listOrderByInsuredCustomerIds]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000536, 'QD02011', 'POST', '/za-graphene-order-scenario/[/listOrderByCustomerIds]', '/za-graphene-order-scenario/[/listOrderByCustomerIds]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000537, 'QD02012', 'POST', '/za-graphene-order-scenario/[/queryOrderList]', '/za-graphene-order-scenario/[/queryOrderList]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000538, 'QD02013', 'POST', '/za-graphene-order-scenario/[/updateOrderUserInfo]', '/za-graphene-order-scenario/[/updateOrderUserInfo]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000539, 'QD02014', 'POST', '/za-graphene-order-scenario/modifyOrderStatus', '/za-graphene-order-scenario/modifyOrderStatus', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000540, 'QD02015', 'POST', '/za-graphene-order-scenario/queryConditionOrderList', '/za-graphene-order-scenario/queryConditionOrderList', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000541, 'QD02016', 'POST', '/za-graphene-order-scenario/[/paymentAuditIssuance]', '/za-graphene-order-scenario/[/paymentAuditIssuance]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000542, 'QD02017', 'POST', '/za-graphene-order-scenario/[/payConfimRequest]', '/za-graphene-order-scenario/[/payConfimRequest]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000543, 'QD02018', 'POST', '/za-graphene-order-scenario/[/payOrderAndRefund]', '/za-graphene-order-scenario/[/payOrderAndRefund]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000544, 'QD02019', 'POST', '/za-graphene-order-scenario/[/orderOTPCheck]', '/za-graphene-order-scenario/[/orderOTPCheck]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000545, 'QD02020', 'POST', '/za-graphene-order-scenario/[/queryPaymentOrderList]', '/za-graphene-order-scenario/[/queryPaymentOrderList]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000546, 'QD02021', 'POST', '/za-graphene-order-scenario/[/updateOrderUWOutcome]', '/za-graphene-order-scenario/[/updateOrderUWOutcome]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000547, 'QD02022', 'POST', '/za-graphene-order-scenario/[/createOrderdUwApplication]', '/za-graphene-order-scenario/[/createOrderdUwApplication]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000548, 'QD02023', 'POST', '/za-graphene-order-scenario/[/getOrderNo]', '/za-graphene-order-scenario/[/getOrderNo]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000549, 'QD02024', 'POST', '/za-graphene-order-scenario/[/insuredConclusion]', '/za-graphene-order-scenario/[/insuredConclusion]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000550, 'QD02025', 'POST', '/za-graphene-order-scenario/[/certiOCRVerify]', '/za-graphene-order-scenario/[/certiOCRVerify]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000551, 'QD02026', 'POST', '/za-graphene-order-scenario/[/declareInfo]', '/za-graphene-order-scenario/[/declareInfo]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000552, 'QD02027', 'POST', '/za-graphene-order-scenario/[/payOrderRenew]', '/za-graphene-order-scenario/[/payOrderRenew]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000553, 'QD02028', 'POST', '/za-graphene-order-scenario/[/deleteOrder]', '/za-graphene-order-scenario/[/deleteOrder]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000554, 'QD02029', 'POST', '/za-graphene-order-scenario/[/listOrderByCustomerId]', '/za-graphene-order-scenario/[/listOrderByCustomerId]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000555, 'QD02030', 'POST', '/za-graphene-order-scenario/[/saveIpCheckFlow]', '/za-graphene-order-scenario/[/saveIpCheckFlow]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000556, 'QD02031', 'POST', '/za-graphene-order-scenario/[/querySavingCoupon]', '/za-graphene-order-scenario/[/querySavingCoupon]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000557, 'QD02032', 'POST', '/za-graphene-order-scenario/[/addSavingCoupon]', '/za-graphene-order-scenario/[/addSavingCoupon]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000558, 'QD02033', 'POST', '/za-graphene-order-scenario/[/queryCoupon]', '/za-graphene-order-scenario/[/queryCoupon]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000559, 'QD02034', 'POST', '/za-graphene-order-scenario/[/addCoupon]', '/za-graphene-order-scenario/[/addCoupon]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000560, 'QD02035', 'PUT', '/za-graphene-order-scenario/[/orderDeleteHistoryUwDataTask/{{remove}}]', '/za-graphene-order-scenario/[/orderDeleteHistoryUwDataTask/{{remove}}]', 'za-graphene-order-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000561, 'QD02036', 'POST', '/za-graphene-order-scenario/[/authCustomer]', '/za-graphene-order-scenario/[/authCustomer]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000562, 'QD02037', 'POST', '/za-graphene-order-scenario/[/paySuccessToIssue]', '/za-graphene-order-scenario/[/paySuccessToIssue]', 'za-graphene-order-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000563, 'QD02038', 'GET', '/za-graphene-order-scenario/case/k', '/za-graphene-order-scenario/case/k', 'za-graphene-order-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000564, 'QD02039', 'GET', '/za-graphene-order-scenario/case/kafka', '/za-graphene-order-scenario/case/kafka', 'za-graphene-order-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000565, 'QD02040', 'POST', '/za-graphene-bizapply-scenario/processIssuance', '/za-graphene-bizapply-scenario/processIssuance', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000566, 'QD02041', 'POST', '/za-graphene-bizapply-scenario/checkProposalRule', '/za-graphene-bizapply-scenario/checkProposalRule', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000567, 'QD02042', 'POST', '/za-graphene-bizapply-scenario/getInformQuestion', '/za-graphene-bizapply-scenario/getInformQuestion', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000568, 'QD02043', 'POST', '/za-graphene-bizapply-scenario/getSummaryReview', '/za-graphene-bizapply-scenario/getSummaryReview', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000569, 'QD02044', 'POST', '/za-graphene-bizapply-scenario/paymentProcess', '/za-graphene-bizapply-scenario/paymentProcess', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000570, 'QD02045', 'POST', '/za-graphene-bizapply-scenario/queryBizapplyInfo', '/za-graphene-bizapply-scenario/queryBizapplyInfo', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000571, 'QD02046', 'POST', '/za-graphene-bizapply-scenario/continueUWLoop', '/za-graphene-bizapply-scenario/continueUWLoop', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000572, 'QD02047', 'POST', '/za-graphene-bizapply-scenario/createUWApplication', '/za-graphene-bizapply-scenario/createUWApplication', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000573, 'QD02048', 'POST', '/za-graphene-bizapply-scenario/getUwOutcome', '/za-graphene-bizapply-scenario/getUwOutcome', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000574, 'QD02049', 'POST', '/za-graphene-bizapply-scenario/getMultiUwOutcome', '/za-graphene-bizapply-scenario/getMultiUwOutcome', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000575, 'QD02050', 'POST', '/za-graphene-bizapply-scenario/updateUWFactors', '/za-graphene-bizapply-scenario/updateUWFactors', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000576, 'QD02051', 'POST', '/za-graphene-bizapply-scenario/anonymizeUWData', '/za-graphene-bizapply-scenario/anonymizeUWData', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000577, 'QD02052', 'POST', '/za-graphene-bizapply-scenario/snatchUWCfg', '/za-graphene-bizapply-scenario/snatchUWCfg', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000578, 'QD02053', 'PUT', '/za-graphene-bizapply-scenario/uwDataPatch', '/za-graphene-bizapply-scenario/uwDataPatch', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000579, 'QD02054', 'POST', '/za-graphene-bizapply-scenario/test/application/create', '/za-graphene-bizapply-scenario/test/application/create', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000580, 'QD02055', 'GET', '/za-graphene-bizapply-scenario/test/underwriting/{{applicantToken}}', '/za-graphene-bizapply-scenario/test/underwriting/{{applicantToken}}', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000581, 'QD02056', 'POST', '/za-graphene-bizapply-scenario/test/underwriting/markascomplete/{{applicantToken}}', '/za-graphene-bizapply-scenario/test/underwriting/markascomplete/{{applicantToken}}', 'za-graphene-bizapply-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000582, 'QD02057', 'GET', '/za-graphene-bizapply-scenario/test/underwriting/outcome/{{applicantToken}}', '/za-graphene-bizapply-scenario/test/underwriting/outcome/{{applicantToken}}', 'za-graphene-bizapply-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000583, 'QD02058', 'POST', '/za-graphene-bizapply-scenario/payment', '/za-graphene-bizapply-scenario/payment', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000584, 'QD02059', 'POST', '/za-graphene-bizapply-scenario/compliance', '/za-graphene-bizapply-scenario/compliance', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000585, 'QD02060', 'GET', '/za-graphene-bizapply-scenario/ok', '/za-graphene-bizapply-scenario/ok', 'za-graphene-bizapply-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000586, 'QD02061', 'GET', '/za-graphene-bizapply-scenario/health', '/za-graphene-bizapply-scenario/health', 'za-graphene-bizapply-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000587, 'QD02062', 'GET', '/za-graphene-bizapply-scenario/getInfo', '/za-graphene-bizapply-scenario/getInfo', 'za-graphene-bizapply-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000588, 'QD02063', 'GET', '/za-graphene-issuance-scenario/health', '/za-graphene-issuance-scenario/health', 'za-graphene-issuance-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:39:48', '2023-04-27 16:39:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000589, 'QD02064', 'GET', '/za-graphene-issuance-scenario/[/calculatePremium]', '/za-graphene-issuance-scenario/[/calculatePremium]', 'za-graphene-issuance-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:39:48', '2023-04-27 16:39:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000590, 'QD02065', 'GET', '/za-graphene-issuance-scenario/[/createIssuance]', '/za-graphene-issuance-scenario/[/createIssuance]', 'za-graphene-issuance-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:39:48', '2023-04-27 16:39:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000591, 'QD02066', 'GET', '/za-graphene-issuance-scenario/[/confirmIssuance]', '/za-graphene-issuance-scenario/[/confirmIssuance]', 'za-graphene-issuance-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:39:48', '2023-04-27 16:39:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000592, 'QD02067', 'GET', '/za-graphene-issuance-scenario/[/cancelIssuance]', '/za-graphene-issuance-scenario/[/cancelIssuance]', 'za-graphene-issuance-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:39:48', '2023-04-27 16:39:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000593, 'QD02068', 'GET', '/za-graphene-issuance-scenario/[/pendingIssuance]', '/za-graphene-issuance-scenario/[/pendingIssuance]', 'za-graphene-issuance-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:39:48', '2023-04-27 16:39:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000594, 'QD02069', 'GET', '/za-graphene-issuance-scenario/[/modifyIssuance]', '/za-graphene-issuance-scenario/[/modifyIssuance]', 'za-graphene-issuance-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:39:48', '2023-04-27 16:39:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000595, 'QD02070', 'GET', '/za-graphene-issuance-scenario/[/queryIssuanceByCondition]', '/za-graphene-issuance-scenario/[/queryIssuanceByCondition]', 'za-graphene-issuance-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:39:48', '2023-04-27 16:39:48', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000596, 'QD02123', 'POST', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/payments/checks', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/payments/checks', 'za-insure-partner', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:59:00', '2023-04-27 16:59:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000597, 'QD02123', 'POST', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/payments/checks', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/payments/checks', 'za-insure-partner', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:59:00', '2023-04-27 16:59:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000598, 'QD02123', 'POST', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/payments/checks', '/za-insure-partner/ocf/v1/api/applications/{{applicationNo}}/payments/checks', 'za-insure-partner', 'application/json', 'PRD', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:59:00', '2023-04-27 16:59:00', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000601, 'QEV2019', 'POST', '/za-graphene-bizapply-scenario/sync-saving-uwInfo', '/za-graphene-bizapply-scenario/sync-saving-uwInfo', 'za-graphene-bizapply-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-05-22 16:32:51', '2023-05-22 16:32:51', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000603, 'SEY2020', 'GET', '/za-graphene-bizapply-scenario/uwInfo/{{orderNo}}', '/za-graphene-bizapply-scenario/uwInfo/{{orderNo}}', 'za-graphene-bizapply-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-05-25 18:27:46', '2023-05-25 18:27:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000604, 'SEY2021', 'GET', '/za-graphene-bizapply-scenario/productCategory/{{productId}}', '/za-graphene-bizapply-scenario/productCategory/{{productId}}', 'za-graphene-bizapply-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-05-25 18:27:46', '2023-05-25 18:27:46', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000605, '1661927952943677440', 'POST', '/api/getApplyInfo', '/api/getApplyInfo', 'life-test', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', '', 'Y', 'N', 1000, NULL, NULL, '2023-05-26 10:51:15', '2023-05-26 14:58:14', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000606, 'REZ2004', 'GET', '/za-graphene-order-scenario/productId/{{orderNo}}', '/za-graphene-order-scenario/productId/{{orderNo}}', 'za-graphene-order-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-05-26 17:38:39', '2023-05-26 17:38:39', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000607, 'QD02040', 'POST', '/za-graphene-bizapply-scenario/processIssuance', '/za-graphene-bizapply-scenario/processIssuance', 'za-graphene-bizapply-scenario', 'application/json', 'TEST', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000608, '1664110128195960832', 'POST', '/gateway/findKey', '/gateway/findKey', 'life-test', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 1000, NULL, NULL, '2023-06-01 11:22:26', '2023-06-01 16:42:16', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000609, '1664112073048588288', 'GET', '/test', '/test', 'life-test', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 1000, NULL, NULL, '2023-06-01 11:30:10', '2023-06-01 11:30:10', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000610, 'RFB2002', 'POST', 'sss', 'sss', 'life-dev', 'application/json', 'DEV', 'N', 'N', NULL, 'N', 50, 'N', NULL, 'N', 'N', 10000, 'sss', 'ss', '2023-06-02 17:40:33', '2023-06-02 17:40:33', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000611, 'RFB2002', 'POST', 'sss', 'sss', 'life-dev', 'application/json', 'TEST', 'N', 'N', NULL, 'N', 50, 'N', NULL, 'N', 'N', 10000, 'sss', 'ss', '2023-06-02 17:40:33', '2023-06-02 17:40:33', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000617, 'OFF2020', 'POST', '/za-graphene-bizapply-scenario/uWMultiApplicationOutcome', '/za-graphene-bizapply-scenario/uWMultiApplicationOutcome', 'za-graphene-bizapply-scenario', 'application/json', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-06-06 14:51:37', '2023-06-06 14:51:37', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000618, 'OFF2021', 'POST', '/za-graphene-bizapply-scenario/uWApplicationOutcome', '/za-graphene-bizapply-scenario/uWApplicationOutcome', 'za-graphene-bizapply-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'DEV', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-06-06 14:51:37', '2023-06-06 14:51:37', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000619, 'PDL2039', 'GET', '/life-document/api/files/common/download/{{fileUniqueCode}}', '/life-document/api/files/common/download/{{fileUniqueCode}}', 'life-document', 'application/x-www-form-urlencoded;charset=UTF-8', 'PRD', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 15:22:34', '2023-04-12 15:22:34', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000620, 'PDL2038', 'PUT', '/life-document/api/files/effective/batch/{{fileSrcNo}}', '/life-document/api/files/effective/batch/{{fileSrcNo}}', 'life-document', 'application/json', 'PRD', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-04-12 15:22:34', '2023-04-12 15:22:34', 'system', 'system', 'N');
INSERT INTO `t_api_version` VALUES (100000621, 'OFF2021', 'POST', '/za-graphene-bizapply-scenario/uWApplicationOutcome', '/za-graphene-bizapply-scenario/uWApplicationOutcome', 'za-graphene-bizapply-scenario', 'application/x-www-form-urlencoded;charset=UTF-8', 'PRD', 'N', 'Y', 1000, 'Y', 50, 'N', NULL, 'Y', 'N', 10000, NULL, NULL, '2023-06-06 14:51:37', '2023-06-06 14:51:37', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_environment
-- ----------------------------
DROP TABLE IF EXISTS `t_environment`;
CREATE TABLE `t_environment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'environment name',
  `env` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'environment code',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`env`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000004 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Api environment define' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_environment
-- ----------------------------
INSERT INTO `t_environment` VALUES (100000000, '开发环境', 'DEV', '2023-04-10 10:42:50', '2023-04-10 10:42:50', 'system', 'system', 'N');
INSERT INTO `t_environment` VALUES (100000001, '测试环境', 'TEST', '2023-04-10 10:43:00', '2023-04-10 10:43:00', 'system', 'system', 'N');
INSERT INTO `t_environment` VALUES (100000002, '验收环境', 'UAT', '2023-04-10 10:43:09', '2023-04-10 10:43:09', 'system', 'system', 'N');
INSERT INTO `t_environment` VALUES (100000003, '生产环境', 'PRD', '2023-04-10 10:43:19', '2023-04-10 10:43:19', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_gray_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_gray_rule`;
CREATE TABLE `t_gray_rule`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `rule_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'gray rule code',
  `rule_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'gray rule name',
  `global` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT 'gray global rule',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`rule_code`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000004 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Gray rule info' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_gray_rule
-- ----------------------------
INSERT INTO `t_gray_rule` VALUES (100000001, 'R001', '全局灰度规则', 'Y', '2023-05-04 10:40:39', '2023-05-04 10:40:39', 'system', 'system', 'N');
INSERT INTO `t_gray_rule` VALUES (100000002, 'R002', '字典灰度规则', 'N', '2023-05-04 11:31:52', '2023-05-04 11:31:52', 'system', 'system', 'N');
INSERT INTO `t_gray_rule` VALUES (100000003, 'KEI2000', '客户灰度规则', 'N', '2023-05-09 10:59:00', '2023-05-09 10:59:00', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_gray_rule_version
-- ----------------------------
DROP TABLE IF EXISTS `t_gray_rule_version`;
CREATE TABLE `t_gray_rule_version`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `rule_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'gray rule code',
  `rule_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'gray rule name',
  `env` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'gray environment code',
  `mode` tinyint(0) NULL DEFAULT 0 COMMENT 'gray mode（0：feature 1：scale)',
  `scale_rate` int(0) NULL DEFAULT 0 COMMENT 'gray rate percent on scale mode',
  `feature_content` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'gray content on feature mode',
  `header_pass_tag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'gray pass header tag name',
  `active` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT 'gray rule switch',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`rule_code`, `env`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000004 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Gray rule info version' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_gray_rule_version
-- ----------------------------
INSERT INTO `t_gray_rule_version` VALUES (100000002, 'R001', '全局灰度规则', 'DEV', 0, 0, NULL, NULL, 'N', '2023-05-08 18:18:21', '2023-05-08 18:18:33', 'system', 'system', 'N');
INSERT INTO `t_gray_rule_version` VALUES (100000003, 'KEI2000', '客户灰度规则', 'DEV', 0, 80, '{\n\"a\": \"111\"\n}', 'test-a', 'N', '2023-05-09 10:59:00', '2023-05-09 10:59:00', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'api group name',
  `group_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'api group code',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`group_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000003 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Api classification' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_group
-- ----------------------------
INSERT INTO `t_group` VALUES (100000000, '出单流程', 'NB', '2023-04-17 19:04:46', '2023-06-02 17:12:41', 'system', 'system', 'N');
INSERT INTO `t_group` VALUES (100000001, '保全流程', 'POS', '2023-04-17 19:05:43', '2023-04-17 19:05:43', 'system', 'system', 'N');
INSERT INTO `t_group` VALUES (100000002, '核保流程', 'UWT', '2023-04-17 19:06:24', '2023-04-17 19:06:24', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_report_config
-- ----------------------------
DROP TABLE IF EXISTS `t_report_config`;
CREATE TABLE `t_report_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'service name',
  `service_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api service code',
  `env` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEV' COMMENT 'api env',
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'service addresses',
  `maintainer` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'who maintain',
  `need_rate_limit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT 'rate limit switch',
  `rate_limit` int(0) NOT NULL DEFAULT 1000 COMMENT 'rate limit size',
  `need_fallback` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'fallback switch',
  `fallback` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'fallback information',
  `need_monitor` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT 'monitor switch',
  `read_timeout` int(0) NOT NULL DEFAULT 10000 COMMENT 'api request timeout',
  `ignore_header_params` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ignore header params',
  `ignore_query_params` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ignore query params',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`service_code`, `env`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000020 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Api version define' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_report_config
-- ----------------------------
INSERT INTO `t_report_config` VALUES (100000000, '登录', 'life-login', 'DEV', 'http://svc-zains-bm-login-service:8080', '刘轶材', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:56', '2023-04-08 19:09:56', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000001, '客户', 'life-customer', 'DEV', 'http://svc-zains-bm-customer-service:8080', '刘轶材', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:57', '2023-04-08 19:09:57', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000002, '字典', 'life-dict', 'DEV', 'http://svc-zains-bm-dict-service:8080', '刘轶材', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:57', '2023-04-08 19:09:57', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000003, '保单', 'life-policy', 'DEV', 'http://svc-zains-bm-policy-service:8080', '刘轶材、池深深', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:57', '2023-04-08 19:09:57', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000004, 'B端用户', 'life-user', 'DEV', 'http://svc-zains-bm-user-service:8080', '池深深', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:57', '2023-04-08 19:09:57', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000005, '支付', 'life-payment', 'DEV', 'http://svc-zains-bm-payment-service:8080', '池深深', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:58', '2023-04-08 19:09:58', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000006, '渠道', 'life-channel', 'DEV', 'http://svc-zains-bm-channel-service:8080', '曾中雄', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:58', '2023-04-08 19:09:58', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000007, '营销', 'life-market', 'DEV', 'http://svc-zains-bm-market-service:8080', '曾中雄', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:58', '2023-04-08 19:09:58', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000008, '产品', 'life-product', 'DEV', 'http://svc-zains-bm-product-service:8080', '曾中雄', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:59', '2023-04-08 19:09:59', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000009, '计算', 'life-calculate', 'DEV', 'http://svc-zains-bm-calculate-service:8080', '曾中雄', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:59', '2023-04-08 19:09:59', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000010, '投保单', 'life-insure', 'DEV', 'http://svc-zains-bm-insure-service:8080', '关棋文', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:09:59', '2023-04-08 19:09:59', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000011, '订单', 'life-order', 'DEV', 'http://svc-zains-bm-order-service:8080', '关棋文', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:10:00', '2023-04-08 19:10:00', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000012, '理赔', 'life-claim', 'DEV', 'http://svc-zains-bm-claim-service:8080', '韦帅', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:10:00', '2023-04-08 19:10:00', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000013, '单证', 'life-document', 'DEV', 'http://svc-zains-bm-document-service:8080', '李征', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:10:00', '2023-04-08 19:10:00', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000014, '任务', 'life-task', 'DEV', 'http://svc-zains-bm-task-service:8080', '邹天龙', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:10:01', '2023-04-08 19:10:01', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000015, '账务', 'life-bcp', 'DEV', 'http://svc-zains-bm-bcp-service:8080', '邹龙章', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-08 19:10:01', '2023-04-08 19:10:01', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000016, '安安银保', 'za-insure-partner', 'DEV', 'http://svc-zains-gwp-partner-service:8080', '黄宏渊', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-26 20:42:34', '2023-04-26 20:42:34', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000017, '安安订单', 'za-graphene-order-scenario', 'DEV', 'http://svc-zains-gwp-order-service:8080', '黄宏渊', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-26 20:42:34', '2023-04-27 16:28:53', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000018, '安安投保单', 'za-graphene-issuance-scenario', 'DEV', 'http://svc-zains-gwp-issuance-service:8080', '黄宏渊', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-26 20:42:34', '2023-04-27 16:30:29', 'system', 'system', 'N');
INSERT INTO `t_report_config` VALUES (100000019, '安安bizapply', 'za-graphene-bizapply-scenario', 'DEV', 'http://svc-zains-gwp-bizapply-service:8080', '黄宏渊', 'Y', 1000, 'N', NULL, 'Y', 10000, NULL, NULL, '2023-04-26 20:42:34', '2023-04-27 16:30:14', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_tenant
-- ----------------------------
DROP TABLE IF EXISTS `t_tenant`;
CREATE TABLE `t_tenant`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tenant name',
  `tenant_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tenant code',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`tenant_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000005 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Tenant define' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_tenant
-- ----------------------------
INSERT INTO `t_tenant` VALUES (100000002, '银保', 'Bling', '2023-04-21 10:43:48', '2023-06-02 16:42:43', 'system', 'system', 'N');
INSERT INTO `t_tenant` VALUES (100000003, 'ARK', 'ARK', '2023-04-21 10:47:17', '2023-04-21 10:47:17', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_tenant_version
-- ----------------------------
DROP TABLE IF EXISTS `t_tenant_version`;
CREATE TABLE `t_tenant_version`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tenant name',
  `tenant_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tenant code',
  `env` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tenant env',
  `tenant_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tenant app key',
  `tenant_secret` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tenant app secret',
  `tenant_secret_salt` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tenant app secret salt',
  `token_expire_in` int(0) NOT NULL COMMENT 'token expire in',
  `token_expire_code` int(0) NOT NULL COMMENT 'token expire return code',
  `token_expire_content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token expire return content',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`tenant_key`, `env`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000007 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Tenant version define' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_tenant_version
-- ----------------------------
INSERT INTO `t_tenant_version` VALUES (100000003, '银保', 'Bling', 'DEV', '9a672e4457efcf5d', '08b32677cb661b3eb5fb0ec1a349f520', 'EFF349AA40B64792B78A43A6C182909A', 30, 200, '{\n	\"code\": \"000002\",\n	\"msg\": \"Token Expired！\",\n	\"success\": true\n}', '2023-04-21 10:43:48', '2023-06-02 16:42:43', 'system', 'system', 'N');
INSERT INTO `t_tenant_version` VALUES (100000004, 'ARK', 'ARK', 'DEV', '1234567890', 'b38cb0e8237f1eaae141360ac6e0cdad', '6127DAA98EE64038A1A56977465F638B', 60, 200, '{}', '2023-04-21 10:47:17', '2023-04-21 10:47:17', 'system', 'system', 'N');
INSERT INTO `t_tenant_version` VALUES (100000005, '银保', 'Bling', 'TEST', '9a672e4457efcf5d', '68ab2d64ace4829a1a340a550d8a9d68', 'DEE0571CDAA545ADB426EA56E5861DD5', 30, 200, '{\n	\"code\": \"000002\",\n	\"msg\": \"Token Expired！\",\n	\"success\": true\n}', '2023-04-21 10:43:48', '2023-06-02 16:42:51', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_upstream_service
-- ----------------------------
DROP TABLE IF EXISTS `t_upstream_service`;
CREATE TABLE `t_upstream_service`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'service name',
  `service_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'service code',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`service_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000020 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Api service define' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_upstream_service
-- ----------------------------
INSERT INTO `t_upstream_service` VALUES (100000000, '单证', 'life-document', '2023-04-09 21:38:15', '2023-04-09 21:38:15', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000001, 'B端用户', 'life-user', '2023-04-09 21:38:52', '2023-04-09 21:38:52', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000002, '登录', 'life-login', '2023-04-09 21:38:55', '2023-04-09 21:38:55', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000003, '产品', 'life-product', '2023-04-09 21:38:57', '2023-04-09 21:38:57', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000004, '字典', 'life-dict', '2023-04-09 21:39:14', '2023-04-09 21:39:14', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000005, '订单', 'life-order', '2023-04-09 21:39:26', '2023-04-09 21:39:26', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000006, '支付', 'life-payment', '2023-04-09 21:40:05', '2023-04-09 21:40:05', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000007, '渠道', 'life-channel', '2023-04-09 21:40:13', '2023-04-09 21:40:13', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000008, '计算', 'life-calculate', '2023-04-09 21:40:20', '2023-04-09 21:40:20', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000009, '投保单', 'life-insure', '2023-04-09 21:40:38', '2023-04-09 21:40:38', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000010, '客户', 'life-customer', '2023-04-10 10:10:06', '2023-04-10 10:10:06', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000011, '保单', 'life-policy', '2023-04-13 10:40:53', '2023-04-13 10:40:53', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000012, '营销', 'life-market', '2023-04-13 17:22:06', '2023-04-13 17:22:06', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000013, '任务', 'life-task', '2023-04-13 21:08:00', '2023-04-13 21:08:00', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000014, '安安银保', 'za-insure-partner', '2023-04-26 20:44:11', '2023-04-26 20:44:11', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000015, '安安订单', 'za-graphene-order-scenario', '2023-04-27 16:32:47', '2023-04-27 16:32:47', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000016, '安安bizapply', 'za-graphene-bizapply-scenario', '2023-04-27 16:34:02', '2023-04-27 16:34:02', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000017, '安安投保单', 'za-graphene-issuance-scenario', '2023-04-27 16:39:48', '2023-04-27 16:39:48', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000018, '测试使用', 'life-test', '2023-05-25 15:35:03', '2023-05-25 15:35:03', 'system', 'system', 'N');
INSERT INTO `t_upstream_service` VALUES (100000019, '开发使用', 'life-dev', '2023-06-02 16:48:37', '2023-06-02 16:48:37', 'system', 'system', 'N');

-- ----------------------------
-- Table structure for t_upstream_service_version
-- ----------------------------
DROP TABLE IF EXISTS `t_upstream_service_version`;
CREATE TABLE `t_upstream_service_version`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `service_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'service code',
  `env` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'environment code',
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'service addresses',
  `gray_rule_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'service gray rule code',
  `gray_address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'service gray addresses',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record created time',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'record updated time',
  `creator` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who created the record',
  `modifier` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT 'who updated the record',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'logical delete identifier(Y-effective,N-ineffective)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code_env`(`service_code`, `env`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000026 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Upstream service version info' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_upstream_service_version
-- ----------------------------
INSERT INTO `t_upstream_service_version` VALUES (100000000, 'life-document', 'DEV', 'http://svc-zains-bm-document-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-09 21:38:15', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000001, 'life-user', 'DEV', 'http://svc-zains-bm-user-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-09 21:38:52', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000002, 'life-login', 'DEV', 'http://svc-zains-bm-login-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-09 21:38:55', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000003, 'life-product', 'DEV', 'http://svc-zains-bm-product-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-09 21:38:57', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000004, 'life-dict', 'DEV', 'http://svc-zains-bm-dict-service:8080', 'R002', 'http://gray-svc-zains-bm-document-service:8080', '2023-04-09 21:39:14', '2023-05-04 11:20:25', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000005, 'life-order', 'DEV', 'http://svc-zains-bm-order-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-09 21:39:26', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000006, 'life-payment', 'DEV', 'http://svc-zains-bm-payment-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-09 21:40:05', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000007, 'life-channel', 'DEV', 'http://svc-zains-bm-channel-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-09 21:40:13', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000008, 'life-calculate', 'DEV', 'http://svc-zains-bm-calculate-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-09 21:40:21', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000009, 'life-insure', 'DEV', 'http://svc-zains-bm-insure-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-09 21:40:38', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000010, 'life-customer', 'DEV', 'http://svc-zains-bm-customer-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-10 10:10:06', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000011, 'life-policy', 'DEV', 'http://svc-zains-bm-policy-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-13 10:40:53', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000012, 'life-market', 'DEV', 'http://svc-zains-bm-market-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-13 17:22:06', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000013, 'life-task', 'DEV', 'http://svc-zains-bm-task-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-13 21:08:00', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000014, 'za-insure-partner', 'DEV', 'http://svc-zains-gwp-partner-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-26 20:44:11', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000015, 'za-graphene-order-scenario', 'DEV', 'http://svc-zains-gwp-order-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-27 16:32:47', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000016, 'za-graphene-bizapply-scenario', 'DEV', 'http://svc-zains-gwp-bizapply-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-27 16:34:02', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000017, 'za-graphene-issuance-scenario', 'DEV', 'http://svc-zains-gwp-issuance-service:8080', NULL, 'http://gray-svc-zains-bm-document-service:8080', '2023-04-27 16:39:48', '2023-05-04 10:50:16', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000018, 'life-test', 'PRD', '', NULL, NULL, '2023-05-25 15:35:03', '2023-05-25 15:35:03', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000019, 'life-test', 'UAT', '', NULL, NULL, '2023-05-25 15:35:03', '2023-05-25 15:35:03', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000020, 'life-test', 'TEST', 'http://192.168.40.101:8080', NULL, NULL, '2023-05-25 15:35:03', '2023-06-01 16:05:22', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000021, 'life-test', 'DEV', 'http://192.168.40.101:8080', NULL, NULL, '2023-05-25 15:35:03', '2023-05-25 15:43:32', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000022, 'life-dev', 'PRD', 'http://localhost:dev', NULL, NULL, '2023-06-02 16:48:37', '2023-06-02 16:48:37', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000023, 'life-dev', 'UAT', 'http://localhost:dev1', NULL, NULL, '2023-06-02 16:48:37', '2023-06-02 17:10:12', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000024, 'life-dev', 'TEST', 'http://localhost:dev1', NULL, NULL, '2023-06-02 16:48:37', '2023-06-02 17:10:12', 'system', 'system', 'N');
INSERT INTO `t_upstream_service_version` VALUES (100000025, 'life-dev', 'DEV', 'http://localhost:dev1', NULL, NULL, '2023-06-02 16:48:37', '2023-06-02 17:10:12', 'system', 'system', 'N');

SET FOREIGN_KEY_CHECKS = 1;

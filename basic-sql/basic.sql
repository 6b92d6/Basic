/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : basic

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `userFace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifyTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, '系统管理员', '13812361398', '71937538', '香港特别行政区强县长寿柳州路p座123', 1, 'admin', '$2a$10$UOVVeFSQ2.0qtRz2Cv4mLuoX0zIsvuSZq/Fy9YvHUnLjLUVvv2eKC', 'http://192.168.10.100:8888/group1/M00/00/00/wKgKZF6oHzuAXnw9AABaLsrkrQQ148.jpg', NULL, '2021-06-06 11:56:55', '2021-06-06 11:57:00');
INSERT INTO `t_admin` VALUES (2, '何淑华', '18875971675', '41413109', '河北省秀荣市萧山长沙街p座 737268', 0, 'taomeng', '$2a$10$UOVVeFSQ2.0qtRz2Cv4mLuoX0zIsvuSZq/Fy9YvHUnLjLUVvv2eKC', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585830947922&di=60b35821fb9112d0aad6915efe982c8d&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201703%2F26%2F20170326161532_aGteC.jpeg', NULL, NULL, NULL);
INSERT INTO `t_admin` VALUES (3, '安淑华123', '14588110811', '50603155', '山东省凤英县长寿银川街l座', 1, 'naqiao', '$2a$10$UOVVeFSQ2.0qtRz2Cv4mLuoX0zIsvuSZq/Fy9YvHUnLjLUVvv2eKC', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL, NULL, NULL);
INSERT INTO `t_admin` VALUES (4, '林宇', '15761248727', '25546253', '宁夏回族自治区帆市翔安昆明路b座 672985', 0, 'leisu', '$2a$10$eKiRhpS1/LLHAup.w4Y4X.zRut4dgs1UIACahoR.7dvV5rbDtjGKi', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585830829995&di=0fc5f8313a734b401d20a57bc9bdd421&imgtype=0&src=http%3A%2F%2Fpic4.zhimg.com%2F50%2Fv2-7fece9a613445edb78271216c8c20c6d_hd.jpg', NULL, NULL, NULL);
INSERT INTO `t_admin` VALUES (5, '武军', '18030710396', '27523842', '宁夏回族自治区秀兰县涪城邯郸路t座 618651', 0, 'hanli', '$2a$10$eKiRhpS1/LLHAup.w4Y4X.zRut4dgs1UIACahoR.7dvV5rbDtjGKi', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585830877372&di=9ae7236e73ff24c756ac30722b6e84b1&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201704%2F10%2F20170410095843_SEvMy.thumb.700_0.jpeg', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `adminId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `rid` int(11) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  INDEX `adminId`(`adminId`) USING BTREE,
  CONSTRAINT `t_admin_role_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `t_admin` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `t_admin_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES (2, 5, 4);
INSERT INTO `t_admin_role` VALUES (3, 5, 3);
INSERT INTO `t_admin_role` VALUES (4, 5, 2);
INSERT INTO `t_admin_role` VALUES (5, 4, 3);
INSERT INTO `t_admin_role` VALUES (6, 4, 2);
INSERT INTO `t_admin_role` VALUES (7, 4, 4);
INSERT INTO `t_admin_role` VALUES (8, 4, 5);
INSERT INTO `t_admin_role` VALUES (16, 1, 6);
INSERT INTO `t_admin_role` VALUES (55, 3, 3);
INSERT INTO `t_admin_role` VALUES (56, 3, 4);
INSERT INTO `t_admin_role` VALUES (67, 2, 3);
INSERT INTO `t_admin_role` VALUES (68, 2, 4);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'path',
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `iconCls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `keepAlive` tinyint(1) NULL DEFAULT NULL COMMENT '是否保持激活',
  `requireAuth` tinyint(1) NULL DEFAULT NULL COMMENT '是否要求权限',
  `parentId` int(11) NULL DEFAULT NULL COMMENT '父id',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`parentId`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '/', NULL, NULL, '所有', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (2, '/', '/home', 'Home', '员工资料', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `t_menu` VALUES (3, '/', '/home', 'Home', '人事管理', 'fa fa-address-card-o', NULL, 1, 1, 1);
INSERT INTO `t_menu` VALUES (4, '/', '/home', 'Home', '薪资管理', 'fa fa-money', NULL, 1, 1, 1);
INSERT INTO `t_menu` VALUES (5, '/', '/home', 'Home', '统计管理', 'fa fa-bar-chart', NULL, 1, 1, 1);
INSERT INTO `t_menu` VALUES (6, '/', '/home', 'Home', '系统管理', 'fa fa-windows', NULL, 1, 1, 1);
INSERT INTO `t_menu` VALUES (7, '/employee/basic/**', '/emp/basic', 'EmpBasic', '基本资料', NULL, NULL, 1, 2, 1);
INSERT INTO `t_menu` VALUES (8, '/employee/advanced/**', '/emp/adv', 'EmpAdv', '高级资料', NULL, NULL, 1, 2, 1);
INSERT INTO `t_menu` VALUES (9, '/personnel/emp/**', '/per/emp', 'PerEmp', '员工资料', NULL, NULL, 1, 3, 1);
INSERT INTO `t_menu` VALUES (10, '/personnel/ec/**', '/per/ec', 'PerEc', '员工奖惩', NULL, NULL, 1, 3, 1);
INSERT INTO `t_menu` VALUES (11, '/personnel/train/**', '/per/train', 'PerTrain', '员工培训', NULL, NULL, 1, 3, 1);
INSERT INTO `t_menu` VALUES (12, '/personnel/salary/**', '/per/salary', 'PerSalary', '员工调薪', NULL, NULL, 1, 3, 1);
INSERT INTO `t_menu` VALUES (13, '/personnel/remove/**', '/per/mv', 'PerMv', '员工调动', NULL, NULL, 1, 3, 1);
INSERT INTO `t_menu` VALUES (14, '/salary/sob/**', '/sal/sob', 'SalSob', '工资账套管理', NULL, NULL, 1, 4, 1);
INSERT INTO `t_menu` VALUES (15, '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', '员工账套设置', NULL, NULL, 1, 4, 1);
INSERT INTO `t_menu` VALUES (16, '/salary/table/**', '/sal/table', 'SalTable', '工资表管理', NULL, NULL, 1, 4, 1);
INSERT INTO `t_menu` VALUES (17, '/salary/month/**', '/sal/month', 'SalMonth', '月末处理', NULL, NULL, 1, 4, 1);
INSERT INTO `t_menu` VALUES (18, '/salary/search/**', '/sal/search', 'SalSearch', '工资表查询', NULL, NULL, 1, 4, 1);
INSERT INTO `t_menu` VALUES (19, '/statistics/all/**', '/sta/all', 'StaAll', '综合信息统计', NULL, NULL, 1, 5, 1);
INSERT INTO `t_menu` VALUES (20, '/statistics/score/**', '/sta/score', 'StaScore', '员工积分统计', NULL, NULL, 1, 5, 1);
INSERT INTO `t_menu` VALUES (21, '/statistics/personnel/**', '/sta/pers', 'StaPers', '人事信息统计', NULL, NULL, 1, 5, 1);
INSERT INTO `t_menu` VALUES (22, '/statistics/recored/**', '/sta/record', 'StaRecord', '人事记录统计', NULL, NULL, 1, 5, 1);
INSERT INTO `t_menu` VALUES (23, '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', NULL, NULL, 1, 6, 1);
INSERT INTO `t_menu` VALUES (24, '/system/cfg/**', '/sys/cfg', 'SysCfg', '系统管理', NULL, NULL, 1, 6, 1);
INSERT INTO `t_menu` VALUES (25, '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', NULL, NULL, 1, 6, 1);
INSERT INTO `t_menu` VALUES (26, '/system/admin/**', '/sys/admin', 'SysAdmin', '操作员管理', NULL, NULL, 1, 6, 1);
INSERT INTO `t_menu` VALUES (27, '/system/data/**', '/sys/data', 'SysData', '备份恢复数据库', NULL, NULL, 1, 6, 1);
INSERT INTO `t_menu` VALUES (28, '/system/init/**', '/sys/init', 'SysInit', '初始化数据库', NULL, NULL, 1, 6, 1);

-- ----------------------------
-- Table structure for t_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_role`;
CREATE TABLE `t_menu_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mid` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  `rid` int(11) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  CONSTRAINT `t_menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 349 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_menu_role
-- ----------------------------
INSERT INTO `t_menu_role` VALUES (1, 7, 3);
INSERT INTO `t_menu_role` VALUES (2, 7, 6);
INSERT INTO `t_menu_role` VALUES (3, 9, 6);
INSERT INTO `t_menu_role` VALUES (4, 10, 6);
INSERT INTO `t_menu_role` VALUES (5, 11, 6);
INSERT INTO `t_menu_role` VALUES (6, 12, 6);
INSERT INTO `t_menu_role` VALUES (7, 13, 6);
INSERT INTO `t_menu_role` VALUES (8, 14, 6);
INSERT INTO `t_menu_role` VALUES (9, 15, 6);
INSERT INTO `t_menu_role` VALUES (10, 16, 6);
INSERT INTO `t_menu_role` VALUES (11, 17, 6);
INSERT INTO `t_menu_role` VALUES (12, 18, 6);
INSERT INTO `t_menu_role` VALUES (13, 19, 6);
INSERT INTO `t_menu_role` VALUES (14, 20, 6);
INSERT INTO `t_menu_role` VALUES (15, 21, 6);
INSERT INTO `t_menu_role` VALUES (16, 22, 6);
INSERT INTO `t_menu_role` VALUES (17, 23, 6);
INSERT INTO `t_menu_role` VALUES (18, 25, 6);
INSERT INTO `t_menu_role` VALUES (19, 26, 6);
INSERT INTO `t_menu_role` VALUES (20, 27, 6);
INSERT INTO `t_menu_role` VALUES (21, 28, 6);
INSERT INTO `t_menu_role` VALUES (22, 24, 6);
INSERT INTO `t_menu_role` VALUES (26, 7, 2);
INSERT INTO `t_menu_role` VALUES (27, 8, 2);
INSERT INTO `t_menu_role` VALUES (28, 9, 2);
INSERT INTO `t_menu_role` VALUES (29, 10, 2);
INSERT INTO `t_menu_role` VALUES (30, 12, 2);
INSERT INTO `t_menu_role` VALUES (31, 13, 2);
INSERT INTO `t_menu_role` VALUES (32, 7, 1);
INSERT INTO `t_menu_role` VALUES (33, 8, 1);
INSERT INTO `t_menu_role` VALUES (34, 9, 1);
INSERT INTO `t_menu_role` VALUES (35, 10, 1);
INSERT INTO `t_menu_role` VALUES (36, 11, 1);
INSERT INTO `t_menu_role` VALUES (37, 12, 1);
INSERT INTO `t_menu_role` VALUES (38, 13, 1);
INSERT INTO `t_menu_role` VALUES (39, 14, 1);
INSERT INTO `t_menu_role` VALUES (40, 15, 1);
INSERT INTO `t_menu_role` VALUES (41, 16, 1);
INSERT INTO `t_menu_role` VALUES (42, 17, 1);
INSERT INTO `t_menu_role` VALUES (43, 18, 1);
INSERT INTO `t_menu_role` VALUES (44, 19, 1);
INSERT INTO `t_menu_role` VALUES (45, 20, 1);
INSERT INTO `t_menu_role` VALUES (46, 21, 1);
INSERT INTO `t_menu_role` VALUES (47, 22, 1);
INSERT INTO `t_menu_role` VALUES (48, 23, 1);
INSERT INTO `t_menu_role` VALUES (49, 24, 1);
INSERT INTO `t_menu_role` VALUES (50, 25, 1);
INSERT INTO `t_menu_role` VALUES (51, 26, 1);
INSERT INTO `t_menu_role` VALUES (52, 27, 1);
INSERT INTO `t_menu_role` VALUES (53, 28, 1);
INSERT INTO `t_menu_role` VALUES (346, 11, 4);
INSERT INTO `t_menu_role` VALUES (347, 8, 4);
INSERT INTO `t_menu_role` VALUES (348, 7, 4);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `nameZh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'ROLE_manager', '部门经理');
INSERT INTO `t_role` VALUES (2, 'ROLE_personnel', '人事专员');
INSERT INTO `t_role` VALUES (3, 'ROLE_recruiter', '招聘主管');
INSERT INTO `t_role` VALUES (4, 'ROLE_train', '培训主管');
INSERT INTO `t_role` VALUES (5, 'ROLE_performance', '薪酬绩效主管');
INSERT INTO `t_role` VALUES (6, 'ROLE_admin', '系统管理员');
INSERT INTO `t_role` VALUES (8, 'ROLE_test', '测试角色');

SET FOREIGN_KEY_CHECKS = 1;

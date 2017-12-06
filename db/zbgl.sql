/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : zbgl

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-12-06 09:44:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `noticeType` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_attach
-- ----------------------------
DROP TABLE IF EXISTS `sys_attach`;
CREATE TABLE `sys_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `attachType` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `ext` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `nodeId` bigint(20) DEFAULT NULL,
  `path` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_attach
-- ----------------------------

-- ----------------------------
-- Table structure for sys_backup
-- ----------------------------
DROP TABLE IF EXISTS `sys_backup`;
CREATE TABLE `sys_backup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `bkTime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reTime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_backup
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `dictName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dictType` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE `sys_function` (
  `funcCde` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `clevel` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  `funcName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menuType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `perLink` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `parentCde` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`funcCde`),
  KEY `FKE9983D0AF64C4FC9` (`parentCde`),
  CONSTRAINT `FKE9983D0AF64C4FC9` FOREIGN KEY (`parentCde`) REFERENCES `sys_function` (`funcCde`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO `sys_function` VALUES ('ANAL', '130000', '2017-01-18 09:15:42', '费用预算报表分析', '', 'MENU', '/budget/analysis/*.jhtml', '1', 'USE', '2017-01-18 09:15:42', '0', null);
INSERT INTO `sys_function` VALUES ('ANAL_BUDGET', '130100', '2017-01-18 09:17:19', '预提明细表', '/budget/analysis/budget.jhtml', 'MENU', '/budget/analysis/budget.jhtml', '2', 'USE', '2017-01-18 09:22:26', '1', 'ANAL');
INSERT INTO `sys_function` VALUES ('ANAL_CHARGE', '130200', '2017-01-18 09:18:32', '核销明细表', '/budget/analysis/charge.jhtml', 'MENU', '/budget/analysis/charge.jhtml', '2', 'USE', '2017-01-18 09:23:02', '2', 'ANAL');
INSERT INTO `sys_function` VALUES ('ANAL_PRODUCT_BUDGET', '130400', '2017-01-18 09:24:24', '门店产品预提明细表', '/budget/analysis/productBudget.jhtml', 'MENU', '/budget/analysis/productDudget.jhtml', '2', 'USE', '2017-01-18 09:24:24', '0', 'ANAL');
INSERT INTO `sys_function` VALUES ('ANAL_PRODUCT_CHARGE', '130500', '2017-01-18 09:25:22', '门店产品核销明细表', '/budget/analysis/productCharge.jhtml', 'MENU', '/budget/analysis/productCharge.jhtml', '2', 'USE', '2017-01-18 09:25:22', '0', 'ANAL');
INSERT INTO `sys_function` VALUES ('ANAL_PRODUCT_SUM', '130600', '2017-01-18 09:26:09', '门店产品余额表', '/budget/analysis/productSum.jhtml', 'MENU', '/budget/analysis/productSum.jhtml', '2', 'USE', '2017-01-18 09:26:09', '0', 'ANAL');
INSERT INTO `sys_function` VALUES ('ANAL_SUM', '130300', '2017-01-18 09:21:21', '预提核销余额表', '/budget/analysis/sum.jhtml', 'MENU', '/budget/analysis/sum.jhtml', '2', 'USE', '2017-01-18 09:22:44', '1', 'ANAL');
INSERT INTO `sys_function` VALUES ('BUD', '110000', '2016-12-27 14:29:01', '预提管理', '', 'MENU', '', '1', 'USE', '2016-12-27 14:29:01', '0', null);
INSERT INTO `sys_function` VALUES ('BUD_INCLA', '110100', '2017-01-05 10:39:54', '合同内条款设置', '/budget/in-fee-clause/list.jhtml', 'MENU', '/budget/in-fee-clause/*.jhtml', '2', 'USE', '2017-01-05 10:39:54', '0', 'BUD');
INSERT INTO `sys_function` VALUES ('BUD_INCLA_ADD', '110101', '2017-01-05 10:41:05', '添加', '', 'BUTTON', '/budget/in-fee-clause/edit.jhtml,/budget/in-fee-clause/update.jhtml', '1', 'USE', '2017-01-05 10:41:05', '0', 'BUD_INCLA');
INSERT INTO `sys_function` VALUES ('BUD_INCLA_DEL', '110102', '2017-01-05 10:41:51', '删除', '', 'BUTTON', '/budget/in-fee-clause/delete.jhtml', '1', 'USE', '2017-01-05 10:41:51', '0', 'BUD_INCLA');
INSERT INTO `sys_function` VALUES ('BUD_INCLA_EDIT', '110103', '2017-01-05 10:42:41', '编辑', '', 'BUTTON', '/budget/in-fee-clause/edit.jhtml,/budget/in-fee-clause/update.jhtml', '1', 'USE', '2017-01-05 10:42:41', '0', 'BUD_INCLA');
INSERT INTO `sys_function` VALUES ('BUD_INPRO', '110410', '2016-12-27 14:35:55', '合同内预提', '/budget/in-fee-provision/list.jhtml', 'MENU', '/budget/in-fee-provision/*.jhtml', '2', 'USE', '2016-12-27 14:37:02', '1', 'BUD');
INSERT INTO `sys_function` VALUES ('BUD_INPRO_ADD', '110411', '2016-12-27 14:36:51', '添加', '', 'BUTTON', '/budget/in-fee-provision/edit.jhtml,/budget/in-fee-provision/update.jhtml', '3', 'USE', '2016-12-27 14:36:51', '0', 'BUD_INPRO');
INSERT INTO `sys_function` VALUES ('BUD_INPRO_DEL', '110413', '2016-12-27 14:38:09', '删除', '', 'BUTTON', '/budget/in-fee-provision/delete.jhtml,', '3', 'USE', '2016-12-27 14:38:09', '0', 'BUD_INPRO');
INSERT INTO `sys_function` VALUES ('BUD_INPRO_EDIT', '110412', '2016-12-27 14:37:36', '编辑', '', 'BUTTON', '/budget/in-fee-provision/edit.jhtml,/budget/in-fee-provision/update.jhtml', '3', 'USE', '2016-12-27 14:37:36', '0', 'BUD_INPRO');
INSERT INTO `sys_function` VALUES ('BUD_INPRO_ENDAUDIT', '110418', '2017-01-09 09:06:53', '终审', '', 'BUTTON', '/budget/in-fee-provision/audit.jhtml', '1', 'USE', '2017-01-09 09:06:53', '0', 'BUD_INPRO');
INSERT INTO `sys_function` VALUES ('BUD_INPRO_ONEAUDIT', '110414', '2017-01-09 09:04:25', '一审', '', 'BUTTON', '/budget/in-fee-provision/audit.jhtml', '1', 'USE', '2017-01-09 09:04:25', '0', 'BUD_INPRO');
INSERT INTO `sys_function` VALUES ('BUD_INPRO_RETEND', '110419', '2017-01-09 09:07:21', '反终审', '', 'BUTTON', '/budget/in-fee-provision/audit.jhtml', '1', 'USE', '2017-01-09 09:07:21', '0', 'BUD_INPRO');
INSERT INTO `sys_function` VALUES ('BUD_INPRO_RETONE', '110415', '2017-01-09 09:05:08', '反一审', '', 'BUTTON', '/budget/in-fee-provision/audit.jhtml', '1', 'USE', '2017-01-09 09:05:08', '0', 'BUD_INPRO');
INSERT INTO `sys_function` VALUES ('BUD_INPRO_RETTWO', '110417', '2017-01-09 09:06:13', '反二审', '', 'BUTTON', '/budget/in-fee-provision/audit.jhtml', '1', 'USE', '2017-01-09 09:06:13', '0', 'BUD_INPRO');
INSERT INTO `sys_function` VALUES ('BUD_INPRO_TWOAUDIT', '110416', '2017-01-09 09:05:42', '二审', '', 'BUTTON', '/budget/in-fee-provision/audit.jhtml', '1', 'USE', '2017-01-09 09:05:42', '0', 'BUD_INPRO');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO', '110600', '2016-12-28 17:48:58', '合同外预提', '/budget/out-fee-provision/list.jhtml', 'MENU', '/budget/out-fee-provision/*.jhtml', '2', 'USE', '2016-12-28 17:48:58', '0', 'BUD');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO_ADD', '110601', '2016-12-28 17:49:32', '添加', '', 'BUTTON', '/budget/out-fee-provision/edit.jhtml,/budget/out-fee-provision/update.jhtml', '3', 'USE', '2016-12-28 17:49:32', '0', 'BUD_OUTPRO');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO_BATAUDIT', '110610', '2017-03-14 09:22:10', '批量审核', '', 'BUTTON', '/budget/out-fee-provision/approve.jhtml', '1', 'USE', '2017-03-14 09:22:10', '0', 'BUD_OUTPRO');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO_DEL', '110603', '2016-12-28 17:50:35', '删除', '', 'BUTTON', '/budget/out-fee-provision/delete.jhtml', '3', 'USE', '2016-12-28 17:50:35', '0', 'BUD_OUTPRO');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO_EDIT', '110602', '2016-12-28 17:50:12', '编辑', '', 'BUTTON', '/budget/out-fee-provision/edit.jhtml,/budget/out-fee-provision/update.jhtml', '3', 'USE', '2016-12-28 17:50:12', '0', 'BUD_OUTPRO');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO_ENDAUDIT', '110608', '2017-01-04 10:48:00', '终审', '', 'BUTTON', '/budget/out-fee-provision/audit.jhtml', '3', 'USE', '2017-01-04 10:48:00', '0', 'BUD_OUTPRO');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO_ONEAUDIT', '110604', '2017-01-04 10:43:19', '一审', '', 'BUTTON', '/budget/out-fee-provision/audit.jhtml', '3', 'USE', '2017-01-04 10:43:19', '0', 'BUD_OUTPRO');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO_RETEND', '110609', '2017-01-04 10:48:42', '反终审', '', 'BUTTON', '/budget/out-fee-provision/audit.jhtml', '3', 'USE', '2017-01-04 10:48:42', '0', 'BUD_OUTPRO');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO_RETONE', '110605', '2017-01-04 10:45:33', '反一审', '', 'BUTTON', '/budget/out-fee-provision/audit.jhtml', '3', 'USE', '2017-01-04 10:45:33', '0', 'BUD_OUTPRO');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO_RETTWO', '110607', '2017-01-04 10:46:45', '反二审', '', 'BUTTON', '/budget/out-fee-provision/audit.jhtml', '3', 'USE', '2017-01-04 10:46:45', '0', 'BUD_OUTPRO');
INSERT INTO `sys_function` VALUES ('BUD_OUTPRO_TWOAUDIT', '110606', '2017-01-04 10:46:15', '二审', '', 'BUTTON', '/budget/out-fee-provision/audit.jhtml', '3', 'USE', '2017-01-04 10:46:15', '0', 'BUD_OUTPRO');
INSERT INTO `sys_function` VALUES ('BUD_PROPRO', '110500', '2016-12-28 16:18:14', '合同外预提项目', '/budget/provision-project/list.jhtml', 'MENU', '/budget/provision-project/*.jhtml', '2', 'USE', '2016-12-28 16:18:32', '1', 'BUD');
INSERT INTO `sys_function` VALUES ('BUD_PROPRO_ADD', '110501', '2016-12-28 16:19:10', '添加', '', 'BUTTON', '/budget/provision-project/edit.jhtml,/budget/provision-project/update.jhtml', '3', 'USE', '2016-12-28 16:19:10', '0', 'BUD_PROPRO');
INSERT INTO `sys_function` VALUES ('BUD_PROPRO_DEL', '110503', '2016-12-28 16:20:12', '删除', '', 'BUTTON', '/budget/provision-project/delete.jhtml', '3', 'USE', '2016-12-28 16:20:12', '0', 'BUD_PROPRO');
INSERT INTO `sys_function` VALUES ('BUD_PROPRO_EDIT', '110502', '2016-12-28 16:19:44', '编辑', '', 'BUTTON', '/budget/provision-project/edit.jhtml,/budget/provision-project/update.jhtml', '3', 'USE', '2016-12-28 16:19:44', '0', 'BUD_PROPRO');
INSERT INTO `sys_function` VALUES ('CHAR_INFEEVER', '120100', '2017-01-10 11:34:29', '合同内费用核销', '/charge/in-fee-verification/list.jhtml', 'MENU', '/charge/in-fee-verification/*.jhtml', '2', 'USE', '2017-01-10 11:34:29', '0', 'CHAR_VER');
INSERT INTO `sys_function` VALUES ('CHAR_INFEEVER_ADD', '120101', '2017-01-10 11:35:28', '添加', '', 'BUTTON', '/charge/in-fee-verification/edit.jhtml,/charge/in-fee-verification/update.jhtml', '3', 'USE', '2017-01-10 11:35:28', '0', 'CHAR_INFEEVER');
INSERT INTO `sys_function` VALUES ('CHAR_INFEEVER_AUDIT', '120104', '2017-01-10 11:37:48', '审核', '', 'BUTTON', '/charge/in-fee-verification/audit.jhtml', '3', 'USE', '2017-01-10 11:37:48', '0', 'CHAR_INFEEVER');
INSERT INTO `sys_function` VALUES ('CHAR_INFEEVER_BAUDTI', '120107', '2017-03-14 09:24:32', '批量审核', '', 'BUTTON', '/charge/out-fee-verification/approve.jhtml', '1', 'USE', '2017-03-14 09:24:32', '0', 'CHAR_INFEEVER');
INSERT INTO `sys_function` VALUES ('CHAR_INFEEVER_DEL', '120103', '2017-01-10 11:36:42', '删除', '', 'BUTTON', '/charge/in-fee-verification/delete.jhtml', '3', 'USE', '2017-01-10 11:36:42', '0', 'CHAR_INFEEVER');
INSERT INTO `sys_function` VALUES ('CHAR_INFEEVER_EDIT', '120102', '2017-01-10 11:36:10', '编辑', '', 'BUTTON', '/charge/in-fee-verification/edit.jhtml,/charge/in-fee-verification/update.jhtml', '3', 'USE', '2017-01-10 11:36:10', '0', 'CHAR_INFEEVER');
INSERT INTO `sys_function` VALUES ('CHAR_INFEEVER_REA', '120105', '2017-01-10 11:39:51', '反审核', '', 'BUTTON', '/charge/in-fee-verification/audit.jhtml', '3', 'USE', '2017-01-10 11:39:51', '0', 'CHAR_INFEEVER');
INSERT INTO `sys_function` VALUES ('CHAR_INFEEVER_U8', '120106', '2017-01-10 11:42:34', '生成U8收款单', '', 'BUTTON', '/charge/in-fee-verification/createU8Payee.jhtml', '3', 'USE', '2017-01-10 11:42:34', '0', 'CHAR_INFEEVER');
INSERT INTO `sys_function` VALUES ('CHAR_OUTFEE', '120200', '2017-01-10 17:43:02', '合同外费用核销', '/charge/out-fee-verification/list.jhtml', 'MENU', '/charge/out-fee-verification/*.jhtml', '2', 'USE', '2017-01-10 17:43:02', '0', 'CHAR_VER');
INSERT INTO `sys_function` VALUES ('CHAR_OUTFEE_ADD', '120201', '2017-01-10 17:43:45', '添加', '', 'BUTTON', '/charge/out-fee-verification/edit.jhtml,/charge/out-fee-verification/update.jhtml', '3', 'USE', '2017-01-10 17:43:45', '0', 'CHAR_OUTFEE');
INSERT INTO `sys_function` VALUES ('CHAR_OUTFEE_AUDIT', '120204', '2017-01-10 17:46:01', '审核', '', 'BUTTON', '/charge/out-fee-verification/audit.jhtml', '3', 'USE', '2017-01-10 17:46:01', '0', 'CHAR_OUTFEE');
INSERT INTO `sys_function` VALUES ('CHAR_OUTFEE_BATAUDIT', '120206', '2017-03-14 09:26:17', '批量审核', '', 'BUTTON', '/charge/out-fee-verification/approve.jhtml', '1', 'USE', '2017-03-14 09:26:17', '0', 'CHAR_OUTFEE');
INSERT INTO `sys_function` VALUES ('CHAR_OUTFEE_DEL', '120203', '2017-01-10 17:45:07', '删除', '', 'BUTTON', '/charge/out-fee-verification/delete.jhtml', '3', 'USE', '2017-01-10 17:45:07', '0', 'CHAR_OUTFEE');
INSERT INTO `sys_function` VALUES ('CHAR_OUTFEE_EDIT', '120202', '2017-01-10 17:44:36', '编辑', '', 'BUTTON', '/charge/out-fee-verification/edit.jhtml,/charge/out-fee-verification/update.jhtml', '3', 'USE', '2017-01-10 17:44:36', '0', 'CHAR_OUTFEE');
INSERT INTO `sys_function` VALUES ('CHAR_OUTFEE_REA', '120205', '2017-01-10 17:46:33', '反审核', '', 'BUTTON', '/charge/out-fee-verification/audit.jhtml', '3', 'USE', '2017-01-10 17:46:33', '0', 'CHAR_OUTFEE');
INSERT INTO `sys_function` VALUES ('CHAR_VER', '120000', '2017-01-10 11:32:19', '核销管理', '', 'MENU', '', '1', 'USE', '2017-01-10 11:32:19', '0', null);
INSERT INTO `sys_function` VALUES ('INFO', '100000', '2016-12-19 14:34:18', '基础信息', '', 'MENU', '', '1', 'USE', '2016-12-19 14:34:59', '1', null);
INSERT INTO `sys_function` VALUES ('INFO_AREA', '100300', '2016-12-21 17:08:27', '地区管理', '/info/area/list.jhtml', 'MENU', '/info/area/*.jhtml', '2', 'USE', '2016-12-21 17:09:07', '1', 'INFO');
INSERT INTO `sys_function` VALUES ('INFO_AREA_ADD', '100301', '2016-12-21 17:10:27', '添加', '', 'BUTTON', '/info/area/edit.jhtml', '1', 'USE', '2016-12-21 17:10:39', '1', 'INFO_AREA');
INSERT INTO `sys_function` VALUES ('INFO_AREA_DEL', '100303', '2016-12-21 17:13:07', '删除', '', 'BUTTON', '/info/area/delete.jhtml', '1', 'USE', '2016-12-21 17:13:07', '0', 'INFO_AREA');
INSERT INTO `sys_function` VALUES ('INFO_AREA_EDIT', '100302', '2016-12-21 17:12:11', '编辑', '', 'BUTTON', '/info/area/edit.jhtml,/info/area/update.jhtml', '1', 'USE', '2016-12-21 17:12:11', '0', 'INFO_AREA');
INSERT INTO `sys_function` VALUES ('INFO_AREA_IMP', '100304', '2016-12-21 17:13:45', '导入', '', 'BUTTON', '/info/area/imp.jhtml', '1', 'USE', '2016-12-21 17:13:45', '0', 'INFO_AREA');
INSERT INTO `sys_function` VALUES ('INFO_CUSTOM', '100500', '2016-12-22 09:24:35', '客户管理', '/info/custom/list.jhtml', 'MENU', '/info/custom/*.jhtml', '2', 'USE', '2016-12-22 09:25:51', '1', 'INFO');
INSERT INTO `sys_function` VALUES ('INFO_CUSTOM_ADD', '100501', '2016-12-26 10:28:25', '添加', '', 'BUTTON', '/info/custom/edit.jhtml,/info/custom/update.jhtml', '3', 'USE', '2016-12-26 10:28:25', '0', 'INFO_CUSTOM');
INSERT INTO `sys_function` VALUES ('INFO_CUSTOM_DEL', '100503', '2016-12-26 10:29:35', '删除', '', 'BUTTON', '/info/custom/delete.jhtml', '3', 'USE', '2016-12-26 10:29:35', '0', 'INFO_CUSTOM');
INSERT INTO `sys_function` VALUES ('INFO_CUSTOM_EDIT', '100502', '2016-12-26 10:29:02', '编辑', '', 'BUTTON', '/info/custom/edit.jhtml,/info/custom/update.jhtml', '3', 'USE', '2016-12-26 10:29:02', '0', 'INFO_CUSTOM');
INSERT INTO `sys_function` VALUES ('INFO_CUSTOM_IMP', '100504', '2016-12-26 10:30:11', '导入', '', 'BUTTON', '/info/custom/imp.jhtml', '3', 'USE', '2016-12-26 10:30:11', '0', 'INFO_CUSTOM');
INSERT INTO `sys_function` VALUES ('INFO_CUSTYPE', '100400', '2016-12-21 13:53:25', '客户分类管理', '/info/customs-type/list.jhtml', 'MENU', '/info/custom-type/*.jhtml', '2', 'USE', '2016-12-21 16:55:35', '3', 'INFO');
INSERT INTO `sys_function` VALUES ('INFO_CUSTYPE_ADD', '100401', '2016-12-21 13:57:19', '添加', '', 'BUTTON', '/info/customs-type/edit.jhtml,/info/customs-type/update.jhtml', '3', 'USE', '2016-12-21 16:55:46', '2', 'INFO_CUSTYPE');
INSERT INTO `sys_function` VALUES ('INFO_CUSTYPE_DEL', '100403', '2016-12-21 13:59:22', '删除', '', 'BUTTON', '/info/customs-type/delete.jhtml', '1', 'USE', '2016-12-21 16:56:04', '2', 'INFO_CUSTYPE');
INSERT INTO `sys_function` VALUES ('INFO_CUSTYPE_EDIT', '100402', '2016-12-21 13:58:43', '编辑', '', 'BUTTON', '/info/customs-type/edit.jhtml,/info/customs-type/update.jhtml', '3', 'USE', '2016-12-21 16:55:54', '3', 'INFO_CUSTYPE');
INSERT INTO `sys_function` VALUES ('INFO_CUSTYPE_IMP', '100404', '2016-12-21 14:00:20', '导入', '', 'BUTTON', '/info/customs-type/imp.jhtml', '1', 'USE', '2016-12-21 16:56:11', '3', 'INFO_CUSTYPE');
INSERT INTO `sys_function` VALUES ('INFO_PROD', '100100', '2014-08-11 11:32:21', '产品分类管理', '/info/product-type/list.jhtml', 'MENU', '/info/product-type/*.jhtml', '2', 'USE', '2014-08-25 12:43:11', '4', 'INFO');
INSERT INTO `sys_function` VALUES ('INFO_PROD_ADD', '100101', '2014-09-19 16:36:51', '添加', '', 'BUTTON', '/info/product-type/edit.jhtml,/info/product-type/update.jhtml', '1', 'USE', '2014-09-19 16:36:51', '0', 'INFO_PROD');
INSERT INTO `sys_function` VALUES ('INFO_PROD_DEL', '100103', '2014-09-19 16:37:29', '删除', '', 'BUTTON', '/info/product-type/delete.jhtml', '1', 'USE', '2016-12-21 17:11:26', '1', 'INFO_PROD');
INSERT INTO `sys_function` VALUES ('INFO_PROD_EDIT', '100102', '2016-04-05 17:32:11', '编辑', '', 'BUTTON', '/info/product-type/edit.jhtml,/info/product-type/update.jhtml', '3', 'USE', '2016-12-21 17:11:17', '1', 'INFO_PROD');
INSERT INTO `sys_function` VALUES ('INFO_PROD_IMP', '100104', '2016-04-05 17:32:49', '导入', '', 'BUTTON', '/info/product-type/imp.jhtml', '3', 'USE', '2016-04-05 17:33:56', '1', 'INFO_PROD');
INSERT INTO `sys_function` VALUES ('INFO_PRODUCT', '100200', '2016-12-19 14:36:39', '产品管理', '/info/product/list.jhtml', 'MENU', '/info/product/*', '2', 'USE', '2016-12-19 14:37:31', '1', 'INFO');
INSERT INTO `sys_function` VALUES ('INFO_PRODUCT_ADD', '100201', '2016-12-19 14:39:15', '添加', '', 'BUTTON', '/info/product/edit.jhtml,/info/area/update.jhtml', '1', 'USE', '2016-12-21 17:12:25', '1', 'INFO_PRODUCT');
INSERT INTO `sys_function` VALUES ('INFO_PRODUCT_DEL', '100203', '2016-12-19 14:42:04', '删除', '', 'BUTTON', '/info/product/delete.jhtml', '1', 'USE', '2016-12-19 14:42:04', '0', 'INFO_PRODUCT');
INSERT INTO `sys_function` VALUES ('INFO_PRODUCT_EDIT', '100202', '2016-12-19 14:39:53', '编辑', '', 'BUTTON', '/info/product/edit.jhtml', '1', 'USE', '2016-12-19 14:39:53', '0', 'INFO_PRODUCT');
INSERT INTO `sys_function` VALUES ('INFO_PRODUCT_IMPORT', '100204', '2016-12-19 14:43:14', '导入', '', 'BUTTON', '/info/product/import.jhtml', '1', 'USE', '2016-12-19 14:43:14', '0', 'INFO_PRODUCT');
INSERT INTO `sys_function` VALUES ('INFO_PROMOTERS', '100600', '2016-12-22 11:33:07', '促销员管理', '/info/promoters/list.jhtml', 'MENU', '/info/promoters/*.jhtml', '2', 'USE', '2016-12-22 11:33:07', '0', 'INFO');
INSERT INTO `sys_function` VALUES ('INFO_PROMOTERS_ADD', '100601', '2016-12-22 11:34:24', '添加', '', 'BUTTON', '/info/promoters/edit.jhtml,/info/promoters/update.jhtml', '3', 'USE', '2016-12-22 11:34:24', '0', 'INFO_PROMOTERS');
INSERT INTO `sys_function` VALUES ('INFO_PROMOTERS_DEL', '100603', '2016-12-22 11:35:51', '删除', '', 'BUTTON', '/info/promoters/delete.jhtml', '3', 'USE', '2016-12-22 11:35:51', '0', 'INFO_PROMOTERS');
INSERT INTO `sys_function` VALUES ('INFO_PROMOTERS_EDIT', '100602', '2016-12-22 11:35:16', '编辑', '', 'BUTTON', '/info/promoters/edit.jhtml,/info/promoters/update.jhtml', '3', 'USE', '2016-12-22 11:35:16', '0', 'INFO_PROMOTERS');
INSERT INTO `sys_function` VALUES ('INFO_PROMOTERS_IMP', '100604', '2016-12-22 11:36:50', '导入', '', 'BUTTON', '/info/promoters/imp.jhtml', '3', 'USE', '2016-12-22 11:36:50', '0', 'INFO_PROMOTERS');
INSERT INTO `sys_function` VALUES ('INFO_STOPRO', '100510', '2016-12-26 11:33:02', '门店存货管理', '/info/store-product/list.jhtml', 'MENU', '/info/store-product/*.jhtml', '2', 'USE', '2016-12-26 11:44:47', '1', 'INFO');
INSERT INTO `sys_function` VALUES ('INFO_STOPRO_ADD', '100511', '2016-12-26 11:40:27', '添加', '', 'BUTTON', '/info/store-product/edit.jhtml', '1', 'USE', '2016-12-26 11:40:27', '0', 'INFO_STOPRO');
INSERT INTO `sys_function` VALUES ('INFO_STOPRO_DEL', '100513', '2016-12-26 11:42:53', '删除', '', 'BUTTON', '/info/store-product/delete.jhtml', '1', 'USE', '2016-12-26 11:45:07', '1', 'INFO_STOPRO');
INSERT INTO `sys_function` VALUES ('INFO_STOPRO_EDIT', '100512', '2016-12-26 11:42:14', '编辑', '', 'BUTTON', '/info/store-product/update.jhtml', '1', 'USE', '2016-12-26 11:45:00', '1', 'INFO_STOPRO');
INSERT INTO `sys_function` VALUES ('INFO_STOPRO_IMP', '100514', '2016-12-26 11:43:16', '导入', '', 'BUTTON', '/info/store-product/imp.jhtml', '1', 'USE', '2016-12-26 11:43:16', '0', 'INFO_STOPRO');
INSERT INTO `sys_function` VALUES ('INFO_STOPROSAL', '100900', '2017-03-17 11:12:15', '门店销售管理', '/info/store-product-sale/list.jhtml', 'MENU', '/info/store-product-sale/*.jhtml', '2', 'USE', '2017-03-17 11:12:15', '0', 'INFO');
INSERT INTO `sys_function` VALUES ('INFO_STOPROSAL_ADD', '100901', '2017-03-17 11:13:04', '添加', '', 'BUTTON', '/info/store-product-sale/edit.jhtml,/info/store-product-sale/update.jhtml', '1', 'USE', '2017-03-17 11:13:04', '0', 'INFO_STOPROSAL');
INSERT INTO `sys_function` VALUES ('INFO_STOPROSAL_DEL', '100903', '2017-03-17 11:14:31', '删除', '', 'BUTTON', '/info/store-product-sale/delete.jhtml', '1', 'USE', '2017-03-17 11:14:31', '0', 'INFO_STOPROSAL');
INSERT INTO `sys_function` VALUES ('INFO_STOPROSAL_EDIT', '100902', '2017-03-17 11:13:42', '编辑', '', 'BUTTON', '/info/store-product-sale/edit.jhtml,/info/store-product-sale/udpate.jhtml', '1', 'USE', '2017-03-17 11:13:42', '0', 'INFO_STOPROSAL');
INSERT INTO `sys_function` VALUES ('INFO_STOPROSAL_IMP', '100904', '2017-03-17 11:15:05', '导入', '', 'BUTTON', '/info/store-product-sale/imp.jhtml', '1', 'USE', '2017-03-17 11:15:05', '0', 'INFO_STOPROSAL');
INSERT INTO `sys_function` VALUES ('INFO_STOPROSTO', '100800', '2017-03-16 10:17:52', '门店库存管理', '/info/store-product-stock/list.jhtml', 'MENU', '/info/store-product-stock/*.jhtml', '2', 'USE', '2017-03-16 10:17:52', '0', 'INFO');
INSERT INTO `sys_function` VALUES ('INFO_STOPROSTO_ADD', '100801', '2017-03-16 10:20:02', '添加', '', 'BUTTON', '/info/store-product-stock/edit.jhtml,/info/store-product-stock/update.jhtml', '1', 'USE', '2017-03-16 10:20:02', '0', 'INFO_STOPROSTO');
INSERT INTO `sys_function` VALUES ('INFO_STOPROSTO_DEL', '100802', '2017-03-16 10:20:41', '删除', '', 'BUTTON', '/info/store-product-stock/delete.jhtml', '1', 'USE', '2017-03-16 10:22:16', '1', 'INFO_STOPROSTO');
INSERT INTO `sys_function` VALUES ('INFO_STOPROSTO_EDIT', '100804', '2017-03-16 15:43:46', '编辑', '', 'BUTTON', '/info/store-product-stock/edit.jhtml,/info/store-product-stock/udpate.jhtml', '1', 'USE', '2017-03-16 15:43:46', '0', 'INFO_STOPROSTO');
INSERT INTO `sys_function` VALUES ('INFO_STOPROSTO_IMP', '100803', '2017-03-16 10:21:26', '导入', '', 'BUTTON', '/info/store-product-stock/imp.jhtml', '1', 'USE', '2017-03-16 10:21:26', '0', 'INFO_STOPROSTO');
INSERT INTO `sys_function` VALUES ('INFO_STORE', '100700', '2016-12-23 09:28:48', '门店管理', '/info/store/list.jhtml', 'MENU', '/info/store/*.jhtml', '2', 'USE', '2016-12-23 09:28:48', '0', 'INFO');
INSERT INTO `sys_function` VALUES ('INFO_STORE_ADD', '100701', '2016-12-23 09:29:39', '添加', '', 'BUTTON', '/info/store/edit.jhtml,/info/store/update.jhtml', '3', 'USE', '2016-12-23 09:29:39', '0', 'INFO_STORE');
INSERT INTO `sys_function` VALUES ('INFO_STORE_DEL', '100703', '2016-12-23 09:31:52', '删除', '', 'BUTTON', '/info/store/delete.jhtml', '3', 'USE', '2016-12-23 09:31:52', '0', 'INFO_STORE');
INSERT INTO `sys_function` VALUES ('INFO_STORE_EDIT', '100702', '2016-12-23 09:31:21', '编辑', '', 'BUTTON', '/info/store/edit.jhtml,/info/store/udpate.jhtml', '3', 'USE', '2016-12-23 09:31:21', '0', 'INFO_STORE');
INSERT INTO `sys_function` VALUES ('INFO_STORE_IMP', '100704', '2016-12-23 09:32:19', '导入', '', 'BUTTON', '/info/store/imp.jhtml', '3', 'USE', '2016-12-23 09:32:19', '0', 'INFO_STORE');
INSERT INTO `sys_function` VALUES ('LOG', '140000', '2017-01-12 17:17:22', '物流费用', '', 'MENU', '/logistic/logistics/*.jhtml', '1', 'USE', '2017-01-12 17:23:28', '2', null);
INSERT INTO `sys_function` VALUES ('LOG_ANALYSIS', '140400', '2017-01-17 13:54:47', '物流费分析表', '/logistic/logistics-analysis/logisticsAnalysis.jhtml', 'MENU', '/logistic/logistics-analysis/logisticsAnalysis.jhtml', '2', 'USE', '2017-01-17 13:55:46', '1', 'LOG');
INSERT INTO `sys_function` VALUES ('LOG_ANALYSIS_DETAIL', '140300', '2017-01-17 13:52:38', '物流费明细表', '/logistic/logistics-analysis/logisticsDetail.jhtml', 'MENU', '/logistic/logistics-analysis/logisticsDetail.jhtml', '2', 'USE', '2017-01-17 13:55:28', '2', 'LOG');
INSERT INTO `sys_function` VALUES ('LOG_ANALYSIS_DETEXP', '140301', '2017-01-17 15:43:12', '导出', '', 'BUTTON', '/logistic/logistics-analysis/logisticsDetailExp.jhtml', '1', 'USE', '2017-01-17 15:43:12', '0', 'LOG_ANALYSIS_DETAIL');
INSERT INTO `sys_function` VALUES ('LOG_ANALYSIS_DETPRI', '140302', '2017-02-14 14:54:59', '打印', '', 'BUTTON', '', '1', 'USE', '2017-02-14 14:54:59', '0', 'LOG_ANALYSIS_DETAIL');
INSERT INTO `sys_function` VALUES ('LOG_ANALYSIS_EXP', '140401', '2017-01-19 10:15:30', '导出', '', 'BUTTON', '/logistic/logistics-analysis/exportAnalysis.jhtml', '3', 'USE', '2017-01-19 10:15:30', '0', 'LOG_ANALYSIS');
INSERT INTO `sys_function` VALUES ('LOG_ANALYSIS_PRI', '140402', '2017-02-14 14:55:48', '打印', '', 'BUTTON', '', '1', 'USE', '2017-02-14 14:55:48', '0', 'LOG_ANALYSIS');
INSERT INTO `sys_function` VALUES ('LOG_LOGISTICS', '140100', '2017-01-12 17:24:58', '物流费用', '/logistic/logistics/list.jhtml', 'MENU', '/logistic/logistics/*.jhtml', '2', 'USE', '2017-01-12 17:24:58', '0', 'LOG');
INSERT INTO `sys_function` VALUES ('LOG_LOGISTICS_ADD', '140101', '2017-01-12 17:18:41', '生成物流费用', '', 'BUTTON', '/logistic/logistics/add.jhtml', '1', 'USE', '2017-01-12 17:18:41', '0', 'LOG_LOGISTICS');
INSERT INTO `sys_function` VALUES ('LOG_LOGISTICS_AUDIT', '140103', '2017-01-12 17:21:44', '审核', '', 'BUTTON', '/logistic/logistics/edit.jhtml;/logistic/logistics/approve.jhtml', '1', 'USE', '2017-01-12 17:21:44', '0', 'LOG_LOGISTICS');
INSERT INTO `sys_function` VALUES ('LOG_LOGISTICS_DEL', '140102', '2017-01-12 17:19:28', '删除', '', 'BUTTON', '/logistic/logistics/delete.jhtml', '1', 'USE', '2017-01-12 17:19:28', '0', 'LOG_LOGISTICS');
INSERT INTO `sys_function` VALUES ('LOG_LOGISTICS_REA', '140104', '2017-01-12 17:22:17', '反审', '', 'BUTTON', '/logistic/logistics/edit.jhtml;/logistic/logistics/approve.jhtml', '1', 'USE', '2017-01-12 17:26:44', '1', 'LOG_LOGISTICS');
INSERT INTO `sys_function` VALUES ('LOG_OTHERLOG', '140200', '2017-01-16 16:22:20', '其他物流费用', '/logistic/other-logistics/list.jhtml', 'MENU', '/logistic/other-logistics/*.jhtml', '2', 'USE', '2017-01-16 16:22:20', '0', 'LOG');
INSERT INTO `sys_function` VALUES ('LOG_OTHERLOG_ADD', '140201', '2017-01-16 16:23:18', '添加', '', 'BUTTON', '/logistic/other-logistics/edit.jhtml;/logistic/other-logistics/update.jhtml', '1', 'USE', '2017-01-16 16:23:18', '0', 'LOG_OTHERLOG');
INSERT INTO `sys_function` VALUES ('LOG_OTHERLOG_AUDIT', '140205', '2017-01-16 16:27:10', '审核', '', 'BUTTON', '/logistic/other-logistics/edit.jhtml;/logistic/other-logistics/approve.jhtml', '1', 'USE', '2017-01-16 16:27:10', '0', 'LOG_OTHERLOG');
INSERT INTO `sys_function` VALUES ('LOG_OTHERLOG_DEL', '140203', '2017-01-16 16:24:55', '删除', '', 'BUTTON', '/logistic/other-logistics/delete.jhtml', '1', 'USE', '2017-01-16 16:24:55', '0', 'LOG_OTHERLOG');
INSERT INTO `sys_function` VALUES ('LOG_OTHERLOG_EDIT', '140202', '2017-01-16 16:24:08', '编辑', '', 'BUTTON', '/logistic/other-logistics/edit.jhtml;/logistic/other-logistics/update.jhtml', '1', 'USE', '2017-01-16 16:24:08', '0', 'LOG_OTHERLOG');
INSERT INTO `sys_function` VALUES ('LOG_OTHERLOG_FT', '140204', '2017-01-16 16:25:41', '分摊', '', 'BUTTON', '/logistic/other-logistics/ftCost.jhtml', '1', 'USE', '2017-01-16 16:25:41', '0', 'LOG_OTHERLOG');
INSERT INTO `sys_function` VALUES ('LOG_OTHERLOG_REA', '140206', '2017-01-16 16:27:53', '反审', '', 'BUTTON', '/logistic/other-logistics/edit.jhtml;/logistic/other-logistics/approve.jhtml', '1', 'USE', '2017-01-16 16:27:53', '0', 'LOG_OTHERLOG');
INSERT INTO `sys_function` VALUES ('ORDER_DELIVER', '110200', '2017-01-06 11:49:06', '发货单管理', '/order/deliver-order/list.jhtml', 'MENU', '/order/deliver-order/*.jhtml', '2', 'USE', '2017-01-06 11:49:06', '0', 'BUD');
INSERT INTO `sys_function` VALUES ('ORDER_DELIVER_DEL', '110201', '2017-01-06 11:49:41', '删除', '', 'BUTTON', '/order/deliver-order/delete.jhtml', '3', 'USE', '2017-01-06 11:49:41', '0', 'ORDER_DELIVER');
INSERT INTO `sys_function` VALUES ('ORDER_DELIVER_IMP', '110202', '2017-01-06 11:50:10', '导入', '', 'BUTTON', '/order/deliver-order/imp.jhtml', '3', 'USE', '2017-01-06 11:50:10', '0', 'ORDER_DELIVER');
INSERT INTO `sys_function` VALUES ('ORDER_DELIVER_ISREB', '110203', '2017-01-06 17:31:46', '是否返利', '', 'BUTTON', '/order/deliver-order/isRebate.jhtml', '3', 'USE', '2017-01-06 17:31:46', '0', 'ORDER_DELIVER');
INSERT INTO `sys_function` VALUES ('ORDER_SALE', '110110', '2017-01-04 14:03:30', '销售订单管理', '/order/sale-order/list.jhtml', 'MENU', '/order/sale-order/*.jhtml', '2', 'USE', '2017-01-04 14:04:07', '1', 'BUD');
INSERT INTO `sys_function` VALUES ('ORDER_SALE_DEL', '110111', '2017-01-04 14:04:58', '删除', '', 'BUTTON', '/order/sale-order/del.jhtml', '1', 'USE', '2017-01-04 14:05:13', '1', 'ORDER_SALE');
INSERT INTO `sys_function` VALUES ('ORDER_SALE_IMP', '110112', '2017-01-04 14:06:02', '导入', '', 'BUTTON', '/order/sale-order/imp.jhtml', '1', 'USE', '2017-01-04 14:06:02', '0', 'ORDER_SALE');
INSERT INTO `sys_function` VALUES ('ORDER_TRAN', '110300', '2017-01-09 10:07:26', '仓库调拨单管理', '/order/transfer/list.jhtml', 'MENU', '/order/transfer/*.jhtml', '2', 'USE', '2017-01-09 10:07:26', '0', 'BUD');
INSERT INTO `sys_function` VALUES ('ORDER_TRAN_DEL', '110301', '2017-01-09 10:07:57', '删除', '', 'BUTTON', '/order/transfer/delete.jhtml', '3', 'USE', '2017-01-09 10:07:57', '0', 'ORDER_TRAN');
INSERT INTO `sys_function` VALUES ('ORDER_TRAN_IMP', '110302', '2017-01-09 10:08:26', '导入', '', 'BUTTON', '/order/transfer/imp.jhtml', '3', 'USE', '2017-01-09 10:08:26', '0', 'ORDER_TRAN');
INSERT INTO `sys_function` VALUES ('PROJECT', '200810', '2017-12-05 16:38:22', '项目信息管理', '/info/product-type/list.jhtml', 'MENU', '', '2', 'USE', '2017-12-05 17:04:31', '9', 'PROJECT_INFO');
INSERT INTO `sys_function` VALUES ('PROJECT_INFO', '200800', '2017-12-05 16:50:54', '项目信息管理', '', 'MENU', '', '1', 'USE', '2017-12-05 17:03:56', '2', null);
INSERT INTO `sys_function` VALUES ('SALE_BILL', '110310', '2017-03-08 14:36:41', '发票额管理', '/order/sale-bill/list.jhtml', 'MENU', '/order/sale-bill/*.jhtml', '2', 'USE', '2017-03-08 14:40:43', '1', 'BUD');
INSERT INTO `sys_function` VALUES ('SALE_BILL_DEL', '110311', '2017-03-08 14:37:56', '删除', '', 'BUTTON', '/order/sale-bill/delete.jhtml', '1', 'USE', '2017-03-08 14:37:56', '0', 'SALE_BILL');
INSERT INTO `sys_function` VALUES ('SALE_BILL_IMP', '110312', '2017-03-08 14:39:15', '导入', '', 'BUTTON', '/order/sale-bill/imp.jhtml', '1', 'USE', '2017-03-08 14:39:15', '0', 'SALE_BILL');
INSERT INTO `sys_function` VALUES ('SYS', '200000', '2014-07-31 13:00:59', '系统管理', '', 'MENU', '', '1', 'USE', '2014-08-05 15:32:41', '1', null);
INSERT INTO `sys_function` VALUES ('SYS_BACKUP', '200700', '2014-08-05 11:36:24', '备份管理', '/system/backup/list.jhtml', 'MENU', '/system/backup/*.jhtml', '2', 'USE', '2016-05-13 14:09:15', '3', 'SYS');
INSERT INTO `sys_function` VALUES ('SYS_DICT', '200400', '2014-08-05 11:33:32', '常量管理', '/system/dict/list.jhtml', 'MENU', '/system/dict/*.jhtml', '2', 'USE', '2017-01-16 09:48:28', '3', 'SYS');
INSERT INTO `sys_function` VALUES ('SYS_DICT_ADD', '200400', '2014-09-19 16:34:45', '添加', '', 'BUTTON', '/system/dict/edit.jhtml,/system/dict/update.jhtml', '1', 'USE', '2014-09-19 16:35:35', '1', 'SYS_DICT');
INSERT INTO `sys_function` VALUES ('SYS_DICT_DEL', '200400', '2014-09-19 16:35:19', '删除', '', 'BUTTON', '/system/dict/delete.jhtml', '1', 'USE', '2014-09-19 16:35:42', '1', 'SYS_DICT');
INSERT INTO `sys_function` VALUES ('SYS_DICT_EDIT', '200400', '2016-04-05 17:29:54', '编辑', '', 'BUTTON', '/system/dict/edit.jhtml,/system/dict/update.jhtml', '3', 'USE', '2016-04-05 17:30:26', '1', 'SYS_DICT');
INSERT INTO `sys_function` VALUES ('SYS_FUNC', '200300', '2014-08-05 11:32:06', '菜单权限管理', '/system/function/list.jhtml', 'MENU', '/system/function/*.jhtml', '2', 'USE', '2014-08-05 15:32:59', '2', 'SYS');
INSERT INTO `sys_function` VALUES ('SYS_FUNC_ADD', '200301', '2014-09-19 16:32:50', '添加', '', 'BUTTON', '/system/function/edit.jhtml,/system/function/update.jhtml', '1', 'USE', '2014-09-19 16:32:50', '0', 'SYS_FUNC');
INSERT INTO `sys_function` VALUES ('SYS_FUNC_DEL', '200302', '2014-09-19 16:33:32', '删除', '', 'BUTTON', '/system/function/delete.jhtml', '1', 'USE', '2014-09-19 16:33:32', '0', 'SYS_FUNC');
INSERT INTO `sys_function` VALUES ('SYS_FUNC_EDIT', '200303', '2016-04-05 17:28:25', '编辑', '', 'BUTTON', '/system/function/edit.jhtml,/system/function/update.jhtml', '3', 'USE', '2016-04-05 17:28:25', '0', 'SYS_FUNC');
INSERT INTO `sys_function` VALUES ('SYS_LOG', '200500', '2014-08-05 11:34:37', '日志管理', '/system/log/list.jhtml', 'MENU', '/system/log/*.jhtml', '2', 'USE', '2016-05-13 13:57:28', '3', 'SYS');
INSERT INTO `sys_function` VALUES ('SYS_ROLE', '200200', '2014-08-05 11:31:20', '角色管理', '/system/role/list.jhtml', 'MENU', '/system/role/*.jhtml', '2', 'USE', '2014-08-05 15:32:46', '2', 'SYS');
INSERT INTO `sys_function` VALUES ('SYS_ROLE_ADD', '200201', '2014-09-19 16:02:57', '添加', '', 'BUTTON', '/system/role/edit.jhtml,/system/role/update.jhtml', '1', 'USE', '2014-09-19 16:03:38', '1', 'SYS_ROLE');
INSERT INTO `sys_function` VALUES ('SYS_ROLE_DEL', '200202', '2014-09-19 16:04:20', '删除', '', 'BUTTON', '/system/role/delete.jhtml', '1', 'USE', '2014-09-19 16:04:20', '0', 'SYS_ROLE');
INSERT INTO `sys_function` VALUES ('SYS_ROLE_EDIT', '200203', '2016-04-05 17:26:54', '编辑', '', 'BUTTON', '/system/role/edit.jhtml,/system/role/update.jhtml', '3', 'USE', '2016-04-05 17:26:54', '0', 'SYS_ROLE');
INSERT INTO `sys_function` VALUES ('SYS_ROLE_QX', '200204', '2014-09-19 16:30:07', '配置权限', '', 'BUTTON', '', '1', 'USE', '2014-09-19 16:30:07', '0', 'SYS_ROLE');
INSERT INTO `sys_function` VALUES ('SYS_ROLE_UP', '200205', '2014-09-19 16:31:20', '更新权限', '', 'BUTTON', '', '1', 'USE', '2014-09-19 16:58:39', '1', 'SYS_ROLE');
INSERT INTO `sys_function` VALUES ('SYS_ROLE_USER', '200203', '2014-09-19 16:28:51', '配置用户', '', 'BUTTON', '', '1', 'USE', '2014-09-19 16:28:51', '0', 'SYS_ROLE');
INSERT INTO `sys_function` VALUES ('SYS_USER', '200100', '2014-07-31 13:01:31', '用户管理', '/system/user/list.jhtml', 'MENU', '/system/user/*.jhtml', '2', 'USE', '2014-08-05 15:32:54', '2', 'SYS');
INSERT INTO `sys_function` VALUES ('SYS_USER_ADD', '200101', '2014-09-18 14:56:57', '添加', '', 'BUTTON', '/system/user/add.jhtml,/system/user/update.jhtml', '1', 'USE', '2014-09-19 15:15:41', '1', 'SYS_USER');
INSERT INTO `sys_function` VALUES ('SYS_USER_DEL', '200102', '2014-09-19 14:53:47', '删除', '', 'BUTTON', '/system/user/delete.jhtml', '1', 'USE', '2014-09-19 15:00:54', '2', 'SYS_USER');
INSERT INTO `sys_function` VALUES ('SYS_USER_EDIT', '200103', '2016-04-05 17:25:12', '编辑', '', 'BUTTON', '/system/user/edit.jhtml,/system/user/update.jhtml', '3', 'USE', '2016-04-05 17:25:12', '0', 'SYS_USER');
INSERT INTO `sys_function` VALUES ('WORKFLOW', '200820', '2017-12-05 17:13:03', '流程定义管理', '/project/workflow_defi.jhtml', 'MENU', '/project/product-type/*.jhtml', '2', 'USE', '2017-12-05 17:26:40', '3', 'PROJECT_INFO');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `ipAddress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPass` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operInfo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `para` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userCde` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `remark` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '2014-07-31 15:19:26', '2014-08-05 11:50:08', '1', '超级管理员，重要角色，不可删除', '系统管理员', 'USE');
INSERT INTO `sys_role` VALUES ('2', '2017-12-05 16:19:28', '2017-12-05 16:19:28', '0', '由系统管理员创建，管理自己的项目信息，为普通用户分配权限', '项目管理员', 'USE');
INSERT INTO `sys_role` VALUES ('3', '2017-12-05 16:20:09', '2017-12-05 16:20:09', '0', '有项目权限的用户可以看项目信息', '普通用户', 'USE');

-- ----------------------------
-- Table structure for sys_role_path
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_path`;
CREATE TABLE `sys_role_path` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `functionCde` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15935 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_role_path
-- ----------------------------
INSERT INTO `sys_role_path` VALUES ('-303', '2014-11-13 10:52:32', '2014-11-13 10:52:34', '0', 'SYS_JSON', '/**/*.json', '-3');
INSERT INTO `sys_role_path` VALUES ('-302', '2013-07-29 17:26:02', '2013-07-29 17:26:02', '0', null, '/**/*.text', '-3');
INSERT INTO `sys_role_path` VALUES ('-301', '2013-07-29 17:26:02', '2013-07-29 17:26:02', '0', null, '/**/*.jhtml', '-3');
INSERT INTO `sys_role_path` VALUES ('-200', '2013-07-29 17:26:02', '2013-07-29 17:26:02', '0', null, '/**/*.jhtml', '-2');
INSERT INTO `sys_role_path` VALUES ('-10', '2014-08-11 18:22:52', '2014-08-11 18:22:52', '0', null, '/system/attach/*.jhtml', '-1');
INSERT INTO `sys_role_path` VALUES ('-6', '2013-06-28 00:00:00', '2013-06-28 00:00:00', '0', null, '/lib-ext/**', '-1');
INSERT INTO `sys_role_path` VALUES ('15908', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_USER', '/system/user/*.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15909', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_USER_ADD', '/system/user/add.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15910', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_USER_ADD', '/system/user/update.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15911', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_USER_DEL', '/system/user/delete.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15912', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_USER_EDIT', '/system/user/edit.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15913', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_USER_EDIT', '/system/user/update.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15914', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE', '/system/role/*.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15915', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_ADD', '/system/role/edit.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15916', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_ADD', '/system/role/update.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15917', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_DEL', '/system/role/delete.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15918', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_EDIT', '/system/role/edit.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15919', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_EDIT', '/system/role/update.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15920', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_FUNC', '/system/function/*.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15921', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_FUNC_ADD', '/system/function/edit.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15922', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_FUNC_ADD', '/system/function/update.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15923', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_FUNC_DEL', '/system/function/delete.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15924', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_FUNC_EDIT', '/system/function/edit.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15925', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_FUNC_EDIT', '/system/function/update.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15926', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_DICT', '/system/dict/*.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15927', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_DICT_ADD', '/system/dict/edit.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15928', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_DICT_ADD', '/system/dict/update.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15929', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_DICT_DEL', '/system/dict/delete.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15930', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_DICT_EDIT', '/system/dict/edit.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15931', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_DICT_EDIT', '/system/dict/update.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15932', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_LOG', '/system/log/*.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15933', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_BACKUP', '/system/backup/*.jhtml', '1');
INSERT INTO `sys_role_path` VALUES ('15934', '2017-12-05 17:26:40', '2017-12-05 17:26:40', '0', 'WORKFLOW', '/project/product-type/*.jhtml', '1');

-- ----------------------------
-- Table structure for sys_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_perm`;
CREATE TABLE `sys_role_perm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `functionId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK65D5E22777277B82` (`functionId`),
  KEY `FK65D5E227B0A3D8BE` (`roleId`),
  CONSTRAINT `FK65D5E22777277B82` FOREIGN KEY (`functionId`) REFERENCES `sys_function` (`funcCde`),
  CONSTRAINT `FK65D5E227B0A3D8BE` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14915 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_role_perm
-- ----------------------------
INSERT INTO `sys_role_perm` VALUES ('14890', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS', '1');
INSERT INTO `sys_role_perm` VALUES ('14891', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_USER', '1');
INSERT INTO `sys_role_perm` VALUES ('14892', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_USER_ADD', '1');
INSERT INTO `sys_role_perm` VALUES ('14893', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_USER_DEL', '1');
INSERT INTO `sys_role_perm` VALUES ('14894', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_USER_EDIT', '1');
INSERT INTO `sys_role_perm` VALUES ('14895', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE', '1');
INSERT INTO `sys_role_perm` VALUES ('14896', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_ADD', '1');
INSERT INTO `sys_role_perm` VALUES ('14897', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_DEL', '1');
INSERT INTO `sys_role_perm` VALUES ('14898', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_EDIT', '1');
INSERT INTO `sys_role_perm` VALUES ('14899', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_USER', '1');
INSERT INTO `sys_role_perm` VALUES ('14900', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_QX', '1');
INSERT INTO `sys_role_perm` VALUES ('14901', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_ROLE_UP', '1');
INSERT INTO `sys_role_perm` VALUES ('14902', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_FUNC', '1');
INSERT INTO `sys_role_perm` VALUES ('14903', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_FUNC_ADD', '1');
INSERT INTO `sys_role_perm` VALUES ('14904', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_FUNC_DEL', '1');
INSERT INTO `sys_role_perm` VALUES ('14905', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_FUNC_EDIT', '1');
INSERT INTO `sys_role_perm` VALUES ('14906', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_DICT', '1');
INSERT INTO `sys_role_perm` VALUES ('14907', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_DICT_ADD', '1');
INSERT INTO `sys_role_perm` VALUES ('14908', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_DICT_DEL', '1');
INSERT INTO `sys_role_perm` VALUES ('14909', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_DICT_EDIT', '1');
INSERT INTO `sys_role_perm` VALUES ('14910', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_LOG', '1');
INSERT INTO `sys_role_perm` VALUES ('14911', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'SYS_BACKUP', '1');
INSERT INTO `sys_role_perm` VALUES ('14912', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'PROJECT_INFO', '1');
INSERT INTO `sys_role_perm` VALUES ('14913', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'PROJECT', '1');
INSERT INTO `sys_role_perm` VALUES ('14914', '2017-12-05 17:13:59', '2017-12-05 17:13:59', '0', 'WORKFLOW', '1');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK65D85B02B0A3D8BE` (`roleId`),
  KEY `FK65D85B02B5F92E28` (`userId`),
  CONSTRAINT `FK65D85B02B0A3D8BE` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK65D85B02B5F92E28` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('1', '2014-08-05 11:58:12', '2014-08-05 11:58:12', '0', '1', '1');
INSERT INTO `sys_role_user` VALUES ('2', '2017-12-05 16:33:43', '2017-12-05 16:33:43', '0', '2', '2');
INSERT INTO `sys_role_user` VALUES ('3', '2017-12-05 16:34:18', '2017-12-05 16:34:27', '1', '3', '3');

-- ----------------------------
-- Table structure for sys_seqno
-- ----------------------------
DROP TABLE IF EXISTS `sys_seqno`;
CREATE TABLE `sys_seqno` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `prefixion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `seqNum` int(11) DEFAULT NULL,
  `tableName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_seqno
-- ----------------------------

-- ----------------------------
-- Table structure for sys_url
-- ----------------------------
DROP TABLE IF EXISTS `sys_url`;
CREATE TABLE `sys_url` (
  `URLPATH` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_url
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `isUpdate` bit(1) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pwd` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `townId` bigint(20) DEFAULT NULL,
  `userCode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `areaId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userCode` (`userCode`),
  KEY `FK74A81DFD970B220D` (`areaId`),
  CONSTRAINT `FK74A81DFD970B220D` FOREIGN KEY (`areaId`) REFERENCES `info_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '2014-07-28 15:54:39', '2017-01-13 15:25:35', '11', '\0', '13600341232', 'a422a4195b61cd46df15a0045a291291', 'USE', null, 'admin', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('2', '2017-12-05 16:33:43', '2017-12-05 16:33:43', '0', '\0', '15915088765', 'a422a4195b61cd46df15a0045a291291', 'USE', null, 'A', '项目管理员a', null);
INSERT INTO `sys_user` VALUES ('3', '2017-12-05 16:34:18', '2017-12-05 16:34:27', '1', '\0', '10749800678', 'a422a4195b61cd46df15a0045a291291', 'USE', null, 'B', '普通用户', null);

-- ----------------------------
-- Table structure for sys_user_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login`;
CREATE TABLE `sys_user_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `activeTime` datetime DEFAULT NULL,
  `ipAddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loginTime` datetime DEFAULT NULL,
  `logoutTime` datetime DEFAULT NULL,
  `sessionId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5B293EA77EF58769` (`userId`),
  CONSTRAINT `FK5B293EA77EF58769` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user_login
-- ----------------------------
INSERT INTO `sys_user_login` VALUES ('1', '2017-11-23 14:54:11', '2017-11-23 15:00:38', '1', '2017-11-23 14:54:11', '192.168.6.156', '2017-11-23 14:54:11', '2017-11-23 15:00:38', 'A7E0904DD446E851C133967A24DA2C75', '1');
INSERT INTO `sys_user_login` VALUES ('2', '2017-11-23 15:00:40', '2017-11-23 15:04:23', '1', '2017-11-23 15:00:40', '192.168.6.156', '2017-11-23 15:00:40', '2017-11-23 15:04:23', 'A7E0904DD446E851C133967A24DA2C75', '1');
INSERT INTO `sys_user_login` VALUES ('3', '2017-12-05 16:08:51', '2017-12-05 16:09:03', '1', '2017-12-05 16:08:51', '0:0:0:0:0:0:0:1', '2017-12-05 16:08:51', '2017-12-05 16:09:03', '107D7EDBBCAA146A282AE700CF40921D', '1');
INSERT INTO `sys_user_login` VALUES ('4', '2017-12-05 16:09:06', '2017-12-05 16:09:06', '0', '2017-12-05 16:09:06', '0:0:0:0:0:0:0:1', '2017-12-05 16:09:06', null, '107D7EDBBCAA146A282AE700CF40921D', '1');
INSERT INTO `sys_user_login` VALUES ('5', '2017-12-06 09:43:37', '2017-12-06 09:43:37', '0', '2017-12-06 09:43:37', '0:0:0:0:0:0:0:1', '2017-12-06 09:43:37', null, '2F9F62C9B842DEFA53441293996E87AC', '1');

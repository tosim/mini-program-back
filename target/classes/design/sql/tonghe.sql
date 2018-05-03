/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50628
 Source Host           : localhost:3306
 Source Schema         : tonghe

 Target Server Type    : MySQL
 Target Server Version : 50628
 File Encoding         : 65001

 Date: 03/05/2018 17:32:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `activity_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `activity_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `start_time` datetime(0) NOT NULL COMMENT '活动开始时间',
  `activity_type` tinyint(4) NOT NULL COMMENT '活动类型',
  `channel_id` int(11) NOT NULL COMMENT '所需的渠道id',
  `duration_lowbound` int(11) NOT NULL COMMENT '标的期限',
  `bid_lowbound` decimal(19, 4) NOT NULL COMMENT '投资金额需要大于bid_lowbound',
  `reward_type` tinyint(4) NOT NULL COMMENT '奖励类型',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bid
-- ----------------------------
DROP TABLE IF EXISTS `bid`;
CREATE TABLE `bid`  (
  `bid_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '投标id',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '投标的用户id',
  `ifb_id` int(11) UNSIGNED NOT NULL COMMENT '招标的id',
  `principal` decimal(19, 4) UNSIGNED NOT NULL COMMENT '本金',
  `red_pack_ticket_id` int(11) UNSIGNED NOT NULL COMMENT '红包券id',
  `interest_ticket_id` int(11) UNSIGNED NOT NULL COMMENT '年化券id',
  `bid_profit` decimal(19, 4) UNSIGNED NOT NULL COMMENT '应得利息',
  `return_time` datetime(0) NOT NULL COMMENT '还款日期',
  `status` tinyint(4) NOT NULL COMMENT '投资状态',
  `add_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`bid_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `ifb_id`(`ifb_id`) USING BTREE,
  INDEX `red_pack_ticket_id`(`red_pack_ticket_id`) USING BTREE,
  INDEX `interest_ticket_id`(`interest_ticket_id`) USING BTREE,
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`ifb_id`) REFERENCES `ifb` (`ifb_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bid_ibfk_3` FOREIGN KEY (`red_pack_ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bid_ibfk_4` FOREIGN KEY (`interest_ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel`  (
  `channel_id` int(11) NOT NULL COMMENT '渠道id',
  `channel_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `company_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公司id',
  `company_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司名',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司描述',
  `telephone_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司手机号',
  `last_year_income` decimal(19, 4) NOT NULL COMMENT '上年营业收入',
  `last_year_profit` decimal(19, 4) NOT NULL COMMENT '上年利润',
  `last_year_net_assets` decimal(19, 4) NOT NULL COMMENT '上年净资产',
  `employee_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工人数',
  `contact` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `position` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位',
  `contact_telephone_number` varbinary(16) NOT NULL COMMENT '联系电话',
  `audit_status` tinyint(4) NOT NULL COMMENT '审核状态',
  `legal_person` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '法人代表',
  `tax_number` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '税号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `add_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for credit_card
-- ----------------------------
DROP TABLE IF EXISTS `credit_card`;
CREATE TABLE `credit_card`  (
  `credit_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '银行卡id，本数据库中的',
  `user_real_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册银行卡的用户真实姓名',
  `identity_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册银行卡的用户身份证号码',
  `credit_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '银行卡号',
  `credit_telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '银行预留手机号',
  `bank_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行代码',
  `is_used` tinyint(4) NOT NULL COMMENT '充值状态，是否用这张卡充值过',
  `add_time` datetime(0) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`credit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ifb
-- ----------------------------
DROP TABLE IF EXISTS `ifb`;
CREATE TABLE `ifb`  (
  `ifb_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '招标id',
  `company_id` int(11) UNSIGNED NOT NULL COMMENT '所属公司id',
  `ifb_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标的名称',
  `company_interest` decimal(5, 4) NOT NULL COMMENT '企业利率',
  `company_poundage` decimal(19, 4) NOT NULL COMMENT '企业手续费',
  `ifb_total` decimal(19, 4) UNSIGNED NOT NULL COMMENT '招标总额',
  `ifb_left` decimal(19, 4) UNSIGNED NOT NULL COMMENT '招标剩余',
  `duration` int(11) UNSIGNED NOT NULL COMMENT '定期的时间',
  `push_date` datetime(0) NOT NULL COMMENT '平台app上的发布时间',
  `is_public` bit(1) NOT NULL COMMENT '是否在app上放标',
  `start_date` datetime(0) NOT NULL COMMENT '招标的开始日期',
  `expiry_date` datetime(0) NOT NULL COMMENT '招标的截至日期',
  `interest_per_year` decimal(5, 4) UNSIGNED NOT NULL COMMENT '年化率',
  `return_date` datetime(0) NOT NULL COMMENT '还款的日期',
  `real_return_date` datetime(0) NOT NULL COMMENT '实际还款日期',
  `is_normal` bit(1) NOT NULL COMMENT '是否流标',
  `add_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加的时间',
  PRIMARY KEY (`ifb_id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  CONSTRAINT `ifb_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for offline_recharge_record
-- ----------------------------
DROP TABLE IF EXISTS `offline_recharge_record`;
CREATE TABLE `offline_recharge_record`  (
  `offline_recharge_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '线下充值id',
  `number` decimal(19, 4) UNSIGNED NOT NULL COMMENT '充值金额',
  `balance_before` decimal(19, 4) UNSIGNED NOT NULL COMMENT '充值前的金额',
  `balance_after` decimal(19, 4) UNSIGNED NOT NULL COMMENT '充值后的金额',
  `time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '充值时间',
  `status` tinyint(4) NOT NULL COMMENT '充值状态',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  PRIMARY KEY (`offline_recharge_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `offline_recharge_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for payback_record
-- ----------------------------
DROP TABLE IF EXISTS `payback_record`;
CREATE TABLE `payback_record`  (
  `payback_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '还款id',
  `number` decimal(19, 4) UNSIGNED NOT NULL COMMENT '还款金额',
  `balance_before` decimal(19, 4) UNSIGNED NOT NULL COMMENT '还款前金额',
  `balance_after` decimal(19, 4) UNSIGNED NOT NULL COMMENT '还款后金额',
  `time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '还款时间',
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '还款状态',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  PRIMARY KEY (`payback_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `payback_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permission_name` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限名',
  `permission_url` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限url',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for prove_image
-- ----------------------------
DROP TABLE IF EXISTS `prove_image`;
CREATE TABLE `prove_image`  (
  `image_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `company_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公司id',
  `prove_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片类型',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片描述',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`image_id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  CONSTRAINT `prove_image_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for recharge_record
-- ----------------------------
DROP TABLE IF EXISTS `recharge_record`;
CREATE TABLE `recharge_record`  (
  `recharge_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '充值记录id',
  `order_id` varchar(65) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `number` decimal(19, 4) UNSIGNED NOT NULL COMMENT '充值金额',
  `balance_before` decimal(19, 4) UNSIGNED NOT NULL COMMENT '充值前金额',
  `balance_after` decimal(19, 4) UNSIGNED NOT NULL COMMENT '充值后金额',
  `time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '充值时间',
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '充值状态',
  `rechare_type` tinyint(4) NOT NULL COMMENT '充值类型',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  PRIMARY KEY (`recharge_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `recharge_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `rp_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'role_permission_id',
  `role_id` int(11) UNSIGNED NOT NULL COMMENT 'role_id',
  `permission_id` int(11) UNSIGNED NOT NULL COMMENT 'permission_id',
  PRIMARY KEY (`rp_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `ticket_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '礼券id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `redeem_code` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '兑换码',
  `ticket_type` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '礼券类型',
  `number` decimal(19, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '礼券数值',
  `start_date` datetime(0) NOT NULL COMMENT '开始有效日期，用户领取时间',
  `duration` int(11) UNSIGNED NOT NULL COMMENT '有效期持续时间',
  `bid_lowbound` decimal(19, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '投资金额需要大于bid_lowbound',
  `duration_lowbound` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投资期限需要大于duration_lowbound',
  `activity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '活动来源',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '红包说明',
  `ticket_status` tinyint(4) NOT NULL COMMENT '红包状态',
  PRIMARY KEY (`ticket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `telephone_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册手机号',
  `passwd` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录密码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱，后期补充，可以为空',
  `delivery_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货地址，后期补充，可用为空',
  `balance` decimal(19, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '账户余额，整数部分15位，小数部分4位',
  `totol_profit` decimal(12, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '累计收益，整数部分8位，小数部分4位',
  `pay_passwd` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付密码，设置了支付密码才能花钱，后期补充',
  `token` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后一次登录的有效token',
  `is_locked` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否冻结',
  `channel_id` int(11) NOT NULL COMMENT '渠道id',
  `locked_money` decimal(19, 4) UNSIGNED NOT NULL COMMENT '冻结资金，用户提现但是每到账',
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '性别，0女，1男，2未知',
  `recharge_money` decimal(19, 4) UNSIGNED NOT NULL COMMENT '充值总金额',
  `bid_money` decimal(19, 4) UNSIGNED NOT NULL COMMENT '投资的本金,待收本金',
  `bid_profit` decimal(19, 4) UNSIGNED NOT NULL COMMENT '待收利息',
  `user_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `channel_id`(`channel_id`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_credit
-- ----------------------------
DROP TABLE IF EXISTS `user_credit`;
CREATE TABLE `user_credit`  (
  `uc_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户_银行卡关联id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `credit_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '银行卡id',
  PRIMARY KEY (`uc_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `credit_id`(`credit_id`) USING BTREE,
  CONSTRAINT `user_credit_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_credit_ibfk_2` FOREIGN KEY (`credit_id`) REFERENCES `credit_card` (`credit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ur_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'user_role_id',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `role_id` int(11) UNSIGNED NOT NULL COMMENT 'role_id',
  PRIMARY KEY (`ur_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for withdraw_record
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_record`;
CREATE TABLE `withdraw_record`  (
  `withdraw_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '提现记录id',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `order_id` varchar(65) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `number` decimal(19, 4) UNSIGNED NOT NULL COMMENT '提现金额',
  `balance_before` decimal(19, 4) UNSIGNED NOT NULL COMMENT '提现前金额',
  `balance_after` decimal(19, 4) UNSIGNED NOT NULL COMMENT '提现后金额',
  `time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '提现时间',
  `audit_time` datetime(0) NOT NULL COMMENT '审核时间',
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '提现状态',
  PRIMARY KEY (`withdraw_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `withdraw_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

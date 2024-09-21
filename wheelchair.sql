/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : wheelchair

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 21/09/2024 22:19:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `userpwd` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', '123');

-- ----------------------------
-- Table structure for t_chair
-- ----------------------------
DROP TABLE IF EXISTS `t_chair`;
CREATE TABLE `t_chair`  (
  `c_id` int NOT NULL AUTO_INCREMENT COMMENT '轮椅id',
  `h_id` int NOT NULL COMMENT '品类id',
  `status` int NOT NULL DEFAULT 1 COMMENT '当前状态（0为空闲/1为租用/2为保养维修）',
  `u_id` int NULL DEFAULT NULL COMMENT '当前正在使用的用户id',
  `last_maintenance_date` datetime NULL DEFAULT NULL COMMENT '最近的保养或维修日期',
  `chair_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '轮椅编号',
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `h_id`(`h_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_chair
-- ----------------------------
INSERT INTO `t_chair` VALUES (31, 41, 1, 22, NULL, 'HBLD2-E-1');
INSERT INTO `t_chair` VALUES (32, 41, 1, 22, NULL, 'HBLD2-E-2');
INSERT INTO `t_chair` VALUES (33, 41, 0, 0, NULL, 'HBLD2-E-3');
INSERT INTO `t_chair` VALUES (34, 41, 0, 0, NULL, 'HBLD2-E-4');
INSERT INTO `t_chair` VALUES (35, 41, 0, 0, NULL, 'HBLD2-E-5');
INSERT INTO `t_chair` VALUES (36, 41, 0, 0, NULL, 'HBLD2-E-6');
INSERT INTO `t_chair` VALUES (37, 41, 0, 0, NULL, 'HBLD2-E-7');
INSERT INTO `t_chair` VALUES (38, 41, 0, 0, NULL, 'HBLD2-E-8');
INSERT INTO `t_chair` VALUES (39, 41, 0, 0, NULL, 'HBLD2-E-9');
INSERT INTO `t_chair` VALUES (40, 41, 0, 0, NULL, 'HBLD2-E-10');

-- ----------------------------
-- Table structure for t_delivery_order
-- ----------------------------
DROP TABLE IF EXISTS `t_delivery_order`;
CREATE TABLE `t_delivery_order`  (
  `d_id` int NOT NULL AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `c_id` int NOT NULL,
  `order_status` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '轮椅送达地址/取回地址',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int NOT NULL COMMENT '0送出/1送出',
  `date` date NOT NULL COMMENT '轮椅到手/脱手日期',
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_delivery_order
-- ----------------------------
INSERT INTO `t_delivery_order` VALUES (3, 22, 31, 2, 'shanghai', 'ysh', '12341234123', 0, '2024-09-22');
INSERT INTO `t_delivery_order` VALUES (5, 22, 32, 2, 'test', 'ysh', '12341234123', 0, '2024-09-22');
INSERT INTO `t_delivery_order` VALUES (6, 22, 31, 2, 'test', 'test', '12341234123', 1, '2024-09-23');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `o_id` int NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `c_id` int NOT NULL COMMENT '轮椅id',
  `u_id` int NOT NULL COMMENT '用户id',
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始日期',
  `end_date` datetime NOT NULL COMMENT '结束日期',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '姓名',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '地址',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '电话',
  `order_status` int NOT NULL COMMENT '订单状态\r\n0为已结束，\r\n1为等待发货，\r\n2为配送中，\r\n3为使用中，\r\n4为等待回收,\r\n5为回收中',
  PRIMARY KEY (`o_id`) USING BTREE,
  INDEX `fk1`(`c_id` ASC) USING BTREE,
  INDEX `fk2`(`u_id` ASC) USING BTREE,
  CONSTRAINT `fk2` FOREIGN KEY (`u_id`) REFERENCES `t_users` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (27, 31, 22, '2024-09-22 00:00:00', '2024-09-27 00:00:00', 'ysh', 'shanghai', '12341234123', 3);
INSERT INTO `t_order` VALUES (28, 32, 22, '2024-09-22 00:00:00', '2024-10-11 00:00:00', 'ysh', 'test', '12341234123', 3);

-- ----------------------------
-- Table structure for t_repair_order
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_order`;
CREATE TABLE `t_repair_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `oID` int NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pickupDate` date NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `orderStatus` int NOT NULL COMMENT '订单状态（例如“待处理”，“已处理”等）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`oID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_repair_order
-- ----------------------------
INSERT INTO `t_repair_order` VALUES (6, 27, 'repair', '2024-09-24', 'test', 'test', '12341234123', 1);

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `u_password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `u_phone_number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户注册手机号码，用于找回密码',
  `u_nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '昵称',
  `u_gender` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '性别，M表示男性，F表示女性',
  `u_birthdate` date NOT NULL COMMENT '生日',
  `u_age` int NOT NULL COMMENT '年龄',
  PRIMARY KEY (`u_id`) USING BTREE,
  UNIQUE INDEX `uniq`(`u_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (20, 'wym', '123456', '13556730677', 'wym', 'M', '1990-06-15', 34);
INSERT INTO `t_users` VALUES (21, 'lzk', 'lzk', '18320495603', '李先生', 'M', '1985-03-22', 39);
INSERT INTO `t_users` VALUES (22, 'ysh', '123', '13818882922', 'am', 'F', '1992-11-05', 31);
INSERT INTO `t_users` VALUES (23, 'jdoe', 'password123', '15812345678', 'JohnDoe', 'M', '1991-07-10', 33);
INSERT INTO `t_users` VALUES (24, 'janed', 'pass456', '15987654321', 'JaneD', 'F', '1995-02-18', 29);
INSERT INTO `t_users` VALUES (25, 'mzhang', 'mysecurepwd', '13912347890', '张明', 'M', '1988-12-01', 35);
INSERT INTO `t_users` VALUES (26, 'lili', '789654', '13765478901', '小丽', 'F', '1999-04-25', 25);

-- ----------------------------
-- Table structure for t_wheelchair
-- ----------------------------
DROP TABLE IF EXISTS `t_wheelchair`;
CREATE TABLE `t_wheelchair`  (
  `h_id` int NOT NULL AUTO_INCREMENT COMMENT '品类编号',
  `wheelchair_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '轮椅描述',
  `wheelchair_model` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '特点',
  `wheelchair_area` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '电池续航',
  `wheelchair_floor` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '型号',
  `wheelchair_type` int NOT NULL COMMENT '剩余数量',
  `wheelchair_price` int NOT NULL COMMENT '出租价格/日',
  `wheelchair_address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '发货地址',
  `wheelchair_image` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '轮椅简介照片',
  `community_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '品牌名称',
  `wheelchair_linkman` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '联系电话',
  `wheelchair_oriented` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '重量',
  `wheelchair_detailes_img` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '轮椅详细页面展示图片',
  `publisher` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '管理员' COMMENT '发布人',
  `publish_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`h_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_wheelchair
-- ----------------------------
INSERT INTO `t_wheelchair` VALUES (30, '互邦HBLD2-E电动轮椅可折叠轻便携铝合金锂电池老年人残疾人轮椅代步车', '加宽轮椅，手动折叠', '20', 'HBLD2-E', 0, 30, '上海', '/static/img/wheelchair1.png', '碧桂园豪庭一期', '13813813800', '22', '/static/img/wheelchair1.png', 'wym', '2019-12-12 00:28:43');
INSERT INTO `t_wheelchair` VALUES (31, '迪护电动轮椅老人全自动越野轻便可折叠旅行便携式家用老年代步电动车专用智能可躺上飞机带坐便器DH-QBK12AQ', '小轮便携，手动折叠', '18', 'DH-QBK12AQ', 0, 40, '上海', '/static/img/wheelchair2.png', '虎门万达广场', '18818818822', '21', '/static/img/wheelchair2.png', 'wym', '2019-12-12 00:32:02');
INSERT INTO `t_wheelchair` VALUES (41, '互邦HBLD2-E电动轮椅可折叠轻便携铝合金锂电池老年人残疾人轮椅代步车', '加宽轮椅，手动折叠', '20', 'HBLD2-E', 8, 30, '上海', '/static/img/wheelchair3.png', '互邦', '13817355618', '21', '/static/img/wheelchair3.png', '管理员', '2024-09-15 16:29:10');

SET FOREIGN_KEY_CHECKS = 1;

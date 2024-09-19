/*
 Navicat Premium Data Transfer

 Source Server         : dc
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : wheelchair

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 20/09/2024 03:20:53
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
INSERT INTO `t_chair` VALUES (31, 41, 0, 0, NULL, 'HBLD2-E-1');
INSERT INTO `t_chair` VALUES (32, 41, 0, 0, NULL, 'HBLD2-E-2');
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_delivery_order
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (25, 31, 12, '2024-09-20 02:54:27', '2024-09-21 02:54:19', 'test', 'test', '12345678909', 3);

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
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `orderStatus` int NOT NULL COMMENT '订单状态（例如“待处理”，“已处理”等）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`oID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `u_password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `u_phone_number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户注册手机号码，用于找回密码',
  `u_nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '昵称',
  PRIMARY KEY (`u_id`) USING BTREE,
  UNIQUE INDEX `uniq`(`u_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (3, 'wym', '123456', '13556730677', 'wym');
INSERT INTO `t_users` VALUES (11, 'lzk', 'lzk', '18320495603', '李先生');
INSERT INTO `t_users` VALUES (12, 'ysh', '123', '13818882922', 'am');

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
INSERT INTO `t_wheelchair` VALUES (30, '互邦HBLD2-E电动轮椅可折叠轻便携铝合金锂电池老年人残疾人轮椅代步车', '加宽轮椅，手动折叠', '20', 'HBLD2-E', 0, 30, '上海', 'http://localhost:8090/images/997b2cc4-fb5c-46da-b8da-82a6ab0de843.jpg', '碧桂园豪庭一期', '13813813800', '22', 'http://localhost:8090/images/b70a0eed-5182-4172-b9f3-d900f066097c.jpg~http://localhost:8090/images/5356fd0b-8ac9-4d39-adb4-c861b5522671.jpg~http://localhost:8090/images/1a6660f5-53b9-4498-aa50-f029af6bfd29.jpg~', 'wym', '2019-12-12 00:28:43');
INSERT INTO `t_wheelchair` VALUES (31, '迪护电动轮椅老人全自动越野轻便可折叠旅行便携式家用老年代步电动车专用智能可躺上飞机带坐便器DH-QBK12AQ', '小轮便携，手动折叠', '18', 'DH-QBK12AQ', 0, 40, '上海', 'http://localhost:8090/images/382f528c-59ee-4a4e-bb37-564b88e8489e.jpg', '虎门万达广场', '18818818822', '21', 'http://localhost:8090/images/92930fad-8fdb-4320-a66e-5189b9c66727.jpg~http://localhost:8090/images/c7f62778-a9b5-4832-b988-452f6ead0d9d.jpg~http://localhost:8090/images/1b33a1f3-a3e5-4f1f-8945-150581a6ee08.jpg~', 'wym', '2019-12-12 00:32:02');
INSERT INTO `t_wheelchair` VALUES (41, '互邦HBLD2-E电动轮椅可折叠轻便携铝合金锂电池老年人残疾人轮椅代步车', '加宽轮椅，手动折叠', '20', 'HBLD2-E', 10, 30, '上海', '', '互邦', '13817355618', '21', '', '管理员', '2024-09-15 16:29:10');

SET FOREIGN_KEY_CHECKS = 1;

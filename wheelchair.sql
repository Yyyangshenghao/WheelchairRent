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

 Date: 11/09/2024 22:36:52
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', '123');

-- ----------------------------
-- Table structure for t_chair
-- ----------------------------
DROP TABLE IF EXISTS `t_chair`;
CREATE TABLE `t_chair`  (
                            `c_id` int NOT NULL COMMENT '轮椅id',
                            `h_id` int NOT NULL COMMENT '品类id',
                            `status` int NOT NULL DEFAULT 1 COMMENT '当前状态',
                            `last_maintenance_date` datetime NULL DEFAULT NULL COMMENT '最近的保养或维修日期',
                            PRIMARY KEY (`c_id`) USING BTREE,
                            INDEX `h_id`(`h_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chair
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wheelchair
-- ----------------------------
INSERT INTO `t_wheelchair` VALUES (30, '互邦HBLD2-E电动轮椅可折叠轻便携铝合金锂电池老年人残疾人轮椅代步车', '加宽轮椅，手动折叠', '20', 'HBLD2-E', 0, 30, '上海', 'http://localhost:8090/images/997b2cc4-fb5c-46da-b8da-82a6ab0de843.jpg', '碧桂园豪庭一期', '13813813800', '22', 'http://localhost:8090/images/b70a0eed-5182-4172-b9f3-d900f066097c.jpg~http://localhost:8090/images/5356fd0b-8ac9-4d39-adb4-c861b5522671.jpg~http://localhost:8090/images/1a6660f5-53b9-4498-aa50-f029af6bfd29.jpg~', 'wym', '2019-12-12 00:28:43');
INSERT INTO `t_wheelchair` VALUES (31, '迪护电动轮椅老人全自动越野轻便可折叠旅行便携式家用老年代步电动车专用智能可躺上飞机带坐便器DH-QBK12AQ', '小轮便携，手动折叠', '18', 'DH-QBK12AQ', 0, 40, '上海', 'http://localhost:8090/images/382f528c-59ee-4a4e-bb37-564b88e8489e.jpg', '虎门万达广场', '18818818822', '21', 'http://localhost:8090/images/92930fad-8fdb-4320-a66e-5189b9c66727.jpg~http://localhost:8090/images/c7f62778-a9b5-4832-b988-452f6ead0d9d.jpg~http://localhost:8090/images/1b33a1f3-a3e5-4f1f-8945-150581a6ee08.jpg~', 'wym', '2019-12-12 00:32:02');
INSERT INTO `t_wheelchair` VALUES (32, '贝多适电动轮椅老人全自动越野轻便可折叠旅行便携式家用老年代步电动车专用智能可躺上飞机带坐便器BDS-12AQ', '带坐便，小轮便携，加宽轮椅', '20', 'BDS-12AQ', 0, 30, '上海', 'http://localhost:8090/images/70b4181c-b6c6-46be-9149-78b4a73b494d.jpg', '凯名轩', '16816816800', '30', 'http://localhost:8090/images/8ce42414-680f-438d-81c5-00b06514ad1d.jpg~http://localhost:8090/images/447f8686-d8f5-48b3-b2c3-09690abe2ae7.jpg~http://localhost:8090/images/bf6d7ced-f44f-4522-8bbb-0502ee921794.jpg~http://localhost:8090/images/d0f7319c-41b1-485f-a0e5-82d3c09ee5ef.jpg~http://localhost:8090/images/830a5fe1-5ece-4a7e-92c6-fab86410b757.jpg~', 'wym', '2019-12-12 00:36:46');
INSERT INTO `t_wheelchair` VALUES (33, '互邦HBLD2-E电动轮椅可折叠轻便携铝合金锂电池老年人残疾人轮椅代步车', '加宽轮椅，手动折叠', '20', 'HBLD2-E', 10, 30, '上海', '', '互邦', '13817355618', '21', '', '管理员', '2024-09-11 22:30:06');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
                            `o_id` int NOT NULL AUTO_INCREMENT COMMENT '订单id',
                            `c_id` int NULL DEFAULT NULL COMMENT '轮椅id',
                            `u_id` int NOT NULL COMMENT '用户id',
                            `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `order_user` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                            `order_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单状态',
                            PRIMARY KEY (`o_id`) USING BTREE,
                            INDEX `fk1`(`c_id` ASC) USING BTREE,
                            INDEX `fk2`(`u_id` ASC) USING BTREE,
                            CONSTRAINT `fk2` FOREIGN KEY (`u_id`) REFERENCES `t_users` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (3, 'wym', '123456', '13556730677', 'wym');
INSERT INTO `t_users` VALUES (11, 'lzk', 'lzk', '18320495603', '李先生');
INSERT INTO `t_users` VALUES (12, 'ysh', '123', '13818882922', 'am');

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 27/09/2024 15:29:03
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
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_chair
-- ----------------------------
INSERT INTO `t_chair` VALUES (31, 41, 1, 22, NULL, 'HBLD2-E-1');
INSERT INTO `t_chair` VALUES (32, 41, 1, 22, NULL, 'HBLD2-E-2');
INSERT INTO `t_chair` VALUES (33, 41, 1, 22, NULL, 'HBLD2-E-3');
INSERT INTO `t_chair` VALUES (34, 41, 1, 22, '2024-09-28 23:44:40', 'HBLD2-E-4');
INSERT INTO `t_chair` VALUES (35, 41, 1, 22, NULL, 'HBLD2-E-5');
INSERT INTO `t_chair` VALUES (36, 41, 1, 22, NULL, 'HBLD2-E-6');
INSERT INTO `t_chair` VALUES (37, 41, 0, 0, NULL, 'HBLD2-E-7');
INSERT INTO `t_chair` VALUES (38, 41, 0, 0, NULL, 'HBLD2-E-8');
INSERT INTO `t_chair` VALUES (39, 41, 0, 0, NULL, 'HBLD2-E-9');
INSERT INTO `t_chair` VALUES (40, 41, 0, 0, NULL, 'HBLD2-E-10');
INSERT INTO `t_chair` VALUES (41, 42, 0, 0, NULL, 'DH-QBK12AQ-1');
INSERT INTO `t_chair` VALUES (42, 42, 0, 0, NULL, 'DH-QBK12AQ-2');
INSERT INTO `t_chair` VALUES (43, 42, 0, 0, NULL, 'DH-QBK12AQ-3');
INSERT INTO `t_chair` VALUES (44, 42, 0, 0, NULL, 'DH-QBK12AQ-4');
INSERT INTO `t_chair` VALUES (45, 42, 0, 0, NULL, 'DH-QBK12AQ-5');
INSERT INTO `t_chair` VALUES (46, 42, 0, 0, '2024-09-24 23:44:56', 'DH-QBK12AQ-6');
INSERT INTO `t_chair` VALUES (47, 42, 0, 0, NULL, 'DH-QBK12AQ-7');
INSERT INTO `t_chair` VALUES (48, 42, 0, 0, NULL, 'DH-QBK12AQ-8');
INSERT INTO `t_chair` VALUES (49, 42, 0, 0, NULL, 'DH-QBK12AQ-9');
INSERT INTO `t_chair` VALUES (50, 42, 0, 0, NULL, 'DH-QBK12AQ-10');
INSERT INTO `t_chair` VALUES (51, 42, 0, 0, NULL, 'DH-QBK12AQ-11');
INSERT INTO `t_chair` VALUES (52, 42, 0, 0, NULL, 'DH-QBK12AQ-12');
INSERT INTO `t_chair` VALUES (53, 42, 0, 0, NULL, 'DH-QBK12AQ-13');
INSERT INTO `t_chair` VALUES (54, 42, 0, 0, NULL, 'DH-QBK12AQ-14');
INSERT INTO `t_chair` VALUES (55, 42, 0, 0, NULL, 'DH-QBK12AQ-15');
INSERT INTO `t_chair` VALUES (56, 42, 0, 0, NULL, 'DH-QBK12AQ-16');
INSERT INTO `t_chair` VALUES (57, 42, 0, 0, NULL, 'DH-QBK12AQ-17');
INSERT INTO `t_chair` VALUES (58, 42, 0, 0, NULL, 'DH-QBK12AQ-18');
INSERT INTO `t_chair` VALUES (59, 42, 0, 0, NULL, 'DH-QBK12AQ-19');
INSERT INTO `t_chair` VALUES (60, 42, 0, 0, NULL, 'DH-QBK12AQ-20');
INSERT INTO `t_chair` VALUES (61, 42, 0, 0, NULL, 'DH-QBK12AQ-21');
INSERT INTO `t_chair` VALUES (62, 42, 0, 0, NULL, 'DH-QBK12AQ-22');
INSERT INTO `t_chair` VALUES (63, 42, 0, 0, NULL, 'DH-QBK12AQ-23');
INSERT INTO `t_chair` VALUES (64, 42, 0, 0, NULL, 'DH-QBK12AQ-24');
INSERT INTO `t_chair` VALUES (65, 42, 0, 0, NULL, 'DH-QBK12AQ-25');
INSERT INTO `t_chair` VALUES (66, 42, 0, 0, NULL, 'DH-QBK12AQ-26');
INSERT INTO `t_chair` VALUES (67, 42, 0, 0, NULL, 'DH-QBK12AQ-27');
INSERT INTO `t_chair` VALUES (68, 42, 0, 0, NULL, 'DH-QBK12AQ-28');
INSERT INTO `t_chair` VALUES (69, 42, 0, 0, NULL, 'DH-QBK12AQ-29');
INSERT INTO `t_chair` VALUES (70, 42, 0, 0, NULL, 'DH-QBK12AQ-30');
INSERT INTO `t_chair` VALUES (71, 43, 0, 0, NULL, '简约-1');
INSERT INTO `t_chair` VALUES (72, 43, 0, 0, NULL, '简约-2');
INSERT INTO `t_chair` VALUES (73, 43, 0, 0, NULL, '简约-3');
INSERT INTO `t_chair` VALUES (74, 43, 0, 0, NULL, '简约-4');
INSERT INTO `t_chair` VALUES (75, 43, 0, 0, NULL, '简约-5');
INSERT INTO `t_chair` VALUES (76, 43, 0, 0, NULL, '简约-6');
INSERT INTO `t_chair` VALUES (77, 43, 0, 0, NULL, '简约-7');
INSERT INTO `t_chair` VALUES (78, 43, 0, 0, NULL, '简约-8');
INSERT INTO `t_chair` VALUES (79, 43, 0, 0, NULL, '简约-9');
INSERT INTO `t_chair` VALUES (80, 43, 0, 0, NULL, '简约-10');
INSERT INTO `t_chair` VALUES (81, 44, 0, 0, NULL, '红色-1');
INSERT INTO `t_chair` VALUES (82, 44, 0, 0, NULL, '红色-2');
INSERT INTO `t_chair` VALUES (83, 44, 0, 0, NULL, '红色-3');
INSERT INTO `t_chair` VALUES (84, 44, 0, 0, NULL, '红色-4');
INSERT INTO `t_chair` VALUES (85, 45, 0, 0, NULL, '1-1');
INSERT INTO `t_chair` VALUES (86, 46, 0, 0, NULL, '1-1');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `comment_id` int NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `u_id` int NOT NULL COMMENT '用户id',
  `o_id` int NOT NULL COMMENT '订单id',
  `c_id` int NOT NULL COMMENT '轮椅id',
  `rating` int NULL DEFAULT NULL COMMENT '评分',
  `comment_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论内容',
  `comment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, 20, 1, 30, 4, '轮椅质量很好，使用起来非常舒适。', '2023-05-11 10:00:00');
INSERT INTO `t_comment` VALUES (2, 21, 2, 31, 2, '配送非常及时，轮椅非常结实耐用。', '2023-06-21 12:30:00');
INSERT INTO `t_comment` VALUES (3, 22, 3, 41, 1, '轮椅有点重，但整体质量不错。', '2023-07-31 15:45:00');
INSERT INTO `t_comment` VALUES (4, 23, 4, 30, 5, '轮椅很好用，客服服务也很到位。', '2023-08-11 09:00:00');
INSERT INTO `t_comment` VALUES (5, 24, 5, 31, 3, '轮椅很新，但感觉座位不太舒适。', '2023-09-16 14:00:00');
INSERT INTO `t_comment` VALUES (6, 25, 6, 41, 4, '总体还不错，唯一不足是轮子有些卡顿。', '2023-10-21 16:00:00');
INSERT INTO `t_comment` VALUES (7, 26, 7, 30, 2, '使用体验非常好，值得推荐。', '2023-11-12 10:30:00');
INSERT INTO `t_comment` VALUES (8, 22, 61, 38, 5, '非常好轮椅，使我的双腿旋转。爱来自一卡斯特。', '2024-09-27 12:12:40');
INSERT INTO `t_comment` VALUES (9, 22, 61, 38, 4, '测试能不能评论两次。', '2024-09-27 12:12:54');
INSERT INTO `t_comment` VALUES (10, 22, 61, 38, 3, '测试能不能评论三次。', '2024-09-27 12:13:03');

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
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_delivery_order
-- ----------------------------
INSERT INTO `t_delivery_order` VALUES (49, 22, 31, 0, '广州市天河区', 'ysh', '12345678911', 0, '2024-09-01');
INSERT INTO `t_delivery_order` VALUES (50, 22, 32, 1, '广州市第二区', 'ysh', '12345678911', 0, '2024-09-02');
INSERT INTO `t_delivery_order` VALUES (51, 22, 33, 2, '广州市第三区', 'ysh', '12345678911', 0, '2024-09-03');
INSERT INTO `t_delivery_order` VALUES (52, 22, 34, 2, '广州市第四区', 'ysh', '12345678911', 0, '2024-09-04');
INSERT INTO `t_delivery_order` VALUES (53, 22, 35, 2, '广州市第五区', 'ysh', '12345678911', 0, '2024-09-05');
INSERT INTO `t_delivery_order` VALUES (54, 22, 36, 2, '广州市第六区', 'ysh', '12345678911', 0, '2024-09-06');
INSERT INTO `t_delivery_order` VALUES (55, 22, 37, 2, '广州市第七区', 'ysh', '12345678911', 0, '2024-09-07');
INSERT INTO `t_delivery_order` VALUES (56, 22, 38, 2, '广州市第八区', 'ysh', '12345678911', 0, '2024-09-08');
INSERT INTO `t_delivery_order` VALUES (57, 22, 36, 1, '广州市天河区', 'ysh', '12345678911', 1, '2024-09-28');
INSERT INTO `t_delivery_order` VALUES (58, 22, 37, 2, '广州市天河区', 'ysh', '12345678900', 1, '2024-09-30');
INSERT INTO `t_delivery_order` VALUES (59, 22, 38, 2, '广州市天河区', 'ysh', '12345678901', 1, '2024-09-27');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `o_id` int NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `c_id` int NOT NULL COMMENT '轮椅id',
  `u_id` int NOT NULL COMMENT '用户id',
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始日期',
  `end_date` datetime NULL DEFAULT NULL COMMENT '结束日期',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '姓名',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '地址',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '电话',
  `order_status` int NOT NULL COMMENT '订单状态\r\n0为订单结束，\r\n1为等待发货，\r\n2为等待收货，\r\n3为使用中，\r\n4为等待上门保养/维修，\r\n5为等待上门回收',
  `comment_status` int NOT NULL COMMENT '评论状态\r\n0为未评论，\r\n1为已评论',
  PRIMARY KEY (`o_id`) USING BTREE,
  INDEX `fk1`(`c_id` ASC) USING BTREE,
  INDEX `fk2`(`u_id` ASC) USING BTREE,
  CONSTRAINT `fk2` FOREIGN KEY (`u_id`) REFERENCES `t_users` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (54, 31, 22, '2024-09-01 00:00:00', NULL, 'ysh', '广州市天河区', '12345678911', 1, 0);
INSERT INTO `t_order` VALUES (55, 32, 22, '2024-09-02 00:00:00', NULL, 'ysh', '广州市第二区', '12345678911', 2, 0);
INSERT INTO `t_order` VALUES (56, 33, 22, '2024-09-03 00:00:00', NULL, 'ysh', '广州市第三区', '12345678911', 3, 0);
INSERT INTO `t_order` VALUES (57, 34, 22, '2024-09-04 00:00:00', NULL, 'ysh', '广州市第四区', '12345678911', 4, 0);
INSERT INTO `t_order` VALUES (58, 35, 22, '2024-09-05 00:00:00', NULL, 'ysh', '广州市第五区', '12345678911', 4, 0);
INSERT INTO `t_order` VALUES (59, 36, 22, '2024-09-06 00:00:00', NULL, 'ysh', '广州市第六区', '12345678911', 5, 0);
INSERT INTO `t_order` VALUES (60, 37, 22, '2024-09-07 00:00:00', '2024-09-30 00:00:00', 'ysh', '广州市第七区', '12345678911', 0, 1);
INSERT INTO `t_order` VALUES (61, 38, 22, '2024-09-08 00:00:00', '2024-09-27 00:00:00', 'ysh', '广州市第八区', '12345678911', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_repair_order
-- ----------------------------
INSERT INTO `t_repair_order` VALUES (9, 52, 'repair', '2024-10-03', 'TESTREPAIR', 'TEST', '13817355618', 8);
INSERT INTO `t_repair_order` VALUES (10, 53, 'repair', '2024-10-04', 'TEST', 'TEST', '12341234123', 8);
INSERT INTO `t_repair_order` VALUES (11, 57, 'repair', '2024-09-27', '广州市天河区', 'ysh', '12345678911', 0);
INSERT INTO `t_repair_order` VALUES (12, 58, 'maintenance', '2024-09-27', '广州市天河区', 'ysh', '12345678911', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1028 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `t_users` VALUES (28, '梁子韬', '5BmIpTEnUO', '2871799778', '梁子韬', 'M', '2002-10-26', 34);
INSERT INTO `t_users` VALUES (29, '韦致远', 'JY75ZACtQU', '211114987', '韦致远', 'M', '2015-03-12', 28);
INSERT INTO `t_users` VALUES (30, '张安琪', 'wDtJ2s850B', '76981751371', '张安琪', 'F', '2000-03-29', 98);
INSERT INTO `t_users` VALUES (31, '秦睿', 'h0qMJQ2ZcZ', '103405056', '秦睿', 'M', '2016-04-04', 29);
INSERT INTO `t_users` VALUES (32, '严子异', 'USuWdiz3ll', '16376876880', '严子异', 'M', '2003-06-01', 37);
INSERT INTO `t_users` VALUES (33, '孙子韬', 'aKw0yoTHWI', '19098484349', '孙子韬', 'M', '2021-09-06', 76);
INSERT INTO `t_users` VALUES (34, '魏子韬', 'ApSn0BAv8k', '7550189756', '魏子韬', 'M', '2004-08-26', 39);
INSERT INTO `t_users` VALUES (35, '江子异', 'wNMbHDd1p3', '2857101860', '江子异', 'M', '2013-01-10', 81);
INSERT INTO `t_users` VALUES (36, '江云熙', 'DouPn89BKg', '215026381', '江云熙', 'M', '2004-03-28', 41);
INSERT INTO `t_users` VALUES (37, '李岚', 'QjhSZHtvw0', '2064169867', '李岚', 'F', '2013-12-26', 24);
INSERT INTO `t_users` VALUES (38, '曹睿', 'RGa7hS7eC2', '7602606961', '曹睿', 'M', '2023-02-03', 31);
INSERT INTO `t_users` VALUES (39, '傅致远', 'a7sRiZj2J9', '1062507176', '傅致远', 'M', '2019-02-17', 42);
INSERT INTO `t_users` VALUES (40, '袁致远', 'QzvSNJ7u9V', '19212185230', '袁致远', 'M', '2019-10-20', 76);
INSERT INTO `t_users` VALUES (41, '史嘉伦', 'C9t6rEjOMG', '17373973328', '史嘉伦', 'M', '2017-05-04', 36);
INSERT INTO `t_users` VALUES (42, '王岚', 'Jlo3vlc8rM', '16001831893', '王岚', 'F', '2007-06-26', 87);
INSERT INTO `t_users` VALUES (43, '王子异', 'jyWbaDiJTi', '18688288152', '王子异', 'M', '2004-06-27', 61);
INSERT INTO `t_users` VALUES (44, '叶安琪', 'CBF8KSjboK', '18324344503', '叶安琪', 'F', '2003-05-18', 37);
INSERT INTO `t_users` VALUES (45, '崔致远', 'ewbHfRfW0I', '15201896492', '崔致远', 'M', '2013-01-12', 29);
INSERT INTO `t_users` VALUES (46, '邓岚', '8Rea6hlgcD', '14703954027', '邓岚', 'F', '2011-11-07', 26);
INSERT INTO `t_users` VALUES (47, '孟秀英', 'fUmCZckHCq', '207901473', '孟秀英', 'F', '2012-11-20', 95);
INSERT INTO `t_users` VALUES (48, '余晓明', 'yBGv8zYTFO', '17729444907', '余晓明', 'M', '2020-11-14', 69);
INSERT INTO `t_users` VALUES (49, '邓睿', 'vfpfiSSy48', '205103067', '邓睿', 'M', '2013-08-25', 81);
INSERT INTO `t_users` VALUES (50, '江宇宁', '4p2SHO1XIx', '13960261666', '江宇宁', 'M', '2016-07-18', 50);
INSERT INTO `t_users` VALUES (51, '黎璐', 'IJlHAdGtSj', '76994020844', '黎璐', 'F', '2014-07-01', 55);
INSERT INTO `t_users` VALUES (52, '段睿', 'r9LDiH56gP', '17488805311', '段睿', 'M', '2010-02-10', 98);
INSERT INTO `t_users` VALUES (53, '钱岚', 'fKjgZgEoP4', '206166319', '钱岚', 'F', '2005-08-07', 93);
INSERT INTO `t_users` VALUES (54, '石安琪', '8KNjqi7i9V', '1000823807', '石安琪', 'F', '2012-12-07', 36);
INSERT INTO `t_users` VALUES (55, '余子韬', 'gPy2xSJ5Sk', '13212839388', '余子韬', 'M', '2000-11-28', 41);
INSERT INTO `t_users` VALUES (56, '梁致远', 'izUttjFvfX', '208548864', '梁致远', 'M', '2001-01-20', 91);
INSERT INTO `t_users` VALUES (57, '邓安琪', 'MQIcaj6oLv', '15730077768', '邓安琪', 'F', '2007-10-08', 21);
INSERT INTO `t_users` VALUES (58, '张子异', 'jqfRfxbFpb', '14152993483', '张子异', 'M', '2020-09-24', 99);
INSERT INTO `t_users` VALUES (59, '陈子异', 'l1beTaYBQR', '15093068132', '陈子异', 'M', '2009-01-26', 74);
INSERT INTO `t_users` VALUES (60, '陈睿', 'JPxf6JoG6j', '75544963055', '陈睿', 'M', '2020-06-03', 24);
INSERT INTO `t_users` VALUES (61, '任岚', 'P71Pzr6vtL', '17372443126', '任岚', 'F', '2012-10-07', 20);
INSERT INTO `t_users` VALUES (62, '梁嘉伦', 'mK99BC6nzO', '219390920', '梁嘉伦', 'M', '2005-12-12', 71);
INSERT INTO `t_users` VALUES (63, '姚嘉伦', 'Rme20eonEY', '18675422610', '姚嘉伦', 'M', '2001-02-08', 37);
INSERT INTO `t_users` VALUES (64, '曾杰宏', 'Gs7AsS4X62', '18233379642', '曾杰宏', 'M', '2023-12-06', 54);
INSERT INTO `t_users` VALUES (65, '阎岚', 'nmG5EUowdW', '15474451299', '阎岚', 'F', '2003-04-22', 20);
INSERT INTO `t_users` VALUES (66, '彭杰宏', 'lS65ZVyKlJ', '2055612884', '彭杰宏', 'M', '2014-09-06', 30);
INSERT INTO `t_users` VALUES (67, '武致远', 'Ao7xFBo276', '2151577354', '武致远', 'M', '2021-03-09', 91);
INSERT INTO `t_users` VALUES (68, '郑宇宁', 'XzeiRi6S91', '7695764735', '郑宇宁', 'M', '2009-07-07', 55);
INSERT INTO `t_users` VALUES (69, '唐秀英', 'W02oTUf7vO', '18506381699', '唐秀英', 'F', '2023-03-17', 20);
INSERT INTO `t_users` VALUES (70, '薛秀英', 'djGewFHy9R', '7606674777', '薛秀英', 'F', '2007-11-15', 82);
INSERT INTO `t_users` VALUES (71, '邱宇宁', 'yBdPiYXEWX', '76976779327', '邱宇宁', 'M', '2005-04-12', 22);
INSERT INTO `t_users` VALUES (72, '秦震南', 'QNk35BDYc5', '15964820773', '秦震南', 'M', '2006-02-23', 47);
INSERT INTO `t_users` VALUES (73, '范詩涵', '3VI1Rfxums', '14766940397', '范詩涵', 'F', '2008-09-05', 93);
INSERT INTO `t_users` VALUES (74, '林云熙', 'dJnjKX3hph', '15755738177', '林云熙', 'M', '2013-09-16', 60);
INSERT INTO `t_users` VALUES (75, '龚杰宏', 'arlIni1Mpq', '7555759827', '龚杰宏', 'M', '2001-07-03', 73);
INSERT INTO `t_users` VALUES (76, '任震南', 'LkGSFDbd7L', '76062834185', '任震南', 'M', '2013-07-11', 87);
INSERT INTO `t_users` VALUES (77, '谢杰宏', 'nIgLMx1cS9', '17142607914', '谢杰宏', 'M', '2012-03-11', 62);
INSERT INTO `t_users` VALUES (78, '苏晓明', 'UTzBs0TRc8', '7606002083', '苏晓明', 'M', '2015-07-08', 71);
INSERT INTO `t_users` VALUES (79, '方致远', 'VzzpoLCDyz', '75512780893', '方致远', 'M', '2019-09-16', 69);
INSERT INTO `t_users` VALUES (80, '萧致远', 'acwX1u1Rdl', '7606219777', '萧致远', 'M', '2014-08-20', 47);
INSERT INTO `t_users` VALUES (81, '叶詩涵', '26CIsseXk6', '1063501479', '叶詩涵', 'F', '2011-07-14', 95);
INSERT INTO `t_users` VALUES (82, '徐震南', 'Gx6ok9Rqp3', '100548170', '徐震南', 'M', '2001-08-20', 83);
INSERT INTO `t_users` VALUES (83, '杜宇宁', 'Gjz0pKZiEy', '18289223425', '杜宇宁', 'M', '2011-03-03', 21);
INSERT INTO `t_users` VALUES (84, '金宇宁', 'khZyxtyyHm', '76930311916', '金宇宁', 'M', '2021-05-19', 28);
INSERT INTO `t_users` VALUES (85, '江震南', 'RhQ93xYemL', '76999485438', '江震南', 'M', '2023-07-25', 61);
INSERT INTO `t_users` VALUES (86, '梁安琪', 'gJuZ1hLJgQ', '17211577466', '梁安琪', 'F', '2001-07-27', 50);
INSERT INTO `t_users` VALUES (87, '邹子异', 'HnGvF0dKXt', '14205637255', '邹子异', 'M', '2024-08-22', 56);
INSERT INTO `t_users` VALUES (88, '毛璐', 'aDyRpUOXlY', '18378457779', '毛璐', 'F', '2000-08-15', 95);
INSERT INTO `t_users` VALUES (89, '周安琪', 'LfpYARJMYv', '17874762231', '周安琪', 'F', '2015-08-01', 32);
INSERT INTO `t_users` VALUES (90, '邹秀英', 'dTQdpJL2lJ', '15059401282', '邹秀英', 'F', '2021-04-18', 82);
INSERT INTO `t_users` VALUES (91, '廖秀英', 'rDozZP2Scp', '7695343595', '廖秀英', 'F', '2005-05-03', 53);
INSERT INTO `t_users` VALUES (92, '廖子异', 'cdcbsu0qBa', '19945434992', '廖子异', 'M', '2014-02-13', 34);
INSERT INTO `t_users` VALUES (93, '杨云熙', 'AESgs9bRIy', '200263074', '杨云熙', 'M', '2018-11-18', 77);
INSERT INTO `t_users` VALUES (94, '蔡安琪', '9imDCMSRBs', '75583735898', '蔡安琪', 'F', '2021-10-31', 25);
INSERT INTO `t_users` VALUES (95, '潘睿', 'A7SN8ZurZl', '2150257334', '潘睿', 'M', '2002-02-10', 98);
INSERT INTO `t_users` VALUES (96, '薛云熙', 'afkmSnuTP8', '15252442837', '薛云熙', 'M', '2024-03-15', 92);
INSERT INTO `t_users` VALUES (97, '冯秀英', 'HXg0qGhbeY', '1029544913', '冯秀英', 'F', '2007-06-29', 68);
INSERT INTO `t_users` VALUES (98, '叶杰宏', 'dZFqaEKW3M', '16713660186', '叶杰宏', 'M', '2003-04-28', 85);
INSERT INTO `t_users` VALUES (99, '宋秀英', 'DSdttiNUOw', '1068256247', '宋秀英', 'F', '2022-08-29', 38);
INSERT INTO `t_users` VALUES (100, '向云熙', 'zGRm0bBSz2', '76938780443', '向云熙', 'M', '2008-12-02', 23);
INSERT INTO `t_users` VALUES (101, '夏璐', 'pBttvUZfUK', '17507959133', '夏璐', 'F', '2014-11-30', 72);
INSERT INTO `t_users` VALUES (102, '吕岚', 'RJsGySJyB9', '7693660157', '吕岚', 'F', '2004-02-13', 76);
INSERT INTO `t_users` VALUES (103, '方宇宁', 'zba8HXmnnZ', '1061101887', '方宇宁', 'M', '2007-07-02', 93);
INSERT INTO `t_users` VALUES (104, '马詩涵', 'Ty6IVR6PY4', '18692079775', '马詩涵', 'F', '2020-10-25', 26);
INSERT INTO `t_users` VALUES (105, '范晓明', '1axxlb68vD', '17560035036', '范晓明', 'M', '2006-05-24', 25);
INSERT INTO `t_users` VALUES (106, '邓震南', 'HhnfNWHRBV', '18747640353', '邓震南', 'M', '2007-06-24', 61);
INSERT INTO `t_users` VALUES (107, '周晓明', 'oOFqqI9oor', '16144188466', '周晓明', 'M', '2024-04-16', 54);
INSERT INTO `t_users` VALUES (108, '杨安琪', 'u671RfpBGZ', '16998691106', '杨安琪', 'F', '2014-09-14', 93);
INSERT INTO `t_users` VALUES (109, '潘杰宏', 'ibJ6iFfIw5', '18042775626', '潘杰宏', 'M', '2022-04-12', 28);
INSERT INTO `t_users` VALUES (110, '刘詩涵', 'KxwUwVDlhJ', '14667255974', '刘詩涵', 'F', '2013-01-31', 44);
INSERT INTO `t_users` VALUES (111, '曹子异', 'yPQgmwSIgU', '17409684190', '曹子异', 'M', '2004-01-11', 67);
INSERT INTO `t_users` VALUES (112, '夏安琪', 'EX55zTfNHh', '75507105498', '夏安琪', 'F', '2022-10-21', 43);
INSERT INTO `t_users` VALUES (113, '钟致远', 'lP3fhjZiPq', '1065112972', '钟致远', 'M', '2005-08-29', 70);
INSERT INTO `t_users` VALUES (114, '杨杰宏', 'RWKR9TEnT2', '214955430', '杨杰宏', 'M', '2004-08-13', 76);
INSERT INTO `t_users` VALUES (115, '尹震南', 'A7sZrt3Bao', '7550023185', '尹震南', 'M', '2013-07-25', 76);
INSERT INTO `t_users` VALUES (116, '钟宇宁', 'hWnuLNeZ8D', '17990385769', '钟宇宁', 'M', '2019-03-23', 59);
INSERT INTO `t_users` VALUES (117, '向安琪', 'MzXb6Cnvyy', '7695685122', '向安琪', 'F', '2009-04-25', 53);
INSERT INTO `t_users` VALUES (118, '田杰宏', 'mXfnjDEBxP', '13741494847', '田杰宏', 'M', '2011-01-30', 89);
INSERT INTO `t_users` VALUES (119, '丁睿', 'WPGAZq4lN5', '17652099782', '丁睿', 'M', '2020-12-17', 37);
INSERT INTO `t_users` VALUES (120, '吴子韬', 'hPThmMvBN8', '19877415443', '吴子韬', 'M', '2013-03-07', 72);
INSERT INTO `t_users` VALUES (121, '熊璐', 'Z734DWgSzD', '7609911286', '熊璐', 'F', '2005-12-16', 73);
INSERT INTO `t_users` VALUES (122, '马震南', 'vjfyMWjyBz', '14280780805', '马震南', 'M', '2016-03-23', 89);
INSERT INTO `t_users` VALUES (123, '汤璐', '2csRS4LrCm', '15366201039', '汤璐', 'F', '2010-01-30', 21);
INSERT INTO `t_users` VALUES (124, '段秀英', 'U5FzPsrEme', '15129439120', '段秀英', 'F', '2021-12-03', 67);
INSERT INTO `t_users` VALUES (125, '顾云熙', 'U0oMnU5vox', '75585713069', '顾云熙', 'M', '2024-01-24', 29);
INSERT INTO `t_users` VALUES (126, '张杰宏', 'udNS1iPDx7', '75514144767', '张杰宏', 'M', '2022-04-25', 53);
INSERT INTO `t_users` VALUES (127, '王杰宏', 'ZcIdsGN5Oy', '202964367', '王杰宏', 'M', '2000-04-16', 25);
INSERT INTO `t_users` VALUES (128, '王安琪', 'uK4STHZlc5', '17608815482', '王安琪', 'F', '2006-04-30', 39);
INSERT INTO `t_users` VALUES (129, '吕秀英', 'GG3kIev180', '14997872793', '吕秀英', 'F', '2007-05-09', 71);
INSERT INTO `t_users` VALUES (130, '钟杰宏', '7Y7b3sdxBz', '2864923923', '钟杰宏', 'M', '2018-02-22', 84);
INSERT INTO `t_users` VALUES (131, '郑詩涵', 'AH02cW6CSW', '16257598502', '郑詩涵', 'F', '2012-10-09', 36);
INSERT INTO `t_users` VALUES (132, '郝安琪', 'JFyfSWeX2h', '215235288', '郝安琪', 'F', '2009-07-17', 79);
INSERT INTO `t_users` VALUES (133, '吕嘉伦', 'wLPyufmbVQ', '16687459723', '吕嘉伦', 'M', '2016-12-25', 65);
INSERT INTO `t_users` VALUES (134, '雷詩涵', 'MLXcL3lrxT', '15208945185', '雷詩涵', 'F', '2005-07-14', 20);
INSERT INTO `t_users` VALUES (135, '魏致远', 'fuX1TTZIOv', '2108527470', '魏致远', 'M', '2013-01-24', 40);
INSERT INTO `t_users` VALUES (136, '姜杰宏', '2k6EcTc1Ty', '76933810664', '姜杰宏', 'M', '2012-07-10', 82);
INSERT INTO `t_users` VALUES (137, '韦岚', '8hk0rxyCD3', '76901632522', '韦岚', 'F', '2009-09-13', 83);
INSERT INTO `t_users` VALUES (138, '雷晓明', 'Yef8dXWkhL', '1083665459', '雷晓明', 'M', '2000-01-04', 82);
INSERT INTO `t_users` VALUES (139, '余安琪', 'BT4YVkzPr5', '203197285', '余安琪', 'F', '2011-05-16', 24);
INSERT INTO `t_users` VALUES (140, '林睿', 't7mxEDY7X3', '75522763471', '林睿', 'M', '2019-02-27', 67);
INSERT INTO `t_users` VALUES (141, '王睿', 'aswq1OPXMr', '17247452039', '王睿', 'M', '2018-01-18', 74);
INSERT INTO `t_users` VALUES (142, '郝晓明', 'yeQ5LiBA73', '7609340948', '郝晓明', 'M', '2022-06-22', 43);
INSERT INTO `t_users` VALUES (143, '郭杰宏', '0qW0QsfPLk', '19026620864', '郭杰宏', 'M', '2020-10-10', 89);
INSERT INTO `t_users` VALUES (144, '魏云熙', 'Dd9ae5HLT7', '18291779650', '魏云熙', 'M', '2010-10-25', 54);
INSERT INTO `t_users` VALUES (145, '李晓明', 'aumMMl03Af', '16477860141', '李晓明', 'M', '2000-11-15', 65);
INSERT INTO `t_users` VALUES (147, '夏嘉伦', 'R2MtIhY4Ab', '13139537784', '夏嘉伦', 'M', '2001-08-24', 92);
INSERT INTO `t_users` VALUES (148, '陈岚', 'Ye0eZvZQpa', '14254769107', '陈岚', 'F', '2017-06-12', 64);
INSERT INTO `t_users` VALUES (149, '钱詩涵', 'I3Qw0cdfro', '2868161611', '钱詩涵', 'F', '2017-11-13', 54);
INSERT INTO `t_users` VALUES (150, '胡璐', 'H1COTGTGNN', '76063815490', '胡璐', 'F', '2006-11-29', 95);
INSERT INTO `t_users` VALUES (151, '阎睿', 'ajC8dOnVMb', '2036617959', '阎睿', 'M', '2023-06-04', 27);
INSERT INTO `t_users` VALUES (152, '郑安琪', '5cXldfCAY2', '16078886076', '郑安琪', 'F', '2003-07-04', 52);
INSERT INTO `t_users` VALUES (153, '潘云熙', 'Kz44NhJnqR', '19655549404', '潘云熙', 'M', '2010-09-02', 49);
INSERT INTO `t_users` VALUES (154, '沈云熙', '9wERdutK8y', '14154985688', '沈云熙', 'M', '2010-06-11', 30);
INSERT INTO `t_users` VALUES (155, '杨晓明', '1AUpVQ0tkj', '104136457', '杨晓明', 'M', '2016-04-16', 36);
INSERT INTO `t_users` VALUES (156, '严璐', 'UIPKjgGmXv', '76914183560', '严璐', 'F', '2024-09-18', 82);
INSERT INTO `t_users` VALUES (158, '周璐', 'HHGieGJVZP', '13959940764', '周璐', 'F', '2016-11-19', 73);
INSERT INTO `t_users` VALUES (160, '廖致远', 'g5WCR7A2qt', '16546265495', '廖致远', 'M', '2022-02-25', 35);
INSERT INTO `t_users` VALUES (161, '吕杰宏', 'o6XLpy7ICO', '17449881332', '吕杰宏', 'M', '2020-02-12', 64);
INSERT INTO `t_users` VALUES (162, '段岚', 'MwhRp0en9o', '285708150', '段岚', 'F', '2005-05-22', 28);
INSERT INTO `t_users` VALUES (163, '汤晓明', 'H0lHJd2EzE', '76070148625', '汤晓明', 'M', '2017-06-03', 31);
INSERT INTO `t_users` VALUES (164, '于詩涵', 'Oxi0Q9Ifjm', '214241505', '于詩涵', 'F', '2013-06-02', 36);
INSERT INTO `t_users` VALUES (165, '任子韬', '0SDk4cYjSy', '16259647354', '任子韬', 'M', '2014-04-05', 24);
INSERT INTO `t_users` VALUES (166, '常杰宏', 'DQr28b1LNo', '18460616365', '常杰宏', 'M', '2017-12-26', 35);
INSERT INTO `t_users` VALUES (167, '徐睿', 'M8v6mnT5zy', '14694220155', '徐睿', 'M', '2000-06-13', 80);
INSERT INTO `t_users` VALUES (168, '冯震南', 'lU44roiyUD', '2146682937', '冯震南', 'M', '2010-05-17', 57);
INSERT INTO `t_users` VALUES (169, '黄安琪', 'uhhYEfqiib', '17422501697', '黄安琪', 'F', '2023-10-27', 20);
INSERT INTO `t_users` VALUES (170, '吕宇宁', '2PTHtaVaHV', '7559835584', '吕宇宁', 'M', '2022-02-18', 39);
INSERT INTO `t_users` VALUES (171, '钱睿', 'zMWr3dyuhW', '206078688', '钱睿', 'M', '2004-04-25', 43);
INSERT INTO `t_users` VALUES (172, '魏詩涵', 'AEWOHwiWPy', '204735844', '魏詩涵', 'F', '2012-04-29', 53);
INSERT INTO `t_users` VALUES (173, '韩詩涵', 'f5JhSHJc9Z', '7691703978', '韩詩涵', 'F', '2007-02-20', 92);
INSERT INTO `t_users` VALUES (174, '尹致远', '2OdXzNWZFt', '17045073392', '尹致远', 'M', '2015-08-07', 50);
INSERT INTO `t_users` VALUES (175, '周震南', '7yGHJl6u3S', '2081014205', '周震南', 'M', '2017-12-21', 78);
INSERT INTO `t_users` VALUES (176, '潘嘉伦', 'PceJuW2d8S', '76904593254', '潘嘉伦', 'M', '2022-05-12', 34);
INSERT INTO `t_users` VALUES (178, '卢子韬', 'i5StRWHt7U', '18937647707', '卢子韬', 'M', '2014-11-28', 90);
INSERT INTO `t_users` VALUES (179, '贾璐', 'adRRuBcN1g', '7556901939', '贾璐', 'F', '2018-02-06', 22);
INSERT INTO `t_users` VALUES (180, '夏秀英', '2aditY9QyB', '16012996396', '夏秀英', 'F', '2012-12-13', 69);
INSERT INTO `t_users` VALUES (181, '廖杰宏', 'TbAOWj52qP', '76941630690', '廖杰宏', 'M', '2003-06-10', 85);
INSERT INTO `t_users` VALUES (182, '汪睿', 'PL3iagwWml', '17848804785', '汪睿', 'M', '2024-06-12', 31);
INSERT INTO `t_users` VALUES (183, '彭睿', 'VgU52EqngI', '13097746672', '彭睿', 'M', '2007-11-19', 61);
INSERT INTO `t_users` VALUES (184, '侯晓明', 'ti1xKQKJjG', '15479982124', '侯晓明', 'M', '2018-07-10', 86);
INSERT INTO `t_users` VALUES (185, '阎宇宁', 'HuYVLwfACy', '7602928402', '阎宇宁', 'M', '2022-03-20', 71);
INSERT INTO `t_users` VALUES (186, '罗秀英', 'tH933x7qfi', '15626321571', '罗秀英', 'F', '2018-05-08', 35);
INSERT INTO `t_users` VALUES (187, '杨岚', 'QzU5wf4AsZ', '19048585721', '杨岚', 'F', '2019-03-28', 71);
INSERT INTO `t_users` VALUES (188, '叶子韬', '9PhrJm5srW', '19270074679', '叶子韬', 'M', '2011-01-05', 48);
INSERT INTO `t_users` VALUES (189, '冯岚', 'ueDi9OD0iJ', '13070650158', '冯岚', 'F', '2021-01-21', 58);
INSERT INTO `t_users` VALUES (190, '段宇宁', 'Ea7eEDZ96R', '75535278876', '段宇宁', 'M', '2004-12-06', 25);
INSERT INTO `t_users` VALUES (191, '邵云熙', 'BWuqTy3wKx', '207284570', '邵云熙', 'M', '2011-05-09', 36);
INSERT INTO `t_users` VALUES (192, '杜秀英', 'fB8oEzvsA2', '7698031556', '杜秀英', 'F', '2011-02-09', 80);
INSERT INTO `t_users` VALUES (194, '杨詩涵', 'owNRRcqyK2', '18854172919', '杨詩涵', 'F', '2006-06-03', 92);
INSERT INTO `t_users` VALUES (195, '曾晓明', 'r5yjWE20hg', '2075767699', '曾晓明', 'M', '2003-12-19', 81);
INSERT INTO `t_users` VALUES (196, '吕安琪', 'ByDY8vMSHU', '16628628014', '吕安琪', 'F', '2010-05-27', 46);
INSERT INTO `t_users` VALUES (197, '黄震南', 'kjLW8koM8m', '288270700', '黄震南', 'M', '2008-09-26', 60);
INSERT INTO `t_users` VALUES (198, '夏致远', '4DrmfIAR5d', '76998264210', '夏致远', 'M', '2012-09-16', 55);
INSERT INTO `t_users` VALUES (199, '朱安琪', 'CQIxKJ4VlI', '105850650', '朱安琪', 'F', '2009-07-25', 95);
INSERT INTO `t_users` VALUES (200, '方璐', 'YDsui5K08p', '1012289767', '方璐', 'F', '2019-08-09', 88);
INSERT INTO `t_users` VALUES (201, '梁震南', '6rJJzlBCTV', '19930016190', '梁震南', 'M', '2012-07-23', 68);
INSERT INTO `t_users` VALUES (202, '韩安琪', 'fZ8S8IGgTr', '2132301060', '韩安琪', 'F', '2014-08-15', 23);
INSERT INTO `t_users` VALUES (203, '戴嘉伦', 'VYaTkdyUXU', '15686640106', '戴嘉伦', 'M', '2021-03-16', 40);
INSERT INTO `t_users` VALUES (204, '吴杰宏', '5qEBS5h7Gg', '17798330377', '吴杰宏', 'M', '2017-07-22', 54);
INSERT INTO `t_users` VALUES (205, '龙子韬', 'DcoWEYOm6F', '7609083882', '龙子韬', 'M', '2006-11-14', 69);
INSERT INTO `t_users` VALUES (206, '史秀英', 'Xi4mXmaIfI', '7603107164', '史秀英', 'F', '2004-10-21', 94);
INSERT INTO `t_users` VALUES (207, '吴秀英', '2ZKfwVJMIh', '76913971504', '吴秀英', 'F', '2008-04-22', 80);
INSERT INTO `t_users` VALUES (208, '杜杰宏', 'Xz8bqspXtA', '18040566013', '杜杰宏', 'M', '2000-08-25', 90);
INSERT INTO `t_users` VALUES (209, '周宇宁', '0xKzhjlCTD', '19623181361', '周宇宁', 'M', '2005-06-27', 73);
INSERT INTO `t_users` VALUES (210, '邵安琪', 'qSVT5twL3f', '2807075559', '邵安琪', 'F', '2002-08-02', 38);
INSERT INTO `t_users` VALUES (211, '钟睿', '7bKotLDE4T', '2091414878', '钟睿', 'M', '2019-05-19', 55);
INSERT INTO `t_users` VALUES (212, '蒋致远', 'uCvOqI31qr', '7550535741', '蒋致远', 'M', '2011-06-15', 86);
INSERT INTO `t_users` VALUES (213, '贺睿', 'MvrIRId2G1', '76941706750', '贺睿', 'M', '2022-06-09', 63);
INSERT INTO `t_users` VALUES (215, '许云熙', 'zUcHMjsSJd', '19616763547', '许云熙', 'M', '2019-08-05', 68);
INSERT INTO `t_users` VALUES (216, '方睿', 'Nq6EQRsgro', '14584738260', '方睿', 'M', '2006-09-18', 96);
INSERT INTO `t_users` VALUES (217, '顾睿', 'yReZ9mKjxe', '2186222107', '顾睿', 'M', '2008-12-31', 50);
INSERT INTO `t_users` VALUES (218, '薛詩涵', 'lhyorj3SNE', '75588132488', '薛詩涵', 'F', '2009-10-26', 52);
INSERT INTO `t_users` VALUES (219, '孔秀英', 'ONACHxUB3O', '75572994529', '孔秀英', 'F', '2019-05-10', 27);
INSERT INTO `t_users` VALUES (220, '胡云熙', 'y9gsfr0wt7', '14963685445', '胡云熙', 'M', '2009-05-13', 32);
INSERT INTO `t_users` VALUES (221, '邹宇宁', 'tjwLZJRJGM', '103797139', '邹宇宁', 'M', '2008-08-26', 20);
INSERT INTO `t_users` VALUES (222, '谭岚', 'XZ28qVh6BN', '201787090', '谭岚', 'F', '2020-05-21', 90);
INSERT INTO `t_users` VALUES (223, '苏杰宏', 'bRaGHdklde', '2159848162', '苏杰宏', 'M', '2001-03-18', 43);
INSERT INTO `t_users` VALUES (224, '姜子异', '3loG1MV58F', '14351426506', '姜子异', 'M', '2011-11-23', 47);
INSERT INTO `t_users` VALUES (225, '韦安琪', 'sZyu2GzAmc', '14372996556', '韦安琪', 'F', '2023-04-22', 48);
INSERT INTO `t_users` VALUES (226, '陆詩涵', 'wrh9DzCb7F', '16160401517', '陆詩涵', 'F', '2012-04-08', 26);
INSERT INTO `t_users` VALUES (227, '秦云熙', 'lfd4GcpSrT', '7605056531', '秦云熙', 'M', '2007-09-22', 92);
INSERT INTO `t_users` VALUES (228, '罗嘉伦', '00ucn33BPq', '19123799002', '罗嘉伦', 'M', '2002-05-29', 87);
INSERT INTO `t_users` VALUES (229, '赵嘉伦', 'cnStiqRAWr', '104951091', '赵嘉伦', 'M', '2024-03-31', 65);
INSERT INTO `t_users` VALUES (230, '程晓明', '7YZAcJsvwk', '15104080693', '程晓明', 'M', '2006-10-17', 87);
INSERT INTO `t_users` VALUES (231, '何嘉伦', 'FsYFFBpE69', '7692540645', '何嘉伦', 'M', '2019-09-20', 95);
INSERT INTO `t_users` VALUES (232, '何杰宏', 'P0E3VHJ3my', '14915775959', '何杰宏', 'M', '2015-07-29', 52);
INSERT INTO `t_users` VALUES (233, '向璐', 'vROPzqMQdS', '19402564057', '向璐', 'F', '2014-02-01', 81);
INSERT INTO `t_users` VALUES (234, '邹睿', 'd5LWRWPNFy', '289133475', '邹睿', 'M', '2013-05-28', 62);
INSERT INTO `t_users` VALUES (235, '尹詩涵', 'Hk21nvHwhF', '2146194332', '尹詩涵', 'F', '2001-05-16', 77);
INSERT INTO `t_users` VALUES (236, '钱云熙', 'shaOhE9kUW', '2114750404', '钱云熙', 'M', '2006-12-08', 35);
INSERT INTO `t_users` VALUES (237, '戴睿', 'USe6qCpLld', '17850127719', '戴睿', 'M', '2015-06-12', 80);
INSERT INTO `t_users` VALUES (238, '郝云熙', 'lYnQu2yu7k', '103421850', '郝云熙', 'M', '2023-02-24', 82);
INSERT INTO `t_users` VALUES (239, '刘岚', 'Gvwy9fgDrx', '1074368067', '刘岚', 'F', '2014-06-04', 52);
INSERT INTO `t_users` VALUES (240, '冯璐', 'TmD9Z441zn', '17261375341', '冯璐', 'F', '2007-11-12', 94);
INSERT INTO `t_users` VALUES (241, '邱秀英', 'NEfjWC8SCf', '286801443', '邱秀英', 'F', '2008-02-24', 42);
INSERT INTO `t_users` VALUES (242, '沈震南', 'sgN7tfdSTh', '7604999954', '沈震南', 'M', '2012-07-02', 80);
INSERT INTO `t_users` VALUES (243, '谢子异', 'NeF8RzAz6v', '17614844645', '谢子异', 'M', '2010-10-02', 34);
INSERT INTO `t_users` VALUES (244, '戴子异', 'Vx8RazJbBa', '17973718337', '戴子异', 'M', '2006-05-27', 91);
INSERT INTO `t_users` VALUES (245, '郑晓明', 'xpV9s4DPLv', '15437333725', '郑晓明', 'M', '2003-06-18', 68);
INSERT INTO `t_users` VALUES (246, '杨子韬', 'PGu21izlhI', '17546194758', '杨子韬', 'M', '2015-01-29', 98);
INSERT INTO `t_users` VALUES (247, '夏子异', 'dXAHIBIuZc', '15350964513', '夏子异', 'M', '2016-05-20', 34);
INSERT INTO `t_users` VALUES (248, '戴岚', 'unCWwiVfw6', '76982987741', '戴岚', 'F', '2008-03-27', 71);
INSERT INTO `t_users` VALUES (249, '林秀英', 'd2BP1SbAIW', '7550312927', '林秀英', 'F', '2004-04-29', 90);
INSERT INTO `t_users` VALUES (250, '姚詩涵', '2pGWPP9KhO', '18842347849', '姚詩涵', 'F', '2023-10-03', 79);
INSERT INTO `t_users` VALUES (251, '邓宇宁', 'wix7iCXZhg', '14277889364', '邓宇宁', 'M', '2013-04-15', 55);
INSERT INTO `t_users` VALUES (252, '吕睿', 'HQIluwc4J9', '15987423679', '吕睿', 'M', '2006-07-30', 46);
INSERT INTO `t_users` VALUES (253, '史子韬', 'ZASbQpkDD6', '14501210136', '史子韬', 'M', '2002-10-22', 71);
INSERT INTO `t_users` VALUES (254, '姚秀英', 'PmNKkrS2xM', '16972977145', '姚秀英', 'F', '2002-11-29', 98);
INSERT INTO `t_users` VALUES (255, '陶秀英', 'G0GlIYOs7J', '7558630209', '陶秀英', 'F', '2002-03-07', 22);
INSERT INTO `t_users` VALUES (256, '宋宇宁', 'EuzLnQ7niF', '17810293789', '宋宇宁', 'M', '2023-10-04', 78);
INSERT INTO `t_users` VALUES (257, '邹璐', 'blntwin4ke', '7551077940', '邹璐', 'F', '2020-03-17', 74);
INSERT INTO `t_users` VALUES (258, '曾宇宁', 'GCZndKz3Jd', '16689495265', '曾宇宁', 'M', '2017-01-10', 73);
INSERT INTO `t_users` VALUES (259, '汪杰宏', 'K7nUqgwd7M', '2005695600', '汪杰宏', 'M', '2003-01-02', 20);
INSERT INTO `t_users` VALUES (260, '黎子异', 'v6MAQTCMPl', '17465962937', '黎子异', 'M', '2016-05-22', 92);
INSERT INTO `t_users` VALUES (261, '马秀英', 'CnCFR2ZIjw', '16171330048', '马秀英', 'F', '2020-05-25', 59);
INSERT INTO `t_users` VALUES (262, '韩睿', 'XuuxKTkfPJ', '13093038578', '韩睿', 'M', '2015-06-17', 39);
INSERT INTO `t_users` VALUES (263, '魏子异', 'znMRoPVWSP', '2127935347', '魏子异', 'M', '2008-03-09', 75);
INSERT INTO `t_users` VALUES (264, '胡安琪', 'U0HQPRdqGb', '15975980743', '胡安琪', 'F', '2023-10-11', 99);
INSERT INTO `t_users` VALUES (265, '孔子韬', 'ZAdTc2HMuF', '76024282576', '孔子韬', 'M', '2003-12-27', 44);
INSERT INTO `t_users` VALUES (266, '程子异', 'vuRcWO7WWx', '14279260320', '程子异', 'M', '2007-12-21', 43);
INSERT INTO `t_users` VALUES (267, '金詩涵', 'FuH9S1zXKx', '16095279723', '金詩涵', 'F', '2022-08-21', 68);
INSERT INTO `t_users` VALUES (268, '蒋秀英', '8g3rPfKEfe', '16631655989', '蒋秀英', 'F', '2007-04-24', 48);
INSERT INTO `t_users` VALUES (269, '卢震南', 'ylfmawtGOK', '213839174', '卢震南', 'M', '2002-05-28', 73);
INSERT INTO `t_users` VALUES (270, '陈安琪', 'TubCHjH8IX', '7558905499', '陈安琪', 'F', '2012-06-26', 68);
INSERT INTO `t_users` VALUES (271, '程睿', 'tA5LiapwAn', '283646145', '程睿', 'M', '2021-07-21', 41);
INSERT INTO `t_users` VALUES (272, '余詩涵', '0nVcw2JpQY', '204156371', '余詩涵', 'F', '2001-05-13', 88);
INSERT INTO `t_users` VALUES (273, '莫璐', 'btGH7ySMic', '7558488634', '莫璐', 'F', '2021-07-06', 39);
INSERT INTO `t_users` VALUES (274, '郭璐', '2pIOJD7OQS', '2071325373', '郭璐', 'F', '2005-09-22', 62);
INSERT INTO `t_users` VALUES (275, '梁璐', 'ZXQp3qMvn8', '17737536623', '梁璐', 'F', '2000-03-25', 68);
INSERT INTO `t_users` VALUES (276, '曾詩涵', 'F5D4YdZcMu', '18251721519', '曾詩涵', 'F', '2017-04-24', 25);
INSERT INTO `t_users` VALUES (277, '萧安琪', 'uTX34F5Wfl', '13099984620', '萧安琪', 'F', '2011-02-25', 73);
INSERT INTO `t_users` VALUES (278, '熊子韬', 'bbkMxh7jF9', '210749214', '熊子韬', 'M', '2018-03-29', 98);
INSERT INTO `t_users` VALUES (279, '贾嘉伦', 'zyKGSMoZhM', '13085111190', '贾嘉伦', 'M', '2008-02-09', 85);
INSERT INTO `t_users` VALUES (280, '郑子异', 'OAHY5dlfaI', '1056866023', '郑子异', 'M', '2002-01-26', 23);
INSERT INTO `t_users` VALUES (281, '顾璐', '7xXd3r9toA', '15079118661', '顾璐', 'F', '2004-09-29', 84);
INSERT INTO `t_users` VALUES (282, '李震南', 'KeEq8hd90K', '13069154028', '李震南', 'M', '2007-09-04', 59);
INSERT INTO `t_users` VALUES (283, '潘致远', 'wMA40m3wpd', '76078338554', '潘致远', 'M', '2003-05-16', 65);
INSERT INTO `t_users` VALUES (284, '曾安琪', 'W1kIdUQBY9', '15164591220', '曾安琪', 'F', '2002-10-27', 38);
INSERT INTO `t_users` VALUES (285, '段晓明', 'fxIjWGdCYw', '76081111633', '段晓明', 'M', '2002-05-21', 72);
INSERT INTO `t_users` VALUES (286, '莫岚', '4YnpUFAbSv', '14362282060', '莫岚', 'F', '2019-11-14', 58);
INSERT INTO `t_users` VALUES (287, '汤岚', 'b6tJ5uF5Vh', '76086359579', '汤岚', 'F', '2007-12-02', 56);
INSERT INTO `t_users` VALUES (288, '戴震南', 'bLJVgTdXDe', '7699210442', '戴震南', 'M', '2012-12-29', 98);
INSERT INTO `t_users` VALUES (289, '宋睿', '0G03Eer9P1', '16404003697', '宋睿', 'M', '2017-01-16', 49);
INSERT INTO `t_users` VALUES (290, '沈晓明', 'RBSWVcQBLP', '15821721002', '沈晓明', 'M', '2023-12-02', 69);
INSERT INTO `t_users` VALUES (291, '马宇宁', 'MaMkDbFomp', '76041455374', '马宇宁', 'M', '2000-10-02', 48);
INSERT INTO `t_users` VALUES (292, '卢睿', 'Q0qil6gr2p', '1048603128', '卢睿', 'M', '2012-01-19', 57);
INSERT INTO `t_users` VALUES (293, '陶致远', 'eJHSF7HROF', '1030885775', '陶致远', 'M', '2023-11-19', 30);
INSERT INTO `t_users` VALUES (294, '常云熙', 'lZDojrcAeW', '17894548158', '常云熙', 'M', '2001-11-06', 75);
INSERT INTO `t_users` VALUES (295, '冯宇宁', 'JrAF2i5LNq', '14134660734', '冯宇宁', 'M', '2023-04-14', 35);
INSERT INTO `t_users` VALUES (296, '宋震南', 'LASUWThZfu', '7693413305', '宋震南', 'M', '2006-03-27', 32);
INSERT INTO `t_users` VALUES (297, '宋岚', 'znTtaKhxuK', '17563386583', '宋岚', 'F', '2011-11-13', 94);
INSERT INTO `t_users` VALUES (298, '刘云熙', 'na5ZYWnbQE', '19231045468', '刘云熙', 'M', '2004-06-14', 61);
INSERT INTO `t_users` VALUES (299, '于秀英', 'LrPRHB3kio', '203899077', '于秀英', 'F', '2011-10-02', 87);
INSERT INTO `t_users` VALUES (300, '谢睿', 'AMJ4Pg0BO4', '2122628411', '谢睿', 'M', '2011-02-08', 78);
INSERT INTO `t_users` VALUES (301, '范云熙', 'ncb4EDlKUV', '15483730927', '范云熙', 'M', '2016-10-03', 87);
INSERT INTO `t_users` VALUES (302, '武秀英', 'dCp7AeuHFz', '7692428875', '武秀英', 'F', '2015-03-19', 22);
INSERT INTO `t_users` VALUES (303, '苏致远', 'YlNkOtJB2z', '18307821757', '苏致远', 'M', '2012-06-12', 43);
INSERT INTO `t_users` VALUES (304, '龚晓明', 'jbE446tJSB', '17613869013', '龚晓明', 'M', '2006-03-15', 36);
INSERT INTO `t_users` VALUES (305, '谭震南', 'IJCYXNwFad', '205741943', '谭震南', 'M', '2008-12-06', 27);
INSERT INTO `t_users` VALUES (306, '许宇宁', 'xQ7uykHPmI', '14435714583', '许宇宁', 'M', '2017-11-30', 96);
INSERT INTO `t_users` VALUES (307, '董致远', 'hr5AXOB4T8', '218464636', '董致远', 'M', '2006-04-17', 31);
INSERT INTO `t_users` VALUES (308, '向子异', '8lRma1aRUt', '75537650774', '向子异', 'M', '2011-12-25', 86);
INSERT INTO `t_users` VALUES (309, '廖嘉伦', 'WPidZRJMzN', '75591228801', '廖嘉伦', 'M', '2000-03-08', 23);
INSERT INTO `t_users` VALUES (310, '段璐', 'ZNoCEOQ7f8', '207460088', '段璐', 'F', '2022-09-08', 61);
INSERT INTO `t_users` VALUES (311, '莫安琪', '5SYHWmEEQR', '76090083413', '莫安琪', 'F', '2012-06-06', 69);
INSERT INTO `t_users` VALUES (312, '杜子异', '9N1jyw7OsP', '14336910043', '杜子异', 'M', '2003-10-26', 36);
INSERT INTO `t_users` VALUES (313, '雷睿', 'P6yhSrfJJl', '7697353003', '雷睿', 'M', '2008-09-07', 67);
INSERT INTO `t_users` VALUES (314, '魏宇宁', '7F55WLSJiq', '7553406476', '魏宇宁', 'M', '2016-07-07', 90);
INSERT INTO `t_users` VALUES (315, '江晓明', '0osThakXaB', '14481669133', '江晓明', 'M', '2017-11-27', 50);
INSERT INTO `t_users` VALUES (316, '夏宇宁', 'wKSf8QY3Yc', '76040947524', '夏宇宁', 'M', '2000-09-22', 51);
INSERT INTO `t_users` VALUES (317, '潘璐', 'LE4STJ8nLn', '76949318671', '潘璐', 'F', '2002-07-17', 96);
INSERT INTO `t_users` VALUES (318, '陆子韬', 'vaDuhsjkge', '7691549168', '陆子韬', 'M', '2023-02-06', 33);
INSERT INTO `t_users` VALUES (319, '贺震南', '9JJcELqhrT', '13228646679', '贺震南', 'M', '2005-01-06', 20);
INSERT INTO `t_users` VALUES (320, '马璐', 'a0P6erooxd', '106953974', '马璐', 'F', '2002-11-13', 68);
INSERT INTO `t_users` VALUES (321, '杨震南', '8tC814In5L', '75513898519', '杨震南', 'M', '2024-02-23', 61);
INSERT INTO `t_users` VALUES (322, '徐子异', 'QChWqkyESj', '16523008502', '徐子异', 'M', '2018-10-25', 32);
INSERT INTO `t_users` VALUES (323, '谭杰宏', 'f7rhBCTMH0', '15184334734', '谭杰宏', 'M', '2014-01-17', 65);
INSERT INTO `t_users` VALUES (324, '李睿', 'TkmNb4l1Eq', '17448493571', '李睿', 'M', '2023-10-16', 90);
INSERT INTO `t_users` VALUES (325, '韦晓明', 'acyNldUWPa', '7609152199', '韦晓明', 'M', '2012-09-01', 79);
INSERT INTO `t_users` VALUES (326, '刘子异', 'yB0WsHFEF7', '19049525489', '刘子异', 'M', '2010-05-02', 37);
INSERT INTO `t_users` VALUES (327, '严云熙', 'rxezmYzIBd', '17804532652', '严云熙', 'M', '2005-09-19', 82);
INSERT INTO `t_users` VALUES (328, '武云熙', 'g5LJPcYI8Z', '1045135584', '武云熙', 'M', '2004-08-28', 82);
INSERT INTO `t_users` VALUES (329, '侯秀英', '4zKErpAERZ', '2132411157', '侯秀英', 'F', '2024-03-27', 51);
INSERT INTO `t_users` VALUES (330, '袁云熙', 'hpjynRSTUL', '1014340321', '袁云熙', 'M', '2013-02-16', 34);
INSERT INTO `t_users` VALUES (331, '唐璐', '5oddWkCrYi', '2885065659', '唐璐', 'F', '2009-11-08', 50);
INSERT INTO `t_users` VALUES (332, '董杰宏', 'bsQMVPyPLe', '17250307567', '董杰宏', 'M', '2007-10-05', 97);
INSERT INTO `t_users` VALUES (333, '程秀英', 'YQxuvFdfsH', '76012725746', '程秀英', 'F', '2018-05-02', 36);
INSERT INTO `t_users` VALUES (334, '陶宇宁', 'z4FseomGQ2', '214386517', '陶宇宁', 'M', '2008-06-24', 31);
INSERT INTO `t_users` VALUES (336, '黎杰宏', 'cfkLHWFszu', '19108478636', '黎杰宏', 'M', '2008-06-09', 47);
INSERT INTO `t_users` VALUES (337, '龙璐', 'difowJWf0o', '16974428829', '龙璐', 'F', '2018-02-26', 91);
INSERT INTO `t_users` VALUES (338, '龙詩涵', 'uCd5xyTBVi', '18395298462', '龙詩涵', 'F', '2002-11-21', 57);
INSERT INTO `t_users` VALUES (339, '汤子韬', 'TR8nNAV0D9', '76003202379', '汤子韬', 'M', '2014-12-16', 30);
INSERT INTO `t_users` VALUES (340, '邱睿', 'SOXuM7eUIq', '7556922846', '邱睿', 'M', '2001-08-08', 35);
INSERT INTO `t_users` VALUES (342, '金璐', 'vq4jgrslDG', '1020868370', '金璐', 'F', '2023-10-15', 53);
INSERT INTO `t_users` VALUES (343, '孙致远', 'FEdt4tRWVh', '14021011933', '孙致远', 'M', '2021-12-16', 53);
INSERT INTO `t_users` VALUES (344, '汤杰宏', 'xfacnK4yyw', '101781289', '汤杰宏', 'M', '2023-05-16', 76);
INSERT INTO `t_users` VALUES (345, '戴致远', 'dbXDxGVB5n', '19105338758', '戴致远', 'M', '2022-09-07', 52);
INSERT INTO `t_users` VALUES (346, '郭致远', 'JG79ijIEQ8', '7695362078', '郭致远', 'M', '2015-12-18', 87);
INSERT INTO `t_users` VALUES (347, '丁璐', 'rBJdisA4id', '1023960235', '丁璐', 'F', '2021-12-06', 24);
INSERT INTO `t_users` VALUES (348, '何震南', '1v9xc22WF5', '7600010867', '何震南', 'M', '2024-04-22', 42);
INSERT INTO `t_users` VALUES (349, '于震南', 'jBwN8WQ5KH', '201845197', '于震南', 'M', '2010-10-16', 22);
INSERT INTO `t_users` VALUES (350, '宋晓明', '8ihFiUmFPl', '219067332', '宋晓明', 'M', '2001-01-12', 96);
INSERT INTO `t_users` VALUES (351, '熊宇宁', 'o4KihWceq4', '13499566193', '熊宇宁', 'M', '2003-11-10', 96);
INSERT INTO `t_users` VALUES (352, '龚震南', 'gPrX21Z3cU', '19096946890', '龚震南', 'M', '2004-11-27', 77);
INSERT INTO `t_users` VALUES (353, '顾杰宏', 'JFFgUaCrrP', '19493239693', '顾杰宏', 'M', '2019-01-09', 36);
INSERT INTO `t_users` VALUES (354, '杜安琪', '3Hc11R1Q6h', '13807207583', '杜安琪', 'F', '2004-02-06', 39);
INSERT INTO `t_users` VALUES (355, '郝詩涵', 'ntEtGvPgMi', '15601464422', '郝詩涵', 'F', '2001-05-02', 61);
INSERT INTO `t_users` VALUES (356, '任致远', 'wiyNHBRogn', '19802750878', '任致远', 'M', '2009-07-16', 68);
INSERT INTO `t_users` VALUES (357, '石岚', 'Kxf6SPLW4D', '218936804', '石岚', 'F', '2019-01-11', 41);
INSERT INTO `t_users` VALUES (358, '蒋宇宁', '92rPnyYIm6', '13376219338', '蒋宇宁', 'M', '2016-01-25', 51);
INSERT INTO `t_users` VALUES (359, '孟致远', 'EeIHSlvcLE', '14720206324', '孟致远', 'M', '2001-12-11', 61);
INSERT INTO `t_users` VALUES (361, '罗岚', 'DoegTVGevW', '15221276171', '罗岚', 'F', '2000-02-26', 25);
INSERT INTO `t_users` VALUES (362, '陈杰宏', 'VPLBXqjY0o', '18438758115', '陈杰宏', 'M', '2015-12-07', 88);
INSERT INTO `t_users` VALUES (363, '孔詩涵', 'OzL1pRKUgm', '18007773754', '孔詩涵', 'F', '2001-05-31', 22);
INSERT INTO `t_users` VALUES (364, '徐詩涵', 'lVwvk8fL7d', '200106235', '徐詩涵', 'F', '2006-01-22', 95);
INSERT INTO `t_users` VALUES (365, '夏岚', 'z1j38EvAco', '14772965636', '夏岚', 'F', '2022-11-14', 90);
INSERT INTO `t_users` VALUES (366, '叶嘉伦', 'bQtL0CKuPl', '206859944', '叶嘉伦', 'M', '2019-05-07', 80);
INSERT INTO `t_users` VALUES (367, '徐子韬', 'EOWtEJCHhk', '13256376664', '徐子韬', 'M', '2016-10-28', 89);
INSERT INTO `t_users` VALUES (368, '钱宇宁', 'EKCTnBiKIT', '7692851023', '钱宇宁', 'M', '2021-07-10', 36);
INSERT INTO `t_users` VALUES (369, '蒋詩涵', 'updxJ88OUu', '16987505502', '蒋詩涵', 'F', '2018-01-04', 91);
INSERT INTO `t_users` VALUES (370, '彭云熙', 'o2CUZlwLiK', '16667907710', '彭云熙', 'M', '2021-10-19', 41);
INSERT INTO `t_users` VALUES (371, '蒋睿', 'R0aU1Q4OeQ', '2062810281', '蒋睿', 'M', '2004-06-12', 86);
INSERT INTO `t_users` VALUES (372, '韩宇宁', 'fhlaH900ne', '18705361666', '韩宇宁', 'M', '2000-09-23', 36);
INSERT INTO `t_users` VALUES (373, '魏震南', 'JFIiGN8i1N', '19867179273', '魏震南', 'M', '2004-11-14', 68);
INSERT INTO `t_users` VALUES (374, '董璐', '9k02qA2Mfm', '18827911015', '董璐', 'F', '2017-12-18', 47);
INSERT INTO `t_users` VALUES (375, '金嘉伦', 'QcGmXqv8MX', '17335974261', '金嘉伦', 'M', '2006-04-01', 81);
INSERT INTO `t_users` VALUES (376, '常震南', 'So2rcg3xaf', '2013255470', '常震南', 'M', '2008-04-01', 82);
INSERT INTO `t_users` VALUES (377, '叶秀英', 'KJwLhDQLZ8', '213448899', '叶秀英', 'F', '2006-11-11', 25);
INSERT INTO `t_users` VALUES (378, '冯詩涵', 'gfoGSR2KHe', '1067361581', '冯詩涵', 'F', '2021-07-19', 83);
INSERT INTO `t_users` VALUES (379, '蔡晓明', 't4hcWkCEZF', '15231590943', '蔡晓明', 'M', '2007-08-04', 56);
INSERT INTO `t_users` VALUES (380, '王秀英', 'tJMBdetix8', '7556612610', '王秀英', 'F', '2011-01-27', 44);
INSERT INTO `t_users` VALUES (381, '范子韬', 'lvZug7njM2', '16207574918', '范子韬', 'M', '2016-08-11', 86);
INSERT INTO `t_users` VALUES (382, '李宇宁', 'dvPkH9LAs7', '2173408988', '李宇宁', 'M', '2021-09-26', 75);
INSERT INTO `t_users` VALUES (383, '魏杰宏', 'yZnbAOwkgB', '18174032286', '魏杰宏', 'M', '2022-09-04', 50);
INSERT INTO `t_users` VALUES (384, '薛子韬', 'hMNhOU4cKG', '2076228113', '薛子韬', 'M', '2010-08-25', 48);
INSERT INTO `t_users` VALUES (385, '程致远', 'wl3ZI9mVdN', '201067714', '程致远', 'M', '2003-03-27', 98);
INSERT INTO `t_users` VALUES (387, '于致远', '9Ln13I7go1', '16520337471', '于致远', 'M', '2008-09-05', 60);
INSERT INTO `t_users` VALUES (388, '侯嘉伦', 'nzqLQ5NUPg', '7601981107', '侯嘉伦', 'M', '2014-11-11', 27);
INSERT INTO `t_users` VALUES (389, '韦宇宁', 'rTscbrH8kW', '75518455126', '韦宇宁', 'M', '2004-05-06', 32);
INSERT INTO `t_users` VALUES (390, '范安琪', 'lo3AwTPspZ', '75516675718', '范安琪', 'F', '2006-09-02', 49);
INSERT INTO `t_users` VALUES (391, '廖震南', 'ULIvOhLR36', '16674269493', '廖震南', 'M', '2001-04-28', 73);
INSERT INTO `t_users` VALUES (392, '谭宇宁', 'doPVxQKBvB', '14816503059', '谭宇宁', 'M', '2009-05-23', 39);
INSERT INTO `t_users` VALUES (393, '胡杰宏', '4ElIL0gUSJ', '19529318681', '胡杰宏', 'M', '2007-03-20', 79);
INSERT INTO `t_users` VALUES (394, '贾杰宏', 'qyNWGug2ZD', '15639880702', '贾杰宏', 'M', '2017-10-26', 88);
INSERT INTO `t_users` VALUES (395, '邱安琪', 'msjDYyJ6vY', '15810982401', '邱安琪', 'F', '2020-08-15', 68);
INSERT INTO `t_users` VALUES (396, '徐岚', 'tlWRroWN70', '75544708690', '徐岚', 'F', '2008-09-18', 24);
INSERT INTO `t_users` VALUES (397, '熊晓明', 'D3foCujEkS', '15154215695', '熊晓明', 'M', '2019-06-20', 40);
INSERT INTO `t_users` VALUES (398, '崔璐', 'clMCM7dasa', '207387805', '崔璐', 'F', '2011-06-07', 39);
INSERT INTO `t_users` VALUES (399, '李嘉伦', 'VOwV8r3ogX', '15373082719', '李嘉伦', 'M', '2023-01-16', 45);
INSERT INTO `t_users` VALUES (400, '许子异', 'svA4Q0pBew', '13493662971', '许子异', 'M', '2021-12-06', 56);
INSERT INTO `t_users` VALUES (401, '侯致远', '7i4CLYsgQ6', '16183430037', '侯致远', 'M', '2009-08-05', 64);
INSERT INTO `t_users` VALUES (402, '田致远', 'Qi3i593aPl', '15964356474', '田致远', 'M', '2022-09-06', 31);
INSERT INTO `t_users` VALUES (403, '龚秀英', 'dkskSi4pD8', '15245276386', '龚秀英', 'F', '2024-05-11', 75);
INSERT INTO `t_users` VALUES (404, '赵安琪', 'zylh0jHUJn', '75502346129', '赵安琪', 'F', '2015-04-15', 72);
INSERT INTO `t_users` VALUES (405, '邵睿', 'd2er4YXGPn', '14632880535', '邵睿', 'M', '2003-01-23', 28);
INSERT INTO `t_users` VALUES (406, '韩嘉伦', 'MY6qHpXvjW', '1085794411', '韩嘉伦', 'M', '2015-01-02', 52);
INSERT INTO `t_users` VALUES (407, '王震南', '5LcKcOvM75', '284371792', '王震南', 'M', '2020-03-14', 39);
INSERT INTO `t_users` VALUES (408, '卢晓明', 'Kyg3GL7RNa', '17491193729', '卢晓明', 'M', '2003-10-01', 58);
INSERT INTO `t_users` VALUES (409, '韩秀英', '4Ct5UJZ4a2', '75545547319', '韩秀英', 'F', '2011-03-27', 28);
INSERT INTO `t_users` VALUES (410, '孟子异', 'OZAmpPQPAX', '7556153618', '孟子异', 'M', '2022-01-10', 93);
INSERT INTO `t_users` VALUES (411, '顾子异', 'eo5QQ7HZv9', '107653256', '顾子异', 'M', '2009-10-29', 62);
INSERT INTO `t_users` VALUES (412, '韦詩涵', 'VSHoEHS5C2', '15527358831', '韦詩涵', 'F', '2022-04-05', 81);
INSERT INTO `t_users` VALUES (413, '侯宇宁', '2bBwPgTJZC', '15799476092', '侯宇宁', 'M', '2011-03-05', 52);
INSERT INTO `t_users` VALUES (414, '朱云熙', 'e5hDFGuiwJ', '2179117450', '朱云熙', 'M', '2000-06-12', 70);
INSERT INTO `t_users` VALUES (415, '姚子异', 'yOiOKZ7uud', '214268551', '姚子异', 'M', '2005-02-10', 73);
INSERT INTO `t_users` VALUES (416, '林宇宁', 'maNaskwRTq', '1021832263', '林宇宁', 'M', '2013-04-10', 74);
INSERT INTO `t_users` VALUES (417, '赵晓明', 'uBRypzpAa2', '16948615674', '赵晓明', 'M', '2003-02-03', 92);
INSERT INTO `t_users` VALUES (418, '郝岚', 'uJAyell3pm', '14111277204', '郝岚', 'F', '2011-02-03', 27);
INSERT INTO `t_users` VALUES (419, '黄云熙', 'JWC80Ul9dV', '2857478849', '黄云熙', 'M', '2022-05-18', 51);
INSERT INTO `t_users` VALUES (420, '冯安琪', 'KZXYEU1U7o', '102269247', '冯安琪', 'F', '2019-11-11', 87);
INSERT INTO `t_users` VALUES (421, '史岚', 'y0sPUlOGgK', '16406638937', '史岚', 'F', '2013-04-18', 88);
INSERT INTO `t_users` VALUES (422, '郝子异', 'TgmR46qbyy', '19514650490', '郝子异', 'M', '2023-03-31', 36);
INSERT INTO `t_users` VALUES (423, '顾安琪', 'JZRTVT9jex', '16244981096', '顾安琪', 'F', '2010-05-09', 27);
INSERT INTO `t_users` VALUES (424, '黎致远', 'zbsAmmXyTU', '206957110', '黎致远', 'M', '2015-09-06', 77);
INSERT INTO `t_users` VALUES (425, '邱璐', '1i9mAXNOgi', '14855511680', '邱璐', 'F', '2022-05-24', 20);
INSERT INTO `t_users` VALUES (426, '曾嘉伦', 'h6RgBWbmVq', '14309616698', '曾嘉伦', 'M', '2015-08-24', 63);
INSERT INTO `t_users` VALUES (427, '于安琪', 'MzQZ349xxG', '7559484934', '于安琪', 'F', '2022-03-23', 77);
INSERT INTO `t_users` VALUES (428, '廖睿', 'w9BoOYgbnB', '16217588892', '廖睿', 'M', '2002-07-01', 70);
INSERT INTO `t_users` VALUES (429, '彭致远', 'T2GlC86wOd', '1046667389', '彭致远', 'M', '2023-11-17', 92);
INSERT INTO `t_users` VALUES (430, '林晓明', 'OGetDqVhBT', '7556230337', '林晓明', 'M', '2017-06-28', 56);
INSERT INTO `t_users` VALUES (431, '孙岚', 'IZutsFu710', '19464651154', '孙岚', 'F', '2021-04-07', 76);
INSERT INTO `t_users` VALUES (433, '曹岚', 'fhvrebRbTV', '18261964749', '曹岚', 'F', '2000-06-30', 42);
INSERT INTO `t_users` VALUES (434, '叶晓明', 'tcBrNKnQha', '19739092440', '叶晓明', 'M', '2024-05-19', 21);
INSERT INTO `t_users` VALUES (435, '杨子异', 'UklHzAol3i', '18256587483', '杨子异', 'M', '2011-06-28', 93);
INSERT INTO `t_users` VALUES (436, '刘致远', 'ySN3thJj4W', '14564053933', '刘致远', 'M', '2024-03-21', 35);
INSERT INTO `t_users` VALUES (437, '傅子异', 'U0Y7OwFp7v', '76024194149', '傅子异', 'M', '2014-07-30', 36);
INSERT INTO `t_users` VALUES (438, '黄宇宁', '9UsueKQSE8', '18542239299', '黄宇宁', 'M', '2010-10-11', 60);
INSERT INTO `t_users` VALUES (439, '周云熙', '78dqgeIBCa', '18302122798', '周云熙', 'M', '2006-05-06', 99);
INSERT INTO `t_users` VALUES (440, '吴詩涵', '72rGCTW7va', '17797922580', '吴詩涵', 'F', '2017-03-07', 32);
INSERT INTO `t_users` VALUES (441, '姜嘉伦', 'YOJhD7Ove9', '204587967', '姜嘉伦', 'M', '2007-01-08', 32);
INSERT INTO `t_users` VALUES (442, '黎睿', 'Omu3OfKotb', '18054479671', '黎睿', 'M', '2013-03-04', 60);
INSERT INTO `t_users` VALUES (443, '黎云熙', 'qr814qSVgS', '216740935', '黎云熙', 'M', '2021-05-01', 42);
INSERT INTO `t_users` VALUES (444, '徐晓明', 'BYSz51gZjB', '19469137828', '徐晓明', 'M', '2021-04-27', 25);
INSERT INTO `t_users` VALUES (445, '王晓明', 'NjvgqeZ7Wh', '1060076558', '王晓明', 'M', '2008-01-09', 73);
INSERT INTO `t_users` VALUES (446, '陶杰宏', 'f7HVb2mLDW', '18162387151', '陶杰宏', 'M', '2007-01-16', 56);
INSERT INTO `t_users` VALUES (447, '姜晓明', 'hJzucN8FOx', '14678853508', '姜晓明', 'M', '2016-05-13', 38);
INSERT INTO `t_users` VALUES (448, '丁嘉伦', 'Ar8uJtrrqz', '2150234726', '丁嘉伦', 'M', '2006-04-30', 73);
INSERT INTO `t_users` VALUES (449, '袁秀英', 'R6y6DgzgEH', '14813799025', '袁秀英', 'F', '2019-12-03', 91);
INSERT INTO `t_users` VALUES (450, '林安琪', 'jU99mhykZp', '13885611770', '林安琪', 'F', '2012-08-02', 42);
INSERT INTO `t_users` VALUES (451, '武震南', 'LnluRIZWTu', '13701122667', '武震南', 'M', '2019-02-24', 78);
INSERT INTO `t_users` VALUES (452, '熊睿', '65aftnC9Mo', '76912154431', '熊睿', 'M', '2021-07-02', 69);
INSERT INTO `t_users` VALUES (453, '丁晓明', '3VR6jCPUSk', '17159091149', '丁晓明', 'M', '2010-09-05', 21);
INSERT INTO `t_users` VALUES (454, '毛致远', 'CspyGr5vol', '15729335130', '毛致远', 'M', '2000-09-21', 82);
INSERT INTO `t_users` VALUES (455, '江睿', 'cDLCCLB29l', '1056704287', '江睿', 'M', '2024-05-02', 89);
INSERT INTO `t_users` VALUES (456, '毛宇宁', '6HjegW5jyc', '13283520616', '毛宇宁', 'M', '2013-03-07', 71);
INSERT INTO `t_users` VALUES (457, '潘震南', 'cVgypHdtHd', '19149594405', '潘震南', 'M', '2004-06-09', 25);
INSERT INTO `t_users` VALUES (458, '常安琪', '5cbNIsHfAj', '17665312255', '常安琪', 'F', '2004-12-17', 84);
INSERT INTO `t_users` VALUES (459, '袁詩涵', 'fJv63EqcJz', '2066581052', '袁詩涵', 'F', '2018-07-10', 52);
INSERT INTO `t_users` VALUES (461, '罗詩涵', '5E43IlzdKU', '7558314769', '罗詩涵', 'F', '2005-02-10', 93);
INSERT INTO `t_users` VALUES (462, '郭晓明', 'rbE3aU3IZZ', '14099277806', '郭晓明', 'M', '2003-05-08', 92);
INSERT INTO `t_users` VALUES (463, '任杰宏', 'c0r4WI7O0X', '2833730492', '任杰宏', 'M', '2005-03-29', 75);
INSERT INTO `t_users` VALUES (464, '许晓明', 's8AgjemTC4', '15714853549', '许晓明', 'M', '2016-02-12', 42);
INSERT INTO `t_users` VALUES (465, '薛晓明', 'tve5Byilje', '16804714188', '薛晓明', 'M', '2006-05-03', 79);
INSERT INTO `t_users` VALUES (466, '石璐', 'VSAcaFJxOH', '18697936109', '石璐', 'F', '2017-03-08', 45);
INSERT INTO `t_users` VALUES (467, '龚安琪', 'MSRMcq3Z4L', '103413642', '龚安琪', 'F', '2004-05-16', 94);
INSERT INTO `t_users` VALUES (468, '傅云熙', 'ORL3UCGPjm', '1082489139', '傅云熙', 'M', '2009-10-01', 50);
INSERT INTO `t_users` VALUES (469, '汪子韬', 'XGbrNWObXf', '1071909994', '汪子韬', 'M', '2013-05-28', 41);
INSERT INTO `t_users` VALUES (470, '龙云熙', '0yrMI0tNjs', '14499682033', '龙云熙', 'M', '2004-09-08', 50);
INSERT INTO `t_users` VALUES (471, '傅璐', 'pJdrfPjYHj', '17549591810', '傅璐', 'F', '2012-06-07', 35);
INSERT INTO `t_users` VALUES (472, '雷安琪', 'Zq8fVudIfn', '17540429288', '雷安琪', 'F', '2015-02-11', 39);
INSERT INTO `t_users` VALUES (473, '韩子韬', 'AFMdAvwEry', '100681429', '韩子韬', 'M', '2021-12-11', 94);
INSERT INTO `t_users` VALUES (474, '董晓明', 'WI5viUUpeE', '1021834373', '董晓明', 'M', '2019-03-05', 23);
INSERT INTO `t_users` VALUES (475, '赵震南', 'd0BRpnwIdt', '76963895693', '赵震南', 'M', '2020-04-09', 25);
INSERT INTO `t_users` VALUES (476, '梁岚', 'aUBZMIzl3l', '2896211555', '梁岚', 'F', '2006-05-08', 98);
INSERT INTO `t_users` VALUES (477, '孔宇宁', '0WRCFkoSla', '206357305', '孔宇宁', 'M', '2002-09-03', 29);
INSERT INTO `t_users` VALUES (478, '王致远', 'fysHYWzHgj', '15303154989', '王致远', 'M', '2018-09-06', 23);
INSERT INTO `t_users` VALUES (479, '袁子异', 'KntrATMCrW', '14463902494', '袁子异', 'M', '2023-07-02', 73);
INSERT INTO `t_users` VALUES (480, '方晓明', 'vEGcrBSgl8', '2167251009', '方晓明', 'M', '2003-01-30', 33);
INSERT INTO `t_users` VALUES (481, '尹睿', 'U3sGwVCicW', '2135572543', '尹睿', 'M', '2001-01-17', 94);
INSERT INTO `t_users` VALUES (482, '罗震南', 'EluLI9tYzc', '17651394261', '罗震南', 'M', '2005-05-22', 67);
INSERT INTO `t_users` VALUES (483, '孙杰宏', 'a4XxnOoASo', '7699846043', '孙杰宏', 'M', '2014-11-19', 40);
INSERT INTO `t_users` VALUES (484, '段詩涵', 'N7NbXTUsp9', '76074728936', '段詩涵', 'F', '2007-03-25', 79);
INSERT INTO `t_users` VALUES (485, '曾璐', 'oYD6h2JN8j', '2015271518', '曾璐', 'F', '2016-10-12', 44);
INSERT INTO `t_users` VALUES (486, '罗杰宏', 'WTTkSSmBdK', '105993794', '罗杰宏', 'M', '2001-06-26', 54);
INSERT INTO `t_users` VALUES (487, '尹子韬', 'zfhv6cKzqo', '2857603464', '尹子韬', 'M', '2002-11-03', 44);
INSERT INTO `t_users` VALUES (488, '袁嘉伦', 'LUbk28Ikq3', '16230703015', '袁嘉伦', 'M', '2014-04-24', 99);
INSERT INTO `t_users` VALUES (489, '薛嘉伦', '5Az5QPdNLx', '7550884596', '薛嘉伦', 'M', '2020-04-29', 87);
INSERT INTO `t_users` VALUES (490, '许安琪', 'K1HZHBlqC0', '15383454713', '许安琪', 'F', '2018-07-02', 82);
INSERT INTO `t_users` VALUES (491, '周岚', 'sKCsidugQL', '13993164218', '周岚', 'F', '2008-07-22', 67);
INSERT INTO `t_users` VALUES (492, '方子韬', 'yJbUEvBR6C', '17671057483', '方子韬', 'M', '2003-09-01', 94);
INSERT INTO `t_users` VALUES (493, '苏震南', 'ZoKHQh4L5J', '19845761037', '苏震南', 'M', '2005-11-22', 54);
INSERT INTO `t_users` VALUES (494, '何璐', 'Idp6V0c1D8', '17224698612', '何璐', 'F', '2015-09-05', 74);
INSERT INTO `t_users` VALUES (495, '邵岚', 'y0Kyeq34q5', '15185850712', '邵岚', 'F', '2012-04-16', 20);
INSERT INTO `t_users` VALUES (496, '姜安琪', 'YXo7bKZDwE', '15981262973', '姜安琪', 'F', '2001-02-01', 55);
INSERT INTO `t_users` VALUES (497, '雷子异', 'kXjj8EDL64', '282540502', '雷子异', 'M', '2022-08-25', 58);
INSERT INTO `t_users` VALUES (498, '钟震南', 'USm2Ieny9K', '283428970', '钟震南', 'M', '2020-04-30', 67);
INSERT INTO `t_users` VALUES (499, '田璐', 'vnUQBb4yyn', '19100337621', '田璐', 'F', '2007-11-19', 94);
INSERT INTO `t_users` VALUES (500, '汪詩涵', 'wx7iejb893', '14780400220', '汪詩涵', 'F', '2017-08-15', 89);
INSERT INTO `t_users` VALUES (501, '龚云熙', 'Zv0B54Kf3G', '14493532023', '龚云熙', 'M', '2002-09-27', 40);
INSERT INTO `t_users` VALUES (502, '张致远', 'hIuqi14FUV', '14523706271', '张致远', 'M', '2008-11-17', 36);
INSERT INTO `t_users` VALUES (503, '钱璐', 'DDGUCLsEX5', '213877841', '钱璐', 'F', '2003-02-03', 69);
INSERT INTO `t_users` VALUES (504, '任睿', 'lqJblpBL4T', '7601136914', '任睿', 'M', '2008-07-14', 99);
INSERT INTO `t_users` VALUES (505, '顾致远', 'hoJ7XLEQD2', '15814180753', '顾致远', 'M', '2023-04-25', 67);
INSERT INTO `t_users` VALUES (506, '赵璐', '4t4koKHmiI', '7608448539', '赵璐', 'F', '2012-05-09', 91);
INSERT INTO `t_users` VALUES (507, '林嘉伦', 'uBaOlxT6a3', '2016625993', '林嘉伦', 'M', '2008-09-03', 34);
INSERT INTO `t_users` VALUES (508, '任子异', '6h1ExVLQ6x', '75586202495', '任子异', 'M', '2016-01-08', 75);
INSERT INTO `t_users` VALUES (509, '吴震南', 'y2pIgR5laY', '16466528645', '吴震南', 'M', '2004-04-15', 31);
INSERT INTO `t_users` VALUES (510, '谢安琪', 'uWWQd77YJR', '18195138446', '谢安琪', 'F', '2016-01-04', 59);
INSERT INTO `t_users` VALUES (511, '何安琪', 'afJozpk6It', '2151362326', '何安琪', 'F', '2023-08-27', 43);
INSERT INTO `t_users` VALUES (512, '戴云熙', '7i3dWN0KUK', '13112290040', '戴云熙', 'M', '2007-11-14', 56);
INSERT INTO `t_users` VALUES (513, '邱致远', 'wLTnS8TYow', '18929071773', '邱致远', 'M', '2023-08-12', 64);
INSERT INTO `t_users` VALUES (514, '田岚', 'gBXTcC6Aur', '15318156701', '田岚', 'F', '2016-08-21', 38);
INSERT INTO `t_users` VALUES (515, '谭子异', 'iTQciJwjy2', '16784948712', '谭子异', 'M', '2020-02-19', 44);
INSERT INTO `t_users` VALUES (516, '张震南', 'MinwLKd2pw', '13645179393', '张震南', 'M', '2023-07-13', 73);
INSERT INTO `t_users` VALUES (517, '苏安琪', 'AH52ikOV5e', '209295551', '苏安琪', 'F', '2008-08-30', 55);
INSERT INTO `t_users` VALUES (518, '刘睿', '5RZB0S4Tj8', '16676703748', '刘睿', 'M', '2020-01-03', 36);
INSERT INTO `t_users` VALUES (519, '余睿', '20IeEMn4aY', '19284380841', '余睿', 'M', '2017-04-25', 57);
INSERT INTO `t_users` VALUES (520, '杜詩涵', 'PtVWgaA6lE', '2062783623', '杜詩涵', 'F', '2022-08-12', 76);
INSERT INTO `t_users` VALUES (521, '卢云熙', 'zJX1ABM0PG', '1071666905', '卢云熙', 'M', '2024-01-15', 52);
INSERT INTO `t_users` VALUES (522, '范岚', 'GcRqUiOGnq', '19948653011', '范岚', 'F', '2008-11-12', 49);
INSERT INTO `t_users` VALUES (523, '严睿', 'SDmyfZWdk6', '19240188662', '严睿', 'M', '2020-07-30', 66);
INSERT INTO `t_users` VALUES (524, '龚嘉伦', '41wpYxCy9K', '7559172705', '龚嘉伦', 'M', '2021-12-28', 85);
INSERT INTO `t_users` VALUES (525, '王宇宁', 'eS6I1lJBuD', '15670713786', '王宇宁', 'M', '2020-10-02', 33);
INSERT INTO `t_users` VALUES (526, '莫秀英', 'P3vKR13Yvb', '18676739299', '莫秀英', 'F', '2012-02-14', 61);
INSERT INTO `t_users` VALUES (527, '萧晓明', 'L5T9YPa23x', '7691254302', '萧晓明', 'M', '2020-06-02', 47);
INSERT INTO `t_users` VALUES (528, '顾子韬', 'bnOBNOdZMj', '16384261865', '顾子韬', 'M', '2023-02-24', 74);
INSERT INTO `t_users` VALUES (529, '史宇宁', 'gXAKoLAZvs', '76993455481', '史宇宁', 'M', '2006-02-15', 97);
INSERT INTO `t_users` VALUES (530, '邵詩涵', 'lTHfqXrm7C', '7692391964', '邵詩涵', 'F', '2013-12-30', 37);
INSERT INTO `t_users` VALUES (531, '段子韬', 'Zi0XLaOUHT', '13322754826', '段子韬', 'M', '2005-12-24', 85);
INSERT INTO `t_users` VALUES (532, '萧岚', 'wfwhajuuXX', '14554388185', '萧岚', 'F', '2015-01-28', 29);
INSERT INTO `t_users` VALUES (533, '孟云熙', '3bxZGu44Vm', '18884170473', '孟云熙', 'M', '2007-05-22', 81);
INSERT INTO `t_users` VALUES (534, '莫詩涵', 'xBGWR8cxBx', '17542577092', '莫詩涵', 'F', '2000-09-25', 33);
INSERT INTO `t_users` VALUES (535, '汪璐', 'g0alHjOO85', '7602995002', '汪璐', 'F', '2019-04-15', 37);
INSERT INTO `t_users` VALUES (536, '尹嘉伦', 'Yx2csrkY8D', '2018810654', '尹嘉伦', 'M', '2020-10-16', 54);
INSERT INTO `t_users` VALUES (537, '胡晓明', 'T526hTGePJ', '2069491482', '胡晓明', 'M', '2001-10-09', 66);
INSERT INTO `t_users` VALUES (538, '邹杰宏', 'WDP5FU64DY', '205332251', '邹杰宏', 'M', '2016-02-05', 62);
INSERT INTO `t_users` VALUES (539, '丁云熙', 'dXFetlPgpS', '16517618149', '丁云熙', 'M', '2002-10-11', 52);
INSERT INTO `t_users` VALUES (540, '田安琪', 'YbyqgJThPT', '7554914426', '田安琪', 'F', '2005-04-19', 45);
INSERT INTO `t_users` VALUES (541, '孟岚', '4wkVq04HTG', '15312007389', '孟岚', 'F', '2023-04-29', 80);
INSERT INTO `t_users` VALUES (542, '彭震南', 'xNY9wXB5e5', '7605687257', '彭震南', 'M', '2014-07-01', 22);
INSERT INTO `t_users` VALUES (543, '赵子韬', 'eI6AnP54Jj', '7694032720', '赵子韬', 'M', '2004-01-12', 60);
INSERT INTO `t_users` VALUES (544, '尹宇宁', 'HAfOIRGC0i', '13615940689', '尹宇宁', 'M', '2009-11-16', 52);
INSERT INTO `t_users` VALUES (545, '孔云熙', 'R8pny34jRI', '18798246547', '孔云熙', 'M', '2020-05-24', 95);
INSERT INTO `t_users` VALUES (546, '崔安琪', 'XcfvsH9TBW', '2124152827', '崔安琪', 'F', '2019-04-10', 75);
INSERT INTO `t_users` VALUES (547, '赵秀英', 'Sz13gneBu6', '2887479815', '赵秀英', 'F', '2015-11-07', 90);
INSERT INTO `t_users` VALUES (548, '郭子韬', 'ptlg6vflTM', '16583986208', '郭子韬', 'M', '2010-01-03', 78);
INSERT INTO `t_users` VALUES (549, '贾子韬', 'eOMsRwihOQ', '15904069810', '贾子韬', 'M', '2015-01-08', 52);
INSERT INTO `t_users` VALUES (550, '陆岚', 'KkzIhYFAXK', '1099332580', '陆岚', 'F', '2011-05-31', 58);
INSERT INTO `t_users` VALUES (551, '冯致远', 'VN372cTeA4', '75532327473', '冯致远', 'M', '2015-11-26', 69);
INSERT INTO `t_users` VALUES (552, '汪子异', 'YxQ1gAUQT9', '13406300273', '汪子异', 'M', '2001-11-13', 50);
INSERT INTO `t_users` VALUES (553, '毛晓明', 'cFhF4VJhe3', '75505251183', '毛晓明', 'M', '2008-03-26', 31);
INSERT INTO `t_users` VALUES (554, '邱震南', 'r5Zq5cRPfX', '13077494556', '邱震南', 'M', '2001-09-22', 50);
INSERT INTO `t_users` VALUES (555, '陆杰宏', 'cfseExojIu', '17056021095', '陆杰宏', 'M', '2024-08-05', 41);
INSERT INTO `t_users` VALUES (556, '袁宇宁', 'SVXZyvDYWf', '2865431650', '袁宇宁', 'M', '2015-12-14', 83);
INSERT INTO `t_users` VALUES (557, '唐宇宁', 'RxA0F7xJe2', '15612408920', '唐宇宁', 'M', '2021-10-28', 86);
INSERT INTO `t_users` VALUES (558, '金睿', 'dIT3zujJul', '16567157111', '金睿', 'M', '2015-12-27', 77);
INSERT INTO `t_users` VALUES (559, '许嘉伦', 'r4dIWPaoC3', '15449399531', '许嘉伦', 'M', '2020-12-27', 97);
INSERT INTO `t_users` VALUES (560, '董嘉伦', '90xmKZWyJ7', '17203555031', '董嘉伦', 'M', '2015-01-15', 80);
INSERT INTO `t_users` VALUES (561, '常嘉伦', 'ts8UpKNZOj', '1011496661', '常嘉伦', 'M', '2004-10-26', 92);
INSERT INTO `t_users` VALUES (562, '蒋璐', 'BsMvjaPGIx', '7606561941', '蒋璐', 'F', '2007-11-16', 61);
INSERT INTO `t_users` VALUES (563, '傅秀英', 'BMLEuCPHIz', '17406928501', '傅秀英', 'F', '2018-10-15', 86);
INSERT INTO `t_users` VALUES (564, '雷秀英', 'Gi3HImC1qe', '2123065930', '雷秀英', 'F', '2004-04-29', 47);
INSERT INTO `t_users` VALUES (565, '孟震南', 'M40nti1BTY', '16281282128', '孟震南', 'M', '2022-10-26', 85);
INSERT INTO `t_users` VALUES (566, '毛安琪', 'HKKA7MP7bv', '76089829755', '毛安琪', 'F', '2020-03-24', 99);
INSERT INTO `t_users` VALUES (567, '崔子异', 'u0xZTU5iXM', '7604285867', '崔子异', 'M', '2004-12-11', 49);
INSERT INTO `t_users` VALUES (568, '姜秀英', 'cEYUPDeqlD', '212795222', '姜秀英', 'F', '2023-01-25', 63);
INSERT INTO `t_users` VALUES (569, '余致远', 'xxW6u5Tuq7', '19851982325', '余致远', 'M', '2009-10-24', 38);
INSERT INTO `t_users` VALUES (570, '邱子异', 'cq64bU5bId', '17153334540', '邱子异', 'M', '2007-01-13', 91);
INSERT INTO `t_users` VALUES (571, '何宇宁', 'YWvdcyKN9f', '18627212097', '何宇宁', 'M', '2013-07-21', 86);
INSERT INTO `t_users` VALUES (572, '侯杰宏', 'gVByccIXhh', '76088831725', '侯杰宏', 'M', '2002-10-04', 88);
INSERT INTO `t_users` VALUES (573, '何云熙', 'RdparEWnAt', '16751767523', '何云熙', 'M', '2024-06-06', 43);
INSERT INTO `t_users` VALUES (574, '蔡秀英', 'cQHI56rpTz', '19167144918', '蔡秀英', 'F', '2016-12-01', 26);
INSERT INTO `t_users` VALUES (575, '田秀英', 'lF5MOMnJh2', '7550699939', '田秀英', 'F', '2005-06-29', 36);
INSERT INTO `t_users` VALUES (576, '邱晓明', 'ePwhZ75cF5', '16232358707', '邱晓明', 'M', '2010-11-22', 92);
INSERT INTO `t_users` VALUES (577, '崔震南', 'WbyalWGupk', '2128082726', '崔震南', 'M', '2000-01-25', 57);
INSERT INTO `t_users` VALUES (578, '黄杰宏', 'wALhr5c5if', '2048789429', '黄杰宏', 'M', '2019-03-06', 73);
INSERT INTO `t_users` VALUES (579, '蔡震南', 'fi81FHPzop', '76082155875', '蔡震南', 'M', '2016-11-29', 93);
INSERT INTO `t_users` VALUES (580, '林震南', 'UydbdXxB3m', '13562195264', '林震南', 'M', '2005-02-07', 48);
INSERT INTO `t_users` VALUES (581, '沈睿', 'caB9aBTKDN', '19208001098', '沈睿', 'M', '2019-11-10', 86);
INSERT INTO `t_users` VALUES (582, '沈岚', 'OXnMVnWyFv', '2865114520', '沈岚', 'F', '2013-04-11', 50);
INSERT INTO `t_users` VALUES (583, '冯子韬', 'wsc4K5nsRY', '75516612693', '冯子韬', 'M', '2013-07-21', 68);
INSERT INTO `t_users` VALUES (584, '莫震南', '6L2nalLlZw', '17403498317', '莫震南', 'M', '2014-12-09', 46);
INSERT INTO `t_users` VALUES (585, '程詩涵', 'XB3FejvRlH', '19532945394', '程詩涵', 'F', '2006-06-27', 28);
INSERT INTO `t_users` VALUES (586, '严嘉伦', 'yU4482ltFM', '18833559645', '严嘉伦', 'M', '2021-06-25', 83);
INSERT INTO `t_users` VALUES (587, '邱杰宏', 'v4tpkH7JO9', '215776301', '邱杰宏', 'M', '2003-11-15', 80);
INSERT INTO `t_users` VALUES (588, '胡睿', 'Y8EXaKGBHX', '14757237519', '胡睿', 'M', '2001-07-23', 69);
INSERT INTO `t_users` VALUES (589, '郭云熙', '1DrIbDPtS4', '19490525607', '郭云熙', 'M', '2008-12-05', 24);
INSERT INTO `t_users` VALUES (590, '向詩涵', 'VEhOhb9gW0', '19020118131', '向詩涵', 'F', '2017-08-20', 87);
INSERT INTO `t_users` VALUES (591, '彭晓明', 'gtyPRexk8D', '100164421', '彭晓明', 'M', '2020-07-05', 96);
INSERT INTO `t_users` VALUES (592, '郑云熙', 'dOAZOIdD5E', '215183536', '郑云熙', 'M', '2022-03-30', 49);
INSERT INTO `t_users` VALUES (593, '贾睿', 'ps756Oic9u', '15745864652', '贾睿', 'M', '2022-02-08', 85);
INSERT INTO `t_users` VALUES (594, '蒋嘉伦', 'NiDzDxqjp4', '76094883583', '蒋嘉伦', 'M', '2000-04-09', 22);
INSERT INTO `t_users` VALUES (595, '侯子韬', 'cSzXhscFYn', '284559647', '侯子韬', 'M', '2017-11-22', 78);
INSERT INTO `t_users` VALUES (596, '姚子韬', 'UrpufqMjbB', '15515728810', '姚子韬', 'M', '2009-09-21', 34);
INSERT INTO `t_users` VALUES (597, '李璐', 'BDA9iBkjvS', '1084743794', '李璐', 'F', '2007-03-01', 62);
INSERT INTO `t_users` VALUES (598, '叶子异', 'ojE27PJ28Y', '76033003474', '叶子异', 'M', '2009-07-09', 21);
INSERT INTO `t_users` VALUES (599, '周嘉伦', 'NHCM2oXf6S', '2021089336', '周嘉伦', 'M', '2010-10-23', 39);
INSERT INTO `t_users` VALUES (600, '陶子韬', 'OiGXJlIWFU', '7691242724', '陶子韬', 'M', '2022-02-22', 44);
INSERT INTO `t_users` VALUES (601, '高安琪', 'lyY2uAcXcM', '218998044', '高安琪', 'F', '2012-01-17', 67);
INSERT INTO `t_users` VALUES (602, '毛岚', 'mi7KqGAgiq', '202721337', '毛岚', 'F', '2020-03-31', 98);
INSERT INTO `t_users` VALUES (603, '许璐', 'bVbT5NsrIA', '18121348899', '许璐', 'F', '2003-07-01', 94);
INSERT INTO `t_users` VALUES (604, '孟宇宁', '81IYWmODd4', '14049862544', '孟宇宁', 'M', '2011-02-25', 21);
INSERT INTO `t_users` VALUES (605, '袁杰宏', 'ehuzyShMDh', '18286470008', '袁杰宏', 'M', '2017-05-06', 41);
INSERT INTO `t_users` VALUES (606, '邹嘉伦', '1XsTcsIEsI', '16457540539', '邹嘉伦', 'M', '2021-04-13', 33);
INSERT INTO `t_users` VALUES (607, '许岚', 'HDBaFperHR', '75507812483', '许岚', 'F', '2008-09-02', 95);
INSERT INTO `t_users` VALUES (608, '于睿', 'BaTBFbawRf', '16270478698', '于睿', 'M', '2007-12-23', 45);
INSERT INTO `t_users` VALUES (609, '田震南', '67AqyfSyQo', '7609227590', '田震南', 'M', '2015-01-06', 78);
INSERT INTO `t_users` VALUES (610, '徐宇宁', 'Ws53EjhWId', '16893820702', '徐宇宁', 'M', '2018-07-16', 81);
INSERT INTO `t_users` VALUES (611, '顾岚', 'gZyWmhl12w', '76906203299', '顾岚', 'F', '2017-01-11', 98);
INSERT INTO `t_users` VALUES (612, '武子韬', 'xn3WwL7tUN', '215584121', '武子韬', 'M', '2016-12-26', 21);
INSERT INTO `t_users` VALUES (613, '莫嘉伦', 'dQbCNAsjcx', '7698771083', '莫嘉伦', 'M', '2015-06-17', 80);
INSERT INTO `t_users` VALUES (614, '梁杰宏', 'rDbWB1hZiI', '17208685169', '梁杰宏', 'M', '2011-12-06', 62);
INSERT INTO `t_users` VALUES (615, '郑璐', 'wUvCsMZdGJ', '16995298543', '郑璐', 'F', '2023-08-21', 75);
INSERT INTO `t_users` VALUES (616, '吴致远', 'YBgRf8ZATZ', '14990246560', '吴致远', 'M', '2013-12-05', 20);
INSERT INTO `t_users` VALUES (617, '杜璐', 'xhqhON8cKn', '214706828', '杜璐', 'F', '2020-03-16', 44);
INSERT INTO `t_users` VALUES (618, '杜晓明', '3CSr3ybOtw', '2883079288', '杜晓明', 'M', '2023-09-25', 36);
INSERT INTO `t_users` VALUES (619, '彭宇宁', 'S9ffnuEDLE', '19176758321', '彭宇宁', 'M', '2004-03-25', 63);
INSERT INTO `t_users` VALUES (620, '毛子异', 'vU5ql5rjo5', '2178488878', '毛子异', 'M', '2017-01-23', 47);
INSERT INTO `t_users` VALUES (621, '秦璐', 'NRh7zNLumh', '15132246113', '秦璐', 'F', '2015-04-15', 94);
INSERT INTO `t_users` VALUES (622, '任秀英', '4TOq2VSKvv', '17230923695', '任秀英', 'F', '2009-02-04', 73);
INSERT INTO `t_users` VALUES (623, '许睿', 'wZNHrKDQ1R', '19646215967', '许睿', 'M', '2019-10-06', 94);
INSERT INTO `t_users` VALUES (624, '林子韬', '60twn6gYA5', '13939834981', '林子韬', 'M', '2001-09-14', 92);
INSERT INTO `t_users` VALUES (625, '莫致远', 'cY6LYLEEC9', '17430579705', '莫致远', 'M', '2023-12-01', 56);
INSERT INTO `t_users` VALUES (626, '张子韬', 'ws4Mqp582L', '76919795212', '张子韬', 'M', '2017-06-11', 30);
INSERT INTO `t_users` VALUES (627, '程安琪', 'plR00IDhoB', '16524657464', '程安琪', 'F', '2022-03-06', 70);
INSERT INTO `t_users` VALUES (628, '徐安琪', 'nS8JgykhUq', '17002690291', '徐安琪', 'F', '2003-04-03', 93);
INSERT INTO `t_users` VALUES (629, '方杰宏', '3F3lXErDNh', '15977717865', '方杰宏', 'M', '2003-09-15', 91);
INSERT INTO `t_users` VALUES (630, '谢子韬', 'i3Kj3QaKQQ', '107015816', '谢子韬', 'M', '2021-04-02', 39);
INSERT INTO `t_users` VALUES (631, '杜云熙', 'LcdnOP3yH2', '14394291429', '杜云熙', 'M', '2023-01-12', 47);
INSERT INTO `t_users` VALUES (632, '张岚', 'yxIaMGYIoF', '7696178522', '张岚', 'F', '2014-09-25', 32);
INSERT INTO `t_users` VALUES (633, '贺子韬', 'WBw1S4oM4f', '7691226193', '贺子韬', 'M', '2015-05-24', 50);
INSERT INTO `t_users` VALUES (634, '武杰宏', 'MYOjJ43uiS', '13701748680', '武杰宏', 'M', '2001-11-17', 88);
INSERT INTO `t_users` VALUES (635, '武詩涵', '9kxOmkmxPA', '2191506523', '武詩涵', 'F', '2009-11-01', 56);
INSERT INTO `t_users` VALUES (636, '梁秀英', 'ZU5t3MLD3a', '7557508209', '梁秀英', 'F', '2016-04-02', 71);
INSERT INTO `t_users` VALUES (637, '戴宇宁', 'bShWJHNRRq', '18947296075', '戴宇宁', 'M', '2005-11-20', 83);
INSERT INTO `t_users` VALUES (638, '龚子异', 'WUsMPKR2gH', '7557589501', '龚子异', 'M', '2017-03-11', 72);
INSERT INTO `t_users` VALUES (639, '罗子异', 'k3nzW1t5E4', '13597186443', '罗子异', 'M', '2005-07-25', 23);
INSERT INTO `t_users` VALUES (640, '何子异', 'nfSdYGUQ0z', '7692514856', '何子异', 'M', '2011-01-17', 81);
INSERT INTO `t_users` VALUES (641, '秦杰宏', 'JGnrHk6uMH', '17316277365', '秦杰宏', 'M', '2001-04-08', 28);
INSERT INTO `t_users` VALUES (642, '曾震南', 'lOWj6zNysO', '13838893234', '曾震南', 'M', '2008-02-15', 96);
INSERT INTO `t_users` VALUES (643, '钟嘉伦', '066pwRZl7n', '289588896', '钟嘉伦', 'M', '2021-09-12', 51);
INSERT INTO `t_users` VALUES (644, '孙子异', 'TT64zuurWR', '2176476898', '孙子异', 'M', '2013-05-12', 66);
INSERT INTO `t_users` VALUES (645, '任璐', 'gG0PxFdf8k', '18369289840', '任璐', 'F', '2000-05-19', 22);
INSERT INTO `t_users` VALUES (646, '严秀英', 'rUFJwVnOJz', '18104253749', '严秀英', 'F', '2006-08-12', 75);
INSERT INTO `t_users` VALUES (647, '侯云熙', 'tD1hYX4qGY', '2046428745', '侯云熙', 'M', '2016-07-13', 37);
INSERT INTO `t_users` VALUES (648, '龙宇宁', 'W2gbl5TOPR', '7609994855', '龙宇宁', 'M', '2016-07-29', 58);
INSERT INTO `t_users` VALUES (649, '邓璐', 'NrGYHsXVBl', '285797137', '邓璐', 'F', '2015-06-17', 88);
INSERT INTO `t_users` VALUES (650, '汪晓明', '2i1qsKXq0X', '15655734076', '汪晓明', 'M', '2006-12-14', 57);
INSERT INTO `t_users` VALUES (651, '方秀英', 'bp1BibjaCG', '15456121204', '方秀英', 'F', '2011-11-23', 95);
INSERT INTO `t_users` VALUES (652, '程岚', 'hOWj1t361d', '7600936435', '程岚', 'F', '2024-05-03', 82);
INSERT INTO `t_users` VALUES (653, '杨秀英', 'ARgVEZU0ZX', '19733081812', '杨秀英', 'F', '2016-08-10', 73);
INSERT INTO `t_users` VALUES (654, '武子异', 'UaAqG1o4mp', '286248021', '武子异', 'M', '2011-05-13', 22);
INSERT INTO `t_users` VALUES (655, '廖晓明', 'h6DxHA9wDz', '18907193571', '廖晓明', 'M', '2007-03-27', 44);
INSERT INTO `t_users` VALUES (656, '姚岚', 'Hi7PNt8YmZ', '17219861979', '姚岚', 'F', '2018-11-28', 41);
INSERT INTO `t_users` VALUES (657, '许秀英', '88Cl3Lt56W', '15834772563', '许秀英', 'F', '2003-03-23', 42);
INSERT INTO `t_users` VALUES (658, '龙嘉伦', 'EuSwZngspF', '1070079812', '龙嘉伦', 'M', '2000-06-25', 69);
INSERT INTO `t_users` VALUES (659, '沈子异', '2QAzXSkpad', '15700454267', '沈子异', 'M', '2004-03-06', 44);
INSERT INTO `t_users` VALUES (660, '周子韬', 'wWZWNFkkYn', '219253347', '周子韬', 'M', '2024-03-13', 21);
INSERT INTO `t_users` VALUES (661, '吕震南', '8JAdhaExb8', '13727615468', '吕震南', 'M', '2004-09-07', 36);
INSERT INTO `t_users` VALUES (662, '黎晓明', 'gpDR1MGoeB', '2097850721', '黎晓明', 'M', '2009-12-26', 44);
INSERT INTO `t_users` VALUES (663, '高晓明', 'xfRu62DULA', '13728440313', '高晓明', 'M', '2024-02-26', 82);
INSERT INTO `t_users` VALUES (664, '毛云熙', 'Xd3QP0lXOj', '18757393387', '毛云熙', 'M', '2001-05-12', 84);
INSERT INTO `t_users` VALUES (665, '范璐', 'm35JvI27Ky', '280736442', '范璐', 'F', '2024-09-16', 79);
INSERT INTO `t_users` VALUES (666, '汤致远', 'tqyDTdrcEU', '2813996308', '汤致远', 'M', '2018-10-07', 76);
INSERT INTO `t_users` VALUES (667, '姚杰宏', 'XxQcBPxgyl', '15415929144', '姚杰宏', 'M', '2017-10-01', 34);
INSERT INTO `t_users` VALUES (668, '段杰宏', '1u0LFfi2Wj', '217758314', '段杰宏', 'M', '2012-01-18', 73);
INSERT INTO `t_users` VALUES (669, '黎安琪', 'm20OX3ip1A', '13667977354', '黎安琪', 'F', '2000-10-03', 80);
INSERT INTO `t_users` VALUES (670, '梁云熙', 'J5SAnhe8Po', '17409184382', '梁云熙', 'M', '2016-04-22', 78);
INSERT INTO `t_users` VALUES (671, '崔宇宁', 'DbldrDwfxs', '18862712784', '崔宇宁', 'M', '2013-05-24', 38);
INSERT INTO `t_users` VALUES (672, '常宇宁', 'pbG1vTcQpb', '2825574800', '常宇宁', 'M', '2009-08-10', 58);
INSERT INTO `t_users` VALUES (673, '陆嘉伦', 'gfo6AfK5gl', '75511998746', '陆嘉伦', 'M', '2013-01-05', 99);
INSERT INTO `t_users` VALUES (674, '汤子异', 'KMw06pxhsH', '16963720911', '汤子异', 'M', '2006-08-06', 64);
INSERT INTO `t_users` VALUES (675, '沈宇宁', 'b0Ud7hkPn4', '7609379738', '沈宇宁', 'M', '2019-05-03', 43);
INSERT INTO `t_users` VALUES (676, '王詩涵', 'oz8o6THPvL', '17223975151', '王詩涵', 'F', '2012-11-23', 57);
INSERT INTO `t_users` VALUES (677, '石震南', '44XBLa8Zu0', '19940198434', '石震南', 'M', '2012-08-14', 76);
INSERT INTO `t_users` VALUES (678, '尹子异', '9kMJMPWJWK', '14546490578', '尹子异', 'M', '2015-07-16', 29);
INSERT INTO `t_users` VALUES (679, '阎嘉伦', 'POGet7ZTab', '102885486', '阎嘉伦', 'M', '2022-11-08', 51);
INSERT INTO `t_users` VALUES (680, '邱云熙', 'IU3ol0bWto', '2158139258', '邱云熙', 'M', '2015-12-06', 45);
INSERT INTO `t_users` VALUES (681, '廖宇宁', 'qfUjO39pYl', '15231841214', '廖宇宁', 'M', '2012-07-07', 22);
INSERT INTO `t_users` VALUES (682, '范秀英', 'YyXwbttnK9', '76098545463', '范秀英', 'F', '2005-12-29', 36);
INSERT INTO `t_users` VALUES (683, '曹云熙', 'y3BdI2fRwE', '1087026900', '曹云熙', 'M', '2021-08-04', 99);
INSERT INTO `t_users` VALUES (684, '蔡岚', 'q69pI4NhP6', '2023266716', '蔡岚', 'F', '2004-08-23', 52);
INSERT INTO `t_users` VALUES (685, '孟杰宏', 'v2HK5cD4TG', '19634480561', '孟杰宏', 'M', '2018-04-23', 63);
INSERT INTO `t_users` VALUES (686, '刘震南', '5VZAAnS8Sm', '13448865576', '刘震南', 'M', '2001-09-20', 23);
INSERT INTO `t_users` VALUES (688, '张璐', 'HSwsVKTX6o', '17310404335', '张璐', 'F', '2006-06-08', 97);
INSERT INTO `t_users` VALUES (689, '高宇宁', '9bjk4No7jq', '76960984956', '高宇宁', 'M', '2006-01-12', 42);
INSERT INTO `t_users` VALUES (690, '龙震南', 'OiZ68WNHaz', '207525338', '龙震南', 'M', '2019-11-20', 88);
INSERT INTO `t_users` VALUES (691, '郑杰宏', 'fqpCE5Byw8', '287717921', '郑杰宏', 'M', '2023-09-12', 53);
INSERT INTO `t_users` VALUES (692, '韦子韬', 'rCK6lPQRvu', '76920151663', '韦子韬', 'M', '2000-06-22', 58);
INSERT INTO `t_users` VALUES (693, '袁岚', 'xcxAQUXAa0', '19526455530', '袁岚', 'F', '2018-07-13', 76);
INSERT INTO `t_users` VALUES (694, '郝嘉伦', 'mInJbYMvRG', '109967085', '郝嘉伦', 'M', '2008-08-19', 23);
INSERT INTO `t_users` VALUES (695, '曾睿', 'Wz7QzJhx7d', '203681698', '曾睿', 'M', '2003-12-08', 48);
INSERT INTO `t_users` VALUES (696, '孔晓明', 'rNxlY6Kfv4', '17210070116', '孔晓明', 'M', '2007-07-08', 27);
INSERT INTO `t_users` VALUES (697, '金震南', '4gTmVPIyk9', '16026821799', '金震南', 'M', '2007-02-01', 37);
INSERT INTO `t_users` VALUES (698, '丁安琪', 'gpgeMNmy6x', '2811518772', '丁安琪', 'F', '2003-06-03', 26);
INSERT INTO `t_users` VALUES (699, '宋璐', 'EhREaZz7YJ', '19995740325', '宋璐', 'F', '2006-01-31', 93);
INSERT INTO `t_users` VALUES (700, '袁震南', 'LAka4R5B1S', '76087776901', '袁震南', 'M', '2003-12-11', 62);
INSERT INTO `t_users` VALUES (701, '张詩涵', '46VAP4cmNa', '109847755', '张詩涵', 'F', '2002-06-13', 85);
INSERT INTO `t_users` VALUES (702, '高嘉伦', 'GCHKzGAb4m', '19514320895', '高嘉伦', 'M', '2010-01-11', 82);
INSERT INTO `t_users` VALUES (703, '何致远', 'yfrGYscYZM', '14839132854', '何致远', 'M', '2009-01-07', 64);
INSERT INTO `t_users` VALUES (704, '卢致远', 'ORMhGhruMC', '219398779', '卢致远', 'M', '2004-06-29', 90);
INSERT INTO `t_users` VALUES (705, '石致远', 'iRVT2qMs9h', '75575565130', '石致远', 'M', '2023-05-25', 27);
INSERT INTO `t_users` VALUES (706, '段云熙', 'Ud6DAZxElk', '14228485394', '段云熙', 'M', '2020-03-16', 39);
INSERT INTO `t_users` VALUES (707, '谢云熙', 'Ain10fUCor', '16621928371', '谢云熙', 'M', '2019-04-05', 87);
INSERT INTO `t_users` VALUES (708, '廖璐', 'izuqebfhlq', '1021311788', '廖璐', 'F', '2021-09-19', 89);
INSERT INTO `t_users` VALUES (709, '于子异', 'vLyyXcQXlK', '13438097945', '于子异', 'M', '2000-02-28', 88);
INSERT INTO `t_users` VALUES (710, '常璐', '6ULIZo0v7U', '16696843453', '常璐', 'F', '2004-02-26', 54);
INSERT INTO `t_users` VALUES (711, '吕晓明', '5TMcAyLrne', '102183580', '吕晓明', 'M', '2014-04-25', 69);
INSERT INTO `t_users` VALUES (712, '邓詩涵', 'uxbY3Rwu2Z', '285254321', '邓詩涵', 'F', '2013-10-19', 21);
INSERT INTO `t_users` VALUES (713, '段子异', 'tFuxc0cQmD', '13504717344', '段子异', 'M', '2012-12-23', 43);
INSERT INTO `t_users` VALUES (714, '董子韬', 'LJHr1wUtLj', '15079322967', '董子韬', 'M', '2018-10-05', 30);
INSERT INTO `t_users` VALUES (715, '石秀英', 'IxIDvfn683', '15848515453', '石秀英', 'F', '2007-09-07', 93);
INSERT INTO `t_users` VALUES (716, '黄子韬', 'NEeblpga1W', '17254827034', '黄子韬', 'M', '2000-02-09', 58);
INSERT INTO `t_users` VALUES (717, '尹晓明', 'ubuvr7mhvr', '18193621082', '尹晓明', 'M', '2017-02-04', 89);
INSERT INTO `t_users` VALUES (718, '陆宇宁', 'QswaA4iHSi', '2028426983', '陆宇宁', 'M', '2021-12-08', 82);
INSERT INTO `t_users` VALUES (719, '梁詩涵', 'nc3QhAyHt0', '14379051740', '梁詩涵', 'F', '2010-10-30', 79);
INSERT INTO `t_users` VALUES (720, '李杰宏', 'zFmYkK42nA', '19704038180', '李杰宏', 'M', '2003-05-16', 98);
INSERT INTO `t_users` VALUES (721, '蔡杰宏', 'hv1lapNq0o', '14839513794', '蔡杰宏', 'M', '2002-04-06', 86);
INSERT INTO `t_users` VALUES (722, '袁子韬', 'eQvjyEDYNx', '16261683915', '袁子韬', 'M', '2008-03-24', 78);
INSERT INTO `t_users` VALUES (723, '龙秀英', 'mUsEaNiTXI', '14669636612', '龙秀英', 'F', '2020-05-19', 25);
INSERT INTO `t_users` VALUES (724, '谭晓明', 'UMrtKachlL', '18403604429', '谭晓明', 'M', '2016-03-18', 24);
INSERT INTO `t_users` VALUES (725, '邵秀英', 'i3u6jJf4n1', '14662356268', '邵秀英', 'F', '2008-08-07', 50);
INSERT INTO `t_users` VALUES (726, '黎詩涵', 'Ad2Vwr7LQ6', '7694514016', '黎詩涵', 'F', '2014-03-12', 52);
INSERT INTO `t_users` VALUES (727, '董宇宁', 'vrzY9cPwtT', '75540697150', '董宇宁', 'M', '2019-03-10', 38);
INSERT INTO `t_users` VALUES (728, '沈璐', 'mYgifpadv4', '15109699095', '沈璐', 'F', '2020-05-13', 74);
INSERT INTO `t_users` VALUES (729, '赵致远', '7TS8KhHIcd', '15422450893', '赵致远', 'M', '2005-12-13', 36);
INSERT INTO `t_users` VALUES (730, '莫宇宁', 'YI4YlRaXxQ', '16389847674', '莫宇宁', 'M', '2016-08-09', 92);
INSERT INTO `t_users` VALUES (731, '严晓明', 'dHtjKM3uON', '209180289', '严晓明', 'M', '2007-09-05', 56);
INSERT INTO `t_users` VALUES (732, '高璐', 'xh3Zb3RLDo', '17981833288', '高璐', 'F', '2007-08-09', 82);
INSERT INTO `t_users` VALUES (733, '黄睿', 'd7mPQGbk3k', '15796311039', '黄睿', 'M', '2013-11-19', 83);
INSERT INTO `t_users` VALUES (734, '邹云熙', 'TFDwUk6eeb', '75559488127', '邹云熙', 'M', '2010-10-09', 70);
INSERT INTO `t_users` VALUES (735, '邵嘉伦', 'BXKQhYcGXg', '15590302702', '邵嘉伦', 'M', '2013-03-02', 90);
INSERT INTO `t_users` VALUES (736, '谢岚', 'l8bnN5mf7g', '14530552798', '谢岚', 'F', '2017-11-16', 33);
INSERT INTO `t_users` VALUES (737, '胡岚', '0SJdIXS3yE', '13384280808', '胡岚', 'F', '2024-06-06', 54);
INSERT INTO `t_users` VALUES (738, '董云熙', 'hdymidw0Gt', '17383803131', '董云熙', 'M', '2009-02-18', 73);
INSERT INTO `t_users` VALUES (739, '陆云熙', '7iX4yM0CxI', '14936354026', '陆云熙', 'M', '2015-05-12', 20);
INSERT INTO `t_users` VALUES (740, '胡震南', 'fGWlrf68tK', '16074810667', '胡震南', 'M', '2007-08-09', 78);
INSERT INTO `t_users` VALUES (741, '丁震南', 'N2fYkeWLHX', '2047378375', '丁震南', 'M', '2014-09-29', 90);
INSERT INTO `t_users` VALUES (742, '苏云熙', 'YL5MO7eLT8', '109473968', '苏云熙', 'M', '2019-08-22', 39);
INSERT INTO `t_users` VALUES (743, '雷子韬', '3edd0tEy4I', '18043911700', '雷子韬', 'M', '2021-08-24', 91);
INSERT INTO `t_users` VALUES (744, '傅安琪', 'xlzXmvBuJ1', '15812251856', '傅安琪', 'F', '2022-04-05', 31);
INSERT INTO `t_users` VALUES (745, '孙安琪', 'OGumY7XuLm', '7603967134', '孙安琪', 'F', '2002-11-10', 58);
INSERT INTO `t_users` VALUES (746, '马安琪', 'YaK8ZrnFDf', '206246869', '马安琪', 'F', '2017-05-03', 71);
INSERT INTO `t_users` VALUES (747, '毛詩涵', 'vYOEf2j3OJ', '2180161679', '毛詩涵', 'F', '2005-01-27', 77);
INSERT INTO `t_users` VALUES (748, '梁子异', 'o1wUz8dwJF', '1005012540', '梁子异', 'M', '2008-01-19', 33);
INSERT INTO `t_users` VALUES (749, '吕詩涵', 'vFCMJygLMm', '7692960615', '吕詩涵', 'F', '2001-06-18', 43);
INSERT INTO `t_users` VALUES (750, '毛杰宏', 'cQW2RqSVZe', '7694664115', '毛杰宏', 'M', '2001-03-22', 62);
INSERT INTO `t_users` VALUES (751, '唐震南', 'YkiyDAkzpl', '202248350', '唐震南', 'M', '2014-08-19', 89);
INSERT INTO `t_users` VALUES (752, '梁宇宁', 'hcAFcF06Ix', '15871191192', '梁宇宁', 'M', '2008-02-10', 55);
INSERT INTO `t_users` VALUES (753, '陈詩涵', 'cP2AQmL4xu', '19089515909', '陈詩涵', 'F', '2020-07-07', 50);
INSERT INTO `t_users` VALUES (754, '曹安琪', '8p2qpJ1uxI', '2027812781', '曹安琪', 'F', '2006-09-15', 68);
INSERT INTO `t_users` VALUES (755, '萧子异', 'aMrYwhXRSa', '18921507542', '萧子异', 'M', '2006-04-29', 45);
INSERT INTO `t_users` VALUES (756, '黎秀英', 'HP0WthgLSN', '7690593501', '黎秀英', 'F', '2006-09-01', 85);
INSERT INTO `t_users` VALUES (757, '谭安琪', 'ljJgUdn02x', '75515820815', '谭安琪', 'F', '2007-03-16', 96);
INSERT INTO `t_users` VALUES (758, '蒋子异', 'SRTmSZludL', '19601470387', '蒋子异', 'M', '2021-05-31', 24);
INSERT INTO `t_users` VALUES (759, '常子韬', 'VvD0hjuErS', '14980117122', '常子韬', 'M', '2007-07-21', 72);
INSERT INTO `t_users` VALUES (760, '余璐', 'EB8MLRCbRv', '76955876579', '余璐', 'F', '2021-05-25', 67);
INSERT INTO `t_users` VALUES (761, '陈嘉伦', 'U4mjlX0Rih', '15488170153', '陈嘉伦', 'M', '2008-08-08', 23);
INSERT INTO `t_users` VALUES (762, '郭岚', 'vh7lDd44VN', '208019572', '郭岚', 'F', '2019-10-12', 33);
INSERT INTO `t_users` VALUES (763, '余岚', 'W1zHjUTUvP', '17571851539', '余岚', 'F', '2016-01-09', 94);
INSERT INTO `t_users` VALUES (764, '谢璐', 'tsNUYMxzEP', '19087829543', '谢璐', 'F', '2021-07-24', 91);
INSERT INTO `t_users` VALUES (765, '赵云熙', 'yicsmDOVSL', '76991244270', '赵云熙', 'M', '2023-11-16', 70);
INSERT INTO `t_users` VALUES (766, '贺致远', '3CPoROYh4o', '7690338682', '贺致远', 'M', '2000-05-12', 22);
INSERT INTO `t_users` VALUES (767, '吕璐', '8f7Gc1XaIK', '18797850716', '吕璐', 'F', '2011-11-07', 74);
INSERT INTO `t_users` VALUES (768, '叶岚', '9djkyGG8zm', '14027487665', '叶岚', 'F', '2007-04-22', 86);
INSERT INTO `t_users` VALUES (769, '刘子韬', 'AtolUAcFuP', '2858009851', '刘子韬', 'M', '2016-07-30', 62);
INSERT INTO `t_users` VALUES (770, '高秀英', '94cfuNRqan', '18058816568', '高秀英', 'F', '2005-02-15', 36);
INSERT INTO `t_users` VALUES (771, '刘安琪', 'udqC2GQFaS', '76917507547', '刘安琪', 'F', '2010-01-28', 41);
INSERT INTO `t_users` VALUES (772, '魏嘉伦', 'z38vSuszaO', '2131504285', '魏嘉伦', 'M', '2021-09-23', 24);
INSERT INTO `t_users` VALUES (773, '杜睿', 'GXfbt2WcEr', '17781356161', '杜睿', 'M', '2022-07-12', 71);
INSERT INTO `t_users` VALUES (774, '徐璐', 'jIKXPueymN', '16144324943', '徐璐', 'F', '2020-07-12', 60);
INSERT INTO `t_users` VALUES (775, '史璐', 'PQzWzXPP93', '105610822', '史璐', 'F', '2003-07-08', 56);
INSERT INTO `t_users` VALUES (776, '萧詩涵', '70VpwrMVqH', '7690755919', '萧詩涵', 'F', '2015-04-16', 98);
INSERT INTO `t_users` VALUES (777, '秦嘉伦', 'lXhTM5pl4q', '14795777373', '秦嘉伦', 'M', '2007-05-17', 32);
INSERT INTO `t_users` VALUES (778, '雷宇宁', 'lnJdxhU5wP', '16443781577', '雷宇宁', 'M', '2012-09-11', 73);
INSERT INTO `t_users` VALUES (779, '雷岚', '2jHI4jt4FG', '14007706306', '雷岚', 'F', '2020-05-01', 20);
INSERT INTO `t_users` VALUES (780, '姚安琪', 'OBsGqJ0XCQ', '2166770242', '姚安琪', 'F', '2015-06-28', 34);
INSERT INTO `t_users` VALUES (781, '熊嘉伦', 'w7MKeNF4Vw', '7696624978', '熊嘉伦', 'M', '2012-02-02', 62);
INSERT INTO `t_users` VALUES (782, '严宇宁', 'b6HLwx9yxr', '76034532878', '严宇宁', 'M', '2007-03-19', 21);
INSERT INTO `t_users` VALUES (783, '钱子韬', 'cotO0Ug7d7', '2152777997', '钱子韬', 'M', '2003-06-11', 28);
INSERT INTO `t_users` VALUES (784, '于宇宁', 'fTzwNUG7mj', '13366639458', '于宇宁', 'M', '2015-06-10', 95);
INSERT INTO `t_users` VALUES (786, '邵宇宁', 'yDpGXxM7BB', '18788349118', '邵宇宁', 'M', '2008-12-06', 44);
INSERT INTO `t_users` VALUES (787, '杨嘉伦', 'QMnWqeU0qT', '16847531317', '杨嘉伦', 'M', '2019-03-12', 86);
INSERT INTO `t_users` VALUES (788, '熊云熙', '2W3I9PV9uI', '76033754074', '熊云熙', 'M', '2014-09-05', 48);
INSERT INTO `t_users` VALUES (789, '于晓明', 'k06HWgB4F5', '282912553', '于晓明', 'M', '2022-12-19', 58);
INSERT INTO `t_users` VALUES (790, '蒋子韬', '7kkVCGPKUx', '1008410890', '蒋子韬', 'M', '2010-10-28', 84);
INSERT INTO `t_users` VALUES (791, '邹致远', 'rpJ2e9RnWK', '2153227036', '邹致远', 'M', '2020-10-11', 30);
INSERT INTO `t_users` VALUES (792, '孔子异', 'lGcq4tK8nj', '17448111340', '孔子异', 'M', '2010-03-20', 69);
INSERT INTO `t_users` VALUES (793, '钟秀英', 'vwPpxFqwOC', '75509419237', '钟秀英', 'F', '2002-02-12', 32);
INSERT INTO `t_users` VALUES (794, '何詩涵', 'svrhfqskYq', '280883758', '何詩涵', 'F', '2001-04-27', 78);
INSERT INTO `t_users` VALUES (795, '陆子异', 'Hel4EDu29o', '16385814816', '陆子异', 'M', '2003-09-23', 42);
INSERT INTO `t_users` VALUES (796, '谭子韬', 'BO4HWAlnei', '19734313433', '谭子韬', 'M', '2017-07-30', 44);
INSERT INTO `t_users` VALUES (797, '邹岚', 'RnAb0gyTGr', '286511448', '邹岚', 'F', '2015-09-29', 48);
INSERT INTO `t_users` VALUES (798, '朱嘉伦', 'ORVomWr501', '76065306284', '朱嘉伦', 'M', '2001-09-07', 53);
INSERT INTO `t_users` VALUES (799, '黄璐', 'gkxwF6Vq9U', '283405105', '黄璐', 'F', '2012-09-10', 31);
INSERT INTO `t_users` VALUES (800, '刘璐', 'wKbqotNofa', '14978794397', '刘璐', 'F', '2024-07-28', 31);
INSERT INTO `t_users` VALUES (801, '卢子异', 'sB4pIFEQjA', '19921867508', '卢子异', 'M', '2007-10-07', 61);
INSERT INTO `t_users` VALUES (802, '姚宇宁', '85UF4ga73L', '219075873', '姚宇宁', 'M', '2007-02-03', 36);
INSERT INTO `t_users` VALUES (803, '赵岚', 'M5X4siuFqp', '215830149', '赵岚', 'F', '2000-09-30', 41);
INSERT INTO `t_users` VALUES (804, '常秀英', 'X6q9ak4SYL', '2047758148', '常秀英', 'F', '2004-09-25', 73);
INSERT INTO `t_users` VALUES (805, '江安琪', 'Id6TEKLHSn', '19309769001', '江安琪', 'F', '2018-08-16', 36);
INSERT INTO `t_users` VALUES (806, '马致远', 'NUjl1812vH', '15700377445', '马致远', 'M', '2012-03-03', 90);
INSERT INTO `t_users` VALUES (807, '韦杰宏', 'NSxlg20HRL', '76009799486', '韦杰宏', 'M', '2001-05-15', 25);
INSERT INTO `t_users` VALUES (808, '汪宇宁', 'gHuhEWOV1n', '203707489', '汪宇宁', 'M', '2018-01-12', 82);
INSERT INTO `t_users` VALUES (809, '丁秀英', 'FE74ewgAE0', '15783857648', '丁秀英', 'F', '2020-09-07', 41);
INSERT INTO `t_users` VALUES (810, '金岚', 'xSXiMYpNSn', '2156065167', '金岚', 'F', '2017-04-19', 64);
INSERT INTO `t_users` VALUES (811, '傅睿', 'rA218nV2A6', '76903293954', '傅睿', 'M', '2005-04-26', 54);
INSERT INTO `t_users` VALUES (812, '赵詩涵', '9iPFJqALZI', '1066224658', '赵詩涵', 'F', '2018-04-30', 99);
INSERT INTO `t_users` VALUES (813, '范睿', 'ERohxRbGd7', '202850540', '范睿', 'M', '2007-10-18', 45);
INSERT INTO `t_users` VALUES (814, '孟晓明', 'K2F3lgzKdx', '7695634885', '孟晓明', 'M', '2022-11-09', 54);
INSERT INTO `t_users` VALUES (815, '江岚', 'gAkakKxP6L', '16881028273', '江岚', 'F', '2001-11-19', 32);
INSERT INTO `t_users` VALUES (816, '吕子异', 'NZHEodYLeJ', '208370685', '吕子异', 'M', '2001-08-05', 57);
INSERT INTO `t_users` VALUES (817, '孙秀英', '9t9LDbIpGq', '76039187467', '孙秀英', 'F', '2010-06-15', 75);
INSERT INTO `t_users` VALUES (818, '罗睿', 'OK5xSF8cKL', '19336334139', '罗睿', 'M', '2012-02-22', 74);
INSERT INTO `t_users` VALUES (819, '傅杰宏', 'wxbdQZCBRB', '211945629', '傅杰宏', 'M', '2019-11-02', 87);
INSERT INTO `t_users` VALUES (820, '姜岚', 'rLdSpk17FY', '14855959244', '姜岚', 'F', '2007-01-09', 79);
INSERT INTO `t_users` VALUES (821, '段致远', 'M7dcfknVov', '14410623826', '段致远', 'M', '2021-11-11', 56);
INSERT INTO `t_users` VALUES (822, '段安琪', 'BMndQxeBSg', '76006132526', '段安琪', 'F', '2004-10-29', 64);
INSERT INTO `t_users` VALUES (824, '郑嘉伦', 'JYdVwmGgjp', '17852571823', '郑嘉伦', 'M', '2024-01-05', 51);
INSERT INTO `t_users` VALUES (825, '杨致远', 'SXM187tsCR', '218500931', '杨致远', 'M', '2012-10-03', 75);
INSERT INTO `t_users` VALUES (826, '韩云熙', 'fWLbroHLFW', '17710271175', '韩云熙', 'M', '2006-06-20', 39);
INSERT INTO `t_users` VALUES (827, '廖云熙', 'U6qelurRko', '13134993232', '廖云熙', 'M', '2012-05-23', 90);
INSERT INTO `t_users` VALUES (828, '谭詩涵', 'HmQIif25yj', '75543269192', '谭詩涵', 'F', '2001-02-15', 55);
INSERT INTO `t_users` VALUES (829, '姚震南', 'QV2q7H7zvY', '7698241379', '姚震南', 'M', '2009-10-05', 97);
INSERT INTO `t_users` VALUES (830, '孟睿', 'pDyeMWqGoX', '7559748938', '孟睿', 'M', '2009-07-09', 77);
INSERT INTO `t_users` VALUES (831, '武璐', 'KBzyFJX1Tf', '16977831929', '武璐', 'F', '2002-03-30', 79);
INSERT INTO `t_users` VALUES (832, '方岚', 'aJUnLMgJTP', '18086348131', '方岚', 'F', '2007-11-10', 60);
INSERT INTO `t_users` VALUES (833, '向子韬', 'LgXXJOmNj5', '16727288216', '向子韬', 'M', '2015-03-12', 76);
INSERT INTO `t_users` VALUES (834, '黄秀英', 'd9QchTckTk', '207499883', '黄秀英', 'F', '2018-05-30', 45);
INSERT INTO `t_users` VALUES (835, '罗致远', '6iu7Wc0PBM', '19736216436', '罗致远', 'M', '2014-04-16', 80);
INSERT INTO `t_users` VALUES (836, '戴子韬', 'jc0J5o1trb', '288096111', '戴子韬', 'M', '2023-01-06', 38);
INSERT INTO `t_users` VALUES (837, '汤嘉伦', 'TMbXHsvr6e', '13490328386', '汤嘉伦', 'M', '2017-09-10', 97);
INSERT INTO `t_users` VALUES (838, '姜睿', 'SYSwKczXi3', '2876618861', '姜睿', 'M', '2001-02-07', 67);
INSERT INTO `t_users` VALUES (839, '朱岚', 'e7RT0bLtga', '7699152473', '朱岚', 'F', '2002-01-16', 39);
INSERT INTO `t_users` VALUES (840, '陈云熙', 'Yl5xR2B1Io', '19594349333', '陈云熙', 'M', '2016-08-06', 67);
INSERT INTO `t_users` VALUES (841, '曹秀英', 'OSSNeJp2pC', '18556529922', '曹秀英', 'F', '2020-04-21', 52);
INSERT INTO `t_users` VALUES (842, '贺璐', 'slhOMhjR3G', '287685135', '贺璐', 'F', '2014-05-01', 79);
INSERT INTO `t_users` VALUES (843, '黄詩涵', 'OheXW688Se', '107303202', '黄詩涵', 'F', '2007-04-18', 83);
INSERT INTO `t_users` VALUES (844, '雷嘉伦', 'snvdH44oQT', '205513282', '雷嘉伦', 'M', '2023-03-14', 68);
INSERT INTO `t_users` VALUES (845, '曹詩涵', '7AhSUWMVQh', '7608813075', '曹詩涵', 'F', '2006-10-15', 97);
INSERT INTO `t_users` VALUES (846, '顾震南', 'ris10PzySK', '76955037452', '顾震南', 'M', '2008-03-20', 54);
INSERT INTO `t_users` VALUES (847, '邓子异', 'ovvaOKX1Tn', '76018553551', '邓子异', 'M', '2016-11-27', 87);
INSERT INTO `t_users` VALUES (848, '冯晓明', 'HDcD7Oi5mt', '104111915', '冯晓明', 'M', '2014-09-11', 70);
INSERT INTO `t_users` VALUES (849, '吕子韬', '9XxsyfbWxL', '18470692443', '吕子韬', 'M', '2003-05-14', 78);
INSERT INTO `t_users` VALUES (850, '萧璐', '5p0Y0ew2zU', '15297052562', '萧璐', 'F', '2012-09-23', 20);
INSERT INTO `t_users` VALUES (851, '常致远', 'qkcBVxADY2', '280810389', '常致远', 'M', '2016-01-18', 37);
INSERT INTO `t_users` VALUES (852, '汤秀英', '5M7EnfZiqk', '2894776583', '汤秀英', 'F', '2022-08-17', 21);
INSERT INTO `t_users` VALUES (853, '蒋云熙', 'aFLTMDDoE5', '216806460', '蒋云熙', 'M', '2012-06-30', 55);
INSERT INTO `t_users` VALUES (854, '卢秀英', 'ns46rJzdXX', '2888423605', '卢秀英', 'F', '2015-08-12', 34);
INSERT INTO `t_users` VALUES (855, '韦震南', 'PPYncc26PE', '7695000748', '韦震南', 'M', '2017-12-22', 54);
INSERT INTO `t_users` VALUES (856, '赵杰宏', '1axj2nj3xN', '1028015725', '赵杰宏', 'M', '2011-05-17', 40);
INSERT INTO `t_users` VALUES (857, '武晓明', 'jL2SCzZPKr', '18295943499', '武晓明', 'M', '2005-07-16', 70);
INSERT INTO `t_users` VALUES (858, '蒋震南', 'FmZ4HyPXZT', '75596789405', '蒋震南', 'M', '2021-06-19', 85);
INSERT INTO `t_users` VALUES (859, '丁岚', '0A98Z1NOFj', '76040916733', '丁岚', 'F', '2012-05-21', 74);
INSERT INTO `t_users` VALUES (860, '唐云熙', 'UXO6xcfRjE', '17583025942', '唐云熙', 'M', '2017-09-15', 86);
INSERT INTO `t_users` VALUES (861, '顾宇宁', 'gcGEWiqC3n', '76985497797', '顾宇宁', 'M', '2012-01-15', 77);
INSERT INTO `t_users` VALUES (862, '常詩涵', 'IPkRoGkbkr', '17584304970', '常詩涵', 'F', '2015-09-09', 81);
INSERT INTO `t_users` VALUES (863, '姜宇宁', 'rpk4MZp8Y7', '2136416321', '姜宇宁', 'M', '2019-04-29', 94);
INSERT INTO `t_users` VALUES (864, '高子韬', 'ayUMWfD2dC', '15946951803', '高子韬', 'M', '2011-03-13', 84);
INSERT INTO `t_users` VALUES (865, '韩璐', 'L1cOe5aqQo', '15690234976', '韩璐', 'F', '2018-09-04', 73);
INSERT INTO `t_users` VALUES (866, '孙嘉伦', 'V7nokZrLlU', '7556608846', '孙嘉伦', 'M', '2005-03-17', 48);
INSERT INTO `t_users` VALUES (867, '龙致远', 'e89xkNqDCb', '76043213450', '龙致远', 'M', '2002-02-28', 50);
INSERT INTO `t_users` VALUES (868, '陈致远', '6xrrwCKzVK', '285187959', '陈致远', 'M', '2006-01-01', 58);
INSERT INTO `t_users` VALUES (869, '徐云熙', 'nLRDCdn2E5', '17585913307', '徐云熙', 'M', '2005-12-19', 24);
INSERT INTO `t_users` VALUES (870, '严震南', '1wvUyYB4n5', '19556624710', '严震南', 'M', '2005-06-15', 43);
INSERT INTO `t_users` VALUES (871, '莫睿', 'v5kJw1hUoM', '19413441356', '莫睿', 'M', '2001-06-05', 35);
INSERT INTO `t_users` VALUES (872, '贾岚', 'k2wqheR9qR', '17044052122', '贾岚', 'F', '2023-04-03', 66);
INSERT INTO `t_users` VALUES (873, '贾子异', 'Q5vG73FVSc', '2097364641', '贾子异', 'M', '2021-08-26', 23);
INSERT INTO `t_users` VALUES (874, '莫晓明', 'PefNgvk32Y', '19581569529', '莫晓明', 'M', '2012-12-14', 63);
INSERT INTO `t_users` VALUES (875, '薛璐', 'bAVmB8NNqp', '1089745433', '薛璐', 'F', '2023-02-25', 49);
INSERT INTO `t_users` VALUES (876, '龚詩涵', '3qzLCBwJZC', '15630810501', '龚詩涵', 'F', '2013-11-02', 87);
INSERT INTO `t_users` VALUES (877, '尹秀英', 'EMqQyM3aRA', '1085020619', '尹秀英', 'F', '2022-10-25', 54);
INSERT INTO `t_users` VALUES (878, '汪安琪', 'jTCygOvIh2', '7555101713', '汪安琪', 'F', '2023-07-18', 74);
INSERT INTO `t_users` VALUES (879, '孙睿', 'qUAi9FoMPM', '13843756552', '孙睿', 'M', '2004-09-26', 24);
INSERT INTO `t_users` VALUES (880, '薛岚', 'mLmg7METr8', '14890073765', '薛岚', 'F', '2016-05-10', 82);
INSERT INTO `t_users` VALUES (881, '阎杰宏', 'PEmv6VfqEg', '19937725771', '阎杰宏', 'M', '2020-04-01', 42);
INSERT INTO `t_users` VALUES (882, '田子韬', 'cjNnAuVOiB', '2897032256', '田子韬', 'M', '2004-08-30', 87);
INSERT INTO `t_users` VALUES (883, '马嘉伦', 'sms3FoHW5q', '17466704342', '马嘉伦', 'M', '2011-01-11', 40);
INSERT INTO `t_users` VALUES (884, '卢嘉伦', 'KyEjBTbUOI', '19294943145', '卢嘉伦', 'M', '2020-06-30', 55);
INSERT INTO `t_users` VALUES (885, '苏睿', 'tsqEUCYJwV', '19714706447', '苏睿', 'M', '2002-03-18', 51);
INSERT INTO `t_users` VALUES (886, '高杰宏', 'NH1ngC3ZQl', '75586012719', '高杰宏', 'M', '2023-01-16', 79);
INSERT INTO `t_users` VALUES (887, '高睿', 'fNq5RZsiRM', '15269692855', '高睿', 'M', '2020-05-04', 37);
INSERT INTO `t_users` VALUES (888, '蔡睿', 'Mfj33AvXZN', '76900166762', '蔡睿', 'M', '2024-08-14', 24);
INSERT INTO `t_users` VALUES (889, '沈嘉伦', 'UNKrIiDZ1U', '13039543396', '沈嘉伦', 'M', '2009-12-12', 50);
INSERT INTO `t_users` VALUES (890, '雷震南', '3jWx6EvXHZ', '19159739190', '雷震南', 'M', '2022-08-24', 63);
INSERT INTO `t_users` VALUES (891, '唐睿', 'DdJeyajW35', '2154635419', '唐睿', 'M', '2000-07-21', 21);
INSERT INTO `t_users` VALUES (892, '尹云熙', 'AQ9uO8FrMj', '1013136034', '尹云熙', 'M', '2007-11-15', 23);
INSERT INTO `t_users` VALUES (893, '朱子韬', '9zBCh6o1ef', '19418759400', '朱子韬', 'M', '2008-01-24', 32);
INSERT INTO `t_users` VALUES (894, '龚岚', 'GYS9gj2u8r', '7557475710', '龚岚', 'F', '2016-09-07', 32);
INSERT INTO `t_users` VALUES (895, '韩致远', 'ttqblJ0yY6', '209127748', '韩致远', 'M', '2021-05-04', 94);
INSERT INTO `t_users` VALUES (896, '陶睿', 'sabL2o3p1S', '76962871676', '陶睿', 'M', '2021-12-05', 87);
INSERT INTO `t_users` VALUES (897, '周睿', 'mSr0gg91i5', '17539939479', '周睿', 'M', '2010-07-10', 36);
INSERT INTO `t_users` VALUES (898, '刘宇宁', 'yGTNWug9Te', '7551297383', '刘宇宁', 'M', '2021-04-01', 60);
INSERT INTO `t_users` VALUES (899, '谢嘉伦', 'S1A7sFbatA', '13543247568', '谢嘉伦', 'M', '2008-10-17', 25);
INSERT INTO `t_users` VALUES (900, '熊安琪', 'xZvU6HwQgv', '200606259', '熊安琪', 'F', '2021-10-19', 86);
INSERT INTO `t_users` VALUES (901, '邱嘉伦', 'DV1UqQHeUa', '13866462192', '邱嘉伦', 'M', '2002-04-09', 36);
INSERT INTO `t_users` VALUES (902, '苏詩涵', 'fcRZuy1cvk', '2826808766', '苏詩涵', 'F', '2024-09-08', 79);
INSERT INTO `t_users` VALUES (903, '苏秀英', 'DP6bngEsy3', '7600774842', '苏秀英', 'F', '2014-11-15', 73);
INSERT INTO `t_users` VALUES (904, '唐子韬', 'D1Hz2XalkO', '14878004000', '唐子韬', 'M', '2005-02-27', 43);
INSERT INTO `t_users` VALUES (905, '黄晓明', '4pYJskNKwZ', '19094247487', '黄晓明', 'M', '2012-11-18', 45);
INSERT INTO `t_users` VALUES (906, '史杰宏', 'm9e6PBbnO0', '18880374293', '史杰宏', 'M', '2015-01-09', 24);
INSERT INTO `t_users` VALUES (907, '陶震南', 'e7eYyPGRq6', '7551588640', '陶震南', 'M', '2024-07-10', 52);
INSERT INTO `t_users` VALUES (908, '苏子异', '8ToWp0O7is', '19576731806', '苏子异', 'M', '2022-04-01', 86);
INSERT INTO `t_users` VALUES (909, '谢秀英', 'if4DQdFLPo', '2144371150', '谢秀英', 'F', '2019-08-02', 45);
INSERT INTO `t_users` VALUES (910, '尹杰宏', 'W92TMTgdmS', '2852566229', '尹杰宏', 'M', '2013-12-28', 81);
INSERT INTO `t_users` VALUES (911, '常子异', 'TH9ikliRhs', '13619129847', '常子异', 'M', '2002-11-22', 26);
INSERT INTO `t_users` VALUES (912, '徐致远', '5yOaEyPEAc', '75535533151', '徐致远', 'M', '2013-07-29', 64);
INSERT INTO `t_users` VALUES (913, '顾秀英', 'LSFRwnp8fg', '288016400', '顾秀英', 'F', '2019-01-12', 80);
INSERT INTO `t_users` VALUES (914, '胡子异', 'iYRGeIjp4S', '16617978048', '胡子异', 'M', '2016-06-23', 65);
INSERT INTO `t_users` VALUES (915, '钱杰宏', 'bIJxR1QNOD', '1090455672', '钱杰宏', 'M', '2015-03-17', 84);
INSERT INTO `t_users` VALUES (916, '郭秀英', 'JgC3fQInzF', '7694347868', '郭秀英', 'F', '2011-06-02', 33);
INSERT INTO `t_users` VALUES (917, '彭子韬', 'sbMD27gmSP', '1035010887', '彭子韬', 'M', '2014-05-31', 48);
INSERT INTO `t_users` VALUES (918, '余宇宁', 'uaKQUaRiSj', '13396164573', '余宇宁', 'M', '2007-08-30', 41);
INSERT INTO `t_users` VALUES (919, '雷杰宏', 'puwknG2ufu', '17888145982', '雷杰宏', 'M', '2003-11-08', 70);
INSERT INTO `t_users` VALUES (920, '毛秀英', '0VoZIJZAtB', '2804351031', '毛秀英', 'F', '2017-05-09', 46);
INSERT INTO `t_users` VALUES (921, '黄子异', 'P0WdsA4LSd', '75549072378', '黄子异', 'M', '2003-05-03', 61);
INSERT INTO `t_users` VALUES (922, '汪云熙', 'MD2P8pBZGs', '219661529', '汪云熙', 'M', '2010-05-07', 55);
INSERT INTO `t_users` VALUES (923, '崔岚', '9q8yOwHfP6', '7699387266', '崔岚', 'F', '2020-07-09', 34);
INSERT INTO `t_users` VALUES (924, '彭子异', 'vF8tiTTCxi', '19374638548', '彭子异', 'M', '2009-12-26', 87);
INSERT INTO `t_users` VALUES (925, '曾致远', 'iKnogjtJHq', '15360643761', '曾致远', 'M', '2015-08-23', 74);
INSERT INTO `t_users` VALUES (926, '郭安琪', 'TIuE5VjHbR', '18653441842', '郭安琪', 'F', '2008-05-30', 47);
INSERT INTO `t_users` VALUES (927, '范杰宏', '7XmnajGeAq', '19373744416', '范杰宏', 'M', '2010-09-21', 31);
INSERT INTO `t_users` VALUES (928, '潘安琪', '3TaGT7lHAN', '205204201', '潘安琪', 'F', '2009-08-31', 68);
INSERT INTO `t_users` VALUES (929, '陆晓明', '4haYLwVJb0', '7691500050', '陆晓明', 'M', '2016-08-22', 39);
INSERT INTO `t_users` VALUES (930, '谢震南', 'jq7zKhlvts', '18295915943', '谢震南', 'M', '2000-08-25', 39);
INSERT INTO `t_users` VALUES (931, '罗晓明', 'B9yNAu9tjk', '75588112076', '罗晓明', 'M', '2008-08-30', 43);
INSERT INTO `t_users` VALUES (932, '陆震南', 'pUAVo4GKyh', '16583573282', '陆震南', 'M', '2023-02-24', 48);
INSERT INTO `t_users` VALUES (933, '贺安琪', '6lFUCSqOSV', '7693569829', '贺安琪', 'F', '2014-01-14', 52);
INSERT INTO `t_users` VALUES (934, '贾詩涵', '6oXa8UnoEL', '76998424126', '贾詩涵', 'F', '2002-09-29', 69);
INSERT INTO `t_users` VALUES (935, '陆秀英', 'tU50cHrspr', '76986700916', '陆秀英', 'F', '2008-09-27', 20);
INSERT INTO `t_users` VALUES (936, '黄致远', 'LVulufQ6tm', '7602059657', '黄致远', 'M', '2019-04-18', 67);
INSERT INTO `t_users` VALUES (937, '胡秀英', 'FO9pfgj5wu', '19404991808', '胡秀英', 'F', '2020-10-22', 91);
INSERT INTO `t_users` VALUES (938, '马云熙', '0B5Ihh7n7t', '16186898578', '马云熙', 'M', '2022-06-05', 90);
INSERT INTO `t_users` VALUES (939, '姚璐', 'wZXDxVv9mE', '7552809243', '姚璐', 'F', '2022-08-30', 97);
INSERT INTO `t_users` VALUES (940, '姜璐', 'cd2LkAS7Db', '1014059582', '姜璐', 'F', '2000-09-05', 55);
INSERT INTO `t_users` VALUES (941, '尹岚', '3uxChaRX99', '13650381901', '尹岚', 'F', '2008-10-13', 64);
INSERT INTO `t_users` VALUES (942, '秦晓明', '8vl7WC0stU', '210175121', '秦晓明', 'M', '2015-08-10', 88);
INSERT INTO `t_users` VALUES (943, '孔杰宏', 'snq9RkE9Jr', '18910564023', '孔杰宏', 'M', '2003-04-07', 20);
INSERT INTO `t_users` VALUES (944, '侯詩涵', 'C5vqDy0SBY', '75578354916', '侯詩涵', 'F', '2018-10-31', 50);
INSERT INTO `t_users` VALUES (945, '郭嘉伦', 'Dz9xbn5nWb', '1075802882', '郭嘉伦', 'M', '2003-03-08', 91);
INSERT INTO `t_users` VALUES (946, '龙子异', 'BPjDkESYib', '209934358', '龙子异', 'M', '2007-09-21', 36);
INSERT INTO `t_users` VALUES (947, '薛致远', 'I2VlZerL0Y', '215772836', '薛致远', 'M', '2002-03-15', 37);
INSERT INTO `t_users` VALUES (948, '王子韬', 'HzNe7wn6Sl', '18936029601', '王子韬', 'M', '2018-10-25', 92);
INSERT INTO `t_users` VALUES (949, '朱晓明', 'iwVKP8dorf', '2047499139', '朱晓明', 'M', '2009-04-10', 90);
INSERT INTO `t_users` VALUES (950, '贾致远', '1ldYMQ3rB1', '7692376219', '贾致远', 'M', '2022-07-26', 35);
INSERT INTO `t_users` VALUES (951, '曾云熙', 'dqu1aJ76fJ', '17910231908', '曾云熙', 'M', '2018-07-11', 71);
INSERT INTO `t_users` VALUES (952, '龚宇宁', 'bNEltkVWr5', '7692268407', '龚宇宁', 'M', '2001-10-28', 21);
INSERT INTO `t_users` VALUES (953, '姚睿', '2KiCvCC3YS', '17260416133', '姚睿', 'M', '2000-08-27', 76);
INSERT INTO `t_users` VALUES (954, '冯嘉伦', 'osNvr0Hq36', '7602177382', '冯嘉伦', 'M', '2016-11-10', 85);
INSERT INTO `t_users` VALUES (955, '丁杰宏', 'OzWm9coLJX', '15424720738', '丁杰宏', 'M', '2017-09-23', 29);
INSERT INTO `t_users` VALUES (956, '魏晓明', 'e2TnauaR2I', '7601637856', '魏晓明', 'M', '2010-09-14', 54);
INSERT INTO `t_users` VALUES (957, '杨璐', 'fM1cQKJfjX', '2075683512', '杨璐', 'F', '2008-04-20', 76);
INSERT INTO `t_users` VALUES (958, '陶云熙', 's4pbgBzpYu', '16241619932', '陶云熙', 'M', '2003-12-05', 99);
INSERT INTO `t_users` VALUES (959, '杜嘉伦', 'SawQi2bqjd', '18541647854', '杜嘉伦', 'M', '2007-03-10', 88);
INSERT INTO `t_users` VALUES (960, '潘宇宁', 'UmKPEvyhFS', '284857626', '潘宇宁', 'M', '2001-01-24', 26);
INSERT INTO `t_users` VALUES (961, '朱杰宏', 'jm4hXexv5M', '1084882251', '朱杰宏', 'M', '2002-06-19', 75);
INSERT INTO `t_users` VALUES (962, '程云熙', 'QbsRR5I9Yh', '212281806', '程云熙', 'M', '2024-05-01', 77);
INSERT INTO `t_users` VALUES (963, '田子异', 'bfU4MYAsXH', '16394551624', '田子异', 'M', '2006-10-24', 81);
INSERT INTO `t_users` VALUES (964, '金安琪', '2I6EAtUyCe', '19879226548', '金安琪', 'F', '2005-09-23', 26);
INSERT INTO `t_users` VALUES (965, '丁致远', 'yIRYhE1EoX', '16517472962', '丁致远', 'M', '2019-03-16', 28);
INSERT INTO `t_users` VALUES (966, '吴晓明', 'gpQSoeMClD', '75503443203', '吴晓明', 'M', '2023-08-07', 52);
INSERT INTO `t_users` VALUES (967, '阎晓明', 'Za53E2X33z', '1029211571', '阎晓明', 'M', '2018-02-19', 49);
INSERT INTO `t_users` VALUES (968, '汤安琪', 'UDBhKmCS2V', '206530576', '汤安琪', 'F', '2011-04-14', 36);
INSERT INTO `t_users` VALUES (969, '曹子韬', 'MpymAQEcq5', '2192253598', '曹子韬', 'M', '2010-08-06', 71);
INSERT INTO `t_users` VALUES (971, '邱詩涵', 'OmQwuNU8sd', '103884526', '邱詩涵', 'F', '2012-08-22', 76);
INSERT INTO `t_users` VALUES (972, '龚睿', 'kdC7qLvcP0', '15307096239', '龚睿', 'M', '2000-08-09', 84);
INSERT INTO `t_users` VALUES (973, '黎宇宁', '1FVMpE7BUc', '76011476974', '黎宇宁', 'M', '2003-04-12', 30);
INSERT INTO `t_users` VALUES (974, '姜子韬', 'qAgX8Zohqc', '16344623045', '姜子韬', 'M', '2012-06-16', 54);
INSERT INTO `t_users` VALUES (975, '林璐', 'IrgvwPrWDr', '7695247655', '林璐', 'F', '2009-08-08', 22);
INSERT INTO `t_users` VALUES (976, '傅宇宁', 'JiO5J10Qri', '19427466747', '傅宇宁', 'M', '2017-10-30', 50);
INSERT INTO `t_users` VALUES (977, '夏睿', 'iCN8qGK7WM', '75569404067', '夏睿', 'M', '2014-05-10', 93);
INSERT INTO `t_users` VALUES (978, '陶詩涵', 'SmMeHT8beP', '14531238487', '陶詩涵', 'F', '2016-06-11', 90);
INSERT INTO `t_users` VALUES (979, '夏晓明', 'V6k9xmUzwf', '13758258041', '夏晓明', 'M', '2013-09-18', 98);
INSERT INTO `t_users` VALUES (980, '邵晓明', 'A7vsBGNMUN', '18203300545', '邵晓明', 'M', '2004-11-30', 78);
INSERT INTO `t_users` VALUES (981, '钱致远', 'CjpUb5A9M4', '15463085568', '钱致远', 'M', '2008-12-30', 49);
INSERT INTO `t_users` VALUES (982, '郭宇宁', 'UiiUA4l85j', '76951625715', '郭宇宁', 'M', '2017-10-12', 75);
INSERT INTO `t_users` VALUES (983, '吴嘉伦', 'nv8RTyalPL', '7559671617', '吴嘉伦', 'M', '2020-07-20', 89);
INSERT INTO `t_users` VALUES (984, '陶璐', 'VSWTup6v3H', '207752605', '陶璐', 'F', '2009-07-09', 58);
INSERT INTO `t_users` VALUES (985, '陈宇宁', 'Rrn81h8eoZ', '76024122890', '陈宇宁', 'M', '2011-05-25', 81);
INSERT INTO `t_users` VALUES (986, '任云熙', 'aH1zwgbQQF', '7554633299', '任云熙', 'M', '2021-06-14', 22);
INSERT INTO `t_users` VALUES (987, '石嘉伦', 'jeDzfxQqVQ', '7555756334', '石嘉伦', 'M', '2009-12-07', 92);
INSERT INTO `t_users` VALUES (988, '唐詩涵', 'rTp6lWzXSd', '13712636036', '唐詩涵', 'F', '2003-04-18', 99);
INSERT INTO `t_users` VALUES (989, '吕云熙', 'CRCfmRkDIH', '7609674895', '吕云熙', 'M', '2004-11-03', 96);
INSERT INTO `t_users` VALUES (990, '金子异', 'MX8Kas9iFU', '17084042157', '金子异', 'M', '2001-11-01', 85);
INSERT INTO `t_users` VALUES (991, '江子韬', 'AZYQgXqmGb', '17295983642', '江子韬', 'M', '2005-08-16', 28);
INSERT INTO `t_users` VALUES (992, '侯子异', 'fzVYwd4H1f', '16491020707', '侯子异', 'M', '2015-03-11', 54);
INSERT INTO `t_users` VALUES (993, '金秀英', 'VPSggb4mjS', '16908945479', '金秀英', 'F', '2008-10-06', 38);
INSERT INTO `t_users` VALUES (994, '钟子韬', '7oon0DmVhp', '2827390410', '钟子韬', 'M', '2009-12-21', 63);
INSERT INTO `t_users` VALUES (995, '沈子韬', 'koBtiBq8lc', '7554612680', '沈子韬', 'M', '2010-11-09', 20);
INSERT INTO `t_users` VALUES (996, '于嘉伦', 'QGAyzYDdeb', '14482274206', '于嘉伦', 'M', '2007-10-23', 72);
INSERT INTO `t_users` VALUES (997, '孔嘉伦', 'Bz5wWZUEZv', '13018322094', '孔嘉伦', 'M', '2004-06-25', 80);
INSERT INTO `t_users` VALUES (998, '方云熙', 'SoweotNINz', '76911433601', '方云熙', 'M', '2014-04-16', 79);
INSERT INTO `t_users` VALUES (999, '曹致远', 'OmWkgdtfkb', '2120896810', '曹致远', 'M', '2011-12-21', 97);
INSERT INTO `t_users` VALUES (1000, '秦宇宁', 'GomXvwlh6S', '16906941336', '秦宇宁', 'M', '2001-02-06', 23);
INSERT INTO `t_users` VALUES (1002, '孟詩涵', '5x8N22jHHz', '13573775541', '孟詩涵', 'F', '2012-03-06', 24);
INSERT INTO `t_users` VALUES (1003, '宋云熙', 'r1a7cvRcjn', '17387318429', '宋云熙', 'M', '2020-05-08', 51);
INSERT INTO `t_users` VALUES (1004, '钟晓明', 'dAKYqqez98', '16715833630', '钟晓明', 'M', '2022-03-14', 60);
INSERT INTO `t_users` VALUES (1005, '徐秀英', 'jXRpqQ94MN', '14290218318', '徐秀英', 'F', '2000-04-19', 38);
INSERT INTO `t_users` VALUES (1006, '丁子韬', 'ArmyuPTrTm', '2040826895', '丁子韬', 'M', '2014-05-11', 80);
INSERT INTO `t_users` VALUES (1007, '石晓明', 'AxeyPmQq4p', '16169292453', '石晓明', 'M', '2015-02-12', 48);
INSERT INTO `t_users` VALUES (1008, '许致远', 'bJy3NrS2aa', '76974997068', '许致远', 'M', '2022-06-17', 33);
INSERT INTO `t_users` VALUES (1009, '郑岚', 'E7uaszAXeY', '15037840508', '郑岚', 'F', '2017-02-02', 91);
INSERT INTO `t_users` VALUES (1010, '石詩涵', '6vVq6W1WkF', '202134738', '石詩涵', 'F', '2007-03-08', 64);
INSERT INTO `t_users` VALUES (1011, '阎璐', 'sHdwpMVttO', '76947020134', '阎璐', 'F', '2022-05-10', 92);
INSERT INTO `t_users` VALUES (1012, '朱宇宁', '9NRNR3VSoW', '2899720391', '朱宇宁', 'M', '2008-05-25', 54);
INSERT INTO `t_users` VALUES (1013, '戴詩涵', 'THwM4vV8Gu', '2072978727', '戴詩涵', 'F', '2020-09-21', 90);
INSERT INTO `t_users` VALUES (1014, '张宇宁', 'p79Ie3Sgbw', '17381446013', '张宇宁', 'M', '2015-02-15', 92);
INSERT INTO `t_users` VALUES (1015, '向睿', 'Oz5Qz0gdiX', '13223857006', '向睿', 'M', '2024-09-10', 78);
INSERT INTO `t_users` VALUES (1016, '钱子异', 'mYn2yFqKrr', '18579801137', '钱子异', 'M', '2009-04-27', 33);
INSERT INTO `t_users` VALUES (1017, '郭詩涵', 'opZ1rCVAnC', '7553172746', '郭詩涵', 'F', '2010-11-29', 85);
INSERT INTO `t_users` VALUES (1018, '薛子异', 'SakeR27t5B', '17965626309', '薛子异', 'M', '2011-08-11', 39);
INSERT INTO `t_users` VALUES (1019, '田晓明', '9U8DkwWuAe', '2127414747', '田晓明', 'M', '2022-06-29', 31);
INSERT INTO `t_users` VALUES (1020, '崔子韬', 'FJofU6MDNv', '75576647821', '崔子韬', 'M', '2007-04-12', 51);
INSERT INTO `t_users` VALUES (1021, '王璐', 'g9BGXqzMRG', '19381800415', '王璐', 'F', '2016-09-14', 59);
INSERT INTO `t_users` VALUES (1022, '邹晓明', 'khVktuGTT4', '17957410874', '邹晓明', 'M', '2004-01-21', 60);
INSERT INTO `t_users` VALUES (1023, '江杰宏', 'vl0Z1ZEDf5', '75570269340', '江杰宏', 'M', '2000-02-29', 52);
INSERT INTO `t_users` VALUES (1024, '阎震南', '0WohDjwiHh', '2121400409', '阎震南', 'M', '2003-01-24', 73);
INSERT INTO `t_users` VALUES (1025, '苏嘉伦', 'NVO2fFrvqW', '2019927071', '苏嘉伦', 'M', '2010-12-02', 43);
INSERT INTO `t_users` VALUES (1026, '梁晓明', 'jhiWqLg4Gx', '285336454', '梁晓明', 'M', '2014-06-30', 72);
INSERT INTO `t_users` VALUES (1027, '贾秀英', 'cBpOyAHHQL', '285421620', '贾秀英', 'F', '2009-11-19', 89);

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_wheelchair
-- ----------------------------
INSERT INTO `t_wheelchair` VALUES (41, '互邦HBLD2-E电动轮椅可折叠轻便携铝合金锂电池老年人残疾人轮椅代步车', '加宽轮椅，手动折叠', '20', 'HBLD2-E', 4, 30, '上海', '/static/img/wheelchair3.png', '互邦', '13817355618', '21', '/static/img/wheelchair3.png', '管理员', '2024-09-15 16:29:10');
INSERT INTO `t_wheelchair` VALUES (42, '迪护电动轮椅老人全自动越野轻便可折叠旅行便携式家用老年代步电动车专用智能可躺上飞机带坐便器DH-QBK12AQ', '小轮便携，手动折叠', '18', 'DH-QBK12AQ', 30, 40, '北京', '/static/img/wheelchair4.png', '迪护', '13817355618', '21', '/static/img/wheelchair4.png', '管理员', '2024-09-24 00:22:27');
INSERT INTO `t_wheelchair` VALUES (43, '简约轮椅', '非常简约', '1000', '简约', 10, 100, '广州市天河区', '/static/img/12f198fc-28b7-46c0-955e-ee577913463e.png', '简约', '12345678901', '1000', '/static/img/12f198fc-28b7-46c0-955e-ee577913463e.png', '管理员', '2024-09-27 14:16:22');
INSERT INTO `t_wheelchair` VALUES (44, '铝合金轮椅可折叠电动轮椅轻便老年人便携出行手推车残疾人代步车', '铝合金', '2000', '红色', 4, 88, '广州市天河区', '/static/img/d8d171de-2363-41d4-8b53-4ba5c285db62.png', '铝合金', '12345678901', '2000', '/static/img/d8d171de-2363-41d4-8b53-4ba5c285db62.png', '管理员', '2024-09-27 14:17:16');

-- ----------------------------
-- Triggers structure for table t_chair
-- ----------------------------
DROP TRIGGER IF EXISTS `update_remaining_quantity`;
delimiter ;;
CREATE TRIGGER `update_remaining_quantity` AFTER UPDATE ON `t_chair` FOR EACH ROW BEGIN
  UPDATE t_wheelchair w
  SET w.wheelchair_type = (
    SELECT COUNT(*) FROM t_chair c
    WHERE c.h_id = w.h_id AND c.status = 0
  )
  WHERE w.h_id = NEW.h_id;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

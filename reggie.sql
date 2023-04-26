/*
 Navicat Premium Data Transfer

 Source Server         : O_DENTIST
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : reggie

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 27/04/2023 01:32:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人',
  `sex` tinyint(0) NOT NULL COMMENT '性别 0 女 1 男',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (1417414526093082626, 1417012167126876162, '小明', 1, '13812345678', NULL, NULL, NULL, NULL, NULL, NULL, '昌平区金燕龙办公楼', '公司', 1, '2021-07-20 17:22:12', '2021-07-20 17:26:33', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1417414926166769666, 1417012167126876162, '小李', 1, '13512345678', NULL, NULL, NULL, NULL, NULL, NULL, '测试', '家', 0, '2021-07-20 17:23:47', '2021-07-20 17:23:47', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1638112229612875778, 1638090891691036673, '王小明', 1, '13568201123', NULL, NULL, NULL, NULL, NULL, NULL, '成华区二仙桥', '公司', 1, '2023-03-21 17:36:05', '2023-03-21 17:36:08', 1638090891691036673, 1638090891691036673, 0);
INSERT INTO `address_book` VALUES (1641364209545539585, 1641333801693044738, '王小虎', 1, '13412306123', NULL, NULL, NULL, NULL, NULL, NULL, '成都市成华区二仙桥', '家', 0, '2023-03-30 16:58:17', '2023-03-30 16:58:19', 1641333801693044738, 1641333801693044738, 0);
INSERT INTO `address_book` VALUES (1650464801517756418, 1650464611813580801, '王小明', 1, '13512341234', NULL, NULL, NULL, NULL, NULL, NULL, '成都市成华区二仙桥天河小区8栋二单元', '公司', 1, '2023-04-24 19:40:47', '2023-04-24 19:40:49', 1650464611813580801, 1650464611813580801, 0);
INSERT INTO `address_book` VALUES (1651072963329425410, 1641333801693044738, '小明', 1, '13412341234', NULL, NULL, NULL, NULL, NULL, NULL, '成都是高新区城北大道1段5号二楼', '公司', 1, '2023-04-26 11:57:25', '2023-04-26 11:57:29', 1641333801693044738, 1641333801693044738, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型   1 服务分类 2 套餐分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '服务及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1397844263642378242, 1, '清洁服务', 1, '2021-05-27 09:16:58', '2023-04-12 16:34:41', 1, 1);
INSERT INTO `category` VALUES (1413342269393674242, 2, '商务套餐', 5, '2021-07-09 11:40:30', '2021-07-09 14:43:45', 1, 1);
INSERT INTO `category` VALUES (1646088995421925377, 1, '维修服务', 2, '2023-04-12 17:52:54', '2023-04-12 18:18:56', 1, 1);
INSERT INTO `category` VALUES (1646095509498998785, 1, '家居装饰服务', 3, '2023-04-12 18:18:47', '2023-04-12 18:18:47', 1, 1);
INSERT INTO `category` VALUES (1646097364551577602, 1, '育儿照顾类服务', 4, '2023-04-12 18:26:09', '2023-04-12 18:26:09', 1, 1);
INSERT INTO `category` VALUES (1646099567962075137, 1, '餐饮服务', 5, '2023-04-12 18:34:55', '2023-04-12 18:34:55', 1, 1);
INSERT INTO `category` VALUES (1646327750333571074, 2, '清洁服务套餐', 5, '2023-04-13 09:41:38', '2023-04-13 09:42:15', 1, 1);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `dish_id` bigint(0) NOT NULL COMMENT '服务',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '时间名称',
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '时间数据list',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '服务时间关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (1646087629676851202, 1646087629664268289, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 17:47:28', '2023-04-12 17:47:28', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646087629676851203, 1646087629664268289, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 17:47:28', '2023-04-12 17:47:28', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646088526834282498, 1646088526834282497, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 17:51:02', '2023-04-12 17:51:02', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646088526834282499, 1646088526834282497, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 17:51:02', '2023-04-12 17:51:02', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646088790937022467, 1646088790937022466, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 17:52:05', '2023-04-12 17:52:05', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646088790937022468, 1646088790937022466, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 17:52:05', '2023-04-12 17:52:05', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646090049832202241, 1646090049769287682, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 17:57:05', '2023-04-12 17:57:05', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646090049832202242, 1646090049769287682, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 17:57:05', '2023-04-12 17:57:05', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646090770191331330, 1646090770191331329, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 17:59:57', '2023-04-12 17:59:57', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646090770191331331, 1646090770191331329, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 17:59:57', '2023-04-12 17:59:57', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646090770191331332, 1646090770191331329, '', '[]', '2023-04-12 17:59:57', '2023-04-12 17:59:57', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646091420803379203, 1646091420803379202, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 18:02:32', '2023-04-12 18:02:32', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646091420803379204, 1646091420803379202, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 18:02:32', '2023-04-12 18:02:32', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646096442706472963, 1646096442706472962, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 18:22:30', '2023-04-12 18:22:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646096442706472964, 1646096442706472962, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 18:22:30', '2023-04-12 18:22:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646096940591329281, 1646096940524220417, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 18:24:28', '2023-04-12 18:24:28', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646096940591329282, 1646096940524220417, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 18:24:28', '2023-04-12 18:24:28', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646096940591329283, 1646096940524220417, '夜间', '[\"20:00-22:00\"]', '2023-04-12 18:24:28', '2023-04-12 18:24:28', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646097271400280066, 1646097271400280065, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 18:25:47', '2023-04-12 18:25:47', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646097271400280067, 1646097271400280065, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 18:25:47', '2023-04-12 18:25:47', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646099352597147651, 1646099352597147650, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 18:34:03', '2023-04-12 18:34:03', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646099352597147652, 1646099352597147650, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 18:34:03', '2023-04-12 18:34:03', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646099499259375618, 1646099499259375617, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 18:34:38', '2023-04-12 18:34:38', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646099499326484482, 1646099499259375617, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 18:34:38', '2023-04-12 18:34:38', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646100005042106370, 1646100005042106369, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 18:36:39', '2023-04-12 18:36:39', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646100005042106371, 1646100005042106369, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 18:36:39', '2023-04-12 18:36:39', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646100005042106372, 1646100005042106369, '夜间', '[\"20:00-22:00\"]', '2023-04-12 18:36:39', '2023-04-12 18:36:39', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646100381464113155, 1646100381464113154, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 18:38:09', '2023-04-12 18:38:09', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646100381464113156, 1646100381464113154, '下午', '[\"14:00-16:00\",\"16:00-18:00\"]', '2023-04-12 18:38:09', '2023-04-12 18:38:09', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646100381464113157, 1646100381464113154, '夜间', '[\"20:00-22:00\"]', '2023-04-12 18:38:09', '2023-04-12 18:38:09', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646100983933939714, 1646100983871025153, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 18:40:32', '2023-04-12 18:40:32', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646100983933939715, 1646100983871025153, '上午', '[\"8:00-10:00\",\"10:00-12:00\"]', '2023-04-12 18:40:32', '2023-04-12 18:40:32', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646100983933939716, 1646100983871025153, '自助服务', '[\"拍下联系客服\"]', '2023-04-12 18:40:32', '2023-04-12 18:40:32', 1, 1, 0);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2021-05-06 17:20:07', '2021-05-10 02:24:09', 1, 1);
INSERT INTO `employee` VALUES (1626109947399983106, '张三', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '13411451411', '1', '111111111111111111', 1, '2023-02-16 14:43:18', '2023-02-16 14:43:18', 1, 1);
INSERT INTO `employee` VALUES (1626411968527142914, '张飞', 'zhangfei', 'e10adc3949ba59abbe56e057f20f883e', '13410086111', '1', '100000000000000000', 0, '2023-02-17 10:43:25', '2023-02-17 11:06:53', 1, 1);
INSERT INTO `employee` VALUES (1626854092418641921, '李四', 'test01', 'e10adc3949ba59abbe56e057f20f883e', '13411111111', '0', '121233333333333333', 1, '2023-02-18 16:00:16', '2023-03-06 16:28:53', 1, 1);

-- ----------------------------
-- Table structure for house_serve
-- ----------------------------
DROP TABLE IF EXISTS `house_serve`;
CREATE TABLE `house_serve`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '服务名称',
  `category_id` bigint(0) NOT NULL COMMENT '服务分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '服务价格',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品码',
  `image` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '服务管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house_serve
-- ----------------------------
INSERT INTO `house_serve` VALUES (1646087629664268289, '地毯清洗', 1397844263642378242, 8800.00, '', 'b3faebca-e72a-43fb-8326-24e226778d36.jpg', '', 1, 0, '2023-04-12 17:47:28', '2023-04-12 17:47:28', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646088526834282497, '沙发保养', 1397844263642378242, 28800.00, '', 'fdba1324-ecd2-42c7-b1b0-a3ecebbb1e24.jpg', '沙发保养', 1, 0, '2023-04-12 17:51:02', '2023-04-12 17:51:02', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646088790937022466, '玻璃清洁', 1397844263642378242, 18800.00, '', 'c693ea48-7ba0-4c01-9787-f7c44a7b8454.jpeg', '玻璃清洁', 1, 0, '2023-04-12 17:52:05', '2023-04-12 17:52:05', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646090049769287682, '水电维修', 1646088995421925377, 18800.00, '', '290e6dfd-e625-4323-b35b-415031d6bbcc.jpg', '', 1, 0, '2023-04-12 17:57:05', '2023-04-12 17:57:05', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646090770191331329, '空调维修', 1646088995421925377, 28800.00, '', '885fb1a4-d8f6-466f-a8ea-87af53b6b9aa.jpg', '', 1, 0, '2023-04-12 17:59:57', '2023-04-12 17:59:57', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646091420803379202, '家具维修', 1646088995421925377, 18800.00, '', 'c0135d05-14c9-4c7f-b59f-6686d7e6e9f5.jpg', '', 1, 0, '2023-04-12 18:02:32', '2023-04-12 18:02:32', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646096442706472962, '墙面补漏', 1646095509498998785, 28800.00, '', '2e9aa3c0-08a0-4f5f-a5ef-cee523e09065.jpg', '', 1, 0, '2023-04-12 18:22:30', '2023-04-12 18:22:30', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646096940524220417, '窗帘定制', 1646095509498998785, 38800.00, '', '4f824543-7011-4b1d-909e-84c423b28587.jpg', '窗帘定制', 1, 0, '2023-04-12 18:24:28', '2023-04-12 18:24:28', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646097271400280065, '家居布置', 1646095509498998785, 8800.00, '', '04b6003e-4e01-4388-b474-b1070a5e1905.jpg', '家居布置', 1, 0, '2023-04-12 18:25:47', '2023-04-12 18:25:47', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646099352597147650, '儿童看护', 1646097364551577602, 58800.00, '', 'fb28df24-fcb9-44ff-adac-ac5fac4b4fb9.jpg', '', 1, 0, '2023-04-12 18:34:03', '2023-04-12 18:34:03', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646099499259375617, '家庭教育辅导', 1646097364551577602, 48800.00, '', '49a87a9d-7a75-42a6-a7ab-eee756f434fa.jpg', '家庭教育辅导', 1, 0, '2023-04-12 18:34:38', '2023-04-12 18:34:38', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646100005042106369, '厨师上门', 1646099567962075137, 108800.00, '', '148b99e3-5c30-4c82-8c1f-633ce5d17edf.jpg', '厨师上门', 1, 0, '2023-04-12 18:36:39', '2023-04-12 18:36:39', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646100381464113154, '聚会服务', 1646099567962075137, 88800.00, '', '28322251-6b17-4f40-a567-ba2051005f0e.jpg', '聚会服务', 1, 0, '2023-04-12 18:38:09', '2023-04-12 18:38:09', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1646100983871025153, '食材采购', 1646099567962075137, 16800.00, '', 'b872c6ba-dfff-4079-a7b5-5487c640c166.png', '', 1, 0, '2023-04-12 18:40:32', '2023-04-12 18:40:32', 1, 1, 0);
INSERT INTO `house_serve` VALUES (1650865735516147713, 'test1', 1646095509498998785, 1700.00, '', '8703e688-e741-41dd-8ac5-fa0d109331b3.jpg', '', 1, 0, '2023-04-25 22:13:58', '2023-04-25 22:13:58', 1, 1, 0);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint(0) NOT NULL COMMENT '订单id',
  `dish_id` bigint(0) NULL DEFAULT NULL COMMENT '服务id',
  `setmeal_id` bigint(0) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '时间',
  `number` int(0) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1641364312532480002, '厨房清理', 'a08d65fc-d824-4b1e-b13b-36062d311c3b.jpg', 1641364312465371137, 1628658368509939713, NULL, '不要葱', 4, 55.00);
INSERT INTO `order_detail` VALUES (1646343684121182210, '玻璃清洁', 'c693ea48-7ba0-4c01-9787-f7c44a7b8454.jpeg', 1646343684062461953, 1646088790937022466, NULL, '8:00-10:00,8:00-10:00', 1, 188.00);
INSERT INTO `order_detail` VALUES (1646343684121182211, '沙发保养', 'fdba1324-ecd2-42c7-b1b0-a3ecebbb1e24.jpg', 1646343684062461953, 1646088526834282497, NULL, '8:00-10:00,14:00-16:00', 1, 288.00);
INSERT INTO `order_detail` VALUES (1646343684121182212, '厨房清理', 'a08d65fc-d824-4b1e-b13b-36062d311c3b.jpg', 1646343684062461953, 1628658368509939713, NULL, '8:00-10:00,14:00-16:00', 1, 55.00);
INSERT INTO `order_detail` VALUES (1650464919088291841, '玻璃清洁', 'c693ea48-7ba0-4c01-9787-f7c44a7b8454.jpeg', 1650464870782492673, 1646088790937022466, NULL, '10:00-12:00,10:00-12:00', 1, 188.00);
INSERT INTO `order_detail` VALUES (1650464919088291842, '沙发保养', 'fdba1324-ecd2-42c7-b1b0-a3ecebbb1e24.jpg', 1650464870782492673, 1646088526834282497, NULL, '8:00-10:00,14:00-16:00', 1, 288.00);
INSERT INTO `order_detail` VALUES (1650469436777324545, '地毯清洗', 'b3faebca-e72a-43fb-8326-24e226778d36.jpg', 1650469397036294145, 1646087629664268289, NULL, '10:00-12:00,14:00-16:00', 1, 88.00);
INSERT INTO `order_detail` VALUES (1650469436802490369, '厨房清理', 'a08d65fc-d824-4b1e-b13b-36062d311c3b.jpg', 1650469397036294145, 1628658368509939713, NULL, '8:00-10:00,14:00-16:00', 1, 55.00);
INSERT INTO `order_detail` VALUES (1650469436802490371, '地毯清洗', 'b3faebca-e72a-43fb-8326-24e226778d36.jpg', 1650469436802490370, 1646087629664268289, NULL, '10:00-12:00,14:00-16:00', 1, 88.00);
INSERT INTO `order_detail` VALUES (1650469436802490372, '厨房清理', 'a08d65fc-d824-4b1e-b13b-36062d311c3b.jpg', 1650469436802490370, 1628658368509939713, NULL, '8:00-10:00,14:00-16:00', 1, 55.00);
INSERT INTO `order_detail` VALUES (1651073076873428995, 'test1', '8703e688-e741-41dd-8ac5-fa0d109331b3.jpg', 1651073076873428994, 1650865735516147713, NULL, NULL, 1, 17.00);
INSERT INTO `order_detail` VALUES (1651073076873428996, '家居布置', '04b6003e-4e01-4388-b474-b1070a5e1905.jpg', 1651073076873428994, 1646097271400280065, NULL, '10:00-12:00,14:00-16:00', 1, 88.00);
INSERT INTO `order_detail` VALUES (1651073076873428997, '窗帘定制', '4f824543-7011-4b1d-909e-84c423b28587.jpg', 1651073076873428994, 1646096940524220417, NULL, '10:00-12:00,16:00-18:00,20:00-22:00', 1, 388.00);
INSERT INTO `order_detail` VALUES (1651073076873428998, '墙面补漏', '2e9aa3c0-08a0-4f5f-a5ef-cee523e09065.jpg', 1651073076873428994, 1646096442706472962, NULL, '10:00-12:00,16:00-18:00', 1, 288.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint(0) NOT NULL COMMENT '下单用户',
  `address_book_id` bigint(0) NOT NULL COMMENT '地址id',
  `order_time` datetime(0) NOT NULL COMMENT '下单时间',
  `checkout_time` datetime(0) NOT NULL COMMENT '结账时间',
  `pay_method` int(0) NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1641364312465371137, '1641364312465371137', 2, 1641333801693044738, 1641364209545539585, '2023-03-30 16:58:42', '2023-03-30 16:58:42', 1, 368.00, '', '13412306123', '成都市成华区二仙桥', NULL, '王小虎');
INSERT INTO `orders` VALUES (1646343684062461953, '1646343684062461953', 2, 1641333801693044738, 1641364209545539585, '2023-04-13 10:44:57', '2023-04-13 10:44:57', 1, 531.00, '', '13412306123', '成都市成华区二仙桥', NULL, '王小虎');
INSERT INTO `orders` VALUES (1650464870782492673, '1650464870782492673', 2, 1650464611813580801, 1650464801517756418, '2023-04-24 19:41:04', '2023-04-24 19:41:04', 1, 476.00, '', '13512341234', '成都市成华区二仙桥天河小区8栋二单元', NULL, '王小明');
INSERT INTO `orders` VALUES (1650469397036294145, '1650469397036294145', 2, 1641333801693044738, 1641364209545539585, '2023-04-24 19:59:03', '2023-04-24 19:59:03', 1, 143.00, '', '13412306123', '成都市成华区二仙桥', NULL, '王小虎');
INSERT INTO `orders` VALUES (1650469436802490370, '1650469436802490370', 2, 1641333801693044738, 1641364209545539585, '2023-04-24 19:59:13', '2023-04-24 19:59:13', 1, 143.00, '', '13412306123', '成都市成华区二仙桥', NULL, '王小虎');
INSERT INTO `orders` VALUES (1651073076873428994, '1651073076873428994', 2, 1641333801693044738, 1651072963329425410, '2023-04-26 11:57:52', '2023-04-26 11:57:52', 1, 781.00, '', '13412341234', '成都是高新区城北大道1段5号二楼', NULL, '小明');

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `category_id` bigint(0) NOT NULL COMMENT '服务分类id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (1646328201930088450, 1646327750333571074, '清洁服务整合包', 88800.00, 1, '', '', '76b0e6d7-def0-4906-b9c7-7ed3310f1676.jpg', '2023-04-13 09:43:25', '2023-04-13 09:43:25', 1, 1, 0);
INSERT INTO `setmeal` VALUES (1650864038722940930, 1646327750333571074, 'test1', 26600.00, 1, '', '', 'a70f087a-b517-4d07-8fe4-514ba6878863.jpg', '2023-04-25 22:07:13', '2023-04-25 22:07:13', 1, 1, 0);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `setmeal_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '服务id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '服务名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '服务原价（冗余字段）',
  `copies` int(0) NOT NULL COMMENT '份数',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐服务关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (1646328201930088451, '1646328201930088450', '1646088790937022466', '玻璃清洁', 18800.00, 1, 0, '2023-04-13 09:43:25', '2023-04-13 09:43:25', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1646328201930088452, '1646328201930088450', '1646088526834282497', '沙发保养', 28800.00, 1, 0, '2023-04-13 09:43:25', '2023-04-13 09:43:25', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1646328201930088453, '1646328201930088450', '1646087629664268289', '地毯清洗', 8800.00, 1, 0, '2023-04-13 09:43:25', '2023-04-13 09:43:25', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1646328201997197313, '1646328201930088450', '1628658368509939713', '厨房清理', 5500.00, 1, 0, '2023-04-13 09:43:25', '2023-04-13 09:43:25', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650864038722940931, '1650864038722940930', '1646088790937022466', '玻璃清洁', 18800.00, 1, 0, '2023-04-25 22:07:13', '2023-04-25 22:07:13', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650864038722940932, '1650864038722940930', '1646088526834282497', '沙发保养', 28800.00, 1, 0, '2023-04-25 22:07:13', '2023-04-25 22:07:13', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650864038722940933, '1650864038722940930', '1646087629664268289', '地毯清洗', 8800.00, 1, 0, '2023-04-25 22:07:13', '2023-04-25 22:07:13', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650864038722940934, '1650864038722940930', '1628658368509939713', '厨房清理', 5500.00, 1, 0, '2023-04-25 22:07:13', '2023-04-25 22:07:13', 1, 1, 0);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint(0) NOT NULL COMMENT '主键',
  `dish_id` bigint(0) NULL DEFAULT NULL COMMENT '服务id',
  `setmeal_id` bigint(0) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '时间',
  `number` int(0) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (1646342739840770050, '清洁服务整合包', '76b0e6d7-def0-4906-b9c7-7ed3310f1676.jpg', 1, NULL, 1646328201930088450, NULL, 1, 888.00, '2023-04-13 10:41:11');
INSERT INTO `shopping_cart` VALUES (1646342796661006338, '家庭教育辅导', '49a87a9d-7a75-42a6-a7ab-eee756f434fa.jpg', 1, 1646099499259375617, NULL, '8:00-10:00,14:00-16:00', 1, 488.00, '2023-04-13 10:41:25');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `status` int(0) NULL DEFAULT 0 COMMENT '状态 0:禁用，1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1638090891691036673, NULL, '13412345678', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1638128167552921602, NULL, '13512306123', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1641333801693044738, NULL, '13412306123', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1650464509887799298, NULL, '1341230612306', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1650464611813580801, NULL, '1351230612306', NULL, NULL, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;

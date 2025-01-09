SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(4) NULL DEFAULT 0 COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'admin', '123456', '十三', 0);
INSERT INTO `admin_user` VALUES (2, 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '新蜂01', 0);
INSERT INTO `admin_user` VALUES (3, 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '新蜂02', 0);

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `tb_newbee_mall_carousel`  (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页轮播图主键id',
  `carousel_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播图',
  `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\'##\'' COMMENT '点击后的跳转地址(默认不跳转)',
  `carousel_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `update_user` int(11) NOT NULL DEFAULT 0 COMMENT '修改者id',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (2, 'http://localhost:8080/upload/20240319_21512831.jpeg', '', 13, 0, '2023-07-01 00:00:00', 0, '2024-03-19 21:51:32', 0);
INSERT INTO `carousel` VALUES (5, 'http://192.168.1.31:8080/upload/20230408_20562887.jpeg', 'https://juejin.im/book/5da2f9d4f265da5b81794d48/section/5da2f9d6f265da5b794f2189', 0, 1, '2023-07-01 00:00:00', 0, '2023-11-12 15:11:36', 0);
INSERT INTO `carousel` VALUES (6, 'http://localhost:8080/upload/20240319_21520196.jpg', '##', 3, 0, '2023-07-01 00:00:00', 0, '2024-03-19 21:52:03', 0);
INSERT INTO `carousel` VALUES (7, 'http://localhost:8080/upload/20240319_21514849.jpeg', '##', 4, 0, '2023-07-01 00:00:00', 0, '2024-03-19 21:51:50', 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '分类级别(1-一级分类 2-二级分类 3-三级分类)',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父分类id',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `update_user` int(11) NULL DEFAULT 0 COMMENT '修改者id',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (201, 1, 0, '谷物', 0, 0, '2024-03-19 21:55:59', 0, '2024-03-19 21:55:59', 0);
INSERT INTO `category` VALUES (202, 1, 0, '水果', 0, 0, '2024-03-19 21:56:11', 0, '2024-03-19 21:56:11', 0);
INSERT INTO `category` VALUES (203, 1, 0, '蔬菜', 0, 0, '2024-03-19 21:56:19', 0, '2024-03-19 21:56:19', 0);
INSERT INTO `category` VALUES (204, 2, 201, '玉米', 0, 0, '2024-03-19 21:56:34', 0, '2024-03-19 22:01:53', 0);
INSERT INTO `category` VALUES (205, 2, 201, '大米', 0, 0, '2024-03-19 21:56:45', 0, '2024-03-19 22:00:40', 0);
INSERT INTO `category` VALUES (206, 2, 202, '西瓜', 0, 0, '2024-03-19 21:57:05', 0, '2024-03-19 22:01:09', 0);
INSERT INTO `category` VALUES (207, 2, 202, '苹果', 0, 0, '2024-03-19 21:57:13', 0, '2024-03-19 21:57:13', 0);
INSERT INTO `category` VALUES (208, 2, 202, '水梨', 0, 0, '2024-03-19 21:57:31', 0, '2024-03-19 21:57:31', 0);
INSERT INTO `category` VALUES (209, 2, 203, '外卖', 0, 0, '2024-03-19 21:57:44', 0, '2025-01-06 21:51:46', 0);
INSERT INTO `category` VALUES (210, 2, 203, '萝卜', 0, 0, '2024-03-19 21:57:52', 0, '2024-03-19 21:57:52', 0);

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info`  (
  `goods_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品表主键id',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名',
  `goods_intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品简介',
  `goods_category_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联分类id',
  `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品主图',
  `goods_carousel` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品轮播图',
  `goods_detail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `original_price` int(11) NOT NULL DEFAULT 1 COMMENT '商品价格',
  `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '商品实际售价',
  `stock_num` int(11) NOT NULL DEFAULT 0 COMMENT '商品库存数量',
  `tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标签',
  `goods_sell_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '商品上架状态 0-下架 1-上架',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '添加者主键id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '商品添加时间',
  `update_user` int(11) NOT NULL DEFAULT 0 COMMENT '修改者主键id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '商品修改时间',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11089 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
INSERT INTO `goods_info` VALUES (11080, '玉米', '米富含淀粉、蛋白质、维生素和矿物质，是人们日常饮食中的重要来源之一。', 204, 'http://localhost:8080/upload/20240319_22060760.jpeg', 'http://localhost:8080/upload/20240319_22060760.jpeg', '<span style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">玉米可以用作人类食用、饲料、工业原料等。玉米籽是主要的食用部分，可以煮食、制成玉米面粉、玉米油等食品；玉米秸秆可以作为饲料或工业原料；玉米芯可以用来制作玉米丝等食品。</span>', 9, 12, 100, '热销推荐', 0, 0, '2024-03-19 22:06:10', 0, '2024-03-19 22:06:10');
INSERT INTO `goods_info` VALUES (11081, '大米', '大米富含碳水化合物，是人体主要的能量来源。此外，大米还含有蛋白质、维生素和矿物质，是一种营养丰富的食物。', 205, 'http://localhost:8080/upload/20240319_22082296.jpeg', 'http://localhost:8080/upload/20240319_22082296.jpeg', '<span style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">大米是人们日常饮食中的重要主食，可以煮食、蒸煮、炒制等多种方式食用。此外，大米还可以用来酿造米酒、制作米粉等食品。</span>', 99, 199, 50, '热销推荐', 0, 0, '2024-03-19 22:08:23', 0, '2024-03-19 22:08:23');
INSERT INTO `goods_info` VALUES (11082, '无籽西瓜', '无籽西瓜的营养价值和传统西瓜相似，富含水分、维生素C、维生素A等营养物质，是夏季常见的水果之一。', 206, 'http://localhost:8080/upload/20240319_22125941.jpg', 'http://localhost:8080/upload/20240319_22125941.jpg', '<span style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">目前市面上常见的无籽西瓜品种有多种，如黑皮无籽西瓜、黄皮无籽西瓜等。这些品种通常在外表上和传统西瓜相似，但内部的种子数量明显减少。</span><span style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">无籽西瓜可以直接切开食用，不需要担心食用时吞食到种子。也可以制作成西瓜汁、西瓜沙拉等美味食品。</span>', 100, 100, 200, '爆款', 0, 0, '2024-03-19 22:13:00', 0, '2024-03-19 22:13:00');
INSERT INTO `goods_info` VALUES (11083, '沙瓤西瓜', '沙瓤西瓜是一种西瓜品种，其特点是果肉呈现出类似沙状的质地，口感更加细腻柔软，水分更加丰富。', 206, 'http://localhost:8080/upload/20240319_22142934.jpg', 'http://localhost:8080/upload/20240319_22142934.jpg', '<span style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">沙瓤西瓜的果肉质地柔软细腻，口感更加清爽，水分含量更高，比传统西瓜更加多汁。果肉中的纤维细腻，吃起来更加顺滑。</span>', 100, 120, 50, '爆款', 0, 0, '2024-03-19 22:14:30', 0, '2024-03-19 22:14:30');
INSERT INTO `goods_info` VALUES (11084, '苹果', '苹果富含维生素C、纤维素、抗氧化物质等营养成分，有助于增强免疫力、促进消化和预防慢性疾病。', 207, 'http://localhost:8080/upload/20240319_22170924.jpeg', 'http://localhost:8080/upload/20240319_22170924.jpeg', '<span style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">苹果可以直接生吃，也可以制作成苹果汁、苹果派、苹果酱等各种美味食品。</span>', 155, 155, 800, '爆款', 0, 0, '2024-03-19 22:17:10', 0, '2024-03-19 22:17:10');
INSERT INTO `goods_info` VALUES (11085, '水梨', '梨富含维生素C、纤维素、钾等营养成分，有助于促进消化、降低胆固醇、维持心血管健康等。', 208, 'http://localhost:8080/upload/20240319_22202664.jpeg', 'http://localhost:8080/upload/20240319_22202664.jpeg', '<span style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">水梨可以直接生吃，也可以制作成梨汁、梨酥、梨脯等各种美味食品。梨还可以与其他水果或坚果搭配食用，增加口感和营养。</span>', 422, 86, 500, '热销推荐', 0, 0, '2024-03-19 22:20:27', 0, '2024-03-19 22:20:27');
INSERT INTO `goods_info` VALUES (11086, '白菜', '白菜富含维生素C、维生素K、叶酸、钙等营养成分，有助于增强免疫力、促进钙的吸收、维护骨骼健康等', 209, 'http://localhost:8080/upload/20240319_22342389.jpeg', 'http://localhost:8080/upload/20240319_22342389.jpeg', '<span style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">白菜可以用来炒菜、烩菜、做汤等，也可以生吃，制作成凉拌菜或沙拉。白菜还可以用来腌制泡菜等传统食品。</span>', 166, 166, 66, '热销推荐', 0, 0, '2024-03-19 22:34:25', 0, '2024-03-19 22:34:25');
INSERT INTO `goods_info` VALUES (11087, '胡萝卜', '胡萝卜是一种营养丰富、口感独特的蔬菜，受到广大消费者的喜爱。在日常饮食中，胡萝卜可以作为一种健康美味的食材，为人们提供丰富的营养。', 210, 'http://localhost:8080/upload/20240319_22373237.jpg', 'http://localhost:8080/upload/20240319_22373237.jpg', '<span style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n<ul style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n	<li>\n		胡萝卜的口感脆嫩，甜味浓郁，适合生吃或烹饪。胡萝卜还可以用来制作果汁或沙拉。\n	</li>\n</ul>\n</span>', 199, 1, 98, '热销推荐', 0, 0, '2024-03-19 22:37:33', 0, '2024-03-19 22:37:33');
INSERT INTO `goods_info` VALUES (11088, '白萝卜', '白萝卜是一种常见的根茎类蔬菜，也是人们日常饮食中常见的食材之一。', 210, 'http://localhost:8080/upload/20240319_22405897.jpg', 'http://localhost:8080/upload/20240319_22405897.jpg', '<span style=\"color:rgba(0, 0, 0, 0.78);font-family:&quot;font-size:14px;background-color:#FFFFFF;\">白萝卜可以生吃，也可以切片炒菜、煮汤、腌制泡菜等多种方式食用。白萝卜还可以用来制作白萝卜丝、白萝卜饼等美食。</span>', 100, 100, 100, '热销推荐', 0, 0, '2024-03-19 22:40:59', 0, '2024-03-19 22:40:59');

-- ----------------------------
-- Table structure for index_config
-- ----------------------------
DROP TABLE IF EXISTS `index_config`;
CREATE TABLE `index_config`  (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '首页配置项主键id',
  `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '显示字符(配置搜索时不可为空，其他可为空)',
  `config_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-搜索框热搜 2-搜索下拉框热搜 3-(首页)热销商品 4-(首页)新品上线 5-(首页)为你推荐',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '商品id 默认为0',
  `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '##' COMMENT '点击后的跳转地址(默认不跳转)',
  `config_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最新修改时间',
  `update_user` int(11) NULL DEFAULT 0 COMMENT '修改者id',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_config
-- ----------------------------
INSERT INTO `index_config` VALUES (1, '热销商品', 3, 11081, '##', 11, 0, '2019-09-18 17:04:56', 0, '2019-09-18 17:04:56', 0);
INSERT INTO `index_config` VALUES (2, '热销商品', 3, 11080, '##', 100, 0, '2019-09-18 17:05:27', 0, '2019-09-18 17:05:27', 0);
INSERT INTO `index_config` VALUES (3, '热销商品 特仑苏牛奶', 3, 10899, '##', 300, 1, '2019-09-18 17:08:02', 0, '2023-03-05 18:01:41', 0);
INSERT INTO `index_config` VALUES (4, '热销商品 抖音爆款零食', 3, 10903, '##', 101, 1, '2019-09-18 17:08:56', 0, '2023-03-05 18:01:44', 0);
INSERT INTO `index_config` VALUES (5, '新品上线 Macbook Pro', 4, 10269, '##', 100, 1, '2019-09-18 17:10:36', 0, '2023-02-23 15:35:51', 0);
INSERT INTO `index_config` VALUES (6, '新品上线 荣耀 9X Pro', 4, 10755, '##', 100, 1, '2019-09-18 17:11:05', 0, '2023-02-23 15:35:51', 0);
INSERT INTO `index_config` VALUES (7, '新品上线', 4, 11087, '##', 102, 0, '2019-09-18 17:11:44', 0, '2019-09-18 17:11:44', 0);
INSERT INTO `index_config` VALUES (8, '新品上线', 4, 11085, '##', 200, 0, '2019-09-18 17:11:58', 0, '2019-09-18 17:11:58', 0);
INSERT INTO `index_config` VALUES (9, '新品上线 华为无线耳机', 4, 10186, '##', 100, 1, '2019-09-18 17:12:29', 0, '2023-02-23 15:35:51', 0);
INSERT INTO `index_config` VALUES (10, '大V领灯笼袖甜美女衫', 5, 11032, '##', 98, 1, '2019-09-18 17:47:23', 0, '2023-11-12 22:24:57', 0);
INSERT INTO `index_config` VALUES (11, '乐邦', 5, 10924, '##', 100, 1, '2019-09-18 17:47:44', 0, '2023-03-06 21:46:37', 0);
INSERT INTO `index_config` VALUES (12, '热销推荐', 5, 11085, '##', 102, 0, '2019-09-18 17:48:00', 0, '2019-09-18 17:48:00', 0);
INSERT INTO `index_config` VALUES (13, '热销推荐', 5, 11080, '##', 101, 0, '2019-09-18 17:49:11', 0, '2019-09-18 17:49:11', 0);
INSERT INTO `index_config` VALUES (14, '初中生高中生衣服夏天套装中学生', 5, 11060, '##', 100, 1, '2019-09-18 17:49:28', 0, '2024-03-19 22:46:37', 0);
INSERT INTO `index_config` VALUES (15, 'V领短袖搭半身碎花裙套装', 5, 11061, '##', 100, 1, '2019-09-18 17:50:18', 0, '2024-03-19 22:46:37', 0);
INSERT INTO `index_config` VALUES (16, '欧诗漫珍珠白洁水乳霜面膜护肤品套装', 5, 11035, '##', 99, 1, '2019-09-18 17:52:03', 0, '2023-11-12 22:24:57', 0);
INSERT INTO `index_config` VALUES (17, '时尚减龄套装上衣半身裙两件套', 5, 11062, '##', 100, 1, '2019-09-18 17:52:19', 0, '2024-03-19 22:46:37', 0);
INSERT INTO `index_config` VALUES (18, '热销推荐', 5, 11087, '##', 101, 0, '2019-09-18 17:52:50', 0, '2019-09-18 17:52:50', 0);
INSERT INTO `index_config` VALUES (19, '春夏新品西装外套穿搭裤子', 5, 11063, '##', 100, 1, '2019-09-18 17:54:07', 0, '2024-03-19 22:46:37', 0);
INSERT INTO `index_config` VALUES (20, '11', 5, 1, '##', 0, 1, '2019-09-19 08:31:11', 0, '2019-09-19 08:31:20', 0);
INSERT INTO `index_config` VALUES (21, '热销商品 美汁源 9元两瓶', 3, 10901, '##', 200, 1, '2019-09-19 23:23:38', 0, '2023-02-23 16:37:09', 0);
INSERT INTO `index_config` VALUES (22, '新品上线', 4, 11086, '##', 200, 0, '2019-09-19 23:26:05', 0, '2019-09-19 23:26:05', 0);
INSERT INTO `index_config` VALUES (23, '新品上线 巧克力礼盒', 4, 10897, '##', 199, 1, '2019-09-19 23:26:32', 0, '2023-02-23 15:36:40', 0);
INSERT INTO `index_config` VALUES (24, '热销推荐', 5, 11084, '##', 101, 0, '2019-09-19 23:27:00', 0, '2019-09-19 23:27:00', 0);
INSERT INTO `index_config` VALUES (25, '新品上线', 4, 11088, '##', 0, 0, '2023-02-23 15:37:41', 0, '2023-02-23 15:37:41', 0);
INSERT INTO `index_config` VALUES (26, '热销商品', 3, 11082, '##', 1, 0, '2023-03-06 21:35:58', 0, '2023-03-06 21:35:58', 0);
INSERT INTO `index_config` VALUES (27, '热销商品', 3, 11083, '##', 1, 0, '2023-03-06 21:37:41', 0, '2023-03-06 21:37:41', 0);
INSERT INTO `index_config` VALUES (28, '韩版修身商务职业正装休闲西装', 5, 11045, '##', 0, 1, '2023-11-13 00:09:20', 0, '2024-03-19 22:46:37', 0);
INSERT INTO `index_config` VALUES (29, '防晒外套短裤套装', 5, 11031, '##', 0, 1, '2023-11-13 00:09:42', 0, '2024-03-19 22:46:37', 0);

-- ----------------------------
-- Table structure for mall_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单表主键id',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户主键id',
  `total_price` int(11) NOT NULL DEFAULT 1 COMMENT '订单总价',
  `pay_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付状态:0.未支付,1.支付成功,-1:支付失败',
  `pay_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0.无 1.支付宝支付 2.微信支付',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭',
  `extra_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单body',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人收货地址',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最新修改时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_order
-- ----------------------------
INSERT INTO `mall_order` VALUES (1, '15688187285093508', 1, 2492, 1, 2, '2019-09-18 23:00:18', -1, '', '', '', 'xafsdufhpwe', 0, '2019-09-18 22:53:07', '2019-09-18 22:55:32');
INSERT INTO `mall_order` VALUES (2, '15688188616936181', 1, 135, 1, 1, '2019-09-18 23:01:06', 1, '', '', '', 'xafsdufhpwe', 0, '2019-09-18 22:55:20', '2019-09-18 23:01:06');
INSERT INTO `mall_order` VALUES (3, '15689089426956979', 1, 15487, 1, 1, '2019-09-20 00:16:03', 3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-19 23:56:40', '2019-09-20 00:10:39');
INSERT INTO `mall_order` VALUES (4, '15689090398492576', 1, 8499, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-19 23:58:18', '2019-09-19 23:58:18');
INSERT INTO `mall_order` VALUES (5, '15689096266448452', 1, 115, 1, 2, '2019-09-20 00:13:52', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-20 00:08:04', '2019-09-20 00:13:52');
INSERT INTO `mall_order` VALUES (6, '15691645776131562', 7, 7998, 1, 1, '2019-09-22 23:05:53', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-22 22:57:15', '2019-09-22 23:05:53');
INSERT INTO `mall_order` VALUES (7, '15691648465397435', 7, 13998, 1, 2, '2019-09-22 23:07:38', -1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-22 23:01:44', '2019-09-22 23:02:10');
INSERT INTO `mall_order` VALUES (8, '15691649071896878', 7, 1246, 1, 1, '2019-09-22 23:08:31', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-22 23:02:45', '2019-09-22 23:08:31');
INSERT INTO `mall_order` VALUES (9, '15691649748362177', 7, 25656, 1, 1, '2019-09-22 23:09:39', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-22 23:03:52', '2019-09-22 23:50:45');
INSERT INTO `mall_order` VALUES (10, '15691652286194502', 7, 16197, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-22 23:08:06', '2019-09-22 23:08:06');
INSERT INTO `mall_order` VALUES (11, '15692210075967186', 6, 5999, 1, 2, '2019-09-23 17:03:05', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-23 14:43:27', '2019-09-23 17:03:05');
INSERT INTO `mall_order` VALUES (12, '15692218454123239', 6, 7245, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-23 14:57:25', '2019-09-23 14:57:25');
INSERT INTO `mall_order` VALUES (13, '15692225252983527', 6, 5488, 1, 2, '2019-09-23 15:38:54', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-23 15:08:45', '2019-09-23 15:38:54');
INSERT INTO `mall_order` VALUES (14, '15692291639125640', 6, 9046, 1, 2, '2019-09-23 16:59:32', -1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2709', 0, '2019-09-23 16:59:23', '2019-09-23 16:59:40');
INSERT INTO `mall_order` VALUES (15, '15692295348262843', 6, 65, 1, 2, '2019-09-23 17:06:17', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2709', 0, '2019-09-23 17:05:34', '2019-09-23 17:06:17');
INSERT INTO `mall_order` VALUES (16, '15692298037679052', 6, 15233, 1, 2, '2019-09-23 17:10:08', 1, '', '', '', '上海浦东新区XX路XX号 999 137xxxx7797', 0, '2019-09-23 17:10:03', '2019-09-23 17:10:08');
INSERT INTO `mall_order` VALUES (17, '15694781962831307', 7, 1246, 1, 2, '2019-09-26 14:10:12', -1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-26 14:09:56', '2019-09-26 14:10:22');
INSERT INTO `mall_order` VALUES (18, '15698039249771093', 7, 3199, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-30 08:38:26', '2019-09-30 08:38:26');
INSERT INTO `mall_order` VALUES (19, '15702783557537865', 7, 6819, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-10-05 20:20:10', '2019-10-05 20:20:10');
INSERT INTO `mall_order` VALUES (20, '15702847670935185', 6, 3999, 1, 2, '2019-10-05 22:13:03', 3, '', '', '', '上海浦东新区XX路XX号 999 137xxxx7797', 0, '2019-10-05 22:12:47', '2023-03-06 19:44:22');
INSERT INTO `mall_order` VALUES (21, '16781587067827264', 1, 248, 1, 1, '2023-03-07 11:12:28', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2023-03-07 11:11:46', '2023-03-07 11:12:28');
INSERT INTO `mall_order` VALUES (22, '16783392026102891', 1, 2222, 1, 1, '2023-03-09 13:20:18', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2023-03-09 13:20:02', '2023-03-09 13:20:18');
INSERT INTO `mall_order` VALUES (23, '16783634356281853', 1, 3444, 1, 1, '2023-03-09 20:04:05', 3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2023-03-09 20:03:55', '2023-03-09 20:04:51');
INSERT INTO `mall_order` VALUES (24, '16809587624866393', 1, 89, 1, 1, '2023-04-08 20:59:31', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2023-04-08 20:59:22', '2023-04-08 20:59:31');
INSERT INTO `mall_order` VALUES (25, '16997891116191849', 1, 150, 1, 1, '2023-11-12 19:38:37', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2023-11-12 19:38:31', '2023-11-12 19:38:37');
INSERT INTO `mall_order` VALUES (26, '16998046903544584', 1, 140, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2023-11-12 23:58:10', '2023-11-12 23:58:10');
INSERT INTO `mall_order` VALUES (27, '16998048478105887', 1, 88, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2023-11-13 00:00:47', '2023-11-13 00:00:47');
INSERT INTO `mall_order` VALUES (28, '16998055423839979', 1, 300, 1, 1, '2023-11-13 00:12:31', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2023-11-13 00:12:22', '2023-11-13 00:12:31');
INSERT INTO `mall_order` VALUES (29, '16998390699383964', 1, 70, 1, 1, '2023-11-13 09:31:16', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2023-11-13 09:31:09', '2023-11-13 09:31:16');
INSERT INTO `mall_order` VALUES (30, '17046107734905793', 1, 269, 1, 1, '2024-01-07 14:59:41', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2024-01-07 14:59:33', '2024-01-07 14:59:41');
INSERT INTO `mall_order` VALUES (31, '17108599001925215', 1, 1, 1, 1, '2024-03-19 22:51:47', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2024-03-19 22:51:40', '2024-03-19 22:51:47');

-- ----------------------------
-- Table structure for tb_newbee_mall_order_item
-- ----------------------------
DROP TABLE IF EXISTS `mall_order_item`;
CREATE TABLE `tb_newbee_mall_order_item`  (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单关联购物项主键id',
  `order_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '订单主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联商品id',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时商品的名称(订单快照)',
  `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时商品的主图(订单快照)',
  `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '下单时商品的价格(订单快照)',
  `goods_count` int(11) NOT NULL DEFAULT 1 COMMENT '数量(订单快照)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`order_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (1, 1, 10180, 'Apple AirPods 配充电盒', '/goods-img/64768a8d-0664-4b29-88c9-2626578ffbd1.jpg', 1246, 2, '2019-09-18 22:53:07');
INSERT INTO `order_item` VALUES (2, 2, 10147, 'MUJI 羽毛 靠垫', '/goods-img/0f701215-b782-40c7-8bbd-97b51be56461.jpg', 65, 1, '2019-09-18 22:55:20');
INSERT INTO `order_item` VALUES (3, 2, 10158, '无印良品 女式粗棉线条纹长袖T恤', 'http://localhost:28089/goods-img/5488564b-8335-4b0c-a5a4-52f3f03ee728.jpg', 70, 1, '2019-09-18 22:55:20');
INSERT INTO `order_item` VALUES (4, 3, 10742, '华为 HUAWEI P30 Pro', '/goods-img/dda1d575-cdac-4eb4-a118-3834490166f7.jpg', 5488, 1, '2019-09-19 23:56:40');
INSERT INTO `order_item` VALUES (5, 3, 10320, 'Apple iPhone 11 Pro', '/goods-img/0025ad55-e260-4a00-be79-fa5b8c5ac0de.jpg', 9999, 1, '2019-09-19 23:56:40');
INSERT INTO `order_item` VALUES (6, 4, 10254, 'Apple 2019款 MacBook Air 13.3', '/goods-img/7810bc9d-236f-4386-a0ef-45a831b49bf2.jpg', 8499, 1, '2019-09-19 23:58:18');
INSERT INTO `order_item` VALUES (7, 5, 10104, '无印良品 MUJI 修正带', '/goods-img/98ce17e1-890e-4eaf-856a-7fce8ffebc4c.jpg', 15, 1, '2019-09-20 00:08:04');
INSERT INTO `order_item` VALUES (8, 5, 10110, '无印良品 MUJI 基础润肤乳霜', '/goods-img/30036561-a150-4ea7-9106-29bbea278909.jpg', 100, 1, '2019-09-20 00:08:04');
INSERT INTO `order_item` VALUES (9, 6, 10895, 'HUAWEI Mate 30 4000万超感光徕卡影像', '/goods-img/mate30-3.png', 3999, 2, '2019-09-22 22:57:15');
INSERT INTO `order_item` VALUES (10, 7, 10895, 'HUAWEI Mate 30 4000万超感光徕卡影像', '/goods-img/mate30-3.png', 3999, 1, '2019-09-22 23:01:44');
INSERT INTO `order_item` VALUES (11, 7, 10320, 'Apple iPhone 11 Pro', '/goods-img/0025ad55-e260-4a00-be79-fa5b8c5ac0de.jpg', 9999, 1, '2019-09-22 23:01:44');
INSERT INTO `order_item` VALUES (12, 8, 10180, 'Apple AirPods 配充电盒', '/goods-img/64768a8d-0664-4b29-88c9-2626578ffbd1.jpg', 1246, 1, '2019-09-22 23:02:45');
INSERT INTO `order_item` VALUES (13, 9, 10237, 'MAC 雾面丝绒哑光子弹头口红', 'http://localhost:28089/goods-img/1930d79b-88bd-4c5c-8510-0697c9ad2578.jpg', 165, 4, '2019-09-22 23:03:52');
INSERT INTO `order_item` VALUES (14, 9, 10254, 'Apple 2019款 MacBook Air 13.3', '/goods-img/7810bc9d-236f-4386-a0ef-45a831b49bf2.jpg', 8499, 2, '2019-09-22 23:03:52');
INSERT INTO `order_item` VALUES (15, 9, 10195, '索尼 WH-1000XM3 头戴式耳机', 'http://localhost:28089/goods-img/0dc503b2-90a2-4971-9723-c085a1844b76.jpg', 2599, 1, '2019-09-22 23:03:52');
INSERT INTO `order_item` VALUES (16, 9, 10894, 'HUAWEI Mate 30 Pro', '/goods-img/mate30p3.png', 5399, 1, '2019-09-22 23:03:52');
INSERT INTO `order_item` VALUES (17, 10, 10894, 'HUAWEI Mate 30 Pro', '/goods-img/mate30p3.png', 5399, 3, '2019-09-22 23:08:06');
INSERT INTO `order_item` VALUES (18, 11, 10279, 'Apple iPhone 11 (A2223)', '/goods-img/a0d09f94-9c46-4ee1-aaef-dfd132e7543e.jpg', 5999, 1, '2019-09-23 14:43:27');
INSERT INTO `order_item` VALUES (19, 12, 10279, 'Apple iPhone 11 (A2223)', '/goods-img/a0d09f94-9c46-4ee1-aaef-dfd132e7543e.jpg', 5999, 1, '2019-09-23 14:57:26');
INSERT INTO `order_item` VALUES (20, 12, 10159, 'Apple AirPods 配充电盒', '/goods-img/53c9f268-7cd4-4fac-909c-2dc066625655.jpg', 1246, 1, '2019-09-23 14:57:26');
INSERT INTO `order_item` VALUES (21, 13, 10742, '华为 HUAWEI P30 Pro', '/goods-img/dda1d575-cdac-4eb4-a118-3834490166f7.jpg', 5488, 1, '2019-09-23 15:08:46');
INSERT INTO `order_item` VALUES (22, 14, 10158, '无印良品 女式粗棉线条纹长袖T恤', '/goods-img/5488564b-8335-4b0c-a5a4-52f3f03ee728.jpg', 70, 1, '2019-09-23 16:59:24');
INSERT INTO `order_item` VALUES (23, 14, 10704, '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI...', '/goods-img/b9e6d770-06dd-40f4-9ae5-31103cec6e5f.jpg', 3988, 1, '2019-09-23 16:59:24');
INSERT INTO `order_item` VALUES (24, 14, 10739, '华为 HUAWEI P30 Pro', '/goods-img/65c8e729-aeca-4780-977b-4d0d39d4aa2e.jpg', 4988, 1, '2019-09-23 16:59:24');
INSERT INTO `order_item` VALUES (25, 15, 10147, 'MUJI 羽毛 靠垫', '/goods-img/0f701215-b782-40c7-8bbd-97b51be56461.jpg', 65, 1, '2019-09-23 17:05:34');
INSERT INTO `order_item` VALUES (26, 16, 10742, '华为 HUAWEI P30 Pro', '/goods-img/dda1d575-cdac-4eb4-a118-3834490166f7.jpg', 5488, 1, '2019-09-23 17:10:03');
INSERT INTO `order_item` VALUES (27, 16, 10159, 'Apple AirPods 配充电盒', '/goods-img/53c9f268-7cd4-4fac-909c-2dc066625655.jpg', 1246, 1, '2019-09-23 17:10:03');
INSERT INTO `order_item` VALUES (28, 16, 10254, 'Apple 2019款 MacBook Air 13.3', '/goods-img/7810bc9d-236f-4386-a0ef-45a831b49bf2.jpg', 8499, 1, '2019-09-23 17:10:03');
INSERT INTO `order_item` VALUES (29, 17, 10180, 'Apple AirPods 配充电盒', '/goods-img/64768a8d-0664-4b29-88c9-2626578ffbd1.jpg', 1246, 1, '2019-09-26 14:09:56');
INSERT INTO `order_item` VALUES (30, 18, 10779, '华为 HUAWEI Mate 20', '/goods-img/08f9a912-f049-4cf8-a839-115fc6582398.jpg', 3199, 1, '2019-09-30 08:38:26');
INSERT INTO `order_item` VALUES (31, 19, 10742, '华为 HUAWEI P30 Pro', '/goods-img/dda1d575-cdac-4eb4-a118-3834490166f7.jpg', 5488, 1, '2019-10-05 20:20:10');
INSERT INTO `order_item` VALUES (32, 19, 10154, '无印良品 MUJI 塑料浴室座椅', '/goods-img/15395057-94e9-4545-a8ee-8aee025f40c5.jpg', 85, 1, '2019-10-05 20:20:10');
INSERT INTO `order_item` VALUES (33, 19, 10159, 'Apple AirPods 配充电盒', '/goods-img/53c9f268-7cd4-4fac-909c-2dc066625655.jpg', 1246, 1, '2019-10-05 20:20:10');
INSERT INTO `order_item` VALUES (34, 20, 10895, 'HUAWEI Mate 30 4000万超感光徕卡影像', '/goods-img/mate30-3.png', 3999, 1, '2019-10-05 22:12:47');
INSERT INTO `order_item` VALUES (35, 21, 10917, '梦多福显微镜', 'http://127.0.0.1:8080/upload/20230305_17204310.jpg', 124, 2, '2023-03-07 11:11:46');
INSERT INTO `order_item` VALUES (36, 22, 10971, '京逸金银渐层幼猫蓝猫幼崽', 'http://127.0.0.1:8080/upload/20230308_20302832.jpeg', 2222, 1, '2023-03-09 13:20:02');
INSERT INTO `order_item` VALUES (37, 23, 10972, '90天保障 英短金渐层活体', 'http://127.0.0.1:8080/upload/20230308_20311284.jpeg', 3444, 1, '2023-03-09 20:03:55');
INSERT INTO `order_item` VALUES (38, 24, 11031, '鸿运当头盆栽花卉植物室内花客厅', 'http://127.0.0.1:8080/upload/20230408_20132846.jpg', 19, 1, '2023-04-08 20:59:22');
INSERT INTO `order_item` VALUES (39, 24, 11055, '花束生日礼物六一儿童节', 'http://127.0.0.1:8080/upload/20230408_20450953.jpeg', 70, 1, '2023-04-08 20:59:22');
INSERT INTO `order_item` VALUES (40, 25, 11034, '牛仔马甲女2023夏季新款外搭无袖休闲叠穿背心', 'http://127.0.0.1:8080/upload/20231112_16350025.jpg', 150, 1, '2023-11-12 19:38:31');
INSERT INTO `order_item` VALUES (41, 26, 11039, '时尚光泽褶裥包', 'http://127.0.0.1:8080/upload/20231112_1913546.jpg', 140, 1, '2023-11-12 23:58:10');
INSERT INTO `order_item` VALUES (42, 27, 11056, '2023法式复古圆领长袖碎花裙', 'http://127.0.0.1:8080/upload/20231112_20592325.jpg', 88, 1, '2023-11-13 00:00:47');
INSERT INTO `order_item` VALUES (43, 28, 11045, '韩版修身商务职业正装休闲西装', 'http://127.0.0.1:8080/upload/20231112_1701068.jpg', 300, 1, '2023-11-13 00:12:22');
INSERT INTO `order_item` VALUES (44, 29, 11055, '个性图案配色袖机车夹克', 'http://127.0.0.1:8080/upload/20231112_15462079.jpg', 70, 1, '2023-11-13 09:31:09');
INSERT INTO `order_item` VALUES (45, 30, 11034, '牛仔马甲女2023夏季新款外搭无袖休闲叠穿背心', 'http://127.0.0.1:8080/upload/20231112_16350025.jpg', 150, 1, '2024-01-07 14:59:33');
INSERT INTO `order_item` VALUES (46, 30, 11050, '皮革质感复古迷你挎包', 'http://192.168.1.31:8080/upload/20231112_16090564.jpg', 119, 1, '2024-01-07 14:59:33');
INSERT INTO `order_item` VALUES (47, 31, 11087, '胡萝卜', 'http://localhost:8080/upload/20240319_22373237.jpg', 1, 1, '2024-03-19 22:51:40');

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item`  (
  `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物项主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联商品id',
  `goods_count` int(11) NOT NULL DEFAULT 1 COMMENT '数量(最大为5)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最新修改时间',
  PRIMARY KEY (`cart_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart_item
-- ----------------------------
INSERT INTO `shopping_cart_item` VALUES (1, 1, 10158, 1, 0, '2023-02-23 14:25:24', '2023-02-23 14:25:24');
INSERT INTO `shopping_cart_item` VALUES (2, 1, 10917, 2, 1, '2023-03-07 11:09:48', '2023-03-07 11:10:04');
INSERT INTO `shopping_cart_item` VALUES (3, 1, 10968, 1, 0, '2023-03-07 11:13:58', '2023-03-07 11:13:58');
INSERT INTO `shopping_cart_item` VALUES (4, 1, 10917, 1, 0, '2023-03-07 19:42:38', '2023-03-07 19:42:38');
INSERT INTO `shopping_cart_item` VALUES (5, 1, 10951, 1, 0, '2023-03-07 21:39:14', '2023-03-07 21:39:14');
INSERT INTO `shopping_cart_item` VALUES (6, 1, 10971, 1, 1, '2023-03-09 13:19:51', '2023-03-09 13:19:51');
INSERT INTO `shopping_cart_item` VALUES (7, 1, 10972, 1, 1, '2023-03-09 20:03:37', '2023-03-09 20:03:37');
INSERT INTO `hopping_cart_item` VALUES (8, 1, 11031, 1, 1, '2023-04-08 16:07:36', '2023-04-08 16:07:36');
INSERT INTO `shopping_cart_item` VALUES (9, 1, 11055, 1, 1, '2023-04-08 20:59:09', '2023-04-08 20:59:09');
INSERT INTO `shopping_cart_item` VALUES (10, 1, 11034, 1, 1, '2023-11-12 19:38:20', '2023-11-12 19:38:20');
INSERT INTO `shopping_cart_item` VALUES (11, 1, 11039, 1, 1, '2023-11-12 23:58:03', '2023-11-12 23:58:03');
INSERT INTO `shopping_cart_item` VALUES (12, 1, 11056, 1, 1, '2023-11-13 00:00:41', '2023-11-13 00:00:41');
INSERT INTO `shopping_cart_item` VALUES (13, 1, 11045, 1, 1, '2023-11-13 00:12:09', '2023-11-13 00:12:09');
INSERT INTO `shopping_cart_item` VALUES (14, 1, 11055, 1, 1, '2023-11-13 09:30:50', '2023-11-13 09:30:50');
INSERT INTO `shopping_cart_item` VALUES (15, 1, 11034, 1, 1, '2024-01-06 11:48:56', '2024-01-06 11:48:56');
INSERT INTO `shopping_cart_item` VALUES (16, 1, 11050, 1, 1, '2024-01-07 14:59:15', '2024-01-07 14:59:15');
INSERT INTO `shopping_cart_item` VALUES (17, 1, 11057, 1, 0, '2024-01-07 15:01:06', '2024-01-07 15:01:06');
INSERT INTO `shopping_cart_item` VALUES (18, 1, 11087, 1, 1, '2024-03-19 22:51:22', '2024-03-19 22:51:29');
INSERT INTO `shopping_cart_item` VALUES (19, 1, 11081, 1, 0, '2024-03-25 12:15:40', '2024-03-25 12:15:57');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `tb_newbee_mall_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `login_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登陆名称(默认为手机号)',
  `password_md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'MD5加密后的密码',
  `introduce_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '注销标识字段(0-正常 1-已注销)',
  `locked_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '锁定标识字段(0-未锁定 1-已锁定)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_user
-- ----------------------------
INSERT INTO `user` VALUES (1, '十三', '15638873190', 'e10adc3949ba59abbe56e057f20f883e', '我不怕千万人阻挡，只怕自己投降', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, 0, '2019-09-22 08:44:57');
INSERT INTO `user` VALUES (6, '测试用户1', '13711113333', 'dda01dc6d334badcd031102be6bee182', '测试用户1', '上海浦东新区XX路XX号 999 137xxxx7797', 0, 0, '2019-08-29 10:51:39');
INSERT INTO `user` VALUES (7, '测试用户2测试用户2测试用户2测试用户2', '13811113333', 'dda01dc6d334badcd031102be6bee182', '测试用户2', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, 0, '2019-08-29 10:55:08');
INSERT INTO `user` VALUES (8, '测试用户3', '13911113333', 'dda01dc6d334badcd031102be6bee182', '测试用户3', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, 1, '2019-08-29 10:55:16');
INSERT INTO `user` VALUES (9, '13673876402', '13673876402', 'e10adc3949ba59abbe56e057f20f883e', '', '', 0, 0, '2024-04-10 20:59:31');
INSERT INTO `user` VALUES (10, '1', '1', '698d51a19d8a121ce581499d7b701668', '', '', 0, 0, '2025-01-06 21:38:48');
INSERT INTO `user` VALUES (11, '2', '2', 'c81e728d9d4c2f636f067f89cc14862c', '', '', 0, 0, '2025-01-06 21:41:23');
INSERT INTO `user` VALUES (12, '333', '333', '310dcbbf4cce62f762a2aaa148d556bd', '', '', 0, 0, '2025-01-07 21:13:09');
INSERT INTO `user` VALUES (13, '666', '666', 'fae0b27c451c728867a567e8c1bb4e53', '', '', 0, 0, '2025-01-07 21:13:47');

SET FOREIGN_KEY_CHECKS = 1;

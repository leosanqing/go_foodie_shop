/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : foodie-shop-dev

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 16/11/2020 17:14:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for PDMAN_DB_VERSION
-- ----------------------------
DROP TABLE IF EXISTS `PDMAN_DB_VERSION`;
CREATE TABLE `PDMAN_DB_VERSION` (
  `DB_VERSION` varchar(256) DEFAULT NULL,
  `VERSION_DESC` varchar(1024) DEFAULT NULL,
  `CREATED_TIME` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `image_url` varchar(128) NOT NULL COMMENT '图片 图片地址',
  `background_color` varchar(32) DEFAULT NULL COMMENT '背景色',
  `item_id` varchar(64) DEFAULT NULL COMMENT '商品id 商品id',
  `cat_id` varchar(64) DEFAULT NULL COMMENT '商品分类id 商品分类id',
  `type` int(11) NOT NULL COMMENT '轮播图类型 轮播图类型，用于判断，可以根据商品id或者分类进行页面跳转，1：商品 2：分类',
  `sort` int(11) NOT NULL COMMENT '轮播图展示顺序',
  `is_show` int(11) NOT NULL COMMENT '是否展示',
  `create_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间 更新',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='轮播图 ';

-- ----------------------------
-- Records of carousel
-- ----------------------------
BEGIN;
INSERT INTO `carousel` VALUES ('c-10011', 'http://122.152.205.72:88/group1/M00/00/05/CpoxxF0ZmG-ALsPRAAEX2Gk9FUg848.png', '#f44661', 'nut-1004', '', 1, 1, 1, '2019-08-27 20:33:06', '2019-08-24 20:33:09');
INSERT INTO `carousel` VALUES ('c-10013', 'http://122.152.205.72:88/group1/M00/00/05/CpoxxF0ZmHiAWwR7AAFdqZHw8jU876.png', '#000240', '', '51', 2, 2, 1, '2019-08-25 20:33:06', '2019-08-25 20:33:09');
INSERT INTO `carousel` VALUES ('c-10015', 'http://122.152.205.72:88/group1/M00/00/05/CpoxxF0ZmHuAPlXvAAFe-H5_-Nw961.png', '#ff9801', 'cake-1006', '', 1, 3, 1, '2019-08-26 20:33:06', '2019-08-26 20:33:09');
INSERT INTO `carousel` VALUES ('c-10021', 'http://122.152.205.72:88/group1/M00/00/05/CpoxxF0ZmH6AeuRrAAEZviPhyQ0768.png', '#55be59', '', '133', 2, 4, 1, '2019-08-28 20:33:06', '2019-08-28 20:33:09');
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL COMMENT '分类名称',
  `type` int(11) NOT NULL COMMENT '分类类型',
  `father_id` int(11) NOT NULL COMMENT '父id',
  `logo` varchar(64) DEFAULT NULL COMMENT '图标',
  `slogan` varchar(64) DEFAULT NULL COMMENT '口号',
  `cat_image` varchar(64) DEFAULT NULL COMMENT '分类图',
  `bg_color` varchar(32) DEFAULT NULL COMMENT '背景颜色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COMMENT='商品分类 ';

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, '甜点/蛋糕', 1, 0, 'img/cake.png', '每一道甜品都能打开你的味蕾', 'http://122.152.205.72:88/foodie/category/cake.png', '#fe7a65');
INSERT INTO `category` VALUES (2, '饼干/膨化', 1, 0, 'img/cookies.png', '嘎嘣脆，一听到声音就开吃', 'http://122.152.205.72:88/foodie/category/cookies.png', '#f59cec');
INSERT INTO `category` VALUES (3, '熟食/肉类', 1, 0, 'img/meat.png', '食肉者最爱绝佳美食', 'http://122.152.205.72:88/foodie/category/meat.png', '#b474fe');
INSERT INTO `category` VALUES (4, '素食/卤味', 1, 0, 'img/luwei.png', '香辣甜辣麻辣，辣了才有味', 'http://122.152.205.72:88/foodie/category/duck.png', '#82ceff');
INSERT INTO `category` VALUES (5, '坚果/炒货', 1, 0, 'img/jianguo.png', '酥脆无比，休闲最佳', 'http://122.152.205.72:88/foodie/category/nut.png', '#c6a868');
INSERT INTO `category` VALUES (6, '糖果/蜜饯', 1, 0, 'img/sweet.png', '甜味是爱美者的最爱', 'http://122.152.205.72:88/foodie/category/mango.png', '#6bdea7');
INSERT INTO `category` VALUES (7, '巧克力', 1, 0, 'img/chocolate.png', '美容养颜，男女都爱', 'http://122.152.205.72:88/foodie/category/chocolate.png', '#f8c375');
INSERT INTO `category` VALUES (8, '海鲜/海味', 1, 0, 'img/lobster.png', '吃货们怎么能少了海鲜呢？', 'http://122.152.205.72:88/foodie/category/crab.png', '#84affe');
INSERT INTO `category` VALUES (9, '花茶/果茶', 1, 0, 'img/tea.png', '绿茶红茶怎能少得了', 'http://122.152.205.72:88/foodie/category/tea.png', '#ff9229');
INSERT INTO `category` VALUES (10, '生鲜/蔬果', 1, 0, 'img/food.png', '新鲜少不了，每日蔬果生鲜', 'http://122.152.205.72:88/foodie/category/meat2.png', '#6cc67c');
INSERT INTO `category` VALUES (11, '蛋糕', 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (12, '点心', 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (13, '饼干', 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (14, '薯片', 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (15, '虾条', 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (16, '肉铺', 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (17, '肉松', 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (18, '香肠', 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (19, '豆干', 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (20, '干笋', 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (21, '鸭脖', 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (22, '坚果', 2, 5, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (23, '锅巴', 2, 5, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (24, '糖果', 2, 6, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (25, '蜜饯', 2, 6, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (26, '巧克力', 2, 7, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (27, '果冻', 2, 7, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (29, '海鲜', 2, 8, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (30, '海味', 2, 8, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (31, '茶叶', 2, 9, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (32, '奶茶', 2, 9, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (33, '果茶', 2, 9, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (34, '蔬菜', 2, 10, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (35, '水果', 2, 10, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (36, '肉类', 2, 10, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (37, '蒸蛋糕', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (38, '软面包', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (39, '脱水蛋糕', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (40, '马卡龙', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (41, '甜甜圈', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (42, '三明治', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (43, '铜锣烧', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (44, '肉松饼', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (45, '华夫饼', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (46, '沙琪玛', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (47, '鸡蛋卷', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (48, '蛋饼', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (49, '凤梨酥', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (50, '手撕面包', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (51, '苏打饼干', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (52, '夹心饼干', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (53, '闲饼干', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (54, '甜饼干', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (55, '威化饼干', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (56, '酥饼干', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (57, '曲奇', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (58, '无糖饼干', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (59, '早餐饼干', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (60, '薯条', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (61, '薯片', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (62, '山药薯片', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (63, '网红薯片', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (64, '蛋黄薯片', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (65, '虾条', 3, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (66, '怀旧虾条', 3, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (67, '8090后虾条', 3, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (68, '进口虾条', 3, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (69, 'DIY虾条', 3, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (73, '猪肉脯', 3, 16, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (74, '牛肉脯', 3, 16, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (75, '鸡肉脯', 3, 16, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (76, '散装肉脯', 3, 16, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (77, '猪肉干', 3, 16, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (78, '牛肉干', 3, 16, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (79, '牛肉粒', 3, 16, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (80, '牛肉松', 3, 17, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (81, '猪肉松', 3, 17, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (82, '儿童肉松', 3, 17, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (83, '腊味香肠', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (84, '广式香肠', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (85, '火腿肠', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (86, '烤肠', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (87, '鸡肉肠', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (88, '鱼肠', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (89, '酒味香肠', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (90, '香菇', 3, 19, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (91, '零食', 3, 19, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (92, '豆腐干', 3, 19, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (93, '辣条', 3, 19, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (94, '泡椒脆笋', 3, 20, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (95, '野生笋干', 3, 20, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (96, '扁尖笋', 3, 20, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (97, '农家笋', 3, 20, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (98, '卤味鸭脖', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (99, '麻辣鸭脖', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (100, '武汉鸭脖', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (101, '鸭锁骨', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (102, '鸭胗', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (103, '鸭翅', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (104, '网红坚果', 3, 22, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (105, '瓜子', 3, 22, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (106, '碧根果', 3, 22, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (107, '松子', 3, 22, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (108, '山核桃', 3, 22, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (109, '开心果', 3, 22, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (110, '腰果', 3, 22, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (111, '网红锅巴', 3, 23, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (112, '蛋黄锅巴', 3, 23, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (113, '水果糖', 3, 24, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (114, '薄荷糖', 3, 24, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (115, '夹心糖', 3, 24, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (116, '奶糖', 3, 24, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (117, '喜糖', 3, 24, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (118, '麦芽糖', 3, 24, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (119, '话梅', 3, 25, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (120, '果干', 3, 25, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (121, '草莓干', 3, 25, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (122, '芒果干', 3, 25, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (123, '菠萝干', 3, 25, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (124, '山楂糕', 3, 25, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (125, '黑巧克力', 3, 26, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (126, '白巧克力', 3, 26, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (127, '夹心巧克力', 3, 26, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (128, '榛果巧克力', 3, 26, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (129, '日本生巧', 3, 26, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (130, '果肉布丁', 3, 27, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (131, '果冻碎碎冰', 3, 27, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (132, '果汁果冻', 3, 27, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (133, '帝王蟹', 3, 29, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (134, '大龙虾', 3, 29, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (135, '鲍鱼', 3, 29, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (136, '海参', 3, 29, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (137, '鱿鱼', 3, 29, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (138, '三文鱼', 3, 29, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (139, '扇贝', 3, 29, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (140, '干贝', 3, 30, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (141, '海苔', 3, 30, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (142, '虾仁', 3, 30, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (143, '海鱼干', 3, 30, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (144, '水蜜桃茶', 3, 33, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (145, '白桃乌龙茶', 3, 33, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (146, '柠檬片', 3, 33, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (147, '白茶', 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (148, '红茶', 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (149, '绿茶', 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (150, '铁观音', 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (151, '胖大海', 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (152, '碧螺春', 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (153, '速冲奶茶', 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (154, '珍珠奶茶', 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (155, '袋装奶茶', 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (156, '英式奶茶', 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (157, '黄瓜', 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (158, '芋头', 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (159, '玉米', 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (160, '南瓜', 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (161, '荸荠', 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (162, '山药', 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (163, '秋葵', 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (164, '红薯/紫薯', 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (165, '土豆', 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (166, '水蜜桃', 3, 35, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (167, '西瓜', 3, 35, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (168, '苹果', 3, 35, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (169, '凤梨', 3, 35, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (170, '草莓', 3, 35, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (171, '葡萄', 3, 35, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (172, '杨梅', 3, 35, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (173, '牛排', 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (174, '鸡肉', 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (175, '猪肉', 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (176, '羊肉', 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (177, '蹄子', 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (178, '糖醋排骨', 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (188, '好面包', 4, 137, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` varchar(64) NOT NULL COMMENT '商品主键id',
  `item_name` varchar(32) NOT NULL COMMENT '商品名称 商品名称',
  `cat_id` int(11) NOT NULL COMMENT '分类外键id 分类id',
  `root_cat_id` int(11) NOT NULL COMMENT '一级分类外键id',
  `sell_counts` int(11) NOT NULL COMMENT '累计销售 累计销售',
  `on_off_status` int(11) NOT NULL COMMENT '上下架状态 上下架状态,1:上架 2:下架',
  `content` text NOT NULL COMMENT '商品内容 商品内容',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表 商品信息相关表：分类表，商品图片表，商品规格表，商品参数表';

-- ----------------------------
-- Records of items
-- ----------------------------
BEGIN;
INSERT INTO `items` VALUES ('bingan-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 51, 2, 396, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/bingan-1001/img1.png\"><img src=\"http://122.152.205.72:88/foodie/bingan-1001/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('bingan-1002', '【天天吃货】男人最爱 秋葵饼干 嘎嘣脆', 51, 2, 424, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/bingan-1002/img1.png\"><img src=\"http://122.152.205.72:88/foodie/bingan-1002/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('bingan-1003', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 51, 2, 868, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/bingan-1003/img1.png\"><img src=\"http://122.152.205.72:88/foodie/bingan-1003/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('bingan-1004', '【天天吃货】可爱美丽甜甜圈 最美下午茶', 51, 2, 878, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/bingan-1004/img1.png\"><img src=\"http://122.152.205.72:88/foodie/bingan-1004/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('bingan-1005', '【天天吃货】夹心吐司面包 早餐面包 早点早饭', 51, 2, 757, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/bingan-1005/img1.png\"><img src=\"http://122.152.205.72:88/foodie/bingan-1005/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('bingan-1006', '【天天吃货】夹心吐司面包 全麦面包 早点早饭', 51, 2, 656, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/bingan-1006/img1.png\"><img src=\"http://122.152.205.72:88/foodie/bingan-1006/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('cake-1001', '【天天吃货】真香预警 超级好吃 手撕面包 儿童早餐早饭', 37, 1, 1003, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-1001/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-1001/img2.png\"><img src=\"http://122.152.205.72:88/foodie/cake-1001/img3.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('cake-1002', '【天天吃货】网红烘焙蛋糕 好吃的蛋糕', 37, 1, 363, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-1002/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-1002/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('cake-1003', '【天天吃货】超好吃华夫饼 美食诱惑 下午茶', 37, 1, 636, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-1003/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-1003/img2.png\">', '2019-09-08 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('cake-1004', '【天天吃货】美味沙琪玛 超棒下午茶', 37, 1, 525, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-1004/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-1004/img2.png\"><img src=\"http://122.152.205.72:88/foodie/cake-1004/img3.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('cake-1005', '【天天吃货】进口美食凤梨酥', 37, 1, 414, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-1005/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-1005/img2.png\">', '2019-09-10 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('cake-1006', '【天天吃货】机器猫最爱 铜锣烧 最美下午茶', 37, 1, 3314, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-1006/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-1006/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('cake-37', '好吃蛋糕甜点蒸蛋糕', 37, 1, 3786, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-37/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-37/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cake-38', '好吃蛋糕甜点软面包', 38, 1, 1328, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-38/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-38/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cake-39', '好吃蛋糕甜点脱水蛋糕', 39, 1, 1786, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-39/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-39/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cake-42', '好吃蛋糕甜点脱水蛋糕', 42, 1, 2328, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-42/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-42/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cake-44', '好吃蛋糕甜点软面包', 44, 1, 1338, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-44/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-44/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cake-47', '好吃鸡蛋卷 来自日本进口', 47, 1, 1349, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-47/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-47/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cake-48', '好吃蛋饼 来自日本进口', 48, 1, 1340, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cake-48/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cake-48/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('candy-1001', '【天天吃货】薄荷糖 清凉口气清新 开会必备', 113, 6, 991, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/candy-1001/img1.png\"><img src=\"http://122.152.205.72:88/foodie/candy-1001/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('candy-1002', '【天天吃货】休闲奶糖 零食 好吃的不得了', 113, 6, 968, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/candy-1002/img1.png\"><img src=\"http://122.152.205.72:88/foodie/candy-1002/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('candy-1003', '【天天吃货】休闲麦芽糖 零食糖果 儿时记忆', 113, 6, 769, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/candy-1003/img1.png\"><img src=\"http://122.152.205.72:88/foodie/candy-1003/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('candy-1004', '【天天吃货】休闲山楂糕 零食糖果 下午茶', 113, 6, 218, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/candy-1004/img1.png\"><img src=\"http://122.152.205.72:88/foodie/candy-1004/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('candy-1005', '【天天吃货】菠萝干 最佳下午茶', 113, 6, 3247, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/candy-1005/img1.png\"><img src=\"http://122.152.205.72:88/foodie/candy-1005/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('candy-1006', '【天天吃货】芒果干 女女最爱 最佳下午茶', 113, 6, 1503, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/candy-1006/img1.png\"><img src=\"http://122.152.205.72:88/foodie/candy-1006/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('chocolate-1001', '【天天吃货】黑巧克力 送人必备 最佳下午茶', 125, 7, 3301, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-1001/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-1001/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('chocolate-1002', '【天天吃货】黑巧克力豆 儿时记忆 好吃噢', 125, 7, 206, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-1002/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-1002/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('chocolate-1003', '【天天吃货】巧克力甜甜圈 最棒下午茶 美眉最爱', 125, 7, 360, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-1003/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-1003/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('chocolate-1004', '【天天吃货】水果布丁果冻 最棒下午茶 儿童最爱', 125, 7, 637, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-1004/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-1004/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('chocolate-1005', '【天天吃货】果肉布丁 最棒下午茶 儿童最爱', 125, 7, 987, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-1005/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-1005/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('chocolate-1006', '【天天吃货】玫瑰花水果布丁 最棒下午茶 美眉最爱', 125, 7, 106, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-1006/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-1006/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('chocolate-125', '进口泰国黑巧克力 情人节必备', 125, 7, 4653, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-125/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-125/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('chocolate-127', '进口香港夹心巧克力 情人节必备', 127, 7, 4653, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-127/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-127/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('chocolate-128', '榛果巧克力 喜事必备送人最佳', 128, 7, 3946, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-128/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-128/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('chocolate-129', '进口日本生巧 必备送人最佳', 129, 7, 4656, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-129/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-129/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('chocolate-130', '美味果肉布丁 儿童父母必备', 130, 7, 2353, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-130/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-130/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('chocolate-131', '美味果冻碎碎冰 冰箱家族最爱', 131, 7, 2693, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-131/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-131/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('chocolate-132', '美味果汁果冻布丁 儿童爱吃父母必备', 132, 7, 2653, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/chocolate-132/img1.png\"><img src=\"http://122.152.205.72:88/foodie/chocolate-132/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-51', '嘎嘣脆酥酥麻麻饼干 休闲食品下午茶最爱', 51, 2, 3608, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-51/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-51/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-52', '夹心饼干美味下午茶', 52, 2, 3308, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-52/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-52/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-53', '【天天吃货】儿童饼干 成人饼干 趣趣闲闲', 53, 2, 2949, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-53/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-53/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-54', '甜甜美食饼干 儿童最爱', 54, 2, 1288, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-54/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-54/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-55', '超级好吃巧克力威化饼干 女女最爱', 55, 2, 2330, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-55/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-55/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-56', '甜甜美食饼干 儿童最爱', 56, 2, 3688, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-56/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-56/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-57', '好吃下午茶曲奇饼干', 57, 2, 3093, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-57/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-57/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-58', '【天天吃货】无糖者最爱无糖饼干 酥酥脆脆', 58, 2, 2399, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-58/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-58/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-59', '【天天吃货】儿童饼干 早餐必备', 59, 2, 1949, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-59/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-59/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-60', '儿时记忆儿时最爱 好吃回味薯条', 60, 2, 3108, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-60/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-60/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-62', '美食推荐 山药鼠标美味养生', 62, 2, 1108, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-62/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-62/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-63', '超级好吃巧克力威化饼干 女女最爱', 63, 2, 1230, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-63/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-63/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-64', '【天天吃货】正宗网红超好吃蛋黄薯片', 64, 2, 1049, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-64/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-64/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-65', '【天天吃货】休闲虾条 进口虾条 超美味下午茶', 65, 2, 2649, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-65/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-65/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('cookies-68', '进口虾条奇趣好吃不嫌多', 68, 2, 3308, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/cookies-68/img1.png\"><img src=\"http://122.152.205.72:88/foodie/cookies-68/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-1001', '【天天吃货】特产糖醋排骨 美味佳肴 下酒菜 居家必备', 157, 10, 6301, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-1001/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-1001/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('food-1002', '【天天吃货】农家有机红薯紫薯 农家菜 其乐融融', 157, 10, 960, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-1002/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-1002/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('food-1003', '【天天吃货】正宗阳山水蜜桃 汁多肉肥 香甜可口', 157, 10, 827, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-1003/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-1003/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('food-1004', '【天天吃货】正宗草莓 又大又可口 儿童必吃水果', 157, 10, 107, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-1004/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-1004/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('food-1005', '【天天吃货】正宗进口牛排 沙朗菲力牛排 男人最爱', 157, 10, 3694, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-1005/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-1005/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('food-1006', '【天天吃货】正宗农家自种南瓜 香甜可口 早餐必备', 157, 10, 680, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-1006/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-1006/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('food-74', '香港进口牛肉脯 香甜可口', 74, 3, 3694, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-74/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-74/img2.png\">', '2019-09-01 14:45:34', '2019-09-03 14:45:38');
INSERT INTO `items` VALUES ('food-75', '澳门进口鸡肉脯 香甜可口下酒菜', 75, 3, 2599, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-75/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-75/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-76', '台湾进口散装肉脯 香甜可口', 76, 3, 1869, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-76/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-76/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-761', '香港散装肉脯进口 香甜可口', 76, 3, 3894, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-761/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-761/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-77', '台湾进口散装肉干 香甜可口', 77, 3, 3899, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-77/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-77/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-78', '香港进口牛肉干 香甜可口', 78, 3, 3694, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-78/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-78/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-80', '香港进口牛肉松 香甜可口', 80, 3, 3694, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-80/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-80/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-81', '台湾进口猪肉松 香甜可口', 81, 3, 1849, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-81/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-81/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-82', '台湾进口儿童肉松 香甜可口', 82, 3, 3849, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-82/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-82/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-83', '香港进口腊味香肠 香甜可口', 83, 3, 2694, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-83/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-83/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-84', '东北广式香肠 香甜可口下酒菜', 84, 3, 3596, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-84/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-84/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-85', '美国进口火腿肠 香甜可口下酒菜', 85, 3, 2599, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-85/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-85/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-86', '香港进口腊味香肠 香甜可口', 86, 3, 2594, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-86/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-86/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-87', '澳门进口鸡肉肠 香甜可口下酒菜', 87, 3, 2599, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-87/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-87/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-88', '香港进口鱼肠 香甜可口', 88, 3, 3877, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-88/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-88/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('food-89', '香港进口酒味腊肠 香甜可口下酒菜', 89, 3, 2594, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/food-89/img1.png\"><img src=\"http://122.152.205.72:88/foodie/food-89/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-1001', '【天天吃货】酥肉 鸡肉猪肉牛肉 脆酥香', 73, 3, 557, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-1001/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-1001/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('meat-1002', '【天天吃货】肉铺 鸡肉猪肉牛肉 甜辣香', 73, 3, 681, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-1002/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-1002/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('meat-1003', '【天天吃货】肉粒 猪肉粒牛肉粒鸡肉粒 粒粒香', 73, 3, 456, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-1003/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-1003/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('meat-1004', '【天天吃货】肉松 猪肉牛肉鸡肉 早饭配菜儿童最爱', 73, 3, 531, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-1004/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-1004/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('meat-1005', '【天天吃货】腊肠 猪肉牛肉鸡肉 肉类最佳下饭菜', 73, 3, 1075, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-1005/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-1005/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('meat-1006', '【天天吃货】烤肠 猪肉牛肉鸡肉 肉类最佳零食', 73, 3, 634, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-1006/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-1006/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('meat-157', '新鲜黄瓜 农家自种', 157, 10, 3259, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-157/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-157/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-158', '新鲜芋头 农家有机芋头', 158, 10, 4263, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-158/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-158/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-159', '新鲜采摘玉米 浓香好吃', 159, 10, 3648, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-159/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-159/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-160', '顺丰闪电发货 新鲜自种南瓜', 160, 10, 5832, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-160/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-160/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-161', '台湾进口荸荠 香甜可口', 161, 10, 1849, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-161/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-161/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-162', '新鲜农家山药 有机山药', 162, 10, 1612, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-162/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-162/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-163', '新鲜农家秋葵 有机栽培', 163, 10, 1832, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-163/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-163/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-164', '新鲜红薯紫薯 有机农家自种', 164, 10, 1259, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-164/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-164/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-165', '新鲜土豆 农家自种', 165, 10, 956, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-165/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-165/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-166', '阳山水蜜桃 谁能多汁 无锡特产', 166, 10, 1652, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-166/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-166/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-167', '西瓜8424 本土好吃的瓜', 167, 10, 956, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-167/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-167/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-168', '新鲜农家苹果 有机栽培', 168, 10, 4832, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-168/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-168/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-169', '台湾进口凤梨 香甜可口', 169, 10, 1239, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-169/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-169/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-170', '台湾进口草莓 香甜可口', 170, 10, 1239, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-170/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-170/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-171', '新鲜农家葡萄 有机栽培', 171, 10, 2832, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-171/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-171/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-173', '顺丰闪电发货 新鲜牛排', 173, 10, 4832, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-173/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-173/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-174', '顺丰闪电发货 新鲜鸡肉鸡胸', 174, 10, 5332, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-174/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-174/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-175', '新鲜猪肉 冰箱家族最爱', 175, 10, 4693, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-175/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-175/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-176', '新鲜羊肉 无膻味', 176, 10, 3656, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-176/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-176/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-177', '鲜嫩猪蹄子蹄髈 好吃哟', 177, 10, 1956, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-177/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-177/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-178', '鲜嫩糖醋排骨 无锡特产', 178, 10, 1856, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-178/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-178/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('meat-72', '新鲜采摘的杨梅 非常好吃', 172, 10, 3656, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/meat-72/img1.png\"><img src=\"http://122.152.205.72:88/foodie/meat-72/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('nut-1001', '【天天吃货】进口美国松子 口味齐全', 104, 5, 359, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-1001/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-1001/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('nut-1002', '【天天吃货】农家锅巴 农家乐 有机菜', 104, 5, 369, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-1002/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-1002/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('nut-1003', '【天天吃货】进口碧根果 养生补脑最佳零食', 104, 5, 1038, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-1003/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-1003/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('nut-1004', '【天天吃货】进口核桃 养生补脑最佳零食', 104, 5, 751, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-1004/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-1004/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('nut-1005', '【天天吃货】野生开心果 养生补脑最佳零食', 104, 5, 953, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-1005/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-1005/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('nut-1006', '【天天吃货】野生腰果 养生补脑最佳零食', 104, 5, 560, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-1006/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-1006/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('nut-104', '进口坚果大杂烩 好吃又回味', 104, 5, 5252, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-104/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-104/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('nut-105', '美国进口香瓜子 年货必备', 105, 5, 1952, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-105/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-105/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('nut-106', '进口碧根果 美味实在下午茶', 106, 5, 551, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-106/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-106/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('nut-107', '巴西进口松子 年货必备', 107, 5, 3152, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-107/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-107/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('nut-108', '美国进口山核桃 年货必备', 108, 5, 1152, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-108/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-108/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('nut-109', '美国进口开心果 年货必备', 109, 5, 1152, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-109/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-109/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('nut-110', '进口腰果 美味实在下午茶', 110, 5, 552, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-110/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-110/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('nut-111', '网红锅巴 美味实在下午茶', 111, 5, 3252, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/nut-111/img1.png\"><img src=\"http://122.152.205.72:88/foodie/nut-111/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-1001', '【天天吃货】熟食龙虾虾尾 最棒下酒菜 聚会聚餐', 133, 8, 159, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-1001/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-1001/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('seafood-1002', '【天天吃货】盒装扇贝肉 海鲜最佳下酒菜', 133, 8, 147, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-1002/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-1002/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('seafood-1003', '【天天吃货】帝王蟹 餐桌霸气大菜 聚会有面子', 133, 8, 639, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-1003/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-1003/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('seafood-1004', '【天天吃货】澳洲大龙虾 餐桌霸气大菜 聚会有面子', 133, 8, 206, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-1004/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-1004/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('seafood-1005', '【天天吃货】精品海味 鱿鱼丝 美眉爱吃零食', 133, 8, 564, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-1005/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-1005/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('seafood-1006', '【天天吃货】精品海味 干虾仁 可生吃 美眉爱吃零食', 133, 8, 520, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-1006/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-1006/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('seafood-133', '超级美味海鲜帝王蟹 聚餐有面子必备', 133, 8, 6511, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-133/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-133/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-134', '超级美味海鲜澳洲大龙虾 聚餐有面子必备', 134, 8, 5511, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-134/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-134/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-135', '美味海鲜 美味鲍鱼 海货好吃海鲜', 135, 8, 8363, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-135/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-135/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-136', '美味海参 聚餐有面子', 136, 8, 1561, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-136/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-136/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-137', '美味海鲜 美味鱿鱼鱿鱼丝 海货好吃海鲜', 137, 8, 6363, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-137/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-137/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-138', '美味三文鱼 寿司 聚会必备', 138, 8, 3051, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-138/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-138/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-139', '美味海鲜 扇贝肉 聚会必备', 139, 8, 3251, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-139/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-139/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-140', '海鲜干贝 炒菜增味必备', 140, 8, 2511, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-140/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-140/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-141', '美味海苔 儿童还吃', 141, 8, 1551, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-141/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-141/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-142', '美味海鲜 干虾仁 炒菜必备海鲜', 142, 8, 3651, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-142/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-142/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('seafood-143', '美味海鱼干 家中囤货必备', 143, 8, 1051, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/seafood-143/img1.png\"><img src=\"http://122.152.205.72:88/foodie/seafood-143/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('snacks-100', '新鲜卤辣鸭脖 香甜可口', 100, 4, 2652, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-100/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-100/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('snacks-1001', '【天天吃货】武汉鸭脖 卤味齐全 香辣麻辣', 90, 4, 852, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-1001/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-1001/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('snacks-1002', '【天天吃货】武汉鸭胗 卤味齐全 香辣麻辣', 90, 4, 147, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-1002/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-1002/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('snacks-1003', '【天天吃货】武汉鸭翅 卤味齐全 香辣麻辣', 90, 4, 536, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-1003/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-1003/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('snacks-1004', '【天天吃货】豆腐干 卤味齐全 香辣麻辣', 90, 4, 631, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-1004/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-1004/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('snacks-1005', '【天天吃货】农家乐农家菜 香喷喷野生笋干', 90, 4, 366, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-1005/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-1005/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('snacks-1006', '【天天吃货】儿时记忆 辣条 香辣麻辣', 90, 4, 559, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-1006/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-1006/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('snacks-101', '新鲜卤味鸭锁骨 香甜可口', 101, 4, 2952, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-101/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-101/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('snacks-102', '新鲜鸭胗 香甜可口', 102, 4, 2752, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-102/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-102/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('snacks-103', '新鲜卤鸭翅 香甜可口', 103, 4, 2952, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-103/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-103/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('snacks-90', '新鲜卤辣香菇 香甜可口', 90, 4, 2652, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-90/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-90/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('snacks-92', '甜辣苏州有名豆腐干 好吃呦~', 92, 4, 3345, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-92/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-92/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('snacks-93', '儿时回味 儿时记忆辣条', 93, 4, 3345, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-93/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-93/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('snacks-94', '好吃香辣泡椒脆笋', 94, 4, 265, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-94/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-94/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('snacks-95', '农家有机笋干 香甜可口', 95, 4, 2752, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-95/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-95/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('snacks-97', '好吃香辣农家笋 有机食物香喷喷', 94, 4, 3265, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/snacks-97/img1.png\"><img src=\"http://122.152.205.72:88/foodie/snacks-97/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('suger-113', '儿童爱吃水果糖 无添加剂', 113, 6, 2276, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/suger-113/img1.png\"><img src=\"http://122.152.205.72:88/foodie/suger-113/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('suger-115', '酒味夹心糖 休闲食品', 115, 6, 2896, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/suger-115/img1.png\"><img src=\"http://122.152.205.72:88/foodie/suger-115/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('suger-116', '儿童爱吃奶糖 休闲食品', 116, 6, 2296, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/suger-116/img1.png\"><img src=\"http://122.152.205.72:88/foodie/suger-116/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('suger-117', '中式结婚喜糖 好彩头', 117, 6, 2676, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/suger-117/img1.png\"><img src=\"http://122.152.205.72:88/foodie/suger-117/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('suger-118', '儿时记忆麦芽糖 休闲食品', 118, 6, 2896, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/suger-118/img1.png\"><img src=\"http://122.152.205.72:88/foodie/suger-118/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('suger-119', '好吃零食话梅 休闲食品', 119, 6, 286, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/suger-119/img1.png\"><img src=\"http://122.152.205.72:88/foodie/suger-119/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('suger-121', '好吃零食草莓干 休闲食品', 121, 6, 2986, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/suger-121/img1.png\"><img src=\"http://122.152.205.72:88/foodie/suger-121/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('suger-124', '儿童爱吃山楂糕 无添加剂', 124, 6, 2276, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/suger-124/img1.png\"><img src=\"http://122.152.205.72:88/foodie/suger-124/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('tea-1001', '【天天吃货】美眉最爱奶茶 下午茶 零食休闲', 144, 9, 360, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-1001/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-1001/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('tea-1002', '【天天吃货】精品龙井茶 居家必备 喝茶最佳', 144, 9, 985, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-1002/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-1002/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('tea-1003', '【天天吃货】精品碧螺春 居家必备茶叶 喝茶最佳', 144, 9, 3100, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-1003/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-1003/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('tea-1004', '【天天吃货】精品胖大海 送人必备茶叶 喝茶最佳', 144, 9, 2003, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-1004/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-1004/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('tea-1005', '【天天吃货】精品柠檬片 美眉最爱 泡茶喝茶最佳', 144, 9, 56, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-1005/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-1005/img2.png\">', '2019-08-16 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('tea-1006', '【天天吃货】冬日必备红茶 养生必备 女女最爱', 144, 9, 1004, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-1006/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-1006/img2.png\">', '2019-09-09 14:45:34', '2019-09-09 14:45:38');
INSERT INTO `items` VALUES ('tea-144', '清爽可口蜜桃茶 夏天必备', 144, 9, 2191, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-144/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-144/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('tea-145', '养生碧螺春 春夏必备', 145, 9, 2363, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-145/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-145/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('tea-146', '养生必备柠檬片泡枸杞 清爽可口', 146, 9, 2931, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-146/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-146/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('tea-147', '清爽可口白茶 夏天必备', 147, 9, 3093, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-147/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-147/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('tea-148', '养生茶必喝红茶 秋冬必备', 148, 9, 2331, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-148/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-148/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('tea-149', '养生茶必喝绿茶 名目清爽', 149, 9, 2931, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-149/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-149/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('tea-150', '清爽可口铁观音 夏天必备', 150, 9, 2193, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-150/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-150/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('tea-151', '养生必备胖大海 清爽可口', 151, 9, 2131, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-151/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-151/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('tea-152', '养生茶白桃乌龙茶 春夏必备', 152, 9, 2331, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-152/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-152/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
INSERT INTO `items` VALUES ('tea-153', '美女最爱下午茶 奶茶泡泡更悠闲', 153, 9, 2931, 1, '<p>超级好吃、非常好吃</p><img src=\"http://122.152.205.72:88/foodie/tea-153/img1.png\"><img src=\"http://122.152.205.72:88/foodie/tea-153/img2.png\">', '2019-09-01 14:45:34', '2019-09-01 14:45:38');
COMMIT;

-- ----------------------------
-- Table structure for items_comments
-- ----------------------------
DROP TABLE IF EXISTS `items_comments`;
CREATE TABLE `items_comments` (
  `id` varchar(64) NOT NULL COMMENT 'id主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户id 用户名须脱敏',
  `item_id` varchar(64) NOT NULL COMMENT '商品id',
  `item_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `item_spec_id` varchar(64) DEFAULT NULL COMMENT '商品规格id 可为空',
  `spec_name` varchar(32) DEFAULT NULL COMMENT '规格名称 可为空',
  `comment_level` int(11) NOT NULL COMMENT '评价等级 1：好评 2：中评 3：差评',
  `content` varchar(128) NOT NULL COMMENT '评价内容',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品评价表 ';

-- ----------------------------
-- Records of items_comments
-- ----------------------------
BEGIN;
INSERT INTO `items_comments` VALUES ('1', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '草莓味', 1, '很棒', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('10', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '草莓味', 2, 'very good', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('11', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '香草味', 3, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('12', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '香草味', 1, '非常不错！~', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('13', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '香草味', 2, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('14', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '香草味', 2, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('15', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('16、', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '香草味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('17', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('18', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('19', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 2, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('190729AYHX8M55KP', '1908017YR51G1XWH', 'cake-1002', '【天天吃货】网红烘焙蛋糕 好吃的蛋糕', '4', '原味', 1, '哈哈哈', '2019-07-29 15:20:34', '2019-07-29 15:20:34');
INSERT INTO `items_comments` VALUES ('190729AYHX8M55KR', '1908017YR51G1XWH', 'cake-1006', '【天天吃货】机器猫最爱 铜锣烧 最美下午茶', 'cake-1006-spec-1', '草莓味', 2, '的地位', '2019-07-29 15:20:34', '2019-07-29 15:20:34');
INSERT INTO `items_comments` VALUES ('191222CGNKXTF428', '19120779W7TK6800', 'cake-1005', '草莓水果', 'cake-1005-spec-2', '草莓水果', 1, '123', '2019-12-22 17:35:59', '2019-12-22 17:35:59');
INSERT INTO `items_comments` VALUES ('191222CGNKY5PPX4', '19120779W7TK6800', 'cake-1005', '芒果口味', 'cake-1005-spec-3', '芒果口味', 2, '不好吃', '2019-12-22 17:35:59', '2019-12-22 17:35:59');
INSERT INTO `items_comments` VALUES ('2', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('20', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('21', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 2, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('22', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('3', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('31', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 2, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('4', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('5', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('6', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 2, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('7', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('8', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 3, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
INSERT INTO `items_comments` VALUES ('9', '1908017YR51G1XWH', 'cake-1001', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-1', '原味', 1, '非常好吃', '2019-07-22 09:55:05', '2019-07-22 09:55:09');
COMMIT;

-- ----------------------------
-- Table structure for items_img
-- ----------------------------
DROP TABLE IF EXISTS `items_img`;
CREATE TABLE `items_img` (
  `id` varchar(64) NOT NULL COMMENT '图片主键',
  `item_id` varchar(64) NOT NULL COMMENT '商品外键id 商品外键id',
  `url` varchar(128) NOT NULL COMMENT '图片地址 图片地址',
  `sort` int(11) NOT NULL COMMENT '顺序 图片顺序，从小到大',
  `is_main` int(11) NOT NULL COMMENT '是否主图 是否主图，1：是，0：否',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品图片 ';

-- ----------------------------
-- Records of items_img
-- ----------------------------
BEGIN;
INSERT INTO `items_img` VALUES ('1', 'cake-1001', 'http://122.152.205.72:88/foodie/cake-1001/img1.png', 0, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('2', 'cake-1001', 'http://122.152.205.72:88/foodie/cake-1001/img2.png', 1, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('3', 'cake-1001', 'http://122.152.205.72:88/foodie/cake-1001/img3.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('4', 'cake-1002', 'http://122.152.205.72:88/foodie/cake-1002/img1.png', 0, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('5', 'cake-1002', 'http://122.152.205.72:88/foodie/cake-1002/img2.png', 1, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('6', 'cake-1003', 'http://122.152.205.72:88/foodie/cake-1003/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('7', 'cake-1003', 'http://122.152.205.72:88/foodie/cake-1003/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1001-img-1', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1001-img-2', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1002-img-1', 'bingan-1002', 'http://122.152.205.72:88/foodie/bingan-1002/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1002-img-2', 'bingan-1002', 'http://122.152.205.72:88/foodie/bingan-1002/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1003-img-1', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1003-img-2', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1004-img-1', 'bingan-1004', 'http://122.152.205.72:88/foodie/bingan-1004/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1004-img-2', 'bingan-1004', 'http://122.152.205.72:88/foodie/bingan-1004/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1005-img-1', 'bingan-1005', 'http://122.152.205.72:88/foodie/bingan-1005/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1005-img-2', 'bingan-1005', 'http://122.152.205.72:88/foodie/bingan-1005/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1006-img-1', 'bingan-1006', 'http://122.152.205.72:88/foodie/bingan-1006/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('bingan-1006-img-2', 'bingan-1006', 'http://122.152.205.72:88/foodie/bingan-1006/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-1004-img-1', 'cake-1004', 'http://122.152.205.72:88/foodie/cake-1004/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-1004-img-2', 'cake-1004', 'http://122.152.205.72:88/foodie/cake-1004/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-1004-img-3', 'cake-1004', 'http://122.152.205.72:88/foodie/cake-1004/img3.png', 3, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-1005-img-1', 'cake-1005', 'http://122.152.205.72:88/foodie/cake-1005/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-1005-img-2', 'cake-1005', 'http://122.152.205.72:88/foodie/cake-1005/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-1006-img-1', 'cake-1006', 'http://122.152.205.72:88/foodie/cake-1006/img1.png', 1, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-1006-img-2', 'cake-1006', 'http://122.152.205.72:88/foodie/cake-1006/img2.png', 2, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-37-img-1', 'cake-37', 'http://122.152.205.72:88/foodie/cake-37/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-37-img-2', 'cake-37', 'http://122.152.205.72:88/foodie/cake-37/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-38-img-1', 'cake-38', 'http://122.152.205.72:88/foodie/cake-38/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-38-img-2', 'cake-38', 'http://122.152.205.72:88/foodie/cake-38/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-39-img-1', 'cake-39', 'http://122.152.205.72:88/foodie/cake-39/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-39-img-2', 'cake-39', 'http://122.152.205.72:88/foodie/cake-39/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-42-img-1', 'cake-42', 'http://122.152.205.72:88/foodie/cake-42/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-42-img-2', 'cake-42', 'http://122.152.205.72:88/foodie/cake-42/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-44-img-1', 'cake-44', 'http://122.152.205.72:88/foodie/cake-44/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-44-img-2', 'cake-44', 'http://122.152.205.72:88/foodie/cake-44/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-47-img-1', 'cake-47', 'http://122.152.205.72:88/foodie/cake-47/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-47-img-2', 'cake-47', 'http://122.152.205.72:88/foodie/cake-47/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-48-img-1', 'cake-48', 'http://122.152.205.72:88/foodie/cake-48/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cake-48-img-2', 'cake-48', 'http://122.152.205.72:88/foodie/cake-48/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1001-img-1', 'candy-1001', 'http://122.152.205.72:88/foodie/candy-1001/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1001-img-2', 'candy-1001', 'http://122.152.205.72:88/foodie/candy-1001/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1002-img-1', 'candy-1002', 'http://122.152.205.72:88/foodie/candy-1002/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1002-img-2', 'candy-1002', 'http://122.152.205.72:88/foodie/candy-1002/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1003-img-1', 'candy-1003', 'http://122.152.205.72:88/foodie/candy-1003/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1003-img-2', 'candy-1003', 'http://122.152.205.72:88/foodie/candy-1003/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1004-img-1', 'candy-1004', 'http://122.152.205.72:88/foodie/candy-1004/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1004-img-2', 'candy-1004', 'http://122.152.205.72:88/foodie/candy-1004/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1005-img-1', 'candy-1005', 'http://122.152.205.72:88/foodie/candy-1005/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1005-img-2', 'candy-1005', 'http://122.152.205.72:88/foodie/candy-1005/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1006-img-1', 'candy-1006', 'http://122.152.205.72:88/foodie/candy-1006/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('candy-1006-img-2', 'candy-1006', 'http://122.152.205.72:88/foodie/candy-1006/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1001-img-1', 'chocolate-1001', 'http://122.152.205.72:88/foodie/chocolate-1001/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1001-img-2', 'chocolate-1001', 'http://122.152.205.72:88/foodie/chocolate-1001/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1002-img-1', 'chocolate-1002', 'http://122.152.205.72:88/foodie/chocolate-1002/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1002-img-2', 'chocolate-1002', 'http://122.152.205.72:88/foodie/chocolate-1002/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1003-img-1', 'chocolate-1003', 'http://122.152.205.72:88/foodie/chocolate-1003/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1003-img-2', 'chocolate-1003', 'http://122.152.205.72:88/foodie/chocolate-1003/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1004-img-1', 'chocolate-1004', 'http://122.152.205.72:88/foodie/chocolate-1004/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1004-img-2', 'chocolate-1004', 'http://122.152.205.72:88/foodie/chocolate-1004/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1005-img-1', 'chocolate-1005', 'http://122.152.205.72:88/foodie/chocolate-1005/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1005-img-2', 'chocolate-1005', 'http://122.152.205.72:88/foodie/chocolate-1005/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1006-img-1', 'chocolate-1006', 'http://122.152.205.72:88/foodie/chocolate-1006/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-1006-img-2', 'chocolate-1006', 'http://122.152.205.72:88/foodie/chocolate-1006/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-125-img-1', 'chocolate-125', 'http://122.152.205.72:88/foodie/chocolate-125/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-125-img-2', 'chocolate-125', 'http://122.152.205.72:88/foodie/chocolate-125/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-127-img-1', 'chocolate-127', 'http://122.152.205.72:88/foodie/chocolate-127/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-127-img-2', 'chocolate-127', 'http://122.152.205.72:88/foodie/chocolate-127/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-128-img-1', 'chocolate-128', 'http://122.152.205.72:88/foodie/chocolate-128/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-128-img-2', 'chocolate-128', 'http://122.152.205.72:88/foodie/chocolate-128/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-129-img-1', 'chocolate-129', 'http://122.152.205.72:88/foodie/chocolate-129/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-129-img-2', 'chocolate-129', 'http://122.152.205.72:88/foodie/chocolate-129/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-130-img-1', 'chocolate-130', 'http://122.152.205.72:88/foodie/chocolate-130/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-130-img-2', 'chocolate-130', 'http://122.152.205.72:88/foodie/chocolate-130/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-131-img-1', 'chocolate-131', 'http://122.152.205.72:88/foodie/chocolate-131/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-131-img-2', 'chocolate-131', 'http://122.152.205.72:88/foodie/chocolate-131/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-132-img-1', 'chocolate-132', 'http://122.152.205.72:88/foodie/chocolate-132/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('chocolate-132-img-2', 'chocolate-132', 'http://122.152.205.72:88/foodie/chocolate-132/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-51-img-1', 'cookies-51', 'http://122.152.205.72:88/foodie/cookies-51/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-51-img-2', 'cookies-51', 'http://122.152.205.72:88/foodie/cookies-51/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-52-img-1', 'cookies-52', 'http://122.152.205.72:88/foodie/cookies-52/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-52-img-2', 'cookies-52', 'http://122.152.205.72:88/foodie/cookies-52/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-53-img-1', 'cookies-53', 'http://122.152.205.72:88/foodie/cookies-53/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-53-img-2', 'cookies-53', 'http://122.152.205.72:88/foodie/cookies-53/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-54-img-1', 'cookies-54', 'http://122.152.205.72:88/foodie/cookies-54/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-54-img-2', 'cookies-54', 'http://122.152.205.72:88/foodie/cookies-54/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-55-img-1', 'cookies-55', 'http://122.152.205.72:88/foodie/cookies-55/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-55-img-2', 'cookies-55', 'http://122.152.205.72:88/foodie/cookies-55/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-56-img-1', 'cookies-56', 'http://122.152.205.72:88/foodie/cookies-56/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-56-img-2', 'cookies-56', 'http://122.152.205.72:88/foodie/cookies-56/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-57-img-1', 'cookies-57', 'http://122.152.205.72:88/foodie/cookies-57/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-57-img-2', 'cookies-57', 'http://122.152.205.72:88/foodie/cookies-57/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-58-img-1', 'cookies-58', 'http://122.152.205.72:88/foodie/cookies-58/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-58-img-2', 'cookies-58', 'http://122.152.205.72:88/foodie/cookies-58/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-59-img-1', 'cookies-59', 'http://122.152.205.72:88/foodie/cookies-59/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-59-img-2', 'cookies-59', 'http://122.152.205.72:88/foodie/cookies-59/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-60-img-1', 'cookies-60', 'http://122.152.205.72:88/foodie/cookies-60/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-60-img-2', 'cookies-60', 'http://122.152.205.72:88/foodie/cookies-60/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-62-img-1', 'cookies-62', 'http://122.152.205.72:88/foodie/cookies-62/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-62-img-2', 'cookies-62', 'http://122.152.205.72:88/foodie/cookies-62/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-63-img-1', 'cookies-63', 'http://122.152.205.72:88/foodie/cookies-63/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-63-img-2', 'cookies-63', 'http://122.152.205.72:88/foodie/cookies-63/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-64-img-1', 'cookies-64', 'http://122.152.205.72:88/foodie/cookies-64/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-64-img-2', 'cookies-64', 'http://122.152.205.72:88/foodie/cookies-64/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-65-img-1', 'cookies-65', 'http://122.152.205.72:88/foodie/cookies-65/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-65-img-2', 'cookies-65', 'http://122.152.205.72:88/foodie/cookies-65/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-68-img-1', 'cookies-68', 'http://122.152.205.72:88/foodie/cookies-68/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('cookies-68-img-2', 'cookies-68', 'http://122.152.205.72:88/foodie/cookies-68/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1001-img-1', 'food-1001', 'http://122.152.205.72:88/foodie/food-1001/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1001-img-2', 'food-1001', 'http://122.152.205.72:88/foodie/food-1001/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1002-img-1', 'food-1002', 'http://122.152.205.72:88/foodie/food-1002/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1002-img-2', 'food-1002', 'http://122.152.205.72:88/foodie/food-1002/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1003-img-1', 'food-1003', 'http://122.152.205.72:88/foodie/food-1003/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1003-img-2', 'food-1003', 'http://122.152.205.72:88/foodie/food-1003/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1004-img-1', 'food-1004', 'http://122.152.205.72:88/foodie/food-1004/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1004-img-2', 'food-1004', 'http://122.152.205.72:88/foodie/food-1004/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1005-img-1', 'food-1005', 'http://122.152.205.72:88/foodie/food-1005/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1005-img-2', 'food-1005', 'http://122.152.205.72:88/foodie/food-1005/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1006-img-1', 'food-1006', 'http://122.152.205.72:88/foodie/food-1006/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-1006-img-2', 'food-1006', 'http://122.152.205.72:88/foodie/food-1006/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-74-img-1', 'food-74', 'http://122.152.205.72:88/foodie/food-74/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-74-img-2', 'food-74', 'http://122.152.205.72:88/foodie/food-74/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-75-img-1', 'food-75', 'http://122.152.205.72:88/foodie/food-75/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-75-img-2', 'food-75', 'http://122.152.205.72:88/foodie/food-75/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-76-img-1', 'food-76', 'http://122.152.205.72:88/foodie/food-76/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-76-img-2', 'food-76', 'http://122.152.205.72:88/foodie/food-76/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-761-img-1', 'food-761', 'http://122.152.205.72:88/foodie/food-761/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-761-img-2', 'food-761', 'http://122.152.205.72:88/foodie/food-761/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-77-img-1', 'food-77', 'http://122.152.205.72:88/foodie/food-77/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-77-img-2', 'food-77', 'http://122.152.205.72:88/foodie/food-77/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-78-img-1', 'food-78', 'http://122.152.205.72:88/foodie/food-78/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-78-img-2', 'food-78', 'http://122.152.205.72:88/foodie/food-78/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-80-img-1', 'food-80', 'http://122.152.205.72:88/foodie/food-80/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-80-img-2', 'food-80', 'http://122.152.205.72:88/foodie/food-80/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-81-img-1', 'food-81', 'http://122.152.205.72:88/foodie/food-81/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-81-img-2', 'food-81', 'http://122.152.205.72:88/foodie/food-81/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-82-img-1', 'food-82', 'http://122.152.205.72:88/foodie/food-82/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-82-img-2', 'food-82', 'http://122.152.205.72:88/foodie/food-82/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-83-img-1', 'food-83', 'http://122.152.205.72:88/foodie/food-83/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-83-img-2', 'food-83', 'http://122.152.205.72:88/foodie/food-83/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-84-img-1', 'food-84', 'http://122.152.205.72:88/foodie/food-84/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-84-img-2', 'food-84', 'http://122.152.205.72:88/foodie/food-84/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-85-img-1', 'food-85', 'http://122.152.205.72:88/foodie/food-85/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-85-img-2', 'food-85', 'http://122.152.205.72:88/foodie/food-85/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-86-img-1', 'food-86', 'http://122.152.205.72:88/foodie/food-86/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-86-img-2', 'food-86', 'http://122.152.205.72:88/foodie/food-86/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-87-img-1', 'food-87', 'http://122.152.205.72:88/foodie/food-87/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-87-img-2', 'food-87', 'http://122.152.205.72:88/foodie/food-87/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-88-img-1', 'food-88', 'http://122.152.205.72:88/foodie/food-88/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-88-img-2', 'food-88', 'http://122.152.205.72:88/foodie/food-88/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-89-img-1', 'food-89', 'http://122.152.205.72:88/foodie/food-89/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('food-89-img-2', 'food-89', 'http://122.152.205.72:88/foodie/food-89/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1001-img-1', 'meat-1001', 'http://122.152.205.72:88/foodie/meat-1001/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1001-img-2', 'meat-1001', 'http://122.152.205.72:88/foodie/meat-1001/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1002-img-1', 'meat-1002', 'http://122.152.205.72:88/foodie/meat-1002/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1002-img-2', 'meat-1002', 'http://122.152.205.72:88/foodie/meat-1002/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1003-img-1', 'meat-1003', 'http://122.152.205.72:88/foodie/meat-1003/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1003-img-2', 'meat-1003', 'http://122.152.205.72:88/foodie/meat-1003/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1004-img-1', 'meat-1004', 'http://122.152.205.72:88/foodie/meat-1004/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1004-img-2', 'meat-1004', 'http://122.152.205.72:88/foodie/meat-1004/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1005-img-1', 'meat-1005', 'http://122.152.205.72:88/foodie/meat-1005/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1005-img-2', 'meat-1005', 'http://122.152.205.72:88/foodie/meat-1005/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1006-img-1', 'meat-1006', 'http://122.152.205.72:88/foodie/meat-1006/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-1006-img-2', 'meat-1006', 'http://122.152.205.72:88/foodie/meat-1006/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-157-img-1', 'meat-157', 'http://122.152.205.72:88/foodie/meat-157/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-157-img-2', 'meat-157', 'http://122.152.205.72:88/foodie/meat-157/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-158-img-1', 'meat-158', 'http://122.152.205.72:88/foodie/meat-158/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-158-img-2', 'meat-158', 'http://122.152.205.72:88/foodie/meat-158/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-159-img-1', 'meat-159', 'http://122.152.205.72:88/foodie/meat-159/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-159-img-2', 'meat-159', 'http://122.152.205.72:88/foodie/meat-159/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-160-img-1', 'meat-160', 'http://122.152.205.72:88/foodie/meat-160/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-160-img-2', 'meat-160', 'http://122.152.205.72:88/foodie/meat-160/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-161-img-1', 'meat-161', 'http://122.152.205.72:88/foodie/meat-161/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-161-img-2', 'meat-161', 'http://122.152.205.72:88/foodie/meat-161/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-162-img-1', 'meat-162', 'http://122.152.205.72:88/foodie/meat-162/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-162-img-2', 'meat-162', 'http://122.152.205.72:88/foodie/meat-162/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-163-img-1', 'meat-163', 'http://122.152.205.72:88/foodie/meat-163/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-163-img-2', 'meat-163', 'http://122.152.205.72:88/foodie/meat-163/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-164-img-1', 'meat-164', 'http://122.152.205.72:88/foodie/meat-164/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-164-img-2', 'meat-164', 'http://122.152.205.72:88/foodie/meat-164/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-165-img-1', 'meat-165', 'http://122.152.205.72:88/foodie/meat-165/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-165-img-2', 'meat-165', 'http://122.152.205.72:88/foodie/meat-165/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-166-img-1', 'meat-166', 'http://122.152.205.72:88/foodie/meat-166/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-166-img-2', 'meat-166', 'http://122.152.205.72:88/foodie/meat-166/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-167-img-1', 'meat-167', 'http://122.152.205.72:88/foodie/meat-167/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-167-img-2', 'meat-167', 'http://122.152.205.72:88/foodie/meat-167/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-168-img-1', 'meat-168', 'http://122.152.205.72:88/foodie/meat-168/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-168-img-2', 'meat-168', 'http://122.152.205.72:88/foodie/meat-168/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-169-img-1', 'meat-169', 'http://122.152.205.72:88/foodie/meat-169/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-169-img-2', 'meat-169', 'http://122.152.205.72:88/foodie/meat-169/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-170-img-1', 'meat-170', 'http://122.152.205.72:88/foodie/meat-170/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-170-img-2', 'meat-170', 'http://122.152.205.72:88/foodie/meat-170/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-171-img-1', 'meat-171', 'http://122.152.205.72:88/foodie/meat-171/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-171-img-2', 'meat-171', 'http://122.152.205.72:88/foodie/meat-171/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-173-img-1', 'meat-173', 'http://122.152.205.72:88/foodie/meat-173/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-173-img-2', 'meat-173', 'http://122.152.205.72:88/foodie/meat-173/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-174-img-1', 'meat-174', 'http://122.152.205.72:88/foodie/meat-174/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-174-img-2', 'meat-174', 'http://122.152.205.72:88/foodie/meat-174/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-175-img-1', 'meat-175', 'http://122.152.205.72:88/foodie/meat-175/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-175-img-2', 'meat-175', 'http://122.152.205.72:88/foodie/meat-175/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-176-img-1', 'meat-176', 'http://122.152.205.72:88/foodie/meat-176/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-176-img-2', 'meat-176', 'http://122.152.205.72:88/foodie/meat-176/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-177-img-1', 'meat-177', 'http://122.152.205.72:88/foodie/meat-177/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-177-img-2', 'meat-177', 'http://122.152.205.72:88/foodie/meat-177/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-178-img-1', 'meat-178', 'http://122.152.205.72:88/foodie/meat-178/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-178-img-2', 'meat-178', 'http://122.152.205.72:88/foodie/meat-178/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-72-img-1', 'meat-72', 'http://122.152.205.72:88/foodie/meat-72/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('meat-72-img-2', 'meat-72', 'http://122.152.205.72:88/foodie/meat-72/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1001-img-1', 'nut-1001', 'http://122.152.205.72:88/foodie/nut-1001/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1001-img-2', 'nut-1001', 'http://122.152.205.72:88/foodie/nut-1001/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1002-img-1', 'nut-1002', 'http://122.152.205.72:88/foodie/nut-1002/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1002-img-2', 'nut-1002', 'http://122.152.205.72:88/foodie/nut-1002/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1003-img-1', 'nut-1003', 'http://122.152.205.72:88/foodie/nut-1003/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1003-img-2', 'nut-1003', 'http://122.152.205.72:88/foodie/nut-1003/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1004-img-1', 'nut-1004', 'http://122.152.205.72:88/foodie/nut-1004/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1004-img-2', 'nut-1004', 'http://122.152.205.72:88/foodie/nut-1004/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1005-img-1', 'nut-1005', 'http://122.152.205.72:88/foodie/nut-1005/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1005-img-2', 'nut-1005', 'http://122.152.205.72:88/foodie/nut-1005/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1006-img-1', 'nut-1006', 'http://122.152.205.72:88/foodie/nut-1006/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-1006-img-2', 'nut-1006', 'http://122.152.205.72:88/foodie/nut-1006/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-104-img-1', 'nut-104', 'http://122.152.205.72:88/foodie/nut-104/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-104-img-2', 'nut-104', 'http://122.152.205.72:88/foodie/nut-104/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-105-img-1', 'nut-105', 'http://122.152.205.72:88/foodie/nut-105/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-105-img-2', 'nut-105', 'http://122.152.205.72:88/foodie/nut-105/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-106-img-1', 'nut-106', 'http://122.152.205.72:88/foodie/nut-106/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-106-img-2', 'nut-106', 'http://122.152.205.72:88/foodie/nut-106/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-107-img-1', 'nut-107', 'http://122.152.205.72:88/foodie/nut-107/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-107-img-2', 'nut-107', 'http://122.152.205.72:88/foodie/nut-107/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-108-img-1', 'nut-108', 'http://122.152.205.72:88/foodie/nut-108/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-108-img-2', 'nut-108', 'http://122.152.205.72:88/foodie/nut-108/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-109-img-1', 'nut-109', 'http://122.152.205.72:88/foodie/nut-109/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-109-img-2', 'nut-109', 'http://122.152.205.72:88/foodie/nut-109/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-110-img-1', 'nut-110', 'http://122.152.205.72:88/foodie/nut-110/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-110-img-2', 'nut-110', 'http://122.152.205.72:88/foodie/nut-110/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-111-img-1', 'nut-111', 'http://122.152.205.72:88/foodie/nut-111/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('nut-111-img-2', 'nut-111', 'http://122.152.205.72:88/foodie/nut-111/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1001-img-1', 'seafood-1001', 'http://122.152.205.72:88/foodie/seafood-1001/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1001-img-2', 'seafood-1001', 'http://122.152.205.72:88/foodie/seafood-1001/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1002-img-1', 'seafood-1002', 'http://122.152.205.72:88/foodie/seafood-1002/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1002-img-2', 'seafood-1002', 'http://122.152.205.72:88/foodie/seafood-1002/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1003-img-1', 'seafood-1003', 'http://122.152.205.72:88/foodie/seafood-1003/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1003-img-2', 'seafood-1003', 'http://122.152.205.72:88/foodie/seafood-1003/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1004-img-1', 'seafood-1004', 'http://122.152.205.72:88/foodie/seafood-1004/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1004-img-2', 'seafood-1004', 'http://122.152.205.72:88/foodie/seafood-1004/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1005-img-1', 'seafood-1005', 'http://122.152.205.72:88/foodie/seafood-1005/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1005-img-2', 'seafood-1005', 'http://122.152.205.72:88/foodie/seafood-1005/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1006-img-1', 'seafood-1006', 'http://122.152.205.72:88/foodie/seafood-1006/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-1006-img-2', 'seafood-1006', 'http://122.152.205.72:88/foodie/seafood-1006/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-133-img-1', 'seafood-133', 'http://122.152.205.72:88/foodie/seafood-133/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-133-img-2', 'seafood-133', 'http://122.152.205.72:88/foodie/seafood-133/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-134-img-1', 'seafood-134', 'http://122.152.205.72:88/foodie/seafood-134/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-134-img-2', 'seafood-134', 'http://122.152.205.72:88/foodie/seafood-134/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-135-img-1', 'seafood-135', 'http://122.152.205.72:88/foodie/seafood-135/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-135-img-2', 'seafood-135', 'http://122.152.205.72:88/foodie/seafood-135/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-136-img-1', 'seafood-136', 'http://122.152.205.72:88/foodie/seafood-136/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-136-img-2', 'seafood-136', 'http://122.152.205.72:88/foodie/seafood-136/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-137-img-1', 'seafood-137', 'http://122.152.205.72:88/foodie/seafood-137/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-137-img-2', 'seafood-137', 'http://122.152.205.72:88/foodie/seafood-137/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-138-img-1', 'seafood-138', 'http://122.152.205.72:88/foodie/seafood-138/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-138-img-2', 'seafood-138', 'http://122.152.205.72:88/foodie/seafood-138/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-139-img-1', 'seafood-139', 'http://122.152.205.72:88/foodie/seafood-139/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-139-img-2', 'seafood-139', 'http://122.152.205.72:88/foodie/seafood-139/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-140-img-1', 'seafood-140', 'http://122.152.205.72:88/foodie/seafood-140/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-140-img-2', 'seafood-140', 'http://122.152.205.72:88/foodie/seafood-140/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-141-img-1', 'seafood-141', 'http://122.152.205.72:88/foodie/seafood-141/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-141-img-2', 'seafood-141', 'http://122.152.205.72:88/foodie/seafood-141/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-142-img-1', 'seafood-142', 'http://122.152.205.72:88/foodie/seafood-142/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-142-img-2', 'seafood-142', 'http://122.152.205.72:88/foodie/seafood-142/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-143-img-1', 'seafood-143', 'http://122.152.205.72:88/foodie/seafood-143/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('seafood-143-img-2', 'seafood-143', 'http://122.152.205.72:88/foodie/seafood-143/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-100-img-1', 'snacks-100', 'http://122.152.205.72:88/foodie/snacks-100/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-100-img-2', 'snacks-100', 'http://122.152.205.72:88/foodie/snacks-100/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1001-img-1', 'snacks-1001', 'http://122.152.205.72:88/foodie/snacks-1001/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1001-img-2', 'snacks-1001', 'http://122.152.205.72:88/foodie/snacks-1001/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1002-img-1', 'snacks-1002', 'http://122.152.205.72:88/foodie/snacks-1002/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1002-img-2', 'snacks-1002', 'http://122.152.205.72:88/foodie/snacks-1002/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1003-img-1', 'snacks-1003', 'http://122.152.205.72:88/foodie/snacks-1003/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1003-img-2', 'snacks-1003', 'http://122.152.205.72:88/foodie/snacks-1003/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1004-img-1', 'snacks-1004', 'http://122.152.205.72:88/foodie/snacks-1004/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1004-img-2', 'snacks-1004', 'http://122.152.205.72:88/foodie/snacks-1004/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1005-img-1', 'snacks-1005', 'http://122.152.205.72:88/foodie/snacks-1005/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1005-img-2', 'snacks-1005', 'http://122.152.205.72:88/foodie/snacks-1005/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1006-img-1', 'snacks-1006', 'http://122.152.205.72:88/foodie/snacks-1006/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-1006-img-2', 'snacks-1006', 'http://122.152.205.72:88/foodie/snacks-1006/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-101-img-1', 'snacks-101', 'http://122.152.205.72:88/foodie/snacks-101/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-101-img-2', 'snacks-101', 'http://122.152.205.72:88/foodie/snacks-101/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-102-img-1', 'snacks-102', 'http://122.152.205.72:88/foodie/snacks-102/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-102-img-2', 'snacks-102', 'http://122.152.205.72:88/foodie/snacks-102/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-103-img-1', 'snacks-103', 'http://122.152.205.72:88/foodie/snacks-103/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-103-img-2', 'snacks-103', 'http://122.152.205.72:88/foodie/snacks-103/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-90-img-1', 'snacks-90', 'http://122.152.205.72:88/foodie/snacks-90/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-90-img-2', 'snacks-90', 'http://122.152.205.72:88/foodie/snacks-90/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-92-img-1', 'snacks-92', 'http://122.152.205.72:88/foodie/snacks-92/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-92-img-2', 'snacks-92', 'http://122.152.205.72:88/foodie/snacks-92/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-93-img-1', 'snacks-93', 'http://122.152.205.72:88/foodie/snacks-93/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-93-img-2', 'snacks-93', 'http://122.152.205.72:88/foodie/snacks-93/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-94-img-1', 'snacks-94', 'http://122.152.205.72:88/foodie/snacks-94/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-94-img-2', 'snacks-94', 'http://122.152.205.72:88/foodie/snacks-94/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-95-img-1', 'snacks-95', 'http://122.152.205.72:88/foodie/snacks-95/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-95-img-2', 'snacks-95', 'http://122.152.205.72:88/foodie/snacks-95/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-97-img-1', 'snacks-97', 'http://122.152.205.72:88/foodie/snacks-97/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('snacks-97-img-2', 'snacks-97', 'http://122.152.205.72:88/foodie/snacks-97/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-113-img-1', 'suger-113', 'http://122.152.205.72:88/foodie/suger-113/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-113-img-2', 'suger-113', 'http://122.152.205.72:88/foodie/suger-113/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-115-img-1', 'suger-115', 'http://122.152.205.72:88/foodie/suger-115/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-115-img-2', 'suger-115', 'http://122.152.205.72:88/foodie/suger-115/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-116-img-1', 'suger-116', 'http://122.152.205.72:88/foodie/suger-116/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-116-img-2', 'suger-116', 'http://122.152.205.72:88/foodie/suger-116/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-117-img-1', 'suger-117', 'http://122.152.205.72:88/foodie/suger-117/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-117-img-2', 'suger-117', 'http://122.152.205.72:88/foodie/suger-117/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-118-img-1', 'suger-118', 'http://122.152.205.72:88/foodie/suger-118/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-118-img-2', 'suger-118', 'http://122.152.205.72:88/foodie/suger-118/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-119-img-1', 'suger-119', 'http://122.152.205.72:88/foodie/suger-119/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-119-img-2', 'suger-119', 'http://122.152.205.72:88/foodie/suger-119/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-121-img-1', 'suger-121', 'http://122.152.205.72:88/foodie/suger-121/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-121-img-2', 'suger-121', 'http://122.152.205.72:88/foodie/suger-121/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-124-img-1', 'suger-124', 'http://122.152.205.72:88/foodie/suger-124/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('suger-124-img-2', 'suger-124', 'http://122.152.205.72:88/foodie/suger-124/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1001-img-1', 'tea-1001', 'http://122.152.205.72:88/foodie/tea-1001/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1001-img-2', 'tea-1001', 'http://122.152.205.72:88/foodie/tea-1001/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1002-img-1', 'tea-1002', 'http://122.152.205.72:88/foodie/tea-1002/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1002-img-2', 'tea-1002', 'http://122.152.205.72:88/foodie/tea-1002/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1003-img-1', 'tea-1003', 'http://122.152.205.72:88/foodie/tea-1003/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1003-img-2', 'tea-1003', 'http://122.152.205.72:88/foodie/tea-1003/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1004-img-1', 'tea-1004', 'http://122.152.205.72:88/foodie/tea-1004/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1004-img-2', 'tea-1004', 'http://122.152.205.72:88/foodie/tea-1004/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1005-img-1', 'tea-1005', 'http://122.152.205.72:88/foodie/tea-1005/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1005-img-2', 'tea-1005', 'http://122.152.205.72:88/foodie/tea-1005/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1006-img-1', 'tea-1006', 'http://122.152.205.72:88/foodie/tea-1006/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-1006-img-2', 'tea-1006', 'http://122.152.205.72:88/foodie/tea-1006/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-144-img-1', 'tea-144', 'http://122.152.205.72:88/foodie/tea-144/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-144-img-2', 'tea-144', 'http://122.152.205.72:88/foodie/tea-144/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-145-img-1', 'tea-145', 'http://122.152.205.72:88/foodie/tea-145/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-145-img-2', 'tea-145', 'http://122.152.205.72:88/foodie/tea-145/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-146-img-1', 'tea-146', 'http://122.152.205.72:88/foodie/tea-146/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-146-img-2', 'tea-146', 'http://122.152.205.72:88/foodie/tea-146/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-147-img-1', 'tea-147', 'http://122.152.205.72:88/foodie/tea-147/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-147-img-2', 'tea-147', 'http://122.152.205.72:88/foodie/tea-147/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-148-img-1', 'tea-148', 'http://122.152.205.72:88/foodie/tea-148/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-148-img-2', 'tea-148', 'http://122.152.205.72:88/foodie/tea-148/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-149-img-1', 'tea-149', 'http://122.152.205.72:88/foodie/tea-149/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-149-img-2', 'tea-149', 'http://122.152.205.72:88/foodie/tea-149/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-150-img-1', 'tea-150', 'http://122.152.205.72:88/foodie/tea-150/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-150-img-2', 'tea-150', 'http://122.152.205.72:88/foodie/tea-150/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-151-img-1', 'tea-151', 'http://122.152.205.72:88/foodie/tea-151/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-151-img-2', 'tea-151', 'http://122.152.205.72:88/foodie/tea-151/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-152-img-1', 'tea-152', 'http://122.152.205.72:88/foodie/tea-152/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-152-img-2', 'tea-152', 'http://122.152.205.72:88/foodie/tea-152/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-153-img-1', 'tea-153', 'http://122.152.205.72:88/foodie/tea-153/img1.png', 1, 1, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
INSERT INTO `items_img` VALUES ('tea-153-img-2', 'tea-153', 'http://122.152.205.72:88/foodie/tea-153/img2.png', 2, 0, '2019-07-01 14:46:55', '2019-07-01 14:47:02');
COMMIT;

-- ----------------------------
-- Table structure for items_param
-- ----------------------------
DROP TABLE IF EXISTS `items_param`;
CREATE TABLE `items_param` (
  `id` varchar(64) NOT NULL COMMENT '商品参数id',
  `item_id` varchar(32) NOT NULL COMMENT '商品外键id',
  `produc_place` varchar(32) NOT NULL COMMENT '产地 产地，例：中国江苏',
  `foot_period` varchar(32) NOT NULL COMMENT '保质期 保质期，例：180天',
  `brand` varchar(32) NOT NULL COMMENT '品牌名 品牌名，例：三只大灰狼',
  `factory_name` varchar(32) NOT NULL COMMENT '生产厂名 生产厂名，例：大灰狼工厂',
  `factory_address` varchar(32) NOT NULL COMMENT '生产厂址 生产厂址，例：大灰狼生产基地',
  `packaging_method` varchar(32) NOT NULL COMMENT '包装方式 包装方式，例：袋装',
  `weight` varchar(32) NOT NULL COMMENT '规格重量 规格重量，例：35g',
  `storage_method` varchar(32) NOT NULL COMMENT '存储方法 存储方法，例：常温5~25°',
  `eat_method` varchar(32) NOT NULL COMMENT '食用方式 食用方式，例：开袋即食',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `product_place` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品参数 ';

-- ----------------------------
-- Records of items_param
-- ----------------------------
BEGIN;
INSERT INTO `items_param` VALUES ('1', 'cake-1001', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('2', 'cake-1002', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('3', 'cake-1003', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('bingan-1001-param', 'bingan-1001', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('bingan-1002-param', 'bingan-1002', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('bingan-1003-param', 'bingan-1003', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('bingan-1004-param', 'bingan-1004', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('bingan-1005-param', 'bingan-1005', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('bingan-1006-param', 'bingan-1006', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cake-1004-param', 'cake-1004', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cake-1005-param', 'cake-1005', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cake-1006-param', 'cake-1006', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cake-37-param', 'cake-37', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cake-38-param', 'cake-38', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cake-39-param', 'cake-39', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cake-42-param', 'cake-42', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cake-44-param', 'cake-44', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cake-47-param', 'cake-47', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cake-48-param', 'cake-48', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('candy-1001-param', 'candy-1001', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('candy-1002-param', 'candy-1002', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('candy-1003-param', 'candy-1003', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('candy-1004-param', 'candy-1004', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('candy-1005-param', 'candy-1005', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('candy-1006-param', 'candy-1006', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-1001-param', 'chocolate-1001', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-1002-param', 'chocolate-1002', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-1003-param', 'chocolate-1003', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-1004-param', 'chocolate-1004', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-1005-param', 'chocolate-1005', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-1006-param', 'chocolate-1006', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-125-param', 'chocolate-125', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-127-param', 'chocolate-127', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-128-param', 'chocolate-128', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-129-param', 'chocolate-129', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-130-param', 'chocolate-130', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-131-param', 'chocolate-131', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('chocolate-132-param', 'chocolate-132', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-51-param', 'cookies-51', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-52-param', 'cookies-52', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-53-param', 'cookies-53', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-54-param', 'cookies-54', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-55-param', 'cookies-55', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-56-param', 'cookies-56', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-57-param', 'cookies-57', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-58-param', 'cookies-58', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-59-param', 'cookies-59', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-60-param', 'cookies-60', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-62-param', 'cookies-62', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-63-param', 'cookies-63', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-64-param', 'cookies-64', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-65-param', 'cookies-65', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('cookies-68-param', 'cookies-68', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-1001-param', 'food-1001', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-1002-param', 'food-1002', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-1003-param', 'food-1003', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-1004-param', 'food-1004', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-1005-param', 'food-1005', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-1006-param', 'food-1006', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-74-param', 'food-74', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-75-param', 'food-75', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-76-param', 'food-76', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-761-param', 'food-761', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-77-param', 'food-77', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-78-param', 'food-78', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-80-param', 'food-80', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-81-param', 'food-81', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-82-param', 'food-82', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-83-param', 'food-83', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-84-param', 'food-84', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-85-param', 'food-85', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-86-param', 'food-86', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-87-param', 'food-87', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-88-param', 'food-88', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('food-89-param', 'food-89', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-1001-param', 'meat-1001', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-1002-param', 'meat-1002', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-1003-param', 'meat-1003', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-1004-param', 'meat-1004', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-1005-param', 'meat-1005', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-1006-param', 'meat-1006', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-157-param', 'meat-157', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-158-param', 'meat-158', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-159-param', 'meat-159', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-160-param', 'meat-160', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-161-param', 'meat-161', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-162-param', 'meat-162', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-163-param', 'meat-163', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-164-param', 'meat-164', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-165-param', 'meat-165', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-166-param', 'meat-166', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-167-param', 'meat-167', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-168-param', 'meat-168', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-169-param', 'meat-169', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-170-param', 'meat-170', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-171-param', 'meat-171', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-173-param', 'meat-173', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-174-param', 'meat-174', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-175-param', 'meat-175', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-176-param', 'meat-176', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-177-param', 'meat-177', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-178-param', 'meat-178', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('meat-72-param', 'meat-72', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-1001-param', 'nut-1001', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-1002-param', 'nut-1002', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-1003-param', 'nut-1003', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-1004-param', 'nut-1004', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-1005-param', 'nut-1005', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-1006-param', 'nut-1006', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-104-param', 'nut-104', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-105-param', 'nut-105', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-106-param', 'nut-106', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-107-param', 'nut-107', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-108-param', 'nut-108', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-109-param', 'nut-109', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-110-param', 'nut-110', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('nut-111-param', 'nut-111', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-1001-param', 'seafood-1001', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-1002-param', 'seafood-1002', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-1003-param', 'seafood-1003', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-1004-param', 'seafood-1004', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-1005-param', 'seafood-1005', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-1006-param', 'seafood-1006', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-133-param', 'seafood-133', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-134-param', 'seafood-134', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-135-param', 'seafood-135', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-136-param', 'seafood-136', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-137-param', 'seafood-137', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-138-param', 'seafood-138', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-139-param', 'seafood-139', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-140-param', 'seafood-140', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-141-param', 'seafood-141', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-142-param', 'seafood-142', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('seafood-143-param', 'seafood-143', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-100-param', 'snacks-100', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-1001-param', 'snacks-1001', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-1002-param', 'snacks-1002', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-1003-param', 'snacks-1003', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-1004-param', 'snacks-1004', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-1005-param', 'snacks-1005', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-1006-param', 'snacks-1006', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-101-param', 'snacks-101', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-102-param', 'snacks-102', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-103-param', 'snacks-103', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-90-param', 'snacks-90', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-92-param', 'snacks-92', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-93-param', 'snacks-93', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-94-param', 'snacks-94', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-95-param', 'snacks-95', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('snacks-97-param', 'snacks-97', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('suger-113-param', 'suger-113', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('suger-115-param', 'suger-115', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('suger-116-param', 'suger-116', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('suger-117-param', 'suger-117', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('suger-118-param', 'suger-118', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('suger-119-param', 'suger-119', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('suger-121-param', 'suger-121', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('suger-124-param', 'suger-124', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-1001-param', 'tea-1001', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-1002-param', 'tea-1002', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-1003-param', 'tea-1003', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-1004-param', 'tea-1004', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-1005-param', 'tea-1005', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-1006-param', 'tea-1006', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-144-param', 'tea-144', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-145-param', 'tea-145', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-146-param', 'tea-146', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-147-param', 'tea-147', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-148-param', 'tea-148', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-149-param', 'tea-149', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-150-param', 'tea-150', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-151-param', 'tea-151', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-152-param', 'tea-152', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
INSERT INTO `items_param` VALUES ('tea-153-param', 'tea-153', '中国', '180天', '慕课网', '北京慕课网有限公司', '北京中关村', '袋装', '50g', '常温5~25°', '拆开即食', '2019-07-01 15:32:30', '2019-07-01 15:32:35', NULL);
COMMIT;

-- ----------------------------
-- Table structure for items_spec
-- ----------------------------
DROP TABLE IF EXISTS `items_spec`;
CREATE TABLE `items_spec` (
  `id` varchar(64) NOT NULL COMMENT '商品规格id',
  `item_id` varchar(64) NOT NULL COMMENT '商品外键id',
  `name` varchar(32) NOT NULL COMMENT '规格名称',
  `stock` int(11) NOT NULL COMMENT '库存',
  `discounts` decimal(4,2) NOT NULL COMMENT '折扣力度',
  `price_discount` int(11) NOT NULL COMMENT '优惠价',
  `price_normal` int(11) NOT NULL COMMENT '原价',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品规格 每一件商品都有不同的规格，不同的规格又有不同的价格和优惠力度，规格表为此设计';

-- ----------------------------
-- Records of items_spec
-- ----------------------------
BEGIN;
INSERT INTO `items_spec` VALUES ('1', 'cake-1001', '原味', 2267, 0.90, 18000, 20000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('2', 'cake-1001', '草莓味', 1007, 1.00, 20000, 20000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('3', 'cake-1001', '香草味', 976, 0.88, 17600, 20000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('4', 'cake-1002', '巧克力', 242, 0.90, 36000, 40000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('5', 'cake-1002', '草莓水果', 302, 0.80, 32000, 40000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('6', 'cake-1002', '芒果口味', 194, 1.00, 40000, 40000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('7', 'cake-1003', '巧克力', 250, 0.90, 22500, 25000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('8', 'cake-1003', '草莓水果', 305, 0.80, 20000, 25000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('9', 'cake-1003', '芒果口味', 198, 1.00, 25000, 25000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1001-spec-1', 'bingan-1001', '巧克力', 260, 0.80, 12000, 15000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1001-spec-2', 'bingan-1001', '草莓水果', 305, 0.60, 9000, 15000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1001-spec-3', 'bingan-1001', '芒果口味', 981, 1.00, 15000, 15000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1002-spec-1', 'bingan-1002', '巧克力', 258, 0.90, 13500, 15000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1002-spec-2', 'bingan-1002', '草莓水果', 303, 0.80, 12000, 15000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1002-spec-3', 'bingan-1002', '芒果口味', 198, 1.00, 10000, 10000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1003-spec-1', 'bingan-1003', '巧克力', 257, 0.90, 9000, 10000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1003-spec-2', 'bingan-1003', '草莓水果', 281, 0.80, 8000, 10000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1003-spec-3', 'bingan-1003', '芒果口味', 198, 1.00, 10000, 10000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1004-spec-1', 'bingan-1004', '巧克力', 253, 0.90, 31500, 35000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1004-spec-2', 'bingan-1004', '草莓水果', 305, 0.80, 28000, 35000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1004-spec-3', 'bingan-1004', '芒果口味', 198, 1.00, 35000, 35000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1005-spec-1', 'bingan-1005', '巧克力', 259, 0.90, 19800, 22000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1005-spec-2', 'bingan-1005', '草莓水果', 304, 0.80, 17600, 22000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1005-spec-3', 'bingan-1005', '芒果口味', 198, 1.00, 22000, 22000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1006-spec-1', 'bingan-1006', '巧克力', 260, 0.90, 20700, 23000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1006-spec-2', 'bingan-1006', '草莓水果', 305, 0.80, 18400, 23000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('bingan-1006-spec-3', 'bingan-1006', '芒果口味', 198, 1.00, 23000, 23000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-1004-spec-1', 'cake-1004', '巧克力', 249, 0.90, 14400, 16000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-1004-spec-2', 'cake-1004', '草莓水果', 305, 0.80, 12800, 16000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-1004-spec-3', 'cake-1004', '芒果口味', 198, 1.00, 16000, 16000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-1005-spec-1', 'cake-1005', '巧克力', 253, 0.90, 16020, 17800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-1005-spec-2', 'cake-1005', '草莓水果', 301, 0.80, 14240, 17800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-1005-spec-3', 'cake-1005', '芒果口味', 194, 1.00, 17800, 17800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-1006-spec-1', 'cake-1006', '巧克力', 232, 0.90, 11700, 13000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-1006-spec-2', 'cake-1006', '草莓水果', 256, 0.80, 10400, 13000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-1006-spec-3', 'cake-1006', '芒果口味', 196, 1.00, 13000, 13000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-37-spec-1', 'cake-37', '散装', 260, 0.90, 5310, 5900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-37-spec-2', 'cake-37', '袋装', 305, 0.80, 4720, 5900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-37-spec-3', 'cake-37', '罐装', 198, 1.00, 5900, 5900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-38-spec-1', 'cake-38', '散装', 260, 0.90, 2340, 2600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-38-spec-2', 'cake-38', '袋装', 305, 0.88, 2288, 2600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-38-spec-3', 'cake-38', '罐装', 198, 1.00, 2600, 2600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-39-spec-1', 'cake-39', '散装', 260, 0.90, 5040, 5600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-39-spec-2', 'cake-39', '袋装', 305, 0.80, 4480, 5600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-39-spec-3', 'cake-39', '罐装', 198, 1.00, 5600, 5600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-42-spec-1', 'cake-42', '散装', 260, 0.90, 6840, 7600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-42-spec-2', 'cake-42', '袋装', 305, 0.80, 6080, 7600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-42-spec-3', 'cake-42', '罐装', 198, 1.00, 7600, 7600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-44-spec-1', 'cake-44', '散装', 260, 0.90, 5940, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-44-spec-2', 'cake-44', '袋装', 305, 0.80, 5280, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-44-spec-3', 'cake-44', '罐装', 198, 1.00, 6600, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-47-spec-1', 'cake-47', '散装', 260, 0.90, 5760, 6400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-47-spec-2', 'cake-47', '袋装', 305, 0.80, 5120, 6400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-47-spec-3', 'cake-47', '罐装', 198, 1.00, 6400, 6400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-48-spec-1', 'cake-48', '散装', 260, 0.90, 5580, 6200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-48-spec-2', 'cake-48', '袋装', 305, 0.80, 4960, 6200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cake-48-spec-3', 'cake-48', '罐装', 198, 1.00, 6200, 6200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1001-spec-1', 'candy-1001', '薄荷味', 260, 0.90, 12600, 14000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1001-spec-2', 'candy-1001', '草莓味', 305, 0.80, 11200, 14000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1001-spec-3', 'candy-1001', '菠萝味', 198, 1.00, 14000, 14000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1002-spec-1', 'candy-1002', '薄荷味', 260, 0.90, 9450, 10500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1002-spec-2', 'candy-1002', '草莓味', 305, 0.80, 8400, 10500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1002-spec-3', 'candy-1002', '菠萝味', 198, 1.00, 10500, 10500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1003-spec-1', 'candy-1003', '薄荷味', 260, 0.90, 8820, 9800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1003-spec-2', 'candy-1003', '草莓味', 305, 0.80, 7840, 9800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1003-spec-3', 'candy-1003', '菠萝味', 198, 1.00, 9800, 9800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1004-spec-1', 'candy-1004', '薄荷味', 260, 0.90, 23400, 26000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1004-spec-2', 'candy-1004', '草莓味', 305, 0.80, 20800, 26000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1004-spec-3', 'candy-1004', '菠萝味', 198, 1.00, 26000, 26000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1005-spec-1', 'candy-1005', '原味', 260, 0.90, 37890, 42100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1005-spec-2', 'candy-1005', '蜂蜜味', 305, 0.80, 33680, 42100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1005-spec-3', 'candy-1005', '香草味', 198, 1.00, 42100, 42100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1006-spec-1', 'candy-1006', '原味', 260, 0.90, 14040, 15600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1006-spec-2', 'candy-1006', '蜂蜜味', 305, 0.80, 12480, 15600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('candy-1006-spec-3', 'candy-1006', '香草味', 198, 1.00, 15600, 15600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1001-spec-1', 'chocolate-1001', '黑巧克力', 260, 0.90, 14400, 16000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1001-spec-2', 'chocolate-1001', '白巧克力', 305, 0.80, 12800, 16000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1001-spec-3', 'chocolate-1001', '榛果味', 198, 1.00, 16000, 16000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1002-spec-1', 'chocolate-1002', '黑巧克力', 260, 0.90, 14400, 16000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1002-spec-2', 'chocolate-1002', '白巧克力', 305, 0.80, 5600, 7000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1002-spec-3', 'chocolate-1002', '榛果味', 198, 1.00, 7000, 7000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1003-spec-1', 'chocolate-1003', '黑巧克力', 260, 0.90, 6300, 7000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1003-spec-2', 'chocolate-1003', '白巧克力', 305, 0.80, 6400, 8000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1003-spec-3', 'chocolate-1003', '榛果味', 198, 1.00, 8000, 8000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1004-spec-1', 'chocolate-1004', '水蜜桃味', 260, 0.90, 7200, 8000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1004-spec-2', 'chocolate-1004', '草莓味', 305, 0.80, 5200, 6500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1004-spec-3', 'chocolate-1004', '橘子味', 198, 1.00, 6500, 6500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1005-spec-1', 'chocolate-1005', '水蜜桃味', 260, 0.90, 5850, 6500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1005-spec-2', 'chocolate-1005', '草莓味', 305, 0.80, 26000, 32500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1005-spec-3', 'chocolate-1005', '橘子味', 198, 1.00, 32500, 32500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1006-spec-1', 'chocolate-1006', '水蜜桃味', 260, 0.90, 29250, 32500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1006-spec-2', 'chocolate-1006', '草莓味', 305, 0.80, 28160, 35200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-1006-spec-3', 'chocolate-1006', '橘子味', 198, 1.00, 35200, 35200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-125-spec-1', 'chocolate-125', '散装', 260, 0.90, 16470, 18300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-125-spec-2', 'chocolate-125', '袋装', 305, 0.80, 14640, 18300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-125-spec-3', 'chocolate-125', '罐装', 198, 1.00, 18300, 18300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-127-spec-1', 'chocolate-127', '散装', 260, 0.90, 10170, 11300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-127-spec-2', 'chocolate-127', '袋装', 305, 0.80, 9040, 11300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-127-spec-3', 'chocolate-127', '罐装', 198, 1.00, 11300, 11300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-128-spec-1', 'chocolate-128', '散装', 260, 0.90, 23580, 26200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-128-spec-2', 'chocolate-128', '袋装', 305, 0.80, 20960, 26200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-128-spec-3', 'chocolate-128', '罐装', 198, 1.00, 26200, 26200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-129-spec-1', 'chocolate-129', '散装', 260, 0.90, 10350, 11500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-129-spec-2', 'chocolate-129', '袋装', 305, 0.80, 9200, 11500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-129-spec-3', 'chocolate-129', '罐装', 198, 1.00, 11500, 11500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-130-spec-1', 'chocolate-130', '散装', 260, 0.90, 17190, 19100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-130-spec-2', 'chocolate-130', '袋装', 305, 0.80, 15280, 19100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-130-spec-3', 'chocolate-130', '罐装', 198, 1.00, 19100, 19100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-131-spec-1', 'chocolate-131', '散装', 260, 0.90, 15660, 17400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-131-spec-2', 'chocolate-131', '袋装', 305, 0.80, 13920, 17400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-131-spec-3', 'chocolate-131', '罐装', 198, 1.00, 17400, 17400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-132-spec-1', 'chocolate-132', '散装', 260, 0.90, 17370, 19300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-132-spec-2', 'chocolate-132', '袋装', 305, 0.80, 15440, 19300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('chocolate-132-spec-3', 'chocolate-132', '罐装', 198, 1.00, 19300, 19300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-51-spec-1', 'cookies-51', '巧克力', 260, 0.90, 18450, 20500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-51-spec-2', 'cookies-51', '原味', 305, 0.80, 16400, 20500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-51-spec-3', 'cookies-51', '草莓味', 198, 1.00, 20500, 20500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-52-spec-1', 'cookies-52', '咸味', 260, 0.90, 15750, 17500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-52-spec-2', 'cookies-52', '原味', 305, 0.80, 14000, 17500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-52-spec-3', 'cookies-52', '辣味', 198, 1.00, 17500, 17500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-53-spec-1', 'cookies-53', '普通咸', 260, 0.90, 14400, 16000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-53-spec-2', 'cookies-53', '中等咸', 305, 0.80, 12800, 16000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-53-spec-3', 'cookies-53', '特别咸', 198, 1.00, 16000, 16000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-54-spec-1', 'cookies-54', '巧克力', 260, 0.90, 19350, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-54-spec-2', 'cookies-54', '原味', 305, 0.80, 17200, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-54-spec-3', 'cookies-54', '草莓味', 198, 1.00, 21500, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-55-spec-1', 'cookies-55', '巧克力', 260, 0.90, 20250, 22500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-55-spec-2', 'cookies-55', '原味', 305, 0.80, 18000, 22500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-55-spec-3', 'cookies-55', '草莓味', 198, 1.00, 22500, 22500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-56-spec-1', 'cookies-56', '巧克力', 260, 0.90, 19350, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-56-spec-2', 'cookies-56', '原味', 305, 0.80, 17200, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-56-spec-3', 'cookies-56', '草莓味', 198, 1.00, 21500, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-57-spec-1', 'cookies-57', '咸味', 260, 0.90, 17550, 19500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-57-spec-2', 'cookies-57', '原味', 305, 0.80, 15600, 19500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-57-spec-3', 'cookies-57', '辣味', 198, 1.00, 19500, 19500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-58-spec-1', 'cookies-58', '巧克力', 260, 0.90, 23850, 26500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-58-spec-2', 'cookies-58', '原味', 305, 0.80, 21200, 26500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-58-spec-3', 'cookies-58', '草莓味', 198, 1.00, 26500, 26500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-59-spec-1', 'cookies-59', '肉松饼干', 260, 0.90, 13500, 15000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-59-spec-2', 'cookies-59', '儿童饼干', 305, 0.80, 12000, 15000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-59-spec-3', 'cookies-59', '原味饼干', 198, 1.00, 15000, 15000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-60-spec-1', 'cookies-60', '咸味', 260, 0.90, 18450, 20500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-60-spec-2', 'cookies-60', '原味', 305, 0.80, 16400, 20500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-60-spec-3', 'cookies-60', '辣味', 198, 1.00, 20500, 20500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-62-spec-1', 'cookies-62', '咸味', 260, 0.90, 10350, 11500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-62-spec-2', 'cookies-62', '原味', 305, 0.80, 9200, 11500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-62-spec-3', 'cookies-62', '辣味', 198, 1.00, 11500, 11500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-63-spec-1', 'cookies-63', '巧克力', 260, 0.90, 19350, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-63-spec-2', 'cookies-63', '原味', 305, 0.80, 17200, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-63-spec-3', 'cookies-63', '草莓味', 198, 1.00, 21500, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-64-spec-1', 'cookies-64', '闲蛋黄', 260, 0.90, 17100, 19000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-64-spec-2', 'cookies-64', '甜蛋黄', 305, 0.80, 15200, 19000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-64-spec-3', 'cookies-64', '臭蛋黄', 198, 1.00, 19000, 19000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-65-spec-1', 'cookies-65', '普通咸', 260, 0.90, 14850, 16500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-65-spec-2', 'cookies-65', '中等咸', 305, 0.80, 13200, 16500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-65-spec-3', 'cookies-65', '特别咸', 198, 1.00, 16500, 16500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-68-spec-1', 'cookies-68', '咸味', 260, 0.90, 13950, 15500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-68-spec-2', 'cookies-68', '原味', 305, 0.80, 12400, 15500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('cookies-68-spec-3', 'cookies-68', '辣味', 198, 1.00, 15500, 15500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1001-spec-1', 'food-1001', '原味甜', 260, 0.90, 3870, 4300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1001-spec-2', 'food-1001', '七分甜', 305, 0.80, 3440, 4300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1001-spec-3', 'food-1001', '五分甜', 198, 1.00, 4300, 4300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1002-spec-1', 'food-1002', '紫薯', 260, 0.90, 5040, 5600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1002-spec-2', 'food-1002', '红薯', 305, 0.80, 4480, 5600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1002-spec-3', 'food-1002', '白薯', 198, 1.00, 5600, 5600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1003-spec-1', 'food-1003', '湖景桃', 260, 0.90, 6840, 7600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1003-spec-2', 'food-1003', '礼盒装', 305, 0.80, 6080, 7600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1003-spec-3', 'food-1003', '散装', 198, 1.00, 7600, 7600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1004-spec-1', 'food-1004', '精品装', 260, 0.90, 7650, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1004-spec-2', 'food-1004', '礼盒装', 305, 0.80, 6800, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1004-spec-3', 'food-1004', '散装', 198, 1.00, 8500, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1005-spec-1', 'food-1005', '精品装', 260, 0.90, 8640, 9600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1005-spec-2', 'food-1005', '礼盒装', 305, 0.80, 7680, 9600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1005-spec-3', 'food-1005', '散装', 198, 1.00, 9600, 9600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1006-spec-1', 'food-1006', '单个装', 260, 0.90, 6210, 6900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1006-spec-2', 'food-1006', '两个装', 305, 0.80, 5520, 6900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-1006-spec-3', 'food-1006', '三个装', 198, 1.00, 6900, 6900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-74-spec-1', 'food-74', '散装', 260, 0.90, 64350, 71500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-74-spec-2', 'food-74', '袋装', 305, 0.80, 57200, 71500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-74-spec-3', 'food-74', '罐装', 198, 1.00, 71500, 71500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-75-spec-1', 'food-75', '散装', 260, 0.90, 13320, 14800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-75-spec-2', 'food-75', '袋装', 305, 0.80, 11840, 14800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-75-spec-3', 'food-75', '罐装', 198, 1.00, 14800, 14800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-76-spec-1', 'food-76', '散装', 260, 0.90, 16290, 18100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-76-spec-2', 'food-76', '袋装', 305, 0.80, 14480, 18100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-76-spec-3', 'food-76', '罐装', 198, 1.00, 18100, 18100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-761-spec-1', 'food-761', '散装', 260, 0.90, 7650, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-761-spec-2', 'food-761', '袋装', 305, 0.80, 6800, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-761-spec-3', 'food-761', '罐装', 198, 1.00, 8500, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-77-spec-1', 'food-77', '散装', 260, 0.90, 14490, 16100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-77-spec-2', 'food-77', '袋装', 305, 0.80, 12880, 16100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-77-spec-3', 'food-77', '罐装', 198, 1.00, 16100, 16100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-78-spec-1', 'food-78', '散装', 260, 0.90, 28350, 31500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-78-spec-2', 'food-78', '袋装', 305, 0.80, 25200, 31500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-78-spec-3', 'food-78', '罐装', 198, 1.00, 31500, 31500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-80-spec-1', 'food-80', '散装', 260, 0.90, 6750, 7500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-80-spec-2', 'food-80', '袋装', 305, 0.80, 6000, 7500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-80-spec-3', 'food-80', '罐装', 198, 1.00, 7500, 7500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-81-spec-1', 'food-81', '散装', 260, 0.90, 17190, 19100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-81-spec-2', 'food-81', '袋装', 305, 0.80, 15280, 19100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-81-spec-3', 'food-81', '罐装', 198, 1.00, 19100, 19100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-82-spec-1', 'food-82', '散装', 260, 0.90, 17640, 19600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-82-spec-2', 'food-82', '袋装', 305, 0.80, 15680, 19600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-82-spec-3', 'food-82', '罐装', 198, 1.00, 19600, 19600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-83-spec-1', 'food-83', '散装', 260, 0.90, 19350, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-83-spec-2', 'food-83', '袋装', 305, 0.80, 17200, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-83-spec-3', 'food-83', '罐装', 198, 1.00, 21500, 21500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-84-spec-1', 'food-84', '散装', 260, 0.90, 11430, 12700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-84-spec-2', 'food-84', '袋装', 305, 0.80, 10160, 12700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-84-spec-3', 'food-84', '罐装', 198, 1.00, 12700, 12700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-85-spec-1', 'food-85', '散装', 260, 0.90, 13230, 14700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-85-spec-2', 'food-85', '袋装', 305, 0.80, 11760, 14700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-85-spec-3', 'food-85', '罐装', 198, 1.00, 14700, 14700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-86-spec-1', 'food-86', '散装', 260, 0.90, 9450, 10500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-86-spec-2', 'food-86', '袋装', 305, 0.80, 8400, 10500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-86-spec-3', 'food-86', '罐装', 198, 1.00, 10500, 10500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-87-spec-1', 'food-87', '散装', 260, 0.90, 12870, 14300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-87-spec-2', 'food-87', '袋装', 305, 0.80, 11440, 14300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-87-spec-3', 'food-87', '罐装', 198, 1.00, 14300, 14300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-88-spec-1', 'food-88', '散装', 260, 0.90, 15165, 16850, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-88-spec-2', 'food-88', '袋装', 305, 0.80, 13480, 16850, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-88-spec-3', 'food-88', '罐装', 198, 1.00, 16850, 16850, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-89-spec-1', 'food-89', '散装', 260, 0.90, 14850, 16500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-89-spec-2', 'food-89', '袋装', 305, 0.80, 13200, 16500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('food-89-spec-3', 'food-89', '罐装', 198, 1.00, 16500, 16500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1001-spec-1', 'meat-1001', '鸡肉', 260, 0.90, 27900, 31000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1001-spec-2', 'meat-1001', '牛肉', 305, 0.80, 24800, 31000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1001-spec-3', 'meat-1001', '猪肉', 198, 1.00, 31000, 31000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1002-spec-1', 'meat-1002', '鸡肉', 260, 0.90, 19800, 22000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1002-spec-2', 'meat-1002', '牛肉', 305, 0.80, 17600, 22000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1002-spec-3', 'meat-1002', '猪肉', 198, 1.00, 22000, 22000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1003-spec-1', 'meat-1003', '鸡肉', 260, 0.90, 17820, 19800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1003-spec-2', 'meat-1003', '牛肉', 304, 0.80, 15840, 19800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1003-spec-3', 'meat-1003', '猪肉', 198, 1.00, 19800, 19800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1004-spec-1', 'meat-1004', '鸡肉', 260, 0.90, 9720, 10800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1004-spec-2', 'meat-1004', '牛肉', 305, 0.80, 8640, 10800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1004-spec-3', 'meat-1004', '猪肉', 198, 1.00, 10800, 10800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1005-spec-1', 'meat-1005', '鸡肉', 260, 0.90, 32400, 36000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1005-spec-2', 'meat-1005', '牛肉', 305, 0.80, 28800, 36000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1005-spec-3', 'meat-1005', '猪肉', 198, 1.00, 36000, 36000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1006-spec-1', 'meat-1006', '鸡肉', 260, 0.90, 14310, 15900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1006-spec-2', 'meat-1006', '牛肉', 304, 0.80, 12720, 15900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-1006-spec-3', 'meat-1006', '猪肉', 198, 1.00, 15900, 15900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-157-spec-1', 'meat-157', '散装', 260, 0.90, 3240, 3600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-157-spec-2', 'meat-157', '袋装', 305, 0.80, 2880, 3600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-157-spec-3', 'meat-157', '罐装', 198, 1.00, 3600, 3600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-158-spec-1', 'meat-158', '散装', 260, 0.90, 3060, 3400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-158-spec-2', 'meat-158', '袋装', 305, 0.80, 2720, 3400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-158-spec-3', 'meat-158', '罐装', 198, 1.00, 3400, 3400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-159-spec-1', 'meat-159', '散装', 260, 0.90, 3240, 3600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-159-spec-2', 'meat-159', '袋装', 305, 0.80, 2880, 3600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-159-spec-3', 'meat-159', '罐装', 198, 1.00, 3600, 3600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-160-spec-1', 'meat-160', '散装', 260, 0.90, 11790, 13100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-160-spec-2', 'meat-160', '袋装', 305, 0.80, 10480, 13100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-160-spec-3', 'meat-160', '罐装', 198, 1.00, 13100, 13100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-161-spec-1', 'meat-161', '散装', 260, 0.90, 11430, 12700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-161-spec-2', 'meat-161', '袋装', 305, 0.80, 10160, 12700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-161-spec-3', 'meat-161', '罐装', 198, 1.00, 12700, 12700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-162-spec-1', 'meat-162', '散装', 260, 0.90, 8460, 9400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-162-spec-2', 'meat-162', '袋装', 305, 0.80, 7520, 9400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-162-spec-3', 'meat-162', '罐装', 198, 1.00, 9400, 9400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-163-spec-1', 'meat-163', '散装', 260, 0.90, 4860, 5400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-163-spec-2', 'meat-163', '袋装', 305, 0.80, 4320, 5400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-163-spec-3', 'meat-163', '罐装', 198, 1.00, 5400, 5400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-164-spec-1', 'meat-164', '散装', 260, 0.90, 1530, 1700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-164-spec-2', 'meat-164', '袋装', 305, 0.80, 1360, 1700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-164-spec-3', 'meat-164', '罐装', 198, 1.00, 1700, 1700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-165-spec-1', 'meat-165', '散装', 260, 0.90, 1440, 1600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-165-spec-2', 'meat-165', '袋装', 305, 0.80, 1280, 1600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-165-spec-3', 'meat-165', '罐装', 198, 1.00, 1600, 1600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-166-spec-1', 'meat-166', '散装', 260, 0.90, 8370, 9300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-166-spec-2', 'meat-166', '袋装', 305, 0.80, 7440, 9300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-166-spec-3', 'meat-166', '罐装', 198, 1.00, 9300, 9300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-167-spec-1', 'meat-167', '散装', 260, 0.90, 6840, 7600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-167-spec-2', 'meat-167', '袋装', 305, 0.80, 6080, 7600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-167-spec-3', 'meat-167', '罐装', 198, 1.00, 7600, 7600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-168-spec-1', 'meat-168', '散装', 260, 0.90, 5490, 6100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-168-spec-2', 'meat-168', '袋装', 305, 0.80, 4880, 6100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-168-spec-3', 'meat-168', '罐装', 198, 1.00, 6100, 6100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-169-spec-1', 'meat-169', '散装', 260, 0.90, 12330, 13700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-169-spec-2', 'meat-169', '袋装', 305, 0.80, 10960, 13700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-169-spec-3', 'meat-169', '罐装', 198, 1.00, 13700, 13700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-170-spec-1', 'meat-170', '散装', 260, 0.90, 10530, 11700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-170-spec-2', 'meat-170', '袋装', 305, 0.80, 9360, 11700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-170-spec-3', 'meat-170', '罐装', 198, 1.00, 11700, 11700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-171-spec-1', 'meat-171', '散装', 260, 0.90, 3060, 3400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-171-spec-2', 'meat-171', '袋装', 305, 0.80, 2720, 3400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-171-spec-3', 'meat-171', '罐装', 198, 1.00, 3400, 3400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-173-spec-1', 'meat-173', '散装', 260, 0.90, 14490, 16100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-173-spec-2', 'meat-173', '袋装', 305, 0.80, 12880, 16100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-173-spec-3', 'meat-173', '罐装', 198, 1.00, 16100, 16100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-174-spec-1', 'meat-174', '散装', 260, 0.90, 12240, 13600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-174-spec-2', 'meat-174', '袋装', 305, 0.80, 10880, 13600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-174-spec-3', 'meat-174', '罐装', 198, 1.00, 13600, 13600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-175-spec-1', 'meat-175', '散装', 260, 0.90, 5760, 6400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-175-spec-2', 'meat-175', '袋装', 305, 0.80, 5120, 6400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-175-spec-3', 'meat-175', '罐装', 198, 1.00, 6400, 6400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-176-spec-1', 'meat-176', '散装', 260, 0.90, 5940, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-176-spec-2', 'meat-176', '袋装', 305, 0.80, 5280, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-176-spec-3', 'meat-176', '罐装', 198, 1.00, 6600, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-177-spec-1', 'meat-177', '散装', 260, 0.90, 5220, 5800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-177-spec-2', 'meat-177', '袋装', 305, 0.80, 4640, 5800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-177-spec-3', 'meat-177', '罐装', 198, 1.00, 5800, 5800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-178-spec-1', 'meat-178', '散装', 260, 0.90, 8820, 9800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-178-spec-2', 'meat-178', '袋装', 305, 0.80, 7840, 9800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-178-spec-3', 'meat-178', '罐装', 198, 1.00, 9800, 9800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-72-spec-1', 'meat-72', '散装', 260, 0.90, 5940, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-72-spec-2', 'meat-72', '袋装', 305, 0.80, 5280, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('meat-72-spec-3', 'meat-72', '罐装', 198, 1.00, 6600, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1001-spec-1', 'nut-1001', '甜', 260, 0.90, 3780, 4200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1001-spec-2', 'nut-1001', '辣', 305, 0.80, 3360, 4200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1001-spec-3', 'nut-1001', '原味', 198, 1.00, 4200, 4200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1002-spec-1', 'nut-1002', '甜', 260, 0.90, 5040, 5600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1002-spec-2', 'nut-1002', '辣', 305, 0.80, 4480, 5600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1002-spec-3', 'nut-1002', '原味', 198, 1.00, 5600, 5600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1003-spec-1', 'nut-1003', '甜', 260, 0.90, 5670, 6300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1003-spec-2', 'nut-1003', '辣', 305, 0.80, 5040, 6300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1003-spec-3', 'nut-1003', '原味', 198, 1.00, 6300, 6300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1004-spec-1', 'nut-1004', '甜', 260, 0.90, 6210, 6900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1004-spec-2', 'nut-1004', '辣', 305, 0.80, 5440, 6800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1004-spec-3', 'nut-1004', '原味', 198, 1.00, 6900, 6900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1005-spec-1', 'nut-1005', '甜', 260, 0.90, 8640, 9600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1005-spec-2', 'nut-1005', '辣', 305, 0.80, 7680, 9600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1005-spec-3', 'nut-1005', '原味', 198, 1.00, 9600, 9600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1006-spec-1', 'nut-1006', '甜', 260, 0.90, 5220, 5800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1006-spec-2', 'nut-1006', '辣', 305, 0.80, 4640, 5800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-1006-spec-3', 'nut-1006', '原味', 198, 1.00, 5800, 5800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-104-spec-1', 'nut-104', '散装', 260, 0.90, 6480, 7200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-104-spec-2', 'nut-104', '袋装', 305, 0.80, 5760, 7200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-104-spec-3', 'nut-104', '罐装', 198, 1.00, 7200, 7200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-105-spec-1', 'nut-105', '散装', 260, 0.90, 8370, 9300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-105-spec-2', 'nut-105', '袋装', 305, 0.80, 7440, 9300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-105-spec-3', 'nut-105', '罐装', 198, 1.00, 9300, 9300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-106-spec-1', 'nut-106', '散装', 260, 0.90, 17910, 19900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-106-spec-2', 'nut-106', '袋装', 305, 0.80, 15920, 19900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-106-spec-3', 'nut-106', '罐装', 198, 1.00, 19900, 19900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-107-spec-1', 'nut-107', '散装', 260, 0.90, 5940, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-107-spec-2', 'nut-107', '袋装', 305, 0.80, 5280, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-107-spec-3', 'nut-107', '罐装', 198, 1.00, 6600, 6600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-108-spec-1', 'nut-108', '散装', 260, 0.90, 8640, 9600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-108-spec-2', 'nut-108', '袋装', 305, 0.80, 7680, 9600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-108-spec-3', 'nut-108', '罐装', 198, 1.00, 9600, 9600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-109-spec-1', 'nut-109', '散装', 260, 0.90, 8730, 9700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-109-spec-2', 'nut-109', '袋装', 305, 0.80, 7760, 9700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-109-spec-3', 'nut-109', '罐装', 198, 1.00, 9700, 9700, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-110-spec-1', 'nut-110', '散装', 260, 0.90, 17280, 19200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-110-spec-2', 'nut-110', '袋装', 305, 0.80, 15360, 19200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-110-spec-3', 'nut-110', '罐装', 198, 1.00, 19200, 19200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-111-spec-1', 'nut-111', '散装', 260, 0.90, 5760, 6400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-111-spec-2', 'nut-111', '袋装', 305, 0.80, 5120, 6400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('nut-111-spec-3', 'nut-111', '罐装', 198, 1.00, 6400, 6400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1001-spec-1', 'seafood-1001', '十三香', 260, 0.90, 6750, 7500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1001-spec-2', 'seafood-1001', '卤辣味', 305, 0.80, 6000, 7500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1001-spec-3', 'seafood-1001', '蒜泥味', 198, 1.00, 6300, 6300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1002-spec-1', 'seafood-1002', '十三香', 260, 0.90, 5670, 6300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1002-spec-2', 'seafood-1002', '卤辣味', 305, 0.80, 5040, 6300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1002-spec-3', 'seafood-1002', '蒜泥味', 198, 1.00, 6300, 6300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1003-spec-1', 'seafood-1003', '十三香', 260, 0.90, 6660, 7400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1003-spec-2', 'seafood-1003', '卤辣味', 305, 0.80, 5920, 7400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1003-spec-3', 'seafood-1003', '蒜泥味', 198, 1.00, 7400, 7400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1004-spec-1', 'seafood-1004', '十三香', 260, 0.90, 8820, 9800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1004-spec-2', 'seafood-1004', '卤辣味', 305, 0.80, 7840, 9800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1004-spec-3', 'seafood-1004', '蒜泥味', 198, 1.00, 9800, 9800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1005-spec-1', 'seafood-1005', '原味', 260, 0.90, 90000, 100000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1005-spec-2', 'seafood-1005', '辣味', 305, 0.80, 80000, 100000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1005-spec-3', 'seafood-1005', '闲味', 198, 1.00, 100000, 100000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1006-spec-1', 'seafood-1006', '原味', 260, 0.90, 108000, 120000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1006-spec-2', 'seafood-1006', '辣味', 305, 0.80, 96000, 120000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-1006-spec-3', 'seafood-1006', '闲味', 198, 1.00, 120000, 120000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-133-spec-1', 'seafood-133', '散装', 259, 0.90, 269910, 299900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-133-spec-2', 'seafood-133', '袋装', 305, 0.80, 239920, 299900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-133-spec-3', 'seafood-133', '罐装', 198, 1.00, 299900, 299900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-134-spec-1', 'seafood-134', '散装', 260, 0.90, 179910, 199900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-134-spec-2', 'seafood-134', '袋装', 305, 0.80, 159920, 199900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-134-spec-3', 'seafood-134', '罐装', 198, 1.00, 199900, 199900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-135-spec-1', 'seafood-135', '散装', 260, 0.90, 50400, 56000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-135-spec-2', 'seafood-135', '袋装', 305, 0.80, 44800, 56000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-135-spec-3', 'seafood-135', '罐装', 198, 1.00, 56000, 56000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-136-spec-1', 'seafood-136', '散装', 260, 0.90, 12960, 14400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-136-spec-2', 'seafood-136', '袋装', 305, 0.80, 11520, 14400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-136-spec-3', 'seafood-136', '罐装', 198, 1.00, 14400, 14400, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-137-spec-1', 'seafood-137', '散装', 260, 0.90, 32400, 36000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-137-spec-2', 'seafood-137', '袋装', 305, 0.80, 28800, 36000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-137-spec-3', 'seafood-137', '罐装', 198, 1.00, 36000, 36000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-138-spec-1', 'seafood-138', '散装', 260, 0.90, 30150, 33500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-138-spec-2', 'seafood-138', '袋装', 305, 0.80, 26800, 33500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-138-spec-3', 'seafood-138', '罐装', 198, 1.00, 33500, 33500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-139-spec-1', 'seafood-139', '散装', 260, 0.90, 31050, 34500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-139-spec-2', 'seafood-139', '袋装', 305, 0.80, 27600, 34500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-139-spec-3', 'seafood-139', '罐装', 198, 1.00, 34500, 34500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-140-spec-1', 'seafood-140', '散装', 260, 0.90, 12780, 14200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-140-spec-2', 'seafood-140', '袋装', 305, 0.80, 11360, 14200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-140-spec-3', 'seafood-140', '罐装', 198, 1.00, 14200, 14200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-141-spec-1', 'seafood-141', '散装', 260, 0.90, 12150, 13500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-141-spec-2', 'seafood-141', '袋装', 305, 0.80, 10800, 13500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-141-spec-3', 'seafood-141', '罐装', 198, 1.00, 13500, 13500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-142-spec-1', 'seafood-142', '散装', 260, 0.90, 30600, 34000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-142-spec-2', 'seafood-142', '袋装', 305, 0.80, 27200, 34000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-142-spec-3', 'seafood-142', '罐装', 198, 1.00, 34000, 34000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-143-spec-1', 'seafood-143', '散装', 260, 0.90, 30150, 33500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-143-spec-2', 'seafood-143', '袋装', 305, 0.80, 26800, 33500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('seafood-143-spec-3', 'seafood-143', '罐装', 198, 1.00, 33500, 33500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-100-spec-1', 'snacks-100', '散装', 260, 0.90, 3690, 4100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-100-spec-2', 'snacks-100', '袋装', 305, 0.80, 3280, 4100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-100-spec-3', 'snacks-100', '罐装', 198, 1.00, 4100, 4100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1001-spec-1', 'snacks-1001', '香辣', 260, 0.90, 22500, 25000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1001-spec-2', 'snacks-1001', '麻辣', 305, 0.80, 20000, 25000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1001-spec-3', 'snacks-1001', '甜辣', 198, 1.00, 25000, 25000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1002-spec-1', 'snacks-1002', '香辣', 260, 0.90, 22500, 25000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1002-spec-2', 'snacks-1002', '麻辣', 305, 0.80, 40800, 51000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1002-spec-3', 'snacks-1002', '甜辣', 198, 1.00, 51000, 51000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1003-spec-1', 'snacks-1003', '香辣', 260, 0.90, 45900, 51000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1003-spec-2', 'snacks-1003', '麻辣', 305, 0.80, 28800, 36000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1003-spec-3', 'snacks-1003', '甜辣', 198, 1.00, 36000, 36000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1004-spec-1', 'snacks-1004', '香辣', 260, 0.90, 32400, 36000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1004-spec-2', 'snacks-1004', '麻辣', 305, 0.80, 32800, 41000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1004-spec-3', 'snacks-1004', '甜辣', 198, 1.00, 41000, 41000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1005-spec-1', 'snacks-1005', '香辣', 259, 0.90, 12798, 14220, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1005-spec-2', 'snacks-1005', '麻辣', 305, 0.80, 11376, 14220, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1005-spec-3', 'snacks-1005', '甜辣', 198, 1.00, 14220, 14220, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1006-spec-1', 'snacks-1006', '香辣', 259, 0.90, 7020, 7800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1006-spec-2', 'snacks-1006', '麻辣', 305, 0.80, 6240, 7800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-1006-spec-3', 'snacks-1006', '甜辣', 198, 1.00, 7800, 7800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-101-spec-1', 'snacks-101', '散装', 260, 0.90, 4140, 4600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-101-spec-2', 'snacks-101', '袋装', 305, 0.80, 3680, 4600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-101-spec-3', 'snacks-101', '罐装', 198, 1.00, 4600, 4600, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-102-spec-1', 'snacks-102', '散装', 260, 0.90, 3870, 4300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-102-spec-2', 'snacks-102', '袋装', 305, 0.80, 3440, 4300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-102-spec-3', 'snacks-102', '罐装', 198, 1.00, 4300, 4300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-103-spec-1', 'snacks-103', '散装', 260, 0.90, 4410, 4900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-103-spec-2', 'snacks-103', '袋装', 305, 0.80, 3920, 4900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-103-spec-3', 'snacks-103', '罐装', 198, 1.00, 4900, 4900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-90-spec-1', 'snacks-90', '散装', 260, 0.90, 990, 1100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-90-spec-2', 'snacks-90', '袋装', 305, 0.80, 880, 1100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-90-spec-3', 'snacks-90', '罐装', 198, 1.00, 1100, 1100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-92-spec-1', 'snacks-92', '散装', 260, 0.90, 14580, 16200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-92-spec-2', 'snacks-92', '袋装', 305, 0.80, 12960, 16200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-92-spec-3', 'snacks-92', '罐装', 198, 1.00, 16200, 16200, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-93-spec-1', 'snacks-93', '散装', 260, 0.90, 14850, 16500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-93-spec-2', 'snacks-93', '袋装', 305, 0.80, 13200, 16500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-93-spec-3', 'snacks-93', '罐装', 198, 1.00, 16500, 16500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-94-spec-1', 'snacks-94', '散装', 260, 0.90, 8100, 9000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-94-spec-2', 'snacks-94', '袋装', 305, 0.80, 7200, 9000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-94-spec-3', 'snacks-94', '罐装', 198, 1.00, 9000, 9000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-95-spec-1', 'snacks-95', '散装', 260, 0.90, 2970, 3300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-95-spec-2', 'snacks-95', '袋装', 305, 0.80, 2640, 3300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-95-spec-3', 'snacks-95', '罐装', 198, 1.00, 3300, 3300, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-97-spec-1', 'snacks-97', '散装', 260, 0.90, 35100, 39000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-97-spec-2', 'snacks-97', '袋装', 305, 0.80, 31200, 39000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('snacks-97-spec-3', 'snacks-97', '罐装', 198, 1.00, 39000, 39000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-113-spec-1', 'suger-113', '散装', 260, 0.90, 13410, 14900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-113-spec-2', 'suger-113', '袋装', 305, 0.80, 11920, 14900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-113-spec-3', 'suger-113', '罐装', 198, 1.00, 14900, 14900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-115-spec-1', 'suger-115', '散装', 260, 0.90, 2790, 3100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-115-spec-2', 'suger-115', '袋装', 305, 0.80, 2480, 3100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-115-spec-3', 'suger-115', '罐装', 198, 1.00, 3100, 3100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-116-spec-1', 'suger-116', '散装', 260, 0.90, 1710, 1900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-116-spec-2', 'suger-116', '袋装', 305, 0.80, 1520, 1900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-116-spec-3', 'suger-116', '罐装', 198, 1.00, 1900, 1900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-117-spec-1', 'suger-117', '散装', 260, 0.90, 11250, 12500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-117-spec-2', 'suger-117', '袋装', 305, 0.80, 10000, 12500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-117-spec-3', 'suger-117', '罐装', 198, 1.00, 12500, 12500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-118-spec-1', 'suger-118', '散装', 260, 0.90, 2790, 3100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-118-spec-2', 'suger-118', '袋装', 305, 0.80, 2480, 3100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-118-spec-3', 'suger-118', '罐装', 198, 1.00, 3100, 3100, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-119-spec-1', 'suger-119', '散装', 260, 0.90, 3510, 3900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-119-spec-2', 'suger-119', '袋装', 305, 0.80, 3120, 3900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-119-spec-3', 'suger-119', '罐装', 198, 1.00, 3900, 3900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-121-spec-1', 'suger-121', '散装', 260, 0.90, 12510, 13900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-121-spec-2', 'suger-121', '袋装', 305, 0.80, 11120, 13900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-121-spec-3', 'suger-121', '罐装', 198, 1.00, 13900, 13900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-124-spec-1', 'suger-124', '散装', 260, 0.90, 4410, 4900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-124-spec-2', 'suger-124', '袋装', 305, 0.80, 3920, 4900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('suger-124-spec-3', 'suger-124', '罐装', 198, 1.00, 4900, 4900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1001-spec-1', 'tea-1001', '原味', 260, 0.90, 17910, 19900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1001-spec-2', 'tea-1001', '辣味', 305, 0.80, 15920, 19900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1001-spec-3', 'tea-1001', '闲味', 198, 1.00, 19900, 19900, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1002-spec-1', 'tea-1002', '散装', 260, 0.90, 18720, 20800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1002-spec-2', 'tea-1002', '盒装', 305, 0.80, 16640, 20800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1002-spec-3', 'tea-1002', '试吃装', 198, 1.00, 20800, 20800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1003-spec-1', 'tea-1003', '散装', 260, 0.90, 19800, 22000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1003-spec-2', 'tea-1003', '盒装', 305, 0.80, 17600, 22000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1003-spec-3', 'tea-1003', '试吃装', 198, 1.00, 22000, 22000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1004-spec-1', 'tea-1004', '散装', 260, 0.90, 28800, 32000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1004-spec-2', 'tea-1004', '盒装', 305, 0.80, 25600, 32000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1004-spec-3', 'tea-1004', '试吃装', 198, 1.00, 32000, 32000, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1005-spec-1', 'tea-1005', '散装', 260, 0.90, 13050, 14500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1005-spec-2', 'tea-1005', '盒装', 305, 0.80, 11600, 14500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1005-spec-3', 'tea-1005', '试吃装', 198, 1.00, 14500, 14500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1006-spec-1', 'tea-1006', '散装', 260, 0.90, 15120, 16800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1006-spec-2', 'tea-1006', '盒装', 305, 0.80, 13440, 16800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-1006-spec-3', 'tea-1006', '试吃装', 198, 1.00, 16800, 16800, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-144-spec-1', 'tea-144', '散装', 260, 0.90, 29250, 32500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-144-spec-2', 'tea-144', '袋装', 305, 0.80, 26000, 32500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-144-spec-3', 'tea-144', '罐装', 198, 1.00, 32500, 32500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-145-spec-1', 'tea-145', '散装', 260, 0.90, 18450, 20500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-145-spec-2', 'tea-145', '袋装', 305, 0.80, 16400, 20500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-145-spec-3', 'tea-145', '罐装', 198, 1.00, 20500, 20500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-146-spec-1', 'tea-146', '散装', 260, 0.90, 8550, 9500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-146-spec-2', 'tea-146', '袋装', 305, 0.80, 7600, 9500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-146-spec-3', 'tea-146', '罐装', 198, 1.00, 9500, 9500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-147-spec-1', 'tea-147', '散装', 260, 0.90, 35550, 39500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-147-spec-2', 'tea-147', '袋装', 305, 0.80, 31600, 39500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-147-spec-3', 'tea-147', '罐装', 198, 1.00, 39500, 39500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-148-spec-1', 'tea-148', '散装', 260, 0.90, 25650, 28500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-148-spec-2', 'tea-148', '袋装', 305, 0.80, 22800, 28500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-148-spec-3', 'tea-148', '罐装', 198, 1.00, 28500, 28500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-149-spec-1', 'tea-149', '散装', 260, 0.90, 7650, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-149-spec-2', 'tea-149', '袋装', 305, 0.80, 6800, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-149-spec-3', 'tea-149', '罐装', 198, 1.00, 8500, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-150-spec-1', 'tea-150', '散装', 260, 0.90, 27450, 30500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-150-spec-2', 'tea-150', '袋装', 305, 0.80, 24400, 30500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-150-spec-3', 'tea-150', '罐装', 198, 1.00, 30500, 30500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-151-spec-1', 'tea-151', '散装', 260, 0.90, 44550, 49500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-151-spec-2', 'tea-151', '袋装', 305, 0.80, 39600, 49500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-151-spec-3', 'tea-151', '罐装', 198, 1.00, 49500, 49500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-152-spec-1', 'tea-152', '散装', 260, 0.90, 26550, 29500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-152-spec-2', 'tea-152', '袋装', 305, 0.80, 23600, 29500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-152-spec-3', 'tea-152', '罐装', 198, 1.00, 29500, 29500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-153-spec-1', 'tea-153', '散装', 260, 0.90, 7650, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-153-spec-2', 'tea-153', '袋装', 305, 0.80, 6800, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
INSERT INTO `items_spec` VALUES ('tea-153-spec-3', 'tea-153', '罐装', 198, 1.00, 8500, 8500, '2019-07-01 14:54:20', '2019-07-01 14:54:28');
COMMIT;

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `order_id` varchar(64) NOT NULL COMMENT '归属订单id',
  `item_id` varchar(64) NOT NULL COMMENT '商品id',
  `item_img` varchar(128) NOT NULL COMMENT '商品图片',
  `item_name` varchar(32) NOT NULL COMMENT '商品名称',
  `item_spec_id` varchar(32) NOT NULL COMMENT '规格id',
  `item_spec_name` varchar(32) NOT NULL COMMENT '规格名称',
  `price` int(11) NOT NULL COMMENT '成交价格',
  `buy_counts` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单商品关联表 ';

-- ----------------------------
-- Records of order_items
-- ----------------------------
BEGIN;
INSERT INTO `order_items` VALUES ('190827F2R9C5HA3C', '190827F2R9A6ZT2W', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190827F4AK1T68M8', '190827F4AK12R30H', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190827F4AK2N3168', '190827F4AK12R30H', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190827H703NGAHSW', '190827H703M977C0', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190827H703PM2B7C', '190827H703M977C0', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190827H7WD3SPZ2W', '190827H7WD2TCNHH', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190827H87MGDSGTC', '190827H87MFB2RAW', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190827H87MHNXX68', '190827H87MFB2RAW', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190828F6B6H4G72W', '190828F6B6FYBXP0', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190828F6B6KAMHDP', '190828F6B6FYBXP0', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190828FFTCNXYP28', '190828FFTCMT6XKP', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190828FFTCPRTCM8', '190828FFTCMT6XKP', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190828FG7ZA594ZC', '190828FG7Z8A44X4', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190828FG7ZBRN354', '190828FG7Z8A44X4', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190828FKGK1T12A8', '190828FKGK0DF614', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190828FKGK2XPWSW', '190828FKGK0DF614', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190828FSTH7965AW', '190828FSTH66FAY8', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190828FSTH852XYW', '190828FSTH66FAY8', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190829022A57GCM8', '190829022A38YXKP', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190829022A6PDTXP', '190829022A38YXKP', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('19082903XD866T9P', '19082903XD76YGTC', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('19082903XD95G2W0', '19082903XD76YGTC', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('19082906Z4S3FSA8', '19082906Z4PBR968', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('19082906Z4TD1MNC', '19082906Z4PBR968', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190829081HZ2C1KP', '190829081HY6G91P', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190829081HZY8S5P', '190829081HY6G91P', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('1908290848S44NXP', '1908290848R4WCBC', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('1908290848T01CDP', '1908290848R4WCBC', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('19082908GR5FR494', '19082908GR4GCWSW', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('19082908GR6769YW', '19082908GR4GCWSW', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190829092XG40TF8', '190829092XFBGKWH', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190829092XGR2F5P', '190829092XFBGKWH', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('1908290HGHA37FK4', '1908290HGH9AS8ZC', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('1908290HGHATPP6W', '1908290HGH9AS8ZC', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190829F5Z10SWY3C', '190829F5Z0YKD968', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190829F5Z1308G0H', '190829F5Z0YKD968', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190829F61X5ZA51P', '190829F61X4WMAK4', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190829F61X6T6XKP', '190829F61X4WMAK4', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190829F6FTCK6WZC', '190829F6FTBRA4BC', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190829F6FTDD3KGC', '190829F6FTBRA4BC', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190829F6NT93F04H', '190829F6NT8B0SFW', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190829F6NT9TZ5S8', '190829F6NT8B0SFW', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190829F7DDHTPSW0', '190829F7DDGZW280', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190829F7DDKH60DP', '190829F7DDGZW280', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190830BPTHMKCYRP', '190830BPTHGSZN54', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190830BPTHR8FNC0', '190830BPTHGSZN54', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190830BW77X8C280', '190830BW77HM55KP', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190830BW77YWS0DP', '190830BW77HM55KP', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('190830BZ5B6TZC94', '190830BZ5B5R7KWH', 'bingan-1001', 'http://122.152.205.72:88/foodie/bingan-1001/img1.png', '【天天吃货】彩虹马卡龙 下午茶 美眉最爱', 'bingan-1001-spec-3', '芒果口味', 15000, 1);
INSERT INTO `order_items` VALUES ('190830BZ5B7NW4X4', '190830BZ5B5R7KWH', 'bingan-1003', 'http://122.152.205.72:88/foodie/bingan-1003/img1.png', '【天天吃货】可爱动物饼干 儿童早餐 孩子最爱', 'bingan-1003-spec-2', '草莓水果', 8000, 1);
INSERT INTO `order_items` VALUES ('191215AM52PFSS14', '191215AM5260S894', 'cake-1005', 'http://122.152.205.72:88/foodie/cake-1005/img1.png', '草莓水果', 'cake-1005-spec-2', '草莓水果', 14240, 1);
INSERT INTO `order_items` VALUES ('191215AM91CDTPDP', '191215AM5260S894', 'cake-1005', 'http://122.152.205.72:88/foodie/cake-1005/img1.png', '芒果口味', 'cake-1005-spec-3', '芒果口味', 17800, 1);
INSERT INTO `order_items` VALUES ('191215AN2537P0M8', '191215AN25128BR4', 'cake-1005', 'http://122.152.205.72:88/foodie/cake-1005/img1.png', '草莓水果', 'cake-1005-spec-2', '草莓水果', 14240, 1);
INSERT INTO `order_items` VALUES ('191215AN8RW659GC', '191215AN25128BR4', 'cake-1005', 'http://122.152.205.72:88/foodie/cake-1005/img1.png', '芒果口味', 'cake-1005-spec-3', '芒果口味', 17800, 1);
INSERT INTO `order_items` VALUES ('191215AY4NC4KW6W', '191215AY4N9Z679P', 'cake-1005', 'http://122.152.205.72:88/foodie/cake-1005/img1.png', '草莓水果', 'cake-1005-spec-2', '草莓水果', 14240, 1);
INSERT INTO `order_items` VALUES ('191215AY54XMPPH0', '191215AY4N9Z679P', 'cake-1005', 'http://122.152.205.72:88/foodie/cake-1005/img1.png', '芒果口味', 'cake-1005-spec-3', '芒果口味', 17800, 1);
INSERT INTO `order_items` VALUES ('191215AZ9HZHT2FW', '191215AZ9HXM6GF8', 'cake-1005', 'http://122.152.205.72:88/foodie/cake-1005/img1.png', '草莓水果', 'cake-1005-spec-2', '草莓水果', 14240, 1);
INSERT INTO `order_items` VALUES ('191215AZ9XAMB7C0', '191215AZ9HXM6GF8', 'cake-1005', 'http://122.152.205.72:88/foodie/cake-1005/img1.png', '芒果口味', 'cake-1005-spec-3', '芒果口味', 17800, 1);
INSERT INTO `order_items` VALUES ('191215B4WGG73S3C', '191215B4WGF7TFK4', 'cake-1001', 'http://122.152.205.72:88/foodie/cake-1001/img1.png', '原味', '1', '原味', 18000, 1);
INSERT INTO `order_items` VALUES ('191215C1T2AMK1AW', '191215C1T29N8RWH', 'cake-1001', 'http://122.152.205.72:88/foodie/cake-1001/img1.png', '原味', '1', '原味', 18000, 1);
INSERT INTO `order_items` VALUES ('191215C5HYSGGRS8', '191215C5HYPTS8M8', 'cake-1001', 'http://122.152.205.72:88/foodie/cake-1001/img1.png', '香草味', '3', '香草味', 17600, 1);
INSERT INTO `order_items` VALUES ('191215C767K96TMW', '191215C767GKDAFW', 'cake-1001', 'http://122.152.205.72:88/foodie/cake-1001/img1.png', '香草味', '3', '香草味', 17600, 1);
COMMIT;

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `order_id` varchar(64) NOT NULL COMMENT '订单ID;对应订单表的主键id',
  `order_status` int(11) NOT NULL COMMENT '订单状态',
  `created_time` datetime DEFAULT NULL COMMENT '订单创建时间;对应[10:待付款]状态',
  `pay_time` datetime DEFAULT NULL COMMENT '支付成功时间;对应[20:已付款，待发货]状态',
  `deliver_time` datetime DEFAULT NULL COMMENT '发货时间;对应[30：已发货，待收货]状态',
  `success_time` datetime DEFAULT NULL COMMENT '交易成功时间;对应[40：交易成功]状态',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间;对应[50：交易关闭]状态',
  `comment_time` datetime DEFAULT NULL COMMENT '留言时间;用户在交易成功后的留言时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单状态表;订单的每个状态更改都需要进行记录\n10：待付款  20：已付款，待发货  30：已发货，待收货（7天自动确认）  40：交易成功（此时可以评价）50：交易关闭（待付款时，用户取消 或 长时间未付款，系统识别后自动关闭）\n退货/退货，此分支流程不做，所以不加入';

-- ----------------------------
-- Records of order_status
-- ----------------------------
BEGIN;
INSERT INTO `order_status` VALUES ('190827F2R9A6ZT2W', 20, '2019-08-27 19:45:16', '2019-08-28 18:59:34', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('190827F4AK12R30H', 20, '2019-08-27 19:50:07', '2019-08-28 21:47:17', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('190827H703M977C0', 50, '2019-08-27 22:46:09', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190827H7WD2TCNHH', 50, '2019-08-27 22:48:45', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190827H87MFB2RAW', 50, '2019-08-27 22:49:57', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190828F6B6FYBXP0', 50, '2019-08-28 19:56:12', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190828FFTCMT6XKP', 50, '2019-08-28 20:21:31', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190828FG7Z8A44X4', 50, '2019-08-28 20:22:52', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190828FKGK0DF614', 50, '2019-08-28 20:29:41', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190828FSTH66FAY8', 50, '2019-08-28 20:45:33', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190829022A38YXKP', 50, '2019-08-29 00:06:15', '2019-08-29 00:06:27', NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('19082903XD76YGTC', 20, '2019-08-29 00:11:44', '2019-08-29 00:12:05', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('19082906Z4PBR968', 20, '2019-08-29 00:20:55', '2019-08-29 00:21:45', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('190829081HY6G91P', 50, '2019-08-29 00:24:11', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('1908290848R4WCBC', 20, '2019-08-29 00:24:28', '2019-08-29 00:24:47', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('19082908GR4GCWSW', 20, '2019-08-29 00:25:42', '2019-08-29 00:26:04', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('190829092XFBGKWH', 20, '2019-08-29 00:27:20', '2019-08-29 00:27:29', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('1908290HGH9AS8ZC', 20, '2019-08-29 00:49:42', '2019-08-29 00:50:00', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('190829F5Z0YKD968', 50, '2019-08-29 19:54:53', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190829F61X4WMAK4', 50, '2019-08-29 19:55:11', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190829F6FTBRA4BC', 50, '2019-08-29 19:56:35', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190829F6NT8B0SFW', 50, '2019-08-29 19:57:07', NULL, NULL, NULL, '2019-08-30 00:49:42', NULL);
INSERT INTO `order_status` VALUES ('190829F7DDGZW280', 20, '2019-08-29 19:59:26', '2019-08-29 20:15:30', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('190830BPTHGSZN54', 10, '2019-08-30 16:27:21', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('190830BW77HM55KP', 20, '2019-08-30 16:37:36', '2019-08-30 16:39:30', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('190830BZ5B5R7KWH', 20, '2019-08-30 16:46:25', '2019-08-30 16:48:36', NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('191215AM5260S894', 40, '2019-12-15 14:57:31', NULL, '2019-12-22 15:48:02', '2019-12-22 15:48:47', NULL, '2019-12-22 17:35:59');
INSERT INTO `order_status` VALUES ('191215AN25128BR4', 10, '2019-12-15 14:59:41', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('191215AY4N9Z679P', 10, '2019-12-15 15:19:21', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('191215AZ9HXM6GF8', 10, '2019-12-15 15:22:51', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('191215B4WGF7TFK4', 10, '2019-12-15 15:39:26', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('191215C1T29N8RWH', 10, '2019-12-15 16:54:22', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('191215C5HYPTS8M8', 10, '2019-12-15 17:05:46', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_status` VALUES ('191215C767GKDAFW', 20, '2019-12-15 17:10:38', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(64) NOT NULL COMMENT '订单主键;同时也是订单编号',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `receiver_name` varchar(32) NOT NULL COMMENT '收货人快照',
  `receiver_mobile` varchar(32) NOT NULL COMMENT '收货人手机号快照',
  `receiver_address` varchar(128) NOT NULL COMMENT '收货地址快照',
  `total_amount` int(11) NOT NULL COMMENT '订单总价格',
  `real_pay_amount` int(11) NOT NULL COMMENT '实际支付总价格',
  `post_amount` int(11) NOT NULL COMMENT '邮费;默认可以为零，代表包邮',
  `pay_method` int(11) NOT NULL COMMENT '支付方式',
  `left_msg` varchar(128) DEFAULT NULL COMMENT '买家留言',
  `extand` varchar(32) DEFAULT NULL COMMENT '扩展字段',
  `is_comment` int(11) NOT NULL COMMENT '买家是否评价;1：已评价，0：未评价',
  `is_delete` int(11) NOT NULL COMMENT '逻辑删除状态;1: 删除 0:未删除',
  `created_time` datetime NOT NULL COMMENT '创建时间（成交时间）',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表;';

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES ('190827F2R9A6ZT2W', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 15000, 15000, 0, 1, '', NULL, 0, 0, '2019-08-27 19:45:16', '2019-08-27 19:45:16');
INSERT INTO `orders` VALUES ('190827F4AK12R30H', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 2, 'abc你好', NULL, 0, 0, '2019-08-27 19:50:07', '2019-08-27 19:50:07');
INSERT INTO `orders` VALUES ('190827H703M977C0', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-27 22:46:09', '2019-08-27 22:46:09');
INSERT INTO `orders` VALUES ('190827H7WD2TCNHH', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 15000, 15000, 0, 1, '', NULL, 0, 0, '2019-08-27 22:48:45', '2019-08-27 22:48:45');
INSERT INTO `orders` VALUES ('190827H87MFB2RAW', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-27 22:49:57', '2019-08-27 22:49:57');
INSERT INTO `orders` VALUES ('190828F6B6FYBXP0', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-28 19:56:11', '2019-08-28 19:56:11');
INSERT INTO `orders` VALUES ('190828FFTCMT6XKP', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-28 20:21:31', '2019-08-28 20:21:31');
INSERT INTO `orders` VALUES ('190828FG7Z8A44X4', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-28 20:22:52', '2019-08-28 20:22:52');
INSERT INTO `orders` VALUES ('190828FKGK0DF614', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-28 20:29:41', '2019-08-28 20:29:41');
INSERT INTO `orders` VALUES ('190828FSTH66FAY8', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-28 20:45:33', '2019-08-28 20:45:33');
INSERT INTO `orders` VALUES ('190829022A38YXKP', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-29 00:06:15', '2019-08-29 00:06:15');
INSERT INTO `orders` VALUES ('19082903XD76YGTC', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-29 00:11:44', '2019-08-29 00:11:44');
INSERT INTO `orders` VALUES ('19082906Z4PBR968', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-29 00:20:55', '2019-08-29 00:20:55');
INSERT INTO `orders` VALUES ('190829081HY6G91P', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-29 00:24:11', '2019-08-29 00:24:11');
INSERT INTO `orders` VALUES ('1908290848R4WCBC', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-29 00:24:28', '2019-08-29 00:24:28');
INSERT INTO `orders` VALUES ('19082908GR4GCWSW', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-29 00:25:42', '2019-08-29 00:25:42');
INSERT INTO `orders` VALUES ('190829092XFBGKWH', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 1, '', NULL, 0, 0, '2019-08-29 00:27:20', '2019-08-29 00:27:20');
INSERT INTO `orders` VALUES ('1908290HGH9AS8ZC', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 2, '', NULL, 0, 0, '2019-08-29 00:49:42', '2019-08-29 00:49:42');
INSERT INTO `orders` VALUES ('190829F5Z0YKD968', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 2, '', NULL, 0, 0, '2019-08-29 19:54:53', '2019-08-29 19:54:53');
INSERT INTO `orders` VALUES ('190829F61X4WMAK4', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 2, '', NULL, 0, 0, '2019-08-29 19:55:11', '2019-08-29 19:55:11');
INSERT INTO `orders` VALUES ('190829F6FTBRA4BC', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 2, '', NULL, 0, 0, '2019-08-29 19:56:35', '2019-08-29 19:56:35');
INSERT INTO `orders` VALUES ('190829F6NT8B0SFW', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 2, '', NULL, 0, 0, '2019-08-29 19:57:07', '2019-08-29 19:57:07');
INSERT INTO `orders` VALUES ('190829F7DDGZW280', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 2, '', NULL, 0, 0, '2019-08-29 19:59:26', '2019-08-29 19:59:26');
INSERT INTO `orders` VALUES ('190830BPTHGSZN54', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 2, '', NULL, 0, 0, '2019-08-30 16:27:21', '2019-08-30 16:27:21');
INSERT INTO `orders` VALUES ('190830BW77HM55KP', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 2, '', NULL, 0, 0, '2019-08-30 16:37:36', '2019-08-30 16:37:36');
INSERT INTO `orders` VALUES ('190830BZ5B5R7KWH', '1908189H7TNWDTXP', 'jack', '13333333333', '北京 北京 东城区 123', 25000, 23000, 0, 2, '', NULL, 0, 0, '2019-08-30 16:46:25', '2019-08-30 16:46:25');
INSERT INTO `orders` VALUES ('191215AM5260S894', '19120779W7TK6800', 'leosanqing', '13000000000', '北京 北京 东城区 阿斯顿发送到', 35600, 32040, 0, 1, '', NULL, 1, 0, '2019-12-15 14:55:17', '2019-12-15 14:55:17');
INSERT INTO `orders` VALUES ('191215AN25128BR4', '19120779W7TK6800', 'leosanqing', '13000000000', '北京 北京 东城区 阿斯顿发送到', 35600, 32040, 0, 1, '', NULL, 0, 0, '2019-12-15 14:57:59', '2019-12-15 14:57:59');
INSERT INTO `orders` VALUES ('191215AY4N9Z679P', '19120779W7TK6800', 'leosanqing', '13000000000', '北京 北京 东城区 阿斯顿发送到', 35600, 32040, 0, 1, '', NULL, 0, 0, '2019-12-15 15:19:16', '2019-12-15 15:19:16');
INSERT INTO `orders` VALUES ('191215AZ9HXM6GF8', '19120779W7TK6800', 'leosanqing', '13000000000', '北京 北京 东城区 阿斯顿发送到', 35600, 32040, 0, 1, '', NULL, 0, 0, '2019-12-15 15:22:48', '2019-12-15 15:22:48');
INSERT INTO `orders` VALUES ('191215B4WGF7TFK4', '19120779W7TK6800', 'leosanqing', '13000000000', '北京 北京 东城区 阿斯顿发送到', 20000, 18000, 0, 1, '', NULL, 0, 0, '2019-12-15 15:39:25', '2019-12-15 15:39:25');
INSERT INTO `orders` VALUES ('191215C1T29N8RWH', '19120779W7TK6800', 'leosanqing', '13000000000', '北京 北京 东城区 阿斯顿发送到', 20000, 18000, 0, 1, '', NULL, 0, 0, '2019-12-15 16:54:19', '2019-12-15 16:54:19');
INSERT INTO `orders` VALUES ('191215C5HYPTS8M8', '19120779W7TK6800', 'leosanqing', '13000000000', '北京 北京 东城区 阿斯顿发送到', 20000, 17600, 0, 1, '', NULL, 0, 0, '2019-12-15 17:05:40', '2019-12-15 17:05:40');
INSERT INTO `orders` VALUES ('191215C767GKDAFW', '19120779W7TK6800', 'leosanqing', '13000000000', '北京 北京 东城区 阿斯顿发送到', 20000, 17600, 0, 1, '', NULL, 0, 0, '2019-12-15 17:10:32', '2019-12-15 17:10:32');
COMMIT;

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1212 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stu
-- ----------------------------
BEGIN;
INSERT INTO `stu` VALUES (1203, 'parent', 19);
INSERT INTO `stu` VALUES (1205, 'parent', 19);
INSERT INTO `stu` VALUES (1209, 'parent', 19);
INSERT INTO `stu` VALUES (1211, 'parent', 19);
COMMIT;

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` varchar(64) NOT NULL COMMENT '地址主键id',
  `user_id` varchar(64) NOT NULL COMMENT '关联用户id',
  `receiver` varchar(32) NOT NULL COMMENT '收件人姓名',
  `mobile` varchar(32) NOT NULL COMMENT '收件人手机号',
  `province` varchar(32) NOT NULL COMMENT '省份',
  `city` varchar(32) NOT NULL COMMENT '城市',
  `district` varchar(32) NOT NULL COMMENT '区县',
  `detail` varchar(128) NOT NULL COMMENT '详细地址',
  `extand` varchar(128) DEFAULT NULL COMMENT '扩展字段',
  `is_default` int(11) DEFAULT NULL COMMENT '是否默认地址',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户地址表 ';

-- ----------------------------
-- Records of user_address
-- ----------------------------
BEGIN;
INSERT INTO `user_address` VALUES ('190825CG3AA14Y3C', '1908189H7TNWDTXP', 'jack', '13333333333', '北京', '北京', '东城区', '123', NULL, 1, '2019-08-25 17:34:14', '2019-08-25 17:34:14');
INSERT INTO `user_address` VALUES ('190825CG4ZCSSWM8', '1908189H7TNWDTXP', 'abc', '13666666666', '北京', '北京', '东城区', '345', NULL, 0, '2019-08-25 17:34:24', '2019-08-25 17:34:24');
INSERT INTO `user_address` VALUES ('1912146TY0A63ANC', '19120779W7TK6800', 'leosanqing', '13000000000', '北京', '北京', '东城区', '阿斯顿发送到', NULL, 1, '2019-12-14 09:36:16', '2019-12-14 09:36:16');
INSERT INTO `user_address` VALUES ('1912146WDRA1A9KP', '19120779W7TK6800', 'pipi', '15320341111', '重庆', '重庆', '渝中区', 'asdfsadfadsasdf ', NULL, 0, '2019-12-14 09:37:57', '2019-12-14 10:29:35');
INSERT INTO `user_address` VALUES ('200917ARD57WAN2W', 'string', 'string', 'string', 'string', '123', 'string', '123', NULL, 1, '2020-09-17 02:05:10', '2020-09-17 02:05:10');
INSERT INTO `user_address` VALUES ('200917ARNYSDP7TC', 'string', 'string', 'string', 'string', '123', 'string', '123', NULL, 0, '2020-09-17 02:05:54', '2020-09-17 02:05:54');
INSERT INTO `user_address` VALUES ('200918BTW8B64G9P', 'string', 'sdfds', '13512125714', 'string', '123', 'string', '123', NULL, 0, '2020-09-18 03:36:26', '2020-09-18 03:36:26');
INSERT INTO `user_address` VALUES ('200918C9Z0GPG0H0', 'string', 'sdfds', '1351212145645714', 'string', '123', 'string', '123', NULL, 0, '2020-09-18 04:18:46', '2020-09-18 04:18:46');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(64) NOT NULL COMMENT '主键id 用户id',
  `username` varchar(32) NOT NULL COMMENT '用户名 用户名',
  `password` varchar(64) NOT NULL COMMENT '密码 密码',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称 昵称',
  `realname` varchar(128) DEFAULT NULL COMMENT '真实姓名',
  `face` varchar(1024) NOT NULL COMMENT '头像',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号 手机号',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱地址 邮箱地址',
  `sex` int(11) DEFAULT NULL COMMENT '性别 性别 1:男  0:女  2:保密',
  `birthday` date DEFAULT NULL,
  `created_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表 ';

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1322792716983078912', 'yiuyfghv', '$2a$12$zJzHPZIbSMQBIagEsTj9OO3/cmlV/vfkOkfQuZATfbTf3k758TPR6', 'yiuyfghv', '', '', '', '', 2, NULL, '2020-11-01 14:48:55', '2020-11-01 14:48:55');
INSERT INTO `users` VALUES ('1322798640569257984', 'aaaa11', '$2a$12$4vfGI4.yATkQ4TgeTiAvi.Dp8Dbg3GX9OfjseJd.QZvLnJnAN.m4C', 'aaaa11', '', '', '', '', 2, NULL, '2020-11-01 15:12:27', '2020-11-01 15:12:27');
INSERT INTO `users` VALUES ('1322800386867728384', '21312312', '$2a$12$qpU7JqR1muHSJMLq/nFwvuz83s.v4tM9dlvSSeqQYGhgTVrR/zJfe', '21312312', '', '', '', '', 2, NULL, '2020-11-01 15:19:23', '2020-11-01 15:19:23');
INSERT INTO `users` VALUES ('1322809624553852928', '1231321', '$2a$12$hccAiS3FZ.BvZ8y28/g3aujB81yOQpuDIMXXbn3NsYLxAzn7a5lUW', '1231321', '', '', '', '', 2, NULL, '2020-11-01 15:56:06', '2020-11-01 15:56:06');
INSERT INTO `users` VALUES ('1322810054398709760', '11111111', '$2a$12$ZL6g/w7bHxpgcxHo3Dgdv.nZhpywcV6JSXjjiItsSO9A8fH9b9Y8C', '11111111', '', '', '', '', 2, NULL, '2020-11-01 15:57:48', '2020-11-01 15:57:48');
INSERT INTO `users` VALUES ('1322897229224087552', 'ssssssss', '$2a$12$GchhU7ZG8d8MIls5J.Vn/evxGQTFRNIZv892CmGTYwdeeJ2h.8T4u', 'ssssssss', '', '', '', '', 2, NULL, '2020-11-01 21:44:12', '2020-11-01 21:44:12');
INSERT INTO `users` VALUES ('1322903468955930624', 'rrrrrr', '$2a$12$dN4cTEexOjxv2ZvvY2dgNO5eJaxLQuLMBXjXyvWPs9zHqvpb/xcZe', 'rrrrrr', '', '', '', '', 2, NULL, '2020-11-01 22:09:00', '2020-11-01 22:09:00');
INSERT INTO `users` VALUES ('1908017YR51G1XWH', 'imooc', 'Qpf0SxOVUjUkWySXOZ16kw==', 'imooc', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAIlFXAAAcIhVPdSg994.png', NULL, NULL, 0, '1900-01-01', '2019-08-14 23:44:30', '2020-08-17 21:31:00');
INSERT INTO `users` VALUES ('190815GTKCBSS7MW', 'test', 'Qpf0SxOVUjUkWySXOZ16kw==', 'test', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAIlFXAAAcIhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2019-08-15 22:11:58', '2019-08-15 22:11:58');
INSERT INTO `users` VALUES ('190816HH9RDPD6Y8', 'abc', 'Qpf0SxOVUjUkWySXOZ16kw==', 'abc', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAIlFXAAAcIhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2019-08-16 23:14:12', '2019-08-16 23:14:12');
INSERT INTO `users` VALUES ('1908189H7TNWDTXP', 'imooc123', 'Qpf0SxOVUjUkWySXOZ16kw==', 'imooc123', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAIlFXAAAcIhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2019-08-18 13:25:30', '2019-08-18 13:25:30');
INSERT INTO `users` VALUES ('190818A4HC2BPDP0', 'test123', 'Qpf0SxOVUjUkWySXOZ16kw==', 'test123', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAIlFXAAAcIhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2019-08-18 14:14:28', '2019-08-18 14:14:28');
INSERT INTO `users` VALUES ('190818AWZ22872FW', '1imooc', 'Qpf0SxOVUjUkWySXOZ16kw==', '1imooc', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAIlFXAAAcIhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2019-08-18 15:15:39', '2019-08-18 15:15:39');
INSERT INTO `users` VALUES ('19120779W7TK6800', 'leosanqing', '$2a$12$H8txhdfsmru49E/F0xn5Ce13RwZVun820mUMpeCKEC/yEJD2cgyWC', 'leosanqing', 'leo', 'http://localhost:8088/img/face-1327842402731298816.jpg?t=20201116143959', '15320341111', '444@qq.com', 2, '2001-01-11', '2020-11-15 13:14:34', '2020-11-16 13:54:56');
INSERT INTO `users` VALUES ('191207C12Y7CZ1GC', 'llll', '4QrcOUm6Wau+VuBX8g+IPg==', 'llll', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2019-12-07 16:52:09', '2019-12-07 16:52:09');
INSERT INTO `users` VALUES ('191207CN85FSPA3C', 'ssss', '4QrcOUm6Wau+VuBX8g+IPg==', 'ssss', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2019-12-07 17:46:46', '2019-12-07 17:46:46');
INSERT INTO `users` VALUES ('200828A0FMXHZ2W0', '200828A0FMXDGGXP', 'dHB9zqg1/Br6XPP3Iqw6jQ==', '200828A0FMXDGGXP', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1899-12-31', '2020-08-28 01:02:16', '2020-08-28 01:02:16');
INSERT INTO `users` VALUES ('200828A20R0H4TTC', '200828A20R0CR8X4', 'dHB9zqg1/Br6XPP3Iqw6jQ==', '200828A20R0CR8X4', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1899-12-31', '2020-08-28 01:06:47', '2020-08-28 01:06:47');
INSERT INTO `users` VALUES ('200828A376Y8SAY8', '200828A376XYGS3C', 'dHB9zqg1/Br6XPP3Iqw6jQ==', '200828A376XYGS3C', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1899-12-31', '2020-08-28 01:10:29', '2020-08-28 01:10:29');
INSERT INTO `users` VALUES ('2009019YWC6FWPX4', '1', '4QrcOUm6Wau+VuBX8g+IPg==', '1', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1899-12-31', '2020-09-01 00:57:19', '2020-09-01 00:57:19');
INSERT INTO `users` VALUES ('200901A1BKWNFFFW', '2', '3veSTjGZvl4YBguz4dVHpw==', '2', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1899-12-31', '2020-09-01 01:04:57', '2020-09-01 01:04:57');
INSERT INTO `users` VALUES ('201101AMZW3KKTXP', 'kljdsalkfjsad', '4QrcOUm6Wau+VuBX8g+IPg==', 'kljdsalkfjsad', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2020-11-01 14:57:44', '2020-11-01 14:57:44');
INSERT INTO `users` VALUES ('201101ANKDDTT828', 'wewqeq12', '4QrcOUm6Wau+VuBX8g+IPg==', 'wewqeq12', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2020-11-01 14:59:37', '2020-11-01 14:59:37');
INSERT INTO `users` VALUES ('201101AP1BFZY7MW', '23242', 'Qpf0SxOVUjUkWySXOZ16kw==', '23242', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2020-11-01 15:00:54', '2020-11-01 15:00:54');
INSERT INTO `users` VALUES ('201101AR8YTK5P94', 'hkjjkhkhkj', 'lueSGJZetyySpUndWjMBEg==', 'hkjjkhkhkj', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2020-11-01 15:04:43', '2020-11-01 15:04:43');
INSERT INTO `users` VALUES ('201101B9BP0AY04H', '324242', 'lueSGJZetyySpUndWjMBEg==', '324242', NULL, 'http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAllFXAAAclhVPdSg994.png', NULL, NULL, 2, '1900-01-01', '2020-11-01 15:53:03', '2020-11-01 15:53:03');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

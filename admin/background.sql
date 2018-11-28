/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : background

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-10-08 10:51:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for  administrator
-- ----------------------------
DROP TABLE IF EXISTS ` administrator`;
CREATE TABLE ` administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of  administrator
-- ----------------------------
INSERT INTO ` administrator` VALUES ('1', 'gqg', 'asdfg123', '2018-09-26 14:35:23');

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) NOT NULL,
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES ('15', '牛油果', '2018-10-01 17:45:12');
INSERT INTO `classify` VALUES ('14', '冠能', '2018-10-01 17:44:32');
INSERT INTO `classify` VALUES ('13', '皇家', '2018-10-01 17:44:27');
INSERT INTO `classify` VALUES ('12', '麻利', '2018-10-01 17:44:21');
INSERT INTO `classify` VALUES ('7', '郭启庚', '2018-10-01 17:43:58');
INSERT INTO `classify` VALUES ('8', '魔卡', '2018-09-27 16:09:26');
INSERT INTO `classify` VALUES ('9', '伯纳天纯', '2018-09-27 16:09:37');
INSERT INTO `classify` VALUES ('10', '荒野盛宴', '2018-09-27 16:09:47');
INSERT INTO `classify` VALUES ('16', '素力高', '2018-10-01 17:45:19');
INSERT INTO `classify` VALUES ('17', '比瑞奇', '2018-10-01 17:45:27');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `sales` varchar(255) NOT NULL,
  `review` varchar(255) DEFAULT NULL,
  `brand` varchar(255) NOT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `hot` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=327 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('3', '中小型犬粮', '../img/shop3.jpg', '529.00', '8.88', '11111', '328', '牛油果', '1', '未发布');
INSERT INTO `goods` VALUES ('4', '中小型成年犬粮', '../img/shop4.jpg', '125.00', '7.63', '17182', '335', '牛油果', '1', '未发布');
INSERT INTO `goods` VALUES ('6', '中小型成年犬粮', '../img/shop6.jpg', '87.30', '13', '15061', '298', '麻利', '1', '发布');
INSERT INTO `goods` VALUES ('7', '中小型成年犬粮', '../img/shop7.jpg', '539.00', '17.97', '14682', '383', '麻利', '1', '发布');
INSERT INTO `goods` VALUES ('8', '中小型成年犬粮', '../img/shop8.jpg', '583.00', '18.22', '13698', '146', '麻利', '1', '发布');
INSERT INTO `goods` VALUES ('9', '中小型成年犬粮', '../img/shop9.jpg', '34.00', '34', '13532', '289', '麻利', '1', '未发布');
INSERT INTO `goods` VALUES ('10', '中小型成年犬粮', '../img/shop10.jpg', '54.00', '16.88', '13467', '553', '麻利', '1', '未发布');
INSERT INTO `goods` VALUES ('11', '中小型成年犬粮', '../img/shop11.jpg', '465.00', '31', '13036', '1067', '麻利', '1', '发布');
INSERT INTO `goods` VALUES ('12', '中小型成年犬粮', '../img/shop12.jpg', '25.00', '50', '12015', '10', '麻利', '1', '发布');
INSERT INTO `goods` VALUES ('13', '中小型成年犬粮', '../img/shop13.jpg', '73.00', '25', '11971', '104', '皇家', '1', '发布');
INSERT INTO `goods` VALUES ('14', '中小型成年犬粮', '../img/shop14.jpg', '107.00', '35.67', '11231', '136', '皇家', '1', '发布');
INSERT INTO `goods` VALUES ('15', '中小型成年犬粮', '../img/shop15.jpg', '419.00', '20.95', '11215', '134', '皇家', '1', '发布');
INSERT INTO `goods` VALUES ('16', '中小型成年犬粮', '../img/shop16.jpg', '531.00', '17.7', '11105', '961', '皇家', '1', '发布');
INSERT INTO `goods` VALUES ('17', '中小型成年犬粮', '../img/shop17.jpg', '552.00', '23', '11205', '437', '皇家', '1', '发布');
INSERT INTO `goods` VALUES ('18', '中小型成年犬粮', '../img/shop18.jpg', '66.00', '33', '11090', '30', '皇家', '1', '未发布');
INSERT INTO `goods` VALUES ('19', '中小型成年犬粮', '../img/shop19.jpg', '93.00', '15.5', '10666', '185', '皇家', '1', '未发布');
INSERT INTO `goods` VALUES ('20', '中小型成年犬粮', '../img/shop20.jpg', '153.00', '19.13', '10439', '273', '冠能 ', '1', '未发布');
INSERT INTO `goods` VALUES ('21', '中小型成年犬粮', '../img/shop21.jpg', '187.00', '20', '10440', '12', '冠能 ', '1', '未发布');
INSERT INTO `goods` VALUES ('22', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '冠能 ', '1', '未发布');
INSERT INTO `goods` VALUES ('23', '中小型成年犬粮', '../img/shop23.jpg', '350.00', '15', '10446', '59', '冠能 ', '1', '未发布');
INSERT INTO `goods` VALUES ('24', '中小型成年犬粮', '../img/shop24.jpg', '456.13', '16.67', '10448', '100', '冠能 ', '1', '未发布');
INSERT INTO `goods` VALUES ('25', '中小型成年犬粮', '../img/shop25.jpg', '123.45', '12.56', '10456', '124', '冠能 ', '1', '未发布');
INSERT INTO `goods` VALUES ('26', '中小型成年犬粮', '../img/shop26.jpg', '145.98', '28.98', '12456', '197', '比瑞吉', '1', '未发布');
INSERT INTO `goods` VALUES ('27', '中小型成年犬粮', '../img/shop27.jpg', '567.89', '39.70', '12487', '237', '比瑞吉', '1', '未发布');
INSERT INTO `goods` VALUES ('28', '中小型成年犬粮', '../img/shop28.jpg', '346.61', '25.79', '12499', '999', '比瑞吉', '1', '未发布');
INSERT INTO `goods` VALUES ('29', '中小型成年犬粮', '../img/shop29.jpg', '871.90', '50.98', '12111', '189', '比瑞吉', '1', '未发布');
INSERT INTO `goods` VALUES ('30', '中小型成年犬粮', '../img/shop30.jpg', '456.00', '34.90', '12467', '888', '比瑞吉', '1', '未发布');
INSERT INTO `goods` VALUES ('31', '中小型成年犬粮', '../img/shop31.jpg', '777.00', '67.90', '15467', '768', '比瑞吉', '1', '发布');
INSERT INTO `goods` VALUES ('32', '中小型成年犬粮', '../img/shop32.jpg', '894.00', '78.00', '14467', '1000', '比瑞吉', '1', '发布');
INSERT INTO `goods` VALUES ('33', '中小型成年犬粮', '../img/shop33.jpg', '99.00', '16.54', '14487', '800', '比瑞吉', '1', '发布');
INSERT INTO `goods` VALUES ('34', '中小型成年犬粮', '../img/shop34.jpg', '100.00', '20.00', '14460', '999', '素力高', '1', '发布');
INSERT INTO `goods` VALUES ('35', '中小型成年犬粮', '../img/shop35.jpg', '178.88', '34.66', '13460', '1111', '素力高', '1', '发布');
INSERT INTO `goods` VALUES ('36', '中小型成年犬粮', '../img/shop36.jpg', '88.88', '16.66', '10460', '1212', '素力高', '1', '发布');
INSERT INTO `goods` VALUES ('37', '中小型成年犬粮', '../img/shop37.jpg', '66.66', '18.88', '10490', '881', '素力高', '1', '发布');
INSERT INTO `goods` VALUES ('38', '中小型成年犬粮', '../img/shop38.jpg', '166.66', '28.68', '12344', '995', '素力高', '1', '发布');
INSERT INTO `goods` VALUES ('39', '中小型成年犬粮', '../img/shop39.jpg', '200.98', '34.00', '12357', '1212', '素力高', '1', '发布');
INSERT INTO `goods` VALUES ('40', '中小型成年犬粮', '../img/shop40.jpg', '666.66', '66.66', '15987', '1400', '素力高', '1', '发布');
INSERT INTO `goods` VALUES ('274', '中小型成年犬粮', '../img/shop1.jpg', '148.30', '9.89', '19628', '237', '素力高', '1', '发布');
INSERT INTO `goods` VALUES ('275', '中小型成年犬粮', '../img/shop2.jpg', '32.60', '12.64', '19030', '848', '素力高', '1', '发布');
INSERT INTO `goods` VALUES ('276', '中小型成年犬粮', '../img/shop3.jpg', '529.00', '17.63', '18475', '328', '卡比', '1', '发布');
INSERT INTO `goods` VALUES ('277', '中小型成年犬粮', '../img/shop4.jpg', '125.00', '7.63', '17182', '335', '卡比', '1', '发布');
INSERT INTO `goods` VALUES ('278', '中小型成年犬粮', '../img/shop5.jpg', '206.00', '34.33', '15805', '610', '卡比', '1', '发布');
INSERT INTO `goods` VALUES ('279', '中小型成年犬粮', '../img/shop6.jpg', '87.30', '10.91', '15061', '298', '卡比', '1', '发布');
INSERT INTO `goods` VALUES ('280', '中小型成年犬粮', '../img/shop7.jpg', '539.00', '17.97', '14682', '383', '卡比', '1', '发布');
INSERT INTO `goods` VALUES ('281', '中小型成年犬粮', '../img/shop8.jpg', '583.00', '18.22', '13698', '146', '卡比', '1', '发布');
INSERT INTO `goods` VALUES ('282', '中小型成年犬粮', '../img/shop9.jpg', '34.00', '34', '13532', '289', '卡比', '1', '发布');
INSERT INTO `goods` VALUES ('283', '中小型成年犬粮', '../img/shop10.jpg', '54.00', '16.88', '13467', '553', '卡比', '1', '发布');
INSERT INTO `goods` VALUES ('284', '中小型成年犬粮', '../img/shop11.jpg', '465.00', '31', '13036', '1067', '卡比', '1', '发布');
INSERT INTO `goods` VALUES ('285', '中小型成年犬粮', '../img/shop12.jpg', '25.00', '50', '12015', '10', '魔卡', '1', '发布');
INSERT INTO `goods` VALUES ('286', '中小型成年犬粮', '../img/shop13.jpg', '73.00', '25', '11971', '104', '魔卡', '1', '未发布');
INSERT INTO `goods` VALUES ('287', '中小型成年犬粮', '../img/shop14.jpg', '107.00', '35.67', '11231', '136', '魔卡', '1', '未发布');
INSERT INTO `goods` VALUES ('288', '中小型成年犬粮', '../img/shop15.jpg', '419.00', '20.95', '11215', '134', '魔卡', '1', '未发布');
INSERT INTO `goods` VALUES ('289', '中小型成年犬粮', '../img/shop16.jpg', '531.00', '17.7', '11105', '961', '魔卡', '1', '未发布');
INSERT INTO `goods` VALUES ('290', '中小型成年犬粮', '../img/shop17.jpg', '552.00', '23', '11205', '437', '魔卡', '1', '未发布');
INSERT INTO `goods` VALUES ('291', '中小型成年犬粮', '../img/shop18.jpg', '66.00', '33', '11090', '30', '魔卡', '1', '未发布');
INSERT INTO `goods` VALUES ('292', '中小型成年犬粮', '../img/shop19.jpg', '93.00', '15.5', '10666', '185', '魔卡', '1', '未发布');
INSERT INTO `goods` VALUES ('293', '中小型成年犬粮', '../img/shop20.jpg', '153.00', '19.13', '10439', '273', '魔卡', '1', '未发布');
INSERT INTO `goods` VALUES ('294', '中小型成年犬粮', '../img/shop21.jpg', '187.00', '20', '10440', '12', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('295', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('296', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('297', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('298', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('299', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('300', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('301', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('302', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('303', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('304', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('305', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('306', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('307', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('308', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('309', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');
INSERT INTO `goods` VALUES ('310', '中小型成年犬粮', '../img/shop22.jpg', '300.00', '21', '10442', '40', '伯纳天纯', '1', '未发布');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `audit` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `reg_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'zhang', '狗剩王九', '男', '184416297', 'asdfg123', '15072497577', '超级管理员', '未审核', '12345678', '2018-10-02 18:59:28');
INSERT INTO `user` VALUES ('3', 'john', '小短腿', '男', '184416297@qq.com', 'asdfg123', '18179930470', '管理员', '未审核', '腿短', '2018-09-30 13:24:46');
INSERT INTO `user` VALUES ('4', 'alice', '妲己宝宝', '女', '184416297@qq.com', 'asdfg123', '13636363636', '管理员', '未审核', '魅惑', '2018-09-30 13:24:57');
INSERT INTO `user` VALUES ('5', 'joe', '火影', '男', '184416297@qq.com', 'asdfg123', '13538752698', '管理员', '未审核', '影分身', '2018-09-30 13:25:04');
INSERT INTO `user` VALUES ('6', 'deng', '后羿', '男', '184416297@qq.com', 'asdfg123', '18078882145', '管理员', '未审核', '大鸟', '2018-09-30 13:25:12');
INSERT INTO `user` VALUES ('7', 'chen', '奶妈', '女', '184416297@qq.com', 'asdfg123', '15213672345', '管理员', '未审核', '弹弹弹', '2018-09-30 13:25:25');
INSERT INTO `user` VALUES ('8', 'ding', '扁鹊', '男', '184416297@qq.com', 'asdfg123', '13598785678', '管理员', '未审核', '毒不死你', '2018-09-30 13:25:32');
INSERT INTO `user` VALUES ('9', 'tan', '凯三刀', '男', '184416297@qq.com', 'asdfg123', '13675354567', '管理员', '未审核', '三刀流', '2018-09-30 13:25:54');
INSERT INTO `user` VALUES ('10', 'zhou', '狗剩', '男', '184416297@qq.com', 'asdfg123', '13866666666', '管理员', '未审核', '荣耀王者', '2018-09-30 13:26:05');
INSERT INTO `user` VALUES ('11', 'lin', '不知火舞', '女', '184416297@qq.com', 'asdfg123', '18177777777', '管理员', '未审核', '日本流氓', '2018-09-30 13:26:16');
INSERT INTO `user` VALUES ('12', 'yang', '娜可露露', '女', '184416297@qq.com', 'asdfg123', '18045456666', '管理员', '未审核', '眼里没有肉', '2018-09-30 13:26:36');
INSERT INTO `user` VALUES ('13', 'zhao', '典韦', '男', '184416297@qq.com', 'asdfg123', '13091371468', '管理员', '未审核', '真伤', '2018-09-30 13:27:01');
INSERT INTO `user` VALUES ('14', 'qian', '守约', '男', '184416297@qq.com', 'asdfg123', '13737373737', '管理员', '未审核', '狙击手', '2018-09-30 13:27:07');
INSERT INTO `user` VALUES ('15', 'song', '关羽', '男', '184416297@qq.com', 'asdfg123', '13765367189', '管理员', '未审核', '赤兔马', '2018-09-30 13:27:19');
INSERT INTO `user` VALUES ('16', 'li', '刘备', '男', '184416297@qq.com', 'asdfg123', '13223457117', '管理员', '未审核', '鸟称', '2018-09-30 13:27:49');
SET FOREIGN_KEY_CHECKS=1;

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : django_blog

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-10-13 14:30:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户', '6', 'add_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户', '6', 'change_user');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户', '6', 'delete_user');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 标签', '7', 'add_tag');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 标签', '7', 'change_tag');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 标签', '7', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 分类', '8', 'add_category');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 分类', '8', 'change_category');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 分类', '8', 'delete_category');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 文章', '9', 'add_article');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 文章', '9', 'change_article');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 文章', '9', 'delete_article');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 评论', '10', 'add_comment');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 评论', '10', 'change_comment');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 评论', '10', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 友情链接', '11', 'add_links');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 友情链接', '11', 'change_links');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 友情链接', '11', 'delete_links');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 广告', '12', 'add_ad');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 广告', '12', 'change_ad');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 广告', '12', 'delete_ad');

-- ----------------------------
-- Table structure for blog_ad
-- ----------------------------
DROP TABLE IF EXISTS `blog_ad`;
CREATE TABLE `blog_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `callback_url` varchar(200) DEFAULT NULL,
  `date_publish` datetime(6) NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_ad
-- ----------------------------
INSERT INTO `blog_ad` VALUES ('1', '超级手机', '超级好用的手机', 'ad/2016/10/a1.jpg', '', '2016-10-10 07:35:05.064882', '999');
INSERT INTO `blog_ad` VALUES ('2', '极致键盘', '做工极致的完美键盘', 'ad/2016/10/a2.jpg', '', '2016-10-10 07:35:45.813790', '999');
INSERT INTO `blog_ad` VALUES ('3', '沉默手机', '沉默务实', 'ad/2016/10/a3.jpg', '', '2016-10-10 07:36:18.917675', '999');
INSERT INTO `blog_ad` VALUES ('4', '苹果2016新款笔记本', '苹果新款笔记本', 'ad/2016/10/a4.jpg', '', '2016-10-10 07:36:55.245537', '999');

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `click_count` int(11) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `date_publish` datetime(6) NOT NULL,
  `category_id` int(11),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_article_b583a629` (`category_id`),
  KEY `blog_article_e8701ad4` (`user_id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_user_id_5beb0cc1_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('1', '修身养性，自己对自己负责', '修身', '修身养性', '6', '1', '2016-10-09 09:23:22.313967', '2', '1');
INSERT INTO `blog_article` VALUES ('2', '富文本编辑器', '功能完善的文本编辑器', '<img src=\"/uploads/kindeditor/2016/10/ae4a7c5c-8e88-11e6-a848-d210071c862a.jpg\" alt=\"\" width=\"200\" height=\"200\" title=\"\" align=\"\" /><img src=\"http://127.0.0.1:8000/static/js/kindeditor-4.1.10/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />身体健康，开开心心最好', '12', '1', '2016-10-09 23:47:25.275443', '3', '1');
INSERT INTO `blog_article` VALUES ('3', '9月锻炼指南', '9月份的绝佳锻炼指导', '每天户外活动一小时，直到微微出汗就可以了', '7', '0', '2016-09-29 01:54:58.484528', '2', '1');
INSERT INTO `blog_article` VALUES ('4', '芹菜香干的做法', '详细介绍芹菜香干的做法', '芹菜香干很好吃', '21', '1', '2016-10-11 03:02:11.952094', '2', '1');
INSERT INTO `blog_article` VALUES ('5', 'javascript未来发展空间', 'javascript未来10年的发展趋势预测', 'javascript作为前端技术的核心之一，最近的发展势头更加迅猛', '0', '0', '2016-10-13 00:06:37.779994', '3', '2');
INSERT INTO `blog_article` VALUES ('6', 'linux的小技巧', '提高linux使用效率的一些小技巧', '12345566678910', '17', '1', '2016-10-13 00:35:19.040521', '3', '2');
INSERT INTO `blog_article` VALUES ('7', 'python-web开发框架比较（一）', '主流的python-web开发框架的比较（一）', '主流的python-web开发框架的比较（一）', '6', '0', '2016-10-13 00:37:31.478471', null, '1');
INSERT INTO `blog_article` VALUES ('8', 'python-web开发框架比较（二）', '主流的python-web开发框架的比较（二）', '主流的python-web开发框架的比较（二）', '6', '0', '2016-10-13 00:38:03.041471', null, '1');
INSERT INTO `blog_article` VALUES ('9', 'python-web开发框架比较（三）', '主流的python-web开发框架的比较（三）', '主流的python-web开发框架的比较（三）', '39', '0', '2016-10-13 00:38:40.656019', null, '1');

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tag_article_id_818e752b_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tag_tag_id_f2afe66b_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tag_article_id_8db2395e_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tag_tag_id_f2afe66b_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES ('7', '1', '5');
INSERT INTO `blog_article_tag` VALUES ('6', '2', '2');
INSERT INTO `blog_article_tag` VALUES ('8', '3', '5');
INSERT INTO `blog_article_tag` VALUES ('5', '4', '5');
INSERT INTO `blog_article_tag` VALUES ('9', '5', '3');
INSERT INTO `blog_article_tag` VALUES ('10', '6', '4');
INSERT INTO `blog_article_tag` VALUES ('11', '7', '2');
INSERT INTO `blog_article_tag` VALUES ('12', '8', '2');
INSERT INTO `blog_article_tag` VALUES ('13', '9', '2');

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('2', '我的生活', '997');
INSERT INTO `blog_category` VALUES ('3', '测试', '998');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `date_publish` datetime(6) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `pid_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(50),
  `url` varchar(100),
  `username` varchar(30),
  PRIMARY KEY (`id`),
  KEY `blog_comment_article_id_3d58bca6_fk_blog_article_id` (`article_id`),
  KEY `blog_comment_pid_id_2a2b4cc4_fk_blog_comment_id` (`pid_id`),
  KEY `blog_comment_user_id_59a54155_fk_blog_user_id` (`user_id`),
  CONSTRAINT `blog_comment_article_id_3d58bca6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_comment_pid_id_2a2b4cc4_fk_blog_comment_id` FOREIGN KEY (`pid_id`) REFERENCES `blog_comment` (`id`),
  CONSTRAINT `blog_comment_user_id_59a54155_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES ('1', '赞一个', '2016-10-11 03:29:20.944338', '3', null, '1', null, null, null);
INSERT INTO `blog_comment` VALUES ('2', '很有用，给你', '2016-10-11 03:29:39.828211', '2', null, '1', null, null, null);
INSERT INTO `blog_comment` VALUES ('3', '看着流口水啊', '2016-10-11 03:30:02.262693', '4', null, '1', null, null, null);
INSERT INTO `blog_comment` VALUES ('4', '9月确实很适合锻炼', '2016-10-11 03:30:33.517480', '3', null, '1', null, null, null);
INSERT INTO `blog_comment` VALUES ('5', '好好好啊', '2016-10-12 00:35:06.354428', '4', null, null, '65778888@qq.com', '', '哈哈');
INSERT INTO `blog_comment` VALUES ('6', '我比较喜欢香干回锅肉', '2016-10-12 06:57:07.172447', '4', null, '2', 'clark@qq.com', 'http://www.clark.com', 'clark');
INSERT INTO `blog_comment` VALUES ('7', '非常实用', '2016-10-13 00:42:15.311115', '9', null, '1', 'admin@qq.com', '', 'admin');
INSERT INTO `blog_comment` VALUES ('8', '很有道理，发人深省', '2016-10-13 01:23:19.094606', '1', null, '1', 'admin@qq.com', '', 'admin');
INSERT INTO `blog_comment` VALUES ('9', '有同感', '2016-10-13 01:24:06.017488', '1', null, null, 'xiaomu@163.com', '', '小牧');
INSERT INTO `blog_comment` VALUES ('10', '非常有用！', '2016-10-13 01:25:30.262500', '6', null, null, 'lala@sohu.com', '', '啦啦');
INSERT INTO `blog_comment` VALUES ('11', '1234567', '2016-10-13 01:43:14.018303', '9', null, '1', 'admin@qq.com', '', 'admin');
INSERT INTO `blog_comment` VALUES ('12', '学到了新东西', '2016-10-13 02:37:32.109963', '8', null, '1', 'admin@qq.com', '', 'admin');
INSERT INTO `blog_comment` VALUES ('13', '总结的很好', '2016-10-13 02:39:51.423104', '8', null, '2', 'clark@qq.com', 'http://www.clark.com', 'clark');
INSERT INTO `blog_comment` VALUES ('14', '1233333333', '2016-10-13 02:53:42.369435', '3', null, null, 'clark@qq.com', 'http://www.clark.com', 'clark');
INSERT INTO `blog_comment` VALUES ('15', '1233333333', '2016-10-13 02:53:43.429495', '3', null, null, 'clark@qq.com', 'http://www.clark.com', 'clarkkkk');
INSERT INTO `blog_comment` VALUES ('16', '11111', '2016-10-13 02:54:15.661537', '9', null, null, 'clark@qq.com', 'http://www.clark.com', 'clark');
INSERT INTO `blog_comment` VALUES ('17', '2333333', '2016-10-13 02:58:35.762703', '4', null, '2', 'clark@qq.com', 'http://www.clark.com', 'clark');
INSERT INTO `blog_comment` VALUES ('18', 'hello', '2016-10-13 02:58:58.797818', '6', null, '2', 'clark@qq.com', 'http://www.clark.com', 'clark');
INSERT INTO `blog_comment` VALUES ('19', 'ok', '2016-10-13 03:02:11.768660', '7', null, '2', 'clark@qq.com', 'http://www.clark.com', 'clark');
INSERT INTO `blog_comment` VALUES ('20', '写的真的很好', '2016-10-13 03:02:48.205943', '7', null, null, 'huhu@qq.com', '', '呼呼');
INSERT INTO `blog_comment` VALUES ('21', '啦啦啦啦啦', '2016-10-13 03:04:35.227853', '2', null, null, 'foxfor@163.com', '', '小妖怪');
INSERT INTO `blog_comment` VALUES ('22', '我是admin', '2016-10-13 03:12:54.482381', '6', null, '1', 'admin@qq.com', '', 'admin');
INSERT INTO `blog_comment` VALUES ('23', 'clark在此', '2016-10-13 03:13:34.206851', '6', null, '2', 'clark@qq.com', 'http://www.clark.com', 'clark');
INSERT INTO `blog_comment` VALUES ('24', '路过打酱油', '2016-10-13 03:14:13.270283', '6', null, null, 'wwwww@qq.com', '', '路人甲');
INSERT INTO `blog_comment` VALUES ('25', '同样', '2016-10-13 03:17:26.662405', '6', '24', null, 'lurenmen@qq.com', '', '路人乙');
INSERT INTO `blog_comment` VALUES ('26', '不错不错', '2016-10-13 03:18:49.448929', '6', '24', '1', 'admin@qq.com', '', 'admin');

-- ----------------------------
-- Table structure for blog_links
-- ----------------------------
DROP TABLE IF EXISTS `blog_links`;
CREATE TABLE `blog_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `callback_url` varchar(200) NOT NULL,
  `date_publish` datetime(6) NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_links
-- ----------------------------
INSERT INTO `blog_links` VALUES ('1', 'django', 'django官方网站', 'https://www.djangoproject.com/', '2016-10-13 00:55:38.781264', '990');
INSERT INTO `blog_links` VALUES ('2', 'flask', 'flask官方网站', 'http://flask.pocoo.org/', '2016-10-13 00:56:18.444925', '991');
INSERT INTO `blog_links` VALUES ('3', 'csdn', '最大的中文程序员社区', 'http://www.csdn.net/', '2016-10-13 01:06:50.949287', '999');
INSERT INTO `blog_links` VALUES ('4', '百度', '最大的中文搜索引擎', 'http://www.baidu.com', '2016-10-13 01:07:53.231237', '999');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('2', 'web开发');
INSERT INTO `blog_tag` VALUES ('3', 'javascript');
INSERT INTO `blog_tag` VALUES ('4', 'linux');
INSERT INTO `blog_tag` VALUES ('5', '修身养性');

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `url` varchar(100),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES ('1', 'pbkdf2_sha256$24000$imijT7FfVdQZ$eGtJLh2l3lHQ+GLKEIwylcJgJBm6S8t24aAI2ayOr+4=', '2016-10-13 03:17:45.813099', '1', 'admin', '兴宇', '李', 'admin@qq.com', '1', '1', '2016-10-09 07:16:07.000000', 'avatar/2016/10/024f78f0f736afc31a149928b119ebc4b7451266.png', '', '', '');
INSERT INTO `blog_user` VALUES ('2', 'pbkdf2_sha256$24000$Zula7lcG7GSS$3stMR/pMhqwJAoxwDqp4A03jbWkSidilZJFgEbC6f3U=', '2016-10-13 03:13:16.871859', '0', 'clark', '', '', 'clark@qq.com', '0', '1', '2016-10-12 06:56:35.000000', 'avatar/2016/10/u8083695243204827354fm23gp0.jpg', '', '13721080817', 'http://www.clark.com');

-- ----------------------------
-- Table structure for blog_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_groups`;
CREATE TABLE `blog_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_user_groups_user_id_9046f296_uniq` (`user_id`,`group_id`),
  KEY `blog_user_groups_group_id_29990e74_fk_auth_group_id` (`group_id`),
  CONSTRAINT `blog_user_groups_group_id_29990e74_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `blog_user_groups_user_id_4e1acb48_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for blog_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_user_permissions`;
CREATE TABLE `blog_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_user_user_permissions_user_id_1d3c1311_uniq` (`user_id`,`permission_id`),
  KEY `blog_user_user_perm_permission_id_95ca6010_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `blog_user_user_perm_permission_id_95ca6010_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `blog_user_user_permissions_user_id_379a1502_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_blog_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2016-10-09 08:51:56.176086', '2', '沧海一粟', '1', 'Added.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2016-10-09 08:54:06.815558', '2', 'clark', '2', 'Changed username.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2016-10-09 08:57:42.071870', '2', 'clark', '2', 'Changed password.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2016-10-09 08:58:34.270856', '2', 'clark', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2016-10-09 09:12:30.430681', '1', 'admin', '2', 'Changed first_name and last_name.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2016-10-09 09:15:53.172277', '1', 'Category object', '1', 'Added.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2016-10-09 09:17:14.344920', '1', 'Category object', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2016-10-09 09:17:24.226485', '2', 'Category object', '1', 'Added.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2016-10-09 09:23:16.991662', '1', '1', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2016-10-09 09:23:22.407972', '1', '修身养性，自己对自己负责', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2016-10-09 23:47:25.393450', '2', '富文本编辑器', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2016-10-10 00:10:58.994958', '1', 'admin', '2', 'Changed avatar.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2016-10-10 01:27:25.510709', '2', '富文本编辑器', '2', 'Changed content.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2016-10-10 01:38:01.370668', '2', '富文本编辑器', '2', 'Changed content.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2016-10-10 02:08:51.297107', '3', '测试', '1', 'Added.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2016-10-10 07:35:05.240892', '1', '超级手机', '1', 'Added.', '12', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2016-10-10 07:35:45.817791', '2', '极致键盘', '1', 'Added.', '12', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2016-10-10 07:36:18.922675', '3', '沉默手机', '1', 'Added.', '12', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2016-10-10 07:36:55.247538', '4', '苹果2016新款笔记本', '1', 'Added.', '12', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2016-10-11 01:54:58.838548', '3', '9月锻炼指南', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2016-10-11 03:02:12.342116', '4', '芹菜香干的做法', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2016-10-11 03:29:20.993341', '1', '1', '1', 'Added.', '10', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2016-10-11 03:29:39.848212', '2', '2', '1', 'Added.', '10', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2016-10-11 03:30:02.272693', '3', '3', '1', 'Added.', '10', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2016-10-11 03:30:33.529481', '4', '4', '1', 'Added.', '10', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2016-10-12 07:04:18.110375', '4', '芹菜香干的做法', '2', 'Changed category.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2016-10-12 07:04:28.221750', '2', '富文本编辑器', '2', 'Changed category.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2016-10-12 07:04:40.629460', '1', '修身养性，自己对自己负责', '2', 'No fields changed.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2016-10-12 07:04:45.341126', '3', '9月锻炼指南', '2', 'No fields changed.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2016-10-12 07:04:49.627371', '2', '富文本编辑器', '2', 'No fields changed.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2016-10-12 08:46:45.227100', '4', '芹菜香干的做法', '2', 'Changed is_recommend.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2016-10-12 08:46:54.990658', '1', '修身养性，自己对自己负责', '2', 'Changed is_recommend.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2016-10-12 08:47:07.058348', '2', '富文本编辑器', '2', 'Changed is_recommend.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2016-10-12 09:56:01.906584', '4', '芹菜香干的做法', '2', 'No fields changed.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2016-10-13 00:02:08.606430', '2', 'web开发', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2016-10-13 00:02:22.710237', '3', 'javascript', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2016-10-13 00:02:31.795756', '4', 'linux', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2016-10-13 00:02:44.856503', '5', '修身养性', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2016-10-13 00:03:11.531426', '4', '芹菜香干的做法', '2', 'Changed tag.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2016-10-13 00:03:19.959908', '2', '富文本编辑器', '2', 'Changed tag.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2016-10-13 00:03:29.133432', '1', '修身养性，自己对自己负责', '2', 'Changed tag.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2016-10-13 00:03:36.146834', '3', '9月锻炼指南', '2', 'Changed tag.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2016-10-13 00:06:37.955004', '5', 'javascript未来发展空间', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2016-10-13 00:35:19.233533', '6', 'linux的小技巧', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2016-10-13 00:36:23.651010', '1', '1', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2016-10-13 00:37:31.539475', '7', '主流的python-web开发框架的比较（一）', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2016-10-13 00:38:03.118475', '8', '主流的python-web开发框架的比较（二）', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2016-10-13 00:38:40.708022', '9', '主流的python-web开发框架的比较（三）', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2016-10-13 00:43:09.417408', '7', 'python-web开发框架比较（一）', '2', 'Changed title.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2016-10-13 00:43:24.152250', '8', 'python-web开发框架比较（二）', '2', 'Changed title.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2016-10-13 00:43:41.586446', '9', 'python-web开发框架比较（三）', '2', 'Changed title.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2016-10-13 00:45:24.348517', '4', '主页', '1', 'Added.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2016-10-13 00:45:34.171678', '2', '我的生活', '2', 'Changed index.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2016-10-13 00:45:45.702338', '3', '测试', '2', 'No fields changed.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2016-10-13 00:45:54.616848', '2', '我的生活', '2', 'Changed index.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2016-10-13 00:47:20.089702', '4', '主页', '2', 'Changed index.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2016-10-13 00:49:18.599463', '4', '主页', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2016-10-13 00:55:38.821266', '1', 'django', '1', 'Added.', '11', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2016-10-13 00:56:18.468926', '2', 'flask', '1', 'Added.', '11', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2016-10-13 01:06:50.986289', '3', 'csdn', '1', 'Added.', '11', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2016-10-13 01:07:53.322242', '4', '百度', '1', 'Added.', '11', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2016-10-13 01:32:57.090169', '1', 'admin', '2', 'Changed avatar.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2016-10-13 02:39:09.667918', '2', 'clark', '2', 'Changed avatar and mobile.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2016-10-13 03:06:25.077118', '1', 'admin', '2', 'Changed password.', '6', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2016-10-13 03:18:04.004140', '25', '25', '2', 'Changed pid.', '10', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2016-10-13 03:19:12.109220', '26', '26', '2', 'Changed pid.', '10', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2016-10-13 03:20:28.573374', '15', '15', '2', 'Changed username.', '10', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('12', 'blog', 'ad');
INSERT INTO `django_content_type` VALUES ('9', 'blog', 'article');
INSERT INTO `django_content_type` VALUES ('8', 'blog', 'category');
INSERT INTO `django_content_type` VALUES ('10', 'blog', 'comment');
INSERT INTO `django_content_type` VALUES ('11', 'blog', 'links');
INSERT INTO `django_content_type` VALUES ('7', 'blog', 'tag');
INSERT INTO `django_content_type` VALUES ('6', 'blog', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2016-10-09 07:15:04.624264');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2016-10-09 07:15:05.489314');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2016-10-09 07:15:11.112635');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2016-10-09 07:15:11.468656');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2016-10-09 07:15:11.492657');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2016-10-09 07:15:11.516658');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2016-10-09 07:15:11.540660');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2016-10-09 07:15:11.847677');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2016-10-09 07:15:11.867679');
INSERT INTO `django_migrations` VALUES ('10', 'blog', '0001_initial', '2016-10-09 07:15:17.589006');
INSERT INTO `django_migrations` VALUES ('11', 'admin', '0001_initial', '2016-10-09 07:15:18.707070');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0002_logentry_remove_auto_add', '2016-10-09 07:15:18.871079');
INSERT INTO `django_migrations` VALUES ('13', 'sessions', '0001_initial', '2016-10-09 07:15:19.338106');
INSERT INTO `django_migrations` VALUES ('14', 'blog', '0002_auto_20161011_1456', '2016-10-11 06:56:27.122126');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1xyveyjbxodzakywaaicet8ydcdzmc04', 'MjNjN2EyMDFjZDhkODI2MzZjMDRmYmNhOThmYTM0MjgxNDQyMDg4Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTRjMDdmOWNkZmVmNWFmMzUyNDJhMDE3NjgxOGZkYzIwYTdlNDBiYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-10-27 03:17:45.819100');

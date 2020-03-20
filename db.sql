/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : tumo

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 20/03/2020 20:34:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '編號',
  `title` varchar(400) DEFAULT NULL COMMENT '標題',
  `cover` varchar(400) DEFAULT NULL COMMENT '封面圖片',
  `author` varchar(100) NOT NULL COMMENT '作者',
  `content` mediumtext COMMENT '內容',
  `content_md` mediumtext COMMENT '內容-Markdown',
  `category` varchar(20) DEFAULT NULL COMMENT '分類',
  `origin` varchar(100) DEFAULT NULL COMMENT '來源',
  `state` varchar(100) NOT NULL COMMENT '狀態',
  `publish_time` datetime DEFAULT NULL COMMENT '發布時間',
  `edit_time` datetime NOT NULL COMMENT '上次修改時間',
  `create_time` datetime NOT NULL COMMENT '創建時間',
  `type` int DEFAULT '0' COMMENT '類型， 0原創 1轉載',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of tb_article
-- ----------------------------
BEGIN;
INSERT INTO `tb_article` VALUES (9, 'llllllllll', 'http://img.api.tycoding.cn/1569140659555.jpeg', 'tycoding', '<p>kkkkkk</p>\n', 'kkkkkk', '1', NULL, '0', '2019-09-22 16:24:22', '2019-09-22 14:58:31', '2019-09-22 14:58:31', 0);
INSERT INTO `tb_article` VALUES (10, 'ggggg', 'http://img.api.tycoding.cn/1569140641446.jpg', 'tycoding', '<p>ssssssss</p>\n', 'ssssssss\n\n', '1', NULL, '1', '2020-03-20 17:09:24', '2019-09-22 14:58:54', '2019-09-22 14:58:54', 0);
INSERT INTO `tb_article` VALUES (11, 'fffffff', '', 'john', '<p>dffff</p>\n', 'dffff', '1', NULL, '1', NULL, '2020-03-20 16:15:14', '2020-03-20 16:15:14', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_article_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_category`;
CREATE TABLE `tb_article_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '編號',
  `article_id` bigint NOT NULL COMMENT '文章ID',
  `category_id` bigint NOT NULL COMMENT '分類ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='文章&&分類關聯表';

-- ----------------------------
-- Records of tb_article_category
-- ----------------------------
BEGIN;
INSERT INTO `tb_article_category` VALUES (19, 11, 1);
INSERT INTO `tb_article_category` VALUES (22, 10, 1);
INSERT INTO `tb_article_category` VALUES (23, 9, 1);
COMMIT;

-- ----------------------------
-- Table structure for tb_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_tag`;
CREATE TABLE `tb_article_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '編號',
  `article_id` bigint NOT NULL COMMENT '文章ID',
  `tag_id` bigint NOT NULL COMMENT '標簽ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='文章&&標簽關聯表';

-- ----------------------------
-- Records of tb_article_tag
-- ----------------------------
BEGIN;
INSERT INTO `tb_article_tag` VALUES (33, 11, 1);
INSERT INTO `tb_article_tag` VALUES (36, 10, 1);
INSERT INTO `tb_article_tag` VALUES (37, 10, 4);
INSERT INTO `tb_article_tag` VALUES (38, 9, 5);
COMMIT;

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '編號',
  `name` varchar(100) DEFAULT NULL COMMENT '分類名稱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分類表';

-- ----------------------------
-- Records of tb_category
-- ----------------------------
BEGIN;
INSERT INTO `tb_category` VALUES (1, '測試');
INSERT INTO `tb_category` VALUES (2, '隨筆');
INSERT INTO `tb_category` VALUES (3, '心情');
INSERT INTO `tb_category` VALUES (4, 'springboot');
COMMIT;

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `p_id` bigint DEFAULT '0' COMMENT '父級ID，給哪個留言進行回覆',
  `c_id` bigint DEFAULT '0' COMMENT '子級ID，給哪個留言下的回覆進行評論',
  `article_title` varchar(200) DEFAULT NULL COMMENT '文章標題',
  `article_id` bigint DEFAULT NULL COMMENT '文章ID',
  `name` varchar(20) DEFAULT NULL COMMENT '昵稱',
  `c_name` varchar(20) DEFAULT NULL COMMENT '給誰留言',
  `time` datetime NOT NULL COMMENT '留言時間',
  `content` text COMMENT '留言內容',
  `email` varchar(100) DEFAULT NULL COMMENT '郵箱',
  `url` varchar(200) DEFAULT NULL COMMENT '網址',
  `sort` bigint DEFAULT '0' COMMENT '分類：0:默認，文章詳情頁，1:友鏈頁，2:關於頁',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `device` varchar(100) DEFAULT NULL COMMENT '設備',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='評論表';

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '編號',
  `name` varchar(100) DEFAULT NULL COMMENT '連接名稱',
  `url` varchar(200) DEFAULT NULL COMMENT '連接URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='友鏈表';

-- ----------------------------
-- Records of tb_link
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '編號',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用戶',
  `operation` varchar(20) DEFAULT NULL COMMENT '操作描述',
  `time` bigint DEFAULT NULL COMMENT '耗時(毫秒)',
  `method` varchar(100) DEFAULT NULL COMMENT '操作方法',
  `params` varchar(255) DEFAULT NULL COMMENT '操作參數',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime DEFAULT NULL COMMENT '操作時間',
  `location` varchar(20) DEFAULT NULL COMMENT '操作地點',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='系統日志表';

-- ----------------------------
-- Records of tb_log
-- ----------------------------
BEGIN;
INSERT INTO `tb_log` VALUES (101, NULL, '新增文章', 0, 'cn.tycoding.system.controller.ArticleController.save()', ' sysArticle\"SysArticle(id=11, title=fffffff, cover=, author=john, content=<p>dff...', '127.0.0.1', '2020-03-20 16:15:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (102, NULL, '更新文章', 1, 'cn.tycoding.system.controller.ArticleController.update()', ' sysArticle\"SysArticle(id=10, title=aaaaa, cover=http://img.api.tycoding.cn/1569...', '127.0.0.1', '2020-03-20 17:08:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (103, NULL, '更新文章', 0, 'cn.tycoding.system.controller.ArticleController.update()', ' sysArticle\"SysArticle(id=10, title=aaaaa, cover=http://img.api.tycoding.cn/1569...', '127.0.0.1', '2020-03-20 17:08:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (104, NULL, '更新文章', 0, 'cn.tycoding.system.controller.ArticleController.update()', ' sysArticle\"SysArticle(id=10, title=ggggg, cover=http://img.api.tycoding.cn/1569...', '127.0.0.1', '2020-03-20 17:09:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (105, NULL, '更新文章', 0, 'cn.tycoding.system.controller.ArticleController.update()', ' sysArticle\"SysArticle(id=9, title=llllllllll, cover=http://img.api.tycoding.cn/...', '127.0.0.1', '2020-03-20 17:10:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (106, NULL, '删除文章', 0, 'cn.tycoding.system.controller.ArticleController.delete()', NULL, '127.0.0.1', '2020-03-20 17:10:22', '内网IP|0|0|内网IP|内网IP');
COMMIT;

-- ----------------------------
-- Table structure for tb_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_login_log`;
CREATE TABLE `tb_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '編號',
  `username` varchar(20) DEFAULT NULL COMMENT '用戶名',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `location` varchar(255) DEFAULT NULL COMMENT '登錄地點',
  `create_time` datetime DEFAULT NULL COMMENT '登錄時間',
  `device` varchar(255) DEFAULT NULL COMMENT '登錄設備',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_login_log
-- ----------------------------
BEGIN;
INSERT INTO `tb_login_log` VALUES (33, 'tycoding', '127.0.0.1', '內網IP|0|0|內網IP|內網IP', '2019-09-22 15:57:29', 'Unknown -- Unknown');
INSERT INTO `tb_login_log` VALUES (34, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 14:35:34', 'Safari -- Mac OS X');
INSERT INTO `tb_login_log` VALUES (35, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 15:39:58', 'Safari -- Mac OS X');
INSERT INTO `tb_login_log` VALUES (36, 'john', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 15:42:46', 'Safari -- Mac OS X');
INSERT INTO `tb_login_log` VALUES (37, 'john', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 16:02:14', 'Chrome 8 -- Mac OS X');
INSERT INTO `tb_login_log` VALUES (38, 'john', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 16:12:56', 'Chrome 8 -- Mac OS X');
INSERT INTO `tb_login_log` VALUES (39, 'john', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 16:41:30', 'Chrome 8 -- Mac OS X');
INSERT INTO `tb_login_log` VALUES (40, 'john', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 16:53:19', 'Chrome 8 -- Mac OS X');
INSERT INTO `tb_login_log` VALUES (41, 'john', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 17:04:46', 'Chrome 8 -- Mac OS X');
INSERT INTO `tb_login_log` VALUES (42, 'john', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 17:24:00', 'Chrome 8 -- Mac OS X');
INSERT INTO `tb_login_log` VALUES (43, 'john', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 19:33:59', 'Chrome 8 -- Mac OS X');
INSERT INTO `tb_login_log` VALUES (44, 'john', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-03-20 19:43:52', 'Chrome 8 -- Mac OS X');
COMMIT;

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '編號',
  `name` varchar(100) DEFAULT NULL COMMENT '標簽名稱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='標簽表';

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
BEGIN;
INSERT INTO `tb_tag` VALUES (1, '隨筆');
INSERT INTO `tb_tag` VALUES (4, '測試');
INSERT INTO `tb_tag` VALUES (5, '博客日志');
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '編號',
  `username` varchar(100) NOT NULL COMMENT '用戶名',
  `password` varchar(100) NOT NULL COMMENT '密碼',
  `salt` varchar(200) NOT NULL COMMENT '鹽值',
  `avatar` varchar(200) DEFAULT NULL COMMENT '頭像',
  `introduce` varchar(100) DEFAULT NULL COMMENT '介紹',
  `remark` varchar(100) DEFAULT NULL COMMENT '備註',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用戶表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES (1, 'john', '5f9059b3feff398c928c7c1239e64975', 'afbe4bd05b55b755d2a3e7df3bc25586', 'http://img.api.tycoding.cn/1568958650973.jpeg', '興趣使然的Coder', '銀河街角，時光路口');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

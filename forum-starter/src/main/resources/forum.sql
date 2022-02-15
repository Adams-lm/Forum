/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : forum-java

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 15/02/2022 17:19:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for forum_article_type
-- ----------------------------
DROP TABLE IF EXISTS `forum_article_type`;
CREATE TABLE `forum_article_type`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `audit_state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '审核状态',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `ref_count` bigint(11) NOT NULL DEFAULT 0 COMMENT '引用统计',
  `scope` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作用域',
  `creator_id` bigint(11) NOT NULL COMMENT '创建人',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_name_state`(`name`, `audit_state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文章类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_article_type
-- ----------------------------
INSERT INTO `forum_article_type` VALUES (1, 'PASS', '活动', '官方活动', 1, 'OFFICIAL', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (2, 'PASS', '公告', '官方公告', 2, 'OFFICIAL', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (3, 'PASS', '前端', '前端', 22, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (4, 'PASS', '后端', '后端', 64, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (5, 'PASS', '小程序', '小程序', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (6, 'PASS', '公众号', '公众号', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (7, 'PASS', 'iOS', 'iOS类别', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (8, 'PASS', 'Android', 'Android类别', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (9, 'PASS', 'AI', 'AI 类别', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (10, 'PASS', '云计算', '云计算 类别', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (11, 'PASS', '游戏', '游戏 类别', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (12, 'PASS', '安全', '安全 类别', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (13, 'PASS', '金融科技', '金融科技 类别', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (14, 'PASS', '区块链', '区块链 类别', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (15, 'PASS', '开源', '开源 类别', 1, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (16, 'PASS', '工具', '工具 类别', 3, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (17, 'PASS', '程序员', '程序员 类别', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (18, 'PASS', '行业', '行业 类别', 0, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_article_type` VALUES (19, 'PASS', '其他', '其他 类别', 10, 'USER', 16, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');

-- ----------------------------
-- Table structure for forum_cache
-- ----------------------------
DROP TABLE IF EXISTS `forum_cache`;
CREATE TABLE `forum_cache`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '缓存键',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '缓存值',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务类型',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缓存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_cache
-- ----------------------------
INSERT INTO `forum_cache` VALUES (1, 'TAG_USED:all_used_tag', '{\"expire\":1644917208244,\"type\":\"TAG_USED\",\"value\":\"[{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" mysql 标签描述\\\",\\\"groupName\\\":\\\"数据库\\\",\\\"id\\\":265,\\\"name\\\":\\\"mysql\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" redis 标签描述\\\",\\\"groupName\\\":\\\"数据库\\\",\\\"id\\\":277,\\\"name\\\":\\\"redis\\\",\\\"refCount\\\":2,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" git 标签描述\\\",\\\"groupName\\\":\\\"开发工具\\\",\\\"id\\\":303,\\\"name\\\":\\\"git\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" docker 标签描述\\\",\\\"groupName\\\":\\\"开发工具\\\",\\\"id\\\":307,\\\"name\\\":\\\"docker\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" java-ee 标签描述\\\",\\\"groupName\\\":\\\"Java 开发\\\",\\\"id\\\":338,\\\"name\\\":\\\"java-ee\\\",\\\"refCount\\\":28,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" spring 标签描述\\\",\\\"groupName\\\":\\\"Java 开发\\\",\\\"id\\\":340,\\\"name\\\":\\\"spring\\\",\\\"refCount\\\":2,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" tomcat 标签描述\\\",\\\"groupName\\\":\\\"Java 开发\\\",\\\"id\\\":343,\\\"name\\\":\\\"tomcat\\\",\\\"refCount\\\":7,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" 搜索引擎 标签描述\\\",\\\"groupName\\\":\\\"搜索\\\",\\\"id\\\":345,\\\"name\\\":\\\"搜索引擎\\\",\\\"refCount\\\":6,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" 中文分词 标签描述\\\",\\\"groupName\\\":\\\"搜索\\\",\\\"id\\\":346,\\\"name\\\":\\\"中文分词\\\",\\\"refCount\\\":6,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" 全文检索 标签描述\\\",\\\"groupName\\\":\\\"搜索\\\",\\\"id\\\":347,\\\"name\\\":\\\"全文检索\\\",\\\"refCount\\\":6,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" lucene 标签描述\\\",\\\"groupName\\\":\\\"搜索\\\",\\\"id\\\":348,\\\"name\\\":\\\"lucene\\\",\\\"refCount\\\":5,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" elasticsearch 标签描述\\\",\\\"groupName\\\":\\\"搜索\\\",\\\"id\\\":352,\\\"name\\\":\\\"elasticsearch\\\",\\\"refCount\\\":6,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" 微信 标签描述\\\",\\\"groupName\\\":\\\"开放平台\\\",\\\"id\\\":354,\\\"name\\\":\\\"微信\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" 微信开放平台 标签描述\\\",\\\"groupName\\\":\\\"开放平台\\\",\\\"id\\\":360,\\\"name\\\":\\\"微信开放平台\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\"读书分享、读书心得、读书笔记\\\",\\\"groupName\\\":\\\"其他\\\",\\\"id\\\":369,\\\"name\\\":\\\"读书\\\",\\\"refCount\\\":4,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\"netty是异步的、事件驱动的网络应用程序框架和工具。\\\",\\\"groupName\\\":\\\"Java 开发\\\",\\\"id\\\":370,\\\"name\\\":\\\"netty\\\",\\\"refCount\\\":2,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\"spring boot开发脚手架\\\",\\\"groupName\\\":\\\"Java 开发\\\",\\\"id\\\":371,\\\"name\\\":\\\"spring boot\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\"ddos分布式拒绝服务攻击\\\",\\\"groupName\\\":\\\"安全\\\",\\\"id\\\":372,\\\"name\\\":\\\"ddos\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\"java虚拟机\\\",\\\"groupName\\\":\\\"Java 开发\\\",\\\"id\\\":375,\\\"name\\\":\\\"jvm\\\",\\\"refCount\\\":11,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\"其他\\\",\\\"groupName\\\":\\\"其他\\\",\\\"id\\\":376,\\\"name\\\":\\\"其他\\\",\\\"refCount\\\":5,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\"rabbitmq消息队列\\\",\\\"groupName\\\":\\\"Java 开发\\\",\\\"id\\\":378,\\\"name\\\":\\\"rabbitmq\\\",\\\"refCount\\\":3,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" java 标签描述\\\",\\\"groupName\\\":\\\"开发语言\\\",\\\"id\\\":188,\\\"name\\\":\\\"java\\\",\\\"refCount\\\":15,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" javascript 标签描述\\\",\\\"groupName\\\":\\\"开发语言\\\",\\\"id\\\":194,\\\"name\\\":\\\"javascript\\\",\\\"refCount\\\":18,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" node.js 标签描述\\\",\\\"groupName\\\":\\\"开发语言\\\",\\\"id\\\":199,\\\"name\\\":\\\"node.js\\\",\\\"refCount\\\":5,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" html 标签描述\\\",\\\"groupName\\\":\\\"前端开发\\\",\\\"id\\\":207,\\\"name\\\":\\\"html\\\",\\\"refCount\\\":3,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" html5 标签描述\\\",\\\"groupName\\\":\\\"前端开发\\\",\\\"id\\\":208,\\\"name\\\":\\\"html5\\\",\\\"refCount\\\":5,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" css 标签描述\\\",\\\"groupName\\\":\\\"前端开发\\\",\\\"id\\\":209,\\\"name\\\":\\\"css\\\",\\\"refCount\\\":2,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" css3 标签描述\\\",\\\"groupName\\\":\\\"前端开发\\\",\\\"id\\\":210,\\\"name\\\":\\\"css3\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" json 标签描述\\\",\\\"groupName\\\":\\\"前端开发\\\",\\\"id\\\":212,\\\"name\\\":\\\"json\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" ajax 标签描述\\\",\\\"groupName\\\":\\\"前端开发\\\",\\\"id\\\":213,\\\"name\\\":\\\"ajax\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" 正则表达式 标签描述\\\",\\\"groupName\\\":\\\"前端开发\\\",\\\"id\\\":214,\\\"name\\\":\\\"正则表达式\\\",\\\"refCount\\\":1,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" angular.js 标签描述\\\",\\\"groupName\\\":\\\"JavaScript 开发\\\",\\\"id\\\":219,\\\"name\\\":\\\"angular.js\\\",\\\"refCount\\\":3,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" vue.js 标签描述\\\",\\\"groupName\\\":\\\"JavaScript 开发\\\",\\\"id\\\":221,\\\"name\\\":\\\"vue.js\\\",\\\"refCount\\\":3,\\\"updateAt\\\":1605009781000},{\\\"auditState\\\":\\\"PASS\\\",\\\"createAt\\\":1605009781000,\\\"creatorId\\\":25,\\\"description\\\":\\\" react.js 标签描述\\\",\\\"groupName\\\":\\\"JavaScript 开发\\\",\\\"id\\\":222,\\\"name\\\":\\\"react.js\\\",\\\"refCount\\\":5,\\\"updateAt\\\":1605009781000}]\"}', 'TAG_USED', 0, '2022-02-15 08:26:50', '2022-02-15 08:26:50');
INSERT INTO `forum_cache` VALUES (14, 'USER_LOGIN_TOKEN:1', '{\"expire\":1645521270923,\"type\":\"USER_LOGIN_TOKEN\",\"value\":\"ee828a1a3a754658b3478ff94dd7e008\"}', 'USER_LOGIN_TOKEN', 0, '2022-02-15 09:14:35', '2022-02-15 09:14:35');
INSERT INTO `forum_cache` VALUES (15, 'USER_LOGIN_TOKEN:ee828a1a3a754658b3478ff94dd7e008', '{\"expire\":1645521270923,\"type\":\"USER_LOGIN_TOKEN\",\"value\":\"{\\\"avatar\\\":\\\"https://sdn.geekzu.org/avatar/1a3bb2d10df88c92716c83875d1e81ee?d=retro\\\",\\\"createAt\\\":1601539201000,\\\"email\\\":\\\"admin@qq.com\\\",\\\"id\\\":1,\\\"lastLoginTime\\\":1644916428046,\\\"nickname\\\":\\\"社区管理员\\\",\\\"password\\\":\\\"bfc722a5fcee2d48e4c5a0d39fc3f991\\\",\\\"role\\\":\\\"ADMIN\\\",\\\"sex\\\":\\\"UNKNOWN\\\",\\\"signature\\\":\\\"技术交流管理员\\\",\\\"source\\\":\\\"REGISTER\\\",\\\"state\\\":\\\"ENABLE\\\",\\\"updateAt\\\":1644942432000}\"}', 'USER_LOGIN_TOKEN', 0, '2022-02-15 09:14:35', '2022-02-15 09:14:35');

-- ----------------------------
-- Table structure for forum_comment
-- ----------------------------
DROP TABLE IF EXISTS `forum_comment`;
CREATE TABLE `forum_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL COMMENT '评论人ID',
  `reply_id` bigint(11) NULL DEFAULT NULL COMMENT '被评论ID',
  `reply_reply_id` bigint(11) NULL DEFAULT NULL COMMENT '二次被评论ID',
  `posts_id` bigint(11) NOT NULL COMMENT '帖子ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uid_pid`(`user_id`, `posts_id`) USING BTREE,
  INDEX `idx_postsid`(`posts_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帖子评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_comment
-- ----------------------------

-- ----------------------------
-- Table structure for forum_config
-- ----------------------------
DROP TABLE IF EXISTS `forum_config`;
CREATE TABLE `forum_config`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
  `name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `start_at` datetime NOT NULL COMMENT '开始时间',
  `end_at` datetime NOT NULL COMMENT '结束时间',
  `creator` bigint(11) NOT NULL COMMENT '创建人ID',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_config
-- ----------------------------

-- ----------------------------
-- Table structure for forum_message
-- ----------------------------
DROP TABLE IF EXISTS `forum_message`;
CREATE TABLE `forum_message`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送渠道',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息类型',
  `read` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否已读',
  `sender_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送人类型',
  `sender` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送人',
  `receiver_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接收人类型',
  `receiver` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接收人',
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送内容类型',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送内容',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sender`(`sender`) USING BTREE,
  INDEX `idx_receiver_type`(`receiver`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_message
-- ----------------------------

-- ----------------------------
-- Table structure for forum_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `forum_opt_log`;
CREATE TABLE `forum_opt_log`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作类型',
  `operator_id` bigint(11) NOT NULL COMMENT '操作人ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作内容',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_operator_id`(`operator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_opt_log
-- ----------------------------
INSERT INTO `forum_opt_log` VALUES (1, 'USER_LOGIN', 1, '{\"email\":\"admin@developers.pub\",\"ip\":\"0:0:0:0:0:0:0:1\",\"password\":\"a66abb5684c45962d887564f08346e8d\",\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36\"}', 0, '2022-02-15 08:27:13', '2022-02-15 08:27:13');
INSERT INTO `forum_opt_log` VALUES (2, 'USER_LOGOUT', 1, '{\"ip\":\"0:0:0:0:0:0:0:1\",\"token\":\"15ef4cd040944542a779a028336c294b\",\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36\"}', 0, '2022-02-15 08:37:13', '2022-02-15 08:37:13');
INSERT INTO `forum_opt_log` VALUES (3, 'USER_LOGIN', 2, '{\"email\":\"superadmin@developers.pub\",\"ip\":\"0:0:0:0:0:0:0:1\",\"password\":\"a66abb5684c45962d887564f08346e8d\",\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36\"}', 0, '2022-02-15 08:38:23', '2022-02-15 08:38:23');
INSERT INTO `forum_opt_log` VALUES (4, 'USER_LOGOUT', 2, '{\"ip\":\"0:0:0:0:0:0:0:1\",\"token\":\"c41616a7a9aa43ff866cfecae169332c\",\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36\"}', 0, '2022-02-15 09:13:39', '2022-02-15 09:13:39');
INSERT INTO `forum_opt_log` VALUES (5, 'USER_LOGIN', 1, '{\"email\":\"admin@developers.pub\",\"ip\":\"0:0:0:0:0:0:0:1\",\"password\":\"a66abb5684c45962d887564f08346e8d\",\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36\"}', 0, '2022-02-15 09:13:48', '2022-02-15 09:13:48');

-- ----------------------------
-- Table structure for forum_posts
-- ----------------------------
DROP TABLE IF EXISTS `forum_posts`;
CREATE TABLE `forum_posts`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `audit_state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '审核状态',
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类别',
  `author_id` bigint(11) NOT NULL COMMENT '作者ID',
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容类型',
  `markdown_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'markdown内容',
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'html内容',
  `views` bigint(11) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `approvals` bigint(11) NOT NULL DEFAULT 0 COMMENT '点赞量/收藏量',
  `comments` bigint(11) NOT NULL DEFAULT 0 COMMENT '评论量',
  `type_id` bigint(11) NOT NULL DEFAULT 0 COMMENT '文章类型ID',
  `head_img` varchar(8192) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文章头图',
  `official` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '官方',
  `top` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '置顶',
  `sort` int(4) NOT NULL DEFAULT 1000 COMMENT '排序',
  `marrow` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '精华',
  `comment_id` bigint(11) NOT NULL COMMENT '问答最佳答案ID',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_author`(`author_id`) USING BTREE,
  INDEX `idx_category_state_views`(`category`, `audit_state`, `views`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帖子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_posts
-- ----------------------------

-- ----------------------------
-- Table structure for forum_search
-- ----------------------------
DROP TABLE IF EXISTS `forum_search`;
CREATE TABLE `forum_search`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
  `entity_id` bigint(11) NOT NULL COMMENT '实体ID',
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type_title`(`type`, `title`(191)) USING BTREE,
  INDEX `idx_type_create`(`type`, `create_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '搜索内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_search
-- ----------------------------

-- ----------------------------
-- Table structure for forum_tag
-- ----------------------------
DROP TABLE IF EXISTS `forum_tag`;
CREATE TABLE `forum_tag`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `audit_state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '审核状态',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属分组',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `ref_count` bigint(11) NOT NULL DEFAULT 0 COMMENT '引用统计',
  `creator_id` bigint(11) NOT NULL COMMENT '创建人',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_name_state`(`name`, `audit_state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 380 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_tag
-- ----------------------------
INSERT INTO `forum_tag` VALUES (188, 'PASS', '开发语言', 'java', ' java 标签描述', 15, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (189, 'PASS', '开发语言', 'c', ' c 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (190, 'PASS', '开发语言', 'c++', ' c++ 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (191, 'PASS', '开发语言', 'php', ' php 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (192, 'PASS', '开发语言', 'perl', ' perl 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (193, 'PASS', '开发语言', 'python', ' python 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (194, 'PASS', '开发语言', 'javascript', ' javascript 标签描述', 18, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (195, 'PASS', '开发语言', 'c#', ' c# 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (196, 'PASS', '开发语言', 'ruby', ' ruby 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (197, 'PASS', '开发语言', 'go', ' go 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (198, 'PASS', '开发语言', 'lua', ' lua 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (199, 'PASS', '开发语言', 'node.js', ' node.js 标签描述', 5, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (200, 'PASS', '开发语言', 'erlang', ' erlang 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (201, 'PASS', '开发语言', 'scala', ' scala 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (202, 'PASS', '开发语言', 'bash', ' bash 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (203, 'PASS', '开发语言', 'actionscript', ' actionscript 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (204, 'PASS', '开发语言', 'golang', ' golang 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (205, 'PASS', '开发语言', 'typescript', ' typescript 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (206, 'PASS', '开发语言', 'flutter', ' flutter 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (207, 'PASS', '前端开发', 'html', ' html 标签描述', 3, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (208, 'PASS', '前端开发', 'html5', ' html5 标签描述', 5, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (209, 'PASS', '前端开发', 'css', ' css 标签描述', 2, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (210, 'PASS', '前端开发', 'css3', ' css3 标签描述', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (211, 'PASS', '前端开发', 'jquery', ' jquery 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (212, 'PASS', '前端开发', 'json', ' json 标签描述', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (213, 'PASS', '前端开发', 'ajax', ' ajax 标签描述', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (214, 'PASS', '前端开发', '正则表达式', ' 正则表达式 标签描述', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (215, 'PASS', '前端开发', 'bootstrap', ' bootstrap 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (216, 'PASS', 'JavaScript 开发', 'chrome', ' chrome 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (217, 'PASS', 'JavaScript 开发', 'firefox', ' firefox 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (218, 'PASS', 'JavaScript 开发', 'internet-explorer', ' internet-explorer 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (219, 'PASS', 'JavaScript 开发', 'angular.js', ' angular.js 标签描述', 3, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (220, 'PASS', 'JavaScript 开发', 'ecmascript', ' ecmascript 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (221, 'PASS', 'JavaScript 开发', 'vue.js', ' vue.js 标签描述', 3, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (222, 'PASS', 'JavaScript 开发', 'react.js', ' react.js 标签描述', 5, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (223, 'PASS', '小程序开发', '小程序', ' 小程序 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (224, 'PASS', '小程序开发', '微信小程序', ' 微信小程序 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (225, 'PASS', '小程序开发', '支付宝小程序', ' 支付宝小程序 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (226, 'PASS', '小程序开发', '百度智能小程序', ' 百度智能小程序 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (227, 'PASS', '小程序开发', '微信开发者工具', ' 微信开发者工具 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (228, 'PASS', '小程序开发', '头条小程序', ' 头条小程序 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (229, 'PASS', '小程序开发', '小程序云开发', ' 小程序云开发 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (230, 'PASS', '小程序开发', 'wepy', ' wepy 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (231, 'PASS', '小程序开发', 'mpvue', ' mpvue 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (232, 'PASS', '小程序开发', 'taro', ' taro 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (233, 'PASS', '小程序开发', 'uni-app', ' uni-app 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (234, 'PASS', '小程序开发', 'mpx', ' mpx 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (235, 'PASS', '区块链', '比特币', ' 比特币 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (236, 'PASS', '区块链', '区块链', ' 区块链 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (237, 'PASS', '区块链', 'ico', ' ico 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (238, 'PASS', '区块链', '智能合约', ' 智能合约 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (239, 'PASS', '区块链', '以太坊', ' 以太坊 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (240, 'PASS', '区块链', '数字化货币', ' 数字化货币 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (241, 'PASS', '人工智能', '人工智能', ' 人工智能 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (242, 'PASS', '人工智能', '自然语言处理', ' 自然语言处理 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (243, 'PASS', '人工智能', '自动驾驶', ' 自动驾驶 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (244, 'PASS', '人工智能', '神经网络', ' 神经网络 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (245, 'PASS', '人工智能', '数据挖掘', ' 数据挖掘 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (246, 'PASS', '人工智能', '机器学习', ' 机器学习 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (247, 'PASS', '人工智能', '深度学习', ' 深度学习 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (248, 'PASS', '人工智能', 'tensorflow', ' tensorflow 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (249, 'PASS', 'iOS 开发', 'ios', ' ios 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (250, 'PASS', 'iOS 开发', 'objective-c', ' objective-c 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (251, 'PASS', 'iOS 开发', 'sqlite', ' sqlite 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (252, 'PASS', 'iOS 开发', 'safari', ' safari 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (253, 'PASS', 'iOS 开发', 'xcode', ' xcode 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (254, 'PASS', 'iOS 开发', 'phonegap', ' phonegap 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (255, 'PASS', 'iOS 开发', 'cocoa', ' cocoa 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (256, 'PASS', 'iOS 开发', 'macos', ' macos 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (257, 'PASS', 'iOS 开发', 'iphone', ' iphone 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (258, 'PASS', 'iOS 开发', 'ipad', ' ipad 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (259, 'PASS', 'iOS 开发', 'swift', ' swift 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (260, 'PASS', 'Android 开发', 'android', ' android 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (261, 'PASS', 'Android 开发', 'eclipse', ' eclipse 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (262, 'PASS', 'Android 开发', 'xml', ' xml 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (263, 'PASS', 'Android 开发', 'webview', ' webview 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (264, 'PASS', 'Android 开发', 'android-studio', ' android-studio 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (265, 'PASS', '数据库', 'mysql', ' mysql 标签描述', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (266, 'PASS', 'PHP 开发', 'apache', ' apache 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (267, 'PASS', 'PHP 开发', 'nginx', ' nginx 标签描述', -2, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (268, 'PASS', 'PHP 开发', 'mvc', ' mvc 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (269, 'PASS', 'PHP 开发', 'symfony', ' symfony 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (270, 'PASS', 'PHP 开发', 'zend-framework', ' zend-framework 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (271, 'PASS', 'PHP 开发', 'composer', ' composer 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (272, 'PASS', 'PHP 开发', 'laravel', ' laravel 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (273, 'PASS', '数据库', '数据库', ' 数据库 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (274, 'PASS', '数据库', 'oracle', ' oracle 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (275, 'PASS', '数据库', 'sql', ' sql 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (276, 'PASS', '数据库', 'nosql', ' nosql 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (277, 'PASS', '数据库', 'redis', ' redis 标签描述', 2, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (278, 'PASS', '数据库', 'mongodb', ' mongodb 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (279, 'PASS', '数据库', 'memcached', ' memcached 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (280, 'PASS', '数据库', 'postgresql', ' postgresql 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (281, 'PASS', '.NET 开发', '.net', ' .net 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (282, 'PASS', '.NET 开发', 'asp.net', ' asp.net 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (283, 'PASS', '.NET 开发', 'visual-studio', ' visual-studio 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (284, 'PASS', '.NET 开发', 'microsoft', ' microsoft 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (285, 'PASS', 'Python 开发', 'List', ' List 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (286, 'PASS', 'Python 开发', 'django', ' django 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (287, 'PASS', 'Python 开发', 'flask', ' flask 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (288, 'PASS', 'Python 开发', 'tornado', ' tornado 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (289, 'PASS', 'Python 开发', 'web.py', ' web.py 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (290, 'PASS', 'Python 开发', 'sqlalchemy', ' sqlalchemy 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (291, 'PASS', 'Python 开发', 'virtualenv', ' virtualenv 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (292, 'PASS', 'Ruby 开发', 'ruby-on-rails', ' ruby-on-rails 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (293, 'PASS', 'Ruby 开发', 'rubygems', ' rubygems 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (294, 'PASS', 'Ruby 开发', 'rvm', ' rvm 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (295, 'PASS', 'Ruby 开发', 'macosx', ' macosx 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (296, 'PASS', 'Ruby 开发', 'bundle', ' bundle 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (297, 'PASS', '开发工具', 'vim', ' vim 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (298, 'PASS', '开发工具', 'emacs', ' emacs 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (299, 'PASS', '开发工具', 'ide', ' ide 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (300, 'PASS', '开发工具', 'intellij-idea', ' intellij-idea 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (301, 'PASS', '开发工具', 'textmate', ' textmate 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (302, 'PASS', '开发工具', 'sublime-text', ' sublime-text 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (303, 'PASS', '开发工具', 'git', ' git 标签描述', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (304, 'PASS', '开发工具', 'github', ' github 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (305, 'PASS', '开发工具', 'svn', ' svn 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (306, 'PASS', '开发工具', 'hg', ' hg 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (307, 'PASS', '开发工具', 'docker', ' docker 标签描述', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (308, 'PASS', '开发工具', 'ci', ' ci 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (309, 'PASS', '云计算', '云计算', ' 云计算 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (310, 'PASS', '云计算', '又拍云存储', ' 又拍云存储 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (311, 'PASS', '云计算', '七牛云存储', ' 七牛云存储 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (312, 'PASS', '云计算', 'amazon-web-services', ' amazon-web-services 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (313, 'PASS', '云计算', '百度云', ' 百度云 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (314, 'PASS', '云计算', '金山云', ' 金山云 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (315, 'PASS', '云计算', '美团云', ' 美团云 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (316, 'PASS', '云计算', '腾讯云', ' 腾讯云 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (317, 'PASS', '云计算', '云杉网络', ' 云杉网络 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (318, 'PASS', '云计算', 'deepflow', ' deepflow 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (319, 'PASS', '云计算', 'ucloud', ' ucloud 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (320, 'PASS', '云计算', '灵雀云', ' 灵雀云 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (321, 'PASS', '云计算', 'alauda', ' alauda 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (322, 'PASS', '大数据', '大数据', ' 大数据 标签描述', -1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (323, 'PASS', '大数据', 'talkingdata', ' talkingdata 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (324, 'PASS', '大数据', '涛思数据', ' 涛思数据 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (325, 'PASS', '大数据', 'kylin', ' kylin 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (326, 'PASS', '大数据', 'flink', ' flink 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (327, 'PASS', '大数据', 'kafka', ' kafka 标签描述', -1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (328, 'PASS', '大数据', 'tdengine', ' tdengine 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (329, 'PASS', '大数据', 'hadoop', ' hadoop 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (330, 'PASS', '大数据', 'spark', ' spark 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (331, 'PASS', '大数据', 'hdfs', ' hdfs 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (332, 'PASS', '大数据', 'mapreduce', ' mapreduce 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (333, 'PASS', '大数据', 'cloudera', ' cloudera 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (334, 'PASS', '大数据', 'hive', ' hive 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (335, 'PASS', '大数据', 'ambari', ' ambari 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (336, 'PASS', '大数据', 'sqoop', ' sqoop 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (337, 'PASS', '大数据', 'zookeeper', ' zookeeper 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (338, 'PASS', 'Java 开发', 'java-ee', ' java-ee 标签描述', 28, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (339, 'PASS', 'Java 开发', 'jar', ' jar 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (340, 'PASS', 'Java 开发', 'spring', ' spring 标签描述', 2, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (341, 'PASS', 'Java 开发', 'hibernate', ' hibernate 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (342, 'PASS', 'Java 开发', 'struts', ' struts 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (343, 'PASS', 'Java 开发', 'tomcat', ' tomcat 标签描述', 7, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (344, 'PASS', 'Java 开发', 'maven', ' maven 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (345, 'PASS', '搜索', '搜索引擎', ' 搜索引擎 标签描述', 6, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (346, 'PASS', '搜索', '中文分词', ' 中文分词 标签描述', 6, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (347, 'PASS', '搜索', '全文检索', ' 全文检索 标签描述', 6, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (348, 'PASS', '搜索', 'lucene', ' lucene 标签描述', 5, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (349, 'PASS', '搜索', 'solr', ' solr 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (350, 'PASS', '搜索', 'sphinx', ' sphinx 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (351, 'PASS', '搜索', 'analyzer', ' analyzer 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (352, 'PASS', '搜索', 'elasticsearch', ' elasticsearch 标签描述', 6, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (353, 'PASS', '搜索', 'elastic', ' elastic 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (354, 'PASS', '开放平台', '微信', ' 微信 标签描述', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (355, 'PASS', '开放平台', '百度', ' 百度 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (356, 'PASS', '开放平台', 'facebook', ' facebook 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (357, 'PASS', '开放平台', 'twitter', ' twitter 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (358, 'PASS', '开放平台', 'paddle', ' paddle 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (359, 'PASS', '开放平台', '微信公众平台', ' 微信公众平台 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (360, 'PASS', '开放平台', '微信开放平台', ' 微信开放平台 标签描述', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (361, 'PASS', '服务器', 'linux', ' linux 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (362, 'PASS', '服务器', 'unix', ' unix 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (363, 'PASS', '服务器', 'ubuntu', ' ubuntu 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (364, 'PASS', '服务器', 'windows-server', ' windows-server 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (365, 'PASS', '服务器', 'centos', ' centos 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (366, 'PASS', '服务器', '负载均衡', ' 负载均衡 标签描述', -2, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (367, 'PASS', '服务器', '缓存', ' 缓存 标签描述', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (368, 'PASS', '开源', '社区', '社区标签描述', -26, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (369, 'PASS', '其他', '读书', '读书分享、读书心得、读书笔记', 4, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (370, 'PASS', 'Java 开发', 'netty', 'netty是异步的、事件驱动的网络应用程序框架和工具。', 2, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (371, 'PASS', 'Java 开发', 'spring boot', 'spring boot开发脚手架', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (372, 'PASS', '安全', 'ddos', 'ddos分布式拒绝服务攻击', 1, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (373, 'PASS', 'Java 开发', 'dubbo', 'dubbo rpc框架', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (374, 'PASS', 'Java 开发', 'spring cloud', 'spring cloud微服务开发框架', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (375, 'PASS', 'Java 开发', 'jvm', 'java虚拟机', 11, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (376, 'PASS', '其他', '其他', '其他', 5, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (377, 'PASS', '开源', '开源', '开源相关', -21, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (378, 'PASS', 'Java 开发', 'rabbitmq', 'rabbitmq消息队列', 3, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');
INSERT INTO `forum_tag` VALUES (379, 'PASS', 'Java 开发', 'rocketmq', 'rocketmq消息队列', 0, 25, 0, '2020-11-10 12:03:01', '2020-11-10 12:03:01');

-- ----------------------------
-- Table structure for forum_tag_posts_mapping
-- ----------------------------
DROP TABLE IF EXISTS `forum_tag_posts_mapping`;
CREATE TABLE `forum_tag_posts_mapping`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` bigint(11) NOT NULL COMMENT '标签ID',
  `posts_id` bigint(11) NOT NULL COMMENT '帖子ID',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_posts_tag`(`posts_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '标签-帖子关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_tag_posts_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for forum_user
-- ----------------------------
DROP TABLE IF EXISTS `forum_user`;
CREATE TABLE `forum_user`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `role` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色',
  `state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `sex` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'REGISTER' COMMENT '来源',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `signature` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '个人简介',
  `ext` blob NULL COMMENT '扩展信息',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_user
-- ----------------------------
INSERT INTO `forum_user` VALUES (1, 'admin@qq.com', '社区管理员', 'bfc722a5fcee2d48e4c5a0d39fc3f991', 'ADMIN', 'ENABLE', 'UNKNOWN', 'REGISTER', 'https://sdn.geekzu.org/avatar/1a3bb2d10df88c92716c83875d1e81ee?d=retro', '技术交流管理员', 0x7B7D, '2022-02-15 09:13:48', 0, '2021-10-01 08:00:01', '2022-02-15 17:14:59');
INSERT INTO `forum_user` VALUES (2, '1@qq.com', '技术交流社区', 'bfc722a5fcee2d48e4c5a0d39fc3f991', 'SUPER_ADMIN', 'ENABLE', 'UNKNOWN', 'REGISTER', 'https://sdn.geekzu.org/avatar/f0144b36290972dc34825f2d2e3f97c5?d=retro', '技术交流社区官方超级管理员', 0x7B7D, '2022-02-15 08:38:23', 0, '2021-10-01 08:00:01', '2022-02-15 17:15:10');

-- ----------------------------
-- Table structure for forum_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `forum_user_follow`;
CREATE TABLE `forum_user_follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `followed` bigint(11) NOT NULL COMMENT '被关注主体',
  `followed_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '被关注主体类型',
  `follower` bigint(11) NOT NULL COMMENT '关注人',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_followed_follower`(`followed`, `followed_type`, `follower`) USING BTREE,
  INDEX `idx_follower`(`follower`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_user_follow
-- ----------------------------

-- ----------------------------
-- Table structure for forum_user_food
-- ----------------------------
DROP TABLE IF EXISTS `forum_user_food`;
CREATE TABLE `forum_user_food`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL COMMENT '用户ID',
  `posts_id` bigint(11) NOT NULL COMMENT '帖子ID',
  `is_delete` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识（0:未删除、1:已删除）',
  `create_at` datetime NOT NULL COMMENT '记录创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_uid_pid`(`user_id`, `posts_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_user_food
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

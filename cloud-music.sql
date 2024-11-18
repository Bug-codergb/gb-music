/*
 Navicat Premium Dump SQL

 Source Server         : NodeMySQL
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : cloud-music

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 18/11/2024 20:58:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `coverUrl` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `publishTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `arId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cateId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `arId_album` (`arId`) USING BTREE,
  KEY `cateId` (`cateId`) USING BTREE,
  CONSTRAINT `arId_album` FOREIGN KEY (`arId`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cateId` FOREIGN KEY (`cateId`) REFERENCES `albumcate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of album
-- ----------------------------
BEGIN;
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1731933673325', 'Lovesick Girls', 'http://localhost:8200/album/cover?id=1731933673325', '2024-11-17', 'BLACKPINK的第一张正专《THE ALBUM》中的主打曲目“Lovesick Girls”在乡村风格的吉他和线上以简洁的旋律引领歌曲的整体氛围，在复古的音效之上添加了BLACKPINK充满力量感的歌声，使歌曲变得激昂。歌曲的最大特色就是歌词中抛出的关于“为何人们明知道会在爱情里受伤痛苦，却依然要寻找下一段爱恋”的真诚发问，第一次由成员Jisoo和Jennie参与了组合歌曲的词曲制作等工作，更增加了粉丝们的期待感。', '1731933499666', '1731933399433', '2024-11-18 20:43:27');
COMMIT;

-- ----------------------------
-- Table structure for albumcate
-- ----------------------------
DROP TABLE IF EXISTS `albumcate`;
CREATE TABLE `albumcate` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of albumcate
-- ----------------------------
BEGIN;
INSERT INTO `albumcate` (`id`, `name`) VALUES ('1731933388618', '华语');
INSERT INTO `albumcate` (`id`, `name`) VALUES ('1731933393502', '欧美');
INSERT INTO `albumcate` (`id`, `name`) VALUES ('1731933399433', '韩国');
INSERT INTO `albumcate` (`id`, `name`) VALUES ('1731933403730', '日本');
INSERT INTO `albumcate` (`id`, `name`) VALUES ('1731933408760', '其他');
COMMIT;

-- ----------------------------
-- Table structure for albumcover
-- ----------------------------
DROP TABLE IF EXISTS `albumcover`;
CREATE TABLE `albumcover` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`alId`) USING BTREE,
  KEY `alId` (`alId`) USING BTREE,
  CONSTRAINT `alId` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of albumcover
-- ----------------------------
BEGIN;
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1731933673341', '1731933673325', '1375301398.jpg', 'image/jpeg', './upload/album/cover', '1731933673338.jpg', 159209, '2024-11-18 20:41:13', '2024-11-18 20:41:13');
COMMIT;

-- ----------------------------
-- Table structure for artist
-- ----------------------------
DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `avatarUrl` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of artist
-- ----------------------------
BEGIN;
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1731933092072', '赵雷', '赵雷这个名字，如今已经被太多人熟记于心。2010年，赵雷抱着玩儿票的心态参加了《快乐男声》，比赛中他坚持唱自己的原创作品和小众音乐，带有鲜明个人特色的赵雷得到了很多人的关注，大家都记住了这个称自己是“必须唱歌的人”的大男孩儿。', 'http://localhost:8200/artist/avatar?id=1731933092072', '1731932957430', '1731933019130');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1731933499666', 'BLACKPINK', 'BLACKPINK（블랙핑크），韩国女子唱跳组合，2016年8月8日由YG Entertainment推出，由金智秀（JISOO）、金珍妮（JENNIE）、朴彩英（ROSÉ）、LISA四名成员组成。组合名“BLACKPINK”在看起来很美的粉色中稍微加入了否定的意义，旨在传达出“不要只看漂亮的部分”、“看到的并不是全部”的意思。2016年8月8日，发行首张单曲专辑《SQUARE ONE》并正式出道，《WHISTLE》在八个音乐网站周排行榜冠军，是首个以出道曲创下该纪录的女团；11月1日，发行第二张单曲专辑《SQUARE TWO》。2017年6月22日，发布单曲《As If It’s Your Last》。2018年6月15日，发行首张迷你专辑《SQUARE UP》；10月25日，发行与杜阿·利帕的合作单曲《Kiss and Make Up》，组合之后凭借该曲成为第一个获得BRIT白银单曲认证的K-Pop组合。2019年4月5日，发行第二张迷你专辑《KILL THIS LOVE》。2020年8月28日，与赛琳娜·戈麦斯合作发行《Ice Cream》，该曲刷新了K-pop女团在Billboard Hot 100的记录；8月30日，凭借《How You Like That》获第37届MTV音乐录影带大奖“夏日歌曲奖”；10月2日，发行第一张正规专辑《THE ALBUM》。2022年9月16日，发行第二张正规专辑《BORN PINK》，凭借此专辑成为登上美国Billboard 200和英国官方专辑排行榜榜首的首位亚洲女艺人；12月5日，被《时代周刊》评选为年度艺人。2023年1月4日，《DDU-DU DDU-DU》MV成为首个突破20亿播放量的K-POP组合MV ；4月15日和22日，出演美国科切拉音乐节，成为首个领衔出演该音乐节的K-pop艺人；8月23日，《THE GIRLS》MV在游戏中公开；8月25日，发行首款官方手游“BLACKPINK THE GAME”的OST《THE GIRLS》。', 'http://localhost:8200/artist/avatar?id=1731933499666', '1731933004617', '1731933030590');
COMMIT;

-- ----------------------------
-- Table structure for artist_cate
-- ----------------------------
DROP TABLE IF EXISTS `artist_cate`;
CREATE TABLE `artist_cate` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of artist_cate
-- ----------------------------
BEGIN;
INSERT INTO `artist_cate` (`id`, `name`) VALUES ('1731932957430', '华语');
INSERT INTO `artist_cate` (`id`, `name`) VALUES ('1731932966444', '欧美');
INSERT INTO `artist_cate` (`id`, `name`) VALUES ('1731932999764', '日本');
INSERT INTO `artist_cate` (`id`, `name`) VALUES ('1731933004617', '韩国');
INSERT INTO `artist_cate` (`id`, `name`) VALUES ('1731933044011', '其他');
COMMIT;

-- ----------------------------
-- Table structure for artist_type
-- ----------------------------
DROP TABLE IF EXISTS `artist_type`;
CREATE TABLE `artist_type` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of artist_type
-- ----------------------------
BEGIN;
INSERT INTO `artist_type` (`id`, `name`) VALUES ('1731933019130', '男歌手');
INSERT INTO `artist_type` (`id`, `name`) VALUES ('1731933024090', '女歌手');
INSERT INTO `artist_type` (`id`, `name`) VALUES ('1731933030590', '乐队组合');
COMMIT;

-- ----------------------------
-- Table structure for artistavatar
-- ----------------------------
DROP TABLE IF EXISTS `artistavatar`;
CREATE TABLE `artistavatar` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `arId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`arId`) USING BTREE,
  KEY `arId` (`arId`) USING BTREE,
  CONSTRAINT `arId` FOREIGN KEY (`arId`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of artistavatar
-- ----------------------------
BEGIN;
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1731933092089', '1731933092072', '40754138.jpg', 'image/jpeg', './upload/artist/avatar', '1731933092086.jpg', 39717, '2024-11-18 20:31:32', '2024-11-18 20:31:32');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1731933499681', '1731933499666', '3859621404.jpg', 'image/jpeg', './upload/artist/avatar', '1731933499679.jpg', 96746, '2024-11-18 20:38:19', '2024-11-18 20:38:19');
COMMIT;

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`userId`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of avatar
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `picUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `vId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` int DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `originalname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `songId` (`songId`) USING BTREE,
  KEY `vId` (`vId`) USING BTREE,
  KEY `alId` (`alId`) USING BTREE,
  CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `banner_ibfk_2` FOREIGN KEY (`vId`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `banner_ibfk_3` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of banner
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `picUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of channel
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for channel_content
-- ----------------------------
DROP TABLE IF EXISTS `channel_content`;
CREATE TABLE `channel_content` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `coverUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `originalname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cId` (`cId`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `channel_content_ibfk_1` FOREIGN KEY (`cId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `channel_content_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of channel_content
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for combo
-- ----------------------------
DROP TABLE IF EXISTS `combo`;
CREATE TABLE `combo` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of combo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `replyId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `vId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`userId`) USING BTREE,
  KEY `songId` (`songId`) USING BTREE,
  KEY `pId` (`pId`) USING BTREE,
  KEY `alId` (`alId`) USING BTREE,
  KEY `vId` (`vId`) USING BTREE,
  KEY `replyId` (`replyId`) USING BTREE,
  KEY `comment_ibfk_6` (`userId`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `comment_ibfk_7` (`mId`) USING BTREE,
  KEY `comment_ibfk_8` (`tId`) USING BTREE,
  KEY `comment_ibfk_9` (`cId`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`vId`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_5` FOREIGN KEY (`replyId`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_7` FOREIGN KEY (`mId`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_8` FOREIGN KEY (`tId`) REFERENCES `toplist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_9` FOREIGN KEY (`cId`) REFERENCES `program` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for fans
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `upId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `upId` (`upId`) USING BTREE,
  CONSTRAINT `fans_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fans_ibfk_2` FOREIGN KEY (`upId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fans
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `songId` (`songId`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of favorite
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `arId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `checkout` int DEFAULT '0',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `vId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ccId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `arId` (`arId`) USING BTREE,
  KEY `alId` (`alId`) USING BTREE,
  KEY `cId` (`cId`) USING BTREE,
  KEY `vId` (`vId`) USING BTREE,
  KEY `pId` (`pId`) USING BTREE,
  KEY `ccId` (`ccId`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`arId`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_4` FOREIGN KEY (`cId`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_5` FOREIGN KEY (`vId`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_6` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_7` FOREIGN KEY (`ccId`) REFERENCES `channel_content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1731933168331', '1621553753077', NULL, 0, '创建了', NULL, NULL, NULL, '1731933168310', NULL, '2024-11-18 20:32:48', '2024-11-18 20:32:48');
COMMIT;

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `originalname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `picUrl` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `songId` (`songId`) USING BTREE,
  KEY `moment_ibfk_3` (`tId`) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_ibfk_2` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_ibfk_3` FOREIGN KEY (`tId`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of moment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `delete` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `cId` (`cId`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`cId`) REFERENCES `combo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for playlist
-- ----------------------------
DROP TABLE IF EXISTS `playlist`;
CREATE TABLE `playlist` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `playCount` int DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coverUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of playlist
-- ----------------------------
BEGIN;
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1731933168310', '抖音流行：一秒心动的超火爆热歌', '火爆全网超好听的流行歌曲。 ', '1621553753077', 0, '2024-11-18 20:32:48', '2024-11-18 20:32:48', 'http://localhost:8200/playlist/cover?id=1731933168310');
COMMIT;

-- ----------------------------
-- Table structure for playlist_cate
-- ----------------------------
DROP TABLE IF EXISTS `playlist_cate`;
CREATE TABLE `playlist_cate` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of playlist_cate
-- ----------------------------
BEGIN;
INSERT INTO `playlist_cate` (`id`, `name`) VALUES ('1731934607132', '华语');
INSERT INTO `playlist_cate` (`id`, `name`) VALUES ('1731934612470', '欧美');
INSERT INTO `playlist_cate` (`id`, `name`) VALUES ('1731934620384', '日语');
INSERT INTO `playlist_cate` (`id`, `name`) VALUES ('1731934629184', '韩语');
INSERT INTO `playlist_cate` (`id`, `name`) VALUES ('1731934633821', '流行');
INSERT INTO `playlist_cate` (`id`, `name`) VALUES ('1731934638335', '摇滚');
INSERT INTO `playlist_cate` (`id`, `name`) VALUES ('1731934643633', '民谣');
INSERT INTO `playlist_cate` (`id`, `name`) VALUES ('1731934648002', '电子');
COMMIT;

-- ----------------------------
-- Table structure for playlist_category
-- ----------------------------
DROP TABLE IF EXISTS `playlist_category`;
CREATE TABLE `playlist_category` (
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cateId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`pId`,`cateId`) USING BTREE,
  KEY `cateId` (`cateId`) USING BTREE,
  CONSTRAINT `playlist_category_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `playlist_category_ibfk_2` FOREIGN KEY (`cateId`) REFERENCES `playlist_cate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of playlist_category
-- ----------------------------
BEGIN;
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1731933168310', '1731934629184');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1731933168310', '1731934633821');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1731933168310', '1731934638335');
COMMIT;

-- ----------------------------
-- Table structure for playlist_cover
-- ----------------------------
DROP TABLE IF EXISTS `playlist_cover`;
CREATE TABLE `playlist_cover` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pId` (`pId`) USING BTREE,
  CONSTRAINT `playlist_cover_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of playlist_cover
-- ----------------------------
BEGIN;
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1731933168331', '1731933168310', '1681961023112_578116791_700.jpg', 'image/jpeg', './upload/playlist/cover', '1731933168329.jpg', 51907, '2024-11-18 20:32:48', '2024-11-18 20:32:48');
COMMIT;

-- ----------------------------
-- Table structure for playlist_song
-- ----------------------------
DROP TABLE IF EXISTS `playlist_song`;
CREATE TABLE `playlist_song` (
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  KEY `pId` (`pId`) USING BTREE,
  KEY `songId` (`songId`) USING BTREE,
  CONSTRAINT `playlist_song_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `playlist_song_ibfk_2` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of playlist_song
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for program
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `playCount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `originalname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `dt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `cId` (`cId`) USING BTREE,
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `program_ibfk_2` FOREIGN KEY (`cId`) REFERENCES `channel_content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of program
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `arId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `publishTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alia` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mp3Url` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lyric` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `vip` int DEFAULT NULL,
  `playCount` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `arId` (`arId`) USING BTREE,
  KEY `alId` (`alId`) USING BTREE,
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`arId`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `song_ibfk_2` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of song
-- ----------------------------
BEGIN;
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1731934537613', 'Lovesick Girls', '1731933499666', '1731933673325', '2024-11-17', '2016年以《SQUARE ONE》出道，逐渐成长为国际艺术家的BLACKPINK于10月2日发行了第一张正式专辑《The Album》。', 'http://localhost:8200/song/source?id=1731934537613', NULL, NULL, '0', '2024-11-18 20:55:37');
COMMIT;

-- ----------------------------
-- Table structure for songsource
-- ----------------------------
DROP TABLE IF EXISTS `songsource`;
CREATE TABLE `songsource` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dt` int DEFAULT NULL,
  PRIMARY KEY (`id`,`songId`) USING BTREE,
  KEY `songId` (`songId`) USING BTREE,
  CONSTRAINT `songId` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of songsource
-- ----------------------------
BEGIN;
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1731934537687', '1731934537613', 'blackpink-lovesick-girls-m-v-128-ytshorts.savetube.me.mp3', 'audio/mpeg', './upload/song', '1731934537662.mp3', 3226221, '2024-11-18 20:55:37', '2024-11-18 20:55:37', 201624);
COMMIT;

-- ----------------------------
-- Table structure for subscriber
-- ----------------------------
DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber` (
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `arId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `vId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  KEY `alId` (`alId`) USING BTREE,
  KEY `arId` (`arId`) USING BTREE,
  KEY `vId` (`vId`) USING BTREE,
  KEY `pId` (`pId`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `subscriber_ibfk_6` (`cId`) USING BTREE,
  CONSTRAINT `subscriber_ibfk_1` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_2` FOREIGN KEY (`arId`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_3` FOREIGN KEY (`vId`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_4` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_6` FOREIGN KEY (`cId`) REFERENCES `channel_content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of subscriber
-- ----------------------------
BEGIN;
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1635575832956');
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1634034840512');
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1634035103223');
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1634035333656');
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1634035609469');
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1634035701805');
COMMIT;

-- ----------------------------
-- Table structure for thumb
-- ----------------------------
DROP TABLE IF EXISTS `thumb`;
CREATE TABLE `thumb` (
  `vId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `commentId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `momentId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  KEY `vId` (`vId`) USING BTREE,
  KEY `commentId` (`commentId`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `thumb_ibfk_4` (`momentId`) USING BTREE,
  CONSTRAINT `thumb_ibfk_1` FOREIGN KEY (`vId`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thumb_ibfk_2` FOREIGN KEY (`commentId`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thumb_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thumb_ibfk_4` FOREIGN KEY (`momentId`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of thumb
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `coverUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `originalname` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of topic
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for toplist
-- ----------------------------
DROP TABLE IF EXISTS `toplist`;
CREATE TABLE `toplist` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coverUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` int DEFAULT '0',
  `playCount` int DEFAULT '0',
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1621553753077',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of toplist
-- ----------------------------
BEGIN;
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1623029817235', '飙升榜', '2021-09-07 09:36:57', '2022-06-06 21:01:13', 'http://localhost:8200/toplist/cover?tId=1623029817235', '一天内热度上升最快的歌曲', 1, 22, '1645620606883');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1623029929854', '新歌榜', '2021-09-07 09:38:49', '2022-11-13 16:11:08', 'http://localhost:8200/toplist/cover?tId=1623029929854', '一个月内发布的新歌', 1, 9, '1645620606883');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1623030010273', '热歌榜', '2021-09-07 09:40:10', '2022-06-06 21:10:08', 'http://localhost:8200/toplist/cover?tId=1623030010273', '一个月内收听的最新歌曲', 1, 4, '1645620606883');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1623030048873', '流行榜', '2021-09-07 09:40:48', '2022-06-06 21:16:15', 'http://localhost:8200/toplist/cover?tId=1623030048873', '一个月内流行歌曲', 1, 12, '1645620606883');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1623150157068', '韩语榜', '2021-09-08 19:02:37', '2022-05-15 20:23:09', 'http://localhost:8200/toplist/cover?tId=1623150157068', '流行韩语歌曲', 0, 1, '1645620606883');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1623150200566', '欧美热歌榜', '2021-09-08 19:03:20', '2022-05-15 20:23:09', 'http://localhost:8200/toplist/cover?tId=1623150200566', '近一个月内欧美热歌', 0, 3, '1645620606883');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1623150255676', '日语榜', '2021-09-08 19:04:15', '2022-05-15 20:23:09', 'http://localhost:8200/toplist/cover?tId=1623150255676', '近一个月内日语歌曲', 0, 0, '1645620606883');
COMMIT;

-- ----------------------------
-- Table structure for toplist_cover
-- ----------------------------
DROP TABLE IF EXISTS `toplist_cover`;
CREATE TABLE `toplist_cover` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mimetype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tId` (`tId`) USING BTREE,
  CONSTRAINT `toplist_cover_ibfk_1` FOREIGN KEY (`tId`) REFERENCES `toplist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of toplist_cover
-- ----------------------------
BEGIN;
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1623029817253', '1623029817235', '飙升榜.svg', './upload/toplist/cover', '1623029817252.svg', 10759, '2021-06-07 09:36:57', '2021-06-07 09:36:57', 'image/svg+xml');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1623029929874', '1623029929854', '新歌榜.svg', './upload/toplist/cover', '1623029929873.svg', 10176, '2021-06-07 09:38:49', '2021-06-07 09:38:49', 'image/svg+xml');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1623030010289', '1623030010273', '热歌榜.svg', './upload/toplist/cover', '1623030010288.svg', 10348, '2021-06-07 09:40:10', '2021-06-07 09:40:10', 'image/svg+xml');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1623030048888', '1623030048873', '流行榜.svg', './upload/toplist/cover', '1623030048887.svg', 8997, '2021-06-07 09:40:48', '2021-06-07 09:40:48', 'image/svg+xml');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1623150157094', '1623150157068', '109951165611550672.jpg', './upload/toplist/cover', '1623150157090.jpg', 14607, '2021-06-08 19:02:37', '2021-06-08 19:02:37', 'image/jpeg');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1623150200582', '1623150200566', '109951165752868980.jpg', './upload/toplist/cover', '1623150200580.jpg', 16040, '2021-06-08 19:03:20', '2021-06-08 19:03:20', 'image/jpeg');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1623150255691', '1623150255676', '109951165611548673.jpg', './upload/toplist/cover', '1623150255690.jpg', 10391, '2021-06-08 19:04:15', '2021-06-08 19:04:15', 'image/jpeg');
COMMIT;

-- ----------------------------
-- Table structure for toplist_song
-- ----------------------------
DROP TABLE IF EXISTS `toplist_song`;
CREATE TABLE `toplist_song` (
  `tId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `diff` int DEFAULT '0',
  KEY `tId` (`tId`) USING BTREE,
  KEY `songId` (`songId`) USING BTREE,
  CONSTRAINT `toplist_song_ibfk_1` FOREIGN KEY (`tId`) REFERENCES `toplist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toplist_song_ibfk_2` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of toplist_song
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatarUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `auth` int DEFAULT '0',
  `expireTime` timestamp NULL DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `manage` int DEFAULT '0',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1621553753077', '叶子', '123', 'http://localhost:8200/user/avatar?id=1621553753077', '2021-08-21 07:35:53', '2023-01-02 16:33:43', 0, NULL, NULL, 1);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1645620606883', 'guobin', '123', 'http://localhost:8200/user/avatar?id=1645620606883', '2022-02-23 20:50:06', '2022-05-15 20:23:12', 0, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for verifyimg
-- ----------------------------
DROP TABLE IF EXISTS `verifyimg`;
CREATE TABLE `verifyimg` (
  `outId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `innerId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `scale` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `picUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`outId`) USING BTREE,
  KEY `innerId` (`innerId`) USING BTREE,
  CONSTRAINT `verifyimg_ibfk_1` FOREIGN KEY (`innerId`) REFERENCES `verifyimg` (`outId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of verifyimg
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `vid` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `coverUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cateId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `playCount` int DEFAULT '0',
  `type` int DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `originalname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT '0',
  `dt` int DEFAULT '0',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`vid`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `cateId` (`cateId`) USING BTREE,
  KEY `video_mv-song` (`songId`) USING BTREE,
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_ibfk_2` FOREIGN KEY (`cateId`) REFERENCES `video_cate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_mv-song` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of video
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for video_cate
-- ----------------------------
DROP TABLE IF EXISTS `video_cate`;
CREATE TABLE `video_cate` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of video_cate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for video_cover
-- ----------------------------
DROP TABLE IF EXISTS `video_cover`;
CREATE TABLE `video_cover` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vid` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dest` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `vid` (`vid`) USING BTREE,
  CONSTRAINT `video_cover_ibfk_1` FOREIGN KEY (`vid`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of video_cover
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

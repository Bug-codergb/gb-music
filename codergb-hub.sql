/*
 Navicat Premium Data Transfer

 Source Server         : NodeMySQL
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : codergb-hub

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 25/01/2023 19:15:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for block
-- ----------------------------
DROP TABLE IF EXISTS `block`;
CREATE TABLE `block`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cate` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of block
-- ----------------------------
INSERT INTO `block` VALUES ('1667028360697', '上传的视频', '1', '每当有视频上传后，此板块就会有显示', '2022-10-29 15:26:00', '2022-11-24 22:05:54');
INSERT INTO `block` VALUES ('1667028411493', '热门上传视频', '1', '每当有视频上传后，此板块就会有显示', '2022-10-29 15:26:51', '2022-11-24 22:05:55');
INSERT INTO `block` VALUES ('1667028433872', '短视频', '1', '每当有短视频上传后，此板块就会有显示', '2022-10-29 15:27:13', '2022-11-24 22:05:58');
INSERT INTO `block` VALUES ('1667028473518', '正在直播', '2', '此板块会在直播期间显示', '2022-10-29 15:27:53', '2022-11-24 22:05:58');
INSERT INTO `block` VALUES ('1667028537659', '过往的直播归档的视频', '2', '此板块会在已归档的直播视频时显示', '2022-10-29 15:28:57', '2022-11-24 22:06:02');
INSERT INTO `block` VALUES ('1667028570849', '即将开始的直播', '2', '此板块会在已安排的直播时显示', '2022-10-29 15:29:30', '2022-11-24 22:06:04');
INSERT INTO `block` VALUES ('1667028637618', '单个播放列表', '3', '', '2022-10-29 15:30:37', '2022-11-24 22:06:05');
INSERT INTO `block` VALUES ('1667028662350', '创建的播放列表', '3', '', '2022-10-29 15:31:02', '2022-11-24 22:06:07');
INSERT INTO `block` VALUES ('1667028677380', '多个播放列表', '3', '', '2022-10-29 15:31:17', '2022-11-24 22:06:09');
INSERT INTO `block` VALUES ('1667028710453', '订阅的频道', '4', '显示您订阅的频道', '2022-10-29 15:31:50', '2022-11-24 22:06:10');
INSERT INTO `block` VALUES ('1667028720735', '精选频道', '4', '', '2022-10-29 15:32:00', '2022-11-24 22:06:12');

-- ----------------------------
-- Table structure for block_content
-- ----------------------------
DROP TABLE IF EXISTS `block_content`;
CREATE TABLE `block_content`  (
  `blockId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `blockId`(`blockId` ASC) USING BTREE,
  INDEX `cId`(`cId` ASC) USING BTREE,
  INDEX `pId`(`pId` ASC) USING BTREE,
  INDEX `vId`(`vId` ASC) USING BTREE,
  CONSTRAINT `block_content_ibfk_1` FOREIGN KEY (`blockId`) REFERENCES `block` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `block_content_ibfk_2` FOREIGN KEY (`cId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `block_content_ibfk_3` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `block_content_ibfk_4` FOREIGN KEY (`vId`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of block_content
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isExplore` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1665897694232', '让他人', '2022-10-16 13:21:34', '2022-10-16 13:21:34', 0);
INSERT INTO `category` VALUES ('1665897699123', '任何人', '2022-10-16 13:21:39', '2022-10-16 13:21:39', 0);
INSERT INTO `category` VALUES ('1665897702064', '温热', '2022-10-16 13:21:42', '2023-01-20 21:24:02', 1);
INSERT INTO `category` VALUES ('1665897705187', '他今天', '2022-10-16 13:21:45', '2022-10-16 13:21:45', 0);
INSERT INTO `category` VALUES ('1665897708367', '微软', '2022-10-16 13:21:48', '2022-10-16 13:21:48', 0);
INSERT INTO `category` VALUES ('1665897712689', '复活复活', '2022-10-16 13:21:52', '2023-01-20 21:23:59', 1);
INSERT INTO `category` VALUES ('1665897715639', '任何一人', '2022-10-16 13:21:55', '2022-10-16 13:21:55', 0);
INSERT INTO `category` VALUES ('1665897719079', '恶气呃', '2022-10-16 13:21:59', '2022-10-16 13:21:59', 0);
INSERT INTO `category` VALUES ('1665897721642', '二哥突然', '2022-10-16 13:22:01', '2022-10-16 13:22:01', 0);
INSERT INTO `category` VALUES ('1665897724379', '儿胡同', '2022-10-16 13:22:04', '2023-01-20 21:23:57', 1);
INSERT INTO `category` VALUES ('1665897728729', '微软4人', '2022-10-16 13:22:08', '2022-10-16 13:22:08', 0);
INSERT INTO `category` VALUES ('1665897747495', '让国人', '2022-10-16 13:22:27', '2022-10-16 13:22:27', 0);
INSERT INTO `category` VALUES ('1665897751639', '请问', '2022-10-16 13:22:31', '2023-01-20 21:23:55', 1);

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alias` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `official` int NULL DEFAULT NULL,
  `trailer` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `featured` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `banner` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES ('1265648948484', 'rwrewr', 'rewr', '1674222431747', 'dewe', 0, NULL, NULL, NULL, '2023-01-25 15:43:33', '2023-01-25 15:43:33');
INSERT INTO `channel` VALUES ('1668927539032', 'vvvvvvvvvvvvvvvvvvvvvvvvvv', 'Jajajaja', '1667300096850', 'gggvvvvvvvvvvvvvvvvvvvvvvvvvvv反反复复烦烦烦烦烦烦烦烦烦烦烦烦额', 0, '1668935663798', '1668925793223', '1669298036342', '2022-11-20 14:59:07', '2022-11-24 21:53:56');
INSERT INTO `channel` VALUES ('1668930069921', '集团年后wife org v', 'sd', '1664789923657', 'rr的地位rr的地位rr的地位rr的地位rr的地位rr的地位rr的地位rr的地位', 0, '1667111868216', '1667117126446', '1674212032510', '2022-11-20 15:41:34', '2023-01-20 18:53:52');
INSERT INTO `channel` VALUES ('1671344573529', 'dsd', 'dsd', '1667726102164', 'sfffewfwefwefewfvv分为氛围分为服务范围', 0, '1672641317970', '1672644074588', '1671344668397', '2022-12-18 14:23:31', '2023-01-02 16:00:00');
INSERT INTO `channel` VALUES ('1764894894852', '2rewrr', '23', '1674222407471', '32', 0, NULL, NULL, '1674632868391', '2023-01-25 15:42:13', '2023-01-25 15:47:48');
INSERT INTO `channel` VALUES ('1804866155566', 'ghgh', 'gbgb', '1674222445348', '45', 0, NULL, NULL, '1674633031409', '2023-01-25 15:42:51', '2023-01-25 15:50:31');
INSERT INTO `channel` VALUES ('4333333333333', '二分', '访问', '1674222418492', 'rw分威风威风', 0, NULL, NULL, NULL, '2023-01-25 15:44:15', '2023-01-25 15:44:15');
INSERT INTO `channel` VALUES ('4353454354555', 'dsfs', 'vvvv', '1674222436007', '34fwfre', 0, NULL, NULL, '1674632956452', '2023-01-25 15:43:14', '2023-01-25 15:49:16');
INSERT INTO `channel` VALUES ('5656565656566', 'dadad', 'sdsadsa', '1674222425812', 'tjtjytjytjyt', 0, NULL, NULL, NULL, '2023-01-25 15:43:55', '2023-01-25 15:43:55');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  INDEX `collection_userId_fk`(`userId` ASC) USING BTREE,
  CONSTRAINT `collection_userId_fk` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('1674263667533', '343434', '1674200230627', '从v地方v地方v地方v', '1674222407471', '2023-01-21 09:14:27', '2023-01-25 18:53:27');
INSERT INTO `collection` VALUES ('1674547615747', 'edewdewdewdewde', '1674200031043', 'wfwfwef', '1667726102164', '2023-01-24 16:06:55', '2023-01-25 17:29:51');
INSERT INTO `collection` VALUES ('1674547795680', 'ewwedvfffffffff', '1674200031043', 'ffwfw', '1667726102164', '2023-01-24 16:09:55', '2023-01-25 17:29:52');
INSERT INTO `collection` VALUES ('1674562409747', 'vvvvvv', '1674200031043', 'sdfsfsdfs', '1667726102164', '2023-01-24 20:13:29', '2023-01-25 17:29:54');
INSERT INTO `collection` VALUES ('1674630095160', 'viojgvrjgtiojti', '1674630093543', 'fsfsdf', '1674222445348', '2023-01-25 15:01:35', '2023-01-25 17:29:54');
INSERT INTO `collection` VALUES ('1674630510128', 'wfwefwfwfewfefw', '1674630509000', 'fsfsf', '1674222445348', '2023-01-25 15:08:30', '2023-01-25 17:29:55');
INSERT INTO `collection` VALUES ('1674630630976', '10', '1674630630042', 'sfsdfds', '1674222445348', '2023-01-25 15:10:30', '2023-01-25 17:29:56');
INSERT INTO `collection` VALUES ('1674630645488', '100', '1674630643203', 'fsfdsf', '1674222445348', '2023-01-25 15:10:45', '2023-01-25 17:29:57');
INSERT INTO `collection` VALUES ('1674633193451', 'RELEASED', '1674633192562', 'sfsdf', '1674222407471', '2023-01-25 15:53:13', '2023-01-25 17:29:57');
INSERT INTO `collection` VALUES ('1674633216393', 'he Hit List', '1674633215445', 'fsdfds', '1674222407471', '2023-01-25 15:53:36', '2023-01-25 17:29:58');
INSERT INTO `collection` VALUES ('1674633250985', 'J-Hits!', '1674633250137', 'fsfsd', '1674222407471', '2023-01-25 15:54:10', '2023-01-25 17:29:59');
INSERT INTO `collection` VALUES ('1674633275394', '日本乐坛迅速走红的热门金曲', '1674633274497', 'fsfsdf', '1674222407471', '2023-01-25 15:54:35', '2023-01-25 17:29:59');
INSERT INTO `collection` VALUES ('1674633304286', '流行金曲', '1674633303233', 'fsfsf', '1674222407471', '2023-01-25 15:55:04', '2023-01-25 17:30:00');
INSERT INTO `collection` VALUES ('1674633329548', '2010 年代日本音乐', '1674633328551', 'fsfdsf', '1674222407471', '2023-01-25 15:55:29', '2023-01-25 17:30:02');
INSERT INTO `collection` VALUES ('1674639079702', 'vvvdfvfdvfdvfdvvvvv', '1674200031043', 'rfeferferfrefrefrfreferf', '1667726102164', '2023-01-25 17:31:19', '2023-01-25 17:31:19');
INSERT INTO `collection` VALUES ('1674639325321', '分为氛围分为氛围服务g人格', '1674639324028', 'f违法的全球恶的访问肥肉reregister', '1674222407471', '2023-01-25 17:35:25', '2023-01-25 17:35:25');
INSERT INTO `collection` VALUES ('1674640100096', '人纷纷热纷纷乳房非人非任飞', '1674640099289', '风热风热风热', '1674222407471', '2023-01-25 17:48:20', '2023-01-25 17:48:20');
INSERT INTO `collection` VALUES ('1674640113382', 'vrtgrttrhr wdwed', '1674640112507', 'fewfwefwf', '1674222407471', '2023-01-25 17:48:33', '2023-01-25 17:48:33');

-- ----------------------------
-- Table structure for collection_video
-- ----------------------------
DROP TABLE IF EXISTS `collection_video`;
CREATE TABLE `collection_video`  (
  `cId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sort` int NOT NULL,
  PRIMARY KEY (`cId`, `vId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection_video
-- ----------------------------
INSERT INTO `collection_video` VALUES ('1674630630976', '1674204298817', 1);
INSERT INTO `collection_video` VALUES ('1674630630976', '1674211881903', 1);
INSERT INTO `collection_video` VALUES ('1674630630976', '1674212180782', 1);
INSERT INTO `collection_video` VALUES ('1674630630976', '1674212309138', 12);
INSERT INTO `collection_video` VALUES ('1674630645488', '1674212309138', 2);
INSERT INTO `collection_video` VALUES ('1674630645488', '1674212417900', 12);
INSERT INTO `collection_video` VALUES ('1674630645488', '1674212598117', 12);
INSERT INTO `collection_video` VALUES ('1674633193451', '1674200195530', 12);
INSERT INTO `collection_video` VALUES ('1674633193451', '1674200319056', 12);
INSERT INTO `collection_video` VALUES ('1674633193451', '1674204125033', 12);
INSERT INTO `collection_video` VALUES ('1674633193451', '1674204298817', 12);
INSERT INTO `collection_video` VALUES ('1674633193451', '1674211881903', 12);
INSERT INTO `collection_video` VALUES ('1674633193451', '1674212180782', 12);
INSERT INTO `collection_video` VALUES ('1674633193451', '1674212309138', 12);
INSERT INTO `collection_video` VALUES ('1674633193451', '1674212417900', 12);
INSERT INTO `collection_video` VALUES ('1674633193451', '1674212598117', 12);
INSERT INTO `collection_video` VALUES ('1674633216393', '1674200195530', 12);
INSERT INTO `collection_video` VALUES ('1674633216393', '1674200319056', 12);
INSERT INTO `collection_video` VALUES ('1674633216393', '1674204125033', 12);
INSERT INTO `collection_video` VALUES ('1674633216393', '1674204298817', 12);
INSERT INTO `collection_video` VALUES ('1674633216393', '1674211881903', 12);
INSERT INTO `collection_video` VALUES ('1674633216393', '1674212180782', 12);
INSERT INTO `collection_video` VALUES ('1674633216393', '1674212309138', 12);
INSERT INTO `collection_video` VALUES ('1674633216393', '1674212417900', 12);
INSERT INTO `collection_video` VALUES ('1674633216393', '1674212598117', 12);
INSERT INTO `collection_video` VALUES ('1674633250985', '1674200195530', 12);
INSERT INTO `collection_video` VALUES ('1674633250985', '1674200319056', 12);
INSERT INTO `collection_video` VALUES ('1674633250985', '1674204125033', 12);
INSERT INTO `collection_video` VALUES ('1674633250985', '1674204298817', 12);
INSERT INTO `collection_video` VALUES ('1674633250985', '1674211881903', 12);
INSERT INTO `collection_video` VALUES ('1674633250985', '1674212180782', 12);
INSERT INTO `collection_video` VALUES ('1674633250985', '1674212309138', 12);
INSERT INTO `collection_video` VALUES ('1674633250985', '1674212417900', 12);
INSERT INTO `collection_video` VALUES ('1674633250985', '1674212598117', 12);
INSERT INTO `collection_video` VALUES ('1674633275394', '1674200195530', 12);
INSERT INTO `collection_video` VALUES ('1674633275394', '1674200319056', 12);
INSERT INTO `collection_video` VALUES ('1674633275394', '1674204125033', 12);
INSERT INTO `collection_video` VALUES ('1674633275394', '1674204298817', 12);
INSERT INTO `collection_video` VALUES ('1674633275394', '1674211881903', 12);
INSERT INTO `collection_video` VALUES ('1674633275394', '1674212180782', 12);
INSERT INTO `collection_video` VALUES ('1674633275394', '1674212309138', 12);
INSERT INTO `collection_video` VALUES ('1674633275394', '1674212417900', 12);
INSERT INTO `collection_video` VALUES ('1674633275394', '1674212598117', 12);
INSERT INTO `collection_video` VALUES ('1674633304286', '1674200195530', 12);
INSERT INTO `collection_video` VALUES ('1674633304286', '1674200319056', 12);
INSERT INTO `collection_video` VALUES ('1674633304286', '1674204125033', 12);
INSERT INTO `collection_video` VALUES ('1674633304286', '1674204298817', 12);
INSERT INTO `collection_video` VALUES ('1674633304286', '1674211881903', 12);
INSERT INTO `collection_video` VALUES ('1674633304286', '1674212180782', 12);
INSERT INTO `collection_video` VALUES ('1674633304286', '1674212309138', 12);
INSERT INTO `collection_video` VALUES ('1674633304286', '1674212417900', 12);
INSERT INTO `collection_video` VALUES ('1674633304286', '1674212598117', 12);
INSERT INTO `collection_video` VALUES ('1674633329548', '1674200195530', 12);
INSERT INTO `collection_video` VALUES ('1674633329548', '1674200319056', 12);
INSERT INTO `collection_video` VALUES ('1674633329548', '1674204125033', 12);
INSERT INTO `collection_video` VALUES ('1674633329548', '1674204298817', 12);
INSERT INTO `collection_video` VALUES ('1674633329548', '1674211881903', 12);
INSERT INTO `collection_video` VALUES ('1674633329548', '1674212180782', 12);
INSERT INTO `collection_video` VALUES ('1674633329548', '1674212309138', 12);
INSERT INTO `collection_video` VALUES ('1674633329548', '1674212417900', 12);
INSERT INTO `collection_video` VALUES ('1674633329548', '1674212598117', 12);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `replyId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `vId`(`vId` ASC) USING BTREE,
  INDEX `replyId`(`replyId` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`vId`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`replyId`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1674218819053', '2323', '1667300096850', '1674199982940', NULL, '2023-01-20 20:46:59', '2023-01-20 20:46:59');
INSERT INTO `comment` VALUES ('1674219322162', 'rwrwrwrwererwr', '1667300096850', '1674200046723', NULL, '2023-01-20 20:55:22', '2023-01-20 20:55:22');

-- ----------------------------
-- Table structure for dm
-- ----------------------------
DROP TABLE IF EXISTS `dm`;
CREATE TABLE `dm`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vId`(`vId` ASC) USING BTREE,
  CONSTRAINT `dm_ibfk_1` FOREIGN KEY (`vId`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dm
-- ----------------------------
INSERT INTO `dm` VALUES ('1674219397179', 'ddasd', '01:16', '1674211881903', '1667300096850', '2023-01-20 20:56:37', '2023-01-20 20:56:37');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `picUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vioUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1674199935054', 'http://localhost:8888/image/1674199935054', NULL, '1.jpg', 'image/jpeg', './upload/image', '1674199935053.jpg', 119804, '2023-01-20 15:32:15', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674199926446', NULL, 'http://localhost:8888/video/cc44ce47a59d39148516e9469e978e48.m3u8', '775996062-1-208.mp4', NULL, './upload/video/', 'cc44ce47a59d39148516e9469e978e48.m3u8', NULL, '2023-01-20 15:32:59', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674200031043', 'http://localhost:8888/image/1674200031043', NULL, '3.webp', 'image/webp', './upload/image', '1674200031039.webp', 85024, '2023-01-20 15:33:51', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674200016544', NULL, 'http://localhost:8888/video/0f5b2584adef633b42b8a973a3732771.m3u8', 'videoplayback.mp4', NULL, './upload/video/', '0f5b2584adef633b42b8a973a3732771.m3u8', NULL, '2023-01-20 15:34:03', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674200106101', 'http://localhost:8888/image/1674200106101', NULL, '1670486044628_539539601_200.jpg', 'image/jpeg', './upload/image', '1674200106099.jpg', 50409, '2023-01-20 15:35:06', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674200091290', NULL, 'http://localhost:8888/video/88cc0b9f0170cf0d03dc806a3769d3f7.m3u8', 'time after time.mp4', NULL, './upload/video/', '88cc0b9f0170cf0d03dc806a3769d3f7.m3u8', NULL, '2023-01-20 15:36:31', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674200230627', 'http://localhost:8888/image/1674200230627', NULL, '3183845842.jpg', 'image/jpeg', './upload/image', '1674200230626.jpg', 73184, '2023-01-20 15:37:10', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674200214358', NULL, 'http://localhost:8888/video/88cc0b9f0170cf0d03dc806a3769d3f7.m3u8', 'time after time.mp4', NULL, './upload/video/', '88cc0b9f0170cf0d03dc806a3769d3f7.m3u8', NULL, '2023-01-20 15:38:36', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674204052794', 'http://localhost:8888/image/1674204052794', NULL, '3648126291.jpg', 'image/jpeg', './upload/image', '1674204052792.jpg', 106867, '2023-01-20 16:40:52', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674204032369', NULL, 'http://localhost:8888/video/c1d457b7cce2bd3f492232cd2b2a0aa9.m3u8', '怪盗基德.mp4', NULL, './upload/video/', 'c1d457b7cce2bd3f492232cd2b2a0aa9.m3u8', NULL, '2023-01-20 16:42:03', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674204262747', 'http://localhost:8888/image/1674204262747', NULL, 'd82a28f5cacc1ed1b49af75b3c11fc8f95cf83d4.jpg', 'image/jpeg', './upload/image', '1674204262742.jpg', 106498, '2023-01-20 16:44:22', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674204241693', NULL, 'http://localhost:8888/video/cc44ce47a59d39148516e9469e978e48.m3u8', '775996062-1-208.mp4', NULL, './upload/video/', 'cc44ce47a59d39148516e9469e978e48.m3u8', NULL, '2023-01-20 16:44:57', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674211850134', NULL, 'http://localhost:8888/video/d774d2468c81a72607d7cf6e666b7ecd.m3u8', '808389520-1-16.mp4', NULL, './upload/video/', 'd774d2468c81a72607d7cf6e666b7ecd.m3u8', NULL, '2023-01-20 18:51:04', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674211872548', 'http://localhost:8888/image/1674211872548', NULL, '200.jpg', 'image/jpeg', './upload/image', '1674211872546.jpg', 36408, '2023-01-20 18:51:12', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674212032510', 'http://localhost:8888/image/1674212032510', NULL, '200.jpg', 'image/jpeg', './upload/image', '1674212032509.jpg', 12857, '2023-01-20 18:53:52', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674212154984', NULL, 'http://localhost:8888/video/14012f2678f887445b24f9ebd76df0b4.m3u8', '卡塔尔世界杯.mp4', NULL, './upload/video/', '14012f2678f887445b24f9ebd76df0b4.m3u8', NULL, '2023-01-20 18:56:00', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674212169820', 'http://localhost:8888/image/1674212169820', NULL, '703861982.jpg', 'image/jpeg', './upload/image', '1674212169818.jpg', 78289, '2023-01-20 18:56:09', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674212241381', 'http://localhost:8888/image/1674212241381', NULL, 'hq720.png', 'image/png', './upload/image', '1674212241372.png', 120228, '2023-01-20 18:57:21', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674212215995', NULL, 'http://localhost:8888/video/29822064e596b4b965457c3276c4ffed.m3u8', '梵高.mp4', NULL, './upload/video/', '29822064e596b4b965457c3276c4ffed.m3u8', NULL, '2023-01-20 18:58:28', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674212384537', 'http://localhost:8888/image/1674212384537', NULL, 'p2185073849.webp', 'image/webp', './upload/image', '1674212384534.webp', 71402, '2023-01-20 18:59:44', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674212362331', NULL, 'http://localhost:8888/video/cc44ce47a59d39148516e9469e978e48.m3u8', '775996062-1-208.mp4', NULL, './upload/video/', 'cc44ce47a59d39148516e9469e978e48.m3u8', NULL, '2023-01-20 19:00:16', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674212512334', 'http://localhost:8888/image/1674212512334', NULL, '0130e6573c5df332f8757cb94ab286.jpg', 'image/jpeg', './upload/image', '1674212512333.jpg', 42026, '2023-01-20 19:01:52', '2023-01-21 08:53:00');
INSERT INTO `file` VALUES ('1674212489238', NULL, 'http://localhost:8888/video/a932e9d92c87e538f345e77c143841e2.m3u8', '成log.mp4', NULL, './upload/video/', 'a932e9d92c87e538f345e77c143841e2.m3u8', NULL, '2023-01-20 19:03:15', '2023-01-21 08:53:23');
INSERT INTO `file` VALUES ('1674629079602', 'http://localhost:8888/image/1674629079602', NULL, 'gb.jpg', 'image/jpeg', './upload/image', '1674629079596.jpg', 60177, '2023-01-25 14:44:39', '2023-01-25 15:03:13');
INSERT INTO `file` VALUES ('1674629431367', 'http://localhost:8888/image/1674629431367', NULL, 'gb.jpg', 'image/jpeg', './upload/image', '1674629431366.jpg', 68180, '2023-01-25 14:50:31', '2023-01-25 15:03:13');
INSERT INTO `file` VALUES ('1674629534266', 'http://localhost:8888/image/1674629534266', NULL, 'gb.jpg', 'image/jpeg', './upload/image', '1674629534265.jpg', 65082, '2023-01-25 14:52:14', '2023-01-25 15:03:13');
INSERT INTO `file` VALUES ('1674629651095', 'http://localhost:8888/image/1674629651095', NULL, 'gb.jpg', 'image/jpeg', './upload/image', '1674629651094.jpg', 65406, '2023-01-25 14:54:11', '2023-01-25 15:03:13');
INSERT INTO `file` VALUES ('1674629686230', 'http://localhost:8888/image/1674629686230', NULL, 'gb.jpg', 'image/jpeg', './upload/image', '1674629686228.jpg', 68180, '2023-01-25 14:54:46', '2023-01-25 15:03:13');
INSERT INTO `file` VALUES ('1674630093543', 'http://localhost:8888/image/1674630093543', NULL, '1670486044628_539539601_200.jpg', 'image/jpeg', './upload/image', '1674630093542.jpg', 95999, '2023-01-25 15:01:33', '2023-01-25 15:03:13');
INSERT INTO `file` VALUES ('1674630509000', 'http://localhost:8888/image/1674630509000', NULL, '1.jpg', 'image/jpeg', './upload/image', '1674630508997.jpg', 94271, '2023-01-25 15:08:29', '2023-01-25 15:08:29');
INSERT INTO `file` VALUES ('1674630630042', 'http://localhost:8888/image/1674630630042', NULL, '3.webp', 'image/webp', './upload/image', '1674630630041.webp', 72802, '2023-01-25 15:10:30', '2023-01-25 15:10:30');
INSERT INTO `file` VALUES ('1674630643203', 'http://localhost:8888/image/1674630643203', NULL, '2462589981.jpg', 'image/jpeg', './upload/image', '1674630643202.jpg', 63362, '2023-01-25 15:10:43', '2023-01-25 15:10:43');
INSERT INTO `file` VALUES ('1674632370220', 'http://localhost:8888/image/1674632370220', NULL, '2462589981.jpg', 'image/jpeg', './upload/channel/avatar', '1674632370217.jpg', 62990, '2023-01-25 15:39:30', '2023-01-25 15:39:30');
INSERT INTO `file` VALUES ('1674632385532', 'http://localhost:8888/image/1674632385532', NULL, 'hq720.png', 'image/png', './upload/image', '1674632385530.png', 122599, '2023-01-25 15:39:45', '2023-01-25 15:39:45');
INSERT INTO `file` VALUES ('1674632438703', 'http://localhost:8888/image/1674632438703', NULL, '3.webp', 'image/webp', './upload/channel/avatar', '1674632438702.webp', 83200, '2023-01-25 15:40:38', '2023-01-25 15:40:38');
INSERT INTO `file` VALUES ('1674632672642', 'http://localhost:8888/image/1674632672642', NULL, '2462589981.jpg', 'image/jpeg', './upload/channel/avatar', '1674632672641.jpg', 61608, '2023-01-25 15:44:32', '2023-01-25 15:44:32');
INSERT INTO `file` VALUES ('1674632789745', 'http://localhost:8888/image/1674632789745', NULL, '2.jpg', 'image/jpeg', './upload/channel/avatar', '1674632789744.jpg', 105055, '2023-01-25 15:46:29', '2023-01-25 15:46:29');
INSERT INTO `file` VALUES ('1674632868391', 'http://localhost:8888/image/1674632868391', NULL, '0130e6573c5df332f8757cb94ab286.jpg', 'image/jpeg', './upload/image', '1674632868390.jpg', 100595, '2023-01-25 15:47:48', '2023-01-25 15:47:48');
INSERT INTO `file` VALUES ('1674632956452', 'http://localhost:8888/image/1674632956452', NULL, 'cb1c3ef50e22b6096fde67febe863494caefebad.png', 'image/png', './upload/image', '1674632956451.png', 226231, '2023-01-25 15:49:16', '2023-01-25 15:49:16');
INSERT INTO `file` VALUES ('1674633031409', 'http://localhost:8888/image/1674633031409', NULL, 'ww.jpeg', 'image/jpeg', './upload/image', '1674633031406.jpeg', 239304, '2023-01-25 15:50:31', '2023-01-25 15:50:31');
INSERT INTO `file` VALUES ('1674633192562', 'http://localhost:8888/image/1674633192562', NULL, '489969227.jpg', 'image/jpeg', './upload/image', '1674633192561.jpg', 72192, '2023-01-25 15:53:12', '2023-01-25 15:53:12');
INSERT INTO `file` VALUES ('1674633215445', 'http://localhost:8888/image/1674633215445', NULL, '3644204234.jpg', 'image/jpeg', './upload/image', '1674633215443.jpg', 43177, '2023-01-25 15:53:35', '2023-01-25 15:53:35');
INSERT INTO `file` VALUES ('1674633250137', 'http://localhost:8888/image/1674633250137', NULL, 'lisa.jpg', 'image/jpeg', './upload/image', '1674633250136.jpg', 74901, '2023-01-25 15:54:10', '2023-01-25 15:54:10');
INSERT INTO `file` VALUES ('1674633274497', 'http://localhost:8888/image/1674633274497', NULL, 'd82a28f5cacc1ed1b49af75b3c11fc8f95cf83d4.jpg', 'image/jpeg', './upload/image', '1674633274496.jpg', 88894, '2023-01-25 15:54:34', '2023-01-25 15:54:34');
INSERT INTO `file` VALUES ('1674633303233', 'http://localhost:8888/image/1674633303233', NULL, '200.jpg', 'image/jpeg', './upload/image', '1674633303231.jpg', 65582, '2023-01-25 15:55:03', '2023-01-25 15:55:03');
INSERT INTO `file` VALUES ('1674633328551', 'http://localhost:8888/image/1674633328551', NULL, 'p2185073849.webp', 'image/webp', './upload/image', '1674633328550.webp', 84366, '2023-01-25 15:55:28', '2023-01-25 15:55:28');
INSERT INTO `file` VALUES ('1674639284185', 'http://localhost:8888/image/1674639284185', NULL, '703861982.jpg', 'image/jpeg', './upload/image', '1674639284182.jpg', 72697, '2023-01-25 17:34:44', '2023-01-25 17:34:44');
INSERT INTO `file` VALUES ('1674639324028', 'http://localhost:8888/image/1674639324028', NULL, '703861982.jpg', 'image/jpeg', './upload/image', '1674639324027.jpg', 71932, '2023-01-25 17:35:24', '2023-01-25 17:35:24');
INSERT INTO `file` VALUES ('1674640099289', 'http://localhost:8888/image/1674640099289', NULL, '1.jpg', 'image/jpeg', './upload/image', '1674640099287.jpg', 97849, '2023-01-25 17:48:19', '2023-01-25 17:48:19');
INSERT INTO `file` VALUES ('1674640112507', 'http://localhost:8888/image/1674640112507', NULL, '109951168221730139.jpg', 'image/jpeg', './upload/image', '1674640112506.jpg', 65823, '2023-01-25 17:48:32', '2023-01-25 17:48:32');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `vId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `count` int NULL DEFAULT 0,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vId`(`vId` ASC) USING BTREE,
  INDEX `history_ibfk_2`(`userId` ASC) USING BTREE,
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`vId`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `history_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('1674199989428', '1674199982940', '1667300096850', 7, '2023-01-20 20:56:54');
INSERT INTO `history` VALUES ('1674200330441', '1674200195530', '1664789923657', 1, '2023-01-20 15:38:50');
INSERT INTO `history` VALUES ('1674200338999', '1674199982940', '1664789923657', 2, '2023-01-20 18:54:46');
INSERT INTO `history` VALUES ('1674211886483', '1674211881903', '1664789923657', 2, '2023-01-20 18:54:32');
INSERT INTO `history` VALUES ('1674212184790', '1674212180782', '1664789923657', 3, '2023-01-22 16:01:22');
INSERT INTO `history` VALUES ('1674212317356', '1674204125033', '1667300096850', 4, '2023-01-20 20:56:19');
INSERT INTO `history` VALUES ('1674212322791', '1674212309138', '1667300096850', 14, '2023-01-20 20:55:53');
INSERT INTO `history` VALUES ('1674212327039', '1674212180782', '1667300096850', 2, '2023-01-20 21:18:33');
INSERT INTO `history` VALUES ('1674212330438', '1674211881903', '1667300096850', 1, '2023-01-20 20:56:25');
INSERT INTO `history` VALUES ('1674212337479', '1674200195530', '1667300096850', 1, '2023-01-20 20:48:28');
INSERT INTO `history` VALUES ('1674212423209', '1674212417900', '1664789923657', 1, '2023-01-20 19:00:23');
INSERT INTO `history` VALUES ('1674212618654', '1674212598117', '1667300096850', 19, '2023-01-20 21:18:43');
INSERT INTO `history` VALUES ('1674216043074', '1674212417900', '1667300096850', 27, '2023-01-20 21:18:18');
INSERT INTO `history` VALUES ('1674216272663', '1674204298817', '1667300096850', 2, '2023-01-21 19:54:08');
INSERT INTO `history` VALUES ('1674217754550', '1674212598117', '1664789923657', 6, '2023-01-24 13:55:14');
INSERT INTO `history` VALUES ('1674218263323', '1674200046723', '1667300096850', 10, '2023-01-21 19:56:59');
INSERT INTO `history` VALUES ('1674218834170', '1674200319056', '1667300096850', 2, '2023-01-21 19:57:56');
INSERT INTO `history` VALUES ('1674615599533', '1674204298817', '1664789923657', 1, '2023-01-25 11:00:00');
INSERT INTO `history` VALUES ('1674643204905', '1674212309138', '1674222445348', 1, '2023-01-25 18:40:05');
INSERT INTO `history` VALUES ('1674643226610', '1674211881903', '1674222445348', 0, '2023-01-25 18:40:26');
INSERT INTO `history` VALUES ('1674643234825', '1674204125033', '1674222445348', 0, '2023-01-25 18:40:34');
INSERT INTO `history` VALUES ('1674643242396', '1674200046723', '1674222445348', 1, '2023-01-25 18:40:47');
INSERT INTO `history` VALUES ('1674643245142', '1674212417900', '1674222445348', 0, '2023-01-25 18:40:45');
INSERT INTO `history` VALUES ('1674644351013', '1674200195530', '1674222445348', 0, '2023-01-25 18:59:11');

-- ----------------------------
-- Table structure for later
-- ----------------------------
DROP TABLE IF EXISTS `later`;
CREATE TABLE `later`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vId`, `userId`) USING BTREE,
  INDEX `later_ibfk_2`(`userId` ASC) USING BTREE,
  CONSTRAINT `later_ibfk_1` FOREIGN KEY (`vId`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `later_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of later
-- ----------------------------
INSERT INTO `later` VALUES ('1674220668843', '1674199982940', '1667300096850', '2023-01-20 21:17:48', '2023-01-20 21:17:48');
INSERT INTO `later` VALUES ('1674220188687', '1674212309138', '1667300096850', '2023-01-20 21:09:48', '2023-01-20 21:09:48');
INSERT INTO `later` VALUES ('1674219688748', '1674212417900', '1667300096850', '2023-01-20 21:01:28', '2023-01-20 21:01:28');
INSERT INTO `later` VALUES ('1674219673008', '1674212598117', '1667300096850', '2023-01-20 21:01:13', '2023-01-20 21:01:13');

-- ----------------------------
-- Table structure for playlist
-- ----------------------------
DROP TABLE IF EXISTS `playlist`;
CREATE TABLE `playlist`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isPublic` int NULL DEFAULT 1,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlist
-- ----------------------------
INSERT INTO `playlist` VALUES ('1665824604596', 'foo', 1, '', '1664789923657', '2022-10-15 17:03:24', '2022-10-15 17:03:24');
INSERT INTO `playlist` VALUES ('1665824630522', 'sdsds', 1, 'ferferfer', '1664789923657', '2022-10-15 17:03:50', '2022-10-15 17:03:50');
INSERT INTO `playlist` VALUES ('1669384866494', '天天用户体验', 1, '一体化', '1667300096850', '2022-11-25 22:01:06', '2022-11-25 22:01:06');
INSERT INTO `playlist` VALUES ('1669385003854', 'bhhbhgbgbh', 0, 'eee3we', '1667300096850', '2022-11-25 22:03:23', '2022-11-25 22:03:23');
INSERT INTO `playlist` VALUES ('1669448406900', '你好啊李银河', 1, '你好啊李银河', '1667300096850', '2022-11-26 15:40:06', '2022-11-26 15:40:06');
INSERT INTO `playlist` VALUES ('1669449769836', '王小波你', 0, '王小波一', '1667300096850', '2022-11-26 16:02:49', '2022-11-27 15:07:44');
INSERT INTO `playlist` VALUES ('1672560707135', '哈哈哈哈哈哈哈', 0, '哈哈哈哈哈哈哈', '1667726102164', '2023-01-01 16:11:47', '2023-01-01 16:11:47');
INSERT INTO `playlist` VALUES ('1672560823517', '你好啊你好', 1, '你好啊你好', '1667726102164', '2023-01-01 16:13:43', '2023-01-01 16:13:43');
INSERT INTO `playlist` VALUES ('1672563163420', '123', 1, '123', '1667726102164', '2023-01-01 16:52:43', '2023-01-01 16:52:43');
INSERT INTO `playlist` VALUES ('1672566345941', '然后用如何如何', 1, '然后用如何如何', '1667726102164', '2023-01-01 17:45:45', '2023-01-01 17:45:45');
INSERT INTO `playlist` VALUES ('1672566525895', '22222222222', 0, '22222222222', '1667726102164', '2023-01-01 17:48:45', '2023-01-01 17:48:45');
INSERT INTO `playlist` VALUES ('1673163611098', 'yuyuyuyu', 0, 'yuyuyuyu', '1667300096850', '2023-01-08 15:40:11', '2023-01-08 15:40:11');
INSERT INTO `playlist` VALUES ('1674614810952', 'bbbbbbbbb', 1, 'bfrfrferferf', '1664789923657', '2023-01-25 10:46:50', '2023-01-25 10:46:50');
INSERT INTO `playlist` VALUES ('1674614909307', '525252', 0, '2525252525', '1664789923657', '2023-01-25 10:48:29', '2023-01-25 10:48:29');
INSERT INTO `playlist` VALUES ('1674614942263', 'qqq', 0, '2525252525ewfwfwfw', '1664789923657', '2023-01-25 10:49:02', '2023-01-25 10:49:02');
INSERT INTO `playlist` VALUES ('1674615041121', '12121212', 0, '21frefrefef', '1664789923657', '2023-01-25 10:50:41', '2023-01-25 10:50:41');
INSERT INTO `playlist` VALUES ('1674615048453', 'ff', 1, 'ff', '1664789923657', '2023-01-25 10:50:48', '2023-01-25 10:50:48');
INSERT INTO `playlist` VALUES ('1674615084422', 'vb', 1, 'vb', '1664789923657', '2023-01-25 10:51:24', '2023-01-25 10:51:24');
INSERT INTO `playlist` VALUES ('1674615110132', 'e', 1, 'e', '1664789923657', '2023-01-25 10:51:50', '2023-01-25 10:51:50');
INSERT INTO `playlist` VALUES ('1674615126341', 'e3e3', 1, 'e3e', '1664789923657', '2023-01-25 10:52:06', '2023-01-25 10:52:06');
INSERT INTO `playlist` VALUES ('1674615151532', 'e3e3e3', 1, 'e3e3e', '1664789923657', '2023-01-25 10:52:31', '2023-01-25 10:52:31');
INSERT INTO `playlist` VALUES ('1674615159913', '4g4g4g45g4', 0, 'g45g45g45', '1664789923657', '2023-01-25 10:52:39', '2023-01-25 10:52:39');
INSERT INTO `playlist` VALUES ('1674615631776', 'vfvdvdewe', 1, 'rwerwerwer', '1664789923657', '2023-01-25 11:00:31', '2023-01-25 11:00:31');
INSERT INTO `playlist` VALUES ('1674616444524', 'New This Week', 1, 'New This Week', '1674222445348', '2023-01-25 11:14:04', '2023-01-25 11:14:04');
INSERT INTO `playlist` VALUES ('1674616463383', 'Live Performances', 1, 'Live Performances', '1674222445348', '2023-01-25 11:14:23', '2023-01-25 11:14:23');
INSERT INTO `playlist` VALUES ('1674616483033', 'Classic Videos, Fresh Look - 90\'s Takeover', 1, 'Classic Videos, Fresh Look - 90\'s Takeover', '1674222445348', '2023-01-25 11:14:43', '2023-01-25 11:14:43');
INSERT INTO `playlist` VALUES ('1674633138290', '新着ミュージックビデオ', 1, '新着ミュージックビデオ新着ミュージックビデオ', '1674222407471', '2023-01-25 15:52:18', '2023-01-25 15:52:18');
INSERT INTO `playlist` VALUES ('1674633155384', '音楽の急上昇', 1, '音楽の急上昇音楽の急上昇音楽の急上昇', '1674222407471', '2023-01-25 15:52:35', '2023-01-25 15:52:35');
INSERT INTO `playlist` VALUES ('1674639237122', '怕怕怕怕怕', 1, 'v表格微风威锋网威风威风', '1674222407471', '2023-01-25 17:33:57', '2023-01-25 17:33:57');
INSERT INTO `playlist` VALUES ('1674639265754', '发', 1, '发', '1674222407471', '2023-01-25 17:34:25', '2023-01-25 17:34:25');

-- ----------------------------
-- Table structure for playlist_video
-- ----------------------------
DROP TABLE IF EXISTS `playlist_video`;
CREATE TABLE `playlist_video`  (
  `pId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pId`, `vId`) USING BTREE,
  INDEX `vId`(`vId` ASC) USING BTREE,
  CONSTRAINT `playlist_video_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `playlist_video_ibfk_2` FOREIGN KEY (`vId`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlist_video
-- ----------------------------
INSERT INTO `playlist_video` VALUES ('1665824604596', '1674212309138', '2023-01-20 18:58:29', '2023-01-20 18:58:29');
INSERT INTO `playlist_video` VALUES ('1665824630522', '1674199982940', '2023-01-20 15:33:02', '2023-01-20 15:33:02');
INSERT INTO `playlist_video` VALUES ('1665824630522', '1674200046723', '2023-01-20 15:34:06', '2023-01-20 15:34:06');
INSERT INTO `playlist_video` VALUES ('1665824630522', '1674200195530', '2023-01-20 15:36:35', '2023-01-20 15:36:35');
INSERT INTO `playlist_video` VALUES ('1665824630522', '1674200319056', '2023-01-20 15:38:39', '2023-01-20 15:38:39');
INSERT INTO `playlist_video` VALUES ('1669384866494', '1674204125033', '2023-01-20 16:42:05', '2023-01-20 16:42:05');
INSERT INTO `playlist_video` VALUES ('1669384866494', '1674204298817', '2023-01-20 16:44:58', '2023-01-20 16:44:58');
INSERT INTO `playlist_video` VALUES ('1669384866494', '1674212180782', '2023-01-20 18:56:20', '2023-01-20 18:56:20');
INSERT INTO `playlist_video` VALUES ('1669384866494', '1674212417900', '2023-01-20 19:00:17', '2023-01-20 19:00:17');
INSERT INTO `playlist_video` VALUES ('1669385003854', '1674211881903', '2023-01-20 18:51:21', '2023-01-20 18:51:21');
INSERT INTO `playlist_video` VALUES ('1669449769836', '1674212598117', '2023-01-20 19:03:18', '2023-01-20 19:03:18');

-- ----------------------------
-- Table structure for subscriber
-- ----------------------------
DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `upId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `upId`(`upId` ASC) USING BTREE,
  CONSTRAINT `subscriber_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_2` FOREIGN KEY (`upId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscriber
-- ----------------------------
INSERT INTO `subscriber` VALUES ('1668241153931', '1667300096850', '1664789923657', '2022-11-12 16:19:13', '2022-11-12 16:19:13');
INSERT INTO `subscriber` VALUES ('1668242161324', '1667300096850', '1667726102164', '2022-11-12 16:36:01', '2022-11-12 16:36:01');
INSERT INTO `subscriber` VALUES ('1671347863424', '1664789923657', '1667300096850', '2022-12-18 15:17:43', '2022-12-18 15:17:43');
INSERT INTO `subscriber` VALUES ('1671626832472', '1667726102164', '1667300096850', '2022-12-21 20:47:12', '2022-12-21 20:47:12');
INSERT INTO `subscriber` VALUES ('1672645172217', '1667726102164', '1667726102164', '2023-01-02 15:39:32', '2023-01-02 15:39:32');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1665897016760', '美好', '2022-10-16 13:10:16', '2022-10-16 13:10:16');
INSERT INTO `tag` VALUES ('1665897040416', '摄影', '2022-10-16 13:10:40', '2022-10-16 13:10:40');
INSERT INTO `tag` VALUES ('1665897046778', '没事', '2022-10-16 13:10:46', '2022-10-16 13:10:46');
INSERT INTO `tag` VALUES ('1665897050494', '烦烦烦', '2022-10-16 13:10:50', '2022-10-16 13:10:50');
INSERT INTO `tag` VALUES ('1665897054998', '我我', '2022-10-16 13:10:54', '2022-10-16 13:10:54');
INSERT INTO `tag` VALUES ('1665897058346', '完全', '2022-10-16 13:10:58', '2022-10-16 13:10:58');
INSERT INTO `tag` VALUES ('1665897062762', '完全扼杀', '2022-10-16 13:11:02', '2022-10-16 13:11:02');
INSERT INTO `tag` VALUES ('1665897078125', '个人', '2022-10-16 13:11:18', '2022-10-16 13:11:18');
INSERT INTO `tag` VALUES ('1665897082623', '前端', '2022-10-16 13:11:22', '2022-10-16 13:11:22');
INSERT INTO `tag` VALUES ('1665897086071', '六', '2022-10-16 13:11:26', '2022-10-16 13:11:26');

-- ----------------------------
-- Table structure for tag_video
-- ----------------------------
DROP TABLE IF EXISTS `tag_video`;
CREATE TABLE `tag_video`  (
  `tId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tId`, `vId`) USING BTREE,
  INDEX `vId`(`vId` ASC) USING BTREE,
  CONSTRAINT `tag_video_ibfk_1` FOREIGN KEY (`tId`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tag_video_ibfk_2` FOREIGN KEY (`vId`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_video
-- ----------------------------
INSERT INTO `tag_video` VALUES ('1665897016760', '1674200319056', '2023-01-20 15:38:39', '2023-01-20 15:38:39');
INSERT INTO `tag_video` VALUES ('1665897040416', '1674200046723', '2023-01-20 15:34:06', '2023-01-20 15:34:06');
INSERT INTO `tag_video` VALUES ('1665897040416', '1674211881903', '2023-01-20 18:51:21', '2023-01-20 18:51:21');
INSERT INTO `tag_video` VALUES ('1665897040416', '1674212309138', '2023-01-20 18:58:29', '2023-01-20 18:58:29');
INSERT INTO `tag_video` VALUES ('1665897046778', '1674200046723', '2023-01-20 15:34:06', '2023-01-20 15:34:06');
INSERT INTO `tag_video` VALUES ('1665897046778', '1674204298817', '2023-01-20 16:44:58', '2023-01-20 16:44:58');
INSERT INTO `tag_video` VALUES ('1665897046778', '1674211881903', '2023-01-20 18:51:21', '2023-01-20 18:51:21');
INSERT INTO `tag_video` VALUES ('1665897046778', '1674212309138', '2023-01-20 18:58:29', '2023-01-20 18:58:29');
INSERT INTO `tag_video` VALUES ('1665897050494', '1674200195530', '2023-01-20 15:36:35', '2023-01-20 15:36:35');
INSERT INTO `tag_video` VALUES ('1665897050494', '1674204125033', '2023-01-20 16:42:05', '2023-01-20 16:42:05');
INSERT INTO `tag_video` VALUES ('1665897050494', '1674211881903', '2023-01-20 18:51:21', '2023-01-20 18:51:21');
INSERT INTO `tag_video` VALUES ('1665897050494', '1674212598117', '2023-01-20 19:03:18', '2023-01-20 19:03:18');
INSERT INTO `tag_video` VALUES ('1665897054998', '1674204298817', '2023-01-20 16:44:58', '2023-01-20 16:44:58');
INSERT INTO `tag_video` VALUES ('1665897054998', '1674212180782', '2023-01-20 18:56:20', '2023-01-20 18:56:20');
INSERT INTO `tag_video` VALUES ('1665897054998', '1674212309138', '2023-01-20 18:58:29', '2023-01-20 18:58:29');
INSERT INTO `tag_video` VALUES ('1665897058346', '1674199982940', '2023-01-20 15:33:02', '2023-01-20 15:33:02');
INSERT INTO `tag_video` VALUES ('1665897058346', '1674200195530', '2023-01-20 15:36:35', '2023-01-20 15:36:35');
INSERT INTO `tag_video` VALUES ('1665897058346', '1674212180782', '2023-01-20 18:56:20', '2023-01-20 18:56:20');
INSERT INTO `tag_video` VALUES ('1665897058346', '1674212417900', '2023-01-20 19:00:17', '2023-01-20 19:00:17');
INSERT INTO `tag_video` VALUES ('1665897062762', '1674199982940', '2023-01-20 15:33:02', '2023-01-20 15:33:02');
INSERT INTO `tag_video` VALUES ('1665897062762', '1674200046723', '2023-01-20 15:34:06', '2023-01-20 15:34:06');
INSERT INTO `tag_video` VALUES ('1665897078125', '1674212309138', '2023-01-20 18:58:29', '2023-01-20 18:58:29');

-- ----------------------------
-- Table structure for thumb
-- ----------------------------
DROP TABLE IF EXISTS `thumb`;
CREATE TABLE `thumb`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `commentId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tread` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `vId`(`vId` ASC) USING BTREE,
  INDEX `commentId`(`commentId` ASC) USING BTREE,
  CONSTRAINT `thumb_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thumb_ibfk_2` FOREIGN KEY (`vId`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thumb_ibfk_3` FOREIGN KEY (`commentId`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thumb
-- ----------------------------
INSERT INTO `thumb` VALUES ('1674212076852', '1664789923657', NULL, '1674211881903', '2023-01-20 18:54:36', '2023-01-20 18:54:36', 0);
INSERT INTO `thumb` VALUES ('1674212091551', '1664789923657', NULL, '1674199982940', '2023-01-20 18:54:51', '2023-01-20 18:54:51', 0);
INSERT INTO `thumb` VALUES ('1674218825734', '1667300096850', NULL, '1674212309138', '2023-01-20 20:47:05', '2023-01-20 20:47:05', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  `userName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatarUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `history` int NULL DEFAULT 1,
  `isExplore` int NULL DEFAULT 0,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `userName`(`userName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1664789923657', '叶子', '123', 'http://localhost:8888/user/avatar/1664789923657', '2022-10-03 17:38:43', '2023-01-21 08:54:09', 'p2629896175.webp', 'image/webp', './upload/user/avatar', '1669382612013.webp', '76227', 1, 0);
INSERT INTO `user` VALUES ('1667300096850', 'Bug码', '123', 'http://localhost:8888/user/avatar/1667300096850', '2022-11-01 18:54:56', '2023-01-21 08:54:09', '3.webp', 'image/webp', './upload/user/avatar', '1670940680281.webp', '78737', 1, 0);
INSERT INTO `user` VALUES ('1667726102164', '靡靡', '123', 'http://localhost:8888/user/avatar/1667726102164', '2022-11-06 17:15:02', '2023-01-21 08:54:09', 'p2629896175.webp', 'image/webp', './upload/user/avatar', '1667726132274.webp', '76000', 1, 0);
INSERT INTO `user` VALUES ('1674222407471', '音乐', '123', 'http://localhost:8888/user/avatar/1674222407471', '2023-01-20 21:46:47', '2023-01-25 15:45:51', '3.webp', 'image/webp', './upload/user/avatar', '1674632751356.webp', '83609', 1, 1);
INSERT INTO `user` VALUES ('1674222418492', '电影和节目', '123', NULL, '2023-01-20 21:46:58', '2023-01-20 21:48:57', NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `user` VALUES ('1674222425812', '游戏', '123', NULL, '2023-01-20 21:47:05', '2023-01-20 21:48:59', NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `user` VALUES ('1674222431747', '新闻', '123', NULL, '2023-01-20 21:47:11', '2023-01-20 21:49:00', NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `user` VALUES ('1674222436007', '体育', '123', 'http://localhost:8888/user/avatar/1674222436007', '2023-01-20 21:47:16', '2023-01-25 15:48:24', 'hq720.png', 'image/png', './upload/user/avatar', '1674632904221.png', '73801', 1, 1);
INSERT INTO `user` VALUES ('1674222445348', '学习', '123', 'http://localhost:8888/user/avatar/1674222445348', '2023-01-20 21:47:25', '2023-01-25 15:50:04', '1670486044628_539539601_200.jpg', 'image/jpeg', './upload/user/avatar', '1674633004678.jpg', '64146', 1, 1);

-- ----------------------------
-- Table structure for user_block
-- ----------------------------
DROP TABLE IF EXISTS `user_block`;
CREATE TABLE `user_block`  (
  `userId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blockId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userId`, `blockId`) USING BTREE,
  INDEX `blockId`(`blockId` ASC) USING BTREE,
  CONSTRAINT `user_block_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_block_ibfk_2` FOREIGN KEY (`blockId`) REFERENCES `block` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_block
-- ----------------------------
INSERT INTO `user_block` VALUES ('1664789923657', '1667028360697');
INSERT INTO `user_block` VALUES ('1667300096850', '1667028360697');
INSERT INTO `user_block` VALUES ('1664789923657', '1667028570849');
INSERT INTO `user_block` VALUES ('1664789923657', '1667028720735');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `playCount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `dt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `cateId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cateId`(`cateId` ASC) USING BTREE,
  INDEX `video_ibfk_4`(`userId` ASC) USING BTREE,
  CONSTRAINT `video_ibfk_3` FOREIGN KEY (`cateId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1674199982940', 'fbgbfgbgfb', '1667300096850', '0', '108368', 'bfbfbgfb', '1665897708367', '2023-01-20 15:33:02', '2023-01-20 15:33:02');
INSERT INTO `video` VALUES ('1674200046723', 'gfdbgnhmjhgfvdfgbhnjk', '1664789923657', '0', '182648.163', 'hgfcvfgbhjkiijhgfd', '1665897712689', '2023-01-20 15:34:06', '2023-01-20 15:34:06');
INSERT INTO `video` VALUES ('1674200195530', 'vvfdvvvdvfdvfdvdfvfdv', '1667300096850', '0', '251179', 'dfvdvegtrytjtujujuyjyuj', '1665897719079', '2023-01-20 15:36:35', '2023-01-20 15:36:35');
INSERT INTO `video` VALUES ('1674200319056', '改好以后有桃花运他很讨厌很讨厌和', '1664789923657', '15', '251179', '后同样具有看i亏空别了', '1665897699123', '2023-01-20 15:38:39', '2023-01-20 19:27:47');
INSERT INTO `video` VALUES ('1674204125033', 'ggggggggggggggggggg', '1667300096850', '0', '155947', 'ggggggggggeeeeeeeeeeeee', '1665897705187', '2023-01-20 16:42:05', '2023-01-20 16:42:05');
INSERT INTO `video` VALUES ('1674204298817', 'f444444444444444444444', '1664789923657', '0', '108368', '4444444444444444444444444444444', '1665897699123', '2023-01-20 16:44:58', '2023-01-20 16:44:58');
INSERT INTO `video` VALUES ('1674211881903', 'bbbbbbbbbbbbbbbbbbbbbbbgbfvdfv', '1664789923657', '0', '193877', 'bgggggggggggggggggggggggggggggggggggggggg', '1665897715639', '2023-01-20 18:51:21', '2023-01-20 18:51:21');
INSERT INTO `video` VALUES ('1674212180782', 'rfefrefrefreferferfrefref', '1664789923657', '0', '16161.000000000002', 'referferfrefrefreferfreferfrefreferfre', '1665897694232', '2023-01-20 18:56:20', '2023-01-20 18:56:20');
INSERT INTO `video` VALUES ('1674212309138', 'erferferfrefffffffffffffff5666666666666', '1667300096850', '0', '258091', '5666666666666666666666666666666', '1665897708367', '2023-01-20 18:58:29', '2023-01-20 18:58:29');
INSERT INTO `video` VALUES ('1674212417900', '纷纷乳房refer纷纷乳房乳房伟大伟大二的王夫人', '1664789923657', '0', '108368', '和用途井井有条皇太后个体人格给vggt', '1665897712689', '2023-01-20 19:00:17', '2023-01-20 19:00:17');
INSERT INTO `video` VALUES ('1674212598117', 'dcferfrefrefrefrefrefrefrefer', '1667300096850', '0', '171221', 'rfeferfert6y6j78ik89lko9lpo;.uikkthtrgefregtrhyh67u', '1665897751639', '2023-01-20 19:03:18', '2023-01-20 19:03:18');

-- ----------------------------
-- Table structure for video_file
-- ----------------------------
DROP TABLE IF EXISTS `video_file`;
CREATE TABLE `video_file`  (
  `videoId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fileId` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_file
-- ----------------------------
INSERT INTO `video_file` VALUES ('1674199982940', '1674199935054', 'cover');
INSERT INTO `video_file` VALUES ('1674199982940', '1674199926446', 'source');
INSERT INTO `video_file` VALUES ('1674200046723', '1674200031043', 'cover');
INSERT INTO `video_file` VALUES ('1674200046723', '1674200016544', 'source');
INSERT INTO `video_file` VALUES ('1674200195530', '1674200106101', 'cover');
INSERT INTO `video_file` VALUES ('1674200195530', '1674200091290', 'source');
INSERT INTO `video_file` VALUES ('1674200319056', '1674200230627', 'cover');
INSERT INTO `video_file` VALUES ('1674200319056', '1674200214358', 'source');
INSERT INTO `video_file` VALUES ('1674204125033', '1674204052794', 'cover');
INSERT INTO `video_file` VALUES ('1674204125033', '1674204032369', 'source');
INSERT INTO `video_file` VALUES ('1674204298817', '1674204262747', 'cover');
INSERT INTO `video_file` VALUES ('1674204298817', '1674204241693', 'source');
INSERT INTO `video_file` VALUES ('1674211881903', '1674211872548', 'cover');
INSERT INTO `video_file` VALUES ('1674211881903', '1674211850134', 'source');
INSERT INTO `video_file` VALUES ('1674212180782', '1674212169820', 'cover');
INSERT INTO `video_file` VALUES ('1674212180782', '1674212154984', 'source');
INSERT INTO `video_file` VALUES ('1674212309138', '1674212241381', 'cover');
INSERT INTO `video_file` VALUES ('1674212309138', '1674212215995', 'source');
INSERT INTO `video_file` VALUES ('1674212417900', '1674212384537', 'cover');
INSERT INTO `video_file` VALUES ('1674212417900', '1674212362331', 'source');
INSERT INTO `video_file` VALUES ('1674212598117', '1674212512334', 'cover');
INSERT INTO `video_file` VALUES ('1674212598117', '1674212489238', 'source');

-- ----------------------------
-- Function structure for getAllComment
-- ----------------------------
DROP FUNCTION IF EXISTS `getAllComment`;
delimiter ;;
CREATE FUNCTION `getAllComment`(commendId char(50))
 RETURNS varchar(4000) CHARSET utf8mb4
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);
SET sTemp='$';
SET sTempChd = CAST(commendId AS CHAR);
WHILE sTempChd IS NOT NULL DO
SET sTemp= CONCAT(sTemp,',',sTempChd);

SELECT GROUP_CONCAT(id) INTO sTempChd FROM `comment` WHERE FIND_IN_SET(replyId,sTempChd)>0;

END WHILE;
RETURN sTemp;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

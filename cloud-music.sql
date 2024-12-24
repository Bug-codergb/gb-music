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

 Date: 24/12/2024 19:41:29
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
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734098209689', '无名的人', 'http://localhost:8200/album/cover?id=1734098209689', '2024-11-04', '由毛不易演唱，钱雷作曲，唐恬作词的动画电影《雄狮少年》主题曲《无名的人》2021年12月14日上线，献给所有顶天立地却平凡普通的人们。\n        ', '1734097612719', '1831933318618', '2024-12-13 21:56:49');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734098296728', '小王', 'http://localhost:8200/album/cover?id=1734098296728', '2024-12-10', '冬去春来 新年献礼 毛不易匠心复刻辑《小王》\n\n带着匠心 重返初心 每一首都是小王私房日记\n\n毛不易，姓王，但他说小王这名字，只是一个代号。小王可以是任何一个跟他一样，心中怀揣着真诚和热爱的年轻人', '1734097612719', '1831933318618', '2024-12-13 21:58:16');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734098947835', 'BLACKPINK ARENA TOUR', 'http://localhost:8200/album/cover?id=1734098947835', '2024-12-01', 'BLACKPINK ARENA TOUR', '1734097838043', '1731933399433', '2024-12-13 22:09:07');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734354377712', '可能', 'http://localhost:8200/album/cover?id=1734354377712', '2024-12-01', '可能一切的可能 相信才有可能\n可能拥有过梦想 才能叫做青春', '1734097750846', '1831933318618', '2024-12-16 21:06:17');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734354582213', '人间烟火', 'http://localhost:8200/album/cover?id=1734354582213', '2024-12-10', '《人间烟火》是歌手程响倾情演唱的一首作品，歌曲用“你曾盛开过”奠定了整首歌怀念故人的感情基调，描绘了一场刻骨铭心的“人间烟火”，悠扬的旋律却也让人久久不能释怀。', '1734097750846', '1831933318618', '2024-12-16 21:09:42');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734354859107', '白羽毛之恋', 'http://localhost:8200/album/cover?id=1734354859107', '2024-12-19', '你的爱 像纯白的羽毛\n\n我用力 将它握在手心\n\n才发现 它早已成灰灭', '1734354798823', '1831933318618', '2024-12-16 21:14:19');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734355434355', '署前街少年', 'http://localhost:8200/album/cover?id=1734355434355', '2024-12-02', '我是渠边偷偷抽烟枪已上了膛的少年\n\n我要代表恐惧和这世界的阴暗谈一谈\n\n两面都是高墙只有一条路能穿过黑暗\n\n可我没有金钱也没有得到金钱的答案\n\n他妈坐在红灯区里对经过的男人挤眼', '1734355296606', '1831933318618', '2024-12-16 21:23:54');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734433988006', '在你的身边', 'http://localhost:8200/album/cover?id=1734433988006', '2024-12-18', '总以为时间会消融无尽的思念，但到头来，永远在你身边的心愿从未减弱。献给深爱过，却已逐渐远去的那个人。\n\n盛哲的首支独立单曲《在你的身边》正式发行。这首歌由盛哲独立完成词曲和制作，融合了华语流行的细腻及...\n        ', '1734433878207', '1831933318618', '2024-12-17 19:13:08');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734434315544', '未来是花开万里', 'http://localhost:8200/album/cover?id=1734434315544', '2024-12-09', '歌曲名称：未来是花开万里\n歌手姓名：龙梅子\n发行日期：2024年12月8日\n发行公司：普天同乐文化\n\n    龙梅子携手禾唱团，唱响青春励志新乐章\n龙梅子带着新歌《未来是花开万里》重磅来袭！这次再次邀...\n        ', '1734434226423', '1831933318618', '2024-12-17 19:18:35');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734435613113', 'デジモンアドベンチャー・シングルヒットパレード', 'http://localhost:8200/album/cover?id=1734435613113', '2024-12-11', '子どもたちを虜にする{育てゲー}アニメの決定版『デジモン』の,冒険心をあおる元気いっぱいのヴォーカル曲を収録するの。やっぱり「Butter-Fly」は名曲だぜ。全7曲はちと少ない気がするが,ゲーム・カ...\n        ', '1734435536222', '1731933403730', '2024-12-17 19:40:13');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734436067666', 'APT', 'http://localhost:8200/album/cover?id=1734436067666', '2024-12-11', 'ROSÉ朴彩英正规一辑首单《APT.》惊喜释出，与Bruno Mars合作，以韩国派对游戏为灵感，由ROSÉ参与创作，Bruno Mars、Cirkut、Omer Fedi及Rogét Chahaye...\n        ', '1734435985352', '1731933393502', '2024-12-17 19:47:47');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734951313791', '我终于失去了你', 'http://localhost:8200/album/cover?id=1734951313791', '2024-12-03', '我终于失去了你', '1734951260786', '1831933318618', '2024-12-23 18:55:13');
INSERT INTO `album` (`id`, `name`, `coverUrl`, `publishTime`, `description`, `arId`, `cateId`, `createTime`) VALUES ('1734961358122', '恋爱', 'http://localhost:8200/album/cover?id=1734961358122', '2024-12-17', '恋爱-最后一页', '1734961317333', '1831933318618', '2024-12-23 21:42:38');
COMMIT;

-- ----------------------------
-- Table structure for albumcate
-- ----------------------------
DROP TABLE IF EXISTS `albumcate`;
CREATE TABLE `albumcate` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sort_by` int DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of albumcate
-- ----------------------------
BEGIN;
INSERT INTO `albumcate` (`id`, `name`, `sort_by`) VALUES ('1731933393502', '欧美', 6);
INSERT INTO `albumcate` (`id`, `name`, `sort_by`) VALUES ('1731933399433', '韩国', 5);
INSERT INTO `albumcate` (`id`, `name`, `sort_by`) VALUES ('1731933403730', '日本', 4);
INSERT INTO `albumcate` (`id`, `name`, `sort_by`) VALUES ('1731933408760', '其他', 1);
INSERT INTO `albumcate` (`id`, `name`, `sort_by`) VALUES ('1831933318618', '华语', 10);
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
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734098209707', '1734098209689', '无名的人.jpg', 'image/jpeg', './upload/album/cover', '1734098209704.jpg', 148180, '2024-12-13 21:56:49', '2024-12-13 21:56:49');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734098296742', '1734098296728', '小王.jpg', 'image/jpeg', './upload/album/cover', '1734098296740.jpg', 36114, '2024-12-13 21:58:16', '2024-12-13 21:58:16');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734098947848', '1734098947835', 'blankpink-album.jpg', 'image/jpeg', './upload/album/cover', '1734098947847.jpg', 14172, '2024-12-13 22:09:07', '2024-12-13 22:09:07');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734354377731', '1734354377712', '109951169493247841.jpg', 'image/jpeg', './upload/album/cover', '1734354377728.jpg', 59373, '2024-12-16 21:06:17', '2024-12-16 21:06:17');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734354582230', '1734354582213', '人间烟火.jpg', 'image/jpeg', './upload/album/cover', '1734354582228.jpg', 43590, '2024-12-16 21:09:42', '2024-12-16 21:09:42');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734354859120', '1734354859107', '遇见.jpg', 'image/jpeg', './upload/album/cover', '1734354859119.jpg', 48925, '2024-12-16 21:14:19', '2024-12-16 21:14:19');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734355434375', '1734355434355', '20240102130103910385.jpg', 'image/jpeg', './upload/album/cover', '1734355434373.jpg', 118232, '2024-12-16 21:23:54', '2024-12-16 21:23:54');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734433988023', '1734433988006', '3183845842.jpg', 'image/jpeg', './upload/album/cover', '1734433988020.jpg', 136400, '2024-12-17 19:13:08', '2024-12-17 19:13:08');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734434315558', '1734434315544', '未来.jpg', 'image/jpeg', './upload/album/cover', '1734434315556.jpg', 220674, '2024-12-17 19:18:35', '2024-12-17 19:18:35');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734435613127', '1734435613113', '1052073838.jpg', 'image/jpeg', './upload/album/cover', '1734435613125.jpg', 251629, '2024-12-17 19:40:13', '2024-12-17 19:40:13');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734436067678', '1734436067666', 'APT.jpg', 'image/jpeg', './upload/album/cover', '1734436067677.jpg', 167771, '2024-12-17 19:47:47', '2024-12-17 19:47:47');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734951313806', '1734951313791', '我终于失去了你.jpg', 'image/jpeg', './upload/album/cover', '1734951313804.jpg', 55953, '2024-12-23 18:55:13', '2024-12-23 18:55:13');
INSERT INTO `albumcover` (`id`, `alId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734961358137', '1734961358122', '江语晨.jpg', 'image/jpeg', './upload/album/cover', '1734961358135.jpg', 74598, '2024-12-23 21:42:38', '2024-12-23 21:42:38');
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
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734097543401', '王力宏', '王力宏被CNN 以及LA Times（《洛杉矶时报》）誉为“King of Chinese Pop”（华语流行音乐之王），是著名创作歌手、编曲家、词曲作者、制作人、演员、导演。 2届台湾「金曲奖」最佳男歌手、19次提名，王力宏从1995的第一张专辑《情敌贝多芬》开始，创作了无数华语经典，如〈爱你等于爱自己〉、〈不可能错过你〉、〈流泪手心〉、〈龙的传人〉、〈唯一〉、〈爱的就是你〉、〈心中的日月〉、〈Forever Love〉、〈盖世英雄〉、〈在梅边〉、〈Kiss Goodbye〉、〈改变自己〉、〈心·跳〉、〈你不知道的事〉、〈依然爱你〉、〈你的爱〉、〈A.I.爱〉等。', 'http://localhost:8200/artist/avatar?id=1734097543401', '1731932957430', '1731933019130');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734097612719', '毛不易', '毛不易，原名王维家，1994年10月1日出生于黑龙江省齐齐哈尔市泰来县，中国内地流行乐男歌手，毕业于杭州师范大学护理专业。2017年，参加选秀娱乐节目《明日之子》的比赛，获得全国总决赛冠军，从而正式进入演艺圈；9月1日，推出首张个人音乐专辑《巨星不易工作室 No.1》；11月11日，推出个人原创单曲《项羽虞姬》。', 'http://localhost:8200/artist/avatar?id=1734097612719', '1731932957430', '1731933019130');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734097698591', '周杰伦', '周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，华语流行男歌手、演员、词曲创作人、MV及电影导演、编剧及制作人。2000年被吴宗宪发掘，发行首张个人专辑《Jay》。 2001年发行专辑《范特西》。2002年在中国、新加坡、马来西亚、美国等地举办首场个人世界巡回演唱会。 2003年登上美国《时代周刊》亚洲版封面人物。 周杰伦的音乐融合中西方元素，风格多变，四次获得世界音乐大奖最畅销亚洲艺人。凭借专辑《Jay》、《范特西》、《叶惠美》及《跨时代》四次获得金曲奖\"最佳国语专辑\"奖', 'http://localhost:8200/artist/avatar?id=1734097698591', '1731932957430', '1731933019130');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734097750846', '程响', '程响，出生于安徽淮南，中国内地女歌手，金翼龙唱片旗下艺人。凭借歌曲《不再联系》和《新娘不是我》迅速蹿红，并凭借2020年首支霸榜冠军单曲《世界这么大还是遇见你》、《想起了你》成为当下最火女歌手。', 'http://localhost:8200/artist/avatar?id=1734097750846', '1731932957430', '1731933024090');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734097838043', 'BLACKPINK', '2016年6月1日，公布首位新女团成员：JENNIE；6月8日，公布第二位成员：LISA(即Lalisa)；6月15日，公布第三位成员：JISOO；6月22日，公布最终成员：ROSÉ(即Roseanne)，共四名成员。6月29日，公布组合名称为“BLACKPINK”。2016年8月8日，BLACKPINK于韩国时间下午3时举行出道SHOWCASE并公开《WHISTLE》、《BOOMBAYHA》的音乐录影带及拍摄花絮，两首歌曲于韩国时间晚间8时正式通过各大音源网站公开，《WHISTLE》此曲公开后随即空降韩国主要音源网站的实时音源榜一位，《BOOMBAYHA》则排名音源榜第二位，其中《WHISTLE》一曲更在发布后的四小时半即韩国时间8月9日午夜12时30分于八大音源榜单达成“All-Kill”，首张单曲专辑《SQUARE ONE》也在公开后旋即登上多个国家iTunes综合专辑榜、KPOP专辑榜、单曲榜第一名的成绩，甚至于8月10日登上了美国iTunes排行榜首位。8月12日，《BOOMBAYHA》音乐录影带不仅在4天内便突破1千万人观看次数，《WHISTLE》也于5天内达成千万人观看次数，且音源仍占据各大音源榜首位，并于8月14日韩国时间下午13时30分达成“Perfect All-Kill”', 'http://localhost:8200/artist/avatar?id=1734097838043', '1731933004617', '1731933030590');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734097966847', '张韶涵', '张韶涵（Angela Chang），中国台湾女歌手、演员，华语乐坛“励志天后”。1982年1月19日出生于台湾桃园，12岁时随家人移民加拿大，曾参加“‘中广’流行之星”歌唱比赛，并获得加拿大赛区第一名。2001年签约福茂唱片，其后参演偶像剧《MVP情人》，自此进入演艺圈。2004年推出首张专辑《Over The Rainbow》，被誉为“亚洲新声音”，因其歌声响遏行云而蜚声乐坛。2006年推出专辑《潘朵拉》，其中作品《隐形的翅膀》是首次也是唯一一次以歌曲命名的高考作文题目，曾被北大校长多次翻唱。2007年主演的电视剧《公主小妹》在台湾蝉联13周收视冠军。2010年担任上海世博会代言人。2012年创办“天涵有限公司”，签约唱片公司“美妙音乐”，同年10月12日发行第七张专辑《有形的翅膀》。', 'http://localhost:8200/artist/avatar?id=1734097966847', '1731932957430', '1731933024090');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734098030863', '王菲', '1989年凭借歌曲《仍是旧句子》在香港歌坛出道，同年发行首张个人专辑《王靖雯》。1992年因演唱歌曲《容易受伤的女人》而被听众所熟知。1993年在专辑《十万个为什么？》 中尝试另类音乐的风格。1994年凭借专辑《天空》奠定其在华语歌坛的地位，并获得十大劲歌金曲最受欢迎女歌星奖；同年在香港红磡体育馆举办18场“最精彩演唱会”，打破中国香港歌手初次开演唱会的场次纪录。1996年成为首位登上美国《时代周刊》封面的华人歌手。1998年因在央视春晚上演唱歌曲《相约1998》而在中国内地获得更多的关注；同年发行专辑《唱游》，通过运用颤音、拖音等技巧确立其个人风格，并于次年获得新加坡SPVA唱片畅销排行榜年度销量冠军。', 'http://localhost:8200/artist/avatar?id=1734098030863', '1731932957430', '1731933024090');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734354798823', '孙燕姿', '孙燕姿（Stefanie Sun），新加坡人，华语流行女歌手，以独特的嗓音和唱腔、扎实的音乐功底著称。2000年签约华纳音乐，发行首张专辑《孙燕姿同名专辑》，以《天黑黑》一曲成名，并获得包括台湾金曲奖在内的亚洲各地15个最佳新人奖，至今仍为华语歌坛之纪录', 'http://localhost:8200/artist/avatar?id=1734354798823', '1731932957430', '1731933024090');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734355296606', '赵雷', '独立音乐人、唱作人赵雷', 'http://localhost:8200/artist/avatar?id=1734355296606', '1731932957430', '1731933019130');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734433878207', '盛哲', '盛哲，唱作歌手。荣誉毕业于美国顶尖工程院校，拉法耶特学院，获得音乐和机械工程双学位。研究生毕业于纽约大学（NYU）音乐科技专业。', 'http://localhost:8200/artist/avatar?id=1734433878207', '1731932957430', '1731933019130');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734434226423', '龙梅子', '龙梅子，1988年8月18日出生于甘肃兰州，华语女歌手，毕业于星海音乐学院，北京普天同乐文化传媒有限公司签约艺人，被誉为“忧伤精灵”，2007年参加央视选秀节目《星光大道》2008年随着北京台播出的电视连续剧《下辈子做你的女人》晋升收视冠军后，龙梅子同名专辑主打歌曲《下辈子做你的女人》再次荣登08年度十大流行金曲，2011年影视歌三栖明星龙梅子应《星光大道》栏目组的邀约参加了旗下《星光快车》的一期专访，讲述了自己出道以来一路走过的艰辛，2012年出席了由中国音协流行音乐学会、中国音乐金榜联合主办的“金色年华之夜·中国流行音乐十年巡礼·原创金曲颁奖盛典”的活动现场，龙梅子凭借电视剧主题曲《下辈子做你的女人》入围中国内地40首原创金曲并摘获了“2002-2012中国原创十大流行音乐金曲”大奖。2013年龙梅子个人第六张HI-FI专辑《情歌继续唱》荣登广东音像城2013年9月发烧天碟销量排行榜圈，内人士称这首苦情歌将会成为2014年度首支神曲。', 'http://localhost:8200/artist/avatar?id=1734434226423', '1731932957430', '1731933024090');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734435536222', '和田光司', '和田光司，1974年01月29日出生于京都府福知山市， 日本歌手。1999年凭借《数码宝贝》主题曲《Butter-Fly》正式出道，不过出道不久后就因发现患有喉癌而停止活动，修养一年后复出，2011年经历癌症再发，再次停止活动。2013年10月和田更新博客表示自己将再次复出，他积极接受治疗并多次复出站上舞台的精神打动了粉丝，在粉丝群中被成为“不死蝶动漫歌手”。2016年4月3日早晨，因喉癌去世，享年42岁。', 'http://localhost:8200/artist/avatar?id=1734435536222', '1731932999764', '1731933019130');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734435985352', 'ROSE', '朴彩英（Rosé），1997年2月11日出生于新西兰奥克兰，8岁移民至澳大利亚，澳籍韩裔女歌手，女子演唱组合BLACKPINK成员。 2012年，朴彩英成为YG Entertainment的练习生。同年9月15日，朴彩英参加G-DRAGON（权志龙）个人首张迷你专辑《ONE OF A KIND》中收录曲《结果》（without you）的feat。 2016年8月8日，朴彩英成为BLACKPINK的成员并随组合发行首张单曲专辑《SQUARE ONE》，主打曲为《WHISTLE》和《BOOMBAYAH》；8月14日，出演SBS电视台音乐节目《人气歌谣》，公开出道舞台；11月1日，随组合发行第二张单曲专辑《SQUARE TWO》。2017年6月22日，随组合发行单曲《As If It’s Your Last》。2018年6月15日', 'http://localhost:8200/artist/avatar?id=1734435985352', '1731933004617', '1731933024090');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734951260786', '赵传', '赵传，台湾著名音乐人。1988年出道，因高亢、沙哑的嗓音，加上其略显“沧桑”的长相，赵传在歌坛上的确有着非常强的辨识度。与同时期齐秦的深情凄美，王杰的叛逆淡薄相比，赵传的音乐也许更加贴近当时在中国大陆影响一代年轻人的流行摇滚乐。其诚恳而具有人文关怀的歌词，乐队化的编曲，加上自己出色的唱功让赵传赢得了许多华人摇滚迷的青睐，成为当代很多中国年轻人听摇滚的初级入门课程。曾发行《黑暗的英雄》、《勇敢一点》等专', 'http://localhost:8200/artist/avatar?id=1734951260786', '1731932957430', '1731933019130');
INSERT INTO `artist` (`id`, `name`, `description`, `avatarUrl`, `area`, `type`) VALUES ('1734961317333', '江语晨', '江语晨-华语女歌手', 'http://localhost:8200/artist/avatar?id=1734961317333', '1731932957430', '1731933024090');
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
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734097543424', '1734097543401', '王力宏.jpg', 'image/jpeg', './upload/artist/avatar', '1734097543421.jpg', 42449, '2024-12-13 21:45:43', '2024-12-13 21:45:43');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734097612733', '1734097612719', '毛不易.jpg', 'image/jpeg', './upload/artist/avatar', '1734097612732.jpg', 20230, '2024-12-13 21:46:52', '2024-12-13 21:46:52');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734097698607', '1734097698591', '周杰伦.png', 'image/png', './upload/artist/avatar', '1734097698605.png', 92763, '2024-12-13 21:48:18', '2024-12-13 21:48:18');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734097750865', '1734097750846', '程响.jpg', 'image/jpeg', './upload/artist/avatar', '1734097750864.jpg', 62351, '2024-12-13 21:49:10', '2024-12-13 21:49:10');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734097838062', '1734097838043', 'blank.jpg', 'image/jpeg', './upload/artist/avatar', '1734097838056.jpg', 90841, '2024-12-13 21:50:38', '2024-12-13 21:50:38');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734097966861', '1734097966847', '张韶涵.png', 'image/png', './upload/artist/avatar', '1734097966860.png', 55804, '2024-12-13 21:52:46', '2024-12-13 21:52:46');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734098030880', '1734098030863', '王菲.jpg', 'image/jpeg', './upload/artist/avatar', '1734098030878.jpg', 89469, '2024-12-13 21:53:50', '2024-12-13 21:53:50');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734354798841', '1734354798823', '20221230052215394603.jpg', 'image/jpeg', './upload/artist/avatar', '1734354798838.jpg', 74771, '2024-12-16 21:13:18', '2024-12-16 21:13:18');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734355296624', '1734355296606', '40754138.jpg', 'image/jpeg', './upload/artist/avatar', '1734355296622.jpg', 35539, '2024-12-16 21:21:36', '2024-12-16 21:21:36');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734433878232', '1734433878207', '2011612190.jpg', 'image/jpeg', './upload/artist/avatar', '1734433878228.jpg', 52001, '2024-12-17 19:11:18', '2024-12-17 19:11:18');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734434226443', '1734434226423', '4036315565.jpg', 'image/jpeg', './upload/artist/avatar', '1734434226440.jpg', 50064, '2024-12-17 19:17:06', '2024-12-17 19:17:06');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734435536241', '1734435536222', '2678781808.png', 'image/png', './upload/artist/avatar', '1734435536238.png', 78562, '2024-12-17 19:38:56', '2024-12-17 19:38:56');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734435985366', '1734435985352', '2315377496.jpg', 'image/jpeg', './upload/artist/avatar', '1734435985365.jpg', 80450, '2024-12-17 19:46:25', '2024-12-17 19:46:25');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734951260805', '1734951260786', '赵传.jpg', 'image/jpeg', './upload/artist/avatar', '1734951260802.jpg', 53836, '2024-12-23 18:54:20', '2024-12-23 18:54:20');
INSERT INTO `artistavatar` (`id`, `arId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734961317350', '1734961317333', '最后一页.jpg', 'image/jpeg', './upload/artist/avatar', '1734961317349.jpg', 59320, '2024-12-23 21:41:57', '2024-12-23 21:41:57');
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
INSERT INTO `avatar` (`id`, `userId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1732954390934', '1621553753077', '王菲.jpg', 'image/jpeg', './upload/avatar', '1732954390929.jpg', 52849, '2024-11-30 16:13:10', '2024-11-30 16:13:10');
INSERT INTO `avatar` (`id`, `userId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1732955928083', '1645620606883', '20221230052215394603.jpg', 'image/jpeg', './upload/avatar', '1732955928081.jpg', 44939, '2024-11-30 16:38:48', '2024-11-30 16:38:48');
INSERT INTO `avatar` (`id`, `userId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1733557598546', '1733554539541', 'Kpop.jpg', 'image/jpeg', './upload/avatar', '1733557598544.jpg', 55904, '2024-12-07 15:46:38', '2024-12-07 15:46:38');
INSERT INTO `avatar` (`id`, `userId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1733639030607', '1733557774861', '109951168679684189.jpg', 'image/jpeg', './upload/avatar', '1733639030604.jpg', 41045, '2024-12-08 14:23:50', '2024-12-08 14:23:50');
INSERT INTO `avatar` (`id`, `userId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734161803674', '1733557781990', '2470281619.jpg', 'image/jpeg', './upload/avatar', '1734161803670.jpg', 20408, '2024-12-14 15:36:43', '2024-12-14 15:36:43');
INSERT INTO `avatar` (`id`, `userId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734162109527', '1733557883885', 'Kpop.jpg', 'image/jpeg', './upload/avatar', '1734162109524.jpg', 55904, '2024-12-14 15:41:49', '2024-12-14 15:41:49');
INSERT INTO `avatar` (`id`, `userId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734761656991', '1733557750529', '11.jpg', 'image/jpeg', './upload/avatar', '1734761656986.jpg', 15753, '2024-12-21 14:14:16', '2024-12-21 14:14:16');
INSERT INTO `avatar` (`id`, `userId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734951086994', '1734951047784', '4.jpg', 'image/jpeg', './upload/avatar', '1734951086991.jpg', 49278, '2024-12-23 18:51:26', '2024-12-23 18:51:26');
INSERT INTO `avatar` (`id`, `userId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734959986491', '1734172437248', '3.jpg', 'image/jpeg', './upload/avatar', '1734959986488.jpg', 43757, '2024-12-23 21:19:46', '2024-12-23 21:19:46');
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
INSERT INTO `banner` (`id`, `picUrl`, `songId`, `vId`, `alId`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734610193765', 'http://localhost:8200/banner?id=1734610193765', NULL, NULL, '1734098947835', 2, '2024-12-19 20:09:53', '2024-12-19 20:09:53', 'banner.jpg', 'image/jpeg', './upload/banner/recommend', '1734610193783.jpg', 381157);
INSERT INTO `banner` (`id`, `picUrl`, `songId`, `vId`, `alId`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734610259473', 'http://localhost:8200/banner?id=1734610259473', NULL, '1734436591672', NULL, 3, '2024-12-19 20:10:59', '2024-12-19 20:10:59', 'bgc.jpg', 'image/jpeg', './upload/banner/recommend', '1734610259488.jpg', 191685);
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
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734437951961', '情感', '2024-12-17 20:19:11', '2024-12-17 20:19:11', 'http://localhost:8200/channel/cover?id=1734437951961', '情感.jpg', 'image/jpeg', './upload/channel/icon', '1734437951959.jpg', 1848);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438023821', '音乐播客', '2024-12-17 20:20:23', '2024-12-17 20:20:23', 'http://localhost:8200/channel/cover?id=1734438023821', '播客.jpg', 'image/jpeg', './upload/channel/icon', '1734438023820.jpg', 1881);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438086739', '有声书', '2024-12-17 20:21:26', '2024-12-17 20:21:26', 'http://localhost:8200/channel/cover?id=1734438086739', '有声书.jpg', 'image/jpeg', './upload/channel/icon', '1734438086738.jpg', 987);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438130857', '脱口秀', '2024-12-17 20:22:10', '2024-12-17 20:22:10', 'http://localhost:8200/channel/cover?id=1734438130857', '脱口秀.jpg', 'image/jpeg', './upload/channel/icon', '1734438130855.jpg', 2933);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438178563', '创作翻唱', '2024-12-17 20:22:58', '2024-12-17 20:22:58', 'http://localhost:8200/channel/cover?id=1734438178563', '创作翻唱.jpg', 'image/jpeg', './upload/channel/icon', '1734438178561.jpg', 2505);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438248871', '知识', '2024-12-17 20:24:08', '2024-12-17 20:24:08', 'http://localhost:8200/channel/cover?id=1734438248871', '知识.jpg', 'image/jpeg', './upload/channel/icon', '1734438248870.jpg', 1690);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438284672', '明星专区', '2024-12-17 20:24:44', '2024-12-17 20:24:44', 'http://localhost:8200/channel/cover?id=1734438284672', '1.jpg', 'image/jpeg', './upload/channel/icon', '1734438284670.jpg', 2077);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438322453', '生活', '2024-12-17 20:25:22', '2024-12-17 20:25:22', 'http://localhost:8200/channel/cover?id=1734438322453', '生活.jpg', 'image/jpeg', './upload/channel/icon', '1734438322451.jpg', 1344);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438369650', '咨询', '2024-12-17 20:26:09', '2024-12-17 20:26:09', 'http://localhost:8200/channel/cover?id=1734438369650', '咨询.jpg', 'image/jpeg', './upload/channel/icon', '1734438369649.jpg', 1047);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438418575', '广播剧', '2024-12-17 20:26:58', '2024-12-17 20:26:58', 'http://localhost:8200/channel/cover?id=1734438418575', '广播剧.jpg', 'image/jpeg', './upload/channel/icon', '1734438418574.jpg', 2151);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438473433', '故事', '2024-12-17 20:27:53', '2024-12-17 20:27:53', 'http://localhost:8200/channel/cover?id=1734438473433', '故事.jpg', 'image/jpeg', './upload/channel/icon', '1734438473432.jpg', 1342);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438570997', '人文历史', '2024-12-17 20:29:30', '2024-12-17 20:29:30', 'http://localhost:8200/channel/cover?id=1734438570997', '人文历史.jpg', 'image/jpeg', './upload/channel/icon', '1734438570996.jpg', 1133);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438678701', '娱乐', '2024-12-17 20:31:18', '2024-12-17 20:31:18', 'http://localhost:8200/channel/cover?id=1734438678701', '娱乐.jpg', 'image/jpeg', './upload/channel/icon', '1734438678699.jpg', 1710);
INSERT INTO `channel` (`id`, `name`, `createTime`, `updateTime`, `picUrl`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734438774647', '相声曲艺', '2024-12-17 20:32:54', '2024-12-17 20:32:54', 'http://localhost:8200/channel/cover?id=1734438774647', '相声.jpg', 'image/jpeg', './upload/channel/icon', '1734438774645.jpg', 1801);
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
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734439614366', '1734437951961', '睡前催眠', '1645620606883', 'http://localhost:8200/channel/content/cover?id=1734439614366', '有了这张专辑，就不用再担心晚上睡不着了，\n\n婵儿姐姐的声音会陪伴着你，带你进入甜美的梦', '2024-12-17 20:46:54', '2024-12-17 20:46:54', '1.jpg', 'image/jpeg', './upload/channel/cover', '1734439614392.jpg', 72308);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734439659567', '1734437951961', '夜晚的声音会发光', '1645620606883', 'http://localhost:8200/channel/content/cover?id=1734439659567', '程一这个名字，已经在不知不觉中陪伴你度过了无数个夜晚。\n\n我们的相识是从声音开始，透过麦克风穿过耳机', '2024-12-17 20:47:39', '2024-12-17 20:47:39', '2.jpg', 'image/jpeg', './upload/channel/cover', '1734439659582.jpg', 100221);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734439722259', '1734437951961', '女性情感故事', '1645620606883', 'http://localhost:8200/channel/content/cover?id=1734439722259', '女性情感故事，请听她说', '2024-12-17 20:48:42', '2024-12-17 20:48:42', '3.jpg', 'image/jpeg', './upload/channel/cover', '1734439722274.jpg', 81670);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734439789893', '1734437951961', '朗读者', '1645620606883', 'http://localhost:8200/channel/content/cover?id=1734439789893', '温暖知性，治愈苍茫世间孤寂的你我', '2024-12-17 20:49:49', '2024-12-17 20:49:49', '4.jpg', 'image/jpeg', './upload/channel/cover', '1734439789917.jpg', 81634);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734439835949', '1734437951961', '情感分析-有一说一', '1645620606883', 'http://localhost:8200/channel/content/cover?id=1734439835949', '情感方程式 是一档 情感解答类型的节目', '2024-12-17 20:50:35', '2024-12-17 20:50:35', '5.jpg', 'image/jpeg', './upload/channel/cover', '1734439835965.jpg', 62331);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734439902280', '1734437951961', '默默道来｜讲个故事给你听', '1645620606883', 'http://localhost:8200/channel/content/cover?id=1734439902280', '感动的、治愈的、伴你入眠的好故事', '2024-12-17 20:51:42', '2024-12-17 20:51:42', '6.jpg', 'image/jpeg', './upload/channel/cover', '1734439902297.jpg', 59695);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734521664022', '1734438023821', '总有这样的歌只想一个人听', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1734521664022', '带上你的音乐和故事 与我们相遇 ..带上你的音乐和故事 与我们相遇 .. 每一位小伙伴的经历 都是我们创作的源头..带上你的音乐和故事 与我们相遇 .. 每一位小伙伴的经历 都是我们创作的源头..带上你的音乐和故事 与我们相遇 .. 每一位小伙伴的经历 都是我们创作的源头..带上你的音乐和故事 与我们相遇 .. 每一位小都是我们创作的源头..带上你的音乐和故事 与我们相遇 .. 每一位小伙伴的经历 都是我们创作的源头..\n\n每一位小伙伴的经历 都是我们创作的源头..', '2024-12-18 19:34:24', '2024-12-18 19:34:24', 'wKgLclw1y2PjEND8AAGN2SKPPNM391.jpg', 'image/jpeg', './upload/channel/cover', '1734521664040.jpg', 49043);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734521758338', '1734438023821', '1000首听不腻的好歌丨优质歌单', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1734521758338', '每一首好歌，都有属于它的故事，欢迎你来到我的音乐故事馆。\n\n送你一段精选短句，分享好歌一曲，只属于你的优质歌单', '2024-12-18 19:35:58', '2024-12-18 19:35:58', '7.jpg', 'image/jpeg', './upload/channel/cover', '1734521758358.jpg', 43331);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734521861249', '1734438086739', '让你循环百遍以上的经典英文歌', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1734521861249', '因为热爱音乐，所以我们聚集在这里；因为热爱英文歌，所以我们彼此更加贴近。每一首歌，都讲诉一个故事；每个音符，都记录一种心情', '2024-12-18 19:37:41', '2024-12-18 19:37:41', '11.jpg', 'image/jpeg', './upload/channel/cover', '1734521861261.jpg', 22115);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734521932474', '1734438774647', '郭德纲30年相声精选', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1734521932474', '郭德纲、于谦领衔，云鹤九霄众弟子集结', '2024-12-18 19:38:52', '2024-12-18 19:38:52', 'gdg.jpg', 'image/jpeg', './upload/channel/cover', '1734521932486.jpg', 61476);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734522028058', '1734438023821', '夜色钢琴曲', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1734522028058', '愿未来的每一个夜晚，大家在钢琴曲的陪伴下，能够卸下身体的浮躁与焦虑，内心不再孤单与慌张。', '2024-12-18 19:40:28', '2024-12-18 19:40:28', '8.jpg', 'image/jpeg', './upload/channel/cover', '1734522028074.jpg', 43893);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734522193650', '1734438023821', '经典留声机', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1734522193650', '经典 流行 从来都不冲突\n\n在这里，听见你曾经的故事', '2024-12-18 19:43:13', '2024-12-18 19:43:13', '10.jpg', 'image/jpeg', './upload/channel/cover', '1734522193659.jpg', 21937);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734522236580', '1734438023821', '旧年华', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1734522236580', '书杰的怀旧音乐节目。浪漫音乐、古典文学、艺术哲学；美好，感动，忧愁，悲伤……在这里都可以找到一份', '2024-12-18 19:43:56', '2024-12-18 19:43:56', '12.jpg', 'image/jpeg', './upload/channel/cover', '1734522236592.jpg', 50579);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734522286455', '1734438023821', '全网最强 极限催眠|重度失眠 一听就困', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1734522286455', '深度催眠，闭眼体验，\n每晚十分钟，改变睡眠结构，\n远离焦虑情绪，进入深度睡眠，', '2024-12-18 19:44:46', '2024-12-18 19:44:46', '13.jpg', 'image/jpeg', './upload/channel/cover', '1734522286467.jpg', 51247);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734522477208', '1734438023821', '音乐记事本|一首歌一个故事', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1734522477208', '漫漫长路，总有音乐相伴 ，曾经听过的歌曲 ，或许在偶然的一天都会变成一段似曾相识的故事。 而你，就是故事里的那个人 ', '2024-12-18 19:47:57', '2024-12-18 19:47:57', '14.jpg', 'image/jpeg', './upload/channel/cover', '1734522477223.jpg', 46559);
INSERT INTO `channel_content` (`id`, `cId`, `name`, `userId`, `coverUrl`, `description`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734522524682', '1734438023821', '你的故事我的歌', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1734522524682', '听一首歌   恋一个人\n守一座城   等一个回忆\n每一首歌的歌词中都有一个动人的故事', '2024-12-18 19:48:44', '2024-12-18 19:48:44', '15.jpg', 'image/jpeg', './upload/channel/cover', '1734522524693.jpg', 44106);
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
INSERT INTO `combo` (`id`, `name`, `price`, `createTime`, `updateTime`) VALUES ('1734162796680', '1个月', 12, '2024-12-14 15:53:16', '2024-12-14 15:53:16');
INSERT INTO `combo` (`id`, `name`, `price`, `createTime`, `updateTime`) VALUES ('1734162809353', '3个月', 45, '2024-12-14 15:53:29', '2024-12-14 15:53:29');
INSERT INTO `combo` (`id`, `name`, `price`, `createTime`, `updateTime`) VALUES ('1734162824592', '12个月', 178, '2024-12-14 15:53:44', '2024-12-14 15:53:44');
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
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734760844083', '是唐代诗人王勃创作的一篇骈文，被誉为“千古文章之冠”，不仅是中华文化的瑰宝，也代表了中国古代散文的巅峰成就之一。这篇序文以其精湛的文采、宏大的气魄和深远的思想内涵著称，集中展现了唐初文坛的高度繁荣', '1734172437248', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-21 14:00:44', '2024-12-21 14:00:44', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734761076290', '辞藻华丽而不失典雅：王勃运用了大量的成语典故、对仗排比，使文章既具有一种庄重典雅的气息，又不失生动活泼', '1734172437248', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-21 14:04:36', '2024-12-21 14:04:36', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734761105832', '滕王阁序》不仅仅是描述一座建筑，而是借由这座楼阁展现了一幅壮丽的大唐盛世图景，包含了对自然景观的赞美，同时也融入了对人文情怀的深刻思索，如“落霞与孤鹜齐飞，秋水共长天一色”，画面开阔，意蕴无穷', '1734172437248', NULL, NULL, NULL, NULL, NULL, '2024-12-21 14:05:05', '2024-12-21 14:05:05', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734761107952', '滕王阁序》不仅仅是描述一座建筑，而是借由这座楼阁展现了一幅壮丽的大唐盛世图景，包含了对自然景观的赞美，同时也融入了对人文情怀的深刻思索，如“落霞与孤鹜齐飞，秋水共长天一色”，画面开阔，意蕴无穷', '1734172437248', NULL, NULL, NULL, NULL, NULL, '2024-12-21 14:05:07', '2024-12-21 14:05:07', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734761159895', '滕王阁序》不仅仅是描述一座建筑，而是借由这座楼阁展现了一幅壮丽的大唐盛世图景，包含了对自然景观的赞美，同时也融入了对人文情怀的深刻思索，如“落霞与孤鹜齐飞，秋水共长天一色”，画面开阔，意蕴无穷', '1734172437248', NULL, NULL, NULL, '1734354377712', NULL, '2024-12-21 14:05:59', '2024-12-21 14:05:59', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734761161870', '滕王阁序》不仅仅是描述一座建筑，而是借由这座楼阁展现了一幅壮丽的大唐盛世图景，包含了对自然景观的赞美，同时也融入了对人文情怀的深刻思索，如“落霞与孤鹜齐飞，秋水共长天一色”，画面开阔，意蕴无穷', '1734172437248', NULL, NULL, NULL, '1734354377712', NULL, '2024-12-21 14:06:01', '2024-12-21 14:06:01', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734767574766', '豫章故郡，洪都新府。星分翼轸(zhěn)，地接衡庐。襟三江而带五湖，控蛮荆而引瓯（ōu）越。物华天宝，龙光射牛斗之墟；人杰地', '1733554539541', NULL, NULL, NULL, NULL, NULL, '2024-12-21 15:52:54', '2024-12-21 15:52:54', '1734765844225', NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734767971392', '光照临川之笔。四美具，二难并。穷睇眄(dì miǎn)于中天，极娱游于暇日。天高地迥(jiǒng)，觉宇宙之无穷；兴尽悲来，识盈虚之有数。望长安于日下', '1733554539541', NULL, NULL, NULL, NULL, NULL, '2024-12-21 15:59:31', '2024-12-21 15:59:31', '1734765757917', NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734768009721', '遥襟甫畅，逸兴遄(chuán)飞。爽籁发而清风生，纤歌凝而白云遏(è)。睢(suī)园绿竹，气凌彭泽之樽；邺(yè)水朱华，光照临川之笔。四美具，二难并。穷睇眄(dì miǎn)于中天，极娱游于暇日。天高地迥(jiǒng)，觉宇宙之无穷；兴尽悲来，识盈虚之有数。望长安于日下', '1733554539541', NULL, NULL, NULL, NULL, NULL, '2024-12-21 16:00:09', '2024-12-21 16:00:09', '1734765844225', NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951674619', '第一次听到赵传唱这首歌的时候，我的脑海中是一个初入社会刚刚小有收获的年轻人的身影，孤独地向着风站着，是一种伤感、喜悦无处分享的感觉；而李宗盛的声音更加深沉，更有故事感，更像是一个老者在回忆自己的一生所感。两者各有特色，像是对两段不同的人生故事的诉说', '1734951047784', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:01:14', '2024-12-23 19:01:14', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951685532', '一年得播不下五次这首歌，而且每次都是赵传的版本。。主歌部分确实太让人有那种澎湃的感觉了，呐喊却又带着打心里的情感', '1734951047784', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:01:25', '2024-12-23 19:01:25', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951694731', '90年代真是流行音乐百花齐放的年代，四大天王，还有很多嗓音独特的歌手，例如赵传，张信哲。周华健。再看看现在。。。我愿天工从抖擞，不据一素将人才', '1734951047784', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:01:34', '2024-12-23 19:01:34', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951704677', '这首歌和同名专辑，奠定了赵传戴帽子的形象，他后来的专辑照片和演唱会都有戴帽子，形象设计做得好[打call]', '1734951047784', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:01:44', '2024-12-23 19:01:44', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951715835', '这首毫无疑问肯定是滚石出品的原创，那问题来了，词曲信息到底哪个是准确的？\n刘德华版MV写的是', '1734951047784', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:01:55', '2024-12-23 19:01:55', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951723912', '这首歌不止可以讲爱情 这词更多也能用到爱父母长辈之类的', '1734951047784', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:02:03', '2024-12-23 19:02:03', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951734404', '为啥这个MV跟CD版本的有细微不同啊，我确定肯定不是CD版本的', '1734951047784', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:02:14', '2024-12-23 19:02:14', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951771426', '我敢唱，但嗓子小鸡不说，一晚基本就这一首，不知道为啥 信乐团我都不至', '1621553753077', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:02:51', '2024-12-23 19:02:51', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951786672', '当时，赵传通过《我很丑可是我很温柔》、《我是一只小小鸟》迎来了事业的巅峰，身为音乐制作人的李宗盛来看他的演唱会，看着赵传投入的演唱，台下歌迷的热情欢呼，以及蜂拥着要上台献花甚至献吻的姑娘们，李宗盛开始“浮想联翩”', '1621553753077', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:03:06', '2024-12-23 19:03:06', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951823264', '这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉', '1621553753077', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:03:43', '2024-12-23 19:03:43', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734951836297', '还是那句话，初闻不识曲中意，再闻已是曲中人，再再闻已是冷眼人', '1621553753077', NULL, NULL, NULL, NULL, '1734951647296', '2024-12-23 19:03:56', '2024-12-23 19:03:56', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952282411', '这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……', '1621553753077', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-23 19:11:22', '2024-12-23 19:11:22', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952285571', '这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……', '1621553753077', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-23 19:11:25', '2024-12-23 19:11:25', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952286910', '这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……', '1621553753077', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-23 19:11:26', '2024-12-23 19:11:26', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952287984', '这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……', '1621553753077', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-23 19:11:27', '2024-12-23 19:11:27', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952289214', '这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……', '1621553753077', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-23 19:11:29', '2024-12-23 19:11:29', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952296349', '这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……', '1621553753077', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-23 19:11:36', '2024-12-23 19:11:36', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952302799', '这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……', '1621553753077', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-23 19:11:42', '2024-12-23 19:11:42', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952306058', '这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……', '1621553753077', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-23 19:11:46', '2024-12-23 19:11:46', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952307796', '这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……这首歌的MV很有“历史感”，就是那种看上去年代很遥远的感觉……', '1621553753077', NULL, NULL, '1734353422982', NULL, NULL, '2024-12-23 19:11:47', '2024-12-23 19:11:47', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952494210', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', '1734952307796', NULL, NULL, NULL, NULL, '2024-12-23 19:14:54', '2024-12-23 19:14:54', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952534943', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:15:34', '2024-12-23 19:15:34', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952537268', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:15:37', '2024-12-23 19:15:37', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952538844', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:15:38', '2024-12-23 19:15:38', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952540340', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:15:40', '2024-12-23 19:15:40', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952541835', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:15:41', '2024-12-23 19:15:41', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952543194', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:15:43', '2024-12-23 19:15:43', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952544361', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:15:44', '2024-12-23 19:15:44', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952545814', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:15:45', '2024-12-23 19:15:45', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952547424', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:15:47', '2024-12-23 19:15:47', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952549046', '考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动考古，此片的音乐制作和动画制作堪称我国动画史上超神的存在，每次都是满满的感动', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:15:49', '2024-12-23 19:15:49', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952647209', '还记得1999年那个暑假，好像是一个下过雨的傍晚，空气特别清新，当我第一次听见这首歌时全身就跟通了电一样，整个人一下子就呆住了，这不是张信哲唱的么，怎么那么好听呢，像金属一样的声音，无可挑剔', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:17:27', '2024-12-23 19:17:27', NULL, '1734348646110', NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952652555', '还记得1999年那个暑假，好像是一个下过雨的傍晚，空气特别清新，当我第一次听见这首歌时全身就跟通了电一样，整个人一下子就呆住了，这不是张信哲唱的么，怎么那么好听呢，像金属一样的声音，无可挑剔', '1621553753077', '1734952534943', NULL, NULL, NULL, NULL, '2024-12-23 19:17:32', '2024-12-23 19:17:32', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952677029', '还记得1999年那个暑假，好像是一个下过雨的傍晚，空气特别清新，当我第一次听见这首歌时全身就跟通了电一样，整个人一下子就呆住了，这不是张信哲唱的么，怎么那么好听呢，像金属一样的声音，无可挑剔', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:17:57', '2024-12-23 19:17:57', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952678414', '还记得1999年那个暑假，好像是一个下过雨的傍晚，空气特别清新，当我第一次听见这首歌时全身就跟通了电一样，整个人一下子就呆住了，这不是张信哲唱的么，怎么那么好听呢，像金属一样的声音，无可挑剔', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:17:58', '2024-12-23 19:17:58', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952680815', '还记得1999年那个暑假，好像是一个下过雨的傍晚，空气特别清新，当我第一次听见这首歌时全身就跟通了电一样，整个人一下子就呆住了，这不是张信哲唱的么，怎么那么好听呢，像金属一样的声音，无可挑剔', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:18:00', '2024-12-23 19:18:00', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952682335', '还记得1999年那个暑假，好像是一个下过雨的傍晚，空气特别清新，当我第一次听见这首歌时全身就跟通了电一样，整个人一下子就呆住了，这不是张信哲唱的么，怎么那么好听呢，像金属一样的声音，无可挑剔', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:18:02', '2024-12-23 19:18:02', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952683821', '还记得1999年那个暑假，好像是一个下过雨的傍晚，空气特别清新，当我第一次听见这首歌时全身就跟通了电一样，整个人一下子就呆住了，这不是张信哲唱的么，怎么那么好听呢，像金属一样的声音，无可挑剔', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:18:03', '2024-12-23 19:18:03', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952690538', '听了太多刻意炫技版本，还是喜欢哲哥这样情感多过技巧去诠释歌曲的唱法', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:18:10', '2024-12-23 19:18:10', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952691815', '听了太多刻意炫技版本，还是喜欢哲哥这样情感多过技巧去诠释歌曲的唱法', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:18:11', '2024-12-23 19:18:11', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952693046', '听了太多刻意炫技版本，还是喜欢哲哥这样情感多过技巧去诠释歌曲的唱法', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:18:13', '2024-12-23 19:18:13', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952694146', '听了太多刻意炫技版本，还是喜欢哲哥这样情感多过技巧去诠释歌曲的唱法', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:18:14', '2024-12-23 19:18:14', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952695515', '听了太多刻意炫技版本，还是喜欢哲哥这样情感多过技巧去诠释歌曲的唱法', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:18:15', '2024-12-23 19:18:15', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952696642', '听了太多刻意炫技版本，还是喜欢哲哥这样情感多过技巧去诠释歌曲的唱法', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:18:16', '2024-12-23 19:18:16', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952698639', '听了太多刻意炫技版本，还是喜欢哲哥这样情感多过技巧去诠释歌曲的唱法', '1621553753077', NULL, NULL, NULL, '1734951313791', NULL, '2024-12-23 19:18:18', '2024-12-23 19:18:18', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952920641', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:00', '2024-12-23 19:22:00', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952923112', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:03', '2024-12-23 19:22:03', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952925192', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:05', '2024-12-23 19:22:05', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952927465', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:07', '2024-12-23 19:22:07', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952929461', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:09', '2024-12-23 19:22:09', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952932352', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:12', '2024-12-23 19:22:12', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952935332', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:15', '2024-12-23 19:22:15', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952937238', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:17', '2024-12-23 19:22:17', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952946227', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:26', '2024-12-23 19:22:26', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952948378', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:28', '2024-12-23 19:22:28', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952950735', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:30', '2024-12-23 19:22:30', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952962229', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', '1734952696642', NULL, NULL, NULL, NULL, '2024-12-23 19:22:42', '2024-12-23 19:22:42', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952983210', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:03', '2024-12-23 19:23:03', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952985708', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:05', '2024-12-23 19:23:05', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952987885', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:07', '2024-12-23 19:23:07', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952989227', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:09', '2024-12-23 19:23:09', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952990420', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:10', '2024-12-23 19:23:10', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952991689', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:11', '2024-12-23 19:23:11', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952993159', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:13', '2024-12-23 19:23:13', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952994376', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:14', '2024-12-23 19:23:14', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952996145', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:16', '2024-12-23 19:23:16', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952997615', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:17', '2024-12-23 19:23:17', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734952998908', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:18', '2024-12-23 19:23:18', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734953000417', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:20', '2024-12-23 19:23:20', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734953001564', '野花、爱情地图版本是山寨货，出自我好想专辑。只有这个版本是原版。当年我好想专辑首发的时候我买来一听，卧槽，什么鸡吧歌词', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:21', '2024-12-23 19:23:21', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734953015492', '宝莲灯完美体现了坚定不移的那种信念，为了自己母亲得救，沉香上刀山，下火海，过沙漠，经过千难万险，终于劈开华山，救出母亲，只要有心，神也是可以战胜的', '1621553753077', NULL, '1734098690057', NULL, NULL, NULL, '2024-12-23 19:23:35', '2024-12-23 19:23:35', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954761935', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, '1734354609522', NULL, NULL, NULL, '2024-12-23 19:52:41', '2024-12-23 19:52:41', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954820965', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:53:40', '2024-12-23 19:53:40', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954832047', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:53:52', '2024-12-23 19:53:52', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954838469', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:53:58', '2024-12-23 19:53:58', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954840190', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:54:00', '2024-12-23 19:54:00', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954841250', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:54:01', '2024-12-23 19:54:01', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954842391', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:54:02', '2024-12-23 19:54:02', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954843503', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:54:03', '2024-12-23 19:54:03', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954845287', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:54:05', '2024-12-23 19:54:05', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954846668', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:54:06', '2024-12-23 19:54:06', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954858031', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:54:18', '2024-12-23 19:54:18', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954860276', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-23 19:54:20', '2024-12-23 19:54:20', NULL, NULL, '1734529442220');
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954967893', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', '1734954860276', NULL, NULL, NULL, NULL, '2024-12-23 19:56:07', '2024-12-23 19:56:07', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734954981682', '这动画的人物画法才是正经的中国人呢，有着别样的温柔美丽，现在动画的建模一看就是欧美人', '1621553753077', '1734954860276', NULL, NULL, NULL, NULL, '2024-12-23 19:56:21', '2024-12-23 19:56:21', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734955481295', 'dwdwde', '1621553753077', '1734953015492', NULL, NULL, NULL, NULL, '2024-12-23 20:04:41', '2024-12-23 20:04:41', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734955579973', '曾经的音乐圈那么纯净，那么令人感动，可现在金钱味，偶像味却这么重。不追逐音乐只追星看脸的偶像饭圈滚啊，污音乐圈污影视圈污舞蹈圈污说唱圈，你们到底要毁了多少地方，天煞的资本', '1621553753077', NULL, NULL, '1734353375836', NULL, NULL, '2024-12-23 20:06:19', '2024-12-23 20:06:19', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734955581718', '曾经的音乐圈那么纯净，那么令人感动，可现在金钱味，偶像味却这么重。不追逐音乐只追星看脸的偶像饭圈滚啊，污音乐圈污影视圈污舞蹈圈污说唱圈，你们到底要毁了多少地方，天煞的资本', '1621553753077', NULL, NULL, '1734353375836', NULL, NULL, '2024-12-23 20:06:21', '2024-12-23 20:06:21', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734955605364', '曾经的音乐圈那么纯净，那么令人感动，可现在金钱味，偶像味却这么重。不追逐音乐只追星看脸的偶像饭圈滚啊，污音乐圈污影视圈污舞蹈圈污说唱圈，你们到底要毁了多少地方，天煞的资本', '1621553753077', '1734955581718', NULL, NULL, NULL, NULL, '2024-12-23 20:06:45', '2024-12-23 20:06:45', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734955862861', '11111', '1621553753077', '1734955581718', NULL, NULL, NULL, NULL, '2024-12-23 20:11:02', '2024-12-23 20:11:02', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734956029367', '这词真美，每一句都对应这沉香日益疯长并愈发坚定的信念\n小沉香勇往无畏，披荆斩棘，丝毫不畏惧将要面对的是何等残酷，一次次跌倒，一次次爬起来，二郎神也曾开山救母，也曾和沉香一样翻山越岭，也曾一样的热血无畏，可他却在成长的过程中没了锋芒，没了棱角，更多的是成年人的一种妥协，这却是最无力的', '1621553753077', NULL, '1734354407027', NULL, NULL, NULL, '2024-12-23 20:13:49', '2024-12-23 20:13:49', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734956042261', '有点需要强调，这首歌本来就是写母子之间的爱的，请不要把它放到普通的男女情爱上，这会让这首歌瞬间逼格没了变俗气了。歌词里能充分得感觉到沉香寻母那种迫切的感觉，是整部动漫的一个总结和升华', '1621553753077', NULL, '1734354407027', NULL, NULL, NULL, '2024-12-23 20:14:02', '2024-12-23 20:14:02', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734960933408', '大爱赵雷', '1621553753077', NULL, '1734355490519', NULL, NULL, NULL, '2024-12-23 21:35:33', '2024-12-23 21:35:33', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1734960993368', '大爱赵雷', '1621553753077', NULL, NULL, NULL, NULL, '1734436983406', '2024-12-23 21:36:33', '2024-12-23 21:36:33', NULL, NULL, NULL);
INSERT INTO `comment` (`id`, `content`, `userId`, `replyId`, `songId`, `pId`, `alId`, `vId`, `createTime`, `updateTime`, `mId`, `tId`, `cId`) VALUES ('1735040160858', '1', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2024-12-24 19:36:00', '2024-12-24 19:36:00', '1734961142834', NULL, NULL);
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
INSERT INTO `fans` (`id`, `userId`, `upId`, `createTime`, `updateTime`) VALUES ('1733637455572', '1733557774861', '1621553753077', '2024-12-08 13:57:35', '2024-12-08 13:57:35');
INSERT INTO `fans` (`id`, `userId`, `upId`, `createTime`, `updateTime`) VALUES ('1733637468257', '1733557781990', '1621553753077', '2024-12-08 13:57:48', '2024-12-08 13:57:48');
INSERT INTO `fans` (`id`, `userId`, `upId`, `createTime`, `updateTime`) VALUES ('1733637505354', '1733557943862', '1621553753077', '2024-12-08 13:58:25', '2024-12-08 13:58:25');
INSERT INTO `fans` (`id`, `userId`, `upId`, `createTime`, `updateTime`) VALUES ('1734763555062', '1733557750529', '1621553753077', '2024-12-21 14:45:55', '2024-12-21 14:45:55');
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
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734354407027', '1734172437248', '2024-12-17 19:34:48');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734435658380', '1734172437248', '2024-12-17 19:41:46');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734354956771', '1621553753077', '2024-12-17 20:10:48');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734355490519', '1621553753077', '2024-12-17 20:10:52');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734435658380', '1621553753077', '2024-12-17 20:10:58');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734436101699', '1621553753077', '2024-12-17 20:11:01');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734354609522', '1621553753077', '2024-12-17 20:11:05');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734355490519', '1734172437248', '2024-12-21 14:05:16');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734099850678', '1733557750529', '2024-12-21 14:13:08');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734354407027', '1733557750529', '2024-12-21 14:13:08');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734354609522', '1733557750529', '2024-12-21 14:13:09');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734355490519', '1733557750529', '2024-12-21 14:13:10');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734098690057', '1733557750529', '2024-12-22 16:08:34');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734951390163', '1734951047784', '2024-12-23 18:56:39');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734961382880', '1733554539541', '2024-12-23 21:45:33');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734354407027', '1733557936285', '2024-12-24 19:25:19');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734434538835', '1733557936285', '2024-12-24 19:25:38');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734098831902', '1621553753077', '2024-12-24 19:32:48');
INSERT INTO `favorite` (`songId`, `userId`, `createTime`) VALUES ('1734098690057', '1621553753077', '2024-12-24 19:38:16');
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
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1733833489636', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1733833489620', '2024-12-10 20:24:49', '2024-12-10 20:24:49');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1733833535685', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1733833535670', '2024-12-10 20:25:35', '2024-12-10 20:25:35');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1733834472052', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1733834472042', '2024-12-10 20:41:12', '2024-12-10 20:41:12');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1733834500809', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1733834500799', '2024-12-10 20:41:40', '2024-12-10 20:41:40');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1733834557148', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1733834557126', '2024-12-10 20:42:37', '2024-12-10 20:42:37');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1733837103705', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1733837103692', '2024-12-10 21:25:03', '2024-12-10 21:25:03');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734353375850', '1621553753077', NULL, 0, '创建了', NULL, NULL, NULL, '1734353375836', NULL, '2024-12-16 20:49:35', '2024-12-16 20:49:35');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734353422996', '1621553753077', NULL, 0, '创建了', NULL, NULL, NULL, '1734353422982', NULL, '2024-12-16 20:50:22', '2024-12-16 20:50:22');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734353499526', '1621553753077', NULL, 0, '创建了', NULL, NULL, NULL, '1734353499515', NULL, '2024-12-16 20:51:39', '2024-12-16 20:51:39');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734353555713', '1621553753077', NULL, 0, '创建了', NULL, NULL, NULL, '1734353555700', NULL, '2024-12-16 20:52:35', '2024-12-16 20:52:35');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734353647656', '1621553753077', NULL, 0, '创建了', NULL, NULL, NULL, '1734353647642', NULL, '2024-12-16 20:54:07', '2024-12-16 20:54:07');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734353705347', '1621553753077', NULL, 0, '创建了', NULL, NULL, NULL, '1734353705332', NULL, '2024-12-16 20:55:05', '2024-12-16 20:55:05');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734353744807', '1621553753077', NULL, 0, '创建了', NULL, NULL, NULL, '1734353744792', NULL, '2024-12-16 20:55:44', '2024-12-16 20:55:44');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734353804878', '1733554539541', NULL, 0, '创建了', NULL, NULL, NULL, '1734353804862', NULL, '2024-12-16 20:56:44', '2024-12-16 20:56:44');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734353842957', '1733554539541', NULL, 0, '创建了', NULL, NULL, NULL, '1734353842944', NULL, '2024-12-16 20:57:22', '2024-12-16 20:57:22');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734353887557', '1733554539541', NULL, 0, '创建了', NULL, NULL, NULL, '1734353887542', NULL, '2024-12-16 20:58:07', '2024-12-16 20:58:07');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734435770900', '1734172437248', NULL, 0, '创建了', NULL, NULL, NULL, '1734435770886', NULL, '2024-12-17 19:42:50', '2024-12-17 19:42:50');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734435813757', '1734172437248', NULL, 0, '创建了', NULL, NULL, NULL, '1734435813742', NULL, '2024-12-17 19:43:33', '2024-12-17 19:43:33');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734521664046', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734521664022', '2024-12-18 19:34:24', '2024-12-18 19:34:24');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734521758362', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734521758338', '2024-12-18 19:35:58', '2024-12-18 19:35:58');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734521861265', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734521861249', '2024-12-18 19:37:41', '2024-12-18 19:37:41');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734521932488', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734521932474', '2024-12-18 19:38:52', '2024-12-18 19:38:52');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734522028080', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734522028058', '2024-12-18 19:40:28', '2024-12-18 19:40:28');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734522138655', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734522138643', '2024-12-18 19:42:18', '2024-12-18 19:42:18');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734522193662', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734522193650', '2024-12-18 19:43:13', '2024-12-18 19:43:13');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734522236594', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734522236580', '2024-12-18 19:43:56', '2024-12-18 19:43:56');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734522286470', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734522286455', '2024-12-18 19:44:46', '2024-12-18 19:44:46');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734522477229', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734522477208', '2024-12-18 19:47:57', '2024-12-18 19:47:57');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734522524695', '1621553753077', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1734522524682', '2024-12-18 19:48:44', '2024-12-18 19:48:44');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734761079249', '1734172437248', NULL, 0, '点赞了', NULL, '1734761076290', NULL, NULL, NULL, '2024-12-21 14:04:39', '2024-12-21 14:04:39');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734761837157', '1733557750529', NULL, 0, '创建了', NULL, NULL, NULL, '1734761837141', NULL, '2024-12-21 14:17:17', '2024-12-21 14:17:17');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734761872252', '1733557750529', NULL, 0, '创建了', NULL, NULL, NULL, '1734761872244', NULL, '2024-12-21 14:17:52', '2024-12-21 14:17:52');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734761927819', '1733557750529', NULL, 0, '创建了', NULL, NULL, NULL, '1734761927807', NULL, '2024-12-21 14:18:47', '2024-12-21 14:18:47');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734761966043', '1733557750529', NULL, 0, '创建了', NULL, NULL, NULL, '1734761966033', NULL, '2024-12-21 14:19:26', '2024-12-21 14:19:26');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734767982307', '1733554539541', NULL, 0, '点赞了', NULL, '1734767971392', NULL, NULL, NULL, '2024-12-21 15:59:42', '2024-12-21 15:59:42');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734951795975', '1621553753077', NULL, 1, '点赞了', NULL, '1734951771426', NULL, NULL, NULL, '2024-12-23 19:03:15', '2024-12-23 20:49:50');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734952270010', '1621553753077', NULL, 0, '点赞了', NULL, '1734761076290', NULL, NULL, NULL, '2024-12-23 19:11:10', '2024-12-23 19:11:10');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734955040971', '1621553753077', NULL, 1, '点赞了', NULL, '1734954860276', NULL, NULL, NULL, '2024-12-23 19:57:20', '2024-12-23 20:49:51');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734955485194', '1621553753077', NULL, 1, '点赞了', NULL, '1734955481295', NULL, NULL, NULL, '2024-12-23 20:04:45', '2024-12-23 20:49:52');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734960401879', '1621553753077', NULL, 0, '点赞了', NULL, '1734955581718', NULL, NULL, NULL, '2024-12-23 21:26:41', '2024-12-23 21:26:41');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734960996168', '1621553753077', NULL, 0, '点赞了', NULL, '1734960993368', NULL, NULL, NULL, '2024-12-23 21:36:36', '2024-12-23 21:36:36');
INSERT INTO `message` (`id`, `userId`, `arId`, `checkout`, `content`, `alId`, `cId`, `vId`, `pId`, `ccId`, `createTime`, `updateTime`) VALUES ('1734961078381', '1621553753077', NULL, 0, '点赞了', NULL, '1734954981682', NULL, NULL, NULL, '2024-12-23 21:37:58', '2024-12-23 21:37:58');
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
INSERT INTO `moment` (`id`, `content`, `userId`, `tId`, `songId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `picUrl`) VALUES ('1734765615414', '在人生的道路上，从来没有全身而退，坐享其成，不劳而获一说。你不努力，就得出局', '1621553753077', '1734765493237', '1734354407027', '2024-12-21 15:20:15', '2024-12-21 15:20:15', '3.jpg', 'image/jpeg', './upload/moment/picture', '1734765615425.jpg', 64025, 'http://localhost:8200/moment/picture?id=1734765615414');
INSERT INTO `moment` (`id`, `content`, `userId`, `tId`, `songId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `picUrl`) VALUES ('1734765640295', '再长的路，一步步也能走完；再短的路，不迈开双脚也无法到达。还在咬牙坚持的你，请不要泄气。你的日积月累，早晚会成为别人的望尘莫及', '1621553753077', '1734765493237', '1734434044087', '2024-12-21 15:20:40', '2024-12-21 15:20:40', '2.jpg', 'image/jpeg', './upload/moment/picture', '1734765640304.jpg', 68669, 'http://localhost:8200/moment/picture?id=1734765640295');
INSERT INTO `moment` (`id`, `content`, `userId`, `tId`, `songId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `picUrl`) VALUES ('1734765757917', '生命里的很多时候，我们只剩独自一人。就像茫茫大海上的一座灯塔，静静守护着属于自己的岛屿，以抵抗夜以继日的孤独', '1733554539541', '1734765493237', '1734434538835', '2024-12-21 15:22:37', '2024-12-21 15:22:37', '1697617486618_594604158_700.jpg', 'image/jpeg', './upload/moment/picture', '1734765757927.jpg', 123457, 'http://localhost:8200/moment/picture?id=1734765757917');
INSERT INTO `moment` (`id`, `content`, `userId`, `tId`, `songId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `picUrl`) VALUES ('1734765782476', '人的一生，总是难免有浮沉。不会永远如旭日东升，也不会永远痛苦潦倒。反复地一浮一沉，对于一个人来说，正是磨练。因此，浮在上面的，的，不必骄傲；沉在底下的，更用不着悲观。必须以率直、谦虚的态度，乐观进取、向前迈进', '1733554539541', '1734765493237', '1734355552356', '2024-12-21 15:23:02', '2024-12-21 15:23:02', '1706717324015_526042689_700.jpg', 'image/jpeg', './upload/moment/picture', '1734765782490.jpg', 120114, 'http://localhost:8200/moment/picture?id=1734765782476');
INSERT INTO `moment` (`id`, `content`, `userId`, `tId`, `songId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `picUrl`) VALUES ('1734765844225', '他就像大海里的灯塔，你不需要他的时候他好像是不存在的，可是你回过头去找他，无论大风还是大雨，他好像一直都在，散发着微弱又温暖的光', '1733554539541', '1734765493237', '1734354956771', '2024-12-21 15:24:04', '2024-12-21 15:24:04', '1700639229439_598675714_700.jpg', 'image/jpeg', './upload/moment/picture', '1734765844233.jpg', 105699, 'http://localhost:8200/moment/picture?id=1734765844225');
INSERT INTO `moment` (`id`, `content`, `userId`, `tId`, `songId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `picUrl`) VALUES ('1734961142834', '今天是听歌的一天', '1621553753077', '1734765493237', '1734355552356', '2024-12-23 21:39:02', '2024-12-23 21:39:02', '5.avif', 'image/avif', './upload/moment/picture', '1734961142848.avif', 88151, 'http://localhost:8200/moment/picture?id=1734961142834');
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
INSERT INTO `order` (`id`, `userId`, `createTime`, `price`, `cId`, `status`, `delete`) VALUES ('1734162796680_12_1_1733557774861_1734163128339', '1733557774861', '2024-12-14 15:58:48', '12', '1734162796680', 0, 1);
INSERT INTO `order` (`id`, `userId`, `createTime`, `price`, `cId`, `status`, `delete`) VALUES ('1734162809353_45_3_1621553753077_1734163007529', '1621553753077', '2024-12-14 15:56:47', '45', '1734162809353', 1, 0);
INSERT INTO `order` (`id`, `userId`, `createTime`, `price`, `cId`, `status`, `delete`) VALUES ('1734162809353_45_3_1733554539541_1734961488062', '1733554539541', '2024-12-23 21:44:48', '45', '1734162809353', 1, 0);
INSERT INTO `order` (`id`, `userId`, `createTime`, `price`, `cId`, `status`, `delete`) VALUES ('1734162809353_45_3_1733557750529_1734854940969', '1733557750529', '2024-12-22 16:09:00', '45', '1734162809353', 0, 1);
INSERT INTO `order` (`id`, `userId`, `createTime`, `price`, `cId`, `status`, `delete`) VALUES ('1734162809353_45_3_1733557750529_1734854958179', '1733557750529', '2024-12-22 16:09:18', '45', '1734162809353', 0, 1);
INSERT INTO `order` (`id`, `userId`, `createTime`, `price`, `cId`, `status`, `delete`) VALUES ('1734162809353_45_3_1733557750529_1734854990901', '1733557750529', '2024-12-22 16:09:50', '45', '1734162809353', 1, 0);
INSERT INTO `order` (`id`, `userId`, `createTime`, `price`, `cId`, `status`, `delete`) VALUES ('1734162824592_178_12_1733554539541_1734163064209', '1733554539541', '2024-12-14 15:57:44', '178', '1734162824592', 1, 0);
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
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734353375836', '2024网络热歌大盘点', '2024网络热歌曲大合集，你听过几首？\n        ', '1621553753077', 10, '2024-12-16 20:49:35', '2024-12-23 21:35:11', 'http://localhost:8200/playlist/cover?id=1734353375836');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734353422982', '元气满满通勤路', '通勤必备丨元气满满通勤路', '1621553753077', 12, '2024-12-16 20:50:22', '2024-12-24 19:25:19', 'http://localhost:8200/playlist/cover?id=1734353422982');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734353499515', '港台怀旧金曲丨7080年代经典老歌', '岁月无声，依然钟情于港乐，在那个全盛的黄金年代，留下了多少不可磨灭的记忆。愿风继续吹，花火灿烂，爱是永恒，港乐的经典一直能留在乐迷的心中。\n        ', '1621553753077', 3, '2024-12-16 20:51:39', '2024-12-22 16:06:09', 'http://localhost:8200/playlist/cover?id=1734353499515');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734353555700', '俏皮甜美甜过初恋', '开启心动之旅，捕捉你旋律\n        ', '1621553753077', 0, '2024-12-16 20:52:35', '2024-12-16 20:52:35', 'http://localhost:8200/playlist/cover?id=1734353555700');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734353647642', 'Kpop热潮年度总结', '你最好是别爱我，别让我记得悸动，别让我在绝望和簇喜间狂奔，别让我留恋怀抱，别让我沉溺，别让我口是心非说你走也没关系啊，最好是别。也别让我听到你的名字时表面若无其事，心里却大动干戈\n        ', '1621553753077', 1, '2024-12-16 20:54:07', '2024-12-22 16:06:46', 'http://localhost:8200/playlist/cover?id=1734353647642');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734353705332', '冬日恋曲丨两个人的温暖，不惧寒冷', '冬日恋曲丨两个人的温暖，不惧寒冷', '1621553753077', 0, '2024-12-16 20:55:05', '2024-12-16 20:55:05', 'http://localhost:8200/playlist/cover?id=1734353705332');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734353744792', '失眠枕边音 ：消除疲劳安然入睡', '失眠枕边音 ：消除疲劳安然入睡', '1621553753077', 1, '2024-12-16 20:55:44', '2024-12-21 16:26:53', 'http://localhost:8200/playlist/cover?id=1734353744792');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734353804862', '经典情歌丨这世间，有种爱恋在远望', '经典情歌丨这世间，有种爱恋在远望', '1733554539541', 0, '2024-12-16 20:56:44', '2024-12-16 20:56:44', 'http://localhost:8200/playlist/cover?id=1734353804862');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734353842944', '伴读轻音：阅读是生活的一种乐趣', '伴读轻音：阅读是生活的一种乐趣', '1733554539541', 0, '2024-12-16 20:57:22', '2024-12-16 20:57:22', 'http://localhost:8200/playlist/cover?id=1734353842944');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734353887542', '那些年的青春', '那些年的青春', '1733554539541', 0, '2024-12-16 20:58:07', '2024-12-16 20:58:07', 'http://localhost:8200/playlist/cover?id=1734353887542');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734435770886', '车载小情歌：把浪漫装进CD里', '想和TA来一场说走就走的旅行，搭配一首充满浪漫气息的小情歌，手牵手向快乐出发吧！\n        ', '1734172437248', 1, '2024-12-17 19:42:50', '2024-12-23 21:24:54', 'http://localhost:8200/playlist/cover?id=1734435770886');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734435813742', '注视是离别的开始', '未来路漫漫，可不再会有我和你的我们，在播放到哪一首歌时你最难以释怀...\n        ', '1734172437248', 0, '2024-12-17 19:43:33', '2024-12-17 19:43:33', 'http://localhost:8200/playlist/cover?id=1734435813742');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734761837141', '如梦似幻', '收录各大中文V家歌曲，一同赏鉴精灵般的歌姬轻吟', '1733557750529', 0, '2024-12-21 14:17:17', '2024-12-21 14:17:17', 'http://localhost:8200/playlist/cover?id=1734761837141');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734761872244', '华语流行', '华语流行', '1733557750529', 0, '2024-12-21 14:17:52', '2024-12-21 14:17:52', 'http://localhost:8200/playlist/cover?id=1734761872244');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734761927807', '叮咚！今日份可爱记得签收', '你听！古灵精怪俏皮可爱的韩系少女风get到你的少女心了吗？', '1733557750529', 0, '2024-12-21 14:18:47', '2024-12-21 14:18:47', 'http://localhost:8200/playlist/cover?id=1734761927807');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1734761966033', '国风新歌：炉向初冬火，温暖庇人心', '国风新歌：炉向初冬火，温暖庇人心', '1733557750529', 1, '2024-12-21 14:19:26', '2024-12-24 19:13:46', 'http://localhost:8200/playlist/cover?id=1734761966033');
INSERT INTO `playlist` (`id`, `name`, `description`, `userId`, `playCount`, `createTime`, `updateTime`, `coverUrl`) VALUES ('1735040248948', '人生的美好在哪里', '人生的美好在哪里', '1645620606883', 0, '2024-12-24 19:37:28', '2024-12-24 19:37:28', 'http://localhost:8200/playlist/cover?id=1735040248948');
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
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353375836', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353422982', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353499515', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353555700', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353647642', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353705332', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353744792', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353804862', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353842944', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353887542', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734435813742', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761966033', '1731934607132');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353647642', '1731934612470');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353744792', '1731934612470');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353887542', '1731934612470');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761872244', '1731934612470');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353375836', '1731934620384');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353499515', '1731934620384');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353647642', '1731934620384');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353887542', '1731934620384');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734435770886', '1731934620384');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734435813742', '1731934620384');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761872244', '1731934620384');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761966033', '1731934620384');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353375836', '1731934629184');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353422982', '1731934629184');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353705332', '1731934629184');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353804862', '1731934629184');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353842944', '1731934629184');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734435813742', '1731934629184');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761966033', '1731934629184');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353422982', '1731934633821');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353705332', '1731934633821');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353804862', '1731934633821');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761927807', '1731934633821');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353499515', '1731934638335');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353555700', '1731934638335');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353842944', '1731934638335');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761837141', '1731934638335');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761872244', '1731934638335');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761927807', '1731934638335');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353555700', '1731934643633');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734435770886', '1731934643633');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761837141', '1731934643633');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761927807', '1731934643633');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734353744792', '1731934648002');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734435770886', '1731934648002');
INSERT INTO `playlist_category` (`pId`, `cateId`) VALUES ('1734761837141', '1731934648002');
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
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734353375852', '1734353375836', '1733220064982_560877346_500.jpg', 'image/jpeg', './upload/playlist/cover', '1734353375848.jpg', 47440, '2024-12-16 20:49:35', '2024-12-16 20:49:35');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734353422997', '1734353422982', '1683793024059_505728398_700.jpg', 'image/jpeg', './upload/playlist/cover', '1734353422994.jpg', 41379, '2024-12-16 20:50:22', '2024-12-16 20:50:22');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734353499526', '1734353499515', '1731489394304_174039025_700.jpg', 'image/jpeg', './upload/playlist/cover', '1734353499524.jpg', 49077, '2024-12-16 20:51:39', '2024-12-16 20:51:39');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734353555714', '1734353555700', '1706717324015_526042689_700.jpg', 'image/jpeg', './upload/playlist/cover', '1734353555711.jpg', 59064, '2024-12-16 20:52:35', '2024-12-16 20:52:35');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734353647655', '1734353647642', 'Kpop.jpg', 'image/jpeg', './upload/playlist/cover', '1734353647654.jpg', 59267, '2024-12-16 20:54:07', '2024-12-16 20:54:07');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734353705348', '1734353705332', '1702716709706_554555848_700.jpg', 'image/jpeg', './upload/playlist/cover', '1734353705344.jpg', 60691, '2024-12-16 20:55:05', '2024-12-16 20:55:05');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734353744808', '1734353744792', '1700639229439_598675714_700.jpg', 'image/jpeg', './upload/playlist/cover', '1734353744804.jpg', 52939, '2024-12-16 20:55:44', '2024-12-16 20:55:44');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734353804879', '1734353804862', '1698899725872_554555848_700.jpg', 'image/jpeg', './upload/playlist/cover', '1734353804875.jpg', 59138, '2024-12-16 20:56:44', '2024-12-16 20:56:44');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734353842958', '1734353842944', '1697617486618_594604158_700.jpg', 'image/jpeg', './upload/playlist/cover', '1734353842955.jpg', 61198, '2024-12-16 20:57:22', '2024-12-16 20:57:22');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734353887558', '1734353887542', '1697363620836_516983680_700.jpg', 'image/jpeg', './upload/playlist/cover', '1734353887554.jpg', 50993, '2024-12-16 20:58:07', '2024-12-16 20:58:07');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734435770901', '1734435770886', '1639391305931_560877346_700.jpg', 'image/jpeg', './upload/playlist/cover', '1734435770898.jpg', 51087, '2024-12-17 19:42:50', '2024-12-17 19:42:50');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734435813758', '1734435813742', '1731052134457_577097598_700.jpg', 'image/jpeg', './upload/playlist/cover', '1734435813754.jpg', 41753, '2024-12-17 19:43:33', '2024-12-17 19:43:33');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734761837158', '1734761837141', '1.jpg', 'image/jpeg', './upload/playlist/cover', '1734761837154.jpg', 61648, '2024-12-21 14:17:17', '2024-12-21 14:17:17');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734761872259', '1734761872244', '2.jpg', 'image/jpeg', './upload/playlist/cover', '1734761872257.jpg', 49124, '2024-12-21 14:17:52', '2024-12-21 14:17:52');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734761927826', '1734761927807', '3.jpg', 'image/jpeg', './upload/playlist/cover', '1734761927824.jpg', 41272, '2024-12-21 14:18:47', '2024-12-21 14:18:47');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734761966048', '1734761966033', '4.jpg', 'image/jpeg', './upload/playlist/cover', '1734761966046.jpg', 49278, '2024-12-21 14:19:26', '2024-12-21 14:19:26');
INSERT INTO `playlist_cover` (`id`, `pId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1735040248964', '1735040248948', '4.jpg', 'image/jpeg', './upload/playlist/cover', '1735040248961.jpg', 112519, '2024-12-24 19:37:28', '2024-12-24 19:37:28');
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
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353842944', '1734098690057');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353804862', '1734098690057');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353842944', '1734098831902');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353887542', '1734354956771');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353804862', '1734354956771');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353705332', '1734098690057');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353422982', '1734099850678');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353422982', '1734354407027');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353744792', '1734354609522');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353422982', '1734354609522');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353705332', '1734354609522');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353375836', '1734354609522');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353375836', '1734355490519');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353422982', '1734355490519');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353647642', '1734355490519');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353744792', '1734355490519');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353422982', '1734355552356');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353744792', '1734355552356');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734435813742', '1734435658380');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734435770886', '1734435658380');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353499515', '1734436101699');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353499515', '1734354956771');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734761837141', '1734098690057');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734761872244', '1734098831902');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734761927807', '1734434044087');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734761872244', '1734434044087');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734761837141', '1734434044087');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734761966033', '1734434044087');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734761966033', '1734354609522');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734761927807', '1734355552356');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353647642', '1734098690057');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353375836', '1734098690057');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353499515', '1734098690057');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353744792', '1734098690057');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353555700', '1734098690057');
INSERT INTO `playlist_song` (`pId`, `songId`) VALUES ('1734353705332', '1734434044087');
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
INSERT INTO `program` (`id`, `name`, `playCount`, `userId`, `cId`, `createTime`, `mimetype`, `dest`, `filename`, `originalname`, `size`, `dt`, `url`) VALUES ('1732798150711', 'wefweffwfwfe', '0', '1645620606883', '1732798139507', '2024-11-28 20:49:10', 'audio/mpeg', './upload/channel/program', '1732798150726.mp3', 'blackpink-lovesick-girls-m-v-128-ytshorts.savetube.me.mp3', 3226221, '201624', 'http://localhost:8200/channel/program?id=1732798150711');
INSERT INTO `program` (`id`, `name`, `playCount`, `userId`, `cId`, `createTime`, `mimetype`, `dest`, `filename`, `originalname`, `size`, `dt`, `url`) VALUES ('1734529418420', '1', '3', '1621553753077', '1734521758338', '2024-12-18 21:43:38', 'audio/mpeg', './upload/channel/program', '1734529418439.mp3', '最后一页-苏晗.320.mp3', 10025992, '250618.77599999998', 'http://localhost:8200/channel/program?id=1734529418420');
INSERT INTO `program` (`id`, `name`, `playCount`, `userId`, `cId`, `createTime`, `mimetype`, `dest`, `filename`, `originalname`, `size`, `dt`, `url`) VALUES ('1734529425071', '2', '4', '1621553753077', '1734521758338', '2024-12-18 21:43:45', 'audio/mpeg', './upload/channel/program', '1734529425086.mp3', '最后一页-苏晗.320.mp3', 10025992, '250618.77599999998', 'http://localhost:8200/channel/program?id=1734529425071');
INSERT INTO `program` (`id`, `name`, `playCount`, `userId`, `cId`, `createTime`, `mimetype`, `dest`, `filename`, `originalname`, `size`, `dt`, `url`) VALUES ('1734529430959', '3', '0', '1621553753077', '1734521758338', '2024-12-18 21:43:50', 'audio/mpeg', './upload/channel/program', '1734529430972.mp3', '最后一页-苏晗.320.mp3', 10025992, '250618.77599999998', 'http://localhost:8200/channel/program?id=1734529430959');
INSERT INTO `program` (`id`, `name`, `playCount`, `userId`, `cId`, `createTime`, `mimetype`, `dest`, `filename`, `originalname`, `size`, `dt`, `url`) VALUES ('1734529442220', '44444444444444444444444444', '23', '1621553753077', '1734521758338', '2024-12-18 21:44:02', 'audio/mpeg', './upload/channel/program', '1734529442233.mp3', '最后一页-苏晗.320.mp3', 10025992, '250618.77599999998', 'http://localhost:8200/channel/program?id=1734529442220');
INSERT INTO `program` (`id`, `name`, `playCount`, `userId`, `cId`, `createTime`, `mimetype`, `dest`, `filename`, `originalname`, `size`, `dt`, `url`) VALUES ('1734529490956', '带上你的音乐和故事 与我们相遇 .. 每一位小伙伴的经历 都是我们创作的源头..带上你的音乐和故事 与我们相遇 .. 每一位小伙伴的经历 都是我们创作的源头..', '0', '1621553753077', '1734522193650', '2024-12-18 21:44:50', 'audio/mpeg', './upload/channel/program', '1734529490970.mp3', '最后一页-苏晗.320.mp3', 10025992, '250618.77599999998', 'http://localhost:8200/channel/program?id=1734529490956');
INSERT INTO `program` (`id`, `name`, `playCount`, `userId`, `cId`, `createTime`, `mimetype`, `dest`, `filename`, `originalname`, `size`, `dt`, `url`) VALUES ('1734529774588', '在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要定制计数能力在某些场景下，需要在某些场景下，需要定制计数能力在某些场景下，需要定制计数能定制计数能力在某些场景下，需要定制计数能力', '0', '1621553753077', '1734522193650', '2024-12-18 21:49:34', 'audio/mpeg', './upload/channel/program', '1734529774600.mp3', '最后一页-苏晗.320.mp3', 10025992, '250618.77599999998', 'http://localhost:8200/channel/program?id=1734529774588');
INSERT INTO `program` (`id`, `name`, `playCount`, `userId`, `cId`, `createTime`, `mimetype`, `dest`, `filename`, `originalname`, `size`, `dt`, `url`) VALUES ('1734763669605', '3333', '0', '1621553753077', '1734521861249', '2024-12-21 14:47:49', 'audio/mpeg', './upload/channel/program', '1734763669623.mp3', '人间烟火.mp3', 9349958, '233717.55099999998', 'http://localhost:8200/channel/program?id=1734763669605');
INSERT INTO `program` (`id`, `name`, `playCount`, `userId`, `cId`, `createTime`, `mimetype`, `dest`, `filename`, `originalname`, `size`, `dt`, `url`) VALUES ('1734763677867', '5555555555', '0', '1621553753077', '1734521861249', '2024-12-21 14:47:57', 'audio/mpeg', './upload/channel/program', '1734763677883.mp3', '人间烟火.mp3', 9349958, '233717.55099999998', 'http://localhost:8200/channel/program?id=1734763677867');
INSERT INTO `program` (`id`, `name`, `playCount`, `userId`, `cId`, `createTime`, `mimetype`, `dest`, `filename`, `originalname`, `size`, `dt`, `url`) VALUES ('1734763690311', '12', '0', '1621553753077', '1734521861249', '2024-12-21 14:48:10', 'audio/mpeg', './upload/channel/program', '1734763690322.mp3', '69938800210163922.mp3', 8723020, '218044.082', 'http://localhost:8200/channel/program?id=1734763690311');
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
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734098690057', '一程山路', '1734097612719', '1734098209689', '2024-12-09', '一程山路', 'http://localhost:8200/song/source?id=1734098690057', '[00:00.000] 作词 : 毛不易\n[00:01.000] 作曲 : 毛不易\n[00:02.000] 编曲 : 韦伟\n[00:03.000] 制作人 : 韦伟\n[00:10.890]\n[00:28.216]青石板留着谁的梦啊\n[00:34.092]一场秋雨 又落一地花\n[00:41.660]旅人匆匆地赶路啊\n[00:48.791]走四季 访人家\n[00:54.510]\n[00:55.011]如同昨夜天光乍破了远山的轮廓\n[01:02.076]想起很久之前我们都忘了说\n[01:09.772]一叶曲折过后 又一道坎坷\n[01:16.255]走不出 看不破\n[01:21.994]\n[01:51.759]山谷的薄雾吻着烟霞\n[01:57.789]枯叶之下 藏多少情话\n[02:05.142]划破天空的归鸟啊\n[02:11.896]它不问 你不答\n[02:17.822]\n[02:18.530]如同昨夜天光乍破了远山的轮廓\n[02:25.406]想起很久之前我们都忘了说\n[02:32.837]一叶曲折过后 又一道坎坷\n[02:39.838]走不出 看不破\n[02:46.248]\n[02:46.472]潺潺流水终于穿过了群山一座座\n[02:53.276]好像多年之后你依然执着\n[03:00.929]白云是否也听过你的诉说\n[03:08.231]笑着你 笑着我\n[03:14.540]\n[03:15.023]白云是否也听过你的诉说\n[03:21.525]笑着你 笑着我\n[03:28.413]/\n[03:28.913]制作人Producer:韦伟Oldbanana\n[03:29.390]吉他Guitar:任强 Ren Qiang 谢星 Xie Xing\n[03:29.730]bass:韩阳 Han Yang\n[03:29.976]鼓Drums:图灵 Tu Ling\n[03:30.277]键盘Keyboard:韦伟Oldbanana\n[03:30.538]琵琶Pipa:梁雁 Liang Yan\n[03:31.082]录音Recording:李越Li Yue@野火春风EFO Sound\n[03:31.327]人声编辑Vocal Editing:祝薇Avi Zhu\n[03:31.598]配唱制作人Vocal Produced by：何文锐@光合声动 He WenRui@Sound Studio\n[03:31.880]和声编写Backing Vocal Arranged by：何文锐@光合声动 He WenRui@Sound Studio\n[03:32.105]和声Backing Vocal Performed by：何文锐  姜美彤@光合声动 He Wenrui Jiang Meitong @Sound Studio\n[03:32.398]和声录音 Backing Vocal Recorded by：豆豆龙@Allanwang Studio\n[03:32.659]弦乐Strings:国际首席爱乐乐团The International Prima Philharmonic Orchestra\n[03:32.922]混音Mixing:李越Li Yue@野火春风EFO Sound\n[03:33.208]母带&母带工作室Mastering&Studios：Randy Merrill@Steriling Sound NY\n[03:33.481]音乐制作 Produced : 哇唧唧哇 Wajijiwa Entertainment (Tianjin) Co., Ltd.\n[03:33.722]出品、母带版权公司 Production Company、OP：\n[03:33.988]哇唧唧哇 Wajijiwa Entertainment (Tianjin) Co., Ltd.\n', 0, '173', '2024-12-24 19:37:50');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734098831902', '无名的人', '1734097612719', '1734098296728', '2024-12-02', '无名的人', 'http://localhost:8200/song/source?id=1734098831902', NULL, 0, '6', '2024-12-23 21:17:33');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734099850678', 'As If It’s Your Last - BLACKPINK', '1734097838043', '1734098947835', '2024-12-02', 'As If It’s Your Last - BLACKPINK', 'http://localhost:8200/song/source?id=1734099850678', '', 1, '7', '2024-12-23 21:35:41');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734354407027', '可能', '1734097750846', '1734354377712', '2024-12-09', '可能一切的可能 相信才有可能\n可能拥有过梦想 才能叫做青春', 'http://localhost:8200/song/source?id=1734354407027', '[00:00.00] 作词 : 宁缺\n[00:01.00] 作曲 : 宁缺\n[00:02.00] 编曲 : 曲比阿且\n[00:03.00] 出品人 : 潘鸿业/陆瑒\n[00:26.70]可能南方的阳光  照着北方的风\n[00:31.47]可能时光被吹走  从此无影无踪\n[00:36.55]可能故事只剩下  一个难忘的人\n[00:41.50]可能在昨夜梦里  依然笑得纯真\n[00:48.91]可能北京的后海  许多漂泊的魂\n[00:53.61]可能成都小酒馆  有群孤独的人\n[00:58.71]可能枕边有微笑  才能暖你清晨\n[01:03.41]可能夜空有流星  才能照你前行  \n[01:10.93]可能西安城墙上  有人誓言不分  \n[01:15.60]可能要去到大理  才算爱得认真\n[01:20.57]可能谁说要陪你  牵手走完一生\n[01:25.38]可能笑着流出泪  某天在某时辰  \n[01:54.90]可能桂林有渔船  为你迷茫点灯\n[01:59.85]可能在呼伦草原  牛羊流成风景\n[02:04.88]可能再也找不到  愿意相信的人\n[02:09.63]可能穿越了彷徨  脚步才能坚定\n[02:16.94]可能武当山道上  有人虔诚攀登\n[02:21.87]可能周庄小巷里  忽然忘掉年轮\n[02:26.90]可能要多年以后  才能看清曾经\n[02:31.73]可能在当时身边  有双温柔眼晴\n[02:38.88]可能西安城墙上  有人誓言不分  \n[02:43.75]可能要去到大理  才算爱得认真\n[02:48.73]可能谁说要陪你  牵手走完一生\n[02:53.60]可能笑着流出泪  \n[02:58.81]可能终于有一天  刚好遇见爱情\n[03:03.44]可能永远在路上  有人奋斗前行\n[03:08.40]可能一切的可能  相信才有可能\n[03:13.29]可能拥有过梦想  才能叫做青春  \n[03:23.39]\n[03:32.99] 录音 : 张雨农\n[03:33.44] 混音 : 王朋\n[03:33.90] 母带 : 全相彦\n[03:34.35] 平面 : 华玮轩\n[03:34.81] 宣传发行 : 冷小婧/杜梦婷\n[03:35.26] 企划 : 刘芳/袋熊/李思睿/威尔\n[03:35.71] 统筹 : 陈亚飞\n[03:36.17] 营销 : 银河方舟X壳壳菠萝\n[03:36.62] 项目总监 : 庄有豪\n[03:37.08] OP : 北京金翼龙国际文化传媒有限公司\n[03:37.53] SP : 银河方舟', 1, '33', '2024-12-24 19:25:19');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734354609522', '人间烟火', '1734097750846', '1734354582213', '2024-12-10', '《人间烟火》是歌手程响倾情演唱的一首作品，歌曲用“你曾盛开过”奠定了整首歌怀念故人的感情基调，描绘了一场刻骨铭心的“人间烟火”，悠扬的旋律却也让人久久不能释怀。', 'http://localhost:8200/song/source?id=1734354609522', '', 1, '13', '2024-12-24 19:32:27');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734354956771', '遇见', '1734354798823', '1734354859107', '2024-12-18', '你的爱 像纯白的羽毛', 'http://localhost:8200/song/source?id=1734354956771', NULL, 0, '6', '2024-12-22 16:06:09');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734355490519', '我记得', '1734355296606', '1734355434355', '2024-11-26', '可我没有金钱也没有得到金钱的答案', 'http://localhost:8200/song/source?id=1734355490519', NULL, 0, '12', '2024-12-23 21:35:11');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734355552356', '程艾影', '1734355296606', '1734355434355', '2024-11-05', '程艾影', 'http://localhost:8200/song/source?id=1734355552356', NULL, 0, '7', '2024-12-24 19:35:49');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734434044087', '在你的身边', '1734433878207', '1734433988006', '2024-12-10', '总以为时间会消融无尽的思念，但到头来，永远在你身边的心愿从未减弱。献给深爱过，却已逐渐远去的那个人。\n\n盛哲的首支独立单曲《在你的身边》正式发行。这首歌由盛哲独立完成词曲和制作，融合了华语流行的细腻及...\n        ', 'http://localhost:8200/song/source?id=1734434044087', NULL, 0, '13', '2024-12-24 19:13:46');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734434538835', '未来是花开万里', '1734434226423', '1734434315544', '2024-12-10', '未来是花开万里', 'http://localhost:8200/song/source?id=1734434538835', NULL, 0, '6', '2024-12-24 19:25:47');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734435658380', 'Butter-Fly', '1734435536222', '1734435613113', '2024-12-10', 'Butter-Fly', 'http://localhost:8200/song/source?id=1734435658380', NULL, 0, '6', '2024-12-23 21:40:54');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734436101699', 'APT', '1734435985352', '1734436067666', '2024-12-19', 'ROSÉ朴彩英正规一辑首单《APT.》惊喜释出，与Bruno Mars合作，以韩国派对游戏为灵感，由ROSÉ参与创作，Bruno Mars、Cirkut、Omer Fedi及Rogét Chahaye...', 'http://localhost:8200/song/source?id=1734436101699', '[00:00.00] 作词 : ROSÉ/Bruno Mars\n[00:01.00] 作曲 : ROSÉ/Bruno Mars\n[00:06.62]아파트 아파트\n[00:08.30]아파트 아파트\n[00:09.86]아파트 아파트\n[00:11.47]Uh, uh huh uh huh\n[00:13.10]아파트 아파트\n[00:14.70]아파트 아파트\n[00:16.28]아파트 아파트\n[00:17.93]Uh, uh huh uh huh\n[00:19.56]Kissy face, kissy face\n[00:21.15]Sent to your phone but,\n[00:22.80]I\'m trying to kiss your lips for real\n[00:25.99]Red hearts, red hearts\n[00:27.61]That’s what I’m on yeah\n[00:29.20]Come give me something I can feel\n[00:31.34]Oh oh oh\n[00:32.51]Don\'t you want me like I want you, baby\n[00:35.67]Don\'t you need me like I need you now\n[00:38.84]Sleep tomorrow but tonight go crazy\n[00:42.06]All you gotta do is just meet me at the\n[00:45.36]아파트 아파트\n[00:46.90]아파트 아파트\n[00:48.47]아파트 아파트\n[00:50.11]Uh, uh huh uh huh\n[00:51.78]아파트 아파트\n[00:53.36]아파트 아파트\n[00:55.00]아파트 아파트\n[00:56.51]Uh, uh huh uh huh\n[00:58.21]It’s whatever it’s whatever it’s whatever you like\n[01:01.50]Turn this 아파트 into a club\n[01:04.27]I’m talking drink, dance, smoke, freak, party all night\n[01:08.45]건배 건배 girl what’s up\n[01:09.93]Oh oh oh\n[01:11.10]Don\'t you want me like I want you, baby\n[01:14.30]Don\'t you need me like I need you now\n[01:17.49]Sleep tomorrow but tonight go crazy\n[01:20.78]All you gotta do is just meet me at the\n[01:24.03]아파트 아파트\n[01:25.55]아파트 아파트\n[01:27.17]아파트 아파트\n[01:28.79]Uh, uh huh uh huh\n[01:30.37]아파트 아파트\n[01:32.03]아파트 아파트\n[01:33.67]아파트 아파트\n[01:35.28]Uh, uh huh uh huh\n[01:36.83]Hey so now you know the game\n[01:39.69]Are you ready?\n[01:41.33]Cause I’m comin to get ya\n[01:42.53]Get ya, get ya\n[01:43.34]Hold on, hold on\n[01:45.76]I’m on my way\n[01:49.75]Yeah yeah yeah yeah yeah\n[01:51.84]I’m on my way\n[01:55.91]Hold on, hold on\n[01:58.55]I’m on my way\n[02:02.62]Yeah yeah yeah yeah yeah\n[02:04.93]I’m on my way\n[02:09.23]Don\'t you want me like I want you, baby\n[02:12.26]Don\'t you need me like I need you now\n[02:15.52]Sleep tomorrow but tonight go crazy All\n[02:18.82]you gotta do is just meet me at the\n[02:21.92]아파트 아파트\n[02:23.52]아파트 아파트\n[02:25.22]아파트 아파트\n[02:26.62]Just meet me at the\n[02:27.87](Uh huh uh huh)\n[02:28.34]아파트 아파트\n[02:29.90]아파트 아파트\n[02:31.55]아파트 아파트\n[02:33.01]Just meet me at the\n[02:34.09](Uh huh uh huh)\n[02:34.79]아파트 아파트\n[02:36.31]아파트 아파트\n[02:37.97]아파트 아파트\n[02:39.39]Just meet me at the\n[02:40.59](Uh huh uh huh)\n[02:41.21]아파트 아파트\n[02:42.80]아파트 아파트\n[02:44.43]아파트 아파트\n[02:45.79]Uh, uh huh uh huh\n', 0, '15', '2024-12-24 19:28:24');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734951390163', '我终于失去了你 ', '1734951260786', '1734951313791', '2024-12-17', '我终于失去了你', 'http://localhost:8200/song/source?id=1734951390163', '[00:00.000] 作词 : 沈光远/李宗盛\n[00:01.000] 作曲 : 赵传/李宗盛\n[00:02.000] 编曲 : 涂惠源\n[00:03.000] 制作人 : 刘天健\n[00:35.300]当所有的人离开我的时候\n[00:40.300]你劝我要耐心等候\n[00:43.300]并且陪我渡过生命中最长的寒冬\n[00:47.300]如此地宽容\n[00:50.300]当所有的人靠紧我的时候\n[00:54.300]你要我安静从容\n[00:58.300]似乎知道我有一颗永不安静的心\n[01:02.300]（我）容易蠢动\n[01:06.300]我终于让千百双手在我面前挥舞\n[01:09.300]我终于拥有了千百个热情的笑容\n[01:13.300]我终于让人群被我深深的打动\n[01:17.300]我却忘了告诉你\n[01:19.300]你一直在我心中\n[01:22.300]啊~我终于失去了你\n[01:25.300]在拥挤的人群中\n[01:30.300]我终于失去了你\n[01:33.300]当我的人生第一次感到光荣\n[01:37.300]啊~我终于失去了你\n[01:40.300]在拥挤的人群中\n[01:44.300]我终于失去了你\n[01:48.300]当我的人生第一次感到光荣\n[01:55.300]当四周掌声如潮水一般的汹涌\n[02:00.300]我见到你眼中有伤心的泪光闪动\n[02:11.300]当所有的人离开我的时候\n[02:40.300]你劝我要耐心等候\n[02:43.300]并且陪我渡过生命中最长的寒冬\n[02:48.300]如此地宽容\n[02:51.000]当所有的人靠紧我的时候\n[02:54.300]你要我安静从容\n[02:58.300]似乎知道我有一颗永不安静的心\n[03:02.300]（我）容易蠢动\n[03:06.300]我终于让千百双手在我面前挥舞\n[03:09.300]我终于拥有了千百个热情的笑容\n[03:13.900]我终于让人群被我深深的打动\n[03:16.900]我却忘了告诉你\n[03:19.900]你一直在我心中\n[03:22.900]啊~我终于失去了你\n[03:25.900]在拥挤的人群中\n[03:29.900]我终于失去了你\n[03:33.900]当我的人生第一次感到光荣\n[03:37.900]啊~我终于失去了你\n[03:40.900]在拥挤的人群中\n[03:44.900]我终于失去了你\n[03:48.900]当我的人生第一次感到光荣\n[03:56.900]啊~我终于失去了你\n[03:59.900]在拥挤的人群中\n[04:03.900]我终于失去了你\n[04:07.900]当我的人生第一次感到光荣\n[04:10.900]啊~我终于失去了你\n[04:14.900]在拥挤的人群中\n[04:19.100]我终于失去了你\n[04:23.100]当我的人生第一次感到光荣\n[04:30.100]当四周掌声如潮水一般的汹涌\n[04:34.700]我见到你眼中有伤心的泪光闪动', 0, '5', '2024-12-24 19:34:00');
INSERT INTO `song` (`id`, `name`, `arId`, `alId`, `publishTime`, `alia`, `mp3Url`, `lyric`, `vip`, `playCount`, `updateTime`) VALUES ('1734961382880', '最后一页', '1734961317333', '1734961358122', '2024-12-18', '最后一页', 'http://localhost:8200/song/source?id=1734961382880', NULL, NULL, '2', '2024-12-24 19:24:00');
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
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734098690103', '1734098690057', 'obj_wo3DlMOGwrbDjj7DisKw_14096440233_4274_639e_66ff_ffee93d87605a8c38c7fa14fbb3c8aa2.mp3', 'audio/mpeg', './upload/song', '1734098690074.mp3', 8635164, '2024-12-13 22:04:50', '2024-12-13 22:04:50', 215850);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734098832032', '1734098831902', '无名的人-毛不易.flac', 'audio/flac', './upload/song', '1734098831919.flac', 54717532, '2024-12-13 22:07:12', '2024-12-13 22:07:12', 282181);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734099850725', '1734099850678', 'M800003Dkr5N2Ue0q4.mp3', 'audio/mpeg', './upload/song', '1734099850699.mp3', 8533955, '2024-12-13 22:24:10', '2024-12-13 22:24:10', 213316);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734354407078', '1734354407027', '69938800210163922.mp3', 'audio/mpeg', './upload/song', '1734354407047.mp3', 8723020, '2024-12-16 21:06:47', '2024-12-16 21:06:47', 218044);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734354609573', '1734354609522', '人间烟火.mp3', 'audio/mpeg', './upload/song', '1734354609539.mp3', 9349958, '2024-12-16 21:10:09', '2024-12-16 21:10:09', 233718);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734354956824', '1734354956771', '遇见-孙燕姿.320.mp3', 'audio/mpeg', './upload/song', '1734354956791.mp3', 8426184, '2024-12-16 21:15:56', '2024-12-16 21:15:56', 210625);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734355490582', '1734355490519', '我记得.mp3', 'audio/mpeg', './upload/song', '1734355490538.mp3', 13198317, '2024-12-16 21:24:50', '2024-12-16 21:24:50', 329927);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734355552415', '1734355552356', '程艾影.mp3', 'audio/mpeg', './upload/song', '1734355552371.mp3', 12018627, '2024-12-16 21:25:52', '2024-12-16 21:25:52', 300434);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734434044132', '1734434044087', '在你的身边.mp3', 'audio/mpeg', './upload/song', '1734434044108.mp3', 4197165, '2024-12-17 19:14:04', '2024-12-17 19:14:04', 262296);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734434538883', '1734434538835', 'M800000B3Qrx1OipKS.mp3', 'audio/mpeg', './upload/song', '1734434538855.mp3', 8572294, '2024-12-17 19:22:18', '2024-12-17 19:22:18', 214282);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734435658420', '1734435658380', 'Butter-Fly-和田光司.320.mp3', 'audio/mpeg', './upload/song', '1734435658395.mp3', 10326769, '2024-12-17 19:40:58', '2024-12-17 19:40:58', 258142);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734436101741', '1734436101699', 'obj_wo3DlMOGwrbDjj7DisKw_55836047515_d032_b89c_ca51_3b623bed7d75d900f8a62d89e0d734ac.mp3', 'audio/mpeg', './upload/song', '1734436101716.mp3', 6799195, '2024-12-17 19:48:21', '2024-12-17 19:48:21', 169953);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734951390217', '1734951390163', '我终于失去了你-赵传.320.mp3', 'audio/mpeg', './upload/song', '1734951390180.mp3', 11522133, '2024-12-23 18:56:30', '2024-12-23 18:56:30', 288026);
INSERT INTO `songsource` (`id`, `songId`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `dt`) VALUES ('1734961382937', '1734961382880', '江语晨.mp3', 'audio/mpeg', './upload/song', '1734961382899.mp3', 9824174, '2024-12-23 21:43:02', '2024-12-23 21:43:02', 245577);
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
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734434315544', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734433988006', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734355434355', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734354859107', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734354582213', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734354377712', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734098296728', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734098209689', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734435985352', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734435536222', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734434226423', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734433878207', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734355296606', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734354798823', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734098030863', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734097966847', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734097750846', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734097612719', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353422982', '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353375836', '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353499515', '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353555700', '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353647642', '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353705332', '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353744792', '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353804862', '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353842944', '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353887542', '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, '1734100736393', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, '1734437321676', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1734439614366');
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1734439659567');
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353842944', '1733554539541', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353422982', '1733554539541', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353422982', '1733557750529', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353422982', '1734172437248', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734355296606', NULL, NULL, '1734172437248', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734354377712', NULL, NULL, NULL, '1734172437248', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734354377712', NULL, NULL, NULL, '1733554539541', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734353647642', '1733554539541', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, NULL, '1733554539541', '1734439614366');
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, NULL, '1733557750529', '1734439614366');
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734761872244', '1733557750529', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, NULL, '1734761966033', '1733557750529', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, '1734100474273', NULL, '1733554539541', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, '1734769292720', NULL, '1733557750529', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, '1734100474273', NULL, '1733557750529', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, '1734951260786', NULL, NULL, '1734951047784', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, '1734951647296', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, '1734436983406', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734435613113', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, '1734436739957', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES ('1734436067666', NULL, NULL, NULL, '1734172437248', NULL);
INSERT INTO `subscriber` (`alId`, `arId`, `vId`, `pId`, `userId`, `cId`) VALUES (NULL, NULL, '1734768565312', NULL, '1621553753077', NULL);
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
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734100850564', NULL, '1621553753077', '2024-12-17 20:12:39', '2024-12-17 20:12:39', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734100736393', NULL, '1621553753077', '2024-12-21 13:08:39', '2024-12-21 13:08:39', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, '1734761076290', '1734172437248', '2024-12-21 14:04:39', '2024-12-21 14:04:39', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, NULL, '1733554539541', '2024-12-21 15:23:15', '2024-12-21 15:23:15', '1734765757917');
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, '1734767971392', '1733554539541', '2024-12-21 15:59:42', '2024-12-21 15:59:42', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, NULL, '1733554539541', '2024-12-21 16:00:57', '2024-12-21 16:00:57', '1734765844225');
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734100474273', NULL, '1733554539541', '2024-12-21 16:19:54', '2024-12-21 16:19:54', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734769292720', NULL, '1733557750529', '2024-12-21 16:21:46', '2024-12-21 16:21:46', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734100474273', NULL, '1733557750529', '2024-12-22 15:55:12', '2024-12-22 15:55:12', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, '1734951771426', '1621553753077', '2024-12-23 19:03:15', '2024-12-23 19:03:15', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734951647296', NULL, '1621553753077', '2024-12-23 19:11:00', '2024-12-23 19:11:00', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, '1734761076290', '1621553753077', '2024-12-23 19:11:10', '2024-12-23 19:11:10', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, '1734954860276', '1621553753077', '2024-12-23 19:57:20', '2024-12-23 19:57:20', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, '1734955481295', '1621553753077', '2024-12-23 20:04:45', '2024-12-23 20:04:45', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, '1734955862861', '1621553753077', '2024-12-23 20:12:41', '2024-12-23 20:12:41', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734436983406', NULL, '1621553753077', '2024-12-23 20:35:07', '2024-12-23 20:35:07', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734436739957', NULL, '1621553753077', '2024-12-23 20:49:22', '2024-12-23 20:49:22', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734100474273', NULL, '1734172437248', '2024-12-23 21:21:24', '2024-12-23 21:21:24', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734769292720', NULL, '1734172437248', '2024-12-23 21:25:11', '2024-12-23 21:25:11', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, '1734955581718', '1621553753077', '2024-12-23 21:26:41', '2024-12-23 21:26:41', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, '1734960993368', '1621553753077', '2024-12-23 21:36:36', '2024-12-23 21:36:36', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734768818874', NULL, '1621553753077', '2024-12-23 21:37:14', '2024-12-23 21:37:14', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, '1734954981682', '1621553753077', '2024-12-23 21:37:58', '2024-12-23 21:37:58', NULL);
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES (NULL, NULL, '1621553753077', '2024-12-23 21:39:08', '2024-12-23 21:39:08', '1734961142834');
INSERT INTO `thumb` (`vId`, `commentId`, `userId`, `createTime`, `updateTime`, `momentId`) VALUES ('1734768565312', NULL, '1621553753077', '2024-12-24 19:34:33', '2024-12-24 19:34:33', NULL);
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
INSERT INTO `topic` (`id`, `name`, `description`, `coverUrl`, `userId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734765493237', '我小的时候，讨厌父亲的不苟言笑，时常憧憬着换一个爸爸。比如我的舅舅，我固执的认为他有趣、幽默、能理解我的苦恼，期盼着他能把我带走。可是，心里却又太清楚：这是一件不可能的事情', '我小的时候，讨厌父亲的不苟言笑，时常憧憬着换一个爸爸。比如我的舅舅，我固执的认为他有趣、幽默、能理解我的苦恼，期盼着他能把我带走。可是，心里却又太清楚：这是一件不可能的事情', 'http://localhost:8200/topic/cover?id=1734765493237', '1621553753077', '2024-12-21 15:18:13', '2024-12-21 15:18:13', '1639391305931_560877346_700.jpg', 'image/jpeg', './upload/topic/cover', '1734765493250.jpg', 213709);
INSERT INTO `topic` (`id`, `name`, `description`, `coverUrl`, `userId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734765519051', '每个少年都有悲伤，那悲伤来自于：大人以为他们什么都不懂，总是充满着不屑与他们交谈，其实他们什么都明白。他们看得到悲伤，他们懂得什么是爱，他们懂得什么是心碎', '每个少年都有悲伤，那悲伤来自于：大人以为他们什么都不懂，总是充满着不屑与他们交谈，其实他们什么都明白。他们看得到悲伤，他们懂得什么是爱，他们懂得什么是心碎', 'http://localhost:8200/topic/cover?id=1734765519051', '1621553753077', '2024-12-21 15:18:39', '2024-12-21 15:18:39', '1.jpg', 'image/jpeg', './upload/topic/cover', '1734765519063.jpg', 31477);
INSERT INTO `topic` (`id`, `name`, `description`, `coverUrl`, `userId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734765540951', '亚特兰蒂斯，据传是由波塞冬的子孙掌管的史前古国，大陆文明的巅峰之国，却在一场灾难之后，举国沉入水底', '亚特兰蒂斯，据传是由波塞冬的子孙掌管的史前古国，大陆文明的巅峰之国，却在一场灾难之后，举国沉入水底', 'http://localhost:8200/topic/cover?id=1734765540951', '1621553753077', '2024-12-21 15:19:00', '2024-12-21 15:19:00', '4.jpg', 'image/jpeg', './upload/topic/cover', '1734765540967.jpg', 25169);
INSERT INTO `topic` (`id`, `name`, `description`, `coverUrl`, `userId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734765557947', '这个少年，是我们当中的幸运儿。神秘老人消失了。他们再也不曾见过。他望着他的背影，觉得年少时光也一并离他远去了', '这个少年，是我们当中的幸运儿。神秘老人消失了。他们再也不曾见过。他望着他的背影，觉得年少时光也一并离他远去了', 'http://localhost:8200/topic/cover?id=1734765557947', '1621553753077', '2024-12-21 15:19:17', '2024-12-21 15:19:17', '2.jpg', 'image/jpeg', './upload/topic/cover', '1734765557956.jpg', 28703);
INSERT INTO `topic` (`id`, `name`, `description`, `coverUrl`, `userId`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`) VALUES ('1734961111452', '大爱赵雷', '大爱赵雷', 'http://localhost:8200/topic/cover?id=1734961111452', '1621553753077', '2024-12-23 21:38:31', '2024-12-23 21:38:31', '1.avif', 'image/avif', './upload/topic/cover', '1734961111472.avif', 173780);
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
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1734348646110', '飙升榜', '2024-12-16 19:30:46', '2024-12-23 21:20:04', 'http://localhost:8200/toplist/cover?tId=1734348646110', '飙升歌曲', 1, 6, '1621553753077');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1734348687937', '新歌榜', '2024-12-16 19:31:27', '2024-12-23 21:35:41', 'http://localhost:8200/toplist/cover?tId=1734348687937', '新歌排行', 1, 11, '1621553753077');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1734348721377', '热歌榜', '2024-12-16 19:32:01', '2024-12-23 20:13:21', 'http://localhost:8200/toplist/cover?tId=1734348721377', '热歌排行', 1, 5, '1621553753077');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1734348862536', '韩语榜', '2024-12-16 19:34:22', '2024-12-16 19:34:22', 'http://localhost:8200/toplist/cover?tId=1734348862536', '韩语排行', 0, 0, '1621553753077');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1734349000647', '日语榜', '2024-12-16 19:36:40', '2024-12-16 19:36:40', 'http://localhost:8200/toplist/cover?tId=1734349000647', '日语排行', 0, 0, '1621553753077');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1734349054129', '欧美热歌榜', '2024-12-16 19:37:34', '2024-12-16 19:37:34', 'http://localhost:8200/toplist/cover?tId=1734349054129', '欧美热歌排行', 0, 0, '1621553753077');
INSERT INTO `toplist` (`id`, `name`, `createTime`, `updateTime`, `coverUrl`, `description`, `type`, `playCount`, `userId`) VALUES ('1734349293001', '流行榜', '2024-12-16 19:41:33', '2024-12-23 20:13:34', 'http://localhost:8200/toplist/cover?tId=1734349293001', '流行歌曲排行', 1, 2, '1621553753077');
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
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1734348646140', '1734348646110', '109951170048506929.jpg', './upload/toplist/cover', '1734348646137.jpg', 19398, '2024-12-16 19:30:46', '2024-12-16 19:30:46', 'image/jpeg');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1734348687958', '1734348687937', '109951170048511751.jpg', './upload/toplist/cover', '1734348687956.jpg', 19719, '2024-12-16 19:31:27', '2024-12-16 19:31:27', 'image/jpeg');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1734348721396', '1734348721377', '109951170048519512.jpg', './upload/toplist/cover', '1734348721394.jpg', 19236, '2024-12-16 19:32:01', '2024-12-16 19:32:01', 'image/jpeg');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1734348862554', '1734348862536', '109951167430864741.jpg', './upload/toplist/cover', '1734348862553.jpg', 9611, '2024-12-16 19:34:22', '2024-12-16 19:34:22', 'image/jpeg');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1734349000667', '1734349000647', '109951167430864069.jpg', './upload/toplist/cover', '1734349000663.jpg', 13963, '2024-12-16 19:36:40', '2024-12-16 19:36:40', 'image/jpeg');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1734349054145', '1734349054129', '109951167430862162 (1).jpg', './upload/toplist/cover', '1734349054144.jpg', 20766, '2024-12-16 19:37:34', '2024-12-16 19:37:34', 'image/jpeg');
INSERT INTO `toplist_cover` (`id`, `tId`, `originalname`, `dest`, `filename`, `size`, `createTime`, `updateTime`, `mimetype`) VALUES ('1734349293025', '1734349293001', '109951170048522513.jpg', './upload/toplist/cover', '1734349293023.jpg', 28625, '2024-12-16 19:41:33', '2024-12-16 19:41:33', 'image/jpeg');
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
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734354956771', 1);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734098690057', 54);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734436101699', 9);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734354407027', 8);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734434044087', 5);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734355490519', 4);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734098831902', 3);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734099850678', 3);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734951390163', 2);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734354609522', 2);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734435658380', 2);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734355552356', 2);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348646110', '1734434538835', 1);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734098690057', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734098831902', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734099850678', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734354407027', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734354609522', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734354956771', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734355490519', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734355552356', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734434044087', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734434538835', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734435658380', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734436101699', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734951390163', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348687937', '1734961382880', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734098690057', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734354407027', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734436101699', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734354609522', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734355490519', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734434044087', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734099850678', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734098831902', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734354956771', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734355552356', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734435658380', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734434538835', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734951390163', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348721377', '1734961382880', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348862536', '1734099850678', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734348862536', '1734436101699', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349000647', '1734435658380', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734098690057', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734354407027', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734354609522', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734355490519', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734098831902', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734099850678', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734354956771', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734355552356', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734434044087', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734434538835', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734435658380', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734436101699', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734951390163', 0);
INSERT INTO `toplist_song` (`tId`, `songId`, `diff`) VALUES ('1734349293001', '1734961382880', 0);
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
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1621553753077', '叶子', '123', 'http://localhost:8200/user/avatar?id=1621553753077', '2021-08-21 07:35:53', '2024-12-22 15:44:35', 1, '2025-03-22 15:44:00', '1734162809353', 1);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1645620606883', 'guobin', '123', 'http://localhost:8200/user/avatar?id=1645620606883', '2022-02-23 20:50:06', '2024-12-22 15:49:20', 1, '2025-12-22 15:49:00', '1734162824592', 1);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1733554539541', 'ln', '123', 'http://localhost:8200/user/avatar?id=1733554539541', '2024-12-07 14:55:39', '2024-12-23 21:45:23', 1, '2025-03-23 21:45:23', '1734162809353', 0);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1733557750529', '果子', '123', 'http://localhost:8200/user/avatar?id=1733557750529', '2024-12-07 15:49:10', '2024-12-22 16:10:29', 1, '2025-03-22 16:10:29', '1734162809353', 0);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1733557774861', '小夜刀', '123', 'http://localhost:8200/user/avatar?id=1733557774861', '2024-12-07 15:49:34', '2024-12-08 14:23:50', 0, NULL, NULL, 1);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1733557781990', '郭嘉', '123', 'http://localhost:8200/user/avatar?id=1733557781990', '2024-12-07 15:49:41', '2024-12-14 15:37:46', 1, '2025-12-09 15:37:47', '1732800200653', 0);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1733557871601', '浪花', '123', NULL, '2024-12-07 15:51:11', '2024-12-07 15:51:11', 0, NULL, NULL, 0);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1733557883885', '梅子', '123', 'http://localhost:8200/user/avatar?id=1733557883885', '2024-12-07 15:51:23', '2024-12-14 15:51:35', 1, '2025-03-14 15:51:35', '1732800161123', 0);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1733557891674', '欢喜', '123', NULL, '2024-12-07 15:51:31', '2024-12-07 15:51:31', 0, NULL, NULL, 1);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1733557936285', '无声', '123', NULL, '2024-12-07 15:52:16', '2024-12-07 15:52:16', 0, NULL, NULL, 0);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1733557943862', '美好', '123', NULL, '2024-12-07 15:52:23', '2024-12-07 15:52:23', 0, NULL, NULL, 0);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1733557952585', '鸡仔', '123', NULL, '2024-12-07 15:52:32', '2024-12-07 15:52:32', 0, NULL, NULL, 0);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1734172437248', '韩寒', '123', 'http://localhost:8200/user/avatar?id=1734172437248', '2024-12-14 18:33:57', '2024-12-23 21:19:46', 0, NULL, NULL, 0);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1734353244855', '源头', '123', NULL, '2024-12-16 20:47:24', '2024-12-16 20:47:24', 0, NULL, NULL, 0);
INSERT INTO `user` (`userId`, `userName`, `password`, `avatarUrl`, `createTime`, `updateTime`, `auth`, `expireTime`, `cId`, `manage`) VALUES ('1734951047784', '花子', '123', 'http://localhost:8200/user/avatar?id=1734951047784', '2024-12-23 18:50:47', '2024-12-23 18:51:26', 0, NULL, NULL, 0);
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
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
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
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734100474273', '240719 第三届青龙系列大赏 (G)I-DLE《Klaxon》+《Fate》舞台', '1645620606883', 'http://localhost:8200/video/cover?id=1734100474273', '1732345724960', 4, 0, '2024-12-13 22:34:34', '2024-12-23 21:21:16', 'gidle.mp4', 'video/mp4', './upload/video/source', '1734100474294.mp4', 87063330, 349623, 'http://localhost:8200/video?id=1734100474273', '240719 第三届青龙系列大赏 (G)I-DLE《Klaxon》+《Fate》舞台', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734100736393', '张杰 -《这，就是爱》 怀揣爱意再一次对话从前', '1645620606883', 'http://localhost:8200/video/cover?id=1734100736393', '1732345664016', 9, 0, '2024-12-13 22:38:56', '2024-12-22 14:49:24', '这就是爱.mp4', 'video/mp4', './upload/video/source', '1734100736410.mp4', 65743766, 238293, 'http://localhost:8200/video?id=1734100736393', '张杰 -《这，就是爱》 怀揣爱意再一次对话从前', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734100850564', '郁可唯 -《水中花》致敬谭咏麟 灵动飘渺的声音，穿梭在摇晃的芦苇间', '1645620606883', 'http://localhost:8200/video/cover?id=1734100850564', '1732345664016', 19, 0, '2024-12-13 22:40:50', '2024-12-24 19:28:16', '水中花.mp4', 'video/mp4', './upload/video/source', '1734100850582.mp4', 56324848, 226673, 'http://localhost:8200/video?id=1734100850564', '郁可唯 -《水中花》致敬谭咏麟 灵动飘渺的声音，穿梭在摇晃的芦苇间', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734436428307', '一程山路', '1645620606883', 'http://localhost:8200/video/cover?id=1734436428307', '1732431827260', 0, 1, '2024-12-17 19:53:48', '2024-12-17 19:53:48', '一程山路.mp4', 'video/mp4', './upload/video/source', '1734436428329.mp4', 10337822, 211812, 'http://localhost:8200/video?id=1734436428307', '由毛不易演唱，钱雷作曲，唐恬作词的动画电影《雄狮少年》主题曲《无名的人》2021年12月14日上线，献给所有顶天立地却平凡普通的人们。\n        ', '1734098690057');
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734436524119', '可能', '1645620606883', 'http://localhost:8200/video/cover?id=1734436524119', '1732431827260', 3, 1, '2024-12-17 19:55:24', '2024-12-23 20:14:12', '可能.mp4', 'video/mp4', './upload/video/source', '1734436524137.mp4', 31040718, 213142, 'http://localhost:8200/video?id=1734436524119', '可能一切的可能 相信才有可能\n可能拥有过梦想 才能叫做青春', '1734354407027');
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734436591672', '我记得', '1645620606883', 'http://localhost:8200/video/cover?id=1734436591672', '1732431827260', 6, 1, '2024-12-17 19:56:31', '2024-12-23 20:34:44', '我记得.mp4', 'video/mp4', './upload/video/source', '1734436591689.mp4', 11072113, 322246, 'http://localhost:8200/video?id=1734436591672', '我是渠边偷偷抽烟枪已上了膛的少年\n\n我要代表恐惧和这世界的阴暗谈一谈\n\n两面都是高墙只有一条路能穿过黑暗\n\n可我没有金钱也没有得到金钱的答案\n\n他妈坐在红灯区里对经过的男人挤眼', '1734355490519');
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734436739957', 'As If It’s Your Last - BLACKPINK', '1645620606883', 'http://localhost:8200/video/cover?id=1734436739957', '1732431837123', 3, 1, '2024-12-17 19:58:59', '2024-12-24 19:33:36', 'a.mp4', 'video/mp4', './upload/video/source', '1734436739977.mp4', 13634989, 231765, 'http://localhost:8200/video?id=1734436739957', 'BLACKPINK ARENA TOUR', '1734099850678');
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734436827501', '遇见', '1645620606883', 'http://localhost:8200/video/cover?id=1734436827501', '1732431827260', 1, 1, '2024-12-17 20:00:27', '2024-12-23 21:37:27', '遇见.mp4', 'video/mp4', './upload/video/source', '1734436827521.mp4', 10499322, 208917, 'http://localhost:8200/video?id=1734436827501', '你的爱 像纯白的羽毛\n\n我用力 将它握在手心\n\n才发现 它早已成灰灭', '1734354956771');
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734436909640', '在你的身边', '1645620606883', 'http://localhost:8200/video/cover?id=1734436909640', '1732431827260', 4, 1, '2024-12-17 20:01:49', '2024-12-23 21:36:13', '在你的身边.mp4', 'video/mp4', './upload/video/source', '1734436909659.mp4', 14610444, 277141, 'http://localhost:8200/video?id=1734436909640', '总以为时间会消融无尽的思念，但到头来，永远在你身边的心愿从未减弱。献给深爱过，却已逐渐远去的那个人。\n\n盛哲的首支独立单曲《在你的身边》正式发行。这首歌由盛哲独立完成词曲和制作，融合了华语流行的细腻及...\n        ', '1734434044087');
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734436983406', '程艾影', '1645620606883', 'http://localhost:8200/video/cover?id=1734436983406', '1732431827260', 2, 1, '2024-12-17 20:03:03', '2024-12-22 14:18:18', '程艾.mp4', 'video/mp4', './upload/video/source', '1734436983421.mp4', 14682693, 300202, 'http://localhost:8200/video?id=1734436983406', '我是渠边偷偷抽烟枪已上了膛的少年\n\n我要代表恐惧和这世界的阴暗谈一谈\n\n两面都是高墙只有一条路能穿过黑暗\n\n可我没有金钱也没有得到金钱的答案\n\n他妈坐在红灯区里对经过的男人挤眼', '1734355552356');
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734437056576', 'APT', '1645620606883', 'http://localhost:8200/video/cover?id=1734437056576', '1732431832367', 1, 1, '2024-12-17 20:04:16', '2024-12-22 16:06:17', 'apt.mp4', 'video/mp4', './upload/video/source', '1734437056591.mp4', 26633255, 173397, 'http://localhost:8200/video?id=1734437056576', 'ROSÉ朴彩英正规一辑首单《APT.》惊喜释出，与Bruno Mars合作，以韩国派对游戏为灵感，由ROSÉ参与创作，Bruno Mars、Cirkut、Omer Fedi及Rogét Chahaye...\n        ', '1734436101699');
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734437150522', 'Butter-Fly', '1645620606883', 'http://localhost:8200/video/cover?id=1734437150522', '1732431841054', 1, 1, '2024-12-17 20:05:50', '2024-12-21 16:29:15', 'bufferfly.mp4', 'video/mp4', './upload/video/source', '1734437150538.mp4', 11398036, 254954, 'http://localhost:8200/video?id=1734437150522', '子どもたちを虜にする{育てゲー}アニメの決定版『デジモン』の,冒険心をあおる元気いっぱいのヴォーカル曲を収録するの。やっぱり「Butter-Fly」は名曲だぜ。全7曲はちと少ない気がするが,ゲーム・カ...\n        ', '1734435658380');
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734437321676', '江语晨《最后一页》 |‘想把你抱进身体里面 不敢让你看见', '1645620606883', 'http://localhost:8200/video/cover?id=1734437321676', '1732345664016', 3, 0, '2024-12-17 20:08:41', '2024-12-23 21:39:34', '最后一夜.mp4', 'video/mp4', './upload/video/source', '1734437321699.mp4', 13054809, 244330, 'http://localhost:8200/video?id=1734437321676', '江语晨《最后一页》 |‘想把你抱进身体里面 不敢让你看见江语晨《最后一页》 |‘想把你抱进身体里面 不敢让你看见', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734768357680', '回忆里的那个人-MV', '1733554539541', 'http://localhost:8200/video/cover?id=1734768357680', '1732345664016', 1, 0, '2024-12-21 16:05:57', '2024-12-22 14:49:42', '回忆里的那个人.mp4', 'video/mp4', './upload/video/source', '1734768357701.mp4', 59501979, 253696, 'http://localhost:8200/video?id=1734768357680', '音悦台', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734768565312', '两会版《成都》', '1733554539541', 'http://localhost:8200/video/cover?id=1734768565312', '1732345664016', 2, 0, '2024-12-21 16:09:25', '2024-12-24 19:34:36', '成都.mp4', 'video/mp4', './upload/video/source', '1734768565333.mp4', 8589882, 163285, 'http://localhost:8200/video?id=1734768565312', '两会版《成都》', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734768678469', '“一入烟鬼深似海”—《Closer》', '1733554539541', 'http://localhost:8200/video/cover?id=1734768678469', '1732345671075', 0, 0, '2024-12-21 16:11:18', '2024-12-21 16:11:18', 'c.mp4', 'video/mp4', './upload/video/source', '1734768678487.mp4', 9062360, 245023, 'http://localhost:8200/video?id=1734768678469', '“一入烟鬼深似海”—《Closer》', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734768818874', '为了单依纯这几句，循环了好多遍这首歌，每次听都会热泪盈眶', '1733554539541', 'http://localhost:8200/video/cover?id=1734768818874', '1732345664016', 5, 0, '2024-12-21 16:13:38', '2024-12-24 19:39:13', '我爱你.mp4', 'video/mp4', './upload/video/source', '1734768818892.mp4', 19623522, 310961, 'http://localhost:8200/video?id=1734768818874', '为了单依纯这几句，循环了好多遍这首歌，每次听都会热泪盈眶', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734769069161', '程艾影_赵雷', '1733554539541', 'http://localhost:8200/video/cover?id=1734769069161', '1732345664016', 0, 0, '2024-12-21 16:17:49', '2024-12-21 16:17:49', '程艾影.mp4', 'video/mp4', './upload/video/source', '1734769069179.mp4', 14263504, 300586, 'http://localhost:8200/video?id=1734769069161', '程艾影_赵雷', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734769292720', '一首《稻香》，带你们开启童年的时光机', '1733557750529', 'http://localhost:8200/video/cover?id=1734769292720', '1732345664016', 3, 0, '2024-12-21 16:21:32', '2024-12-23 21:25:05', '稻香.mp4', 'video/mp4', './upload/video/source', '1734769292741.mp4', 11371364, 227114, 'http://localhost:8200/video?id=1734769292720', '一首《稻香》，带你们开启童年的时光机', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734769440766', '王招君 (你看你拉住我的模样)-任素汐', '1733557750529', 'http://localhost:8200/video/cover?id=1734769440766', '1732345664016', 1, 0, '2024-12-21 16:24:00', '2024-12-21 16:24:07', 'g.mp4', 'video/mp4', './upload/video/source', '1734769440784.mp4', 7026901, 262400, 'http://localhost:8200/video?id=1734769440766', '王招君 (你看你拉住我的模样)-任素汐', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734769560321', '名侦探柯南主题曲《转动命运之轮》现场——坂井泉水', '1733557750529', 'http://localhost:8200/video/cover?id=1734769560321', '1732345664016', 2, 0, '2024-12-21 16:26:00', '2024-12-22 16:07:15', 'v.mp4', 'video/mp4', './upload/video/source', '1734769560338.mp4', 12659178, 232917, 'http://localhost:8200/video?id=1734769560321', '名侦探柯南主题曲《转动命运之轮》现场——坂井泉水', NULL);
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734951647296', '我终于失去了你 ', '1645620606883', 'http://localhost:8200/video/cover?id=1734951647296', '1732431827260', 8, 1, '2024-12-23 19:00:47', '2024-12-24 19:35:28', '我终于失去了你.mp4', 'video/mp4', './upload/video/source', '1734951647318.mp4', 14959418, 280640, 'http://localhost:8200/video?id=1734951647296', '我终于失去了你', '1734951390163');
INSERT INTO `video` (`vid`, `name`, `userId`, `coverUrl`, `cateId`, `playCount`, `type`, `createTime`, `updateTime`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `dt`, `url`, `description`, `songId`) VALUES ('1734961240018', '这就是爱么', '1621553753077', 'http://localhost:8200/video/cover?id=1734961240018', '1732345664016', 1, 0, '2024-12-23 21:40:40', '2024-12-23 21:40:43', 'v.mp4', 'video/mp4', './upload/video/source', '1734961240046.mp4', 12659178, 232917, 'http://localhost:8200/video?id=1734961240018', '这就是爱么', NULL);
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
INSERT INTO `video_cate` (`id`, `name`, `type`) VALUES ('1732345664016', '华语', 0);
INSERT INTO `video_cate` (`id`, `name`, `type`) VALUES ('1732345671075', '欧美', 0);
INSERT INTO `video_cate` (`id`, `name`, `type`) VALUES ('1732345724960', '韩国', 0);
INSERT INTO `video_cate` (`id`, `name`, `type`) VALUES ('1732345761364', '日本', 0);
INSERT INTO `video_cate` (`id`, `name`, `type`) VALUES ('1732345795279', '其他', 0);
INSERT INTO `video_cate` (`id`, `name`, `type`) VALUES ('1732431827260', '华语', 1);
INSERT INTO `video_cate` (`id`, `name`, `type`) VALUES ('1732431832367', '欧美', 1);
INSERT INTO `video_cate` (`id`, `name`, `type`) VALUES ('1732431837123', '韩国', 1);
INSERT INTO `video_cate` (`id`, `name`, `type`) VALUES ('1732431841054', '日本', 1);
INSERT INTO `video_cate` (`id`, `name`, `type`) VALUES ('1732431846631', '其他', 1);
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
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734100474473', '1734100474273', '329e42bdafc79fe5260e1b9b73b4602c0cea6d67.jpg@672w_378h_1c_!web-search-common-cover.avif', 'image/avif', './upload/video/cover', '1734100474471.avif', 125828, '2024-12-13 22:34:34', '2024-12-13 22:34:34');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734100736540', '1734100736393', 'dda40537092c641dbab96974cfa71bcde910f38f.jpg@672w_378h_1c_!web-search-common-cover (1).avif', 'image/avif', './upload/video/cover', '1734100736539.avif', 67570, '2024-12-13 22:38:56', '2024-12-13 22:38:56');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734100850684', '1734100850564', '水中花.avif', 'image/avif', './upload/video/cover', '1734100850683.avif', 79229, '2024-12-13 22:40:50', '2024-12-13 22:40:50');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734436428370', '1734436428307', '41cd219d480204ff4451e315aaa0251f6b527a12.jpg@672w_378h_1c_!web-search-common-cover.avif', 'image/avif', './upload/video/cover', '1734436428370.avif', 49492, '2024-12-17 19:53:48', '2024-12-17 19:53:48');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734436524208', '1734436524119', '可能.avif', 'image/avif', './upload/video/cover', '1734436524208.avif', 53831, '2024-12-17 19:55:24', '2024-12-17 19:55:24');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734436591725', '1734436591672', '我记得.avif', 'image/avif', './upload/video/cover', '1734436591722.avif', 52137, '2024-12-17 19:56:31', '2024-12-17 19:56:31');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734436740031', '1734436739957', 'ccf09e39bf5a07356dd9e12d9bb00bf92d3bd473.jpg@672w_378h_1c_!web-search-common-cover.avif', 'image/avif', './upload/video/cover', '1734436740030.avif', 73708, '2024-12-17 19:59:00', '2024-12-17 19:59:00');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734436827558', '1734436827501', '遇见.avif', 'image/avif', './upload/video/cover', '1734436827558.avif', 55945, '2024-12-17 20:00:27', '2024-12-17 20:00:27');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734436909703', '1734436909640', '在你的身边.avif', 'image/avif', './upload/video/cover', '1734436909703.avif', 59990, '2024-12-17 20:01:49', '2024-12-17 20:01:49');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734436983464', '1734436983406', '程艾.avif', 'image/avif', './upload/video/cover', '1734436983463.avif', 73752, '2024-12-17 20:03:03', '2024-12-17 20:03:03');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734437056652', '1734437056576', 'apt.avif', 'image/avif', './upload/video/cover', '1734437056651.avif', 68174, '2024-12-17 20:04:16', '2024-12-17 20:04:16');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734437150569', '1734437150522', 'buttterfly.avif', 'image/avif', './upload/video/cover', '1734437150567.avif', 129168, '2024-12-17 20:05:50', '2024-12-17 20:05:50');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734437321764', '1734437321676', '最后一夜.avif', 'image/avif', './upload/video/cover', '1734437321763.avif', 58399, '2024-12-17 20:08:41', '2024-12-17 20:08:41');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734768357702', '1734768357680', '6.avif', 'image/avif', './upload/video/cover', '1734768357694.avif', 18950, '2024-12-21 16:05:57', '2024-12-21 16:05:57');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734768565329', '1734768565312', '11.avif', 'image/avif', './upload/video/cover', '1734768565325.avif', 14667, '2024-12-21 16:09:25', '2024-12-21 16:09:25');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734768678488', '1734768678469', 'c.avif', 'image/avif', './upload/video/cover', '1734768678481.avif', 23759, '2024-12-21 16:11:18', '2024-12-21 16:11:18');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734768818893', '1734768818874', '5.avif', 'image/avif', './upload/video/cover', '1734768818887.avif', 27588, '2024-12-21 16:13:38', '2024-12-21 16:13:38');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734769069180', '1734769069161', '程艾影.avif', 'image/avif', './upload/video/cover', '1734769069174.avif', 17468, '2024-12-21 16:17:49', '2024-12-21 16:17:49');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734769292742', '1734769292720', '1.avif', 'image/avif', './upload/video/cover', '1734769292736.avif', 27719, '2024-12-21 16:21:32', '2024-12-21 16:21:32');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734769440785', '1734769440766', 'd.avif', 'image/avif', './upload/video/cover', '1734769440780.avif', 22858, '2024-12-21 16:24:00', '2024-12-21 16:24:00');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734769560341', '1734769560321', 'f.avif', 'image/avif', './upload/video/cover', '1734769560333.avif', 21501, '2024-12-21 16:26:00', '2024-12-21 16:26:00');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734951647364', '1734951647296', '我终于失去了你.avif', 'image/avif', './upload/video/cover', '1734951647363.avif', 63273, '2024-12-23 19:00:47', '2024-12-23 19:00:47');
INSERT INTO `video_cover` (`id`, `vid`, `originalname`, `mimetype`, `dest`, `filename`, `size`, `createTime`, `updateTime`) VALUES ('1734961240047', '1734961240018', 'c.avif', 'image/avif', './upload/video/cover', '1734961240038.avif', 24389, '2024-12-23 21:40:40', '2024-12-23 21:40:40');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

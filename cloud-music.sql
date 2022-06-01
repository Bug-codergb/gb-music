/*
 Navicat Premium Data Transfer

 Source Server         : NodeMySQL
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : cloud-music

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 02/06/2022 07:42:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `coverUrl` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publishTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `arId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cateId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `arId_album`(`arId`) USING BTREE,
  INDEX `cateId`(`cateId`) USING BTREE,
  CONSTRAINT `arId_album` FOREIGN KEY (`arId`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cateId` FOREIGN KEY (`cateId`) REFERENCES `albumcate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('1621948204281', 'different world人佛如', 'http://localhost:8200/album/cover?id=1621948204281', '1620921600000', '艾伦沃克最新专辑', '1621603346150', '1621561877531');
INSERT INTO `album` VALUES ('1621948599627', 'Justice (中国豪华特别版)', 'http://localhost:8200/album/cover?id=1621948599627', '1619884800000', 'Justice (中国豪华特别版)', '1621602969680', '1621561877531');
INSERT INTO `album` VALUES ('1621948912106', 'hold on', 'http://localhost:8200/album/cover?id=1621948912106', '1621440000000', 'hold on', '1621602969680', '1621561877531');
INSERT INTO `album` VALUES ('1621949008183', 'Anyone', 'http://localhost:8200/album/cover?id=1621949008183', '1619280000000', 'Anyone', '1621602969680', '1621561877531');
INSERT INTO `album` VALUES ('1621949107814', 'Monster', 'http://localhost:8200/album/cover?id=1621949107814', '1620748800000', 'Monster贾斯汀比伯最新专辑', '1621602969680', '1621561877531');
INSERT INTO `album` VALUES ('1622073564263', '是但求其爱方法', 'http://localhost:8200/album/cover?id=1622073564263', '1549987200000', '是但求其爱,陈奕迅最新专辑', '1621602559815', '1621561852524');
INSERT INTO `album` VALUES ('1622073673540', '致明日的舞', 'http://localhost:8200/album/cover?id=1622073673540', '1423584000000', '《致明日的舞》是由Oscar作词，林家谦作曲，陈奕迅演唱的一首歌曲，发行于2020年10月21日', '1621602559815', '1621561852524');
INSERT INTO `album` VALUES ('1622073722073', '一首歌一个故事', 'http://localhost:8200/album/cover?id=1622073722073', '1425052800000', '一首歌一个故事', '1621602559815', '1621561852524');
INSERT INTO `album` VALUES ('1622073777612', 'Shall We Talk (Tre Lune MMXIX)', 'http://localhost:8200/album/cover?id=1622073777612', '1454428800000', 'Shall We Talk (Tre Lune MMXIX)', '1621602559815', '1621561852524');
INSERT INTO `album` VALUES ('1622073850159', 'Fight as ONE', 'http://localhost:8200/album/cover?id=1622073850159', '1456156800000', ' \"共同体的战斗\"\n', '1621602559815', '1621561852524');
INSERT INTO `album` VALUES ('1622073934094', '相信你的人 (热血励志版)', 'http://localhost:8200/album/cover?id=1622073934094', '1487952000000', '电影《银河补习班》推广曲', '1621602559815', '1621561852524');
INSERT INTO `album` VALUES ('1622074137833', 'STRAY SHEEP', 'http://localhost:8200/album/cover?id=1622074137833', '1518019200000', 'STRAY SHEEP', '1621603618588', '1621561893076');
INSERT INTO `album` VALUES ('1622074187201', 'パプリカ', 'http://localhost:8200/album/cover?id=1622074187201', '1519315200000', 'パプリカ', '1621603618588', '1621561893076');
INSERT INTO `album` VALUES ('1622074240385', '馬と鹿', 'http://localhost:8200/album/cover?id=1622074240385', '1518364800000', '馬と鹿', '1621603618588', '1621561893076');
INSERT INTO `album` VALUES ('1622074304369', '海の幽霊', 'http://localhost:8200/album/cover?id=1622074304369', '1517241600000', '海の幽霊', '1621603618588', '1621561893076');
INSERT INTO `album` VALUES ('1622074381617', 'Flamingo / TEENAGE RIOT', 'http://localhost:8200/album/cover?id=1622074381617', '1515513600000', 'Flamingo', '1621603618588', '1621561893076');
INSERT INTO `album` VALUES ('1622074447978', 'Lemon', 'http://localhost:8200/album/cover?id=1622074447978', '1546531200000', 'Lemon', '1621603618588', '1621561893076');
INSERT INTO `album` VALUES ('1622074574710', 'Fearless (Taylor\'s Version)', 'http://localhost:8200/album/cover?id=1622074574710', '1547395200000', 'Fearless (Taylor\'s Version)', '1622072451745', '1621561877531');
INSERT INTO `album` VALUES ('1622074645854', 'willow (moonlit witch version)', 'http://localhost:8200/album/cover?id=1622074645854', '1546272000000', 'willow (moonlit witch version)', '1622072451745', '1621561877531');
INSERT INTO `album` VALUES ('1622074694370', 'willow (lonely witch version)', 'http://localhost:8200/album/cover?id=1622074694370', '1577894400000', 'willow (lonely witch version)', '1622072451745', '1621561877531');
INSERT INTO `album` VALUES ('1622074775169', 'evermore (deluxe version)', 'http://localhost:8200/album/cover?id=1622074775169', '1483372800000', 'evermore (deluxe version)', '1622072451745', '1621561877531');
INSERT INTO `album` VALUES ('1623419176842', 'Buffer', 'http://localhost:8200/album/cover?id=1623419176842', '1622649600000', 'Bufer', '1622072084825', '1621561883885');
INSERT INTO `album` VALUES ('1624372189519', 'Pale Blue', 'http://localhost:8200/album/cover?id=1624372189519', '1624204800000', 'ハチ', '1621603618588', '1621561893076');
INSERT INTO `album` VALUES ('1624375276272', 'Future Nostalgia', 'http://localhost:8200/album/cover?id=1624375276272', '1624118400000', 'Future Nostalgia', '1623328403156', '1621561877531');
INSERT INTO `album` VALUES ('1624545961961', '无法长大', 'http://localhost:8200/album/cover?id=1624545961961', '1482249600000', '《无法长大》是歌手赵雷发行的第三张个人音乐专辑，共收录了10首歌曲，制作人由赵雷亲自担任，该专辑于2016年12月21日发行', '1624545638880', '1621561852524');
INSERT INTO `album` VALUES ('1624546413717', '吉姆餐厅', 'http://localhost:8200/album/cover?id=1624546413717', '1413648000000', '《吉姆餐厅》是歌手赵雷的第二张音乐专辑，于2014年10月19日发行。该专辑内共收录了10首歌曲，由StreetVoice唱片发行', '1624545638880', '1621561852524');
INSERT INTO `album` VALUES ('1624547874208', ' 亲爱的旅人啊《千与千寻》（Cover 木村弓） ', 'http://localhost:8200/album/cover?id=1624547874208', '1560441600000', '《亲爱的旅人啊》中文版由沃特艾文儿填词，翻唱是周深。', '1624547670156', '1621561852524');
INSERT INTO `album` VALUES ('1624549188385', 'Beyond 怀旧经典金曲 Vol. 1', 'http://localhost:8200/album/cover?id=1624549188385', '930067200000', 'Beyond 怀旧经典金曲 Vol. 1', '1624549103554', '1621561852524');
INSERT INTO `album` VALUES ('1625405674442', 'DON\'T FIGHT THE FEELING', 'http://localhost:8200/album/cover?id=1625405674442', '1622995200000', 'EXO特别专辑《DON’T FIGHT THE FEELING》6月7日公开！\n　　含主打歌《Don’t fight the feeling》共收录5首歌曲！\n　　为了全球粉丝准备的EXO特级音乐献礼！\n　　“K-POP之王” EXO（SM ENTERTAINMENT所属）的特别专辑《DON’T FIGHT THE FEELING》于6月7日正式公开。', '1625405303096', '1621561883885');
INSERT INTO `album` VALUES ('1625408324076', '认了吧', 'http://localhost:8200/album/cover?id=1625408324076', '1177344000000', '《认了吧》是陈奕迅推出的一张普通话专辑，收录11首歌曲，其中8首歌曲改编自粤语专辑《What\'s Going On...?》，该专辑于2007年4月24日由新艺宝唱片发行。', '1621602559815', '1621561852524');
INSERT INTO `album` VALUES ('1626233207593', 'love', 'http://localhost:8200/album/cover?id=1626233207593', '946656000000', '《LOVE》，是台湾歌手徐怀钰的一张音乐专辑。于2000年1月1日发行。', '1626233168015', '1621561852524');
INSERT INTO `album` VALUES ('1626272577568', 'THE ALBUM 34', 'http://localhost:8200/album/cover?id=1626272577568', '1601568000000', '《The Album》是由韩国女子演唱组合BLACKPINK于2020年10月2日发布的一张专辑。专辑语言为韩语，共收录8首歌曲。由YG Entertainment发行。', '1626234023583', '1621561883885');
INSERT INTO `album` VALUES ('1626360628102', ' 頭文字D Final Best Collection ', 'http://localhost:8200/album/cover?id=1626360628102', '1405008000000', ' 頭文字D Final Best Collection ', '1626360481630', '1621561893076');
INSERT INTO `album` VALUES ('1633919083723', '白羽毛之恋 华语典藏情歌', 'http://localhost:8200/album/cover?id=1633919083723', '1498838400000', '暂无', '1633918820863', '1621561852524');
INSERT INTO `album` VALUES ('1633946154102', '有形的翅膀', 'http://localhost:8200/album/cover?id=1633946154102', '1349971200000', '《有形的翅膀》是中国台湾流行音乐女歌手张韶涵签约美妙音乐后的发行的第一张专辑，也是其个人的第七张专辑，于2012年10月12日发行', '1633945997178', '1621561852524');
INSERT INTO `album` VALUES ('1633946790475', '千千阙歌', 'http://localhost:8200/album/cover?id=1633946790475', '746812800000', '1993年福茂唱片代理宝丽金在台湾发行的一个唱片系列的其中一张。', '1633946433290', '1621561852524');
INSERT INTO `album` VALUES ('1634362031980', '世界', 'http://localhost:8200/album/cover?id=1634362031980', '1325260800000', '《世界》是中国流行摇滚乐队逃跑计划的首张专辑，该专辑发行于2011年12月31日，制作人是Giles Tully 和李赤，共收录10首歌曲。\n2012年，逃跑计划凭借该专辑，摘得第四届中国摇滚迷笛奖“最佳年度摇滚专辑”奖。2013年，凭借该专辑荣获第十三届音乐风云榜“最佳摇滚专辑”奖和“最佳摇滚新人”奖。', '1634361905977', '1621561852524');
INSERT INTO `album` VALUES ('1634457950420', 'again', 'http://localhost:8200/album/cover?id=1634457950420', '1243958400000', ' 《again》是日本唱作女歌手YUI于2009年6月3日所推出的第十三张单曲碟。該曲是動畫《鋼之鍊金術師 FULLMETAL ALCHEMIST》的主題曲。另外還收錄了以故鄉為主題的《Sea》以及上張單曲《SUMMER SONG》的新版本《SUMMER SONG ~YUI Acoustic Version》。　\nDVD收入《again》的音樂影片和《I\'ll Be: Special School Live Video》。\n\n ', '1634457797551', '1621561893076');
INSERT INTO `album` VALUES ('1634531460174', '自定义', 'http://localhost:8200/album/cover?id=1634531460174', '1231516800000', ' Vae（许嵩）首张独立创制专辑《自定义》，1月10日正式发行。近年来在网络上凭借多首原创作品及独特个人气质一直人气高涨的Vae，包揽了《自定义》的作词、作曲、编曲、演奏、制作乃至录音、混音等一切工作。12月11-21日，在其官方网站十日预售量即突破一万张，可谓树立了独立音乐人的人气典范。 \n\n\n22岁的Vae，在他的《自定义》里彻头彻尾的实现了自己主宰音乐，定义自我。有如此独当一面的能力的华语歌手本就不多，其中用四个月就能从无到有的交出这样一张优秀唱片的人更少，而交出之后有这么多人趋之若鹜的热议和支持而不是孤芳自赏——并且，这一切都是在没有经纪公司宣传推广的前提下，实在可以说是稀奇了。 \n', '1621602754351', '1621561852524');
INSERT INTO `album` VALUES ('1634541272001', '纸短情长', 'http://localhost:8200/album/cover?id=1634541272001', '1539014400000', ' 蝉夏曾有你，城市曾有你。\n你曾有欢笑，你曾有不舍。\n而我，书写过一个又一个的雨季。\n轻轻地吹起这片纸，从正面到反面，都看不尽这故事。\n“我的故事还是关于你啊。” ', '1634530730835', '1621561852524');
INSERT INTO `album` VALUES ('1635337496777', '由零开始', 'http://localhost:8200/album/cover?id=1635337496777', '754675200000', '《由零开始》是郭富城于1993年12月1日发行的精选专辑', '1635337356115', '1621561852524');
INSERT INTO `album` VALUES ('1635338243811', '星辰大海', 'http://localhost:8200/album/cover?id=1635338243811', '1610640000000', ' \n我向你奔赴而来\n你就是星辰大海\n\n2020大热单曲《你的答案》制作团队再度携手；\n人与人之间的大爱，职责与守护；\n《星辰大海》为爱而生。\n\n好乐无荒团队首次联袂歌手黄霄雲来演绎这首大爱单曲。黄霄雲的声音温柔却不失力量，随着旋律层层的递进，字里行间的感动仿若瞬间能直入人心，触动着每一位听众。\n\n“我愿变成一颗恒星\n守护海底的蜂鸣\nIt\'s my dream it\'s magic\n照亮你的心”\n\n过去的一年我们经历了太多，但是爱始终未曾离开。那些不经意间的温暖瞬间，都化作大海倒映着的星空，让人难忘。愿这首歌成为你我心中的那片《星辰大海》。\n ', '1634531008629', '1621561852524');
INSERT INTO `album` VALUES ('1635339149495', '倉木麻衣×名探偵コナン COLLABORATION BEST 21 -真実はいつも歌にある！-', 'http://localhost:8200/album/cover?id=1635339149495', '907689600000', '倉木麻衣×名探偵コナン COLLABORATION BEST 21 -真実はいつも歌にある！-', '1635339003293', '1621561893076');
INSERT INTO `album` VALUES ('1635340071562', ' BOOTLEG ', 'http://localhost:8200/album/cover?id=1635340071562', '1509465600000', ' 继荣获第57届日本唱片大赏的冠军专辑《Bremen》后相隔两年，由网络发迹的全方位创作奇才米津玄师最新专辑《BOOTLEG》终于正式发行！新专辑除了收录了自2016年移籍日本索尼唱片以来的单曲《LOSER》、《Number Nine》、动画《三月的狮子》片尾曲《orion》，及动画《我的英雄学院》片头曲《胜利手势》等人气曲目之外，更特别收录了今年夏天与RAP新秀DAOKO合唱、作为电影《烟花》主题曲而造成轰动的话题单曲《打上花火》的独唱版！\n', '1621603618588', '1621561893076');
INSERT INTO `album` VALUES ('1635503394595', '起风了', 'http://localhost:8200/album/cover?id=1635503394595', '1543766400000', '《起风了》是由高桥优作曲、米果作词、买辣椒也用券演唱的歌曲，于2017年2月22日以单曲的形式发行，后因未获版权问题而下架，于2018年12月3日重新发行', '1635341469729', '1621561852524');
INSERT INTO `album` VALUES ('1635506247250', ' アイロニ ', 'http://localhost:8200/album/cover?id=1635506247250', '1591545600000', ' majiko再次演唱神作《アイロニ》！ \n ', '1635506130337', '1621561893076');
INSERT INTO `album` VALUES ('1635506697059', '饿狼传说', 'http://localhost:8200/album/cover?id=1635506697059', '769363200000', ' 《饿狼传说》是香港歌手张学友发行第十四张粤语专辑，唱片制作人欧丁玉，宝丽金唱片公司制作发行。这张唱片亦被认为是一张类似EP类型的粤语唱片。\n\n张学友在此张专辑的MV开始尝试利用电脑技术制作，融合数首主打歌曲，包括《饿狼传说》、《非常夏日》等，上市时收到了很好的效果。唱片被分为数种版本，市场上常见的分别有正式版，早期的万宝路红版（Marlboro Red Hot Hits），香港本地EP版（收录四首歌曲）以及日本EP版本（收录四首歌曲）', '1635506538320', '1621561852524');
INSERT INTO `album` VALUES ('1635507329406', '魔杰座', 'http://localhost:8200/album/cover?id=1635507329406', '1224000000000', '魔杰座》是周杰伦2008年10月15日发行的专辑   。作词者包括周杰伦、方文山、黄俊郎等人，编曲者包括钟兴民、林迈可、黄雨勋等人。', '1635507073391', '1621561852524');
INSERT INTO `album` VALUES ('1635508872682', ' 僕が死のうと思ったのは ', 'http://localhost:8200/album/cover?id=1635508872682', '1377619200000', '《曾经我也想过一了百了》是中岛美嘉演唱的歌曲，由秋田弘完成词曲、出羽良彰编曲。该曲作为中岛美嘉第38张单曲EP的同名主打曲，于2013年8月28日发行', '1622071800601', '1621561893076');
INSERT INTO `album` VALUES ('1635680348714', 'Nine Track Mind (Deluxe Edition)', 'http://localhost:8200/album/cover?id=1635680348714', '1453996800000', '《Nine Track Mind》是美国歌手Charlie Puth于2016年1月29日发行的首张主流厂牌录音室专辑，共收录了12首歌曲。唱片公司是Atlantic。该专辑收录的歌曲有《One Call Away》、《Dangerously》、《Marvin Gaye》等。', '1622072527875', '1621561877531');
INSERT INTO `album` VALUES ('1635681648278', '起风了-吴青峰', 'http://localhost:8200/album/cover?id=1635681648278', '1633363200000', '\n吴青峰 ×「加油，你是最棒的」\n“超级新人”助阵年度励志大剧献唱主题曲\n吴青峰影视剧OST第2首「起风了」\n超级金曲 全新重制 特别合作 “峰”起云涌', '1635681303898', '1621561852524');
INSERT INTO `album` VALUES ('1643435539795', '我们的纪念', 'http://localhost:8200/album/cover?id=1643435539795', '1149782400000', '《我们的纪念日》专辑的制作班底金光闪闪，包括也入围本届金曲奖最佳最曲人的陈小霞，与她的最佳拍档作词人姚若龙，继“可不可以不勇敢”之后，再度联手为范玮琪量身写了与专辑同名歌曲“我们的纪念日”、“一个像夏天一个像秋天”两首歌曲、金曲歌王伍思凯也为范玮琪写了一首“一半的我”，而金曲导演黄中平更一手包办整张专辑从封面到MV的视觉印象。', '1643435446634', '1621561852524');
INSERT INTO `album` VALUES ('1643453975767', '山楂树之恋(完整版)', 'http://localhost:8200/album/cover?id=1643453975767', '1566316800000', ' 「我的山楂树之恋，永远站在你的身边，我保证我的爱不会变」\n甜美的声线配温暖节奏，治愈着我们的内心，让人感受到爱情中的种种美好\n ', '1643453833297', '1621561852524');
INSERT INTO `album` VALUES ('1643454724896', 'EXODUS (The 2nd Album)', 'http://localhost:8200/album/cover?id=1643454724896', '1427644800000', 'EXO正规2辑《EXODUS》于3月30日发行，专辑共收录中韩两版各10首风格多样的歌曲，由The Underdogs、Teddy Riley、Stereotypes、Kenzie等多位作曲家打造，SHINee成员钟铉也参与其中。主打歌《Call Me Baby》是一首有强烈中毒性Hook和旋律的歌曲，用节奏强烈的鼓声和铜管乐器组合成饱含力量的旋律。钟铉参与作曲的《Playboy》是一首描述冷漠的Playboy的歌曲，还包括R&B曲风《TRANSFORMER》、R&B叙事曲《What If》、叙事曲《MY ANSWER》、舞曲《EXODUS》，还有出道时引发话题的《EL DORADO》、 《BEAUTIFUL》，以及节奏强烈充满梦幻氛围的《HURT》、《流星雨》。', '1625405303096', '1621561883885');
INSERT INTO `album` VALUES ('1643519009398', '今天的爱人是谁', 'http://localhost:8200/album/cover?id=1643519009398', '781200000000', '《今天的爱人是谁陈慧娴精选》是香港歌手陈慧娴于大学毕业后，正式回归乐坛前的专辑。专辑收录了1994年推出的一首大热歌曲《今天的爱人是谁》，连同英文新歌《Let\'s get married》，其余16首均为旧作。《今天的爱人是谁》的歌曲改编自高桥真梨子的《そっと…Loving\'you》。最先收录在《今天的爱人是谁》同名新曲加精选专辑内，后来亦再收录于翌年推出的回归大碟《Welcome Back》。', '1633946433290', '1621561852524');
INSERT INTO `album` VALUES ('1643519691617', '大雨', 'http://localhost:8200/album/cover?id=1643519691617', '680886000000', '《大雨》是台湾著名歌手娃娃成功转型的一张作品。随着年龄的增长，娃娃由以往的摇滚女子、叛逆女子转变为成熟、深情的都市女子。《漂洋过海来看你》出自李宗盛的妙笔，其它参与创作的还有王新莲、陈冠蒨、罗纮武、张洪量，众多优秀音乐人护驾。', '1643519541403', '1621561852524');
INSERT INTO `album` VALUES ('1643520177035', 'ブルーバード', 'http://localhost:8200/album/cover?id=1643520177035', '1215532800000', 'いきものがかり2008年第3弾となるシングル。通算4曲目[1]のアニメソングである。\n初回版特典として「いきものカード」005および『NARUTO -ナルト- 疾風伝』スペシャルカード封入。\nPVは、鳥篭を思わせるセットの中でメンバーが歌うという構成になっている。\nこのシングルでは「HANABI」を上回り、自己最高となる初動売上枚数を記録した。また、シングルとしては初のオリコンチャートTOP3入りを果たした。', '1643520057257', '1621561893076');
INSERT INTO `album` VALUES ('1643520770093', 'Native (Deluxe Version)', 'http://localhost:8200/album/cover?id=1643520770093', '1364140800000', '★以成名作\"Apologize\"缔造1000万张下载销售的流行摇滚乐团2013年劲碟\n★首支单曲\"Feel Again\"挺进全美热门单曲榜、流行单曲榜与成人抒情榜TOP40\n★专辑邀请潮派音乐製作菁英Philippe Zdar (*Depeche Mode)、Jeff Bhasker (*fun.)、Benny Blanco (*Maroon 5)等齐力打造', '1643520681562', '1621561877531');
INSERT INTO `album` VALUES ('1643880233413', '慢慢懂', 'http://localhost:8200/album/cover?id=1643880233413', '1289232000000', '《慢慢懂》中收录了汪苏泷（silence）之前发布过的经典歌曲和几首新作。整张专辑精心打造，经典老歌全部重新制作，而几首新作更是带来让人惊艳的全新突破。才华横溢的汪苏泷（silence）到底还有多少让众人折服的才思泉涌？让我们拭目以待11月19日即将在汪苏泷母校沈阳音乐学院发行的首张大碟《慢慢懂》。 ', '1635341560361', '1621561852524');
INSERT INTO `album` VALUES ('1643880876793', 'Love poem', 'http://localhost:8200/album/cover?id=1643880876793', '1574006400000', 'IU第五张迷你专辑 [Love poem] 公开。\n在过去的11月1日先行公开的同名先行曲 ‘Love poem’席卷各大音源网站榜首，使大众对本次专辑的期待值达到了一个小小的高潮。\n本次迷你专辑[Love poem]总共收录六首歌曲，所有歌曲均为IU作词、同时IU也参与了两首歌曲的作曲，再一次发挥了IU作为音乐制作人的力量。\n李民秀,李钟勋,李彩圭,载辉,金熙媛等作曲家，一直以来与IU的主打歌及主要歌曲并肩同行并给予IU音乐人生重大影响，可以说是为塑造IU音乐性本质贡献力量的合作伙伴，本次诸位作曲家也参与其中，共同完成了Electro pop-rock, blues, Ethnic fantasy 等独具特色且叙事性情感丰富的体裁。再加上홍소진,적재等韩国一流音乐人也参与专辑的编曲及演奏，使专辑的完成度再上一个台阶。', '1622072019119', '1621561883885');
INSERT INTO `album` VALUES ('1643881097597', '爱，不解释', 'http://localhost:8200/album/cover?id=1643881097597', '1387468800000', '暖情歌王张杰  感动十年 \n这个冬天  因为有爱  不再寒冷\n爱无言，不需解释，你一定懂。华语歌坛领军人物，超人气天王张杰继续其暖情歌风格，推出力作，第十张专辑《爱，不解释》，感动十年，真情呈现，见证张杰的成长与蜕变。成长中，最美的莫过于它的不确定性，十年，生活的感悟，十年，情感的积淀，促成了这张饱含暖意的专辑，而十张专辑的经验，十场演唱会的激情，也使得此张专辑更为成熟饱满，回归音乐带给人最真实的触动，让爱永驻心头。继暖身主打《我在这》发表广受业内外人士好评，专辑同名主打《爱，不解释》持续榜单第一后，整张专辑终于“千呼万唤始出来”，在这个寒冷的冬季，听众朋友们，也会因为有小杰的暖情歌萦绕心间，而不再寒冷。', '1622072970585', '1621561852524');
INSERT INTO `album` VALUES ('1643938531634', '一路生花', 'http://localhost:8200/album/cover?id=1643938531634', '1610985600000', ' 我希望许过的愿望一路生花\n将那雨中的人藏在屋檐下\n岁月在冲刷逆流沧桑的喧哗\n安静的夜晚你在想谁吗\n        ', '1643938461386', '1621561852524');
INSERT INTO `album` VALUES ('1644287493057', '最美的太阳', 'http://localhost:8200/album/cover?id=1644287493057', '1166889600000', '《张杰：最美的太阳 限量精装版》继张杰2007年首张EP大碟《最美的太阳》推出后，一路飘红的销量见证了张杰功力不凡的音乐实力和超高火爆的人气。2008年开年之际，现推出该张EP 的超值限量精装版回馈广大歌迷。', '1622072970585', '1621561852524');
INSERT INTO `album` VALUES ('1644298645535', '你头顶的风', 'http://localhost:8200/album/cover?id=1644298645535', '1612108800000', '一起吹过晚风的人，大概会记得很久吧。\n王小帅全新单曲《你头顶的风（吉他版）》先行上线。\n有些人经过，但却会在你心中留下痕迹，即便某天从记忆中清空，也会将想念化成一阵拂过你的头顶的风。看海、看天、看星辰，要记得，总有人会把万山万水迢递的春天唤醒，抚平你干涸的心。', '1644298601058', '1621561852524');
INSERT INTO `album` VALUES ('1644298968982', '雪龙吟', 'http://localhost:8200/album/cover?id=1644298968982', '1643040000000', '“苍山覆雪，待写壮丽，共同愿望，连接我和你。诗书古曲，万卷成了集，寥寥数笔，震撼这天地……”北京冬奥会倒计时10天，世界期待中国，中国做好了准备！一起听张杰唱的《雪龙吟》，我们北京见！', '1622072970585', '1621561852524');
INSERT INTO `album` VALUES ('1644375339209', 'monsters', 'http://localhost:8200/album/cover?id=1644375339209', '1399737600000', '英国创作女歌手Katie Sky单曲《Monsters》, 歌曲中Katie通过温柔且富有力量的嗓音向对方传递坚定果敢的信念，不要害怕，因为我一直在你身旁。', '1644375002022', '1621561877531');
INSERT INTO `album` VALUES ('1645598506732', '无名的人 (电影《雄狮少年》主题曲)', 'http://localhost:8200/album/cover?id=1645598506732', '1639411200000', '由毛不易演唱，钱雷作曲，唐恬作词的动画电影《雄狮少年》主题曲《无名的人》2021年12月14日上线，献给所有顶天立地却平凡普通的人们。', '1621602849693', '1621561852524');
INSERT INTO `album` VALUES ('1647143549483', '大江大河2', 'http://localhost:8200/album/cover?id=1647143549483', '1608393600000', '《大江大河2》是由上海广播电视台、正午阳光、SMG尚世影业出品，改编自阿耐小说《大江东去》，唐尧任编剧，马骋怡任联合编剧，李雪、黄伟执导，孔笙任艺术总监，侯鸿亮任制片人，王凯、杨烁、董子健、杨采钰领衔主演，周放、霍青、练练、冯晖、赵达、齐奎主演，杨立新、林栋甫、李光洁、苏小明、孙艺洲、张佳宁友情出演的当代题材电视剧。', '1624547670156', '1621561852524');
INSERT INTO `album` VALUES ('1647144237369', '拥抱你离去', 'http://localhost:8200/album/cover?id=1647144237369', '1513612800000', '爱情来了，悄无声息；爱情走了，撕心裂肺。面对爱情，能否做到热情不再就一刀两断，从此各自精彩？能否流过眼泪就抛开狼狈全部释怀？\n《拥抱你离去》歌曲开始用一种淡淡的忧伤演绎着爱情离去时的无奈和心碎，随后忧伤的男声伴着和声娓娓轻诉将歌曲推向高潮，副歌部分极富张力和爆发的演绎就像歇斯底里地宣泄着爱情的伤痛，仿佛在燃尽对这份感情的最后希翼。痛哭之后，决定收起悲伤，放自己一条生路。', '1647144073030', '1621561852524');
INSERT INTO `album` VALUES ('1647144602353', '缘份无边界', 'http://localhost:8200/album/cover?id=1647144602353', '952963200000', '郑中基在2003年5月份推出的一张粤语精选专辑，其中收录了他16首歌曲.', '1647144476077', '1621561852524');
INSERT INTO `album` VALUES ('1647145284879', '吻别', 'http://localhost:8200/album/cover?id=1647145284879', '731260800000', '《吻别》是香港歌手张学友发行的第十七张专辑，也是第五张国语专辑，该唱片仅在台湾的销量就破百万，它以136万的销量成绩在台湾历年唱片销量榜位居第一，同时本张专辑也是台湾历年专辑当中销售量最高的“男歌手”专辑，唱片以主打歌《吻别》为主', '1635506538320', '1621561852524');
INSERT INTO `album` VALUES ('1648207959257', '麻雀', 'http://localhost:8200/album/cover?id=1648207959257', '1596038400000', '渺小而又强大，脆弱而又顽强。\n《麻雀》\n这首《麻雀》是李荣浩第六张创作专辑第一主打单曲，也是专辑同名主打曲，用麻雀映射生活在城市中的我们，在物欲横流中，于波涛汹涌间，渺小而又强大，脆弱而又顽强。\n《老友记》\n你有没有那么几个时刻，怀念曾经的老友？加班加到爆肝的时候，病了无人陪伴的时候，失恋找不到人喝酒的时候...李荣浩的《老友记》述说了生活中的友情，人这一辈子，谁没有三两好友，但过客匆匆，曾经的好友也会变得渐行渐远，曾经的一切再也与自己无关，只剩下遗憾着祝福，旧朋友，你好好走，我就不陪你这么久。', '1622072806610', '1621561852524');
INSERT INTO `album` VALUES ('1648208672103', '窗外', 'http://localhost:8200/album/cover?id=1648208672103', '925488000000', '出生于西安的歌手李琛自幼因患小儿麻痹症致残，只能靠拄双拐走路，1992年曾在全国残疾人歌手大赛上获得一等奖，并转战北京寻找自己的音乐梦想。1999年他凭借一曲《窗外》迅速走红全国，成为继台湾歌手郑智化后又一个闻名全国的残疾人歌手。', '1648208620910', '1621561852524');
INSERT INTO `album` VALUES ('1648269772859', 'IU 5th Album \'LILAC\'', 'http://localhost:8200/album/cover?id=1648269772859', '1616601600000', 'IU 正规5辑 [LILAC]\n“再见，如花瓣般的再见”\n\"我的心没有任何疑问，我要继续前进“\n预示着对20代的末尾华丽\"问候\"的IU随着春天的气息以第五张正规专辑《LILAC》回归。时隔4年推出的正规专辑《LILAC》与带着20岁的坦率和青涩的感性发表的20多岁年轻人的首张专辑《20岁的春天》不同。 过去的20多岁用10首歌展开, 包含了多彩的成熟的感性。', '1622072019119', '1621561883885');
INSERT INTO `album` VALUES ('1648270374236', 'DIGIMON HISTORY 1999-2006 All The Best', 'http://localhost:8200/album/cover?id=1648270374236', '1262275200000', 'アニメ放映から10年…缔めを饰るのは、オープニング、エンディング、(进化)挿入歌をすべて网罗した、全シリーズを初めて収录したベスト盘。デジモン世代と呼ばれた子供达が、次の世代へと繋ぐ、まさにマストアイテム。キミは今でも进化できるか!?', '1622071867884', '1621561893076');
INSERT INTO `album` VALUES ('1648271623843', 'Evolution 王力宏的音乐进化论 \'95-\'02 新歌+精选', 'http://localhost:8200/album/cover?id=1648271623843', '1032710400000', '追求音乐理想的每一点音符 都是一次进化\n一张王力宏音乐进化过程的完整纪录\n从第一次录音唱「Last Night」，到新歌「W-H-Y」的带给大家惊奇；从「情敌贝多芬」的优质偶像，到全创作专辑的创作音乐人；从自己的创作曲放在专辑B面，到独当一面包办自己专辑的制作；从得十大偶像奖到得到金曲奖最佳制作人奖；从与范晓萱合唱「雪人」，到为好莱坞国际大片「蜘蛛人」制作亚洲版主题曲；王力宏定位及格局的转变历历在目，努力突破偶像的外表，不断挑战自己的能力，让人肯定他在音乐上的才华，在音乐人的位子上占有一席之地，今天的王力宏都是因为一次一次突破累积而来的。', '1648271489040', '1621561852524');
INSERT INTO `album` VALUES ('1648273110035', 'Lover (恋人)', 'http://localhost:8200/album/cover?id=1648273110035', '1566489600000', '时代杂志册封「百大影响力人物」，福布斯百大名人榜冠军，全球共同迎接全新【Lover】时代\n强势收录全球数字流媒体连续破亿主打\"ME!\"、\"You Need to Calm Down\"等多首主打\n万众期待，10座格莱美音乐奖得主，美国流行唱作天后Taylor Swift第7张录音室专辑《Lover》于8月23日全球发行。这张专辑在中国地区首度发行“中国特别版”数字专辑，特别为中国歌迷收录2首“audio-memo”作品。', '1622072451745', '1621561877531');
INSERT INTO `album` VALUES ('1649333904053', 'With Love', 'http://localhost:8200/album/cover?id=1649333904053', '1453996800000', '在他们的故事里 找到爱的勇气 \n    32首浪漫韩剧．经典日剧．爱情电影．爱的主题曲 \n    浪漫满屋 我叫金三顺 长假 恋爱世代 我的野蛮女友 夏之雪 巴黎恋人 蛋糕上的草莓 \n    横跨日、韩、欧、美等音乐大厂 DSD数位录音发烧音质原曲原唱', '1649333771120', '1621561877531');
INSERT INTO `album` VALUES ('1649335015187', 'KISS', 'http://localhost:8200/album/cover?id=1649335015187', '1348761600000', '《Kiss》是加拿大女歌手Carly Rae Jepsen第二张录音室专辑，在2012年9月14日，由604、Schoolboy和Interscope Records共同发布。继首张专辑《Tug of War》在加拿大发行但并未国际发行，《Kiss》成为Carly Rae Jepsen首张国际发行的专辑。全专收录22首作品，包括全球冠单《Call Me Maybe》以及联手Owl City合作热单《Good Time》。\n特别收录日本版独占新歌《Picture》及三首混音。', '1649333771120', '1621561877531');
INSERT INTO `album` VALUES ('1649336326830', 'Inside Llewyn Davis: Original Soundtrack Recording', 'http://localhost:8200/album/cover?id=1649336326830', '1381248000000', '影片以民谣歌手戴夫·范·朗克的经历为蓝本，讲述在上世纪六十年代一位名为勒维恩·戴维斯的歌手的奋斗历程，再现了那个民谣音乐全盛时代的氛围。原声带收录了Justin Timberlake、Oscar Isaac、Bob Dylan以及Dave Van Ronk等艺人的歌曲。', '1649335834894', '1621561877531');
INSERT INTO `album` VALUES ('1649336700163', 'Reynard Silva', 'http://localhost:8200/album/cover?id=1649336700163', '1393948800000', 'Reynard Silva', '1649336637726', '1621561877531');
INSERT INTO `album` VALUES ('1649336978859', 'Blue Neighbourhood', 'http://localhost:8200/album/cover?id=1649336978859', '1449158400000', '让泰勒丝惊艳、让爱黛儿哭泣，时代杂志「25大具有影响力青少年」、MTV音乐大奖「最有潜力新人」20岁电气才子Troye Sivan新专辑《Blue Neighbourhood》。收录挑战性别禁忌三部曲\"Wild\"、\"Fools\"、\"Take Me Down\"，还请到了饶舌天王阿姆Eminem御用製作人、葛莱美得主Emile Haynie联手操刀，一同谱出了这张旷世之作。', '1622072666625', '1621561877531');
INSERT INTO `album` VALUES ('1649574999552', 'reputation', 'http://localhost:8200/album/cover?id=1649574999552', '1510243200000', '阔别三年， Taylor Swift第六张录音专辑《reputation》11月10日全球发行。专辑除Taylor一手监制外，再邀三座格莱美得主的御用搭档Jack Antonoff，金曲制单机Max Martin及Shellback等实力音乐人联袂操刀。', '1622072451745', '1621561877531');
INSERT INTO `album` VALUES ('1649982201990', '时光音乐会 第2期', 'http://localhost:8200/album/cover?id=1649982201990', '1635436800000', '时光音乐会', '1649982084489', '1621561852524');
INSERT INTO `album` VALUES ('1650524098532', 'The Fame', 'http://localhost:8200/album/cover?id=1650524098532', '1199116800000', '  Lady GaGa来自纽约，是签约Akon品牌旗下的艺人，这座五光十色的城市赋予了她时尚靓丽的气息，和许多叛逆的青年一样，22岁的她充斥着大胆前卫和另类，甚至是一个常人眼中衣着暴露的不良少女，然而同时...', '1635341685282', '1621561877531');
INSERT INTO `album` VALUES ('1650524472384', 'GUILTY', 'http://localhost:8200/album/cover?id=1650524472384', '1199116800000', '2008年4月8日出道10周年的滨崎步，带来第9张个人大碟《Guilty》。大碟收入ayu在2007年推出的多首人气单曲，包括「glitter」、「fated」、「talkin＇ 2 myself」和「decision」等14首歌曲。', '1634457674287', '1621561893076');
INSERT INTO `album` VALUES ('1650524754518', 'Trouble Maker', 'http://localhost:8200/album/cover?id=1650524754518', '1291132800000', '안 된다고 할 수록 우린 더 신나! 진짜 Trouble Maker들의 반란이 시작된다. \n비스트 장현승(JS), 포미닛 현아의 특급 프로젝트 ‘Trouble Maker’', '1622072283515', '1621561883885');
INSERT INTO `album` VALUES ('1650524958719', '粥请客', 'http://localhost:8200/album/cover?id=1650524958719', '1538064000000', '    前两天刚好在北京过中秋，我就去胜男家里找她玩，然后在附近吃了串，相谈甚欢。为了记录这次短暂的会面，我拉着她赶在我离开北京之前录完了这首歌，所以，夸就完事了！不要吝啬你们赞美的词藻！今天我就是这个峡谷里...\n        ', '1634530730835', '1621561852524');
INSERT INTO `album` VALUES ('1650533560040', '到死都要18岁', 'http://localhost:8200/album/cover?id=1650533560040', '1261065600000', '哈青春 / 哈摇滚 / 哈情歌 3首新歌+45首精选', '1650533473576', '1621561852524');
INSERT INTO `album` VALUES ('1650786424016', 'Love Me Like You Do', 'http://localhost:8200/album/cover?id=1650786424016', '1446739200000', '新世纪天后 格雷的女声 刺激全球听觉 睽违三年全新专辑', '1650786261435', '1621561877531');
INSERT INTO `album` VALUES ('1650786613182', 'Outside', 'http://localhost:8200/album/cover?id=1650786613182', '1415808000000', '<Motion>是Calvin Harris在2014年11月3日发行的专辑。', '1650786261435', '1621561877531');

-- ----------------------------
-- Table structure for albumcate
-- ----------------------------
DROP TABLE IF EXISTS `albumcate`;
CREATE TABLE `albumcate`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of albumcate
-- ----------------------------
INSERT INTO `albumcate` VALUES ('1621561852524', '华语');
INSERT INTO `albumcate` VALUES ('1621561877531', '欧美');
INSERT INTO `albumcate` VALUES ('1621561883885', '韩国');
INSERT INTO `albumcate` VALUES ('1621561893076', '日本');
INSERT INTO `albumcate` VALUES ('1649242138022', '挪威');

-- ----------------------------
-- Table structure for albumcover
-- ----------------------------
DROP TABLE IF EXISTS `albumcover`;
CREATE TABLE `albumcover`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `alId`) USING BTREE,
  INDEX `alId`(`alId`) USING BTREE,
  CONSTRAINT `alId` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of albumcover
-- ----------------------------
INSERT INTO `albumcover` VALUES ('1621948204304', '1621948204281', '艾伦沃克.jpg', 'image/jpeg', './upload/album/cover', '1621948204302.jpg', 14944, '2021-05-25 21:10:04', '2021-05-25 21:10:04');
INSERT INTO `albumcover` VALUES ('1621948599643', '1621948599627', 'justice.jpg', 'image/jpeg', './upload/album/cover', '1621948599642.jpg', 18814, '2021-05-25 21:16:39', '2021-05-25 21:16:39');
INSERT INTO `albumcover` VALUES ('1621948912120', '1621948912106', 'holdon.jpg', 'image/jpeg', './upload/album/cover', '1621948912120.jpg', 17710, '2021-05-25 21:21:52', '2021-05-25 21:21:52');
INSERT INTO `albumcover` VALUES ('1621949008196', '1621949008183', 'anyone.jpg', 'image/jpeg', './upload/album/cover', '1621949008196.jpg', 8343, '2021-05-25 21:23:28', '2021-05-25 21:23:28');
INSERT INTO `albumcover` VALUES ('1621949107831', '1621949107814', 'monster.jpg', 'image/jpeg', './upload/album/cover', '1621949107830.jpg', 17082, '2021-05-25 21:25:07', '2021-05-25 21:25:07');
INSERT INTO `albumcover` VALUES ('1622073564291', '1622073564263', '是但求其爱.jpg', 'image/jpeg', './upload/album/cover', '1622073564290.jpg', 15315, '2021-05-27 07:59:24', '2021-05-27 07:59:24');
INSERT INTO `albumcover` VALUES ('1622073673556', '1622073673540', '致明日的舞.jpg', 'image/jpeg', './upload/album/cover', '1622073673555.jpg', 5306, '2021-05-27 08:01:13', '2021-05-27 08:01:13');
INSERT INTO `albumcover` VALUES ('1622073722088', '1622073722073', '一首歌一个故事.jpg', 'image/jpeg', './upload/album/cover', '1622073722087.jpg', 108462, '2021-05-27 08:02:02', '2021-05-27 08:02:02');
INSERT INTO `albumcover` VALUES ('1622073777629', '1622073777612', 'Shall We Talk (Tre Lune MMXIX).jpg', 'image/jpeg', './upload/album/cover', '1622073777629.jpg', 7628, '2021-05-27 08:02:57', '2021-05-27 08:02:57');
INSERT INTO `albumcover` VALUES ('1622073850183', '1622073850159', 'Fight as ONE.jpg', 'image/jpeg', './upload/album/cover', '1622073850181.jpg', 193026, '2021-05-27 08:04:10', '2021-05-27 08:04:10');
INSERT INTO `albumcover` VALUES ('1622073934113', '1622073934094', '相信你的人 (热血励志版).jpg', 'image/jpeg', './upload/album/cover', '1622073934112.jpg', 13408, '2021-05-27 08:05:34', '2021-05-27 08:05:34');
INSERT INTO `albumcover` VALUES ('1622074137849', '1622074137833', 'STRAY SHEEP.jpg', 'image/jpeg', './upload/album/cover', '1622074137848.jpg', 18120, '2021-05-27 08:08:57', '2021-05-27 08:08:57');
INSERT INTO `albumcover` VALUES ('1622074187216', '1622074187201', 'パプリカ.jpg', 'image/jpeg', './upload/album/cover', '1622074187215.jpg', 16785, '2021-05-27 08:09:47', '2021-05-27 08:09:47');
INSERT INTO `albumcover` VALUES ('1622074240401', '1622074240385', '馬と鹿.jpg', 'image/jpeg', './upload/album/cover', '1622074240400.jpg', 17760, '2021-05-27 08:10:40', '2021-05-27 08:10:40');
INSERT INTO `albumcover` VALUES ('1622074304382', '1622074304369', '海の幽霊.jpg', 'image/jpeg', './upload/album/cover', '1622074304381.jpg', 26060, '2021-05-27 08:11:44', '2021-05-27 08:11:44');
INSERT INTO `albumcover` VALUES ('1622074381633', '1622074381617', 'Flamingo.jpg', 'image/jpeg', './upload/album/cover', '1622074381632.jpg', 11633, '2021-05-27 08:13:01', '2021-05-27 08:13:01');
INSERT INTO `albumcover` VALUES ('1622074447994', '1622074447978', 'Lemon.jpg', 'image/jpeg', './upload/album/cover', '1622074447993.jpg', 7662, '2021-05-27 08:14:07', '2021-05-27 08:14:07');
INSERT INTO `albumcover` VALUES ('1622074574726', '1622074574710', 'Fearless (Taylor\'s Version).jpg', 'image/jpeg', './upload/album/cover', '1622074574726.jpg', 14304, '2021-05-27 08:16:14', '2021-05-27 08:16:14');
INSERT INTO `albumcover` VALUES ('1622074645867', '1622074645854', 'willow (moonlit witch version).jpg', 'image/jpeg', './upload/album/cover', '1622074645866.jpg', 17281, '2021-05-27 08:17:25', '2021-05-27 08:17:25');
INSERT INTO `albumcover` VALUES ('1622074694387', '1622074694370', 'willow (lonely witch version).jpg', 'image/jpeg', './upload/album/cover', '1622074694386.jpg', 12355, '2021-05-27 08:18:14', '2021-05-27 08:18:14');
INSERT INTO `albumcover` VALUES ('1622074775185', '1622074775169', 'evermore (deluxe version).jpg', 'image/jpeg', './upload/album/cover', '1622074775184.jpg', 13351, '2021-05-27 08:19:35', '2021-05-27 08:19:35');
INSERT INTO `albumcover` VALUES ('1623419176868', '1623419176842', 'buffer.jpg', 'image/jpeg', './upload/album/cover', '1623419176866.jpg', 44916, '2021-06-11 21:46:16', '2021-06-11 21:46:16');
INSERT INTO `albumcover` VALUES ('1624372189541', '1624372189519', '109951166004498861.jpg', 'image/jpeg', './upload/album/cover', '1624372189537.jpg', 9252, '2021-06-22 22:29:49', '2021-06-22 22:29:49');
INSERT INTO `albumcover` VALUES ('1624375276312', '1624375276272', '109951165389077755.jpg', 'image/jpeg', './upload/album/cover', '1624375276306.jpg', 7154, '2021-06-22 23:21:16', '2021-06-22 23:21:16');
INSERT INTO `albumcover` VALUES ('1624545961977', '1624545961961', '18548761162235571.jpg', 'image/jpeg', './upload/album/cover', '1624545961976.jpg', 6418, '2021-06-24 22:46:01', '2021-06-24 22:46:01');
INSERT INTO `albumcover` VALUES ('1624546413732', '1624546413717', '18957779486268444.jpg', 'image/jpeg', './upload/album/cover', '1624546413731.jpg', 5806, '2021-06-24 22:53:33', '2021-06-24 22:53:33');
INSERT INTO `albumcover` VALUES ('1624547874233', '1624547874208', '109951164148664637.jpg', 'image/jpeg', './upload/album/cover', '1624547874229.jpg', 11071, '2021-06-24 23:17:54', '2021-06-24 23:17:54');
INSERT INTO `albumcover` VALUES ('1624549188413', '1624549188385', '109951166107927511.jpg', 'image/jpeg', './upload/album/cover', '1624549188411.jpg', 5888, '2021-06-24 23:39:48', '2021-06-24 23:39:48');
INSERT INTO `albumcover` VALUES ('1625405674458', '1625405674442', '109951166065489052.jpg', 'image/jpeg', './upload/album/cover', '1625405674457.jpg', 4316, '2021-07-04 21:34:34', '2021-07-04 21:34:34');
INSERT INTO `albumcover` VALUES ('1625408324094', '1625408324076', '18782957139233959.jpg', 'image/jpeg', './upload/album/cover', '1625408324093.jpg', 5447, '2021-07-04 22:18:44', '2021-07-04 22:18:44');
INSERT INTO `albumcover` VALUES ('1626233207608', '1626233207593', 'love.jpg', 'image/jpeg', './upload/album/cover', '1626233207607.jpg', 25864, '2021-07-14 11:26:47', '2021-07-14 11:26:47');
INSERT INTO `albumcover` VALUES ('1626272577582', '1626272577568', '109951165359676341.jpg', 'image/jpeg', './upload/album/cover', '1626272577580.jpg', 4637, '2021-07-14 22:22:57', '2021-07-14 22:22:57');
INSERT INTO `albumcover` VALUES ('1626360628118', '1626360628102', '18568552371674199.jpg', 'image/jpeg', './upload/album/cover', '1626360628116.jpg', 8779, '2021-07-15 22:50:28', '2021-07-15 22:50:28');
INSERT INTO `albumcover` VALUES ('1633919083738', '1633919083723', '1.jpg', 'image/jpeg', './upload/album/cover', '1633919083737.jpg', 6251, '2021-10-11 10:24:43', '2021-10-11 10:24:43');
INSERT INTO `albumcover` VALUES ('1633946154120', '1633946154102', '有形的翅膀.jpg', 'image/jpeg', './upload/album/cover', '1633946154119.jpg', 87843, '2021-10-11 17:55:54', '2021-10-11 17:55:54');
INSERT INTO `albumcover` VALUES ('1633946790490', '1633946790475', '18712588395102549.jpg', 'image/jpeg', './upload/album/cover', '1633946790489.jpg', 6523, '2021-10-11 18:06:30', '2021-10-11 18:06:30');
INSERT INTO `albumcover` VALUES ('1634362031997', '1634362031980', '109951165543196748.jpg', 'image/jpeg', './upload/album/cover', '1634362031996.jpg', 6357, '2021-10-16 13:27:11', '2021-10-16 13:27:11');
INSERT INTO `albumcover` VALUES ('1634457950436', '1634457950420', '109951165049922782.jpg', 'image/jpeg', './upload/album/cover', '1634457950435.jpg', 6441, '2021-10-17 16:05:50', '2021-10-17 16:05:50');
INSERT INTO `albumcover` VALUES ('1634531460198', '1634531460174', '109951166118671647.jpg', 'image/jpeg', './upload/album/cover', '1634531460194.jpg', 6540, '2021-10-18 12:31:00', '2021-10-18 12:31:00');
INSERT INTO `albumcover` VALUES ('1634541272022', '1634541272001', '109951163290871736.jpg', 'image/jpeg', './upload/album/cover', '1634541272020.jpg', 2856, '2021-10-18 15:14:32', '2021-10-18 15:14:32');
INSERT INTO `albumcover` VALUES ('1635337496793', '1635337496777', '109951165674646596.jpg', 'image/jpeg', './upload/album/cover', '1635337496791.jpg', 75949, '2021-10-27 20:24:56', '2021-10-27 20:24:56');
INSERT INTO `albumcover` VALUES ('1635338243824', '1635338243811', '109951165641911293.jpg', 'image/jpeg', './upload/album/cover', '1635338243823.jpg', 3002, '2021-10-27 20:37:23', '2021-10-27 20:37:23');
INSERT INTO `albumcover` VALUES ('1635339149508', '1635339149495', '109951163049831563.jpg', 'image/jpeg', './upload/album/cover', '1635339149507.jpg', 5862, '2021-10-27 20:52:29', '2021-10-27 20:52:29');
INSERT INTO `albumcover` VALUES ('1635340071586', '1635340071562', '109951166530781958.jpg', 'image/jpeg', './upload/album/cover', '1635340071582.jpg', 4831, '2021-10-27 21:07:51', '2021-10-27 21:07:51');
INSERT INTO `albumcover` VALUES ('1635503394616', '1635503394595', '109951163699673355.jpg', 'image/jpeg', './upload/album/cover', '1635503394613.jpg', 45520, '2021-10-29 18:29:54', '2021-10-29 18:29:54');
INSERT INTO `albumcover` VALUES ('1635506247265', '1635506247250', '109951165047930332.jpg', 'image/jpeg', './upload/album/cover', '1635506247264.jpg', 3860, '2021-10-29 19:17:27', '2021-10-29 19:17:27');
INSERT INTO `albumcover` VALUES ('1635506697074', '1635506697059', '19146895486205137.jpg', 'image/jpeg', './upload/album/cover', '1635506697073.jpg', 3450, '2021-10-29 19:24:57', '2021-10-29 19:24:57');
INSERT INTO `albumcover` VALUES ('1635507329422', '1635507329406', '109951163200234839.jpg', 'image/jpeg', './upload/album/cover', '1635507329420.jpg', 11208, '2021-10-29 19:35:29', '2021-10-29 19:35:29');
INSERT INTO `albumcover` VALUES ('1635508872699', '1635508872682', '109951165946252774.jpg', 'image/jpeg', './upload/album/cover', '1635508872697.jpg', 9050, '2021-10-29 20:01:12', '2021-10-29 20:01:12');
INSERT INTO `albumcover` VALUES ('1635680348730', '1635680348714', '109951165338538266.jpg', 'image/jpeg', './upload/album/cover', '1635680348729.jpg', 3014, '2021-10-31 19:39:08', '2021-10-31 19:39:08');
INSERT INTO `albumcover` VALUES ('1635681648294', '1635681648278', '109951163785600029.jpg', 'image/jpeg', './upload/album/cover', '1635681648293.jpg', 69586, '2021-10-31 20:00:48', '2021-10-31 20:00:48');
INSERT INTO `albumcover` VALUES ('1643435539822', '1643435539795', '109951163533014729.jpg', 'image/jpeg', './upload/album/cover', '1643435539819.jpg', 8763, '2022-01-29 13:52:19', '2022-01-29 13:52:19');
INSERT INTO `albumcover` VALUES ('1643453975793', '1643453975767', '109951164260611202.jpg', 'image/jpeg', './upload/album/cover', '1643453975791.jpg', 62633, '2022-01-29 18:59:35', '2022-01-29 18:59:35');
INSERT INTO `albumcover` VALUES ('1643454724922', '1643454724896', '7915384208954478.jpg', 'image/jpeg', './upload/album/cover', '1643454724920.jpg', 4459, '2022-01-29 19:12:04', '2022-01-29 19:12:04');
INSERT INTO `albumcover` VALUES ('1643519009420', '1643519009398', '109951165992352975.jpg', 'image/jpeg', './upload/album/cover', '1643519009417.jpg', 8397, '2022-01-30 13:03:29', '2022-01-30 13:03:29');
INSERT INTO `albumcover` VALUES ('1643519691644', '1643519691617', '109951165493111976.jpg', 'image/jpeg', './upload/album/cover', '1643519691640.jpg', 77298, '2022-01-30 13:14:51', '2022-01-30 13:14:51');
INSERT INTO `albumcover` VALUES ('1643520177048', '1643520177035', '109951166200194461.jpg', 'image/jpeg', './upload/album/cover', '1643520177047.jpg', 11332, '2022-01-30 13:22:57', '2022-01-30 13:22:57');
INSERT INTO `albumcover` VALUES ('1643520770107', '1643520770093', '109951166116113169.jpg', 'image/jpeg', './upload/album/cover', '1643520770106.jpg', 6718, '2022-01-30 13:32:50', '2022-01-30 13:32:50');
INSERT INTO `albumcover` VALUES ('1643880233440', '1643880233413', '109951165687445155.jpg', 'image/jpeg', './upload/album/cover', '1643880233438.jpg', 81520, '2022-02-03 17:23:53', '2022-02-03 17:23:53');
INSERT INTO `albumcover` VALUES ('1643880876806', '1643880876793', '109951164496579083.jpg', 'image/jpeg', './upload/album/cover', '1643880876805.jpg', 6678, '2022-02-03 17:34:36', '2022-02-03 17:34:36');
INSERT INTO `albumcover` VALUES ('1643881097612', '1643881097597', '109951163117902077.jpg', 'image/jpeg', './upload/album/cover', '1643881097611.jpg', 4353, '2022-02-03 17:38:17', '2022-02-03 17:38:17');
INSERT INTO `albumcover` VALUES ('1643938531647', '1643938531634', '3871462838.jpg', 'image/jpeg', './upload/album/cover', '1643938531646.jpg', 17193, '2022-02-04 09:35:31', '2022-02-04 09:35:31');
INSERT INTO `albumcover` VALUES ('1644287493081', '1644287493057', '109951165623278393.jpg', 'image/jpeg', './upload/album/cover', '1644287493078.jpg', 60372, '2022-02-08 10:31:33', '2022-02-08 10:31:33');
INSERT INTO `albumcover` VALUES ('1644298645553', '1644298645535', '109951165849714968.jpg', 'image/jpeg', './upload/album/cover', '1644298645551.jpg', 6879, '2022-02-08 13:37:25', '2022-02-08 13:37:25');
INSERT INTO `albumcover` VALUES ('1644298969000', '1644298968982', '109951166978108465.jpg', 'image/jpeg', './upload/album/cover', '1644298968998.jpg', 78699, '2022-02-08 13:42:49', '2022-02-08 13:42:49');
INSERT INTO `albumcover` VALUES ('1644375339225', '1644375339209', '109951163510035145.jpg', 'image/jpeg', './upload/album/cover', '1644375339224.jpg', 6569, '2022-02-09 10:55:39', '2022-02-09 10:55:39');
INSERT INTO `albumcover` VALUES ('1645598506761', '1645598506732', '109951166724351491.jpg', 'image/jpeg', './upload/album/cover', '1645598506757.jpg', 6098, '2022-02-23 14:41:46', '2022-02-23 14:41:46');
INSERT INTO `albumcover` VALUES ('1647143549517', '1647143549483', '109951165556969471.jpg', 'image/jpeg', './upload/album/cover', '1647143549514.jpg', 6058, '2022-03-13 11:52:29', '2022-03-13 11:52:29');
INSERT INTO `albumcover` VALUES ('1647144237389', '1647144237369', '109951163088486279.jpg', 'image/jpeg', './upload/album/cover', '1647144237387.jpg', 4405, '2022-03-13 12:03:57', '2022-03-13 12:03:57');
INSERT INTO `albumcover` VALUES ('1647144602374', '1647144602353', '109951163020573820.jpg', 'image/jpeg', './upload/album/cover', '1647144602373.jpg', 6711, '2022-03-13 12:10:02', '2022-03-13 12:10:02');
INSERT INTO `albumcover` VALUES ('1647145284899', '1647145284879', '109951166032666632.jpg', 'image/jpeg', './upload/album/cover', '1647145284897.jpg', 72945, '2022-03-13 12:21:24', '2022-03-13 12:21:24');
INSERT INTO `albumcover` VALUES ('1648207959284', '1648207959257', '109951165182029540.jpg', 'image/jpeg', './upload/album/cover', '1648207959281.jpg', 81274, '2022-03-25 19:32:39', '2022-03-25 19:32:39');
INSERT INTO `albumcover` VALUES ('1648208672126', '1648208672103', '109951163104195319.jpg', 'image/jpeg', './upload/album/cover', '1648208672125.jpg', 5594, '2022-03-25 19:44:32', '2022-03-25 19:44:32');
INSERT INTO `albumcover` VALUES ('1648269772880', '1648269772859', '109951165835781941.jpg', 'image/jpeg', './upload/album/cover', '1648269772878.jpg', 6714, '2022-03-26 12:42:52', '2022-03-26 12:42:52');
INSERT INTO `albumcover` VALUES ('1648270374255', '1648270374236', '2321069046256264.jpg', 'image/jpeg', './upload/album/cover', '1648270374254.jpg', 78518, '2022-03-26 12:52:54', '2022-03-26 12:52:54');
INSERT INTO `albumcover` VALUES ('1648271623863', '1648271623843', '109951167107188111.jpg', 'image/jpeg', './upload/album/cover', '1648271623862.jpg', 6215, '2022-03-26 13:13:43', '2022-03-26 13:13:43');
INSERT INTO `albumcover` VALUES ('1648273110057', '1648273110035', '109951164260234943.jpg', 'image/jpeg', './upload/album/cover', '1648273110055.jpg', 62348, '2022-03-26 13:38:30', '2022-03-26 13:38:30');
INSERT INTO `albumcover` VALUES ('1649333904077', '1649333904053', '20170629121213718685.jpg', 'image/jpeg', './upload/album/cover', '1649333904076.jpg', 30254, '2022-04-07 20:18:24', '2022-04-07 20:18:24');
INSERT INTO `albumcover` VALUES ('1649335015208', '1649335015187', '20200909112612648204.jpg', 'image/jpeg', './upload/album/cover', '1649335015207.jpg', 21915, '2022-04-07 20:36:55', '2022-04-07 20:36:55');
INSERT INTO `albumcover` VALUES ('1649336326851', '1649336326830', '20200909113927141888.jpg', 'image/jpeg', './upload/album/cover', '1649336326850.jpg', 19557, '2022-04-07 20:58:46', '2022-04-07 20:58:46');
INSERT INTO `albumcover` VALUES ('1649336700183', '1649336700163', '20150719062402897905.jpg', 'image/jpeg', './upload/album/cover', '1649336700182.jpg', 16630, '2022-04-07 21:05:00', '2022-04-07 21:05:00');
INSERT INTO `albumcover` VALUES ('1649336978878', '1649336978859', '20200812154425514877.jpg', 'image/jpeg', './upload/album/cover', '1649336978877.jpg', 17163, '2022-04-07 21:09:38', '2022-04-07 21:09:38');
INSERT INTO `albumcover` VALUES ('1649574999577', '1649574999552', '109951163054654501.jpg', 'image/jpeg', './upload/album/cover', '1649574999575.jpg', 9018, '2022-04-10 15:16:39', '2022-04-10 15:16:39');
INSERT INTO `albumcover` VALUES ('1649982202021', '1649982201990', '1360364478.jpg', 'image/jpeg', './upload/album/cover', '1649982202016.jpg', 4637, '2022-04-15 08:23:22', '2022-04-15 08:23:22');
INSERT INTO `albumcover` VALUES ('1650524098574', '1650524098532', '3974407903.jpg', 'image/jpeg', './upload/album/cover', '1650524098565.jpg', 10416, '2022-04-21 14:54:58', '2022-04-21 14:54:58');
INSERT INTO `albumcover` VALUES ('1650524472411', '1650524472384', '2019718377.jpg', 'image/jpeg', './upload/album/cover', '1650524472405.jpg', 11165, '2022-04-21 15:01:12', '2022-04-21 15:01:12');
INSERT INTO `albumcover` VALUES ('1650524754544', '1650524754518', '143820566.jpg', 'image/jpeg', './upload/album/cover', '1650524754539.jpg', 8746, '2022-04-21 15:05:54', '2022-04-21 15:05:54');
INSERT INTO `albumcover` VALUES ('1650524958745', '1650524958719', '864490530.jpg', 'image/jpeg', './upload/album/cover', '1650524958738.jpg', 3243, '2022-04-21 15:09:18', '2022-04-21 15:09:18');
INSERT INTO `albumcover` VALUES ('1650533560067', '1650533560040', '879814987.jpg', 'image/jpeg', './upload/album/cover', '1650533560061.jpg', 8290, '2022-04-21 17:32:40', '2022-04-21 17:32:40');
INSERT INTO `albumcover` VALUES ('1650786424047', '1650786424016', '1450560911.jpg', 'image/jpeg', './upload/album/cover', '1650786424044.jpg', 7369, '2022-04-24 15:47:04', '2022-04-24 15:47:04');
INSERT INTO `albumcover` VALUES ('1650786613206', '1650786613182', '2574836603.jpg', 'image/jpeg', './upload/album/cover', '1650786613204.jpg', 8971, '2022-04-24 15:50:13', '2022-04-24 15:50:13');

-- ----------------------------
-- Table structure for artist
-- ----------------------------
DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `avatarUrl` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artist
-- ----------------------------
INSERT INTO `artist` VALUES ('1621602441778', '林俊杰JJ', '林俊杰（JJ Lin），1981年3月27日出生于新加坡，祖籍中国福建省厦门市同安区，华语流行乐男歌手、音乐人、潮牌主理人。2003年发行首张创作专辑《乐行者》，并于次年凭借该专辑获得第15届台湾金曲奖最佳新人奖。2004年凭借专辑《第二天堂》中的主打歌《江南》获得广泛关注。2006年首次举办个人巡演“就是俊杰”世界巡回演唱会。', 'http://localhost:8200/artist/avatar?id=1621602441778', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1621602559815', '陈奕迅', '陈奕迅（Eason Chan），1974年7月27日出生于中国香港，祖籍广东省东莞市， [1]  华语流行乐男歌手、演员、作曲人，毕业于英国金斯顿大学。\n1995年参加第14届新秀歌唱大赛并获得冠军，同年正式出道。1996年发行个人首张专辑《陈奕迅》。1997年主演个人首部电影《旺角大家姐》。', 'http://localhost:8200/artist/avatar?id=1621602559815', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1621602754351', '许嵩', '许嵩（Vae），1986年5月14日生于安徽省合肥市，中国内地流行乐男歌手、词曲创作人、音乐制作人，现任海蝶音乐公司（现为太合音乐集团）音乐总监，毕业于安徽医科大学。2009年1月发行首张词曲全创作专辑《自定义》。2010年1月发行第二张词曲全创作专辑《寻雾启示》。2011年4月发行第三张词曲全创作专辑《苏格拉没有底》。2012年7月发行第四张词曲全创作专辑《梦游计》。2014年8月发行第五张词曲', 'http://localhost:8200/artist/avatar?id=1621602754351', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1621602849693', '毛不易', '毛不易，本名王维家，1994年10月1日出生于黑龙江省齐齐哈尔市泰来县，中国内地流行乐男歌手，毕业于杭州师范大学护理专业。\n2017年，参加腾讯视频选秀娱乐节目《明日之子》，获得全国总决赛冠军，从而正式进入演艺圈 [1]  ；11月11日，推出个人原创单曲《项羽虞姬》 [2]  ；12月28日，获得腾讯娱乐白皮书音乐年度之星奖 [3]  。2018年1月7日，获得首届金鲛奖年度十佳网络新星奖 [4]  ；4月，作为“无限唱作人”参加江苏卫视音乐唱作类真人秀节目《无限歌谣季》 [5]  ；', 'http://localhost:8200/artist/avatar?id=1621602849693', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1621602969680', 'Justin Bieber', '贾斯汀·比伯（Justin Bieber），1994年3月1日出生于加拿大安大略省斯特拉特福市，加拿大流行乐男歌手、影视演员。2008年，贾斯汀·比伯在视频网站YouTube上被其经纪人斯科特发现，随后被亚瑟小子培养进入歌坛。2009年11月17日，发行第一张个人专辑《My World》。', 'http://localhost:8200/artist/avatar?id=1621602969680', '1621601405696', '1634364697494');
INSERT INTO `artist` VALUES ('1621603346150', '艾兰·沃克', '艾兰·奥拉夫·沃克（Alan Olav Walker），1997年8月24日出生于英国英格兰北安普敦郡，挪威DJ、音乐制作人。\n2014年11月，在YouTube上推出个人电音作品《Fade》而出道 。2015年12月，通过索尼音乐发行个人第一首正式单曲《Faded》，该首歌曲的MV在YouTube上的点击量突破了12亿  。2016年6月，发行人声伴唱电音单曲《Sing Me To Sleep》 。同年11月6日，获得MTV欧洲音乐奖“最佳挪威艺人”奖  ', 'http://localhost:8200/artist/avatar?id=1621603346150', '1621601405696', '1634364697494');
INSERT INTO `artist` VALUES ('1621603519600', '权志龙', 'G-DRAGON（权志龙、권지용），1988年8月18日出生于韩国首尔，韩国流行乐男歌手、词曲创作人、音乐制作人，男子演唱组合BIGBANG队长。2001年，因参与特别企划专辑《大韩民国Hip-Hop Flex》而出道。2006年，作为组合BIGBANG成员身份正式出道。2009年，发行第一张专辑《Heartbreaker》。', 'http://localhost:8200/artist/avatar?id=1621603519600', '1621601416660', '1634364697494');
INSERT INTO `artist` VALUES ('1621603618588', '米津玄师', '米津玄师（Yonezu Kenshi），1991年3月10日出生于日本德岛县德岛市，日本男歌手、词曲作者、编曲人、插画家、摄影师、舞者。\n2009年，米津玄师在VOCALOID上以“ハチ”的名义投稿、创作歌曲 ，2012年2月以本名“米津玄师”开始自作自唱歌曲。2013年5月发行首张单曲《Santa Maria》正式出道。', 'http://localhost:8200/artist/avatar?id=1621603618588', '1621601411103', '1634364697494');
INSERT INTO `artist` VALUES ('1622071594359', '初音ミク', '初音未来（ 初音ミク / Hatsune Miku ），是2007年8月31日由 Crypton Future Media 以雅马哈的 Vocaloid 系列语音合成程序为基础开发的音源库，音源数据资料采样于日本声优藤田咲', 'http://localhost:8200/artist/avatar?id=1622071594359', '1621601411103', '1634364722942');
INSERT INTO `artist` VALUES ('1622071678302', '星野源', '星野源（Hoshino Gen），1981年1月28日出生于日本埼玉县蕨市，日本歌手、演员及作家。经纪公司分属于Amuse（音乐合约）、大人计划（演员合约）。\n2010年发行首张个人音乐专辑《笨蛋之歌》。2011年9月发行第二张专辑《EPISODE》，进入日本公信榜周榜第五名。2012年12月，确诊蛛网膜下腔出血并宣布暂停演出活动', 'http://localhost:8200/artist/avatar?id=1622071678302', '1621601411103', '1634364697494');
INSERT INTO `artist` VALUES ('1622071800601', '中岛美嘉', '中岛美嘉（なかしまみか），1983年2月19日出生于日本鹿儿岛县日置市伊集院町，日本女歌手、演员。', 'http://localhost:8200/artist/avatar?id=1622071800601', '1621601411103', '1634364722942');
INSERT INTO `artist` VALUES ('1622071867884', '和田光司', '和田光司（わだ こうじ，Wada Kouji，1974年1月29日—2016年4月3日），日本歌手，出生于日本京都府福知山市。动画《数码宝贝》系列御用歌手，1999年4月23日，因在富士电视台系动画《数码宝贝大冒险》献唱主题曲《Butter-fly》完成了首次亮相而被乐迷所熟知。', 'http://localhost:8200/artist/avatar?id=1622071867884', '1621601411103', '1634364697494');
INSERT INTO `artist` VALUES ('1622071929712', '花泽香菜', '花泽香菜（はなざわ かな，Hanazawa Kana），1989年2月25日出生于日本东京，日本女性声优、演员、歌手，隶属于大泽事务所', 'http://localhost:8200/artist/avatar?id=1622071929712', '1621601411103', '1634364722942');
INSERT INTO `artist` VALUES ('1622072019119', 'IU', '李知恩（이지은/Lee Ji Eun），艺名IU，1993年5月16日出生于韩国首尔特别市，韩国女歌手、演员、主持人。\n2008年9月，在Mnet音乐节目《M! Countdown》中演唱歌曲《迷儿》，正式出道；随后发行首张迷你专辑《Lost And Found》。2009年，发行首张正规专辑《Growing Up》', 'http://localhost:8200/artist/avatar?id=1622072019119', '1621601416660', '1634364722942');
INSERT INTO `artist` VALUES ('1622072084825', '防弹少年团', '防弹少年团（BTS）是BigHit Entertainment于2013年6月13日推出的韩国男子演唱组合，由金南俊、金硕珍、闵玧其、郑号锡、朴智旻、金泰亨、田柾国7位成员组成。\n2013年6月，发行首张单曲专辑《2 COOL 4 SKOOL》', 'http://localhost:8200/artist/avatar?id=1622072084825', '1621601416660', '1634364732887');
INSERT INTO `artist` VALUES ('1622072142460', 'BIGBANG', 'BIGBANG（빅뱅），韩国男子演唱组合，现以G-DRAGON（权志龙）、T.O.P（崔胜铉）、TAEYANG（东永裴）、DAESUNG（姜大声）四名成员的组成形式展开活动', 'http://localhost:8200/artist/avatar?id=1622072142460', '1621601416660', '1634364732887');
INSERT INTO `artist` VALUES ('1622072224999', '刘逸云 Amber Liu', '刘逸云（Amber），1992年9月18日在美国加利福尼亚州洛杉矶市出生，美籍华裔女歌手、主持人，韩国女子演唱组合f(x)成员之一。\n2007年，刘逸云参加韩国SM娱乐有限公司在美国橘郡地区的选秀被发掘。2008年，赴韩国开始练习生生涯。2009年9月5日，以演唱组合f(x)成员身份正式出道', 'http://localhost:8200/artist/avatar?id=1622072224999', '1621601416660', '1634364722942');
INSERT INTO `artist` VALUES ('1622072283515', '金泫雅', '金泫雅（김현아 /Kim Hyun A），1992年6月6日出生于韩国首尔，韩国女歌手、主持人、舞者，前女子组合4Minute、Wonder Girls成员。2007年，金泫雅以演唱组合Wonder Girls出道，其后因身体问题退出组合被迫休养。2009年重返演艺圈，以4Minute组合再次出道。2010年1月，发行个人首张单曲《Change》，掀起骨盆舞模仿热潮', 'http://localhost:8200/artist/avatar?id=1622072283515', '1621601416660', '1634364722942');
INSERT INTO `artist` VALUES ('1622072451745', '泰勒·斯威夫特', '泰勒·斯威夫特（Taylor Swift），1989年12月13日出生于美国宾夕法尼亚州，美国女歌手、词曲作者、音乐制作人、演员。2006年，发行个人首张音乐专辑《Taylor Swift》，该专辑获得美国唱片业协会认证5倍白金唱片销量。2008年，发行音乐专辑《Fearless》，该专辑在美国公告牌专辑榜上获11周冠军，认证7倍白金唱片销量，并获得第52届格莱美奖年度专辑奖。', 'http://localhost:8200/artist/avatar?id=1622072451745', '1621601405696', '1634364722942');
INSERT INTO `artist` VALUES ('1622072527875', '查理·普斯', '查理·普斯（Charlie Puth），1991年12月2日出生于美国新泽西州，美国流行乐男歌手。\n2011年，查理·普斯将翻唱的歌曲上传至Youtube，由此获得了上百万的点击量', 'http://localhost:8200/artist/avatar?id=1622072527875', '1621601405696', '1634364697494');
INSERT INTO `artist` VALUES ('1622072591532', '比莉·艾利什', '比莉·艾利什（Billie Eilish），2001年12月18日出生于美国加利福尼亚州洛杉矶，美国女歌手、词曲作者、模特。\n2015年，她在网上发布了个人首支单曲《Ocean Eyes》，并因该曲受到了关注', 'http://localhost:8200/artist/avatar?id=1622072591532', '1621601405696', '1634364722942');
INSERT INTO `artist` VALUES ('1622072666625', '特洛耶·希文', '特洛耶·希文（Troye Sivan），1995年6月5日出生于南非共和国约翰内斯堡，澳大利亚流行乐男歌手、演员。2007年，在YouTube平台翻唱歌曲《Tell Me Why》，获得大众的关注。2008年，在电影《X战警前传：金刚狼》中出演少年时期的“金刚狼”詹姆斯·豪利特。2011年，凭借电影《马铃薯》提名南非电影电视奖电影长片类最佳男主角奖', 'http://localhost:8200/artist/avatar?id=1622072666625', '1621601405696', '1634364697494');
INSERT INTO `artist` VALUES ('1622072727506', '蕾哈娜', '蕾哈娜（Rihanna），全名罗比恩·蕾哈娜·芬缇（Robyn Rihanna Fenty） ，1988年2月20日出生于巴巴多斯圣迈克尔区，在美国发展的巴巴多斯籍女歌手、演员、模特。\n2005年8月发行首张音乐专辑《Music of the Sun》开始歌唱事业生涯', 'http://localhost:8200/artist/avatar?id=1622072727506', '1621601405696', '1634364722942');
INSERT INTO `artist` VALUES ('1622072806610', '李荣浩', '李荣浩（Ronghao Li），1985年7月11日出生于安徽省蚌埠市，中国内地流行乐男歌手、音乐人、演员。2010年，发行个人首张音乐EP《小黄》。2013年，发行个人首张音乐专辑《模特》，凭该专辑成为首位获得台湾金曲奖“最佳新人奖”的中国大陆歌手。2014年，发行同名音乐专辑《李荣浩》，凭该专辑获得中国TOP排行榜\"年度内地最佳男歌手奖\"。', 'http://localhost:8200/artist/avatar?id=1622072806610', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1622072906015', 'G.E.M.邓紫棋', '邓紫棋（G.E.M.），本名邓诗颖，1991年8月16日出生于上海市，中国香港流行乐女歌手、词曲作者、音乐制作人。2008年，发行个人首张音乐EP《G.E.M.》，凭该EP获得香港叱咤乐坛流行榜“叱咤乐坛生力军女歌手（金奖）”。2009年，发行个人首张音乐专辑《18...》。2011年，成为首位登上香港体育馆开唱的90后华语女歌手。', 'http://localhost:8200/artist/avatar?id=1622072906015', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1622072970585', '张杰', '张杰（Jason Zhang），1982年12月20日出生于四川省成都市，中国流行男歌手。2004年参加歌唱类选秀《我型我秀》，获得全国总冠军并出道。2007年参加歌唱类选秀《快乐男声》，获得总决赛第四名；随后发行的EP《最美的太阳》拿下亚马逊年度唱片销量冠军。2008年发行专辑《明天过后》，凭借该专辑获得北京流行音乐典礼11项提名。2010年发行专辑《这，就是爱》', 'http://localhost:8200/artist/avatar?id=1622072970585', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1622073100454', '白智英', '白智英，1976年3月25日出生于韩国首尔，韩国女歌手、主持人。毕业于百济艺术大学演艺广播系。\n1999年5月，推出第1张专辑《选择》正式出道，凭借该专辑获得了SBS新人歌手TECHNO奖 。2000年4月18日，发行了第2张专辑《ROUGE》，该专辑销量达70万张', 'http://localhost:8200/artist/avatar?id=1622073100454', '1621601416660', '1634364722942');
INSERT INTO `artist` VALUES ('1622073214726', '太阳', 'TAEYANG（东永裴、동영배），1988年5月18日出生于韩国京畿道议政府市，韩国流行乐男歌手，男子演唱组合BIGBANG的成员。\n2006年以演唱组合BIGBANG成员身份正式出道。2008年首次发行个人首张迷你专辑《Hot》，在韩国同时荣获了最佳音乐及最佳专辑奖。2010年发行个人首张第正规专辑《Solar》，获得2010 Mnet亚洲音乐大奖最佳男歌手奖。2014年6月发行第二张正规专辑《RISE》；同年8月在日本大阪开展首次日本个人巡演会。2017年，发行个人专辑《WHITE NIGHT》。\n2018年2月3日，和闵孝琳举行婚礼', 'http://localhost:8200/artist/avatar?id=1622073214726', '1621601416660', '1634364697494');
INSERT INTO `artist` VALUES ('1623328403156', '杜阿·利帕', '1995年8月22日出生于英国伦敦，阿尔巴尼亚裔英国女歌手、词曲作者、模特', 'http://localhost:8200/artist/avatar?id=1623328403156', '1621601405696', '1634364722942');
INSERT INTO `artist` VALUES ('1624545638880', '赵雷', '赵雷，1986年7月20日出生于北京市，中国内地民谣男歌手、词曲创作者。\n2009年，推出个人民谣单曲《北京的冬天》', 'http://localhost:8200/artist/avatar?id=1624545638880', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1624547670156', '周深', '  周深，1992年9月29日出生于湖南邵阳，长于贵州贵阳，中国内地男歌手，2016年6月毕业于乌克兰利沃夫国立立谢科音乐科学院美声专业。2014年参加浙江卫视《中国好声音》第三季初次登场', 'http://localhost:8200/artist/avatar?id=1624547670156', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1624549103554', 'Beyond', 'Beyond，中国香港摇滚乐队，成立于1983年，由黄家驹、黄贯中、黄家强、叶世荣组成。\n1983年参加“山叶吉他比赛”获得冠军并正式出道', 'http://localhost:8200/artist/avatar?id=1624549103554', '1621601398049', '1634364732887');
INSERT INTO `artist` VALUES ('1625405303096', 'EXO', 'EXO，韩国男子流行演唱组合，现以金珉锡、金俊勉、张艺兴、边伯贤、金钟大、朴灿烈、都敬秀、金钟仁、吴世勋9名成员的形式展开活动。2012年4月8日以12人组形式推出首张迷你专辑《MAMA》正式出道', 'http://localhost:8200/artist/avatar?id=1625405303096', '1621601416660', '1634364732887');
INSERT INTO `artist` VALUES ('1626233168015', '徐怀钰', '徐怀钰（Yuki Hsu），1978年3月3日出生于台湾省台北市，华语流行乐女歌手、影视演员、主持人，毕业于育达商职会计科。1998年，推出首张个人EP专辑《飞起来》，从而正式出道；同年，推出首张个人同名专辑《徐怀钰》，最终销量突破100万张；10月，推出第2张个人音乐专辑《向前冲》。1999年，推出第3张个人音乐专辑《天使》。2000年，推出第4张个人音乐专辑《LOVE》；', 'http://localhost:8200/artist/avatar?id=1626233168015', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1626234023583', 'black pink', 'BLACKPINK（블랙핑크）是YG Entertainment于2016年8月8日推出的韩国女子演唱组合，由金智秀（JISOO）、金智妮（JENNIE）、朴彩英（ROSÉ）、LISA四名成员组成。组合名“BLACKPINK”在看起来很美的粉色中稍微加入了否定的意义，旨在传达出“不要只看漂亮的部分”、“看到的并不是全部”的意思。2016年8月8日，发行首张单曲专辑《SQUARE ONE》并正式出道', 'http://localhost:8200/artist/avatar?id=1626234023583', '1621601416660', '1634364732887');
INSERT INTO `artist` VALUES ('1626360481630', 'm.o.v.e', '主唱yuri冷冽不刺耳的高音，motsu个性十足的高速RAP，加上木村贵志高密度的电子节奏，造就出足以挑战光速的“M.O.V.E.”式电子音乐。\n隶属于日本AVEX唱片公司。曾为动画头文字D的第一，二，三，四部配唱过片头，片尾和插曲。同时也给其他动画，游戏配唱过插曲。\nMOVE的曲风非常的多样化，容合了多种音乐元素，如RAP，电子，摇滚等。他们的作品多数充满激情与动感，不由的让人想跟其一起舞动，特别是Motsu的高转速说唱，更是现代人追求的节奏~~像Dogfight，Gamble g rumble。当然也有抒情的歌曲，如Lookin\'On The Sunny Side，It\'s only love，past days等。', 'http://localhost:8200/artist/avatar?id=1626360481630', '1621601411103', '1634364732887');
INSERT INTO `artist` VALUES ('1633918820863', '孙燕姿', '孙燕姿（Stefanie Sun），1978年7月23日出生于新加坡，祖籍中国广东省潮州市，华语流行乐女歌手，毕业于南洋理工大学。\n2000年签约华纳唱片公司；同年6月9日发行首张专辑《孙燕姿同名专辑》在中国台湾地区出道，并以专辑中的歌曲《天黑黑》成名，获得第12届金曲奖最佳新人奖   ；同年12月发行的第二张专辑《我要的幸福》入围第12届台湾金曲奖最佳女演唱人。2003年初成立个人音乐公司“Make Music”；同年8月发行第七张专辑《The Moment》。2005年凭借专辑《Stefanie》获得第16届台湾金曲奖最佳国语女演唱人奖  ；同年5月获得MTV日本音乐录像带大奖最佳大中华艺人奖  。2006年4月，凭借第九张专辑《完美的一天》获得音乐风云榜港台地区最佳女歌手奖、最受欢迎女歌手奖等奖项   。2007年，发行专辑《逆光》 [94]  。2008年7月，凭借歌曲《逆光》获得第六届中国金唱片奖音乐录影带奖；同年8月获得2008MTV亚洲大奖新加坡地区最受欢迎歌手奖  。', 'http://localhost:8200/artist/avatar?id=1633918820863', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1633945997178', '张韶涵', '张韶涵（Angela Zhang），1982年1月19日出生于中国台湾省桃园市中坜区，拥有四分之一维吾尔族血统 ，华语流行乐女歌手、影视演员，毕业于加拿大温斯顿爵士邱吉尔中等学校。\n2001年，出演个人首部电视剧《永不言弃》，从而正式进入演艺圈   。2003年，在爱情励志偶像剧《海豚湾恋人》中饰演女主角易天边   。2004年，推出首张个人音乐专辑《Over The Rainbow》  。2005年，凭借专辑《欧若拉》入围第16届台湾金曲奖最佳国语女演唱人  ；同年，出演个人首部电影《短信一月追》  。2006年，推出第3张个人音乐专辑《潘朵拉》  ；同年，凭借电视剧《爱杀17》入围第41届台湾电视金钟奖戏剧节目最佳女主角  。2007年，相继推出个人音乐专辑《梦里花》  、《Ang 5.0》  ，并获得新加坡金曲奖最佳演绎女歌手奖、年度全方位艺人奖等多个奖项 。2008年，凭借电视剧《公主小妹》获得第43届台湾电视金钟奖戏剧节目女主角提名  。2009年，推出第6张个人音乐专辑《第5季》  。', 'http://localhost:8200/artist/avatar?id=1633945997178', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1633946433290', '陈慧娴', '陈慧娴（Priscilla Chan），1965年7月28日出生于香港，中国香港女歌手。\n1984年凭借歌曲《逝去的诺言》出道；同年获得十大中文金曲最有前途新人奖  。1985年因演唱歌曲《花店》而在香港歌坛受到关注。1986年演唱的歌曲《跳舞街》获得十大劲歌金曲最受欢迎Disco歌曲奖  。1988年发行粤语专辑《秋色》，专辑中的歌曲《人生何处不相逢》成为其歌唱生涯的代表作品之一  。1989年推出粤语专辑《永远是你的朋友》，其中主打歌《千千阙歌》在华语地区获得关注，并获得十大中文金曲奖以及十大劲歌金曲奖，同年宣布告别乐坛   。\n1992年发行的粤语专辑《归来吧》取得四白金销量成绩，专辑中的歌曲《红茶馆》获得香港电台十大中文金曲奖   。1995年正式回归乐坛，并发行专辑《Welcome back》。1996年在香港红磡体育馆举行10场“雪映美白演唱会”。2000年在推出专辑《为你好》后淡出歌坛。2003年重返歌坛并签约环球唱片公司。2004年宣布退出歌坛   。2008年获得9+2音乐先锋榜乐坛贡献奖   。2010年复出歌坛并发行国语单曲《雪飞花》 。2015年发行粤语专辑《Evolve》。2016年在香港红磡体育馆举行“陈慧娴Priscilla-ism演唱会”。2019年11月24日在海口举行陈慧娴Priscilla-ism中国巡回演唱会 。', 'http://localhost:8200/artist/avatar?id=1633946433290', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1634361905977', '逃跑计划', '逃跑计划乐队（Escape Plan），中国内地流行摇滚乐队，由毛川、马晓东、刚昂、红桃组成   。\n逃跑计划乐队的前身是孔雀乐队，成立于2004年底，直到2007年夏天贝司手小刚的加入，乐队得以正式确立，并且乐队的音乐风格较之前也有所改变，以Indie pop（独立流行）为主，其间也融入了New wave（新浪潮）；Post punk（后朋） 等新音乐形式的元素', 'http://localhost:8200/artist/avatar?id=1634361905977', '1621601398049', '1634364732887');
INSERT INTO `artist` VALUES ('1634457523564', '房东的猫', '房东的猫，中国内地女子双人唱作二人组合，由吉他手吴佩岭和主唱王心怡组成。2013年，房东的猫正式成立。2015年，在网易云音乐发表第一首原创单曲《秋酿》获得了一定的关注度；同年，在网络上发布了翻唱宋冬野的歌曲《斑马斑马》。2017年，推出组合首张同名专辑《房东的猫》；同年，为动漫番剧《我是江小白》演唱片尾曲《云烟成雨》', 'http://localhost:8200/artist/avatar?id=1634457523564', '1621601398049', '1634364732887');
INSERT INTO `artist` VALUES ('1634457674287', '滨崎步', '滨崎步（Hamasaki Ayumi），1978年10月2日出生于日本福冈县福冈市早良区，日本女歌手、词曲作者、演员、模特、主持人   。\n1993年，首次出演电视剧《双胞胎教师》 。1995年，主演青春爱情类电影《流砂幻爱》  。1998年，在所属公司爱贝克思的社长松浦胜人的提拔下展开歌唱演艺，发行首张单曲《poker face》正式出道  。1999年，发行首张原创专辑《A Song for ××》和第二张原创专辑《LOVEppears》，成为首位销量突破百万张的新人女歌手 [5]  。2000年，发行第三张原创专辑《Duty》  ，并创下同时取得公信榜三部门冠军纪录   。2001年，发行首张精选专辑《A BEST》，首周售出287万张  。2002年，发行第四张原创专辑《I am...》  ，单曲《H》获得该年度单曲销量冠军 。2003年，发行首张迷你专辑《Memorial address》，成为首位以迷你专突破百万张的歌手   。在2001年至2003年间，滨崎步凭借单曲《Dearest》《Voyage》《No way to say》连续三年斩获日本唱片大奖', 'http://localhost:8200/artist/avatar?id=1634457674287', '1621601411103', '1634364722942');
INSERT INTO `artist` VALUES ('1634457797551', 'YUI', 'YUI，本名吉冈唯，1987年3月26日出生于日本福冈县福冈市，日本创作型女歌手、演员，乐队FLOWER FLOWER主唱。\n日本才女歌手YUI，凭借《太阳之歌》火速成名。从小就梦想成为歌手，中学三年级的时候开始在笔记本上写诗。 进入高中，她决心成为歌手，并在街边演唱，当地的音乐学校听了LIFE的录音后，邀请她加入。 YUI选择离开高校，而去音乐学校学习吉他演奏和作曲 并且在2004年3月，YUI参加了Sony Music举办的SD选拔赛。在自家的蒲团上练习吉他，开始尝试作曲，处女作为《Why me》。2013年4月3日，正式宣告结成日本男女4人组乐队FLOWER FLOWER。', 'http://localhost:8200/artist/avatar?id=1634457797551', '1621601411103', '1634364722942');
INSERT INTO `artist` VALUES ('1634530730835', '花粥', '风格：民谣 / 独立 / 小清新\n现居：湖南 长沙\n生日：7-21\n星座：巨蟹座\n唱片公司：北京博生兄弟文化传播有限公司 \n高中：乌鲁木齐高级中学\n大学：中南林业科技大学\n大学专业：机电工程学院\n2012年独自异军突起的“清新”派民谣歌手，来自新疆，就读于长沙某高校的普通大学生。\n在同学们着迷流行音乐，花枝招展的勾搭小伙子时，花粥已经抱着一把杂牌吉他创造了中国民谣歌手的诸多新纪录。', 'http://localhost:8200/artist/avatar?id=1634530730835', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1634530851226', '程响', '1989年3月26日出生于安徽淮南 ，中国内地女歌手，金翼龙唱片旗下艺人。凭借歌曲《不再联系》和《新娘不是我》迅速蹿红，发行单曲《世界这么大还是遇见你》该曲上线后热度持续上涨，先后拿下酷狗TOP500榜单22期冠军，并蝉联由你音乐榜2020第4、5期的冠军，获得了2020腾讯音乐娱乐盛典十大热歌   。参加2020亚洲音乐盛典，获得年度热门单曲奖', 'http://localhost:8200/artist/avatar?id=1634530851226', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1634531008629', '黄霄雲', '1998年12月22日出生于贵州省黔南布依族苗族自治州，中国内地流行乐女歌手、影视演员，就读于中央音乐学院。', 'http://localhost:8200/artist/avatar?id=1634531008629', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1635337356115', '郭富城', 'TVB劲歌总选最受欢迎男歌手3次\n联合国儿童基金会香港委员大使\n香港十大杰出青年\n乐坛“四大天王”之一\n香港舞蹈联盟授予香港舞蹈家年奖\n劲歌金曲王中王\n第42届台湾电影金马奖最佳男主角\n第43届台湾电影金马奖最佳男主角\n第08届长春国际电影节最佳男主角\n唯一以个人名字命名的郭富城头\n吉尼斯世界纪录450°旋转舞台\n世界坚毅精神奖\n世界杰出艺人奖', 'http://localhost:8200/artist/avatar?id=1635337356115', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1635339003293', ' 倉木麻衣 ', '在小学高年级时看了麦可·杰克森所主演的电影开始，到后来看惠特妮·休斯顿的MV、LIVE，感到“我也想成为这样的歌手”，于是对西洋音乐产生极大的兴趣。\n当时仓木正在练习钢琴，隐隐约约对于音乐事业也有了初步的考虑。在钢琴课中，一边看着音符一边哼唱着歌曲时，被钢琴课老师听到，老师说“与钢琴相比，你还是向歌唱方面发展吧”，以这句话为契机，仓木开始第一次考虑开始自己的歌唱事业。\n在成为中学生之后，仓木开始接触洋乐，特别是女性歌手的作品。而最早接触的洋乐作品，则是Michael Jackson的音乐录影带。之后Mariah Carey（玛丽亚·凯莉）、Whitney Houston（惠特妮·休斯顿）、Lauryn Hill（劳伦·希尔）的作品相继接触，从此开始认真考虑成为像她们那样的歌手。\n此时，与BEING的长户大幸相识。长户在听过仓木的demo tape之后，建议仓木在成为高中生之后正式出道，而在此之前，则要加强英语学习以及积累其他各方面的经验。在成为高中生之后，由长户介绍，与GIZA studio的工作人员相识，在试听过翻唱至Lauryn Hill的《To Zion》之后（此后有在FC EVENT展示），决定正式出道。', 'http://localhost:8200/artist/avatar?id=1635339003293', '1621601411103', '1634364722942');
INSERT INTO `artist` VALUES ('1635341469729', ' 买辣椒也用券 ', '买辣椒也用券，网络歌手。 代表作：《起风了》  、《闻舟》 、《我怀疑你曾来过》 、《极昼青春》', 'http://localhost:8200/artist/avatar?id=1635341469729', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1635341560361', '汪苏泷', '【专辑】\n1.《慢慢懂》（2010年11月19日）\n2.《万有引力》（2012年7月16日）\n3.《传世乐章》（2014年6月26日）\n4.《登陆计划》（2015年10月12日）\n5.《莱芙》（2017年4月28日）\n6.《克制凶猛》（2018年9月14日）\n7.《过去现在时》（2019年10月28日）\n【OST作品】\n1.《年轮》（电视剧《花千骨》主题曲）\n2.《如果时光倒流》（电视剧《最佳前男友》片尾曲）\n3.《严小姐》《幸福加油》（电视剧《妈妈像花儿一样》插曲）\n4.《得不到的温柔》（网剧《诡案》片尾曲）\n5.《灵主不悔》（手游暨动漫《画江湖之灵主》主题曲）\n6.《心跳》《π之歌》（电影《女汉子真爱公式》主题曲、片尾曲）\n7.《想爱不能爱》（网剧《重生之名流巨星》插曲）\n8.《还给你一些孤单》（电视剧《我是杜拉拉》插曲）\n9.《I Believe2》（电影《我的新野蛮女友》主题曲）\n10.《一笑倾城》（电视剧《微微一笑很倾城》片头曲）\n11.创作《微微一笑很倾城》（电视剧《微微一笑很倾城》片尾曲）\n12.《爱让我勇敢》（电视剧《胭脂》插曲）', 'http://localhost:8200/artist/avatar?id=1635341560361', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1635341685282', 'Lady Gaga', 'Lady Gaga（本名：Stefani Joanne Angelina Germanotta， 艺名：Lady Gaga，中国大陆译为嘎嘎小姐或蕾蒂嘎嘎，台湾译为女神卡卡；1986年3月28日－）是一名美国歌手、音乐创作人、企业家及时尚设计师。于纽约市出生与成长，Gaga曾经在圣心修道院进修高中并且曾在纽约大学艺术学院就读，于后中途辍学，将生活重心转移到音乐事业。Gaga的演艺事业最早开始于在曼哈顿下东城的摇滚乐祭表演，并且在2007年底前与Streamline唱片公司签下一纸合约。在Gaga于唱片公司作为一名词作家的同时，她出色的声音表现吸引了艺人Akon的注意，事后Akon将其签下到自己的唱片公司Kon Live Distribution。Lady Gaga是左撇子。', 'http://localhost:8200/artist/avatar?id=1635341685282', '1621601405696', '1634364722942');
INSERT INTO `artist` VALUES ('1635506130337', 'majiko', 'majiko(まじ娘)，日本创作型女歌手。1992年10月28日出生于东京。 母亲是声乐老师同时也是歌手，まじ娘从小就在一个充满流行乐，摇滚乐，间或民俗乐的音乐氛围中成长。在中学学校轻音部解散前，她一直担任其主唱兼鼓手，在各种庆典和音乐节上表演。那时的她已经全身心投入于音乐之中。', 'http://localhost:8200/artist/avatar?id=1635506130337', '1621601411103', '1634364722942');
INSERT INTO `artist` VALUES ('1635506538320', '张学友', '张学友（Jacky Cheung），1961年7月10日出生于香港，中国香港流行乐男歌手、影视演员、作曲人，毕业于香港崇文英文书院。\n1984年，因获得首届香港十八区业余歌唱大赛冠军而出道   。1985年，发行个人首张专辑《Smile》。1986年，凭借歌曲《遥远的她》在香港乐坛获得关注', 'http://localhost:8200/artist/avatar?id=1635506538320', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1635507073391', '周杰伦', '周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，祖籍福建省泉州市永春县，中国台湾流行乐男歌手、音乐人、演员、导演、编剧，毕业于淡江中学。\n2000年发行首张个人专辑《Jay》。2001年发行的专辑《范特西》奠定其融合中西方音乐的风格', 'http://localhost:8200/artist/avatar?id=1635507073391', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1635507867580', 'S.H.E', 'S.H.E，中国台湾女子流行演唱组合，由任家萱（Selina）、田馥甄（Hebe）、陈嘉桦（Ella）组成。', 'http://localhost:8200/artist/avatar?id=1635507867580', '1621601398049', '1634364732887');
INSERT INTO `artist` VALUES ('1635681303898', '吴青峰', '吴青峰，1982年8月30日出生于台湾省台北市，华语流行乐男歌手、词曲创作人、策展人，乐团苏打绿、鱼丁糸的主唱，毕业于台湾政治大学中文系、广告系。\n2001年，组建“苏打绿”乐团 [1]  。2005年，随苏打绿推出乐团首张同名专辑《苏打绿》', 'http://localhost:8200/artist/avatar?id=1635681303898', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1643435446634', '范玮琪', '范玮琪（Fan Fan），1976年3月18日出生于美国俄亥俄州，美国籍华语流行乐女歌手、影视演员、主持人。\n1999年，签约福茂唱片，成为旗下签约艺人。2000年，推出首张个人音乐专辑《范范的世界》，从而正式进军歌坛 ', 'http://localhost:8200/artist/avatar?id=1643435446634', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1643453833297', '程佳佳', '程佳佳，中国内地女歌手。\n2020年，程佳佳版本歌曲《我爱你》获得酷狗音乐Top榜单的第一名', 'http://localhost:8200/artist/avatar?id=1643453833297', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1643519541403', '娃娃', '金智娟，艺名娃娃，1964年10月4日出生，1981和朋友组成丘丘合唱团，担任主唱。加盟新格唱片，1982首张专辑就在今夜出版，同名歌曲及《为何梦见他》红遍大街小巷。娃娃从此被列为台湾摇滚女歌手第一人。', 'http://localhost:8200/artist/avatar?id=1643519541403', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1643520057257', 'いきものがかり', '生物股长（いきものがかり），EPIC Records旗下乐团，由吉冈圣恵（主唱）、水野良树（配唱，吉他，队长）二人组成，所属唱片公司为EPIC Records（日本“SONY”唱片旗下厂牌）。原三人组合，原成员山下穗尊在乐队担任吉他（主要为非电子吉他）与口琴。 1999年2月水野与山下结成了音乐组合。两人开始了街头表演的活动。很轻率的就取名为生物股长，同年12月吉冈加入。2003年8月25日独立的第一张地下专辑『诚に僭越ながらファーストアルバムを拵えました…』发售。06年正式出道的三人乐队短短几个月就因为SAKURA这首广告歌而走红。代表作品有《SAKURA》《YELL》《blue Bird》《HANABI》等。', 'http://localhost:8200/artist/avatar?id=1643520057257', '1621601411103', '1634364722942');
INSERT INTO `artist` VALUES ('1643520681562', 'OneRepublic', 'OneRepublic是一支美国流行摇滚乐队，于2002年在科罗拉多州科罗拉多斯普林斯成立，成员包括主唱兼多乐器演奏家瑞恩·泰德、吉他手扎克·菲尔金斯和德鲁·布朗、贝斯手兼大提琴手布伦特·库兹尔、鼓手埃迪·费舍尔和键盘手布赖恩·威利特。 2007 年，OneRepublic 发行了他们的首张专辑《Dreaming Out Loud》。其主打单曲“Apologize”由Timbaland重新混音，在国际上取得巨大成功，在 16 个国家中排名第一，随后获得格莱美奖提名。第二首单曲“ Stop and Stare ”反映了其前身的成功。这张专辑后来被美国唱片业协会(RIAA)认证为白金唱片。乐队的第二张专辑《Waking Up》', 'http://localhost:8200/artist/avatar?id=1643520681562', '1621601405696', '1634364732887');
INSERT INTO `artist` VALUES ('1643938461386', '温奕心', '2020年中国好声音陕西赛区季军，全国百强。华语创作型流行女歌手。代表作有《一路生花》，《疯语言》，《弱冠》等。', 'http://localhost:8200/artist/avatar?id=1643938461386', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1644298601058', '王小帅', '冲鸭王小帅!!冲鸭王小帅!!冲鸭王小帅!!冲鸭王小帅!!冲鸭王小帅!!冲鸭王小帅!!冲鸭王小帅!!', 'http://localhost:8200/artist/avatar?id=1644298601058', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1644375002022', 'Katie Sky', 'Pop singer & songwriter from Bristol, UK.', 'http://localhost:8200/artist/avatar?id=1644375002022', '1621601405696', '1634364722942');
INSERT INTO `artist` VALUES ('1646192401686', '张惠妹', 'w2w2w', 'http://localhost:8200/artist/avatar?id=1646192401686', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1647144073030', '张北北', '张北北，1988年8月8日出生于吉林省白城市 ，毕业于吉林动画学院，中国内地男歌手   、主持人  。\n2012年1月7日，参与录制的节目《大娱乐家》在深圳卫视播出，张北北正式进入演艺圈 。', 'http://localhost:8200/artist/avatar?id=1647144073030', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1647144476077', '陈慧琳', '陈慧琳，香港著名女歌手及演员，1995年加入香港乐坛，并成为大中华区流行乐坛90年代中期仅有的天后级歌手之一她曾推出多张广受乐迷欢迎的专辑，由 1999年尾更带起华语乐坛电音热潮，得到“电音女王”及“广告天后”之称，更被喻为香港乐坛的“最后一个天后”，是公认亚洲最成功的女艺人之一，其杰出成就倍受国际肯定。其中《恋爱情色》《花花宇宙/不得了》《失忆周末/不如跳舞》《大日子/好地方》等歌曲深入民心，计她的个人专辑总销量早已超过一千多万张。', 'http://localhost:8200/artist/avatar?id=1647144476077', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1648208620910', '李琛', '李琛，出生于西安的歌手李琛自幼因患小儿麻痹症致残，只能靠拄双拐走路，1992年曾在全国残疾人歌手大赛上获得一等奖，并转战 北京 寻找自己的音乐梦想。当年以一首《窗外》红遍大江南北，近期全新专辑正在紧锣密鼓录制当中。2012年11月，李琛以“选手”身份亮相《势不可挡》,惹来网友热议。', 'http://localhost:8200/artist/avatar?id=1648208620910', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1648271489040', '王力宏', '王力宏（Wang Leehom），1976年5月17日出生于美国纽约罗切斯特，祖籍中国浙江义乌，华语流行乐男歌手、音乐人、影视演员、导演，拥有威廉姆斯大学和伯克利音乐学院双荣誉博士的学历。 1995年发行个人首张专辑《情敌贝多芬》，从而进入演艺圈。1998年凭借专辑《公转自转》获得关注，并于次年凭借该专辑获得第10届台湾金曲奖最佳国语男演唱人奖、最佳唱片制作人奖。2004年凭借专辑《不可思议》获得第15届台湾金曲奖最佳唱片制作人奖。2005年在专辑《心中的日月》中首创Chinked-out曲风。2006年凭借专辑《盖世英雄》获得第17届台湾金曲奖最佳国语男演唱人奖。2008年被美国网站GOLDSEA评选为“80位美国最有影响力的美籍亚洲人”之一。', 'http://localhost:8200/artist/avatar?id=1648271489040', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1649333771120', 'Carly Rae Jepsen', 'Carly Rae Jepsen（卡莉·蕾·吉普森），1985年11月21日出生于加拿大哥伦比亚省，加拿大女歌手。\n2007年参加“Canadian Idol”选秀节目，并获得了季军。2008年9月，发行了首张专辑《Tug Of War》。2011年9月，发行单曲《Call Me Maybe》；在美国公告牌Hot100单曲榜中九周夺冠，获得了第55届格莱美的年度最佳新人奖提名。2012年，被贾斯汀·比伯签下随后发行第二张专辑《Kiss》。2013年，凭借《Call Me Maybe》获得MTV日本音乐录影带奖最佳新晋艺人音乐录影带奖和第11届华鼎奖全球最受欢迎女歌手奖。2015年3月推出歌曲《I Really Like You》，同年8月21日发行第三张专辑《E·MO·TION》。2016年，参与配音工作的动画电影《了不起的菲丽西》上映。2018年，推出专辑《Dedicated》。2020年，推出圣诞单曲《It\'s Not Christmas Till Somebody Cries》。', 'http://localhost:8200/artist/avatar?id=1649333771120', '1621601405696', '1634364722942');
INSERT INTO `artist` VALUES ('1649335834894', 'Justin Timberlake', '贾斯汀·汀布莱克（Justin Timberlake），1981年1月31日出生于美国田纳西州孟菲斯，美国歌手、音乐制作人、演员、商人、主持人，前男子演唱组合超级男孩成员，伯克利音乐学院音乐博士。\n1993年，参加电视节目《米老鼠俱乐部》，从而进入演艺圈。1995年，加入男子演唱组合超级男孩。期间，他随组合发行了三张录音室专辑。2002年，贾斯汀单飞，并发行了首张个人录音室专辑《Justified》。2004年，第46届格莱美奖揭晓，其专辑《Justified》获得最佳流行专辑，贾斯汀凭借歌曲《Cry Me A River》获得最佳流行男歌手奖。2006年，发行第二张个人录音室专辑《FutureSex/LoveSounds》，该专辑让贾斯汀收获了四项格莱美奖，并诞生了《Sexy Back》《My Love》《What Goes Around...Comes Around》三首公告牌百强单曲榜冠军单曲。之后，转战大银幕，先后主演了《社交网络》《坏老师》《时间规划局》等影片。', 'http://localhost:8200/artist/avatar?id=1649335834894', '1621601405696', '1634364697494');
INSERT INTO `artist` VALUES ('1649336637726', 'Reynard Silva', 'Reynard Silva，美国RNB歌手，别名雷纳德·席尔瓦，21岁仍在上学的reynard silva已经在互联网上闯出名堂。他将自己的生活经历写在歌中，听来很真诚。2007年6月，《Reynard Silva》专辑发行。', 'http://localhost:8200/artist/avatar?id=1649336637726', '1621601405696', '1634364697494');
INSERT INTO `artist` VALUES ('1649982084489', '郁可唯', ' 主要成就:音乐风云榜新人盛典最佳女演唱人 音乐先锋榜内地最受欢迎女歌手 中国娱乐星锐榜最佳女歌手 MusicRadio榜内地年度最佳新人 马来西亚MY Astro海外演绎女歌手 蝉联两届MR榜校园人气女歌手 2011城市之音至尊金榜年度冠军后 百度娱乐沸点内地热门新晋女歌手', 'http://localhost:8200/artist/avatar?id=1649982084489', '1621601398049', '1634364722942');
INSERT INTO `artist` VALUES ('1650533473576', '庾澄庆', '庾澄庆（Harlem Yu），1961年7月28日出生于台湾省台北市大同区，祖籍云南省普洱市墨江哈尼族自治县，中国台湾流行乐男歌手、音乐人、主持人、影视演员。1986年发行个人首张专辑《伤心歌手》。1989年凭借歌曲《让我一次爱个够》获得关注。1990年获得第十二届十大中文金曲最有前途新人奖。1992年在央视春晚演唱歌曲《让我一次爱个够》，发行个人首张英文专辑《哈林音乐电台》。1994年与张小燕联合主持综艺节目《超级星期天》。1995年发行专辑《靠近》。1996年应MTV音乐台邀请，赴英国伦敦录制Unplugged演唱会。2000年凭借《超级星期天》获得第35届金钟奖综艺节目主持人奖。2001年参演电视剧《流星花园》，并演唱主题曲《情非得已》。', 'http://localhost:8200/artist/avatar?id=1650533473576', '1621601398049', '1634364697494');
INSERT INTO `artist` VALUES ('1650786261435', 'Ellie Goulding', 'Ellie Goulding（埃利·古尔丁），1986年12月30日出生于英国赫里福郡，英国女歌手、词曲作者、吉他手。\n2009年9月，发行首张单曲《Under The Sheets》；同年，发行个人首张迷你专辑《An Introduction to Ellie Goulding》。2010年，她被英国广播公司评为“年度之声”，获得第30届全英音乐奖“乐评人选择”奖项；2月，发行首张录音室专辑《Lights》，该专辑发行首周在英国官方专辑榜夺下冠军；10月，发行《Lights》的改版专辑《Bright Lights》，专辑收录曲《Lights》夺下美国公告牌百强单曲榜亚军。', 'http://localhost:8200/artist/avatar?id=1650786261435', '1621601405696', '1634364722942');

-- ----------------------------
-- Table structure for artist_cate
-- ----------------------------
DROP TABLE IF EXISTS `artist_cate`;
CREATE TABLE `artist_cate`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artist_cate
-- ----------------------------
INSERT INTO `artist_cate` VALUES ('1621601398049', '华语');
INSERT INTO `artist_cate` VALUES ('1621601405696', '欧美');
INSERT INTO `artist_cate` VALUES ('1621601411103', '日本');
INSERT INTO `artist_cate` VALUES ('1621601416660', '韩国');

-- ----------------------------
-- Table structure for artist_type
-- ----------------------------
DROP TABLE IF EXISTS `artist_type`;
CREATE TABLE `artist_type`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artist_type
-- ----------------------------
INSERT INTO `artist_type` VALUES ('1634364697494', '男歌手');
INSERT INTO `artist_type` VALUES ('1634364722942', '女歌手');
INSERT INTO `artist_type` VALUES ('1634364732887', '乐队组合');

-- ----------------------------
-- Table structure for artistavatar
-- ----------------------------
DROP TABLE IF EXISTS `artistavatar`;
CREATE TABLE `artistavatar`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `arId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `arId`) USING BTREE,
  INDEX `arId`(`arId`) USING BTREE,
  CONSTRAINT `arId` FOREIGN KEY (`arId`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artistavatar
-- ----------------------------
INSERT INTO `artistavatar` VALUES ('1621602441805', '1621602441778', 'ljj.jpg', 'image/jpeg', './upload/artist/avatar', '1621602441802.jpg', 100539, '2021-09-21 21:07:21', '2022-09-09 08:09:06');
INSERT INTO `artistavatar` VALUES ('1621602559835', '1621602559815', 'esl.jpg', 'image/jpeg', './upload/artist/avatar', '1621602559833.jpg', 133634, '2021-09-05 21:09:19', '2022-09-09 08:09:33');
INSERT INTO `artistavatar` VALUES ('1621602754369', '1621602754351', 'xs.jpg', 'image/jpeg', './upload/artist/avatar', '1621602754368.jpg', 8396, '2021-09-21 21:12:34', '2022-09-09 08:09:36');
INSERT INTO `artistavatar` VALUES ('1621602849714', '1621602849693', 'mby.jpg', 'image/jpeg', './upload/artist/avatar', '1621602849711.jpg', 145819, '2021-09-21 21:14:09', '2022-09-09 08:09:38');
INSERT INTO `artistavatar` VALUES ('1621602969696', '1621602969680', 'jstbb.jpg', 'image/jpeg', './upload/artist/avatar', '1621602969694.jpg', 152954, '2021-09-21 21:16:09', '2022-09-09 08:09:40');
INSERT INTO `artistavatar` VALUES ('1621603346166', '1621603346150', 'alwk.jpg', 'image/jpeg', './upload/artist/avatar', '1621603346165.jpg', 157195, '2021-09-21 21:22:26', '2022-09-09 08:09:42');
INSERT INTO `artistavatar` VALUES ('1621603519618', '1621603519600', 'qzl.jpg', 'image/jpeg', './upload/artist/avatar', '1621603519617.jpg', 13170, '2021-09-21 21:25:19', '2022-09-11 08:09:45');
INSERT INTO `artistavatar` VALUES ('1621603618602', '1621603618588', 'mjxs.jpg', 'image/jpeg', './upload/artist/avatar', '1621603618600.jpg', 167634, '2021-09-21 21:26:58', '2022-09-01 08:09:47');
INSERT INTO `artistavatar` VALUES ('1622071594392', '1622071594359', '初音ミク.jpg', 'image/jpeg', './upload/artist/avatar', '1622071594386.jpg', 120218, '2021-09-27 07:26:34', '2022-09-09 08:09:50');
INSERT INTO `artistavatar` VALUES ('1622071678318', '1622071678302', '星野源.jpg', 'image/jpeg', './upload/artist/avatar', '1622071678317.jpg', 121459, '2021-09-27 07:27:58', '2022-09-09 08:09:52');
INSERT INTO `artistavatar` VALUES ('1622071800616', '1622071800601', '中岛美嘉.jpg', 'image/jpeg', './upload/artist/avatar', '1622071800615.jpg', 99679, '2021-09-27 07:30:00', '2022-09-09 08:09:54');
INSERT INTO `artistavatar` VALUES ('1622071867899', '1622071867884', '和田光司.jpg', 'image/jpeg', './upload/artist/avatar', '1622071867898.jpg', 9380, '2021-09-27 07:31:07', '2022-09-09 08:09:57');
INSERT INTO `artistavatar` VALUES ('1622071929731', '1622071929712', '花泽香菜.jpg', 'image/jpeg', './upload/artist/avatar', '1622071929730.jpg', 15322, '2021-09-27 07:32:09', '2022-09-09 08:10:00');
INSERT INTO `artistavatar` VALUES ('1622072019135', '1622072019119', 'IU.jpg', 'image/jpeg', './upload/artist/avatar', '1622072019134.jpg', 124715, '2021-09-27 07:33:39', '2022-09-09 08:10:01');
INSERT INTO `artistavatar` VALUES ('1622072084841', '1622072084825', '防弹少年团.jpg', 'image/jpeg', './upload/artist/avatar', '1622072084839.jpg', 168486, '2021-09-27 07:34:44', '2022-09-09 08:10:08');
INSERT INTO `artistavatar` VALUES ('1622072142472', '1622072142460', 'BIGBANG.jpg', 'image/jpeg', './upload/artist/avatar', '1622072142471.jpg', 162639, '2021-09-27 07:35:42', '2022-09-09 08:10:11');
INSERT INTO `artistavatar` VALUES ('1622072225015', '1622072224999', '刘逸云 Amber Liu.jpg', 'image/jpeg', './upload/artist/avatar', '1622072225014.jpg', 170146, '2021-09-27 07:37:05', '2022-09-09 08:10:13');
INSERT INTO `artistavatar` VALUES ('1622072283530', '1622072283515', '泫雅.jpg', 'image/jpeg', './upload/artist/avatar', '1622072283529.jpg', 193156, '2021-09-27 07:38:03', '2022-05-09 08:10:16');
INSERT INTO `artistavatar` VALUES ('1622072451761', '1622072451745', '泰勒·斯威夫特.jpg', 'image/jpeg', './upload/artist/avatar', '1622072451760.jpg', 147640, '2021-09-27 07:40:51', '2022-05-09 08:10:18');
INSERT INTO `artistavatar` VALUES ('1622072527890', '1622072527875', '查理·普斯.jpg', 'image/jpeg', './upload/artist/avatar', '1622072527888.jpg', 145805, '2021-09-27 07:42:07', '2022-05-09 08:10:22');
INSERT INTO `artistavatar` VALUES ('1622072591546', '1622072591532', '比莉·艾利什.jpg', 'image/jpeg', './upload/artist/avatar', '1622072591545.jpg', 131845, '2021-05-27 07:43:11', '2021-05-27 07:43:11');
INSERT INTO `artistavatar` VALUES ('1622072666638', '1622072666625', '12.jpg', 'image/jpeg', './upload/artist/avatar', '1622072666637.jpg', 171316, '2021-05-27 07:44:26', '2021-09-27 07:44:26');
INSERT INTO `artistavatar` VALUES ('1622072727521', '1622072727506', '蕾哈娜.jpg', 'image/jpeg', './upload/artist/avatar', '1622072727520.jpg', 11686, '2021-05-27 07:45:27', '2021-05-27 07:45:27');
INSERT INTO `artistavatar` VALUES ('1622072806624', '1622072806610', '李荣浩.jpg', 'image/jpeg', './upload/artist/avatar', '1622072806623.jpg', 71121, '2021-05-27 07:46:46', '2021-05-27 07:46:46');
INSERT INTO `artistavatar` VALUES ('1622072906029', '1622072906015', 'G.E.M.邓紫棋.jpg', 'image/jpeg', './upload/artist/avatar', '1622072906028.jpg', 90729, '2021-05-27 07:48:26', '2021-05-27 07:48:26');
INSERT INTO `artistavatar` VALUES ('1622072970599', '1622072970585', '张杰.jpg', 'image/jpeg', './upload/artist/avatar', '1622072970598.jpg', 130027, '2021-05-27 07:49:30', '2021-05-27 07:49:30');
INSERT INTO `artistavatar` VALUES ('1622073100471', '1622073100454', '白智英.jpg', 'image/jpeg', './upload/artist/avatar', '1622073100470.jpg', 81166, '2021-05-27 07:51:40', '2021-05-27 07:51:40');
INSERT INTO `artistavatar` VALUES ('1622073214741', '1622073214726', '太阳.jpg', 'image/jpeg', './upload/artist/avatar', '1622073214740.jpg', 18506, '2021-05-27 07:53:34', '2021-05-27 07:53:34');
INSERT INTO `artistavatar` VALUES ('1623328403186', '1623328403156', 'unnamed.jpg', 'image/jpeg', './upload/artist/avatar', '1623328403184.jpg', 5051, '2021-06-10 20:33:23', '2021-06-10 20:33:23');
INSERT INTO `artistavatar` VALUES ('1624545638905', '1624545638880', '18806046882229308.jpg', 'image/jpeg', './upload/artist/avatar', '1624545638902.jpg', 2507, '2021-06-24 22:40:38', '2021-06-24 22:40:38');
INSERT INTO `artistavatar` VALUES ('1624547670182', '1624547670156', '109951165048009270.jpg', 'image/jpeg', './upload/artist/avatar', '1624547670180.jpg', 33431, '2021-06-24 23:14:30', '2021-06-24 23:14:30');
INSERT INTO `artistavatar` VALUES ('1624549103580', '1624549103554', '109951165566993818.jpg', 'image/jpeg', './upload/artist/avatar', '1624549103578.jpg', 43475, '2021-06-24 23:38:23', '2021-06-24 23:38:23');
INSERT INTO `artistavatar` VALUES ('1625405303114', '1625405303096', '109951166070488196.jpg', 'image/jpeg', './upload/artist/avatar', '1625405303112.jpg', 36879, '2021-07-04 21:28:23', '2021-07-04 21:28:23');
INSERT INTO `artistavatar` VALUES ('1626233168034', '1626233168015', '109951166150582369.jpg', 'image/jpeg', './upload/artist/avatar', '1626233168032.jpg', 68311, '2021-07-14 11:26:08', '2021-07-14 11:26:08');
INSERT INTO `artistavatar` VALUES ('1626234023597', '1626234023583', '109951165958967014.jpg', 'image/jpeg', './upload/artist/avatar', '1626234023596.jpg', 52804, '2021-07-14 11:40:23', '2021-07-14 11:40:23');
INSERT INTO `artistavatar` VALUES ('1626360481650', '1626360481630', '5993437883425996.jpg', 'image/jpeg', './upload/artist/avatar', '1626360481647.jpg', 6684, '2021-07-15 22:48:01', '2021-07-15 22:48:01');
INSERT INTO `artistavatar` VALUES ('1633918820895', '1633918820863', '孙燕姿.jpg', 'image/jpeg', './upload/artist/avatar', '1633918820892.jpg', 61644, '2021-10-11 10:20:20', '2021-10-11 10:20:20');
INSERT INTO `artistavatar` VALUES ('1633945997203', '1633945997178', '张韶涵.jpg', 'image/jpeg', './upload/artist/avatar', '1633945997199.jpg', 59977, '2021-10-11 17:53:17', '2021-10-11 17:53:17');
INSERT INTO `artistavatar` VALUES ('1633946433306', '1633946433290', '109951165621453863.jpg', 'image/jpeg', './upload/artist/avatar', '1633946433304.jpg', 46658, '2021-10-11 18:00:33', '2021-10-11 18:00:33');
INSERT INTO `artistavatar` VALUES ('1634361905999', '1634361905977', '109951165752930430.jpg', 'image/jpeg', './upload/artist/avatar', '1634361905996.jpg', 57030, '2021-10-16 13:25:06', '2021-10-16 13:25:06');
INSERT INTO `artistavatar` VALUES ('1634457523587', '1634457523564', '109951166153729966.jpg', 'image/jpeg', './upload/artist/avatar', '1634457523585.jpg', 3275, '2021-10-17 15:58:43', '2021-10-17 15:58:43');
INSERT INTO `artistavatar` VALUES ('1634457674304', '1634457674287', '109951166114417569.jpg', 'image/jpeg', './upload/artist/avatar', '1634457674302.jpg', 80149, '2021-10-17 16:01:14', '2021-10-17 16:01:14');
INSERT INTO `artistavatar` VALUES ('1634457797569', '1634457797551', '109951165708950765.jpg', 'image/jpeg', './upload/artist/avatar', '1634457797567.jpg', 67875, '2021-10-17 16:03:17', '2021-10-17 16:03:17');
INSERT INTO `artistavatar` VALUES ('1634530730859', '1634530730835', '109951162845812387.jpg', 'image/jpeg', './upload/artist/avatar', '1634530730854.jpg', 77356, '2021-10-18 12:18:50', '2021-10-18 12:18:50');
INSERT INTO `artistavatar` VALUES ('1634530851240', '1634530851226', '109951165134947137.jpg', 'image/jpeg', './upload/artist/avatar', '1634530851239.jpg', 5124, '2021-10-18 12:20:51', '2021-10-18 12:20:51');
INSERT INTO `artistavatar` VALUES ('1634531008643', '1634531008629', '109951164935181925.jpg', 'image/jpeg', './upload/artist/avatar', '1634531008641.jpg', 61973, '2021-10-18 12:23:28', '2021-10-18 12:23:28');
INSERT INTO `artistavatar` VALUES ('1635337356145', '1635337356115', '255086697661214.jpg', 'image/jpeg', './upload/artist/avatar', '1635337356140.jpg', 50780, '2021-10-27 20:22:36', '2021-10-27 20:22:36');
INSERT INTO `artistavatar` VALUES ('1635339003309', '1635339003293', '109951166026826057.jpg', 'image/jpeg', './upload/artist/avatar', '1635339003307.jpg', 75219, '2021-10-27 20:50:03', '2021-10-27 20:50:03');
INSERT INTO `artistavatar` VALUES ('1635341469753', '1635341469729', '109951164344452750.jpg', 'image/jpeg', './upload/artist/avatar', '1635341469751.jpg', 8846, '2021-10-27 21:31:09', '2021-10-27 21:31:09');
INSERT INTO `artistavatar` VALUES ('1635341560378', '1635341560361', '109951163511967669.jpg', 'image/jpeg', './upload/artist/avatar', '1635341560377.jpg', 4144, '2021-10-27 21:32:40', '2021-10-27 21:32:40');
INSERT INTO `artistavatar` VALUES ('1635341685296', '1635341685282', '109951164748530879.jpg', 'image/jpeg', './upload/artist/avatar', '1635341685294.jpg', 80037, '2021-10-27 21:34:45', '2021-10-27 21:34:45');
INSERT INTO `artistavatar` VALUES ('1635506130358', '1635506130337', '109951166289563874.jpg', 'image/jpeg', './upload/artist/avatar', '1635506130355.jpg', 53874, '2021-10-29 19:15:30', '2021-10-29 19:15:30');
INSERT INTO `artistavatar` VALUES ('1635506538340', '1635506538320', '109951165566563000.jpg', 'image/jpeg', './upload/artist/avatar', '1635506538338.jpg', 53719, '2021-10-29 19:22:18', '2021-10-29 19:22:18');
INSERT INTO `artistavatar` VALUES ('1635507073407', '1635507073391', '109951165793869641.jpg', 'image/jpeg', './upload/artist/avatar', '1635507073406.jpg', 52152, '2021-10-29 19:31:13', '2021-10-29 19:31:13');
INSERT INTO `artistavatar` VALUES ('1635507867596', '1635507867580', '109951165791906794.jpg', 'image/jpeg', './upload/artist/avatar', '1635507867595.jpg', 59030, '2021-10-29 19:44:27', '2021-10-29 19:44:27');
INSERT INTO `artistavatar` VALUES ('1635681303914', '1635681303898', '109951163892255024.jpg', 'image/jpeg', './upload/artist/avatar', '1635681303912.jpg', 60645, '2021-10-31 19:55:03', '2021-10-31 19:55:03');
INSERT INTO `artistavatar` VALUES ('1643435446675', '1643435446634', '109951163922525995.jpg', 'image/jpeg', './upload/artist/avatar', '1643435446672.jpg', 70407, '2022-01-29 13:50:46', '2022-01-29 13:50:46');
INSERT INTO `artistavatar` VALUES ('1643453833347', '1643453833297', '109951166067990508.jpg', 'image/jpeg', './upload/artist/avatar', '1643453833342.jpg', 57778, '2022-01-29 18:57:13', '2022-01-29 18:57:13');
INSERT INTO `artistavatar` VALUES ('1643519541420', '1643519541403', '5773535557642877.jpg', 'image/jpeg', './upload/artist/avatar', '1643519541419.jpg', 3617, '2022-01-30 13:12:21', '2022-01-30 13:12:21');
INSERT INTO `artistavatar` VALUES ('1643520057273', '1643520057257', '109951166541146743.jpg', 'image/jpeg', './upload/artist/avatar', '1643520057271.jpg', 67318, '2022-01-30 13:20:57', '2022-01-30 13:20:57');
INSERT INTO `artistavatar` VALUES ('1643520681575', '1643520681562', '109951166632543022.jpg', 'image/jpeg', './upload/artist/avatar', '1643520681574.jpg', 68525, '2022-01-30 13:31:21', '2022-01-30 13:31:21');
INSERT INTO `artistavatar` VALUES ('1643938461402', '1643938461386', '109951163031026180.jpg', 'image/jpeg', './upload/artist/avatar', '1643938461401.jpg', 7722, '2022-02-04 09:34:21', '2022-02-04 09:34:21');
INSERT INTO `artistavatar` VALUES ('1644298601077', '1644298601058', '109951163470584971.jpg', 'image/jpeg', './upload/artist/avatar', '1644298601075.jpg', 7412, '2022-02-08 13:36:41', '2022-02-08 13:36:41');
INSERT INTO `artistavatar` VALUES ('1644375002040', '1644375002022', '5883486720550337.jpg', 'image/jpeg', './upload/artist/avatar', '1644375002038.jpg', 5354, '2022-02-09 10:50:02', '2022-02-09 10:50:02');
INSERT INTO `artistavatar` VALUES ('1646192401718', '1646192401686', '109951165588539704.jpg', 'image/jpeg', './upload/artist/avatar', '1646192401713.jpg', 53110, '2022-03-02 11:40:01', '2022-03-02 11:40:01');
INSERT INTO `artistavatar` VALUES ('1647144073068', '1647144073030', '18812643952927424.jpg', 'image/jpeg', './upload/artist/avatar', '1647144073065.jpg', 5725, '2022-03-13 12:01:13', '2022-03-13 12:01:13');
INSERT INTO `artistavatar` VALUES ('1647144476093', '1647144476077', '109951163416117579.jpg', 'image/jpeg', './upload/artist/avatar', '1647144476092.jpg', 3754, '2022-03-13 12:07:56', '2022-03-13 12:07:56');
INSERT INTO `artistavatar` VALUES ('1648208620925', '1648208620910', '109951163377095597.jpg', 'image/jpeg', './upload/artist/avatar', '1648208620924.jpg', 5286, '2022-03-25 19:43:40', '2022-03-25 19:43:40');
INSERT INTO `artistavatar` VALUES ('1648271489058', '1648271489040', '109951165663277602.jpg', 'image/jpeg', './upload/artist/avatar', '1648271489056.jpg', 54017, '2022-03-26 13:11:29', '2022-03-26 13:11:29');
INSERT INTO `artistavatar` VALUES ('1649333771141', '1649333771120', '20200522184108329.jpg', 'image/jpeg', './upload/artist/avatar', '1649333771138.jpg', 15026, '2022-04-07 20:16:11', '2022-04-07 20:16:11');
INSERT INTO `artistavatar` VALUES ('1649335834915', '1649335834894', '20210517172634410.jpg', 'image/jpeg', './upload/artist/avatar', '1649335834913.jpg', 19195, '2022-04-07 20:50:34', '2022-04-07 20:50:34');
INSERT INTO `artistavatar` VALUES ('1649336637742', '1649336637726', '20201126145134642.jpg', 'image/jpeg', './upload/artist/avatar', '1649336637741.jpg', 16623, '2022-04-07 21:03:57', '2022-04-07 21:03:57');
INSERT INTO `artistavatar` VALUES ('1649982084519', '1649982084489', '573617798.jpg', 'image/jpeg', './upload/artist/avatar', '1649982084514.jpg', 9956, '2022-04-15 08:21:24', '2022-04-15 08:21:24');
INSERT INTO `artistavatar` VALUES ('1650533473604', '1650533473576', '20190830112947522.jpg', 'image/jpeg', './upload/artist/avatar', '1650533473597.jpg', 13848, '2022-04-21 17:31:13', '2022-04-21 17:31:13');
INSERT INTO `artistavatar` VALUES ('1650786261456', '1650786261435', '20210721141152324 (1).jpg', 'image/jpeg', './upload/artist/avatar', '1650786261452.jpg', 13701, '2022-04-24 15:44:21', '2022-04-24 15:44:21');

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `userId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES ('1623424836540', '1621553753077', '11.png', 'image/png', './upload/avatar', '1623424836537.png', 8656, '2021-09-01 23:20:36', '2022-05-09 08:12:02');
INSERT INTO `avatar` VALUES ('1623424931079', '1621554155356', '10.png', 'image/png', './upload/avatar', '1623424931076.png', 29398, '2021-09-01 23:22:11', '2022-09-01 08:12:06');
INSERT INTO `avatar` VALUES ('1623425015443', '1621586602550', '10.png', 'image/png', './upload/avatar', '1623425015435.png', 18724, '2021-09-01 23:23:35', '2022-09-01 08:12:11');
INSERT INTO `avatar` VALUES ('1623425095423', '1621586669402', '12.png', 'image/png', './upload/avatar', '1623425095421.png', 7814, '2021-06-11 23:24:55', '2021-06-11 23:24:55');
INSERT INTO `avatar` VALUES ('1623425195069', '1622166913290', '阮籍.png', 'image/png', './upload/avatar', '1623425195067.png', 17378, '2021-06-11 23:26:35', '2021-06-11 23:26:35');
INSERT INTO `avatar` VALUES ('1623425284876', '1622167044223', '33.png', 'image/png', './upload/avatar', '1623425284874.png', 24262, '2021-06-11 23:28:04', '2021-06-11 23:28:04');
INSERT INTO `avatar` VALUES ('1625404371379', '1625404058174', '7c7fea4c7c7cc68a06d396ae03e92648.jpeg', 'image/jpeg', './upload/avatar', '1625404371377.jpeg', 6983, '2021-07-04 21:12:51', '2021-07-04 21:12:51');
INSERT INTO `avatar` VALUES ('1626250666829', '1626248858763', '娜塔莉.png', 'image/png', './upload/avatar', '1626250666825.png', 10693, '2021-07-14 16:17:46', '2021-07-14 16:17:46');
INSERT INTO `avatar` VALUES ('1626254488976', '1626253954965', 'OIP-C.png', 'image/png', './upload/avatar', '1626254488972.png', 6775, '2021-07-14 17:21:28', '2021-07-14 17:21:28');
INSERT INTO `avatar` VALUES ('1626267620614', '1626267479156', '5bc80cfe584e1a6df41bea672c8cd2bd (1).jpeg', 'image/jpeg', './upload/avatar', '1626267620609.jpeg', 44675, '2021-07-14 21:00:20', '2021-07-14 21:00:20');
INSERT INTO `avatar` VALUES ('1626352836133', '1626352819737', 'bb9309c27fb477fb6d46cca5722c773a.jpg', 'image/jpeg', './upload/avatar', '1626352836129.jpg', 11963, '2021-07-15 20:40:36', '2021-07-15 20:40:36');
INSERT INTO `avatar` VALUES ('1635679321262', '1635679207853', '00c30acb57e14e6433d454f31906afbe.jpeg', 'image/jpeg', './upload/avatar', '1635679321259.jpeg', 13835, '2021-10-31 19:22:01', '2021-10-31 19:22:01');
INSERT INTO `avatar` VALUES ('1635685369997', '1635685284424', 'df7333a16411af2be0a8b8c88656c68b.jpeg', 'image/jpeg', './upload/avatar', '1635685369995.jpeg', 18711, '2021-10-31 21:02:49', '2021-10-31 21:02:49');
INSERT INTO `avatar` VALUES ('1640497381976', '1640497296254', 'cddc99d90728e726990400d6a9f916c8.jpeg', 'image/jpeg', './upload/avatar', '1640497381975.jpeg', 30353, '2021-12-26 13:43:01', '2021-12-26 13:43:01');
INSERT INTO `avatar` VALUES ('1640497669195', '1640497617203', 'e4b82233570b300af7ffe80a5a928f71.jpeg', 'image/jpeg', './upload/avatar', '1640497669194.jpeg', 27249, '2021-12-26 13:47:49', '2021-12-26 13:47:49');
INSERT INTO `avatar` VALUES ('1640497993180', '1640497948238', '2165da63fb91c4f9241cb32671afbdb0.jpeg', 'image/jpeg', './upload/avatar', '1640497993179.jpeg', 36834, '2021-12-26 13:53:13', '2021-12-26 13:53:13');
INSERT INTO `avatar` VALUES ('1640498166048', '1640498122016', 'a7d11c2e240ae74abdb979bbc86eebf0.jpeg', 'image/jpeg', './upload/avatar', '1640498166047.jpeg', 23411, '2021-12-26 13:56:06', '2021-12-26 13:56:06');
INSERT INTO `avatar` VALUES ('1640498359896', '1640498317915', '77a25b8978ec4afee301cea6f349a76a.jpeg', 'image/jpeg', './upload/avatar', '1640498359895.jpeg', 39197, '2021-12-26 13:59:19', '2021-12-26 13:59:19');
INSERT INTO `avatar` VALUES ('1640498511575', '1640498470004', '62ca446b8ff354b6dfab25906709ff76.jpeg', 'image/jpeg', './upload/avatar', '1640498511574.jpeg', 33090, '2021-12-26 14:01:51', '2021-12-26 14:01:51');
INSERT INTO `avatar` VALUES ('1640498671190', '1640498622256', '3c37f310f16af45d15c8b1fe85b4401b.jpeg', 'image/jpeg', './upload/avatar', '1640498671189.jpeg', 34829, '2021-12-26 14:04:31', '2021-12-26 14:04:31');
INSERT INTO `avatar` VALUES ('1644202287755', '1644202264813', '0181ce5acbb22da801204029cd3112.jpg@1280w_1l_2o_100sh.jpg', 'image/jpeg', './upload/avatar', '1644202287749.jpg', 597661, '2022-02-07 10:51:27', '2022-02-07 10:51:27');
INSERT INTO `avatar` VALUES ('1645620692796', '1644398546607', 'R-C.png', 'image/png', './upload/avatar', '1645620692787.png', 556559, '2022-02-23 20:51:32', '2022-02-23 20:51:32');
INSERT INTO `avatar` VALUES ('1645620808125', '1645620606883', 'OIP-C.jpg', 'image/jpeg', './upload/avatar', '1645620808124.jpg', 48888, '2022-02-23 20:53:28', '2022-02-23 20:53:28');
INSERT INTO `avatar` VALUES ('1649236368154', '1649236303322', '5283e79efbfef93ee1d7f8b4c7a5b3ac.jpeg', 'image/jpeg', './upload/avatar', '1649236368151.jpeg', 17317, '2022-04-06 17:12:48', '2022-04-06 17:12:48');
INSERT INTO `avatar` VALUES ('1649241807257', '1649241745130', 'a1f4d3cf29a4e339c24d14e25fab55d0.jpeg', 'image/jpeg', './upload/avatar', '1649241807252.jpeg', 68972, '2022-04-06 18:43:27', '2022-04-06 18:43:27');
INSERT INTO `avatar` VALUES ('1650161685951', '1650161308411', '1.jpeg', 'image/jpeg', './upload/avatar', '1650161685949.jpeg', 72126, '2022-04-17 10:14:45', '2022-04-17 10:14:45');
INSERT INTO `avatar` VALUES ('1651654268959', '1651480823572', '1212.jpeg', 'image/jpeg', './upload/avatar', '1651654268956.jpeg', 39383, '2022-05-04 16:51:08', '2022-05-04 16:51:08');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `picUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT 0,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `originalname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `songId`(`songId`) USING BTREE,
  INDEX `vId`(`vId`) USING BTREE,
  INDEX `alId`(`alId`) USING BTREE,
  CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `banner_ibfk_2` FOREIGN KEY (`vId`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `banner_ibfk_3` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1624373995102', 'http://localhost:8200/banner?id=1624373995102', '1624372266021', NULL, NULL, 1, '2021-06-22 22:59:55', '2022-05-15 20:25:08', '米津玄师.svg', 'image/svg+xml', './upload/banner/recommend', '1624374066573.svg', 157298);
INSERT INTO `banner` VALUES ('1624375398644', 'http://localhost:8200/banner?id=1624375398644', '1624375323999', NULL, NULL, 1, '2021-06-22 23:23:18', '2022-05-15 20:25:08', 'Dua Lipa.svg', 'image/svg+xml', './upload/banner/recommend', '1624375430462.svg', 390916);
INSERT INTO `banner` VALUES ('1624540418906', 'http://localhost:8200/banner?id=1624540418906', '1624540295354', NULL, NULL, 1, '2021-06-24 21:13:38', '2022-05-15 20:25:08', 'bst.svg', 'image/svg+xml', './upload/banner/recommend', '1624540459876.svg', 666238);
INSERT INTO `banner` VALUES ('1641374053776', 'http://localhost:8200/banner?id=1641374053776', NULL, '1625055161411', NULL, 3, '2022-01-05 17:14:13', '2022-05-15 20:25:08', '成都.svg', 'image/svg+xml', './upload/banner/recommend', '1641374053794.svg', 572810);
INSERT INTO `banner` VALUES ('1641374724546', 'http://localhost:8200/banner?id=1641374724546', NULL, NULL, '1635506247250', 2, '2022-01-05 17:25:24', '2022-05-15 20:25:08', 'majiko.svg', 'image/svg+xml', './upload/banner/recommend', '1641374724563.svg', 189085);

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `picUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES ('1634003136055', '情感', '2021-10-12 09:45:36', '2021-10-12 09:45:36', 'http://localhost:8200/channel/cover?id=1634003136055', '下载.png', 'image/png', './upload/channel/icon', '1650006647677.png', 2204);
INSERT INTO `channel` VALUES ('1634003146371', '音乐推荐', '2021-10-12 09:45:46', '2021-10-12 09:45:46', 'http://localhost:8200/channel/cover?id=1634003146371', '音乐推荐.png', 'image/png', './upload/channel/icon', '1650006747974.png', 2275);
INSERT INTO `channel` VALUES ('1634003154446', '脱口秀', '2021-10-12 09:45:54', '2021-10-12 09:45:54', 'http://localhost:8200/channel/cover?id=1634003154446', '脱口秀.png', 'image/png', './upload/channel/icon', '1650006780327.png', 3411);
INSERT INTO `channel` VALUES ('1634003162525', '创作翻唱', '2021-10-12 09:46:02', '2021-10-12 09:46:02', 'http://localhost:8200/channel/cover?id=1634003162525', '创作翻唱.png', 'image/png', './upload/channel/icon', '1650006816234.png', 2882);
INSERT INTO `channel` VALUES ('1634003169561', '电影', '2021-10-12 09:46:09', '2021-10-12 09:46:09', 'http://localhost:8200/channel/cover?id=1634003169561', '电音.png', 'image/png', './upload/channel/icon', '1650006846700.png', 3062);
INSERT INTO `channel` VALUES ('1634003177722', '知识', '2021-10-12 09:46:17', '2021-10-12 09:46:17', 'http://localhost:8200/channel/cover?id=1634003177722', '知识.png', 'image/png', './upload/channel/icon', '1650006871675.png', 1756);
INSERT INTO `channel` VALUES ('1634003185367', '二次元', '2021-10-12 09:46:25', '2021-10-12 09:46:25', 'http://localhost:8200/channel/cover?id=1634003185367', '二次元.png', 'image/png', './upload/channel/icon', '1650006899931.png', 2077);
INSERT INTO `channel` VALUES ('1634003195201', '明星专区', '2021-10-12 09:46:35', '2021-10-12 09:46:35', 'http://localhost:8200/channel/cover?id=1634003195201', '明星专区.png', 'image/png', './upload/channel/icon', '1650006925281.png', 2204);
INSERT INTO `channel` VALUES ('1634003202057', '生活', '2021-10-12 09:46:42', '2021-10-12 09:46:42', 'http://localhost:8200/channel/cover?id=1634003202057', '生活.png', 'image/png', './upload/channel/icon', '1650006942372.png', 1257);
INSERT INTO `channel` VALUES ('1634003209410', '新闻资讯', '2021-10-12 09:46:49', '2021-10-12 09:46:49', 'http://localhost:8200/channel/cover?id=1634003209410', '新闻资讯.png', 'image/png', './upload/channel/icon', '1650006969036.png', 968);
INSERT INTO `channel` VALUES ('1634003222816', '人文历史', '2021-10-12 09:47:02', '2021-10-12 09:47:02', 'http://localhost:8200/channel/cover?id=1634003222816', '人文历史.png', 'image/png', './upload/channel/icon', '1650006992034.png', 1096);
INSERT INTO `channel` VALUES ('1634003229341', '娱乐', '2021-10-12 09:47:09', '2021-10-12 09:47:09', 'http://localhost:8200/channel/cover?id=1634003229341', '娱乐.png', 'image/png', './upload/channel/icon', '1650007025893.png', 1784);
INSERT INTO `channel` VALUES ('1634003244200', '相声曲艺', '2021-10-12 09:47:24', '2021-10-12 09:47:24', 'http://localhost:8200/channel/cover?id=1634003244200', '相声曲艺.png', 'image/png', './upload/channel/icon', '1650007043564.png', 1906);

-- ----------------------------
-- Table structure for channel_content
-- ----------------------------
DROP TABLE IF EXISTS `channel_content`;
CREATE TABLE `channel_content`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `coverUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `originalname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cId`(`cId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `channel_content_ibfk_1` FOREIGN KEY (`cId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `channel_content_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel_content
-- ----------------------------
INSERT INTO `channel_content` VALUES ('1634034840512', '1634003136055', '有问题，找一禅', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1634034840512', '平日生活里总有许多的不如意，总会茫然失措，不知如何是好。这时候，就让一禅来替你解惑吧。希望一禅的声音能给你带来一丝温暖与平静！', '2021-10-12 18:34:00', '2021-10-12 18:34:00', '109951163078366907.jpg', 'image/jpeg', './upload/channel/cover', '1634034900057.jpg', 5312);
INSERT INTO `channel_content` VALUES ('1634034964713', '1634003136055', '未闻其声', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1634034964713', '未闻其声，仍能感知你在身边', '2021-10-12 18:36:04', '2021-10-12 18:36:04', '109951163460263530.jpg', 'image/jpeg', './upload/channel/cover', '1634035013147.jpg', 6305);
INSERT INTO `channel_content` VALUES ('1634035103223', '1634003136055', '好姑娘对你说晚安', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1634035103223', '嗨，我是豆花，每晚对你说晚安的那个人公众平台：好姑娘对你说晚安 ', '2021-10-12 18:38:23', '2021-10-12 18:38:23', '6668538023616484.jpg', 'image/jpeg', './upload/channel/cover', '1634035143638.jpg', 5928);
INSERT INTO `channel_content` VALUES ('1634035200089', '1634003136055', '晚安沐语', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1634035200089', '温暖女声每天陪你入眠。', '2021-10-12 18:40:00', '2021-10-12 18:40:00', '109951164645840191.jpg', 'image/jpeg', './upload/channel/cover', '1634035252295.jpg', 69368);
INSERT INTO `channel_content` VALUES ('1634035333656', '1634003136055', '苏乐心灵治愈殿堂', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1634035333656', '在这个有几十亿人的地球上，我们相识相遇相知的概率只有千万分之五，每一次的遇见都是上天的恩赐，感谢你们喜欢苏乐，支持苏乐，即使有一天取关了，也请记得，我们曾经倾心过。', '2021-10-12 18:42:13', '2021-10-12 18:42:13', '109951165879420135.jpg', 'image/jpeg', './upload/channel/cover', '1634035397980.jpg', 58519);
INSERT INTO `channel_content` VALUES ('1634035466519', '1634003136055', '女生异闻录', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1634035466519', '不一样的女性话题 新时代的直男课堂', '2021-10-12 18:44:26', '2021-10-12 18:44:26', '109951163312979172.jpg', 'image/jpeg', './upload/channel/cover', '1634035501121.jpg', 6459);
INSERT INTO `channel_content` VALUES ('1634035609469', '1634003136055', '阿绿酒馆', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1634035609469', '我把过去的日子 都写进了一本书 《万一我们一辈子单身》', '2021-10-12 18:46:49', '2021-10-12 18:46:49', '3401888996478591.jpg', 'image/jpeg', './upload/channel/cover', '1634035626039.jpg', 7594);
INSERT INTO `channel_content` VALUES ('1634035701805', '1634003136055', '晚安，城市', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1634035701805', '夜里有你，每天对你说晚安。', '2021-10-12 18:48:21', '2021-10-12 18:48:21', '109951165648282503.jpg', 'image/jpeg', './upload/channel/cover', '1634035741171.jpg', 19376);
INSERT INTO `channel_content` VALUES ('1634036792314', '1634003146371', '硬地电台', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1634036792314', '硬地原创音乐榜·独家播客企划，邀请音乐人、跨界嘉宾作为客座DJ，与你分享音乐故事，聆听榜单宝藏，发现更多华语原创好音乐！', '2021-10-12 19:06:32', '2021-10-12 19:06:32', '109951166254078956.jpg', 'image/jpeg', './upload/channel/cover', '1634036827878.jpg', 16441);
INSERT INTO `channel_content` VALUES ('1634036907885', '1634003154446', '超好笑艺能力', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1634036907885', '明星也能超好笑，收集明星的脱口秀片段', '2021-10-12 19:08:27', '2021-10-12 19:08:27', '109951165887662552.jpg', 'image/jpeg', './upload/channel/cover', '1634036950366.jpg', 43807);
INSERT INTO `channel_content` VALUES ('1634544095665', '1634003146371', '民谣之声～每天听的歌～', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1634544095665', '全球独立音乐人及乐队的作品赏析\n国内音乐从业者不定期的作品自荐', '2021-10-18 16:01:35', '2021-10-18 16:01:35', '109951165933712260.jpg', 'image/jpeg', './upload/channel/cover', '1634544095681.jpg', 44544);
INSERT INTO `channel_content` VALUES ('1634544145209', '1634003146371', '维维道来', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1634544145209', '嘿，欢迎收听维维道来！\n《维维道来》是一档由刘维主理的音乐脱口秀播客节目。', '2021-10-18 16:02:25', '2021-10-18 16:02:25', '109951165666492923.jpg', 'image/jpeg', './upload/channel/cover', '1634544145223.jpg', 11395);
INSERT INTO `channel_content` VALUES ('1634544196293', '1634003146371', '猫王早班车', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1634544196293', '全新好音乐+浓鸡汤节目，\n用醒神能量歌单，\n给你元气满满的一天！', '2021-10-18 16:03:16', '2021-10-18 16:03:16', '109951163378859013.jpg', 'image/jpeg', './upload/channel/cover', '1634544196307.jpg', 50134);
INSERT INTO `channel_content` VALUES ('1634544368653', '1634003146371', '十二的小电台', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1634544368653', 'by 十二', '2021-10-18 16:06:08', '2021-10-18 16:06:08', '109951163313862960.jpg', 'image/jpeg', './upload/channel/cover', '1634544368666.jpg', 3715);
INSERT INTO `channel_content` VALUES ('1634544465119', '1634003162525', '爱抽烟屁的彦祖', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1634544465119', '嗯哼', '2021-10-18 16:07:45', '2021-10-18 16:07:45', '109951163391639863.jpg', 'image/jpeg', './upload/channel/cover', '1634544465130.jpg', 5478);
INSERT INTO `channel_content` VALUES ('1634544517306', '1634003162525', '顔人中的隔壁小窝', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1634544517306', '住你家隔壁製造噪聲的男孩兒！ 來我的小窩聽我唱歌 ~', '2021-10-18 16:08:37', '2021-10-18 16:08:37', '109951163856499258.jpg', 'image/jpeg', './upload/channel/cover', '1634544517319.jpg', 40311);
INSERT INTO `channel_content` VALUES ('1634544549856', '1634003162525', '网瘾少女叽', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1634544549856', '一些叽叽翻唱的歌', '2021-10-18 16:09:09', '2021-10-18 16:09:09', '109951163464146231.jpg', 'image/jpeg', './upload/channel/cover', '1634544549871.jpg', 6088);
INSERT INTO `channel_content` VALUES ('1634544598672', '1634003162525', 'Osshun Gum / killer whale', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1634544598672', '自留电台', '2021-10-18 16:09:58', '2021-10-18 16:09:58', '109951165606326763.jpg', 'image/jpeg', './upload/channel/cover', '1634544598687.jpg', 6136);
INSERT INTO `channel_content` VALUES ('1634544638296', '1634003162525', '岳家别院', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1634544638296', '给岳岳和他的小伙伴写的歌', '2021-10-18 16:10:38', '2021-10-18 16:10:38', '109951163330974295.jpg', 'image/jpeg', './upload/channel/cover', '1634544638309.jpg', 7195);
INSERT INTO `channel_content` VALUES ('1634544676223', '1634003162525', '像风握在手里', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1634544676223', 'zz', '2021-10-18 16:11:16', '2021-10-18 16:11:16', '109951163329292147.jpg', 'image/jpeg', './upload/channel/cover', '1634544676246.jpg', 7650);
INSERT INTO `channel_content` VALUES ('1635575832956', '1634003244200', '高清郭德纲于谦相声', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1635575832956', '高清郭于全集', '2021-10-30 14:37:12', '2021-10-30 14:37:12', '109951166134481462.jpg', 'image/jpeg', './upload/channel/cover', '1635575832976.jpg', 78504);
INSERT INTO `channel_content` VALUES ('1636271083163', '1634003177722', ' 浅夜动漫', '1621553753077', 'http://localhost:8200/channel/content/cover?id=1636271083163', ' 浅夜出品所有音乐均为Nightcore音乐改编系列非原声', '2021-11-07 15:44:43', '2021-11-07 15:44:43', '109951165151791026.jpg', 'image/jpeg', './upload/channel/cover', '1636271083185.jpg', 7243);
INSERT INTO `channel_content` VALUES ('1637996874647', '1634003244200', '岳云鹏', '1621586669402', 'http://localhost:8200/channel/content/cover?id=1637996874647', '岳云鹏，1985年出生，河南濮阳人，德云社青年相声演员，师从郭德纲。本电台收集小岳岳历来的音频节目，欢迎订阅收听。', '2021-11-27 15:07:54', '2021-11-27 15:07:54', '18752170812898525.jpg', 'image/jpeg', './upload/channel/cover', '1637996874669.jpg', 8335);
INSERT INTO `channel_content` VALUES ('1637996948460', '1634003244200', ' 苗阜vs王声', '1621586669402', 'http://localhost:8200/channel/content/cover?id=1637996948460', ' 陕派相声，西北相声领头羊，苗阜王声！！！', '2021-11-27 15:09:08', '2021-11-27 15:09:08', '18920396091144003.jpg', 'image/jpeg', './upload/channel/cover', '1637996948475.jpg', 9378);
INSERT INTO `channel_content` VALUES ('1644287084743', '1634003162525', '一些小心情', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1644287084743', '分享一些喜欢的歌', '2022-02-08 10:24:44', '2022-02-08 10:24:44', '109951165527659738.jpg', 'image/jpeg', './upload/channel/cover', '1644287084756.jpg', 43144);
INSERT INTO `channel_content` VALUES ('1644287264159', '1634003162525', ' Cuphead Club ', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1644287264159', '随便扯点啥', '2022-02-08 10:27:44', '2022-02-08 10:27:44', '109951164013911305.jpg', 'image/jpeg', './upload/channel/cover', '1644287264173.jpg', 47145);
INSERT INTO `channel_content` VALUES ('1649732276030', '1634003177722', '早安英文', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1649732276030', ' 最实用，最有趣，最调皮的中英双语节目。', '2022-04-12 10:57:56', '2022-04-12 10:57:56', '109951163922829798.jpg', 'image/jpeg', './upload/channel/cover', '1649732276044.jpg', 12047);
INSERT INTO `channel_content` VALUES ('1649732362168', '1634003177722', '全季动漫音乐先行', '1621586602550', 'http://localhost:8200/channel/content/cover?id=1649732362168', '来自多彩世界的明天ED插入歌\n平凡职业塑造世界最强OP', '2022-04-12 10:59:22', '2022-04-12 10:59:22', '109951167227358434.jpg', 'image/jpeg', './upload/channel/cover', '1649732362184.jpg', 8546);
INSERT INTO `channel_content` VALUES ('1650010726370', '1634003244200', '岳云鹏孙越相声集', '1621586669402', 'http://localhost:8200/channel/content/cover?id=1650010726370', '那个自带BGM、自带笑点的男人来啦！\n\n岳云鹏孙越相声集强势来袭！\n\n更有《杂学唱》《穿上裤子去赚钱》《偷论》等经典作品！\n\n走过路过不错过！', '2022-04-15 16:18:46', '2022-04-15 16:18:46', 'wK.png', 'image/png', './upload/channel/cover', '1650010726392.png', 8520);
INSERT INTO `channel_content` VALUES ('1650611580246', '1634003185367', '德云二队', '1650161308411', 'http://localhost:8200/channel/content/cover?id=1650611580246', '为您带来《学小曲》《地理图》《歌曲漫谈》等高能相声！\n各种爆笑包袱等你解锁！一次承包你一整天的快乐~', '2022-04-22 15:13:00', '2022-04-22 15:13:00', 'wKgJXlmBiNaxmBKIAAAm0ovA36Y535.jpg', 'image/jpeg', './upload/channel/cover', '1650611580272.jpg', 6364);
INSERT INTO `channel_content` VALUES ('1650611765980', '1634003185367', ' 郭德纲最新相声', '1650161308411', 'http://localhost:8200/channel/content/cover?id=1650611765980', ' 本专辑收集2013最新的郭德纲相声。    郭德纲，人民曲艺艺术家、相声和电视剧演员、电视脱口秀主持人。1973年生于天津，自幼酷爱民间艺术。', '2022-04-22 15:16:05', '2022-04-22 15:16:05', 'wKgKjVsEEpewH1BNAAIQtoa3U6Y627.jpg', 'image/jpeg', './upload/channel/cover', '1650611765995.jpg', 9290);
INSERT INTO `channel_content` VALUES ('1650611997653', '1634003177722', '易中天品三国', '1650161308411', 'http://localhost:8200/channel/content/cover?id=1650611997653', '三国是一个风云变幻、沧海横流、英雄辈出、令人神往的时代，不知多少盖世英雄在那里大显身手，叱咤风云，正可谓江山如画，一时多少豪杰。厦门大学易中天教授，将以故事说人物，以人物说历史，以历史说文化，以文化说人性，还原真实曹操，替周瑜辩诬，正说诸葛亮，重评司马懿。纵论天下，闲话三分。细品是非功过，总结成败得失。', '2022-04-22 15:19:57', '2022-04-22 15:19:57', 'wKgJJVqP3ZLAsnPuAADkmst8S74953.jpg', 'image/jpeg', './upload/channel/cover', '1650611997671.jpg', 9944);
INSERT INTO `channel_content` VALUES ('1650612367380', '1634003222816', '冷历史-有趣的历史细节', '1650161308411', 'http://localhost:8200/channel/content/cover?id=1650612367380', '名人小传、古人生活、历史逸闻、世界小史！', '2022-04-22 15:26:07', '2022-04-22 15:26:07', 'CMCoOSYDvFgBAAHZagB1By4q.jpeg', 'image/jpeg', './upload/channel/cover', '1650612367398.jpeg', 9670);
INSERT INTO `channel_content` VALUES ('1650612563451', '1634003146371', '闲云孤鹤-唯美纯音乐', '1650161308411', 'http://localhost:8200/channel/content/cover?id=1650612563451', '众鸟高飞尽，孤云独自闲。行云流水般写意，优美动人，通晓周天之事物，施利万物而不争，乘风与仙鹤齐飞，举杯邀星月同饮。轻轻的点击透露着优雅，厚重的弹拔提醒着庄重。这是中阮营造的意境，润耳吗?', '2022-04-22 15:29:23', '2022-04-22 15:29:23', 'wKgKjls9mLiDKPsdAAE_RzgLVHY756.jpg', 'image/jpeg', './upload/channel/cover', '1650612563470.jpg', 3442);
INSERT INTO `channel_content` VALUES ('1650613406414', '1634003169561', '阿斗讲电影故事', '1650161308411', 'http://localhost:8200/channel/content/cover?id=1650613406414', '擅长讲清楚故事，偶尔也会搞笑', '2022-04-22 15:43:26', '2022-04-22 15:43:26', 'wKgJKFhtyoDTxK8wAAIVbRCmZ6s385.jpg', 'image/jpeg', './upload/channel/cover', '1650613406430.jpg', 11270);
INSERT INTO `channel_content` VALUES ('1650614109749', '1634003169561', '刘老师说电影', '1635685284424', 'http://localhost:8200/channel/content/cover?id=1650614109749', '嗷嗷丰富，嗓音贼拉炫酷，光一个背影往那一杵，就能吸引粉丝无数的刘老师', '2022-04-22 15:55:09', '2022-04-22 15:55:09', 'CMCoOSUExBq0AAFQkgDHwWf_.jpeg', 'image/jpeg', './upload/channel/cover', '1650614109771.jpeg', 5382);

-- ----------------------------
-- Table structure for combo
-- ----------------------------
DROP TABLE IF EXISTS `combo`;
CREATE TABLE `combo`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of combo
-- ----------------------------
INSERT INTO `combo` VALUES ('1643091198654', '1个月', 16, '2022-01-25 14:13:18', '2022-01-25 14:13:44');
INSERT INTO `combo` VALUES ('1643091239804', '3个月', 45, '2022-01-25 14:13:59', '2022-01-25 14:13:59');
INSERT INTO `combo` VALUES ('1643091252790', '6个月', 88, '2022-01-25 14:14:12', '2022-01-25 14:14:12');
INSERT INTO `combo` VALUES ('1643091264205', '12个月', 158, '2022-01-25 14:14:24', '2022-01-25 14:14:24');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `replyId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `userId`) USING BTREE,
  INDEX `songId`(`songId`) USING BTREE,
  INDEX `pId`(`pId`) USING BTREE,
  INDEX `alId`(`alId`) USING BTREE,
  INDEX `vId`(`vId`) USING BTREE,
  INDEX `replyId`(`replyId`) USING BTREE,
  INDEX `comment_ibfk_6`(`userId`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `comment_ibfk_7`(`mId`) USING BTREE,
  INDEX `comment_ibfk_8`(`tId`) USING BTREE,
  INDEX `comment_ibfk_9`(`cId`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`vId`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_5` FOREIGN KEY (`replyId`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_7` FOREIGN KEY (`mId`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_8` FOREIGN KEY (`tId`) REFERENCES `toplist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_9` FOREIGN KEY (`cId`) REFERENCES `program` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1623674891066', '这首歌真不错', '1621586602550', NULL, '1622101289239', NULL, NULL, NULL, '2021-06-14 20:51:42', '2021-06-14 20:51:46', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1623674936959', '这个歌单很优秀', '1621586602550', NULL, NULL, '1623426299066', NULL, NULL, '2021-06-14 20:51:42', '2021-06-14 20:51:46', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1623675015897', '这个专辑很贵', '1621586602550', NULL, NULL, NULL, '1622073564263', NULL, '2021-06-14 20:51:42', '2021-06-14 20:51:46', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1623675677079', '这个评论很有趣', '1621586602550', '1623675015897', NULL, NULL, NULL, NULL, '2021-06-14 21:01:17', '2021-06-14 21:01:17', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1623680634067', '这个歌单为什么没哟个', '1621586602550', NULL, NULL, '1623424402288', NULL, NULL, '2021-06-14 22:23:54', '2021-06-14 22:23:54', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1623680670100', '好听', '1621586602550', NULL, NULL, '1623424402288', NULL, NULL, '2021-06-14 22:24:30', '2021-06-14 22:24:30', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1623681413959', '我是竹林七贤阮籍', '1622166913290', NULL, NULL, '1623424402288', NULL, NULL, '2021-06-14 22:36:53', '2021-06-14 22:36:53', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1624369881765', '大爱艾伦沃克', '1621553753077', NULL, NULL, NULL, '1621948204281', NULL, '2021-06-22 21:51:21', '2021-06-22 21:51:21', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1624369902734', '全部是金曲', '1621553753077', NULL, NULL, NULL, '1621948204281', NULL, '2021-06-22 21:51:42', '2021-06-22 21:51:42', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1624370773715', '我是艾伦沃克', '1621553753077', NULL, NULL, NULL, '1621948204281', NULL, '2021-06-22 22:06:13', '2021-06-22 22:06:13', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1624976134332', '年纪大了，就喜欢听赵雷的歌！', '1621586602550', NULL, NULL, NULL, '1624546413717', NULL, '2021-06-29 22:15:34', '2021-06-29 22:15:34', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1625054749904', '黄油在前24小时内获得了1.128亿观看次数，860万个赞和510万评论（YouTube历史上24小时首次亮相，打破了某D的1.011亿观看记录）', '1621586602550', NULL, NULL, NULL, NULL, '1625054670111', '2021-06-30 20:05:49', '2021-06-30 20:05:49', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1625055305257', '成都市旅游局真该给赵雷发个奖状，因为他的歌至少玉林那边天天都有人来，玉林西路已经成了网红街', '1621586602550', NULL, NULL, NULL, NULL, '1625055245420', '2021-06-30 20:15:05', '2021-06-30 20:15:05', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1625055913778', '这人也是无法超越的一个，精神食粮，最爱beyond！从初一开始，二十多年了！！我觉得他们的歌会被永久传唱，天哪，爱与和平是世间大爱啊', '1621586602550', NULL, NULL, NULL, NULL, '1625055843087', '2021-06-30 20:25:13', '2021-06-30 20:25:13', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1625056201515', '惹？第一次听这个歌 前奏还以为是把红歌混剪进去恶搞 结果听到英语才反应过来', '1621586602550', NULL, NULL, NULL, NULL, '1625056118822', '2021-06-30 20:30:01', '2021-06-30 20:30:01', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1625057356308', 'YUI这么漂亮？？！我第一次看见真人欸！少有的原创歌手，简直是才女，现在已经是四个孩子的妈妈了', '1621586602550', NULL, NULL, NULL, NULL, '1625053676298', '2021-06-30 20:49:16', '2021-06-30 20:49:16', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626080150394', '小时候真美好', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2021-07-12 16:55:50', '2021-07-12 16:55:50', '1626076253042', NULL, NULL);
INSERT INTO `comment` VALUES ('1626082426123', '十九岁的某一天', '1621554155356', NULL, NULL, '1623425528589', NULL, NULL, '2021-07-12 17:33:46', '2021-07-12 17:33:46', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626082950486', '林忆莲也太漂亮了吧！', '1621554155356', NULL, NULL, NULL, NULL, '1625055245420', '2021-07-12 17:42:30', '2021-07-12 17:42:30', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626093916518', '笑死，对着没有穿校服的学长喊着：老师好【然后敬个礼... ...】后面那个学长说他不是老师我还回了一句没关系:D............（日常脑抽', '1621554155356', NULL, NULL, NULL, NULL, NULL, '2021-07-12 20:45:16', '2021-07-12 20:45:16', '1626076253042', NULL, NULL);
INSERT INTO `comment` VALUES ('1626098318623', '人文', '1621554155356', NULL, NULL, NULL, NULL, NULL, '2021-07-12 21:58:38', '2021-07-12 21:58:38', '1626076253042', NULL, NULL);
INSERT INTO `comment` VALUES ('1626098465521', '把“失败者”唱成“成功者”的男人', '1621554155356', NULL, NULL, NULL, NULL, '1625054331380', '2021-07-12 22:01:05', '2021-07-12 22:01:05', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626098479270', '你们馋的是《loser》吗？呸，你们馋的是人家的舞姿，俺也一样！', '1621554155356', NULL, NULL, NULL, NULL, '1625054331380', '2021-07-12 22:01:19', '2021-07-12 22:01:19', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626098945681', '看到这个，很有感触。每年看着广西外出务工人民，一支庞大的摩托大军，从广东开往他们牵挂的家，一年到头，多少辛苦都不言累，只为了回家团圆。', '1621554155356', NULL, NULL, NULL, NULL, '1625054974084', '2021-07-12 22:09:05', '2021-07-12 22:09:05', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626222826314', '经典猫和老鼠卡点', '1621554155356', NULL, NULL, NULL, NULL, '1625051913014', '2021-07-14 08:33:46', '2021-07-14 08:33:46', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626230546477', '海阔天空写人心 真的爱你颂母亲 灰色轨迹怀过去 光辉岁月照一生 大地上面有农民 长城留着他足迹。 无尽空虚唱寂寞， 都是旧日的足迹。 岁月无声叹时快， 一九九三是悲剧， 留下日本的回忆。 六月三十悲痛日， 天妒英才黄家驹。 梦碎东京富士山， 泪洒香港将军澳， 世间纵有千万曲， 人间再无黄家驹！', '1621554155356', NULL, NULL, NULL, NULL, '1625055843087', '2021-07-14 10:42:26', '2021-07-14 10:42:26', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626245002510', '大爱陈奕迅', '1625404058174', NULL, NULL, NULL, '1622073564263', NULL, '2021-07-14 14:43:22', '2021-07-14 14:43:22', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626274500101', '果子真的什么曲风的舞蹈都适合  不愧是全能ACE', '1626267479156', NULL, NULL, NULL, NULL, '1626274452647', '2021-07-14 22:55:00', '2021-07-14 22:55:00', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626353854016', '玫瑰嗓是真的适合摇滚，（像艾薇儿的味道）', '1626352819737', NULL, '1624540295354', NULL, NULL, NULL, '2021-07-15 20:57:34', '2021-07-15 20:57:34', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626353916566', '金泰亨建议直接去秀场！！！！这里不够你走我看不够哇！！！！我不发蔻皮疯我发什么疯！！！！！卷毛小狗不是只能可爱啊', '1626352819737', NULL, '1624540295354', NULL, NULL, NULL, '2021-07-15 20:58:36', '2021-07-15 20:58:36', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626357075763', '田柾国是什么大拽比啊 无袖背心真的好杀我', '1626267479156', NULL, '1624540295354', NULL, NULL, NULL, '2021-07-15 21:51:15', '2021-07-15 21:51:15', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626357229626', '金泰亨是血族超模没错了！好有巨星气质，苏晕了', '1626253954965', NULL, '1624540295354', NULL, NULL, NULL, '2021-07-15 21:53:49', '2021-07-15 21:53:49', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626357435195', '就喜欢金泰亨这幅又拽又酷的样子', '1626253954965', '1626353854016', NULL, NULL, NULL, NULL, '2021-07-15 21:57:15', '2021-07-15 21:57:15', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626357959637', '在餐厅里唱雷子的歌，被客人轰了下来，因为不够“带劲”。不等老板炒我，我就辞职了。我想我再也不去酒吧餐厅这种地方驻唱了，还是在街头安静唱着，让懂的人懂，让不懂的人不懂。歌像人一样，都是有灵魂的。旋律和节奏只是外在，他们要的只是表面上的“好听”。不是所有人都能看到和听到灵魂。', '1626253954965', NULL, '1624546506142', NULL, NULL, NULL, '2021-07-15 22:05:59', '2021-07-15 22:05:59', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626360763320', '我在开车的时候听了这首歌，放得特别大声，于是越听越来劲我就开超速了，突然看到后面一辆警车追着我，并挥手示意我停下，我知道是因为我超速，随后我开得更快了，警车也开得更快了。当警车跟我并排的时候、我一想，这下完了，没想到，车里一个警察探出头来 拿着扩音器大喊 大兄弟 你这首歌叫什么名字', '1626253954965', NULL, '1626360701597', NULL, NULL, NULL, '2021-07-15 22:52:43', '2021-07-15 22:52:43', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626438623200', '还是喜欢赵雷！', '1626352819737', NULL, NULL, '1623425577321', NULL, NULL, '2021-07-16 20:30:23', '2021-07-16 20:30:23', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626438966992', '我怪铁树不开花 我怪乌鸦不会说情话 我怪山风不会亲吻海浪 怪来怪去 其实我是怪自己没有用 留不住任何人', '1626352819737', NULL, NULL, '1626269334408', NULL, NULL, '2021-07-16 20:36:06', '2021-07-16 20:36:06', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626441142455', '当现在的孩子想到头文字D主题曲满屏幕刷的逮虾户而不是这首rage your dream的时候,我感觉到我已经老了.', '1626352819737', NULL, '1626360701597', NULL, NULL, NULL, '2021-07-16 21:12:22', '2021-07-16 21:12:22', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626441399284', '快剪掉那忧愁的长发吧，离开这个荒冷的村庄吧，这里没有人会唱吉姆唱过的那些老歌', '1626352819737', NULL, NULL, NULL, '1624546413717', NULL, '2021-07-16 21:16:39', '2021-07-16 21:16:39', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626441520510', '啪姐跳舞总让我在扭得好性感和怎么这么好笑之间摇摆', '1626352819737', NULL, NULL, NULL, '1624375276272', NULL, '2021-07-16 21:18:40', '2021-07-16 21:18:40', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626441567314', '说实话，要是看这个剧还能因为cp掐起来，估计脑子里面装的都是福尔马林', '1626352819737', NULL, NULL, NULL, '1622074447978', NULL, '2021-07-16 21:19:27', '2021-07-16 21:19:27', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626441604070', '防弹一共就出了两首英文歌，你知道其他韩团出了多少吗？你不知道，因为只有防弹火了', '1626352819737', NULL, NULL, NULL, '1623419176842', NULL, '2021-07-16 21:20:04', '2021-07-16 21:20:04', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626443949968', '之前粉墨回归都会看一眼mv的路人觉得，这次肉的舞蹈实力真的很抢眼，尤其最后一段四个人并排走过来，头发丝都在跳舞，她跳舞好有自己的风格嗷', '1626352819737', NULL, '1626272735139', NULL, NULL, NULL, '2021-07-16 21:59:09', '2021-07-16 21:59:09', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626444026965', '徐怀钰，现在很辛苦，希望你能好起来，期待再次听到你的歌，加油坚强', '1626352819737', NULL, '1626233266278', NULL, NULL, NULL, '2021-07-16 22:00:26', '2021-07-16 22:00:26', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626444281516', '感觉像星战反派维达出场，但序幕一拉开发现是啪姐在唱歌，串场了哈哈哈', '1626352819737', NULL, '1624375323999', NULL, NULL, NULL, '2021-07-16 22:04:41', '2021-07-16 22:04:41', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626444341415', '你真的红了 很开心 内场票也可以卖到1000+ 虽然以前50就能听你的livehouse 越来越听不起你的演唱会 不过没关系 我会努力变得跟你一样好 民谣不应该穷 以前你吃过的苦都是值得的 难过的日子都是你陪我一起过的 你说你是个普通人 想要买房结婚 我知道 愿你有酒有肉有姑娘 #赵雷', '1626352819737', NULL, '1624546320157', NULL, NULL, NULL, '2021-07-16 22:05:41', '2021-07-16 22:05:41', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626444540658', '说真的 这个鬼畜水平很到位 比首页那些烂大街的创意好很多', '1626352819737', NULL, NULL, NULL, NULL, '1625051913014', '2021-07-16 22:09:00', '2021-07-16 22:09:00', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626619599566', '想起高考结束那天晚上，几个朋友在街角不期而遇，然后在路边小摊坐着说说笑笑，两个女生在轻声齐唱这首歌，夜深之后，各自离去，转眼间已过八年，早已忘记了当时谈论的什么，有些人也已经面容模糊，但那轻声吟唱的声音仿佛还在耳边，那么怀念', '1626352819737', NULL, NULL, NULL, NULL, '1626233530174', '2021-07-18 22:46:39', '2021-07-18 22:46:39', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626619739165', '有妖一心向善，有人心怀鬼胎 有魔回头是岸，有人迷途不返 有鬼来世投胎，有人自寻死路 有怪欲修人形，有人偏偏作怪', '1626352819737', NULL, NULL, NULL, NULL, '1625053198223', '2021-07-18 22:48:59', '2021-07-18 22:48:59', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626619855661', 'Butter是一首动摇人心的 包含防弹少年团可爱告白的 清凉又中毒性强的 dance pop类型的𝘀𝘂𝗺𝗺𝗲𝗿 𝘀𝗼𝗻𝗴 是能够感受到 防弹少年团独有的像黄油般柔和渗透的魅力的歌曲 增添了防弹少年团独有的音乐风格', '1626352819737', NULL, NULL, NULL, NULL, '1625054670111', '2021-07-18 22:50:55', '2021-07-18 22:50:55', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626767435483', '我们用着不相同的语言全力表达着相同的心情 我可以嗷嗷嗷嗷嗷嗷嗷嗷嗷', '1626267479156', NULL, NULL, NULL, NULL, '1625054331380', '2021-07-20 15:50:35', '2021-07-20 15:50:35', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626768955501', '之前我真的非常排斥千与千寻被翻，我觉得那种感觉，换个人真的没办法表达的更好，但是这首翻唱真的很棒，千与千寻就应该是这种温暖又没落的别离啊', '1626267479156', NULL, NULL, NULL, NULL, '1625055706152', '2021-07-20 16:15:55', '2021-07-20 16:15:55', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1626769024930', '之前粉墨回归都会看一眼mv的路人觉得，这次肉的舞蹈实力真的很抢眼，尤其最后一段四个人并排走过来，头发丝都在跳舞，她跳舞好有自己的风格嗷', '1626267479156', NULL, NULL, NULL, NULL, NULL, '2021-07-20 16:17:04', '2021-07-20 16:17:04', '1626337800524', NULL, NULL);
INSERT INTO `comment` VALUES ('1633939717293', '那天我约你跑步，可能也就我这种傻子才会约女生晨跑，一夜没睡，五点就在你家楼下站，你八点才下来，说睡过头了。我笑着说，没关系。', '1621553753077', NULL, NULL, NULL, NULL, '1633919475129', '2021-10-11 16:08:37', '2021-10-11 16:08:37', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1633946918291', '当年红馆告别演唱会，她就退出歌坛踏上美国的求学之路，唱出这首歌的时候，全场泪飚。因为求学，当年人生中第一次远离家乡，乘坐大巴去往广州，再转火车到东北。大巴上一路单循就是这首。有些词曲，旋律，一旦响起，勾起的不但是回忆，更是一段往昔珍藏的情感。', '1621553753077', NULL, '1633946866771', NULL, NULL, NULL, '2021-10-11 18:08:38', '2021-10-11 18:08:38', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1634817220174', '一个cos名侦探柯南，一个cos逆转裁判，牛逼', '1621553753077', NULL, NULL, NULL, NULL, '1634533182631', '2021-10-21 19:53:40', '2021-10-21 19:53:40', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635409273563', '女神啊。现在都不见了。，还记得天地传说之美人鱼。。。小莲。。哎 童年啊', '1621586602550', NULL, NULL, NULL, NULL, '1626233530174', '2021-10-28 16:21:13', '2021-10-28 16:21:13', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635409327985', '我们对民谣歌手总是充满矛盾 希望火又怕太火！', '1621586602550', NULL, NULL, NULL, NULL, '1625054974084', '2021-10-28 16:22:07', '2021-10-28 16:22:07', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635409438822', '自从粉上粉墨，我不知不觉就学好了韩语日语以及英语…', '1621586602550', NULL, '1626272735139', NULL, NULL, NULL, '2021-10-28 16:23:58', '2021-10-28 16:23:58', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635422820816', '你真的红了 很开心 内场票也可以卖到1000+ 虽然以前50就能听你的livehouse 越来越听不起你的演唱会 不过没关系 我会努力变得跟你一样好 民谣不应该穷 以前你吃过的苦都是值得的 难过的日子都是你陪我一起过的 你说你是个普通人 想要买房结婚 我知道 愿你有酒有肉有姑娘', '1622166913290', NULL, NULL, NULL, NULL, '1625055245420', '2021-10-28 20:07:00', '2021-10-28 20:07:00', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635429198075', '这个专 一首 飞燕 一首 春雷 我觉得很有可能以后八爷还会出高尔基？？？', '1622166913290', NULL, '1635340334894', NULL, NULL, NULL, '2021-10-28 21:53:18', '2021-10-28 21:53:18', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635429456936', '树下拍皮球的小女孩 一阵风过 樱花瓣迷了眼 眨眼间人就不见了 这梦一般的场景 怕是服部平次一生难忘的记忆吧', '1622166913290', NULL, '1635429386379', NULL, NULL, NULL, '2021-10-28 21:57:36', '2021-10-28 21:57:36', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635505673877', '为什么中堂医生经常躺在解剖台上休息，因为那是他的爱人最后完整存在的地方。', '1621554155356', NULL, '1622103223653', NULL, NULL, NULL, '2021-10-29 19:07:53', '2021-10-29 19:07:53', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635505759251', '八爷：为什么中国的粉丝老是讨论我能不能生孩子', '1621554155356', NULL, '1635340172627', NULL, NULL, NULL, '2021-10-29 19:09:19', '2021-10-29 19:09:19', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635506848262', '张学友是周杰伦偶像啦哈哈哈哈哈哈', '1621554155356', NULL, NULL, NULL, '1635506697059', NULL, '2021-10-29 19:27:28', '2021-10-29 19:27:28', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635506879819', '带着2002年的弟弟一起看《港囧》，这首歌出来的时候他说：噢，《饿狼传说》。我好惊讶：你们00后也听这些歌？他喝了一口可乐，一脸鄙视望着我：喜欢TF的也就你们这些25.6岁的人。我：…', '1621554155356', NULL, '1635506793225', NULL, NULL, NULL, '2021-10-29 19:27:59', '2021-10-29 19:27:59', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635508574899', '一句话，老裁缝\n一首歌里有 夕日坂、知足、说好不再见面、爱的魔法、左眼皮跳跳 这么多歌的旋律', '1621554155356', NULL, NULL, NULL, NULL, '1635508469891', '2021-10-29 19:56:14', '2021-10-29 19:56:14', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635680979001', '40岁的生命，入行38年，涉毒、滥交、醉驾这些娱乐圈丑闻统统与他无关，颓废、叛逆、骄横这些偶像范儿标配他也不想迎合模仿。他坚持远离是非圈，做个安静的美男子，留给我们永远的灿烂笑颜、没有攻击性的俊朗、以及永不过时的正能量。', '1635679207853', NULL, NULL, NULL, NULL, '1635680912753', '2021-10-31 19:49:39', '2021-10-31 19:49:39', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635684086899', '当年红馆告别演唱会，她就退出歌坛踏上美国的求学之路，唱出这首歌的时候，全场泪飚。因为求学，当年人生中第一次远离家乡，乘坐大巴去往广州，再转火车到东北。大巴上一路单循就是这首。有些词曲，旋律，一旦响起，勾起的不但是回忆，更是一段往昔珍藏的情感。', '1635679207853', NULL, NULL, NULL, NULL, '1633947139857', '2021-10-31 20:41:26', '2021-10-31 20:41:26', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635684114170', '千千阙歌》的原唱是日本超级巨星Kohji Makaino(近藤真彦)(《タ烧けの歌》)，经港台歌手数次翻唱，粤语、国语、闽南语版本皆有。 陈慧娴的是粤语版', '1621553753077', NULL, NULL, NULL, NULL, '1633947139857', '2021-10-31 20:41:54', '2021-10-31 20:41:54', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635684159946', '暗恋四年，表白，花了三个星期做视频，背景音乐就是遇见。十动然拒。今年是第六年，我们都要大学毕业了，她想回家乡去考公务员，她说不想在外面漂，但我不可能回去了。这辈子就这样了，应该是不可能了，我没有别的奢望，只希望她健康，幸福。', '1635679207853', NULL, NULL, NULL, NULL, '1633919475129', '2021-10-31 20:42:39', '2021-10-31 20:42:39', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635684333827', '多年以后，我和表弟开着三菱帕杰罗，听着赵雷的《我们的时光》，行驶在了川藏线上，去感受这个美好的世界', '1635679207853', NULL, NULL, NULL, NULL, '1625054974084', '2021-10-31 20:45:33', '2021-10-31 20:45:33', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635685218046', '老歌手就是厉害，听他们唱歌根本听不到换气声！谭咏麟、张国荣、张学友、李克勤等一帮实力派歌手！', '1635679207853', NULL, '1635506793225', NULL, NULL, NULL, '2021-10-31 21:00:18', '2021-10-31 21:00:18', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635685435144', '宿舍的人说你咋听这么非主流的歌，我说 咋啦？我就是非主流咋滴啦？', '1635685284424', NULL, '1634531821765', NULL, NULL, NULL, '2021-10-31 21:03:55', '2021-10-31 21:03:55', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635685579994', '张爱玲说的没错，“感情里的遗憾是在所难免的，每个人心里都有一个朱砂痣和一个白月光。和朱砂痣在一起心里总想着白月光”。出自〔红玫瑰与白玫瑰〕', '1635685284424', NULL, NULL, NULL, NULL, '1635508469891', '2021-10-31 21:06:19', '2021-10-31 21:06:19', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635754059335', '叙狙击手一把SVD守城，杀敌220人后牺牲。Kobane城保卫战，只身一人，一把SVD狙击枪，坚守一座城一年时间，击毙IS武装分子220人，在去年四月的战斗中就义。这个站在世界反恐最前线的库尔德男人叫Musa，以为是前几天的事情，一查才发现英雄已去一载。', '1621554155356', NULL, NULL, NULL, NULL, '1635687874954', '2021-11-01 16:07:39', '2021-11-01 16:07:39', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1635861101418', '“别听网上奇奇怪怪的爱情观 你的男孩会用他的方式爱你”', '1635685284424', NULL, '1633919156741', NULL, NULL, NULL, '2021-11-02 21:51:41', '2021-11-02 21:51:41', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636035542241', '筋斗云只有内心纯洁的人才能坐！！！', '1622167044223', NULL, NULL, NULL, NULL, '1636028601995', '2021-11-04 22:19:02', '2021-11-04 22:19:02', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636035627478', '前一段时间午睡的时候梦到自己翻唱了这首歌，醒来之后就去录了。《名侦探柯南》大概是我在电视上看的第一部日漫（魔卡少女樱在前还是后有点记不清了），地方卫视就来来回回播那么几十集，主题曲只有这一首。因为是TVsize，所以时长很短。但每次都听得我热血澎湃！好喜欢《名侦探柯南》！', '1622167044223', NULL, NULL, NULL, NULL, '1635863782146', '2021-11-04 22:20:27', '2021-11-04 22:20:27', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636035710895', '张靓颖唱的是一头狼进去羊群尽情撕咬\n张学友唱的是一头狼掉进母狼窝里尽情繁衍', '1622167044223', NULL, '1635506793225', NULL, NULL, NULL, '2021-11-04 22:21:50', '2021-11-04 22:21:50', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636035733879', '真是搞笑，内地人挑战粤语歌一堆人吐槽发音。大把的香港歌手唱国语歌平翘舌不分，怎么就能包容？双重标准有意思吗', '1622167044223', '1635506879819', NULL, NULL, NULL, NULL, '2021-11-04 22:22:13', '2021-11-04 22:22:13', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636035858630', '“走过黑暗的那段没有人拉我一把，是我自己把自己拉出深渊。没有那个人的话，我就做自己美好的那个人吧”', '1622167044223', NULL, '1635508957215', NULL, NULL, NULL, '2021-11-04 22:24:18', '2021-11-04 22:24:18', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636182167865', '1984年，著名电子琴演奏大师浦琪璋将其改编并用电子琴完美演奏，中央电视台选取其1分36秒至2分43秒作为天气预报的背景音乐，一直沿用至今。三十多年不变的背景音乐，成为十四亿人最熟悉和喜爱的音乐，它也是全世界所有电视栏目中播放时间最长的背景音乐。', '1621553753077', NULL, NULL, NULL, NULL, '1636029265659', '2021-11-06 15:02:47', '2021-11-06 15:02:47', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636182238617', '第一部的冒险最有意思，后来的我没有在看！就是看到陆续的片段说悟空有孩子了，布玛生了儿子，比克撒旦什么的，可能记忆永远在第一部', '1621553753077', NULL, NULL, NULL, NULL, '1636028601995', '2021-11-06 15:03:58', '2021-11-06 15:03:58', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636182489974', '说一个真实经历：19年我高一的时候，英语老师就说让我们班选一首英文歌每天上课前唱，因为我们班很多戳爷真爱粉和路人粉，然后就选了这首for him 。英语老师（快六十岁了）在我们第一次唱的时候，就夸这首歌歌词写得好。非常开心，我们全班一起唱了一个多月。', '1621553753077', NULL, NULL, NULL, NULL, '1635686660644', '2021-11-06 15:08:09', '2021-11-06 15:08:09', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636182619005', '手不是手,是温柔的宇宙,我这颗小星球,就在你手中转动,\n多年之后我才明白是什么意思。', '1621553753077', NULL, NULL, NULL, NULL, '1635686390194', '2021-11-06 15:10:19', '2021-11-06 15:10:19', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636182676882', '全世界男人的四大梦中女孩，法国的依莲娜、俄罗斯的喀秋莎、中国的小芳、美国的朱迪', '1621553753077', NULL, NULL, NULL, NULL, '1635862727342', '2021-11-06 15:11:16', '2021-11-06 15:11:16', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636182909875', '其实只要会flash就可以啦，喜羊羊早期本身也是flash动画', '1621553753077', NULL, NULL, NULL, NULL, '1635301875892', '2021-11-06 15:15:09', '2021-11-06 15:15:09', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636183491458', '试问谁不怀念2020年之前那些不需要社交距离、不需要口罩健康码行程码、不需要核酸检测、不需要隔离14+7、不需要提心吊胆、只需要买票进场就可以万人沸腾的演唱会呢', '1621553753077', NULL, NULL, NULL, NULL, '1635504051409', '2021-11-06 15:24:51', '2021-11-06 15:24:51', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636183575128', '都好可爱，果位的小朋友好萌，能感受到小朋友很开心符合butter轻松愉快', '1621553753077', NULL, NULL, NULL, NULL, '1634533890069', '2021-11-06 15:26:15', '2021-11-06 15:26:15', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636183808983', '很喜欢这种嘶吼一般的哭腔   直击我心底', '1621553753077', NULL, '1635506366426', NULL, NULL, NULL, '2021-11-06 15:30:08', '2021-11-06 15:30:08', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636183993389', '我从来不知道，原来咬字清晰也可作为黑点。原来学院派是被某些热爱流行音乐的人深深鄙视的。原来我们学美声学民族的，唱流行歌曲，是毁歌啊。抱歉，看到大魔王，这个委屈就无法抑制了。', '1621553753077', NULL, NULL, NULL, NULL, '1636029682642', '2021-11-06 15:33:13', '2021-11-06 15:33:13', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636184236381', '为什么都2020年了你还在听诸如许嵩周杰伦林俊杰汪苏泷李玉刚徐良这些人的歌？”\n“因为现在的乐坛不行，以前是听歌识人，现在是看明星无病呻吟”', '1621553753077', NULL, '1634531821765', NULL, NULL, NULL, '2021-11-06 15:37:16', '2021-11-06 15:37:16', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636272323588', '我想到了，在后面壁橱里偷听的岳母被成功洗脑，然后跳出来三个人对岳父洗脑，之后四个人成功被洗脑，之后再洗脑下一代未来', '1621586669402', NULL, NULL, NULL, NULL, '1636272273336', '2021-11-07 16:05:23', '2021-11-07 16:05:23', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636272768659', '聚是一团火，散是满天星，要么庸俗，要么孤独。只有熬得过孤独，你才能装得下星辰大海。欢迎聆听黄霄雲2021新年第一首新歌《星辰大海》！', '1621586669402', NULL, '1635429830242', NULL, NULL, NULL, '2021-11-07 16:12:48', '2021-11-07 16:12:48', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1636272869724', '刚想去听戳爷的歌立马给我推荐了，哈哈好棒！', '1621586669402', NULL, NULL, NULL, NULL, '1635686660644', '2021-11-07 16:14:29', '2021-11-07 16:14:29', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1638606140378', '赵小雷的新专辑《吉姆餐厅》真心很棒，这个时代不可多得的民谣好专辑，里面没有风花雪月的爱情，只有理想，故乡，时光…，我们年轻着，在路上为了理想信仰坚持着', '1635685284424', NULL, '1624546506142', NULL, NULL, NULL, '2021-12-04 16:22:20', '2021-12-04 16:22:20', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1640495534338', '今天是个好日子', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:12:14', '2021-12-26 13:12:14', '1626336829843', NULL, NULL);
INSERT INTO `comment` VALUES ('1640497239622', '我最好的朋友今年的高考很顺利的考进了四川成都的电影电视学院，我成绩不好，考的省内大专，祝他也祝我好好生活，前程似锦', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:40:39', '2021-12-26 13:40:39', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640497446484', '总有一些人，能一次次的拨动心弦，让我知道，其实，世界还有很多美好。', '1640497296254', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:44:06', '2021-12-26 13:44:06', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640497497829', '竟然听哭了，不仅唱的是成都，唱出的是回忆里的生活，瞬间想到小时候和家人的某个瞬间，感动。', '1640497296254', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:44:57', '2021-12-26 13:44:57', '1626337800524', NULL, NULL);
INSERT INTO `comment` VALUES ('1640497715817', '有感而发而已，回忆起小时侯我老爸拉着我手走路的瞬间，心里特别有触动。跟节目组有什么关系，风马牛不相及。', '1640497617203', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:48:35', '2021-12-26 13:48:35', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640497763815', '这样的配乐感觉整个歌都升华了民谣也不是一定就得很单调，我觉得的民谣天花板歌曲郭源潮词好再加上那样的曲就让我感觉很震撼的感觉这种感觉是一把吉他加一把口琴完成不了的。', '1621554155356', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:49:23', '2021-12-26 13:49:23', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640497800534', '头上两句总觉得和一首台湾老歌旋律几乎一样', '1622166913290', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:50:00', '2021-12-26 13:50:00', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640497871000', '当年歌手成都唱完后，个个学校都在拍不同校园版本的《成都》', '1635679207853', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:51:11', '2021-12-26 13:51:11', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640497920000', '但是都走啦，我依旧是孓然一身。“孤傲的灵魂”拒绝所有人，甚至容不下自己…', '1635685284424', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:52:00', '2021-12-26 13:52:00', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640498043250', '喜欢在街头，在酒吧，在草地上，在青岛大海的对面唱着这首熟悉的歌谣，个中滋味自己体会，即将踏上一段美妙的搭车民谣旅行，期待与成都的相遇，在成都的街头哼唱着这首歌，把手揣进裤兜，坐在小酒馆的门口，就这样一个个静静的走着，消失在灯光的尽头，就这样，走着，走完 自己选择的人生！', '1640497948238', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:54:03', '2021-12-26 13:54:03', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640498260544', '来成都，快三个月了。就见到的了11次太阳，大晴天，也就那么七八天', '1640498122016', NULL, NULL, NULL, NULL, NULL, '2021-12-26 13:57:40', '2021-12-26 13:57:40', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640498402249', '我俩没在一个学校，也不在一个城市，你知道我从高中就喜欢你，可是你说“不是同校的不考虑”', '1640498317915', NULL, NULL, NULL, NULL, NULL, '2021-12-26 14:00:02', '2021-12-26 14:00:02', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640498583606', '抑郁症一年多了，喜欢一个人四处跑来消除一个人安静下来的恐惧，昨天一个人做高铁来了成都，没有人陪伴，还是一个人，现在在街边的路灯下一个人抽了1包烟了，现在是13号凌晨2点08分了，希望健康的你们认真对待每一天', '1640498470004', NULL, NULL, NULL, NULL, NULL, '2021-12-26 14:03:03', '2021-12-26 14:03:03', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640498708997', '在一天中，我哪怕见到他一眼，足以让我背上一篇英语作文。我总在他看不到的地方看了他好几眼，我们不在同一个班，我害怕等毕业了我该怎么找到你', '1640498622256', NULL, NULL, NULL, NULL, NULL, '2021-12-26 14:05:08', '2021-12-26 14:05:08', '1626337998026', NULL, NULL);
INSERT INTO `comment` VALUES ('1640503035566', '记得当时这张专辑super star是第一首歌，MV不知在电视上看了多少遍。还记得那时候每天早上上学的时候，和爸爸一起哼着这首歌去上学，恍恍惚惚快20年了，真的好快，我当时还是那个每天早上睡不醒，趴在爸爸后背还要继续睡，也有爸爸总是给我扎不好马尾，放学回家头发都凌乱的不行。满满的回忆', '1640498622256', NULL, NULL, NULL, NULL, '1635686390194', '2021-12-26 15:17:15', '2021-12-26 15:17:15', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1640503092013', '老子没有故事，没有女朋友，没有考研，没有不治之症，也不放羊，哪条腿都没断，不养乌龟不养狗，不骑猪上战场，KTV里也唱不哭小姐，也不是从那那过来的，一个平凡到极致的单身狗！老子就是单纯来要赞的！ 就要520个，就是这么狂，而且还是复制的', '1640498622256', NULL, NULL, NULL, NULL, '1636029682642', '2021-12-26 15:18:12', '2021-12-26 15:18:12', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1640503140472', '为什么中堂医生经常躺在解剖台上休息，因为那是他的爱人最后完整存在的地方。', '1640498622256', NULL, NULL, NULL, NULL, '1635687185570', '2021-12-26 15:19:00', '2021-12-26 15:19:00', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1641466691164', '于谦的父亲，，是传奇人物，，干过很多工作，，做过很多事情，，八大铁帽子王之一的绿帽子王，，与海盗谈判的公务员，，古汉语的老学究，挖海底隧道的工程师，，清华池第一人，，朝鲜冷面杀手，江湖第一剑客，，双刀李老大，，被亲家捣乱的兔爷，去洗头房差点去事的文艺老干部，，人称彪子', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-01-06 18:58:11', '2022-01-06 18:58:11', NULL, NULL, '1635576840856');
INSERT INTO `comment` VALUES ('1641466846576', '相声爱好迷们都知道，目前最红的相声社团德云社有个从不上台的台柱子，他声名远播，每个相声爱好者都能讲出他的一两段趣事，有人说他是蒙古国海军司令，有人说他是武术家，有人说他爱洗澡，有人说他贩人参，有人说他住在皮条胡同，有人说他家的琥珀里有长颈鹿……这位奇人就是于谦的父亲王老爷子。', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-01-06 19:00:46', '2022-01-06 19:00:46', NULL, NULL, '1635576840856');
INSERT INTO `comment` VALUES ('1641466894800', '蒙古海军司令是于谦岳父', '1640498317915', '1641466846576', NULL, NULL, NULL, NULL, '2022-01-06 19:01:34', '2022-01-06 19:01:34', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1641642209516', '刚看完《缝纫机乐队》，大鹏这次的《缝纫机乐队》比两年前拍的《煎饼侠》好多！很励志，也很感动！看的我泪目了！尤其是影片结尾，全场合唱Beyond的《不再犹豫》，很燃！很感动！。。。', '1621553753077', NULL, NULL, NULL, '1624549188385', NULL, '2022-01-08 19:43:29', '2022-01-08 19:43:29', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1641984418798', '花粥步入蝉夏 花粉便来吵闹 歌声开始游走 个个都来问候 花粥不再温柔 丢失吉他傻笑 岁月一直在走 我们爱花粥 我真的好想你 在每一个雨季 你选择遗忘的 是我最不舍的 纸短情长啊 道不完太多涟漪 我的民谣都是关于你呀', '1621586602550', NULL, '1634541304221', NULL, NULL, NULL, '2022-01-12 18:46:58', '2022-01-12 18:46:58', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1641984664098', '《千千阙歌》的原唱是日本超级巨星Kohji Makaino(近藤真彦)(《タ烧けの歌》)，经港台歌手数次翻唱，粤语、国语、闽南语版本皆有。 陈慧娴的是粤语版', '1621586602550', NULL, '1633946866771', NULL, NULL, NULL, '2022-01-12 18:51:04', '2022-01-12 18:51:04', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1641985128226', 'Taylor的歌总能让人对爱充满着向往，哈哈，上课唱，下课唱，回家的路上都在唱。。。', '1621586602550', NULL, '1622110534718', NULL, NULL, NULL, '2022-01-12 18:58:48', '2022-01-12 18:58:48', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642407947578', '暗恋四年，表白，花了三个星期做视频，背景音乐就是遇见。十动然拒。今年是第六年，我们都要大学毕业了，她想回家乡去考公务员，她说不想在外面漂，但我不可能回去了。这辈子就这样了，应该是不可能了，我没有别的奢望，只希望她健康，幸福。', '1621553753077', NULL, '1633919156741', NULL, NULL, NULL, '2022-01-17 16:25:47', '2022-01-17 16:25:47', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642407994324', '对许嵩的歌，我从高中开始一直喜欢，到大学后怕别人说幼稚非主流就慢慢不去听。明明自己喜欢女色却装作正人君子，喜欢放肆却一本正经。其实很多人都很虚伪，明明很喜欢的东西为害怕别人的评论而随波逐流。总假装把自己放在道德制高点其实自己什么也不是。', '1621553753077', NULL, '1634531821765', NULL, NULL, NULL, '2022-01-17 16:26:34', '2022-01-17 16:26:34', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642495753851', '大家可以听一下时尚老师的《月色余晖》，非常清新非常甜～', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-01-18 16:49:13', '2022-01-18 16:49:13', NULL, '1623029929854', NULL);
INSERT INTO `comment` VALUES ('1642495777207', '牛，皮藓对我来说 是个噩梦。他这个冬天没来', '1635685284424', NULL, NULL, NULL, NULL, NULL, '2022-01-18 16:49:37', '2022-01-18 16:49:37', NULL, '1623030048873', NULL);
INSERT INTO `comment` VALUES ('1642495833828', '困扰了很久的牛皮轩终于过年的时候可以穿自己喜欢的衣服了', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-01-18 16:50:33', '2022-01-18 16:50:33', NULL, '1623030048873', NULL);
INSERT INTO `comment` VALUES ('1642498433126', '听完这些歌，发现自己已经步入中年了，好多好多事情还没来及处理完，一年又快完了。深深祝福您我的朋友，希望你一切安好。', '1635685284424', NULL, NULL, '1623424503525', NULL, NULL, '2022-01-18 17:33:53', '2022-01-18 17:33:53', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642574437720', '2016年10月11号晚上，离开北京的前一晚，和好友从南锣鼓巷去往鼓楼的路上，我们俩一起哼着“在鼓楼～”然后！我们就在路上碰到了低着头疾步匆匆的雷子！朋友上去蹭了一张合影。', '1640497948238', NULL, NULL, '1623425577321', NULL, NULL, '2022-01-19 14:40:37', '2022-01-19 14:40:37', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642574834453', '哈哈哈', '1640497948238', '1640497920000', NULL, NULL, NULL, NULL, '2022-01-19 14:47:14', '2022-01-19 14:47:14', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642577889115', '最离谱的是，就好像一个考40分的人抄90分的人的卷子抄到了60，不仅不承认还在全班面前嚷嚷说考90的抄他的', '1640497948238', NULL, NULL, '1635429991884', NULL, NULL, '2022-01-19 15:38:09', '2022-01-19 15:38:09', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642577916194', '永远不愿意约在星期天晚上，因为第二天还要上班。最好是周五，其次是周六。', '1640497948238', NULL, NULL, '1635679540043', NULL, NULL, '2022-01-19 15:38:36', '2022-01-19 15:38:36', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642578392679', '喜欢赵雷，撑起民谣一边天！', '1640497948238', '1626438623200', NULL, NULL, NULL, NULL, '2022-01-19 15:46:32', '2022-01-19 15:46:32', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642578676207', '梦里那一张老唱盘， 是谁把他藏了起来， 只留给我斑驳时光， 忘了要旋转 忘了告诉我 就已经离开， 再会呀 再会呀， 再会呀 再会呀， 你会不会记得回来。', '1640497948238', '1640503035566', NULL, NULL, NULL, NULL, '2022-01-19 15:51:16', '2022-01-19 15:51:16', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642578717713', '估计评论的也都是30岁以下的年轻一代居多。听歌先看看专辑，这是怀念宝岛歌王洪一峰，也就是洪敬尧父亲，的专辑里的一首歌。整张专辑都是华语音乐的大咖。制作人也是洪家人', '1640497948238', '1636182619005', NULL, NULL, NULL, NULL, '2022-01-19 15:51:57', '2022-01-19 15:51:57', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642578749172', '我自己回复自己我自己回复自己我自己回复自己我自己回复自己我自己回复自己我自己回复自己我自己回复自己我自己回复自己我自己回复自己', '1640497948238', '1642577889115', NULL, NULL, NULL, NULL, '2022-01-19 15:52:29', '2022-01-19 15:52:29', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642579675341', '我总把不敢表白戏称为没缘分，我总是在最关键的时候仓皇而逃，我总是相信你会回头看我，结果这一切都是梦。我目送你走到另外一个人的怀抱，我勉强笑着为你祝福， 我删除了关于你的一切，清空了备忘录，我不是逃避，我只是害怕我头脑冲动会伤害你现在的美好，我仰望星空，为你祈祷，一定要幸福。', '1640497948238', NULL, NULL, '1623424503525', NULL, NULL, '2022-01-19 16:07:55', '2022-01-19 16:07:55', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1642755211880', '呃呃呃呃', '1621586602550', NULL, NULL, NULL, NULL, NULL, '2022-01-21 16:53:31', '2022-01-21 16:53:31', NULL, NULL, '1638606411547');
INSERT INTO `comment` VALUES ('1642755238667', '俄方愤愤', '1621586602550', NULL, NULL, NULL, NULL, NULL, '2022-01-21 16:53:58', '2022-01-21 16:53:58', NULL, NULL, '1638606985584');
INSERT INTO `comment` VALUES ('1642755260744', '纷纷五分', '1621586602550', NULL, NULL, NULL, NULL, NULL, '2022-01-21 16:54:20', '2022-01-21 16:54:20', NULL, NULL, '1638607834015');
INSERT INTO `comment` VALUES ('1642755262442', '服务服务', '1621586602550', NULL, NULL, NULL, NULL, NULL, '2022-01-21 16:54:22', '2022-01-21 16:54:22', NULL, NULL, '1638607834015');
INSERT INTO `comment` VALUES ('1643455186863', '来重温了……这张专辑里面的黄子韬小卡还送给了同好的日本漫画家绪川姐姐 在2015年5月2日喜欢上这个男孩子真的太好了', '1621553753077', NULL, NULL, NULL, NULL, '1643455054797', '2022-01-29 19:19:46', '2022-01-29 19:19:46', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643517266946', '第一次看你不太顺眼，谁知道后面越看越不顺眼', '1640497948238', NULL, '1643436188086', NULL, NULL, NULL, '2022-01-30 12:34:26', '2022-01-30 12:34:26', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643517337720', '范玮琪，十年，整个华语歌坛再找不到第二个值得我这样了如指掌地爱你。 每句歌词每个旋律，都了然于胸像埋进血液里。他们说这叫亲妈粉，算是吧，只要一天你还在唱，我就会听。就算你不唱了，我也有你CD。全世界都看不惯你我也不在意。像你自己唱的，爱冷静又狂热，爱危险但值得，当爱来了爱了就对。', '1640497948238', NULL, NULL, NULL, '1643435539795', NULL, '2022-01-30 12:35:37', '2022-01-30 12:35:37', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643517420678', '新版原版都好听，当然很多人，包括我都可能比较偏好原版，原版感情更激荡也更饱满。 但是，不要忘了一件事，无论是新版还是原版，都是在高桥优先生作词作曲的《candy》基础上才出现的', '1635685284424', NULL, NULL, NULL, '1635503394595', NULL, '2022-01-30 12:37:00', '2022-01-30 12:37:00', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643517480416', '糟了.喜欢听是不是暴露了年龄', '1635685284424', NULL, NULL, NULL, NULL, '1635686390194', '2022-01-30 12:38:00', '2022-01-30 12:38:00', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643517523354', '二年级时，没收了我《龙珠》第十五卷的王老师，您还活着吗', '1635685284424', NULL, NULL, NULL, NULL, '1636028601995', '2022-01-30 12:38:43', '2022-01-30 12:38:43', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643517583794', '为什么没有郭富城翻唱的《由零开始》？', '1635685284424', NULL, NULL, NULL, '1635337496777', NULL, '2022-01-30 12:39:43', '2022-01-30 12:39:43', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643517644680', '“Butter 是一首动摇人心的 包含防弹少年团可爱告白的 清凉又中毒性强的 dance pop类型的𝘀𝘂𝗺𝗺𝗲𝗿 𝘀𝗼𝗻𝗴 是能够感受到 防弹少年团独有的像黄油般柔和渗透的魅力的歌曲 增添了防弹少年团独有的音乐风格”', '1635685284424', NULL, NULL, NULL, '1623419176842', NULL, '2022-01-30 12:40:44', '2022-01-30 12:40:44', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643517695517', '一个梦里 突然响起的旋律，醒来赶紧来听，评论好少，就像初秋的凉意，少许，但明显感受到。', '1635685284424', NULL, NULL, NULL, '1643435539795', NULL, '2022-01-30 12:41:35', '2022-01-30 12:41:35', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643518061775', '\"所谓完美 就是耳机音量刚好盖过外界噪音 闹钟响起时你刚好自然醒 你爱的人刚好也爱你\" ​​​​', '1640497948238', NULL, '1643454106693', NULL, NULL, NULL, '2022-01-30 12:47:41', '2022-01-30 12:47:41', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643518088969', '我们好像不该这样 不止这样 却又只能这样 根本抵抗不了深夜突然袭来的想念', '1621586602550', NULL, '1643454106693', NULL, NULL, NULL, '2022-01-30 12:48:08', '2022-01-30 12:48:08', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643518196267', '男二号掉到第四了 加油！', '1635685284424', NULL, NULL, NULL, NULL, NULL, '2022-01-30 12:49:56', '2022-01-30 12:49:56', NULL, '1623030010273', NULL);
INSERT INTO `comment` VALUES ('1643518260212', '作为一个00后深深体会到听老歌是品味经典，听现在的新歌越来越像垃圾分类', '1635685284424', NULL, NULL, '1636034772080', NULL, NULL, '2022-01-30 12:51:00', '2022-01-30 12:51:00', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643518560985', '这首歌真的神作。副歌部分很简单的重复，可是前奏就惊艳，男女开口就美哭。你们能感受到那种俏皮却不开心的感受吗？就是我真的不想和你说话了，可是我求你了，你快来陪我聊聊天吧，我还是喜欢你呀。', '1635685284424', NULL, '1635680608268', NULL, NULL, NULL, '2022-01-30 12:56:00', '2022-01-30 12:56:00', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643519937254', '今晚听了好几个版本的这首歌，李宗盛，叮当，杨宗纬……还是娃娃的这个最好听，据说当年李宗盛听娃娃讲述了她故事后在牛肉面馆的餐巾纸上写下了这首歌，娃娃在一开始录这首歌的时候泣不成声，哭的无法唱下去，投入了真情实感的歌，听着也是格外感动。', '1640497948238', NULL, '1643519796010', NULL, NULL, NULL, '2022-01-30 13:18:57', '2022-01-30 13:18:57', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643522518912', '好不容易跟初恋长跑了6年，却得不到家人的祝福。好不容易偷户口本办了结婚证，却没钱装扮婚车迎接新娘。好不容易即将把债务还清，却被迫带着妻儿离开从小长到大的家。夜空中最亮的星，请指引我坚强下去。', '1640497948238', NULL, '1634362102513', NULL, NULL, NULL, '2022-01-30 14:01:58', '2022-01-30 14:01:58', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643853034983', '什么才是真正的朋友 不用你上着闹钟般刻意保持联系 即使很久不见 坐下来就能一起吃火锅 连一声‘你好’也不用道 挽起袖子边吃边说‘我跟你讲啊’ 仿佛许多年前不过是昨天。', '1640498470004', NULL, '1643436188086', NULL, NULL, NULL, '2022-02-03 09:50:34', '2022-02-03 09:50:34', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643879438291', '还有人不知道范当年做了什么吗？科普一下：首先范比张出道早几年，但是一直不红，张一出道就爆红了，公司为了捧范，让张上各种综艺、上各种晚会、到各地开演唱会都带着范（那时张演唱会的嘉宾是五月天、林俊杰、吴青峰）还出了这首有百合意味的歌（具体可以看这首歌的mv）以及《仨人》。\n\n张被她妈污蔑之后，范就抢了张的助理和各种资源，还让助理私信粉丝去黑张，并且在微博上讽刺张的学历（而她自己是野鸡大学肄业）；还跟她老公和助理联手诋毁张的人品（这些网上都有截图）；范在公司还恶意图画同事海报（包括张和郭静的，有黄雅莉采访视频）。', '1621553753077', NULL, '1643436188086', NULL, NULL, NULL, '2022-02-03 17:10:38', '2022-02-03 17:10:38', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643880626831', '就算90％的异地恋都分手了，那又如何呢？不是还剩下10％吗？就算不幸被那90％命中了又怎样，生命就是要浪费在美好的事物上。比如躲在被子里和你煲电话粥，比如收到你大半个月前寄出的信，比如去车站迎接风尘仆仆的你。最重要的是“爱”而不是“我们会不会分手”。趁着年轻有人可爱，不要犹豫了', '1621553753077', NULL, '1643880439323', NULL, NULL, NULL, '2022-02-03 17:30:26', '2022-02-03 17:30:26', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643880654823', '真是奇了怪了，一个21岁在大学发个人专辑，词曲全包办的科班出身的音乐人被人说非主流，反而一堆没真才实干的小鲜肉小花旦不用自己下功夫却坐拥几千万粉丝', '1621553753077', NULL, NULL, NULL, '1643880233413', NULL, '2022-02-03 17:30:54', '2022-02-03 17:30:54', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643882485799', '听了新版起风了 什么感觉呢 就像是认识了好久的随便画了个淡妆的姑娘，虽然有瑕疵，但是很好看，很舒服，也习惯了 这次这个姑娘认真地画了妆，不是不好看，只是不习惯，觉得不如淡妆好看 还是喜欢淡妆随性的那个姑娘 ​​​', '1621553753077', NULL, '1635503448330', NULL, NULL, NULL, '2022-02-03 18:01:25', '2022-02-03 18:01:25', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643939370474', '可爱又温柔的女孩子喔  永远不要失去对美好生活的向往 不要放弃对胜利的渴望 不要忌惮于展示自己的才能 不要妄想成为谁的例外 更不要为了别人而装作喜欢 想同你讲一万遍 对这个世界而言 你是最珍贵的', '1640497617203', NULL, '1643938595197', NULL, NULL, NULL, '2022-02-04 09:49:30', '2022-02-04 09:49:30', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643939653000', '虽然有不同，但在科研里这就是创新点太小，投顶会或SCI或CSCD都不会录用的，而且起码参考文献会标出原文。这样原文引用多了也能证明原作者学术水平。', '1640497617203', NULL, NULL, NULL, NULL, '1643939608960', '2022-02-04 09:54:13', '2022-02-04 09:54:13', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942138823', '我们都曾有过风雨不动的守候，我们都曾有过肆无忌惮的奔走；我们一起分享快乐，一起承受难过，然后感动相拥。有时笑过、闹过、疯过之后，也会想着我们彼此性格八竿子打不着的人是怎么变得这么要好的？我们一个像夏天，一个像秋天，却总能把冬天变成了春天。', '1640497617203', NULL, NULL, NULL, NULL, '1643879245050', '2022-02-04 10:35:38', '2022-02-04 10:35:38', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942205949', '我觉得闺蜜是无时无刻陪在你身边的人，闺蜜就是\n可以陪你哭，陪你笑\n在你伤心你时候\n身边总有一个安慰你的人\n在你开心你时候\n她会和你一样开心\n她可以知道你心里想的是什么\n互相怎么开玩笑都不会生气\n这就是闺蜜\n有一个闺蜜是一件很幸福的事。', '1621553753077', NULL, NULL, NULL, NULL, '1643879245050', '2022-02-04 10:36:45', '2022-02-04 10:36:45', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942239459', '我和你一起疯过，笑过，开心过，悲伤过。在你伤心时我陪你。在我生气时，你为我打抱不平。如果你是一条小鱼，那我就是哺育你的小河。如果我是小鸟，那你就是让我休息的大树。但愿我们再也不分开。', '1621554155356', NULL, NULL, NULL, NULL, '1643879245050', '2022-02-04 10:37:19', '2022-02-04 10:37:19', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942286749', '我们，笑过，疯过，闹过，吵过，哭过，有时候我想不通性格不同的两人为什么关系那么好，一辈子，一个恋人，一个你，足够。我们，吵架过，说要绝交，第二天，我们又勾肩搭背，我们曾经看过一句话，我和你都很赞同：真正的闺蜜不是互相尊敬，不是互相学习，而是你没写作业我帮你兜着，互相抄答案，错了，一起被罚，你心情不好，我陪你逃课，你去旅行，我陪你，你要和我吵，我奉陪。\n闺蜜，谢谢你，我们，永远不能分开！', '1621586602550', NULL, NULL, NULL, NULL, '1643879245050', '2022-02-04 10:38:06', '2022-02-04 10:38:06', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942330816', '我们一起做了很多事情，有好的，坏的，荒唐的，危险的，你都会支持我。我在你面前只是个小**，有时还闹点小脾气，你都会包容我，而我只因为你太完美，我一时被嫉妒冲了头脑，才会导致现在我失去了你。我真的好想你!', '1622166913290', NULL, NULL, NULL, NULL, '1643879245050', '2022-02-04 10:38:50', '2022-02-04 10:38:50', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942380806', '「你是电 你是光 你是唯一的神话 你主宰 我崇拜  除了爱你  没有真理（如果我忘了我 请帮忙记得我）」，各位早。', '1622166913290', NULL, NULL, NULL, NULL, '1635686390194', '2022-02-04 10:39:40', '2022-02-04 10:39:40', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942414832', '你们千万不要给我点赞，否则我诅咒你被黄金绊倒，你家的香皂变蓝宝石，穿鞋的的时候被钻石扎到，被男神（女神）表白，浴缸里有一个亿，学校倒闭，老师生病，考试门门满分，和自己的偶像成为最好的朋友', '1622166913290', NULL, NULL, NULL, NULL, '1635687185570', '2022-02-04 10:40:14', '2022-02-04 10:40:14', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942448137', '人活着，便注定了这辈子的奔波与劳累。有太多的选择与无数的十字路口，这些太多的背后，我们只能选择让心去承受，学会沉淀。', '1625404058174', NULL, NULL, NULL, NULL, '1635687185570', '2022-02-04 10:40:48', '2022-02-04 10:40:48', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942494494', '八爷是个自闭症的疯子，但他就是大家口中天才，疯子只是天才的第一步，我超喜欢八爷，八爷欢迎来中国做客', '1626352819737', NULL, NULL, NULL, NULL, '1635687185570', '2022-02-04 10:41:34', '2022-02-04 10:41:34', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942542595', '再度重相逢又如何，过去的已经过去了，人总是要向前走的，错过就错过了，只能是一个美好的回忆了，再见！我心爱的她。', '1626352819737', NULL, NULL, NULL, NULL, '1640503937398', '2022-02-04 10:42:22', '2022-02-04 10:42:22', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942577602', '有次刘德华说 ，前几天我开了个演唱会唱得嗓子都哑了，到现在还没恢复呢！被伍佰听到了一愣，啥？开演唱会还用自己唱吗？不是弹弹吉他给歌迷们当伴奏就可以了吗。', '1635679207853', NULL, NULL, NULL, NULL, '1640503937398', '2022-02-04 10:42:57', '2022-02-04 10:42:57', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643942741258', '到高校阶段，你的论文重合率高了那就是学术不端。因为这不是闭卷考试，剽窃他人劳动成果就是可耻的，助长抄袭这种不正之风缺乏产权意识会让文化发展陷入困境，不利于文化创新。可能你觉得差不多是小事，但是对于原创者是重大损失，就像韩国把中国传统节日申遗，它说它改了没照抄那就是它的，你高兴吗？', '1635679207853', NULL, '1643938595197', NULL, NULL, NULL, '2022-02-04 10:45:41', '2022-02-04 10:45:41', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1643943018909', '大家都在悼念那个死去的女孩，只有8爷看的见在舞蹈的她。他穿着和女孩一样的高跟鞋，跟着他做手的动作。曾经他们应该很相爱，因为只有他看见了。那是他们最后的告别，这段爱情和柠檬一样酸涩难忘。', '1635679207853', NULL, NULL, NULL, NULL, '1625053880065', '2022-02-04 10:50:18', '2022-02-04 10:50:18', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644114539081', '97年，15岁，老爸拿了一部sonyCD机，里面两张盘，邓丽君和郭富城。第一支Cd歌曲，就是这首。20年过去了，我都快跟老爸当年一个岁数了。', '1621553753077', NULL, '1635337922244', NULL, NULL, NULL, '2022-02-06 10:28:59', '2022-02-06 10:28:59', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644322968565', '教给各位大宝贝一个完美的自杀方法： 1.洗一个热水澡 2.泡一杯热牛奶，加点蜂蜜 3.把空调开到舒适的温度 4.喝下牛奶，躺到床上 5.等你睁开眼看见太阳升起就是你已经死了并轮回啦，用新身份新心情去重新活吧 嘘——只是孟婆搞错，不小心让你的下一世和上一世有点像而已哦', '1640497948238', NULL, NULL, '1643522638202', NULL, NULL, '2022-02-08 20:22:48', '2022-02-08 20:22:48', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644324282879', '高一的同桌最爱的歌 记得他最爱的是拿着他那个2到3寸的电子书不分上课走路的看，每次耳机里播放的都是这首歌 记得他穷的用糖水泡馒头吃 记得他说要去云南找再婚的妈妈... 嗨！哥们你还好吗？还挺想你的', '1644202264813', NULL, '1626233266278', NULL, NULL, NULL, '2022-02-08 20:44:42', '2022-02-08 20:44:42', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644324845106', '我这个人是那种喜爱独处的性情，或说是那种不太以独处为苦的性情。每天有一两个小时跟谁都不交谈，独自跑步也罢，写文章也罢，我都不感到无聊。和与人一起做事相比，我更喜欢一个人默不作声地读书或全神贯注地听音乐。只需一个人做的事情，我可以想出许多来。', '1640497948238', NULL, '1643938595197', NULL, NULL, NULL, '2022-02-08 20:54:05', '2022-02-08 20:54:05', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644324863225', '希望大家体谅一下吧 这是我16岁做的一首纯音乐 也希望有人能喜欢 有更多人能够关注我 喜欢我的音乐', '1640497948238', '1643942741258', NULL, NULL, NULL, NULL, '2022-02-08 20:54:23', '2022-02-08 20:54:23', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644324979946', '第一次听的时候刚好失恋，那天在网吧通宵看完电影《爱情呼叫转移》的片尾响起了这首歌，一个大男生在网吧哭的一塌糊涂。。。一晃7年了，我还是一个人，错过了很多失去了，始终不明白荡气回肠最后还是为了最美的平凡。', '1640497948238', NULL, '1625408435039', NULL, NULL, NULL, '2022-02-08 20:56:19', '2022-02-08 20:56:19', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644325023732', '有时候就忽然想起许嵩 徐良 汪苏泷，然后就搜来他们歌听听，不会下载也不会加心 只是听听他们的声音，再回忆当年听这些歌的简单时光，然后感叹时光。', '1644202264813', NULL, '1643880439323', NULL, NULL, NULL, '2022-02-08 20:57:03', '2022-02-08 20:57:03', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644375487582', '歌曲内容主要讲述了一个内心有着不可告人的故事的男生，在自己喜欢的人面前不敢展现自己的柔弱和缺点，不愿意把自己的烦恼倾诉于她，而使两人关系走向紧张，最终女生用自己的善良与包容去融化男生的冰冷的心、舒缓他的焦虑与不安，两人最终能互相理解与沟通的故事', '1640497948238', NULL, '1644375432188', NULL, NULL, NULL, '2022-02-09 10:58:07', '2022-02-09 10:58:07', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644579403146', '我听老郭的相声，不看名字，只在乎是不是和于老师合作的。', '1626267479156', NULL, NULL, NULL, NULL, NULL, '2022-02-11 19:36:43', '2022-02-11 19:36:43', NULL, NULL, '1635576840856');
INSERT INTO `comment` VALUES ('1644585294527', '夏天快要过去\n请你少买冰淇淋\n天凉就别穿短裙\n别再那么淘气 龄:\n夏天快要来临\n请你多吃冰淇淋\n天凉就要穿短裙\n我就是那么淘气', '1626267479156', NULL, NULL, NULL, NULL, '1634532125851', '2022-02-11 21:14:54', '2022-02-11 21:14:54', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644585337304', '好久没听beyond的歌了，他的歌我会每隔一段时间听一次，就像跟故人坐下来怀念一下过去，聊聊最近的生活。在一个阳光明媚的午后，坐在窗边，看着人来人往。给人很温暖很贴心的感觉。', '1626267479156', NULL, NULL, NULL, NULL, '1626232870695', '2022-02-11 21:15:37', '2022-02-11 21:15:37', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644585361599', '赵小雷的新专辑《吉姆餐厅》真心很棒，这个时代不可多得的民谣好专辑，里面没有风花雪月的爱情，只有理想，故乡，时光…，我们年轻着，在路上为了理想信仰坚持着', '1626267479156', NULL, NULL, NULL, NULL, '1626231727362', '2022-02-11 21:16:01', '2022-02-11 21:16:01', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644585383642', '我的心是旷野的鸟， 在你的眼睛里， 找到了它的天空。', '1626267479156', NULL, NULL, NULL, NULL, '1643939608960', '2022-02-11 21:16:23', '2022-02-11 21:16:23', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644585412068', '我以为成都我听了这么多遍早已经厌了，我以为这首歌在经历过大众疯狂消费点评后早已经变成口水歌，今天看mv，重听，吉他声一响起，我就知道，我错了，听到它，我依然感动，希望以后带着我的姑娘，听着成都，去雷子描述的画一样的成都去走走', '1626267479156', NULL, NULL, NULL, NULL, '1625055161411', '2022-02-11 21:16:52', '2022-02-11 21:16:52', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644585470816', '我对我哥说，“我好羡慕戳爷的妹妹啊，有个这么帅的哥哥。”我哥，“我不搞基。”“他歌又唱的这么好听。”“我不搞基。”“他手好美。”“我不搞基。”“腿又细。”“我不搞基。”“……”不要拦着我，我已经去拿刀了。', '1626267479156', NULL, NULL, NULL, NULL, '1635686660644', '2022-02-11 21:17:50', '2022-02-11 21:17:50', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1644587129886', '为大千世界继续打榜，也推荐大千世界的mv。这首歌的内涵和思辩需要自己去发现才是最好的，mv打榜四步骤点赞收藏评论分享！', '1626267479156', NULL, NULL, NULL, NULL, NULL, '2022-02-11 21:45:29', '2022-02-11 21:45:29', NULL, '1623029817235', NULL);
INSERT INTO `comment` VALUES ('1644587148295', '我一声龙啸凌云志，热血燃冬扶摇起！和张杰一起看双奥之城中的中国风范🇨🇳', '1626267479156', NULL, NULL, NULL, NULL, NULL, '2022-02-11 21:45:48', '2022-02-11 21:45:48', NULL, '1623029817235', NULL);
INSERT INTO `comment` VALUES ('1645170235827', '忘记失去的，感激拥有的，期待将至的。早安！', '1621586602550', NULL, NULL, NULL, NULL, NULL, '2022-02-18 15:43:55', '2022-02-18 15:43:55', '1645170142775', NULL, NULL);
INSERT INTO `comment` VALUES ('1645436023455', '虽然五年过去了但每次听都仍是初次的惊艳时间带来的成长只要是majiko，就永远喜欢。', '1640497296254', NULL, '1635506366426', NULL, NULL, NULL, '2022-02-21 17:33:43', '2022-02-21 17:33:43', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1645444166030', '喜欢海，喜欢花，喜欢日出和日落，浪漫的年纪别活的太无趣。', '1640497296254', NULL, NULL, NULL, NULL, NULL, '2022-02-21 19:49:26', '2022-02-21 19:49:26', '1645170142775', NULL, NULL);
INSERT INTO `comment` VALUES ('1645444267651', '你说女人影响你拔刀的速度，可是为什么那天我摸了一下你女朋友的手，你拔刀比平时快了五倍[翻白眼]', '1640497296254', NULL, NULL, NULL, NULL, NULL, '2022-02-21 19:51:07', '2022-02-21 19:51:07', '1626337509488', NULL, NULL);
INSERT INTO `comment` VALUES ('1645444329850', '把左手 把右手\n大拇指 往这划 大拇指\n放这里 放这里', '1640497296254', NULL, NULL, NULL, NULL, NULL, '2022-02-21 19:52:09', '2022-02-21 19:52:09', '1626336829843', NULL, NULL);
INSERT INTO `comment` VALUES ('1645444371235', '又高考了，回想当年我差1分就考上了清华，往事不敢回首……说多了都是泪……那年清华的录取线是691分，我考了69分，就这该死的1分，害的我至今还在工地搬砖， 累死累活，哎', '1640497296254', NULL, NULL, NULL, NULL, NULL, '2022-02-21 19:52:51', '2022-02-21 19:52:51', '1626336578722', NULL, NULL);
INSERT INTO `comment` VALUES ('1648208192839', '在这偌大的北京自己就是一只小小的麻雀…相信麻雀也会有明天', '1621553753077', NULL, '1648208054434', NULL, NULL, NULL, '2022-03-25 19:36:32', '2022-03-25 19:36:32', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648209096013', '郑中基当初可是被说是张学友接班人的啊！！！就算演喜剧后，也是被说是周星驰接班人的！！！', '1621553753077', NULL, '1647144678278', NULL, NULL, NULL, '2022-03-25 19:51:36', '2022-03-25 19:51:36', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648209543917', '据日本经济新闻报道，自京阿尼纵火案以来一直下落不明的武本康弘监督（47）已于今日确认离世。 武本康弘（たけもと やすひろ），1972年4月5日生，日本著名动画师、动画导演，京都动画董事。曾参与《凉宫春日的消失》、《轻音少女》等动画的制作，担当《冰菓》、《甘城光辉游乐园》、《小林家的龙女仆》等作品的监督，拥有极其良好的声誉。 一路走好', '1621553753077', NULL, NULL, NULL, NULL, '1643433735031', '2022-03-25 19:59:03', '2022-03-25 19:59:03', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648269354047', '针不戳', '1621553753077', NULL, NULL, NULL, NULL, '1648269327758', '2022-03-26 12:35:54', '2022-03-26 12:35:54', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648269543372', '周深的歌声正如《老子·四章》所说：“和其光，同其尘。” 清雅如白荷，悠扬似金钟。\n涵蓄着光耀，混同着尘垢与好坏都能相合，不自立异。\n不露锋芒的处世原则，与世无争的处世态度，正与这首《和光同尘》相符合。', '1621553753077', NULL, NULL, NULL, NULL, '1648269508558', '2022-03-26 12:39:03', '2022-03-26 12:39:03', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648270482250', '80，90对孩子来说，中国电视上的节目最丰富的黄金年代！', '1621553753077', NULL, '1648270454571', NULL, NULL, NULL, '2022-03-26 12:54:42', '2022-03-26 12:54:42', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648273882434', '这个真是亚洲好听歌曲', '1621586602550', NULL, NULL, NULL, NULL, '1625054670111', '2022-03-26 13:51:22', '2022-03-26 13:51:22', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648274219616', 'youtube上看到！！！', '1621586602550', NULL, NULL, NULL, NULL, '1625054670111', '2022-03-26 13:56:59', '2022-03-26 13:56:59', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648608854317', 'dede', '1621586602550', '1626357435195', NULL, NULL, NULL, NULL, '2022-03-30 10:54:14', '2022-03-30 10:54:14', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648608871225', 'dedede', '1621586602550', '1636182489974', NULL, NULL, NULL, NULL, '2022-03-30 10:54:31', '2022-03-30 10:54:31', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648608879525', 'dededede', '1621586602550', '1648608871225', NULL, NULL, NULL, NULL, '2022-03-30 10:54:39', '2022-03-30 10:54:39', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648608906319', 'dededede', '1621586602550', '1623680634067', NULL, NULL, NULL, NULL, '2022-03-30 10:55:06', '2022-03-30 10:55:06', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1648608914415', 'edededed', '1621586602550', '1648608906319', NULL, NULL, NULL, NULL, '2022-03-30 10:55:14', '2022-03-30 10:55:14', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649078994842', '自编自导自演八爷舞蹈', '1621586602550', NULL, '1635340172627', NULL, NULL, NULL, '2022-04-04 21:29:54', '2022-04-04 21:29:54', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649575664043', '霉霉时隔3年，以暗黑系风格霸气回归！这次的全新专辑《Reputation》将于2017年11月10日发行，共包含15首歌曲！另外，日期的选定也是有寓意的哦', '1621553753077', NULL, '1649575232381', NULL, NULL, NULL, '2022-04-10 15:27:44', '2022-04-10 15:27:44', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649575673960', '紧勒脖子的锁链，暗黑冷酷的表情，The old Taylor一去不复返。 转副歌前的快节奏吟唱让身体欲罢不能！ 创作是她的武器，音乐是她的倾诉。 别人给她贴上的恶语标签，最终都会成为她的素材。', '1621553753077', NULL, '1649575232381', NULL, NULL, NULL, '2022-04-10 15:27:53', '2022-04-10 15:27:53', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649575683194', '我不喜欢你的小把戏，不喜欢你现在这种膨胀的状态。你让我不断的让我去演戏，像一个傻子一样任你摆布，我不喜欢你', '1621553753077', NULL, '1649575232381', NULL, NULL, NULL, '2022-04-10 15:28:03', '2022-04-10 15:28:03', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649575732472', '逃跑车 2.0 结尾鼓点一样 这不是cruel summer This is the best summer ever!', '1621553753077', NULL, '1648273167106', NULL, NULL, NULL, '2022-04-10 15:28:52', '2022-04-10 15:28:52', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649575745322', '告诉大家一个好消息: 我被霉霉在q上翻牌了！！！ 太激动了吧！ 啊啊啊！ 就是在残夏（cruel summer）这首歌上！', '1621553753077', NULL, '1648273167106', NULL, NULL, NULL, '2022-04-10 15:29:05', '2022-04-10 15:29:05', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649668168562', '不知不觉到了被安排相亲的年纪，我和姑娘说去电影院看最后的进化一群人哭的稀里哗啦，她说这有什么好哭的～以后再也没找她聊天了', '1621586602550', NULL, NULL, NULL, NULL, '1648270710019', '2022-04-11 17:09:28', '2022-04-11 17:09:28', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649668303166', '想当年高三时候考上好学校的学长们回来宣传招生，其中一个东南大学的学长制作了一个宣传视频，bgm用的就是这首曲子，当时的我觉得特别的好听，导致我之后对东南大学总有谜一样的感情。。', '1621586602550', NULL, NULL, NULL, NULL, '1635505388432', '2022-04-11 17:11:43', '2022-04-11 17:11:43', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649734171532', '天边最美是彩虹，人间最美是真诚！人生是场聚散无常的盛宴，有相聚必定有别离，聚时欢喜开怀、别时互道珍重，留份美好温润彼此。人生又是个车站，人来人来，你来我欣然相迎，你走我默默祝福，存份慈悲善待彼此。人生也是部没编排，没策划的生活剧，剧中的咱时而欢笑，时而流泪，若笑能发自肺腑，哭能酣畅淋漓，便不负人生历练的本色……', '1626267479156', NULL, NULL, NULL, NULL, '1640503572319', '2022-04-12 11:29:31', '2022-04-12 11:29:31', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649734307113', '“举杯忽逢幽月影，可我身在他乡地，含泪盼望莫有你，一去再别今两离。”', '1626267479156', NULL, NULL, NULL, NULL, '1635687185570', '2022-04-12 11:31:47', '2022-04-12 11:31:47', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649734346336', '第一次听这首歌是盘尼西林的版本，让我感受到了喷溅着荷尔蒙的青春时代。后来又去听了原唱朴树，才发现这已经是20年前的歌了', '1626267479156', NULL, NULL, NULL, NULL, '1636030025087', '2022-04-12 11:32:26', '2022-04-12 11:32:26', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649746592090', '大学生活很简单，每天三点一线，课堂、饭堂、宿舍，还要有三张卡：饭卡，银行卡，上网卡，好学生天天撑着书看，不好学的考试再看也成，反正很简单!', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-04-12 14:56:32', '2022-04-12 14:56:32', '1649746570152', NULL, NULL);
INSERT INTO `comment` VALUES ('1649746628429', '想起大一时候军训我们音乐系的女生们穿着军装也掩饰不住的妖饶风韵，还有脸上的涂脂抹粉，风过处，香汗淋漓，我们的指导教练那微红的脸。', '1621586602550', NULL, NULL, NULL, NULL, NULL, '2022-04-12 14:57:08', '2022-04-12 14:57:08', '1649746570152', NULL, NULL);
INSERT INTO `comment` VALUES ('1649747639364', '当你处在人生最低谷时，不要气馁，因为你已经不能再沉了;当你处于人生最顶峰时，不要放弃，因为学无止境，你还可以在往上爬。', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-04-12 15:13:59', '2022-04-12 15:13:59', '1626336578722', NULL, NULL);
INSERT INTO `comment` VALUES ('1649755426579', '赵雷在我心中·民谣第一', '1621553753077', NULL, NULL, '1623425577321', NULL, NULL, '2022-04-12 17:23:46', '2022-04-12 17:23:46', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649755891952', '于谦牛逼', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-04-12 17:31:31', '2022-04-12 17:31:31', NULL, NULL, '1635576745742');
INSERT INTO `comment` VALUES ('1649813076400', '我也不是很聪明的人但是我去年已上岸，已就读重点高中。我付出了很多代价，性命也付出了。只能说，心态很重要，还有就是不要放弃，不到成绩出来那一刻都不要放弃。如果自己不学习，别人说什么都没有用。关键看你自己想不想变好', '1621553753077', NULL, NULL, '1643517085989', NULL, NULL, '2022-04-13 09:24:36', '2022-04-13 09:24:36', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1649843004284', '昨天是回望过去\n“青春许国，英魂回家”\n今天是展望未来\n“我一声龙啸凌云志！神州铿锵亿万心——”', '1622166913290', NULL, NULL, NULL, NULL, NULL, '2022-04-13 17:43:24', '2022-04-13 17:43:24', '1649742403151', NULL, NULL);
INSERT INTO `comment` VALUES ('1649843389220', '吴青峰身上有一种特别的气质，如果非要用饮料来比喻他，应该是柠檬味的苏打水。入口微酸不是很好喝却很抓人，咽下时气泡摩擦的清爽过瘾但暗藏着细腻的甜凉。就像他本人的小脾气看似富有攻击性，其实剥开来全是对这个世界的温柔和悲悯，如果你愿意去品尝这一切，你会不自觉流下些眼泪。', '1622166913290', NULL, NULL, NULL, NULL, '1635682038475', '2022-04-13 17:49:49', '2022-04-13 17:49:49', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1650009500717', '就因为乐队和歌手本人专业素养都很高所以这个失误连现场其他老师都错以为是故意的....毕竟都是现场经验很丰富的音乐人 纠结这个干嘛拉[笑哭] 郁可唯除非忘词可能瞳孔地震 不然这种危机处理能力一般都挺在线的 前不久你好生活里知否知否也是', '1621586669402', NULL, NULL, NULL, NULL, '1650009471674', '2022-04-15 15:58:20', '2022-04-15 15:58:20', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1650088585984', '尘埃积累，注定我们的命运，不会是镶嵌在黑夜里的璀璨，漫长而永久，思念把希望覆盖上荒凉，把荒凉吟唱出悲伤，擦亮后变得透明，禅房断魂，芳草萋萋，双莺双咛，千种风情浮水淑，古道长亭，桃花折，鸳鸯散。', '1621553753077', NULL, NULL, '1623424402288', NULL, NULL, '2022-04-16 13:56:25', '2022-04-16 13:56:25', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1650089267376', '独去漫步，在这乍暖还寒季节，雾气凝重，依稀能看见湖面透出的光，寂灭的，苍凉的。突然想起那个夕阳深处的你，眸子映成琉璃的颜色，那般纯粹和绝望，尔后与你瞬间交汇的目光，就已是沧海桑田。迷离', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-04-16 14:07:47', '2022-04-16 14:07:47', NULL, '1623029817235', NULL);
INSERT INTO `comment` VALUES ('1650090275452', '时光翩翩起舞，无涯的荒野里，盈盈如画也只是卑微的开出花来，清寒细雨，为君沉醉，桃花乱落如红雨，一蓑烟雨茫茫醉荡，尘缘相误，你依旧是你，独我面目全非，忘记来时的路，', '1621553753077', NULL, NULL, NULL, '1633919083723', NULL, '2022-04-16 14:24:35', '2022-04-16 14:24:35', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1650092917357', '电影里这首歌配上奶奶回忆的镜头真的特别催泪，想想自己家里的老人，哪一个不是经历一生坎坷，好好爱他们吧，就好比等我们老了也会有儿孙爱我们', '1621553753077', NULL, NULL, NULL, NULL, '1640504921941', '2022-04-16 15:08:37', '2022-04-16 15:08:37', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1650093105535', '从陌生到相熟，是因为你的执着，从熟悉到陌生，是因为我的心软，自我如同花香只是一阵，飘过了就是宿命，不会苛求会留下什么，就像慢慢路途中的过客留下的脚印一样', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-04-16 15:11:45', '2022-04-16 15:11:45', NULL, NULL, '1650010956058');
INSERT INTO `comment` VALUES ('1650159094625', '想起毕业前夕突然很喜欢听这首纯音乐，记得名字是Sakura tears来着。然后跟后桌谈起这首歌，他说“哦我知道，樱花树下的约定。”', '1621586602550', NULL, NULL, NULL, NULL, '1650159060727', '2022-04-17 09:31:34', '2022-04-17 09:31:34', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1650673383221', '每天一遍心灵鸡汤，水中花，哈哈哈哈哈', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-04-23 08:23:03', '2022-04-23 08:23:03', '1650011706848', NULL, NULL);
INSERT INTO `comment` VALUES ('1650673392388', '啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦', '1621553753077', '1650673383221', NULL, NULL, NULL, NULL, '2022-04-23 08:23:12', '2022-04-23 08:23:12', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1650673430400', '1', '1621553753077', '1644587148295', NULL, NULL, NULL, NULL, '2022-04-23 08:23:50', '2022-04-23 08:23:50', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651052730446', 'R', '1644202264813', NULL, NULL, NULL, NULL, '1636029682642', '2022-04-27 17:45:30', '2022-04-27 17:45:30', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651583796572', '{{}{}{}{}{}', '1621553753077', NULL, NULL, NULL, NULL, '1626233743392', '2022-05-03 21:16:36', '2022-05-03 21:16:36', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651653189977', '有一个问题，假设费立萨和布罗利当初可以跟着界王修炼十倍界王拳，还顺道喝一下超神水，让那美克星大长老和老界王神提升一下潜力。然后在跟着比鲁斯和维斯学习破坏之力和自在极意功，布罗利和费立萨能否超越空贝。', '1651480823572', NULL, NULL, NULL, NULL, '1636028601995', '2022-05-04 16:33:09', '2022-05-04 16:33:09', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651653289383', '悟空把布尔玛内裤脱了，然后布尔玛不知道，一撩睡衣龟仙人大呼：我的龟龟', '1651480823572', '1636182238617', NULL, NULL, NULL, NULL, '2022-05-04 16:34:49', '2022-05-04 16:34:49', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651653945602', '动漫我就只看过龙珠，因为简单，现在看解说，才发现简单的剧情处处是细节。', '1651480823572', NULL, NULL, NULL, NULL, '1636028601995', '2022-05-04 16:45:45', '2022-05-04 16:45:45', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651653961529', '前段时间刚把1986版的刷了一遍。唉，心里很多感慨吧，一是觉得小悟空的太真可爱和认真的样子，看到悟空和死后爷爷在占卜婆婆那里相见都忍不住，可能想起了我的长辈了吧。看着小小的悟空一天天的长大再对比到自己已经这么大了，悟空一天天努力变强而我并没有成长太多，心里是真的万千滋味。只想说这是一部无法超越的好动图。', '1651480823572', NULL, NULL, NULL, NULL, '1636028601995', '2022-05-04 16:46:01', '2022-05-04 16:46:01', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651653982794', '一开始我以为布玛会跟悟空呢。结果跟了雅木茶。。。万万没想到最后竟然跟了悲剧塔', '1651480823572', '1643517523354', NULL, NULL, NULL, NULL, '2022-05-04 16:46:22', '2022-05-04 16:46:22', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651905123580', '嗡嗡嗡', '1621553753077', NULL, NULL, NULL, NULL, '1635686660644', '2022-05-07 14:32:03', '2022-05-07 14:32:03', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651905187429', '的我的胃', '1621553753077', NULL, NULL, NULL, NULL, NULL, '2022-05-07 14:33:07', '2022-05-07 14:33:07', '1650011706848', NULL, NULL);
INSERT INTO `comment` VALUES ('1651907011619', '完全的青蛙', '1621553753077', NULL, NULL, NULL, '1643880876793', NULL, '2022-05-07 15:03:31', '2022-05-07 15:03:31', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651907054169', '威锋网猜得出', '1621553753077', NULL, NULL, NULL, NULL, '1636352900663', '2022-05-07 15:04:14', '2022-05-07 15:04:14', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651907087847', '得得', '1621553753077', '1650009500717', NULL, NULL, NULL, NULL, '2022-05-07 15:04:47', '2022-05-07 15:04:47', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651909264629', 'tbtbt', '1621553753077', NULL, NULL, NULL, '1635503394595', NULL, '2022-05-07 15:41:04', '2022-05-07 15:41:04', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651909300709', 'tbtb', '1621553753077', NULL, NULL, NULL, NULL, '1635687185570', '2022-05-07 15:41:40', '2022-05-07 15:41:40', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651909306574', 'btbt', '1621553753077', '1649734307113', NULL, NULL, NULL, NULL, '2022-05-07 15:41:46', '2022-05-07 15:41:46', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651914246422', 'dded', '1621553753077', NULL, NULL, NULL, NULL, '1633919475129', '2022-05-07 17:04:06', '2022-05-07 17:04:06', NULL, NULL, NULL);
INSERT INTO `comment` VALUES ('1651914629771', '这首歌就是这么好听', '1621553753077', NULL, NULL, '1648549580754', NULL, NULL, '2022-05-07 17:10:29', '2022-05-07 17:10:29', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for fans
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `upId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `upId`(`upId`) USING BTREE,
  CONSTRAINT `fans_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fans_ibfk_2` FOREIGN KEY (`upId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fans
-- ----------------------------
INSERT INTO `fans` VALUES ('1640858558504', '1621553753077', '1635679207853', '2021-12-30 18:02:38', '2021-12-30 18:02:38');
INSERT INTO `fans` VALUES ('1640865600321', '1621553753077', '1622167044223', '2021-12-30 20:00:00', '2021-12-30 20:00:00');
INSERT INTO `fans` VALUES ('1640865982960', '1621553753077', '1621586602550', '2021-12-30 20:06:22', '2021-12-30 20:06:22');
INSERT INTO `fans` VALUES ('1640866342514', '1621553753077', '1622166913290', '2021-12-30 20:12:22', '2021-12-30 20:12:22');
INSERT INTO `fans` VALUES ('1642578566328', '1640497948238', '1626267479156', '2022-01-19 15:49:26', '2022-01-19 15:49:26');
INSERT INTO `fans` VALUES ('1642840273572', '1640498317915', '1621553753077', '2022-01-22 16:31:13', '2022-01-22 16:31:13');
INSERT INTO `fans` VALUES ('1642840321302', '1621586602550', '1621553753077', '2022-01-22 16:32:01', '2022-01-22 16:32:01');
INSERT INTO `fans` VALUES ('1643010638136', '1640498122016', '1621553753077', '2022-01-24 15:50:38', '2022-01-24 15:50:38');
INSERT INTO `fans` VALUES ('1644286313615', '1640497948238', '1621586602550', '2022-02-08 10:11:53', '2022-02-08 10:11:53');
INSERT INTO `fans` VALUES ('1644286350956', '1640497948238', '1621553753077', '2022-02-08 10:12:30', '2022-02-08 10:12:30');
INSERT INTO `fans` VALUES ('1644498162193', '1635685284424', '1621553753077', '2022-02-10 21:02:42', '2022-02-10 21:02:42');
INSERT INTO `fans` VALUES ('1644585554936', '1626267479156', '1621586602550', '2022-02-11 21:19:14', '2022-02-11 21:19:14');
INSERT INTO `fans` VALUES ('1649666941590', '1621586602550', '1626267479156', '2022-04-11 16:49:01', '2022-04-11 16:49:01');
INSERT INTO `fans` VALUES ('1650677049933', '1621586669402', '1621586602550', '2022-04-23 09:24:09', '2022-04-23 09:24:09');
INSERT INTO `fans` VALUES ('1650704033811', '1621586669402', '1650161308411', '2022-04-23 16:53:53', '2022-04-23 16:53:53');
INSERT INTO `fans` VALUES ('1650780648628', '1626248858763', '1621553753077', '2022-04-24 14:10:48', '2022-04-24 14:10:48');
INSERT INTO `fans` VALUES ('1651460258600', '1621553753077', '1621553753077', '2022-05-02 10:57:38', '2022-05-02 10:57:38');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `songId`(`songId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('1622110534718', '1621553753077', '2021-06-11 09:33:41');
INSERT INTO `favorite` VALUES ('1622103223653', '1621553753077', '2021-06-11 09:35:15');
INSERT INTO `favorite` VALUES ('1622101289239', '1621553753077', '2021-06-11 09:40:58');
INSERT INTO `favorite` VALUES ('1622104866862', '1621553753077', '2021-06-11 09:42:11');
INSERT INTO `favorite` VALUES ('1622102743240', '1621553753077', '2021-06-11 10:55:10');
INSERT INTO `favorite` VALUES ('1622110534718', '1621586602550', '2021-06-14 20:13:11');
INSERT INTO `favorite` VALUES ('1624546108864', '1626267479156', '2021-07-14 21:30:13');
INSERT INTO `favorite` VALUES ('1624540295354', '1626267479156', '2021-07-14 23:10:16');
INSERT INTO `favorite` VALUES ('1626360701597', '1626253954965', '2021-07-15 22:52:53');
INSERT INTO `favorite` VALUES ('1622103223653', '1626352819737', '2021-07-16 21:56:43');
INSERT INTO `favorite` VALUES ('1624540295354', '1621554155356', '2021-08-04 16:58:18');
INSERT INTO `favorite` VALUES ('1624540295354', '1621553753077', '2021-10-08 15:40:29');
INSERT INTO `favorite` VALUES ('1624546320157', '1621553753077', '2021-10-08 16:03:42');
INSERT INTO `favorite` VALUES ('1634531821765', '1635679207853', '2021-10-31 20:46:47');
INSERT INTO `favorite` VALUES ('1634531821765', '1635685284424', '2021-10-31 21:05:13');
INSERT INTO `favorite` VALUES ('1625408435039', '1621586602550', '2021-11-07 20:31:41');
INSERT INTO `favorite` VALUES ('1635429830242', '1621553753077', '2021-12-27 19:37:32');
INSERT INTO `favorite` VALUES ('1625408435039', '1621553753077', '2022-01-08 19:57:38');
INSERT INTO `favorite` VALUES ('1635506366426', '1621553753077', '2022-01-08 20:08:15');
INSERT INTO `favorite` VALUES ('1635680608268', '1621553753077', '2022-01-08 20:12:21');
INSERT INTO `favorite` VALUES ('1634531821765', '1621553753077', '2022-01-08 20:15:49');
INSERT INTO `favorite` VALUES ('1635680515627', '1621553753077', '2022-01-10 20:12:40');
INSERT INTO `favorite` VALUES ('1634362102513', '1621553753077', '2022-01-10 20:18:35');
INSERT INTO `favorite` VALUES ('1635503448330', '1621553753077', '2022-01-17 16:57:01');
INSERT INTO `favorite` VALUES ('1635340172627', '1635685284424', '2022-01-18 16:19:30');
INSERT INTO `favorite` VALUES ('1624546108864', '1640497948238', '2022-01-19 14:39:27');
INSERT INTO `favorite` VALUES ('1624546320157', '1640497948238', '2022-01-19 14:39:29');
INSERT INTO `favorite` VALUES ('1624546835299', '1640497948238', '2022-01-19 14:39:30');
INSERT INTO `favorite` VALUES ('1633919156741', '1635685284424', '2022-01-19 16:04:05');
INSERT INTO `favorite` VALUES ('1622101289239', '1635685284424', '2022-01-19 16:04:06');
INSERT INTO `favorite` VALUES ('1635337922244', '1635685284424', '2022-01-19 16:04:08');
INSERT INTO `favorite` VALUES ('1624375323999', '1621553753077', '2022-01-22 17:24:33');
INSERT INTO `favorite` VALUES ('1626360701597', '1621553753077', '2022-01-22 17:28:34');
INSERT INTO `favorite` VALUES ('1634541304221', '1621553753077', '2022-01-22 17:28:54');
INSERT INTO `favorite` VALUES ('1643454106693', '1621553753077', '2022-01-29 19:04:24');
INSERT INTO `favorite` VALUES ('1643436188086', '1640497948238', '2022-01-30 12:34:23');
INSERT INTO `favorite` VALUES ('1643454106693', '1640497948238', '2022-01-30 12:46:42');
INSERT INTO `favorite` VALUES ('1624546506142', '1635685284424', '2022-01-30 12:56:38');
INSERT INTO `favorite` VALUES ('1643519796010', '1640497948238', '2022-01-30 13:19:06');
INSERT INTO `favorite` VALUES ('1643520839579', '1640497948238', '2022-01-30 13:37:19');
INSERT INTO `favorite` VALUES ('1634531821765', '1640497948238', '2022-01-30 13:42:36');
INSERT INTO `favorite` VALUES ('1634362102513', '1640497948238', '2022-01-30 14:01:20');
INSERT INTO `favorite` VALUES ('1622103223653', '1640498317915', '2022-01-30 15:43:28');
INSERT INTO `favorite` VALUES ('1635507474940', '1640498317915', '2022-01-30 15:48:36');
INSERT INTO `favorite` VALUES ('1635506793225', '1640498470004', '2022-02-03 11:10:09');
INSERT INTO `favorite` VALUES ('1635508957215', '1640498470004', '2022-02-03 15:40:20');
INSERT INTO `favorite` VALUES ('1622102609215', '1640498470004', '2022-02-03 15:40:31');
INSERT INTO `favorite` VALUES ('1622102743240', '1640498470004', '2022-02-03 15:40:32');
INSERT INTO `favorite` VALUES ('1622102341993', '1640498470004', '2022-02-03 15:40:33');
INSERT INTO `favorite` VALUES ('1625405714713', '1640498470004', '2022-02-03 15:40:35');
INSERT INTO `favorite` VALUES ('1624546108864', '1640498470004', '2022-02-03 15:40:40');
INSERT INTO `favorite` VALUES ('1624546835299', '1640498470004', '2022-02-03 15:40:42');
INSERT INTO `favorite` VALUES ('1633919156741', '1640498470004', '2022-02-03 15:40:58');
INSERT INTO `favorite` VALUES ('1624547985767', '1621553753077', '2022-02-03 15:43:16');
INSERT INTO `favorite` VALUES ('1643436188086', '1621586602550', '2022-02-03 15:52:24');
INSERT INTO `favorite` VALUES ('1643436188086', '1621553753077', '2022-02-03 17:08:53');
INSERT INTO `favorite` VALUES ('1643880439323', '1621553753077', '2022-02-03 17:30:10');
INSERT INTO `favorite` VALUES ('1643436188086', '1640497617203', '2022-02-04 09:16:31');
INSERT INTO `favorite` VALUES ('1633919156741', '1640497617203', '2022-02-04 09:22:18');
INSERT INTO `favorite` VALUES ('1626360701597', '1640497617203', '2022-02-04 09:22:19');
INSERT INTO `favorite` VALUES ('1635429830242', '1640497617203', '2022-02-04 09:22:21');
INSERT INTO `favorite` VALUES ('1635340334894', '1640497617203', '2022-02-04 09:22:22');
INSERT INTO `favorite` VALUES ('1624546320157', '1640497617203', '2022-02-04 09:22:24');
INSERT INTO `favorite` VALUES ('1635508957215', '1640497617203', '2022-02-04 09:22:26');
INSERT INTO `favorite` VALUES ('1643938595197', '1640497617203', '2022-02-04 09:37:03');
INSERT INTO `favorite` VALUES ('1643938595197', '1635679207853', '2022-02-04 10:45:53');
INSERT INTO `favorite` VALUES ('1643880439323', '1621586602550', '2022-02-07 10:43:29');
INSERT INTO `favorite` VALUES ('1643454106693', '1644202264813', '2022-02-07 10:52:12');
INSERT INTO `favorite` VALUES ('1633919156741', '1644202264813', '2022-02-08 20:40:19');
INSERT INTO `favorite` VALUES ('1643880947532', '1644202264813', '2022-02-08 20:40:25');
INSERT INTO `favorite` VALUES ('1626233266278', '1644202264813', '2022-02-08 20:44:10');
INSERT INTO `favorite` VALUES ('1643938595197', '1640497948238', '2022-02-08 20:53:05');
INSERT INTO `favorite` VALUES ('1625408435039', '1640497948238', '2022-02-08 20:56:11');
INSERT INTO `favorite` VALUES ('1626360701597', '1640497948238', '2022-02-08 21:02:25');
INSERT INTO `favorite` VALUES ('1644374326583', '1640497948238', '2022-02-09 10:41:14');
INSERT INTO `favorite` VALUES ('1644375432188', '1640497948238', '2022-02-09 10:58:59');
INSERT INTO `favorite` VALUES ('1644374062902', '1640497948238', '2022-02-09 11:04:25');
INSERT INTO `favorite` VALUES ('1643454792066', '1640497948238', '2022-02-09 11:07:45');
INSERT INTO `favorite` VALUES ('1635680515627', '1640497948238', '2022-02-09 11:08:40');
INSERT INTO `favorite` VALUES ('1635506793225', '1640497948238', '2022-02-09 11:19:25');
INSERT INTO `favorite` VALUES ('1635506793225', '1635685284424', '2022-02-10 20:38:28');
INSERT INTO `favorite` VALUES ('1635429830242', '1626267479156', '2022-02-11 18:48:59');
INSERT INTO `favorite` VALUES ('1635507507293', '1626267479156', '2022-02-11 19:20:24');
INSERT INTO `favorite` VALUES ('1622110700737', '1626267479156', '2022-02-11 19:21:11');
INSERT INTO `favorite` VALUES ('1622110818998', '1626267479156', '2022-02-11 19:21:32');
INSERT INTO `favorite` VALUES ('1622110748238', '1626267479156', '2022-02-11 19:26:48');
INSERT INTO `favorite` VALUES ('1622111065068', '1626267479156', '2022-02-11 19:27:00');
INSERT INTO `favorite` VALUES ('1643880439323', '1626267479156', '2022-02-11 19:29:31');
INSERT INTO `favorite` VALUES ('1643880533074', '1626267479156', '2022-02-11 19:29:49');
INSERT INTO `favorite` VALUES ('1622101472154', '1626267479156', '2022-02-11 20:09:56');
INSERT INTO `favorite` VALUES ('1643436188086', '1626267479156', '2022-02-11 21:12:47');
INSERT INTO `favorite` VALUES ('1643880947532', '1621553753077', '2022-02-11 21:24:12');
INSERT INTO `favorite` VALUES ('1643938595197', '1621553753077', '2022-02-11 21:41:54');
INSERT INTO `favorite` VALUES ('1626233266278', '1621553753077', '2022-02-11 21:42:32');
INSERT INTO `favorite` VALUES ('1624546506142', '1626267479156', '2022-02-11 21:47:17');
INSERT INTO `favorite` VALUES ('1622101615081', '1621586669402', '2022-02-12 09:50:05');
INSERT INTO `favorite` VALUES ('1622101472154', '1621586669402', '2022-02-12 09:50:07');
INSERT INTO `favorite` VALUES ('1622101394846', '1621586669402', '2022-02-12 09:50:07');
INSERT INTO `favorite` VALUES ('1644374062902', '1621586669402', '2022-02-12 09:50:09');
INSERT INTO `favorite` VALUES ('1643938595197', '1621586669402', '2022-02-12 10:15:37');
INSERT INTO `favorite` VALUES ('1625405714713', '1621586669402', '2022-02-12 10:20:47');
INSERT INTO `favorite` VALUES ('1624546049959', '1621586669402', '2022-02-12 10:20:48');
INSERT INTO `favorite` VALUES ('1643454106693', '1621586602550', '2022-02-18 16:28:12');
INSERT INTO `favorite` VALUES ('1635506793225', '1621553753077', '2022-02-21 15:38:32');
INSERT INTO `favorite` VALUES ('1633946866771', '1640497296254', '2022-02-21 17:32:23');
INSERT INTO `favorite` VALUES ('1635681782848', '1640497296254', '2022-02-21 17:32:25');
INSERT INTO `favorite` VALUES ('1643454792066', '1640497296254', '2022-02-21 17:32:26');
INSERT INTO `favorite` VALUES ('1635340172627', '1640497296254', '2022-02-21 17:32:27');
INSERT INTO `favorite` VALUES ('1644374062902', '1640497296254', '2022-02-21 17:32:29');
INSERT INTO `favorite` VALUES ('1643880439323', '1640497296254', '2022-02-21 17:32:29');
INSERT INTO `favorite` VALUES ('1643519796010', '1640497296254', '2022-02-21 17:32:30');
INSERT INTO `favorite` VALUES ('1643938595197', '1640497296254', '2022-02-21 17:32:32');
INSERT INTO `favorite` VALUES ('1635506366426', '1640497296254', '2022-02-21 17:35:03');
INSERT INTO `favorite` VALUES ('1633919156741', '1640497296254', '2022-02-21 19:56:29');
INSERT INTO `favorite` VALUES ('1635508957215', '1644202264813', '2022-02-22 20:48:39');
INSERT INTO `favorite` VALUES ('1635429386379', '1640497617203', '2022-02-23 15:48:00');
INSERT INTO `favorite` VALUES ('1626272735139', '1621553753077', '2022-02-23 19:46:07');
INSERT INTO `favorite` VALUES ('1624372266021', '1621553753077', '2022-03-07 15:50:13');
INSERT INTO `favorite` VALUES ('1647144678278', '1621553753077', '2022-03-13 12:13:35');
INSERT INTO `favorite` VALUES ('1647145343871', '1621553753077', '2022-03-13 12:23:52');
INSERT INTO `favorite` VALUES ('1643938595197', '1644202264813', '2022-03-19 14:05:03');
INSERT INTO `favorite` VALUES ('1634458012381', '1621553753077', '2022-03-24 15:05:36');
INSERT INTO `favorite` VALUES ('1648208054434', '1621553753077', '2022-03-25 19:36:43');
INSERT INTO `favorite` VALUES ('1648273221025', '1621586602550', '2022-03-26 13:44:04');
INSERT INTO `favorite` VALUES ('1648273273312', '1621586602550', '2022-03-26 13:44:05');
INSERT INTO `favorite` VALUES ('1648273334240', '1621586602550', '2022-03-26 13:44:05');
INSERT INTO `favorite` VALUES ('1648273390456', '1621586602550', '2022-03-26 13:44:06');
INSERT INTO `favorite` VALUES ('1647145343871', '1621586602550', '2022-03-26 13:50:23');
INSERT INTO `favorite` VALUES ('1648208054434', '1621586602550', '2022-03-26 13:50:24');
INSERT INTO `favorite` VALUES ('1648273167106', '1621586602550', '2022-03-26 13:57:32');
INSERT INTO `favorite` VALUES ('1622110748238', '1621586602550', '2022-03-26 13:57:49');
INSERT INTO `favorite` VALUES ('1644374062902', '1621586602550', '2022-03-26 13:58:22');
INSERT INTO `favorite` VALUES ('1643938595197', '1621586602550', '2022-03-26 13:59:11');
INSERT INTO `favorite` VALUES ('1635503448330', '1621586602550', '2022-03-26 13:59:29');
INSERT INTO `favorite` VALUES ('1626272793322', '1621586602550', '2022-03-26 13:59:54');
INSERT INTO `favorite` VALUES ('1648270087790', '1621586602550', '2022-03-26 13:59:55');
INSERT INTO `favorite` VALUES ('1648273167106', '1621553753077', '2022-03-27 15:40:55');
INSERT INTO `favorite` VALUES ('1648208736500', '1640498317915', '2022-03-28 09:26:11');
INSERT INTO `favorite` VALUES ('1648273167106', '1640498317915', '2022-03-28 09:32:52');
INSERT INTO `favorite` VALUES ('1643436188086', '1640498317915', '2022-03-28 15:50:38');
INSERT INTO `favorite` VALUES ('1648273424472', '1640498317915', '2022-03-28 16:53:57');
INSERT INTO `favorite` VALUES ('1643880439323', '1640498317915', '2022-03-28 16:53:58');
INSERT INTO `favorite` VALUES ('1622110603944', '1640498317915', '2022-03-28 16:53:59');
INSERT INTO `favorite` VALUES ('1622110656908', '1640498317915', '2022-03-28 16:54:00');
INSERT INTO `favorite` VALUES ('1622110787760', '1640498317915', '2022-03-28 16:54:01');
INSERT INTO `favorite` VALUES ('1622103084212', '1621553753077', '2022-03-29 16:56:18');
INSERT INTO `favorite` VALUES ('1625056892758', '1621553753077', '2022-03-29 16:56:20');
INSERT INTO `favorite` VALUES ('1648273167106', '1626267479156', '2022-03-29 16:58:02');
INSERT INTO `favorite` VALUES ('1648273221025', '1626267479156', '2022-03-29 16:58:04');
INSERT INTO `favorite` VALUES ('1648273273312', '1626267479156', '2022-03-29 16:58:05');
INSERT INTO `favorite` VALUES ('1622103223653', '1626267479156', '2022-03-29 18:26:39');
INSERT INTO `favorite` VALUES ('1626360701597', '1626267479156', '2022-03-29 18:33:50');
INSERT INTO `favorite` VALUES ('1643880947532', '1626267479156', '2022-03-29 18:33:57');
INSERT INTO `favorite` VALUES ('1648208736500', '1640497296254', '2022-04-05 14:53:20');
INSERT INTO `favorite` VALUES ('1635507474940', '1640497296254', '2022-04-05 15:10:36');
INSERT INTO `favorite` VALUES ('1635507507293', '1640497296254', '2022-04-05 15:10:36');
INSERT INTO `favorite` VALUES ('1648273221025', '1621553753077', '2022-04-05 21:18:04');
INSERT INTO `favorite` VALUES ('1648273273312', '1621553753077', '2022-04-05 21:18:06');
INSERT INTO `favorite` VALUES ('1622110656908', '1621553753077', '2022-04-05 21:18:18');
INSERT INTO `favorite` VALUES ('1644374062902', '1621553753077', '2022-04-05 21:18:52');
INSERT INTO `favorite` VALUES ('1622110700737', '1621553753077', '2022-04-05 21:19:17');
INSERT INTO `favorite` VALUES ('1649335080451', '1621586602550', '2022-04-07 20:43:04');
INSERT INTO `favorite` VALUES ('1649335244826', '1621586602550', '2022-04-07 20:43:05');
INSERT INTO `favorite` VALUES ('1649334883510', '1621586602550', '2022-04-07 20:43:28');
INSERT INTO `favorite` VALUES ('1649336428604', '1621586602550', '2022-04-07 21:01:39');
INSERT INTO `favorite` VALUES ('1648273221025', '1640497617203', '2022-04-10 15:14:01');
INSERT INTO `favorite` VALUES ('1648273167106', '1640497617203', '2022-04-10 15:14:02');
INSERT INTO `favorite` VALUES ('1649575232381', '1640497617203', '2022-04-10 15:21:14');
INSERT INTO `favorite` VALUES ('1635429386379', '1626267479156', '2022-04-12 10:33:06');
INSERT INTO `favorite` VALUES ('1650009022897', '1621553753077', '2022-04-23 08:42:01');
INSERT INTO `favorite` VALUES ('1622103579245', '1621553753077', '2022-04-24 11:43:03');
INSERT INTO `favorite` VALUES ('1649336428604', '1621553753077', '2022-04-24 12:49:56');
INSERT INTO `favorite` VALUES ('1648270454571', '1621553753077', '2022-04-24 12:50:24');
INSERT INTO `favorite` VALUES ('1644374326583', '1621553753077', '2022-04-24 12:50:33');
INSERT INTO `favorite` VALUES ('1643519328369', '1621553753077', '2022-04-24 12:51:47');
INSERT INTO `favorite` VALUES ('1622102944462', '1621553753077', '2022-04-24 12:51:55');
INSERT INTO `favorite` VALUES ('1645600255159', '1621553753077', '2022-04-24 12:53:50');
INSERT INTO `favorite` VALUES ('1622110534718', '1626248858763', '2022-04-24 14:11:59');
INSERT INTO `favorite` VALUES ('1622110603944', '1626248858763', '2022-04-24 14:11:59');
INSERT INTO `favorite` VALUES ('1634531821765', '1626248858763', '2022-04-24 14:38:27');
INSERT INTO `favorite` VALUES ('1624546049959', '1626248858763', '2022-04-24 14:41:26');
INSERT INTO `favorite` VALUES ('1624546108864', '1626248858763', '2022-04-24 14:41:27');
INSERT INTO `favorite` VALUES ('1624546320157', '1626248858763', '2022-04-24 14:41:27');
INSERT INTO `favorite` VALUES ('1624546835299', '1626248858763', '2022-04-24 14:41:29');
INSERT INTO `favorite` VALUES ('1649335319660', '1626248858763', '2022-04-24 14:52:26');
INSERT INTO `favorite` VALUES ('1650786700381', '1626248858763', '2022-04-24 15:52:23');
INSERT INTO `favorite` VALUES ('1650786496187', '1626248858763', '2022-04-24 15:52:24');
INSERT INTO `favorite` VALUES ('1622110748238', '1621553753077', '2022-05-02 10:57:16');
INSERT INTO `favorite` VALUES ('1626272881558', '1621553753077', '2022-05-02 11:03:06');
INSERT INTO `favorite` VALUES ('1626274222518', '1621553753077', '2022-05-02 11:03:07');
INSERT INTO `favorite` VALUES ('1622102673371', '1651480823572', '2022-05-04 16:57:57');
INSERT INTO `favorite` VALUES ('1624546835299', '1621553753077', '2022-05-07 15:44:16');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `arId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `checkout` int NULL DEFAULT 0,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ccId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `arId`(`arId`) USING BTREE,
  INDEX `alId`(`alId`) USING BTREE,
  INDEX `cId`(`cId`) USING BTREE,
  INDEX `vId`(`vId`) USING BTREE,
  INDEX `pId`(`pId`) USING BTREE,
  INDEX `ccId`(`ccId`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`arId`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_4` FOREIGN KEY (`cId`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_5` FOREIGN KEY (`vId`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_6` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_7` FOREIGN KEY (`ccId`) REFERENCES `channel_content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1644285939465', '1621586602550', NULL, 1, '点赞了', NULL, '1642577889115', NULL, NULL, NULL, '2022-02-08 10:05:39', '2022-04-21 15:41:07');
INSERT INTO `message` VALUES ('1644286075007', '1621586602550', NULL, 0, '点赞了', NULL, '1640498043250', NULL, NULL, NULL, '2022-02-08 10:07:55', '2022-02-08 10:07:55');
INSERT INTO `message` VALUES ('1644286085752', '1621586602550', NULL, 0, '点赞了', NULL, '1642574834453', NULL, NULL, NULL, '2022-02-08 10:08:05', '2022-02-08 10:08:05');
INSERT INTO `message` VALUES ('1644286690878', '1621586602550', NULL, 1, '发布了', NULL, NULL, '1644286690856', NULL, NULL, '2022-02-08 10:18:10', '2022-04-10 15:02:24');
INSERT INTO `message` VALUES ('1644287493076', NULL, '1622072970585', 0, '发布了', '1644287493057', NULL, NULL, NULL, NULL, '2022-02-08 10:31:33', '2022-02-08 10:31:33');
INSERT INTO `message` VALUES ('1644298090111', '1621553753077', NULL, 1, '点赞了', NULL, '1636182489974', NULL, NULL, NULL, '2022-02-08 13:28:10', '2022-04-10 15:02:24');
INSERT INTO `message` VALUES ('1644298389500', '1621553753077', NULL, 0, '点赞了', NULL, '1643518061775', NULL, NULL, NULL, '2022-02-08 13:33:09', '2022-02-08 13:33:09');
INSERT INTO `message` VALUES ('1644298645551', NULL, '1644298601058', 0, '发布了', '1644298645535', NULL, NULL, NULL, NULL, '2022-02-08 13:37:25', '2022-02-08 13:37:25');
INSERT INTO `message` VALUES ('1644298968996', NULL, '1622072970585', 0, '发布了', '1644298968982', NULL, NULL, NULL, NULL, '2022-02-08 13:42:48', '2022-02-08 13:42:48');
INSERT INTO `message` VALUES ('1644299720566', '1621553753077', NULL, 1, '发布了', NULL, NULL, '1644299720534', NULL, NULL, '2022-02-08 13:55:20', '2022-04-21 15:51:04');
INSERT INTO `message` VALUES ('1644323000956', '1644202264813', NULL, 0, '点赞了', NULL, '1644322968565', NULL, NULL, NULL, '2022-02-08 20:23:20', '2022-02-08 20:23:20');
INSERT INTO `message` VALUES ('1644325044039', '1644202264813', NULL, 0, '点赞了', NULL, '1644324979946', NULL, NULL, NULL, '2022-02-08 20:57:24', '2022-02-08 20:57:24');
INSERT INTO `message` VALUES ('1644325401293', '1640497948238', NULL, 1, '点赞了', NULL, '1636182619005', NULL, NULL, NULL, '2022-02-08 21:03:21', '2022-04-10 15:02:24');
INSERT INTO `message` VALUES ('1644375339222', NULL, '1644375002022', 0, '发布了', '1644375339209', NULL, NULL, NULL, NULL, '2022-02-09 10:55:39', '2022-02-09 10:55:39');
INSERT INTO `message` VALUES ('1644375749677', '1640497948238', NULL, 0, '发布了', NULL, NULL, '1644375749656', NULL, NULL, '2022-02-09 11:02:29', '2022-02-09 11:02:29');
INSERT INTO `message` VALUES ('1644376775407', '1640497948238', NULL, 0, '点赞了', NULL, '1643517644680', NULL, NULL, NULL, '2022-02-09 11:19:35', '2022-02-09 11:19:35');
INSERT INTO `message` VALUES ('1644497051172', '1635685284424', NULL, 1, '点赞了', NULL, '1636182619005', NULL, NULL, NULL, '2022-02-10 20:44:11', '2022-04-10 15:02:24');
INSERT INTO `message` VALUES ('1644497667686', '1635685284424', NULL, 0, '点赞了', NULL, '1643517480416', NULL, NULL, NULL, '2022-02-10 20:54:27', '2022-02-10 20:54:27');
INSERT INTO `message` VALUES ('1644581414581', '1626267479156', NULL, 0, '点赞了', NULL, '1640497920000', NULL, NULL, NULL, '2022-02-11 20:10:14', '2022-02-11 20:10:14');
INSERT INTO `message` VALUES ('1644585780524', '1626267479156', NULL, 0, '点赞了', NULL, '1643517480416', NULL, NULL, NULL, '2022-02-11 21:23:00', '2022-02-11 21:23:00');
INSERT INTO `message` VALUES ('1644585781303', '1626267479156', NULL, 0, '点赞了', NULL, '1640503035566', NULL, NULL, NULL, '2022-02-11 21:23:01', '2022-02-11 21:23:01');
INSERT INTO `message` VALUES ('1644585782820', '1626267479156', NULL, 1, '点赞了', NULL, '1636182619005', NULL, NULL, NULL, '2022-02-11 21:23:02', '2022-04-10 15:02:24');
INSERT INTO `message` VALUES ('1644586995640', '1621553753077', NULL, 0, '点赞了', NULL, '1640497497829', NULL, NULL, NULL, '2022-02-11 21:43:15', '2022-02-11 21:43:15');
INSERT INTO `message` VALUES ('1644636785821', '1621586669402', NULL, 0, '点赞了', NULL, '1643517583794', NULL, NULL, NULL, '2022-02-12 11:33:05', '2022-02-12 11:33:05');
INSERT INTO `message` VALUES ('1645167460942', '1621553753077', NULL, 0, '点赞了', NULL, '1636035710895', NULL, NULL, NULL, '2022-02-18 14:57:40', '2022-02-18 14:57:40');
INSERT INTO `message` VALUES ('1645444332150', '1640497296254', NULL, 0, '点赞了', NULL, '1645444329850', NULL, NULL, NULL, '2022-02-21 19:52:12', '2022-02-21 19:52:12');
INSERT INTO `message` VALUES ('1646188153800', '1621553753077', NULL, 0, '点赞了', NULL, '1644324845106', NULL, NULL, NULL, '2022-03-02 10:29:13', '2022-03-02 10:29:13');
INSERT INTO `message` VALUES ('1646188154988', '1621553753077', NULL, 0, '点赞了', NULL, '1644324845106', NULL, NULL, NULL, '2022-03-02 10:29:14', '2022-03-02 10:29:14');
INSERT INTO `message` VALUES ('1646188155926', '1621553753077', NULL, 0, '点赞了', NULL, '1644324845106', NULL, NULL, NULL, '2022-03-02 10:29:15', '2022-03-02 10:29:15');
INSERT INTO `message` VALUES ('1646188752183', '1621553753077', NULL, 0, '点赞了', NULL, '1635506848262', NULL, NULL, NULL, '2022-03-02 10:39:12', '2022-03-02 10:39:12');
INSERT INTO `message` VALUES ('1646188753275', '1621553753077', NULL, 0, '点赞了', NULL, '1635506848262', NULL, NULL, NULL, '2022-03-02 10:39:13', '2022-03-02 10:39:13');
INSERT INTO `message` VALUES ('1646188754155', '1621553753077', NULL, 0, '点赞了', NULL, '1635506848262', NULL, NULL, NULL, '2022-03-02 10:39:14', '2022-03-02 10:39:14');
INSERT INTO `message` VALUES ('1647143549507', NULL, '1624547670156', 0, '发布了', '1647143549483', NULL, NULL, NULL, NULL, '2022-03-13 11:52:29', '2022-03-13 11:52:29');
INSERT INTO `message` VALUES ('1647144237388', NULL, '1647144073030', 0, '发布了', '1647144237369', NULL, NULL, NULL, NULL, '2022-03-13 12:03:57', '2022-03-13 12:03:57');
INSERT INTO `message` VALUES ('1647145284895', NULL, '1635506538320', 0, '发布了', '1647145284879', NULL, NULL, NULL, NULL, '2022-03-13 12:21:24', '2022-03-13 12:21:24');
INSERT INTO `message` VALUES ('1648207959276', NULL, '1622072806610', 0, '发布了', '1648207959257', NULL, NULL, NULL, NULL, '2022-03-25 19:32:39', '2022-03-25 19:32:39');
INSERT INTO `message` VALUES ('1648208672121', NULL, '1648208620910', 0, '发布了', '1648208672103', NULL, NULL, NULL, NULL, '2022-03-25 19:44:32', '2022-03-25 19:44:32');
INSERT INTO `message` VALUES ('1648209615154', '1621553753077', NULL, 0, '点赞了', NULL, '1644324863225', NULL, NULL, NULL, '2022-03-25 20:00:15', '2022-03-25 20:00:15');
INSERT INTO `message` VALUES ('1648270374253', NULL, '1622071867884', 0, '发布了', '1648270374236', NULL, NULL, NULL, NULL, '2022-03-26 12:52:54', '2022-03-26 12:52:54');
INSERT INTO `message` VALUES ('1648271623860', NULL, '1648271489040', 0, '发布了', '1648271623843', NULL, NULL, NULL, NULL, '2022-03-26 13:13:43', '2022-03-26 13:13:43');
INSERT INTO `message` VALUES ('1648273110053', NULL, '1622072451745', 1, '发布了', '1648273110035', NULL, NULL, NULL, NULL, '2022-03-26 13:38:30', '2022-04-10 15:02:24');
INSERT INTO `message` VALUES ('1648273884336', '1621586602550', NULL, 0, '点赞了', NULL, '1626619855661', NULL, NULL, NULL, '2022-03-26 13:51:24', '2022-03-26 13:51:24');
INSERT INTO `message` VALUES ('1648274202582', '1621586602550', NULL, 0, '点赞了', NULL, '1648273882434', NULL, NULL, NULL, '2022-03-26 13:56:42', '2022-03-26 13:56:42');
INSERT INTO `message` VALUES ('1648274355192', '1621586602550', NULL, 0, '点赞了', NULL, '1644324863225', NULL, NULL, NULL, '2022-03-26 13:59:15', '2022-03-26 13:59:15');
INSERT INTO `message` VALUES ('1648525174538', '1621553753077', NULL, 0, '点赞了', NULL, '1644585383642', NULL, NULL, NULL, '2022-03-29 11:39:34', '2022-03-29 11:39:34');
INSERT INTO `message` VALUES ('1648525176090', '1621553753077', NULL, 0, '点赞了', NULL, '1643939653000', NULL, NULL, NULL, '2022-03-29 11:39:36', '2022-03-29 11:39:36');
INSERT INTO `message` VALUES ('1648549580776', '1626267479156', NULL, 0, '创建了', NULL, NULL, NULL, '1648549580754', NULL, '2022-03-29 18:26:20', '2022-03-29 18:26:20');
INSERT INTO `message` VALUES ('1649078976675', '1621586602550', NULL, 0, '点赞了', NULL, '1635505759251', NULL, NULL, NULL, '2022-04-04 21:29:36', '2022-04-04 21:29:36');
INSERT INTO `message` VALUES ('1649333904072', NULL, '1649333771120', 1, '发布了', '1649333904053', NULL, NULL, NULL, NULL, '2022-04-07 20:18:24', '2022-05-07 14:35:06');
INSERT INTO `message` VALUES ('1649335015205', NULL, '1649333771120', 1, '发布了', '1649335015187', NULL, NULL, NULL, NULL, '2022-04-07 20:36:55', '2022-05-07 15:07:20');
INSERT INTO `message` VALUES ('1649336326849', NULL, '1649335834894', 0, '发布了', '1649336326830', NULL, NULL, NULL, NULL, '2022-04-07 20:58:46', '2022-04-07 20:58:46');
INSERT INTO `message` VALUES ('1649336700179', NULL, '1649336637726', 0, '发布了', '1649336700163', NULL, NULL, NULL, NULL, '2022-04-07 21:05:00', '2022-04-07 21:05:00');
INSERT INTO `message` VALUES ('1649336978875', NULL, '1622072666625', 0, '发布了', '1649336978859', NULL, NULL, NULL, NULL, '2022-04-07 21:09:38', '2022-04-07 21:09:38');
INSERT INTO `message` VALUES ('1649574999570', NULL, '1622072451745', 1, '发布了', '1649574999552', NULL, NULL, NULL, NULL, '2022-04-10 15:16:39', '2022-04-21 15:50:14');
INSERT INTO `message` VALUES ('1649575760505', '1640497617203', NULL, 0, '点赞了', NULL, '1649575745322', NULL, NULL, NULL, '2022-04-10 15:29:20', '2022-04-10 15:29:20');
INSERT INTO `message` VALUES ('1649575776791', '1640497617203', NULL, 0, '点赞了', NULL, '1649575683194', NULL, NULL, NULL, '2022-04-10 15:29:36', '2022-04-10 15:29:36');
INSERT INTO `message` VALUES ('1649575778051', '1640497617203', NULL, 0, '点赞了', NULL, '1649575673960', NULL, NULL, NULL, '2022-04-10 15:29:38', '2022-04-10 15:29:38');
INSERT INTO `message` VALUES ('1649575778903', '1640497617203', NULL, 0, '点赞了', NULL, '1649575664043', NULL, NULL, NULL, '2022-04-10 15:29:38', '2022-04-10 15:29:38');
INSERT INTO `message` VALUES ('1649575780288', '1640497617203', NULL, 0, '点赞了', NULL, '1649575664043', NULL, NULL, NULL, '2022-04-10 15:29:40', '2022-04-10 15:29:40');
INSERT INTO `message` VALUES ('1649575846966', '1640497617203', NULL, 1, '点赞了', NULL, '1636182619005', NULL, NULL, NULL, '2022-04-10 15:30:46', '2022-04-22 14:45:32');
INSERT INTO `message` VALUES ('1649660916720', '1621553753077', NULL, 1, '点赞了', NULL, '1625055305257', NULL, NULL, NULL, '2022-04-11 15:08:36', '2022-04-21 15:47:04');
INSERT INTO `message` VALUES ('1649660964423', '1640498317915', NULL, 1, '点赞了', NULL, '1625055305257', NULL, NULL, NULL, '2022-04-11 15:09:24', '2022-04-21 15:47:43');
INSERT INTO `message` VALUES ('1649661006804', '1626248858763', NULL, 0, '点赞了', NULL, '1625055305257', NULL, NULL, NULL, '2022-04-11 15:10:06', '2022-04-11 15:10:06');
INSERT INTO `message` VALUES ('1649661013799', '1626248858763', NULL, 0, '点赞了', NULL, '1625057356308', NULL, NULL, NULL, '2022-04-11 15:10:13', '2022-04-11 15:10:13');
INSERT INTO `message` VALUES ('1649666716883', '1626267479156', NULL, 1, '创建了', NULL, NULL, NULL, '1649666716862', NULL, '2022-04-11 16:45:16', '2022-04-21 15:51:48');
INSERT INTO `message` VALUES ('1649670187562', '1621586602550', NULL, 0, '点赞了', NULL, '1644585470816', NULL, NULL, NULL, '2022-04-11 17:43:07', '2022-04-11 17:43:07');
INSERT INTO `message` VALUES ('1649670188658', '1621586602550', NULL, 0, '点赞了', NULL, '1636272869724', NULL, NULL, NULL, '2022-04-11 17:43:08', '2022-04-11 17:43:08');
INSERT INTO `message` VALUES ('1649732276045', '1621586602550', NULL, 1, '发布了', NULL, NULL, NULL, NULL, '1649732276030', '2022-04-12 10:57:56', '2022-05-02 10:58:06');
INSERT INTO `message` VALUES ('1649732362183', '1621586602550', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1649732362168', '2022-04-12 10:59:22', '2022-04-12 10:59:22');
INSERT INTO `message` VALUES ('1649734173800', '1626267479156', NULL, 0, '点赞了', NULL, '1649734171532', NULL, NULL, NULL, '2022-04-12 11:29:33', '2022-04-12 11:29:33');
INSERT INTO `message` VALUES ('1649843096228', '1622166913290', NULL, 0, '点赞了', NULL, '1649843004284', NULL, NULL, NULL, '2022-04-13 17:44:56', '2022-04-13 17:44:56');
INSERT INTO `message` VALUES ('1649982202015', NULL, '1649982084489', 0, '发布了', '1649982201990', NULL, NULL, NULL, NULL, '2022-04-15 08:23:22', '2022-04-15 08:23:22');
INSERT INTO `message` VALUES ('1650010726387', '1621586669402', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1650010726370', '2022-04-15 16:18:46', '2022-04-15 16:18:46');
INSERT INTO `message` VALUES ('1650158507987', '1640497948238', NULL, 0, '点赞了', NULL, '1650088585984', NULL, NULL, NULL, '2022-04-17 09:21:47', '2022-04-17 09:21:47');
INSERT INTO `message` VALUES ('1650158515862', '1640497948238', NULL, 0, '点赞了', NULL, '1650089267376', NULL, NULL, NULL, '2022-04-17 09:21:55', '2022-04-17 09:21:55');
INSERT INTO `message` VALUES ('1650159272344', '1621586602550', NULL, 0, '发布了', NULL, NULL, '1650159272328', NULL, NULL, '2022-04-17 09:34:32', '2022-04-17 09:34:32');
INSERT INTO `message` VALUES ('1650159394140', '1621586602550', NULL, 0, '发布了', NULL, NULL, '1650159394116', NULL, NULL, '2022-04-17 09:36:34', '2022-04-17 09:36:34');
INSERT INTO `message` VALUES ('1650160286968', '1621586602550', NULL, 0, '发布了', NULL, NULL, '1650160286946', NULL, NULL, '2022-04-17 09:51:26', '2022-04-17 09:51:26');
INSERT INTO `message` VALUES ('1650160491471', '1621586602550', NULL, 1, '发布了', NULL, NULL, '1650160491450', NULL, NULL, '2022-04-17 09:54:51', '2022-05-07 15:44:49');
INSERT INTO `message` VALUES ('1650524098556', NULL, '1635341685282', 0, '发布了', '1650524098532', NULL, NULL, NULL, NULL, '2022-04-21 14:54:58', '2022-04-21 14:54:58');
INSERT INTO `message` VALUES ('1650524472403', NULL, '1634457674287', 0, '发布了', '1650524472384', NULL, NULL, NULL, NULL, '2022-04-21 15:01:12', '2022-04-21 15:01:12');
INSERT INTO `message` VALUES ('1650524754538', NULL, '1622072283515', 0, '发布了', '1650524754518', NULL, NULL, NULL, NULL, '2022-04-21 15:05:54', '2022-04-21 15:05:54');
INSERT INTO `message` VALUES ('1650524958736', NULL, '1634530730835', 0, '发布了', '1650524958719', NULL, NULL, NULL, NULL, '2022-04-21 15:09:18', '2022-04-21 15:09:18');
INSERT INTO `message` VALUES ('1650533560058', NULL, '1650533473576', 0, '发布了', '1650533560040', NULL, NULL, NULL, NULL, '2022-04-21 17:32:40', '2022-04-21 17:32:40');
INSERT INTO `message` VALUES ('1650611580274', '1650161308411', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1650611580246', '2022-04-22 15:13:00', '2022-04-22 15:13:00');
INSERT INTO `message` VALUES ('1650611997669', '1650161308411', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1650611997653', '2022-04-22 15:19:57', '2022-04-22 15:19:57');
INSERT INTO `message` VALUES ('1650612367395', '1650161308411', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1650612367380', '2022-04-22 15:26:07', '2022-04-22 15:26:07');
INSERT INTO `message` VALUES ('1650612563470', '1650161308411', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1650612563451', '2022-04-22 15:29:23', '2022-04-22 15:29:23');
INSERT INTO `message` VALUES ('1650613406429', '1650161308411', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1650613406414', '2022-04-22 15:43:26', '2022-04-22 15:43:26');
INSERT INTO `message` VALUES ('1650614109767', '1635685284424', NULL, 0, '发布了', NULL, NULL, NULL, NULL, '1650614109749', '2022-04-22 15:55:09', '2022-04-22 15:55:09');
INSERT INTO `message` VALUES ('1650704867725', '1621586669402', NULL, 0, '点赞了', NULL, '1626767435483', NULL, NULL, NULL, '2022-04-23 17:07:47', '2022-04-23 17:07:47');
INSERT INTO `message` VALUES ('1650704868608', '1621586669402', NULL, 0, '点赞了', NULL, '1626098479270', NULL, NULL, NULL, '2022-04-23 17:07:48', '2022-04-23 17:07:48');
INSERT INTO `message` VALUES ('1650704871398', '1621586669402', NULL, 0, '点赞了', NULL, '1626098465521', NULL, NULL, NULL, '2022-04-23 17:07:51', '2022-04-23 17:07:51');
INSERT INTO `message` VALUES ('1650725667299', '1621553753077', NULL, 0, '点赞了', NULL, '1643942414832', NULL, NULL, NULL, '2022-04-23 22:54:27', '2022-04-23 22:54:27');
INSERT INTO `message` VALUES ('1650725668484', '1621553753077', NULL, 0, '点赞了', NULL, '1643942448137', NULL, NULL, NULL, '2022-04-23 22:54:28', '2022-04-23 22:54:28');
INSERT INTO `message` VALUES ('1650771542268', '1621553753077', NULL, 0, '点赞了', NULL, '1649668168562', NULL, NULL, NULL, '2022-04-24 11:39:02', '2022-04-24 11:39:02');
INSERT INTO `message` VALUES ('1650782333459', '1626248858763', NULL, 0, '点赞了', NULL, '1650009500717', NULL, NULL, NULL, '2022-04-24 14:38:53', '2022-04-24 14:38:53');
INSERT INTO `message` VALUES ('1650786424042', NULL, '1650786261435', 0, '发布了', '1650786424016', NULL, NULL, NULL, NULL, '2022-04-24 15:47:04', '2022-04-24 15:47:04');
INSERT INTO `message` VALUES ('1650786613203', NULL, '1650786261435', 0, '发布了', '1650786613182', NULL, NULL, NULL, NULL, '2022-04-24 15:50:13', '2022-04-24 15:50:13');
INSERT INTO `message` VALUES ('1651623219166', '1651480823572', NULL, 0, '创建了', NULL, NULL, NULL, '1651623219117', NULL, '2022-05-04 08:13:39', '2022-05-04 08:13:39');
INSERT INTO `message` VALUES ('1651624031028', '1651480823572', NULL, 0, '创建了', NULL, NULL, NULL, '1651624030999', NULL, '2022-05-04 08:27:11', '2022-05-04 08:27:11');
INSERT INTO `message` VALUES ('1651905190841', '1621553753077', NULL, 0, '点赞了', NULL, '1651905187429', NULL, NULL, NULL, '2022-05-07 14:33:10', '2022-05-07 14:33:10');
INSERT INTO `message` VALUES ('1651907082461', '1621553753077', NULL, 0, '点赞了', NULL, '1650009500717', NULL, NULL, NULL, '2022-05-07 15:04:42', '2022-05-07 15:04:42');
INSERT INTO `message` VALUES ('1651909302558', '1621553753077', NULL, 0, '点赞了', NULL, '1649734307113', NULL, NULL, NULL, '2022-05-07 15:41:42', '2022-05-07 15:41:42');
INSERT INTO `message` VALUES ('1651909303811', '1621553753077', NULL, 0, '点赞了', NULL, '1643942494494', NULL, NULL, NULL, '2022-05-07 15:41:43', '2022-05-07 15:41:43');
INSERT INTO `message` VALUES ('1652618190242', '1621553753077', NULL, 0, '点赞了', NULL, '1636182619005', NULL, NULL, NULL, '2022-05-15 20:36:30', '2022-05-15 20:36:30');
INSERT INTO `message` VALUES ('1652618190882', '1621553753077', NULL, 0, '点赞了', NULL, '1642578676207', NULL, NULL, NULL, '2022-05-15 20:36:30', '2022-05-15 20:36:30');

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `originalname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `picUrl` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `songId`(`songId`) USING BTREE,
  INDEX `moment_ibfk_3`(`tId`) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_ibfk_2` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_ibfk_3` FOREIGN KEY (`tId`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES ('1626076253042', '分享一下小时候的尴尬回忆吧！', '1622167044223', '1640419955763', '1624546320157', '2021-07-12 15:50:53', '2022-05-15 20:27:04', '109951166036930758.jpg', 'image/jpeg', './upload/moment/picture', '1626076253064.jpg', 68304, 'http://localhost:8200/moment/picture?id=1626076253042');
INSERT INTO `moment` VALUES ('1626336182253', '分享一则睡前故事吧！', '1626248858763', '1640419955763', '1624546108864', '2021-07-15 16:03:02', '2022-05-15 20:27:04', '109951166178453369.jpg', 'image/jpeg', './upload/moment/picture', '1626336182276.jpg', 97050, 'http://localhost:8200/moment/picture?id=1626336182253');
INSERT INTO `moment` VALUES ('1626336321467', '蓝天白云，快乐牧场，你在哪里？', '1626253954965', '1640419636221', '1622103223653', '2021-07-15 16:05:21', '2022-05-15 20:27:04', '109951166134408130.jpg', 'image/jpeg', './upload/moment/picture', '1626336321482.jpg', 29807, 'http://localhost:8200/moment/picture?id=1626336321467');
INSERT INTO `moment` VALUES ('1626336578722', '蓝天有多高 ，河水有多长 ，我曾静静地想  ，也曾深深的向往 ，花谢花又开 ，云散云又来  ，只感叹时间  ，走得太快 ，远方啊 ，你那博大的胸怀 ，是否在等着我轻轻的来。', '1621553753077', '1640419701458', '1624549624782', '2021-07-15 16:09:38', '2022-05-15 20:27:04', '12c69add20bbb11ceac508d6e95d198e.jpeg', 'image/jpeg', './upload/moment/picture', '1626336578738.jpeg', 70738, 'http://localhost:8200/moment/picture?id=1626336578722');
INSERT INTO `moment` VALUES ('1626336829843', '如何让你遇见我在我最美丽的时刻，为这我已在佛前求了五百年,求他让我们结一段尘缘。 佛于是把我化作一棵树，长在你必经的路旁， 阳光下慎重地开满了花，朵朵都是我前世的盼望。当你走近请你细听， 那颤抖的叶是我等待的热情，而当你终于无视地走过， 在你身后落了一地的……  朋友啊那不是花瓣，是我凋零的心!', '1621554155356', '1640419701458', '1624547985767', '2021-07-15 16:13:49', '2022-05-15 20:27:04', 'a40746024287cca8722d66a742198b53.jpeg', 'image/jpeg', './upload/moment/picture', '1626336829861.jpeg', 45116, 'http://localhost:8200/moment/picture?id=1626336829843');
INSERT INTO `moment` VALUES ('1626337509488', '马上就要成为一个打工人了，感觉很紧张啊！打工人，打工魂。。', '1621586602550', '1640419561892', '1624546506142', '2021-07-15 16:25:09', '2022-05-15 20:27:04', '7330ee4cca9d179fac261b0041cc49f3.jpeg', 'image/jpeg', './upload/moment/picture', '1626337509504.jpeg', 42715, 'http://localhost:8200/moment/picture?id=1626337509488');
INSERT INTO `moment` VALUES ('1626337800524', '大爱blackpink，喜欢听她们的每一首歌，Lisa，太酷了。', '1621586669402', '1640419561892', '1626272735139', '2021-07-15 16:30:00', '2022-05-15 20:27:04', 'acd49aa88bd78c314b9b7982c661d442.jpeg', 'image/jpeg', './upload/moment/picture', '1626337800539.jpeg', 53385, 'http://localhost:8200/moment/picture?id=1626337800524');
INSERT INTO `moment` VALUES ('1626337998026', '因为一首歌怀念一座城，赵雷的《成都》唱出多少人的回忆，真好听，一首《成都》，让多少人怀念起自己心中的城市呢？', '1625404058174', '1640419636221', '1624546320157', '2021-07-15 16:33:18', '2022-05-15 20:27:04', '4bbd10e2233f001215a1df85b3373cc7.jpeg', 'image/jpeg', './upload/moment/picture', '1626337998044.jpeg', 81464, 'http://localhost:8200/moment/picture?id=1626337998026');
INSERT INTO `moment` VALUES ('1645170142775', '哪来的天生优秀，都是一步一个坑踩过来的。所以，不要气馁呀！', '1621553753077', '1640419636221', '1643938595197', '2022-02-18 15:42:22', '2022-05-15 20:27:04', '109951167057955374.jpg', 'image/jpeg', './upload/moment/picture', '1645170142797.jpg', 10135, 'http://localhost:8200/moment/picture?id=1645170142775');
INSERT INTO `moment` VALUES ('1649734618788', '我们都曾经或多或少地经历过苦难，处在一种相对长期的痛苦和不快乐状态中，但是其实很多时候对于苦难存在这样那样的误解，比较典型的一种是鸡汤式地吹捧，认为苦难是光是修炼是福报，强行寻找意义自我安慰，还有一种是阿Q式的瞒和骗，天真地以为苦难终将被战胜，而不愿去追问苦难本身，或是进行整体性的反思，这方面根据含Q量的不同而因人而异。', '1626267479156', '1640419561892', '1644375432188', '2022-04-12 11:36:58', '2022-05-15 20:27:04', 'e495ce3d5c4ddb4d8001ba5b3ec8f65d.jpeg', 'image/jpeg', './upload/moment/picture', '1649734618814.jpeg', 62478, 'http://localhost:8200/moment/picture?id=1649734618788');
INSERT INTO `moment` VALUES ('1649735874372', '灯塔象征守护、不离不弃、无私奉献和希望。灯塔是建于航道关键部位附近的一种塔状发光航标，是一种固定的航标，其基本作用是引导船舶航行或指示危险区灯塔，其塔上的火光便是航行的希望，代表安全的港湾。', '1621586669402', '1640419561892', '1635503448330', '2022-04-12 11:57:54', '2022-05-15 20:27:04', '60777ac4b2a1aa9dc5f30f094168ffbe.jpeg', 'image/jpeg', './upload/moment/picture', '1649735874394.jpeg', 38317, 'http://localhost:8200/moment/picture?id=1649735874372');
INSERT INTO `moment` VALUES ('1649736336883', '每当黎明的太阳升起，美好的一天又开始了！生活就像一本日历，每过一天就撕去一页，日子都不可以重来，所以珍惜每一天。', '1621586669402', '1640496312923', '1643519328369', '2022-04-12 12:05:36', '2022-05-15 20:27:04', 'e73566545c2d51170b9d4f227d18eb3b.jpeg', 'image/jpeg', './upload/moment/picture', '1649736336908.jpeg', 1291430, 'http://localhost:8200/moment/picture?id=1649736336883');
INSERT INTO `moment` VALUES ('1649742403151', '打造纯洁的体育运动环境、自然生态环境和社会人文环境，推动冬季运动蓬勃发展。冰雪是纯洁的象征，冰雪运动是充满激情和活力的运动', '1635679207853', '1640419955763', '1644374062902', '2022-04-12 13:46:43', '2022-05-15 20:27:04', '1.jpeg', 'image/jpeg', './upload/moment/picture', '1649742403172.jpeg', 143455, 'http://localhost:8200/moment/picture?id=1649742403151');
INSERT INTO `moment` VALUES ('1649746570152', '也许季节的篱笆锁不住时间和空间，时间的年轮不停地旋转着芬芳的岁月，它们不断地塑造着人生的道路。我们就像小船，离开平静的港湾，在大学的海洋中寻找新的向往。', '1621553753077', '1640419701458', '1649335080451', '2022-04-12 14:56:10', '2022-05-15 20:27:04', '1.jpeg', 'image/jpeg', './upload/moment/picture', '1649746570174.jpeg', 103938, 'http://localhost:8200/moment/picture?id=1649746570152');
INSERT INTO `moment` VALUES ('1649752150260', '《Cruel Summer》是由美国流行女歌手泰勒·斯威夫特录唱的一首歌曲，为泰勒·斯威夫特第七张录音室专辑《Lover》收录的第二首歌曲 。该曲入选《滚石》“2019年50首最佳歌曲”榜单的第四位 ', '1621586602550', '1640419955763', '1648273167106', '2022-04-12 16:29:10', '2022-05-15 20:27:04', '1.jpeg', 'image/jpeg', './upload/moment/picture', '1649752150280.jpeg', 103464, 'http://localhost:8200/moment/picture?id=1649752150260');
INSERT INTO `moment` VALUES ('1649752262763', '说起卡莉·蕾·吉普森这个名字很多人可能并不熟悉，但那首洗脑神曲《call me maybe》不少人一听到旋律响起肯定就会忍不住跟着哼唱了', '1621553753077', '1640419955763', '1649335244826', '2022-04-12 16:31:02', '2022-05-15 20:27:04', '1.jpg', 'image/jpeg', './upload/moment/picture', '1649752262780.jpg', 45513, 'http://localhost:8200/moment/picture?id=1649752262763');
INSERT INTO `moment` VALUES ('1650011706848', '往事随风，树影乱，半世流离。采桑归，夕露沾我衣。不知他，可经风雨？捣衣长河堤，年华随水去，惜别一展鲲鹏意', '1621586669402', '1640419636221', '1649982278381', '2022-04-15 16:35:06', '2022-05-15 20:27:04', '1.jpeg', 'image/jpeg', './upload/moment/picture', '1650011706866.jpeg', 85638, 'http://localhost:8200/moment/picture?id=1650011706848');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `delete` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `cId`(`cId`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`cId`) REFERENCES `combo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1649501797216', '1621553753077', '2022-04-09 18:56:37', '88', '1643091252790', 1, 0);
INSERT INTO `order` VALUES ('1649502176000', '1621586602550', '2022-04-09 19:02:56', '158', '1643091264205', 1, 0);
INSERT INTO `order` VALUES ('1649502275486', '1640497948238', '2022-04-09 19:04:35', '88', '1643091252790', 1, 0);
INSERT INTO `order` VALUES ('1649667616522', '1626267479156', '2022-04-11 17:00:16', '88', '1643091252790', 1, 0);
INSERT INTO `order` VALUES ('1650003804168', '1621586669402', '2022-04-15 14:23:24', '45', '1643091239804', 0, 1);
INSERT INTO `order` VALUES ('1650003885584', '1621586669402', '2022-04-15 14:24:45', '158', '1643091264205', 1, 0);
INSERT INTO `order` VALUES ('1650264792433', '1649241745130', '2022-04-18 14:53:12', '88', '1643091252790', 1, 0);
INSERT INTO `order` VALUES ('1650777006035', '1626248858763', '2022-04-24 13:10:06', '45', '1643091239804', 0, 0);
INSERT INTO `order` VALUES ('1651583862112', '1651480823572', '2022-05-03 21:17:42', '88', '1643091252790', 1, 0);
INSERT INTO `order` VALUES ('1651660577893', '1625404058174', '2022-05-04 18:36:17', '158', '1643091264205', 1, 0);
INSERT INTO `order` VALUES ('1651660674245', '1640498470004', '2022-05-04 18:37:54', '45', '1643091239804', 1, 0);
INSERT INTO `order` VALUES ('1652000887835', '1621553753077', '2022-05-08 17:08:07', '16', '1643091198654', 0, 0);
INSERT INTO `order` VALUES ('1652072792964', '1652072769271', '2022-05-09 13:06:32', '88', '1643091252790', 1, 0);
INSERT INTO `order` VALUES ('1652173163362', '1621553753077', '2022-05-10 16:59:23', '88', '1643091252790', 0, 0);
INSERT INTO `order` VALUES ('1652174288040', '1640497296254', '2022-05-10 17:18:08', '88', '1643091252790', 0, 0);
INSERT INTO `order` VALUES ('1652572973713', '1621553753077', '2022-05-15 08:02:53', '45', '1643091239804', 0, 0);
INSERT INTO `order` VALUES ('1652575707481', '1621553753077', '2022-05-15 08:48:27', '88', '1643091252790', 0, 0);
INSERT INTO `order` VALUES ('1653465241271', '1644202264813', '2022-05-25 15:54:01', '88', '1643091252790', 0, 1);
INSERT INTO `order` VALUES ('1653465324826', '1644202264813', '2022-05-25 15:55:24', '88', '1643091252790', 0, 1);
INSERT INTO `order` VALUES ('1653465381994', '1644202264813', '2022-05-25 15:56:21', '88', '1643091252790', 1, 0);
INSERT INTO `order` VALUES ('1653465479649', '1644202264813', '2022-05-25 15:57:59', '45', '1643091239804', 0, 0);

-- ----------------------------
-- Table structure for playlist
-- ----------------------------
DROP TABLE IF EXISTS `playlist`;
CREATE TABLE `playlist`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `playCount` int NULL DEFAULT 0,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coverUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlist
-- ----------------------------
INSERT INTO `playlist` VALUES ('1623424402288', '到点了该听歌了', '专属你的歌曲啊', '1621553753077', 70, '2021-09-11 23:13:22', '2022-05-25 15:52:42', 'http://localhost:8200/playlist/cover?id=1623424402288');
INSERT INTO `playlist` VALUES ('1623424503525', '你是我绕不开的回忆', '你是我绕不开的回忆', '1621553753077', 58, '2021-09-11 23:15:03', '2022-05-26 15:16:29', 'http://localhost:8200/playlist/cover?id=1623424503525');
INSERT INTO `playlist` VALUES ('1623425528589', '十九岁的某一天', '十九岁的某一天', '1621586602550', 6, '2021-09-11 23:32:08', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623425528589');
INSERT INTO `playlist` VALUES ('1623425577321', '民谣小酒馆', '民谣小酒馆', '1621586602550', 179, '2021-09-11 23:32:57', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623425577321');
INSERT INTO `playlist` VALUES ('1623425633574', '每个懂事儿的人都是宝藏', '每个懂事儿的人都是宝藏', '1621586602550', 0, '2021-09-11 23:33:53', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623425633574');
INSERT INTO `playlist` VALUES ('1623425702147', '旋律简单，却刚好喜欢', '旋律简单却刚好喜欢', '1621586602550', 19, '2021-09-11 23:35:02', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623425702147');
INSERT INTO `playlist` VALUES ('1623425805027', '恋爱不是目的，遇见才是', '恋爱不是目的，遇见才是', '1621586669402', 0, '2021-09-11 23:36:45', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623425805027');
INSERT INTO `playlist` VALUES ('1623425883687', '趋于完美是我们人生的意义', '趋于完美是我们人生的意义', '1621586669402', 1, '2021-09-11 23:38:03', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623425883687');
INSERT INTO `playlist` VALUES ('1623425979492', '你从没留意过我', '你从没留意过我', '1621586669402', 0, '2021-09-11 23:39:39', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623425979492');
INSERT INTO `playlist` VALUES ('1623426048988', '坐下，坐上我的副驾驶', '坐下，坐上我的副驾驶', '1621586669402', 1, '2021-09-11 23:40:48', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623426048988');
INSERT INTO `playlist` VALUES ('1623426209601', '以后要在崭新的生活里热爱自己', '以后要在崭新的生活里热爱自己', '1621554155356', 0, '2021-09-11 23:43:29', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623426209601');
INSERT INTO `playlist` VALUES ('1623426299066', '保持对生活的期待，把每天都过得热气腾腾', '保持对生活的期待，把每天都过得热气腾腾', '1621554155356', 2, '2021-09-11 23:44:59', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623426299066');
INSERT INTO `playlist` VALUES ('1623426341733', '道路且长来日可期，脚步慢一点也无妨', '道路且长来日可期，脚步慢一点也无妨', '1621554155356', 0, '2021-09-11 23:45:41', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623426341733');
INSERT INTO `playlist` VALUES ('1623426423882', '好听到可以单曲循环', '好听到可以单曲循环', '1621554155356', 0, '2021-09-11 23:47:03', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1623426423882');
INSERT INTO `playlist` VALUES ('1624975445013', '如果再给我一次机会你还会选择走吗', '如果再给我一次机会你还会选择走吗', '1621586602550', 10, '2021-09-29 22:04:05', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1624975445013');
INSERT INTO `playlist` VALUES ('1624975506830', '品味相投的人會互相吸引', '品味相投的人會互相吸引', '1621586602550', 0, '2021-09-29 22:05:06', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1624975506830');
INSERT INTO `playlist` VALUES ('1624975559551', '路还长，温柔的事一定会发生', '路还长，温柔的事一定会发生', '1621586602550', 0, '2021-09-29 22:05:59', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1624975559551');
INSERT INTO `playlist` VALUES ('1624975632891', '人生最美是清欢', '人生最美是清欢', '1621586602550', 13, '2021-09-29 22:07:12', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1624975632891');
INSERT INTO `playlist` VALUES ('1624975688111', '喜欢是常态，彼此喜欢是上天恩赐', '喜欢是常态，彼此喜欢是上天恩赐', '1621586602550', 1, '2021-09-29 22:08:08', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1624975688111');
INSERT INTO `playlist` VALUES ('1626253662753', '百万评论热歌全集', '以前听歌，听的是旋律\n后来听歌，听的是歌词\n再后来听歌，听的是故事\n现在听歌，听的是自己\n初闻不知曲中意，再听已是曲中人\n我们都已经芳华已逝，谁的成长没有过难忘的回忆', '1626248858763', 4, '2021-09-14 17:07:42', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626253662753');
INSERT INTO `playlist` VALUES ('1626269145664', '鬼畜【精神污染】整活专用（吃席了兄弟们）', '整活剪辑专用，网络流行音乐，快叫你兄弟来吃席，都摇起来！', '1626267479156', 0, '2021-09-14 21:25:45', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626269145664');
INSERT INTO `playlist` VALUES ('1626269205422', '那些好听但却记不起歌名的歌曲', '那些好听却记不起歌名的歌曲', '1626267479156', 5, '2021-09-14 21:26:45', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626269205422');
INSERT INTO `playlist` VALUES ('1626269244918', '失恋记忆：曾经的誓言都已成为谎言', '终究是我太傻，以为有了一场爱情就会有美好的结局。终于到了要分别的时候，我反而觉得有点欣慰。。。', '1626267479156', 0, '2021-09-14 21:27:24', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626269244918');
INSERT INTO `playlist` VALUES ('1626269291404', '海的那边是海吗？', ' 海的那边是海吗？\n\n你的心里还是我吗？', '1626267479156', 4, '2021-09-14 21:28:11', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626269291404');
INSERT INTO `playlist` VALUES ('1626269334408', '请把烦恼放一放，一起与治愈的歌相伴', '细心观察你就会发现，生活中的那些吉光片羽无处不在。它可能是你下班路上疲惫不堪时，别人让的一个座位；你阴天打算出门，忽然晴空万里的惊喜；可能是你负能量爆棚时，朋友爱人及时的安慰。', '1626267479156', 13, '2021-09-14 21:28:54', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626269334408');
INSERT INTO `playlist` VALUES ('1626270935470', '晚安曲｜人间百味日月星河 浪漫与你共赴', ' 佛罗伦萨的玫瑰冗长枝长\n文艺复兴的浪漫攀升萌芽\n浩瀚星云裹挟着热恋\n嵌入意大利的暖风中\n在浪漫而温柔的音乐中\n晚安好梦', '1621553753077', 1, '2021-09-14 21:55:35', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626270935470');
INSERT INTO `playlist` VALUES ('1626271101777', '浪漫序幕:路的尽头是爱情邂逅的开端', '人的一生中会遇到形形色色的人，如何让你我的相遇变得尤为浪漫，这是个值得探讨的问题。在电影中是怎样去形容那温柔而戏剧的相遇呢，当相遇的光尾随在你身后，当思绪偏离了航线', '1621553753077', 6, '2021-09-14 21:58:21', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626271101777');
INSERT INTO `playlist` VALUES ('1626271168770', '迷人嗓音｜放下世俗的眼光 去追随你的光', '你要以马不停蹄的姿态去迎接未来，带着远方的期待前行，不顾艳阳灼烧，不惧风雨癫狂，也许你错过了今天的落日，但你可以早起去追逐下一个黎明。', '1621553753077', 14, '2021-09-14 21:59:28', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626271168770');
INSERT INTO `playlist` VALUES ('1626271309545', '重逢大概是时间给予我们不可说的温柔', '重逢是橘子味棒棒糖的甜腻\n是繁星决定不再躲闪的勇气\n是风吹过来带走的少年气息\n是我爱你\n我想你了', '1621553753077', 0, '2021-09-14 22:01:49', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626271309545');
INSERT INTO `playlist` VALUES ('1626358080106', '愿夏日漫长，永不停歇', '宫崎骏曾经说过：当陪你的那个人要下车时，即使你在不舍，你也要心存感激，挥手告别，每个人的故事，开头都是极具温柔的，但往往故事的结尾都配不上整个开头，记住，每一个意难平的结果，都是我们最好的', '1626253954965', 2, '2021-09-15 22:08:00', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626358080106');
INSERT INTO `playlist` VALUES ('1626358128252', '一个人越喜欢你 问的问题就会越幼稚', '其你。实这个世界偶尔也擅长创造惊喜，我们会遇到温柔的事物，温柔的人，对这个世界也不必过于紧张，毕竟一切都终有归途，就像行星属于宇宙，希望我也能找到', '1626253954965', 0, '2021-09-15 22:08:48', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626358128252');
INSERT INTO `playlist` VALUES ('1626444193407', '暗恋似盲盒，打开之前永远是谜', '有人说暗恋，是一场痛并快乐的旅途。\n\n爱情是一场勇敢者的游戏。而暗恋就如盲盒，打开之前里面的滋味是苦是甜无人知晓。', '1626352819737', 3, '2021-09-16 22:03:13', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1626444193407');
INSERT INTO `playlist` VALUES ('1635338688119', '不知道算是谁的错，两个人变得话不多', ' 拼尽全力的结局也可能不尽人意', '1625404058174', 1, '2021-10-27 20:44:48', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1635338688119');
INSERT INTO `playlist` VALUES ('1635429991884', '神仙翻唱：超好听的翻唱', '喜欢歌单的可以点个关注哟\n此歌单推荐翻唱歌曲\n“喜欢一首歌会单曲循环\n爱上一个人会不断原谅\n可是歌听腻了就会切掉\n所以人爱累了', '1622166913290', 87, '2021-10-28 22:06:31', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1635429991884');
INSERT INTO `playlist` VALUES ('1635679467858', '美国乡村音乐44首经典冠军曲', '网上的原歌单全部都是错别字，让我这种菜鸟搜得好辛苦啊...', '1635679207853', 40, '2021-10-31 19:24:27', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1635679467858');
INSERT INTO `playlist` VALUES ('1635679507213', '好听吗？好听就是好歌/各国好听曲目小杂烩', '音乐是时光机器！！！', '1635679207853', 39, '2021-10-31 19:25:07', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1635679507213');
INSERT INTO `playlist` VALUES ('1635679540043', '约会在星期天晚上 氛围感拉满', ' 嘘 浪漫无需多言\n烛光晚餐\n二位请慢用', '1635679207853', 73, '2021-10-31 19:25:40', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1635679540043');
INSERT INTO `playlist` VALUES ('1635679578890', '边路打野专属伤感BGM', ' 有一种温柔叫橘右京 有一种无敌叫马超、', '1635679207853', 0, '2021-10-31 19:26:18', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1635679578890');
INSERT INTO `playlist` VALUES ('1635685505946', '减压纯音乐：驱散学习的小烦恼', '人生苦短，行走在人生路上，总会有许多得失和起落。', '1635685284424', 0, '2021-10-31 21:05:05', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1635685505946');
INSERT INTO `playlist` VALUES ('1636034772080', '追忆经典8090 ，每一首歌都有一个故事！', '经典永不褪色，每首歌曲都能勾起点点滴滴的回忆，那时候你的MP3容量够吗？追忆经典8090 ，一转眼十几年过去了，仿佛就像在昨天一样', '1622167044223', 31, '2021-11-04 22:06:12', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1636034772080');
INSERT INTO `playlist` VALUES ('1643517085989', '写作业 学习 做题', '歌单曲目大多以轻音乐/纯音乐为主，部分带人声的歌曲旋律都比较安静舒缓不会太噪！', '1640497948238', 145, '2022-01-30 12:31:25', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643517085989');
INSERT INTO `playlist` VALUES ('1643522225014', ' “我尽力喜欢过,可聚散不由我.” ', '这次不怨你 我得怨我忠于自己', '1640497948238', 3, '2022-01-30 13:57:05', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643522225014');
INSERT INTO `playlist` VALUES ('1643522294080', '一个水瓶座的听歌列表', '幸福不是结尾，不幸才是，这世界上没有从头到尾的幸福', '1640497948238', 0, '2022-01-30 13:58:14', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643522294080');
INSERT INTO `playlist` VALUES ('1643522428342', '青春回忆杀', '随着时间的流逝，在不知不觉中，人和事物都在变化，结果无非就是变好与变坏。但是，记忆里的那些刻骨铭心人和事物是不变的', '1640497948238', 0, '2022-01-30 14:00:28', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643522428342');
INSERT INTO `playlist` VALUES ('1643522638202', '通勤路上不孤单！华语情歌来相伴', '难得让自己能够放松的时刻，可能是在下班的地铁公交上，上班行走的路上，这个时候就需要给自己戴上耳机放一些歌曲，享受片刻；有音乐相伴，上下班的路上也不会孤单。\n#年终限定奖#', '1635685284424', 46, '2022-01-30 14:03:58', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643522638202');
INSERT INTO `playlist` VALUES ('1643522716214', '周末宅家必备：一个人也能解决无聊', '我理想的状态是:在下雨天的时候，跟喜欢的人一起宅在家，躺在床上靠在他怀里，一起看着喜欢的电影，讨论着剧情和男女主，而在晴天的时候一起去海边散步，一起看日落，一起看着对方抑制不住喜悦的笑！', '1635685284424', 1, '2022-01-30 14:05:16', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643522716214');
INSERT INTO `playlist` VALUES ('1643522773880', '[日系古灵精怪]我们就不要好好唱歌', '古灵精怪，俏皮可爱，可是不分男女的呢~你说是不是？', '1635685284424', 0, '2022-01-30 14:06:13', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643522773880');
INSERT INTO `playlist` VALUES ('1643937860377', '你是人间的怦然心动', '精选2021年最火爆热歌，记得收藏哦', '1640497617203', 1, '2022-02-04 09:24:20', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643937860377');
INSERT INTO `playlist` VALUES ('1643937966776', '30秒入睡法则｜对世界说晚安', '还在为睡不着而烦恼吗？\n轻音乐这个宝藏可不能错过\n闭上眼睛\n放首轻音乐\n伴你一夜好眠。', '1640497617203', 0, '2022-02-04 09:26:06', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643937966776');
INSERT INTO `playlist` VALUES ('1643938110834', '一首温暖歌谣：送给春节打工人', '又是一年春节到，有的人回家过年；有的人因为工作学习原因，只能坚守岗位，不能回家过年。他们用无私奉献的精神，感染者每个人。让我们一起听这些温暖治愈的歌曲，为千千万万的春节打工人加油，春节快乐！', '1640497617203', 31, '2022-02-04 09:28:30', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643938110834');
INSERT INTO `playlist` VALUES ('1643938967613', '温暖情歌：你是我疲惫生活中的希望与糖', '我在山河间找路，用短暂的生命贴一贴这颗星球的嶙峋一角，只有你一直常伴身旁，陪我跨过四季与山海。你是我疲惫生活中的希望和糖，看到你我便不自觉嘴角上扬。', '1640497617203', 0, '2022-02-04 09:42:47', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643938967613');
INSERT INTO `playlist` VALUES ('1643939055617', '经典老歌 | 一首歌勾起一代回忆', '你曾为谁痴，为谁狂；为谁流泪，红了眼眶', '1640497617203', 0, '2022-02-04 09:44:15', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1643939055617');
INSERT INTO `playlist` VALUES ('1644202412158', '一个射手座的听歌列表', '春风洋溢着你，家人关心你，爱滋润着你，财神系着你，朋友忠于你，我这祝福你，幸运之星永远照着你。', '1644202264813', 1, '2022-02-07 10:53:32', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1644202412158');
INSERT INTO `playlist` VALUES ('1644202455593', '一个白羊座的听歌列表', '生活只要真实、踏实，并且一直在变好，我们就应该知足和感恩', '1644202264813', 2, '2022-02-07 10:54:15', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1644202455593');
INSERT INTO `playlist` VALUES ('1644202494769', '说唱注入情感那一刻才是灵魂', '当说唱遇到情感所碰撞出的火花你来听了吗？', '1644202264813', 0, '2022-02-07 10:54:54', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1644202494769');
INSERT INTO `playlist` VALUES ('1644202533965', '超好听的小众歌单', '超好听的小众歌单', '1644202264813', 3, '2022-02-07 10:55:33', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1644202533965');
INSERT INTO `playlist` VALUES ('1644202716412', '灵魂火热|国产摇滚点亮生命史诗', '这就是摇滚，他们拥有最赤诚的灵魂， 坚决与这个娱乐至死的年代背道而驰。 生命因摇滚而绽放，生活因摇滚而火热。 所有不羁和美好也不足以形容这热烈的音乐情感。 摇滚乐将迎来自己最好的时代！', '1644202264813', 0, '2022-02-07 10:58:36', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1644202716412');
INSERT INTO `playlist` VALUES ('1644202754330', '拽姐的美式甜心说唱', '婊里婊气我好爱', '1644202264813', 1, '2022-02-07 10:59:14', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1644202754330');
INSERT INTO `playlist` VALUES ('1644202796635', '日子需要我们积极向上', ' 繁华落尽，我心中仍有花落的声音，一朵一朵，在无人的山间轻轻飘落', '1644202264813', 54, '2022-02-07 10:59:56', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1644202796635');
INSERT INTO `playlist` VALUES ('1644202895296', '分开之后，哪里都是你', '我忘掉你的所有，风里雨里一直大步往前走，我又怎么能够忘掉你的温柔', '1644202264813', 0, '2022-02-07 11:01:35', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1644202895296');
INSERT INTO `playlist` VALUES ('1644286962553', '生命中有太多遗憾，岁月里有太多伤感', '生命中有太多遗憾，岁月里有太多伤感。在我们的有生之年，去好好地把握自己的爱，去好好地爱人，也去好好地对待别人的爱。', '1621586602550', 2, '2022-02-08 10:22:42', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1644286962553');
INSERT INTO `playlist` VALUES ('1648549580754', '温柔无须多言丨用心感受美好生活', ' 音乐百态，今日份温柔姿态给你棉花般体贴呵护', '1626267479156', 83, '2022-03-29 18:26:20', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1648549580754');
INSERT INTO `playlist` VALUES ('1649666716862', '怀旧经典100首｜谁的青春不迷茫', '［美好春天］谁的青春不迷茫，谁的青春不曾彷徨.', '1626267479156', 102, '2022-04-11 16:45:16', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1649666716862');
INSERT INTO `playlist` VALUES ('1650161197364', '经典老歌点唱机：回忆青葱岁月', '老歌点唱，每一首都是满满回忆。', '1621586602550', 1, '2022-04-17 10:06:37', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1650161197364');
INSERT INTO `playlist` VALUES ('1650240047485', '轻松周末｜慵懒的午后时光静谧美好', ' 耳机线像是输液管，听音乐的时候很像生病打点滴，是一个治愈的过程', '1621586669402', 0, '2022-04-18 08:00:47', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1650240047485');
INSERT INTO `playlist` VALUES ('1651623219117', '华语励志：步履不停，奔赴韶华', '带着四月的未完成，在五月奔跑起来，即使道路泥泞，也会收获遍野的烂漫。歌单选择了励志国语歌曲，五月是劳动的月份也是满怀收获的月份。再一次努力一回吧', '1651480823572', 0, '2022-05-04 08:13:39', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1651623219117');
INSERT INTO `playlist` VALUES ('1651624030999', '流量钞票一曲打尽！', '  潮店都在用的BGM，客流嗖嗖涨', '1651480823572', 0, '2022-05-04 08:27:11', '2022-05-15 20:27:31', 'http://localhost:8200/playlist/cover?id=1651624030999');

-- ----------------------------
-- Table structure for playlist_cate
-- ----------------------------
DROP TABLE IF EXISTS `playlist_cate`;
CREATE TABLE `playlist_cate`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlist_cate
-- ----------------------------
INSERT INTO `playlist_cate` VALUES ('1622200582838', '流行');
INSERT INTO `playlist_cate` VALUES ('1622200602367', '摇滚');
INSERT INTO `playlist_cate` VALUES ('1622200609191', '古典');
INSERT INTO `playlist_cate` VALUES ('1622200622284', '民谣');
INSERT INTO `playlist_cate` VALUES ('1622200627749', '电子');
INSERT INTO `playlist_cate` VALUES ('1623426523580', '华语');
INSERT INTO `playlist_cate` VALUES ('1626271021088', '欧美');
INSERT INTO `playlist_cate` VALUES ('1626271043956', '浪漫');
INSERT INTO `playlist_cate` VALUES ('1645684428919', '清新');

-- ----------------------------
-- Table structure for playlist_category
-- ----------------------------
DROP TABLE IF EXISTS `playlist_category`;
CREATE TABLE `playlist_category`  (
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cateId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`pId`, `cateId`) USING BTREE,
  INDEX `cateId`(`cateId`) USING BTREE,
  CONSTRAINT `playlist_category_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `playlist_category_ibfk_2` FOREIGN KEY (`cateId`) REFERENCES `playlist_cate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlist_category
-- ----------------------------
INSERT INTO `playlist_category` VALUES ('1623424402288', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1623424503525', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1623425528589', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1623425577321', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1623425633574', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1623425702147', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1623425883687', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1623426048988', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1624975559551', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1624975632891', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1624975688111', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1626253662753', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1626269205422', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1626269291404', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1626269334408', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1626271168770', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1626358080106', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1626358128252', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1626444193407', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1635338688119', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1635429991884', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1635679507213', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1635679578890', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1635685505946', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1643517085989', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1643522225014', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1643522294080', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1643522428342', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1643522638202', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1643522773880', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1643938110834', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1643938967613', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1643939055617', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1644202533965', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1644202716412', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1644202754330', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1648549580754', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1651623219117', '1622200582838');
INSERT INTO `playlist_category` VALUES ('1623425702147', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1623425805027', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1623425979492', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1623426341733', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1626269145664', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1635679467858', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1643522716214', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1643939055617', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1644202494769', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1644202533965', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1644202716412', '1622200602367');
INSERT INTO `playlist_category` VALUES ('1623424402288', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1623425633574', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1623425702147', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1623425883687', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1623426209601', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1624975559551', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1636034772080', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1644202796635', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1644202895296', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1650161197364', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1651624030999', '1622200609191');
INSERT INTO `playlist_category` VALUES ('1623425528589', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1623425577321', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1623425805027', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1623425979492', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1623426048988', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1623426299066', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1623426341733', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1623426423882', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1635679467858', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1644202455593', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1644202895296', '1622200622284');
INSERT INTO `playlist_category` VALUES ('1623424503525', '1622200627749');
INSERT INTO `playlist_category` VALUES ('1623425577321', '1622200627749');
INSERT INTO `playlist_category` VALUES ('1623425883687', '1622200627749');
INSERT INTO `playlist_category` VALUES ('1623426048988', '1622200627749');
INSERT INTO `playlist_category` VALUES ('1626253662753', '1622200627749');
INSERT INTO `playlist_category` VALUES ('1626269145664', '1622200627749');
INSERT INTO `playlist_category` VALUES ('1626270935470', '1622200627749');
INSERT INTO `playlist_category` VALUES ('1643522428342', '1622200627749');
INSERT INTO `playlist_category` VALUES ('1644202754330', '1622200627749');
INSERT INTO `playlist_category` VALUES ('1651624030999', '1622200627749');
INSERT INTO `playlist_category` VALUES ('1623424402288', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1623425528589', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1623425633574', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1623425805027', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1623426423882', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1624975445013', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1624975688111', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1626269244918', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1626269334408', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1636034772080', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1643517085989', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1643937860377', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1644202412158', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1644202716412', '1623426523580');
INSERT INTO `playlist_category` VALUES ('1623424503525', '1626271021088');
INSERT INTO `playlist_category` VALUES ('1626271168770', '1626271021088');
INSERT INTO `playlist_category` VALUES ('1626271309545', '1626271021088');
INSERT INTO `playlist_category` VALUES ('1643937860377', '1626271021088');
INSERT INTO `playlist_category` VALUES ('1624975445013', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1626271101777', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1626358128252', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1635679507213', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1635679540043', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1635679578890', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1643522428342', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1643937860377', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1643937966776', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1643938967613', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1644202455593', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1644202533965', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1644202754330', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1644202895296', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1644286962553', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1649666716862', '1626271043956');
INSERT INTO `playlist_category` VALUES ('1624975632891', '1645684428919');
INSERT INTO `playlist_category` VALUES ('1626444193407', '1645684428919');
INSERT INTO `playlist_category` VALUES ('1635338688119', '1645684428919');
INSERT INTO `playlist_category` VALUES ('1644202412158', '1645684428919');
INSERT INTO `playlist_category` VALUES ('1644202796635', '1645684428919');
INSERT INTO `playlist_category` VALUES ('1644286962553', '1645684428919');
INSERT INTO `playlist_category` VALUES ('1648549580754', '1645684428919');
INSERT INTO `playlist_category` VALUES ('1650240047485', '1645684428919');

-- ----------------------------
-- Table structure for playlist_cover
-- ----------------------------
DROP TABLE IF EXISTS `playlist_cover`;
CREATE TABLE `playlist_cover`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT 0,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pId`(`pId`) USING BTREE,
  CONSTRAINT `playlist_cover_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlist_cover
-- ----------------------------
INSERT INTO `playlist_cover` VALUES ('1623424402322', '1623424402288', '到点了该听歌了.jpg', 'image/jpeg', './upload/playlist/cover', '1623424402317.jpg', 6380, '2021-06-11 23:13:22', '2021-06-11 23:13:22');
INSERT INTO `playlist_cover` VALUES ('1623424503553', '1623424503525', '你是我绕不开的回忆.jpg', 'image/jpeg', './upload/playlist/cover', '1623424503550.jpg', 8800, '2021-06-11 23:15:03', '2021-06-11 23:15:03');
INSERT INTO `playlist_cover` VALUES ('1623425528617', '1623425528589', '十九岁的某一天.jpg', 'image/jpeg', './upload/playlist/cover', '1623425528616.jpg', 5173, '2021-06-11 23:32:08', '2021-06-11 23:32:08');
INSERT INTO `playlist_cover` VALUES ('1623425577353', '1623425577321', '民谣小酒馆.jpg', 'image/jpeg', './upload/playlist/cover', '1623425577351.jpg', 30874, '2021-06-11 23:32:57', '2021-06-11 23:32:57');
INSERT INTO `playlist_cover` VALUES ('1623425633598', '1623425633574', '每个懂事儿的人都是宝藏.jpg', 'image/jpeg', './upload/playlist/cover', '1623425633597.jpg', 38556, '2021-06-11 23:33:53', '2021-06-11 23:33:53');
INSERT INTO `playlist_cover` VALUES ('1623425702170', '1623425702147', '旋律简单却刚好喜欢.jpg', 'image/jpeg', './upload/playlist/cover', '1623425702168.jpg', 36255, '2021-06-11 23:35:02', '2021-06-11 23:35:02');
INSERT INTO `playlist_cover` VALUES ('1623425805050', '1623425805027', '恋爱不是目的，遇见才是.jpg', 'image/jpeg', './upload/playlist/cover', '1623425805049.jpg', 8492, '2021-06-11 23:36:45', '2021-06-11 23:36:45');
INSERT INTO `playlist_cover` VALUES ('1623425883713', '1623425883687', '趋于完美是我们人生的意义.jpg', 'image/jpeg', './upload/playlist/cover', '1623425883711.jpg', 4503, '2021-06-11 23:38:03', '2021-06-11 23:38:03');
INSERT INTO `playlist_cover` VALUES ('1623425979516', '1623425979492', '你从没留意过我.jpg', 'image/jpeg', './upload/playlist/cover', '1623425979514.jpg', 8235, '2021-06-11 23:39:39', '2021-06-11 23:39:39');
INSERT INTO `playlist_cover` VALUES ('1623426049012', '1623426048988', '坐下，坐上我的副驾驶.jpg', 'image/jpeg', './upload/playlist/cover', '1623426049011.jpg', 9027, '2021-06-11 23:40:49', '2021-06-11 23:40:49');
INSERT INTO `playlist_cover` VALUES ('1623426209626', '1623426209601', '以后要在崭新的生活里热爱自己.jpg', 'image/jpeg', './upload/playlist/cover', '1623426209624.jpg', 6976, '2021-06-11 23:43:29', '2021-06-11 23:43:29');
INSERT INTO `playlist_cover` VALUES ('1623426299091', '1623426299066', '保持对生活的期待，把每天都过得热气腾腾.jpg', 'image/jpeg', './upload/playlist/cover', '1623426299090.jpg', 11187, '2021-06-11 23:44:59', '2021-06-11 23:44:59');
INSERT INTO `playlist_cover` VALUES ('1623426341757', '1623426341733', '道路且长来日可期，脚步慢一点也无妨.jpg', 'image/jpeg', './upload/playlist/cover', '1623426341756.jpg', 29135, '2021-06-11 23:45:41', '2021-06-11 23:45:41');
INSERT INTO `playlist_cover` VALUES ('1623426423903', '1623426423882', '好听到可以单曲循环.jpg', 'image/jpeg', './upload/playlist/cover', '1623426423902.jpg', 3412, '2021-06-11 23:47:03', '2021-06-11 23:47:03');
INSERT INTO `playlist_cover` VALUES ('1624975445037', '1624975445013', '109951165641456117.jpg', 'image/jpeg', './upload/playlist/cover', '1624975445035.jpg', 3503, '2021-06-29 22:04:05', '2021-06-29 22:04:05');
INSERT INTO `playlist_cover` VALUES ('1624975506846', '1624975506830', '109951165760595011.jpg', 'image/jpeg', './upload/playlist/cover', '1624975506845.jpg', 31770, '2021-06-29 22:05:06', '2021-06-29 22:05:06');
INSERT INTO `playlist_cover` VALUES ('1624975559568', '1624975559551', '109951165733262236.jpg', 'image/jpeg', './upload/playlist/cover', '1624975559566.jpg', 4706, '2021-06-29 22:05:59', '2021-06-29 22:05:59');
INSERT INTO `playlist_cover` VALUES ('1624975632904', '1624975632891', '109951165912855102.jpg', 'image/jpeg', './upload/playlist/cover', '1624975632903.jpg', 6960, '2021-06-29 22:07:12', '2021-06-29 22:07:12');
INSERT INTO `playlist_cover` VALUES ('1624975688126', '1624975688111', '109951165928482032.jpg', 'image/jpeg', './upload/playlist/cover', '1624975688125.jpg', 3958, '2021-06-29 22:08:08', '2021-06-29 22:08:08');
INSERT INTO `playlist_cover` VALUES ('1626253662770', '1626253662753', '109951164726735349.jpg', 'image/jpeg', './upload/playlist/cover', '1626253662769.jpg', 4328, '2021-07-14 17:07:42', '2021-07-14 17:07:42');
INSERT INTO `playlist_cover` VALUES ('1626269145683', '1626269145664', '109951165948209673.jpg', 'image/jpeg', './upload/playlist/cover', '1626269145681.jpg', 8013, '2021-07-14 21:25:45', '2021-07-14 21:25:45');
INSERT INTO `playlist_cover` VALUES ('1626269205439', '1626269205422', '109951165725971308.jpg', 'image/jpeg', './upload/playlist/cover', '1626269205438.jpg', 11449, '2021-07-14 21:26:45', '2021-07-14 21:26:45');
INSERT INTO `playlist_cover` VALUES ('1626269244934', '1626269244918', '109951166043383338.jpg', 'image/jpeg', './upload/playlist/cover', '1626269244933.jpg', 9422, '2021-07-14 21:27:24', '2021-07-14 21:27:24');
INSERT INTO `playlist_cover` VALUES ('1626269291418', '1626269291404', '109951166073137894.jpg', 'image/jpeg', './upload/playlist/cover', '1626269291417.jpg', 50740, '2021-07-14 21:28:11', '2021-07-14 21:28:11');
INSERT INTO `playlist_cover` VALUES ('1626269334423', '1626269334408', '109951165850854348.jpg', 'image/jpeg', './upload/playlist/cover', '1626269334422.jpg', 45409, '2021-07-14 21:28:54', '2021-07-14 21:28:54');
INSERT INTO `playlist_cover` VALUES ('1626270935489', '1626270935470', '109951166151818064.jpg', 'image/jpeg', './upload/playlist/cover', '1626270935486.jpg', 8355, '2021-07-14 21:55:35', '2021-07-14 21:55:35');
INSERT INTO `playlist_cover` VALUES ('1626271101791', '1626271101777', '109951166141308424.jpg', 'image/jpeg', './upload/playlist/cover', '1626271101790.jpg', 7380, '2021-07-14 21:58:21', '2021-07-14 21:58:21');
INSERT INTO `playlist_cover` VALUES ('1626271168784', '1626271168770', '109951166088081703.jpg', 'image/jpeg', './upload/playlist/cover', '1626271168783.jpg', 10133, '2021-07-14 21:59:28', '2021-07-14 21:59:28');
INSERT INTO `playlist_cover` VALUES ('1626271309566', '1626271309545', '109951166090752513.jpg', 'image/jpeg', './upload/playlist/cover', '1626271309565.jpg', 8587, '2021-07-14 22:01:49', '2021-07-14 22:01:49');
INSERT INTO `playlist_cover` VALUES ('1626358080127', '1626358080106', '109951166158240112.jpg', 'image/jpeg', './upload/playlist/cover', '1626358080124.jpg', 6502, '2021-07-15 22:08:00', '2021-07-15 22:08:00');
INSERT INTO `playlist_cover` VALUES ('1626358128266', '1626358128252', '109951166154369324.jpg', 'image/jpeg', './upload/playlist/cover', '1626358128265.jpg', 13258, '2021-07-15 22:08:48', '2021-07-15 22:08:48');
INSERT INTO `playlist_cover` VALUES ('1626444193429', '1626444193407', '109951165832996974.jpg', 'image/jpeg', './upload/playlist/cover', '1626444193426.jpg', 43545, '2021-07-16 22:03:13', '2021-07-16 22:03:13');
INSERT INTO `playlist_cover` VALUES ('1635338688133', '1635338688119', '109951166270328009.jpg', 'image/jpeg', './upload/playlist/cover', '1635338688131.jpg', 8352, '2021-10-27 20:44:48', '2021-10-27 20:44:48');
INSERT INTO `playlist_cover` VALUES ('1635429991898', '1635429991884', '109951164207703933.jpg', 'image/jpeg', './upload/playlist/cover', '1635429991896.jpg', 62463, '2021-10-28 22:06:31', '2021-10-28 22:06:31');
INSERT INTO `playlist_cover` VALUES ('1635679467875', '1635679467858', '8934631487406566.jpg', 'image/jpeg', './upload/playlist/cover', '1635679467874.jpg', 36046, '2021-10-31 19:24:27', '2021-10-31 19:24:27');
INSERT INTO `playlist_cover` VALUES ('1635679507230', '1635679507213', '109951166086981893.jpg', 'image/jpeg', './upload/playlist/cover', '1635679507229.jpg', 13408, '2021-10-31 19:25:07', '2021-10-31 19:25:07');
INSERT INTO `playlist_cover` VALUES ('1635679540059', '1635679540043', '109951166111772316.jpg', 'image/jpeg', './upload/playlist/cover', '1635679540058.jpg', 55066, '2021-10-31 19:25:40', '2021-10-31 19:25:40');
INSERT INTO `playlist_cover` VALUES ('1635679578905', '1635679578890', '109951166281845031.jpg', 'image/jpeg', './upload/playlist/cover', '1635679578904.jpg', 6806, '2021-10-31 19:26:18', '2021-10-31 19:26:18');
INSERT INTO `playlist_cover` VALUES ('1635685505962', '1635685505946', '109951166338977683.jpg', 'image/jpeg', './upload/playlist/cover', '1635685505960.jpg', 57774, '2021-10-31 21:05:05', '2021-10-31 21:05:05');
INSERT INTO `playlist_cover` VALUES ('1636034772100', '1636034772080', '109951165847046364.jpg', 'image/jpeg', './upload/playlist/cover', '1636034772098.jpg', 12020, '2021-11-04 22:06:12', '2021-11-04 22:06:12');
INSERT INTO `playlist_cover` VALUES ('1643517086011', '1643517085989', '109951166781933785.jpg', 'image/jpeg', './upload/playlist/cover', '1643517086006.jpg', 44670, '2022-01-30 12:31:26', '2022-01-30 12:31:26');
INSERT INTO `playlist_cover` VALUES ('1643522225031', '1643522225014', '109951166679850771.jpg', 'image/jpeg', './upload/playlist/cover', '1643522225029.jpg', 5236, '2022-01-30 13:57:05', '2022-01-30 13:57:05');
INSERT INTO `playlist_cover` VALUES ('1643522294094', '1643522294080', '109951166560748527.jpg', 'image/jpeg', './upload/playlist/cover', '1643522294093.jpg', 49585, '2022-01-30 13:58:14', '2022-01-30 13:58:14');
INSERT INTO `playlist_cover` VALUES ('1643522428356', '1643522428342', '20210702081927884718.jpg', 'image/jpeg', './upload/playlist/cover', '1643522428355.jpg', 8822, '2022-01-30 14:00:28', '2022-01-30 14:00:28');
INSERT INTO `playlist_cover` VALUES ('1643522638218', '1643522638202', '20201206141703862350.jpg', 'image/jpeg', './upload/playlist/cover', '1643522638217.jpg', 12575, '2022-01-30 14:03:58', '2022-01-30 14:03:58');
INSERT INTO `playlist_cover` VALUES ('1643522716227', '1643522716214', '20201201230452599570.jpg', 'image/jpeg', './upload/playlist/cover', '1643522716226.jpg', 12045, '2022-01-30 14:05:16', '2022-01-30 14:05:16');
INSERT INTO `playlist_cover` VALUES ('1643522773895', '1643522773880', '20201120143900449129.jpg', 'image/jpeg', './upload/playlist/cover', '1643522773894.jpg', 12219, '2022-01-30 14:06:13', '2022-01-30 14:06:13');
INSERT INTO `playlist_cover` VALUES ('1643937860398', '1643937860377', '20210423180956253040.jpg', 'image/jpeg', './upload/playlist/cover', '1643937860395.jpg', 11338, '2022-02-04 09:24:20', '2022-02-04 09:24:20');
INSERT INTO `playlist_cover` VALUES ('1643937966791', '1643937966776', '20210602092724852933.jpg', 'image/jpeg', './upload/playlist/cover', '1643937966790.jpg', 10197, '2022-02-04 09:26:06', '2022-02-04 09:26:06');
INSERT INTO `playlist_cover` VALUES ('1643938110851', '1643938110834', '1642059832511_256498806_300.jpg', 'image/jpeg', './upload/playlist/cover', '1643938110849.jpg', 24339, '2022-02-04 09:28:30', '2022-02-04 09:28:30');
INSERT INTO `playlist_cover` VALUES ('1643938967630', '1643938967613', '1640247141449_544783430_300.jpg', 'image/jpeg', './upload/playlist/cover', '1643938967629.jpg', 8486, '2022-02-04 09:42:47', '2022-02-04 09:42:47');
INSERT INTO `playlist_cover` VALUES ('1643939055634', '1643939055617', '1642924601080_533361393_300.jpg', 'image/jpeg', './upload/playlist/cover', '1643939055633.jpg', 15803, '2022-02-04 09:44:15', '2022-02-04 09:44:15');
INSERT INTO `playlist_cover` VALUES ('1644202412174', '1644202412158', '109951166560617560.jpg', 'image/jpeg', './upload/playlist/cover', '1644202412172.jpg', 7440, '2022-02-07 10:53:32', '2022-02-07 10:53:32');
INSERT INTO `playlist_cover` VALUES ('1644202455609', '1644202455593', '109951166603539190.jpg', 'image/jpeg', './upload/playlist/cover', '1644202455608.jpg', 57009, '2022-02-07 10:54:15', '2022-02-07 10:54:15');
INSERT INTO `playlist_cover` VALUES ('1644202494785', '1644202494769', '109951166907907850.jpg', 'image/jpeg', './upload/playlist/cover', '1644202494783.jpg', 5551, '2022-02-07 10:54:54', '2022-02-07 10:54:54');
INSERT INTO `playlist_cover` VALUES ('1644202533983', '1644202533965', '109951166633118539.jpg', 'image/jpeg', './upload/playlist/cover', '1644202533981.jpg', 44412, '2022-02-07 10:55:33', '2022-02-07 10:55:33');
INSERT INTO `playlist_cover` VALUES ('1644202716425', '1644202716412', '109951166515872936.jpg', 'image/jpeg', './upload/playlist/cover', '1644202716424.jpg', 12395, '2022-02-07 10:58:36', '2022-02-07 10:58:36');
INSERT INTO `playlist_cover` VALUES ('1644202754343', '1644202754330', '109951166748000464.jpg', 'image/jpeg', './upload/playlist/cover', '1644202754342.jpg', 15941, '2022-02-07 10:59:14', '2022-02-07 10:59:14');
INSERT INTO `playlist_cover` VALUES ('1644202796648', '1644202796635', '109951166461327222.jpg', 'image/jpeg', './upload/playlist/cover', '1644202796647.jpg', 10143, '2022-02-07 10:59:56', '2022-02-07 10:59:56');
INSERT INTO `playlist_cover` VALUES ('1644202895313', '1644202895296', '109951166678494183.jpg', 'image/jpeg', './upload/playlist/cover', '1644202895311.jpg', 27651, '2022-02-07 11:01:35', '2022-02-07 11:01:35');
INSERT INTO `playlist_cover` VALUES ('1644286962574', '1644286962553', '1422768054636394.jpg', 'image/jpeg', './upload/playlist/cover', '1644286962570.jpg', 6546, '2022-02-08 10:22:42', '2022-02-08 10:22:42');
INSERT INTO `playlist_cover` VALUES ('1648549580778', '1648549580754', '1647859215300_474818612_200.jpg', 'image/jpeg', './upload/playlist/cover', '1648549580774.jpg', 7739, '2022-03-29 18:26:20', '2022-03-29 18:26:20');
INSERT INTO `playlist_cover` VALUES ('1649666716886', '1649666716862', '1648860863567_556832161_300.jpg', 'image/jpeg', './upload/playlist/cover', '1649666716882.jpg', 15563, '2022-04-11 16:45:16', '2022-04-11 16:45:16');
INSERT INTO `playlist_cover` VALUES ('1650161197381', '1650161197364', '1649862651632_189029403_300.jpg', 'image/jpeg', './upload/playlist/cover', '1650161197379.jpg', 13896, '2022-04-17 10:06:37', '2022-04-17 10:06:37');
INSERT INTO `playlist_cover` VALUES ('1650240047510', '1650240047485', '1649668049166_557442055_200.jpg', 'image/jpeg', './upload/playlist/cover', '1650240047507.jpg', 11461, '2022-04-18 08:00:47', '2022-04-18 08:00:47');
INSERT INTO `playlist_cover` VALUES ('1651623219171', '1651623219117', '1651122736410_552644245_200.jpg', 'image/jpeg', './upload/playlist/cover', '1651623219161.jpg', 9612, '2022-05-04 08:13:39', '2022-05-04 08:13:39');
INSERT INTO `playlist_cover` VALUES ('1651624031037', '1651624030999', '1649554095056_533361393_200.jpg', 'image/jpeg', './upload/playlist/cover', '1651624031033.jpg', 13477, '2022-05-04 08:27:11', '2022-05-04 08:27:11');

-- ----------------------------
-- Table structure for playlist_song
-- ----------------------------
DROP TABLE IF EXISTS `playlist_song`;
CREATE TABLE `playlist_song`  (
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `pId`(`pId`) USING BTREE,
  INDEX `songId`(`songId`) USING BTREE,
  CONSTRAINT `playlist_song_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `playlist_song_ibfk_2` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlist_song
-- ----------------------------
INSERT INTO `playlist_song` VALUES ('1623424503525', '1622103579245');
INSERT INTO `playlist_song` VALUES ('1623425702147', '1624540295354');
INSERT INTO `playlist_song` VALUES ('1623425577321', '1624546108864');
INSERT INTO `playlist_song` VALUES ('1623425577321', '1624546320157');
INSERT INTO `playlist_song` VALUES ('1623425577321', '1624546835299');
INSERT INTO `playlist_song` VALUES ('1623425528589', '1624549624782');
INSERT INTO `playlist_song` VALUES ('1624975506830', '1624372266021');
INSERT INTO `playlist_song` VALUES ('1624975632891', '1624547985767');
INSERT INTO `playlist_song` VALUES ('1626253662753', '1626233266278');
INSERT INTO `playlist_song` VALUES ('1626253662753', '1622102341993');
INSERT INTO `playlist_song` VALUES ('1626253662753', '1624375323999');
INSERT INTO `playlist_song` VALUES ('1623424503525', '1625408496042');
INSERT INTO `playlist_song` VALUES ('1623424503525', '1622102341993');
INSERT INTO `playlist_song` VALUES ('1623424503525', '1624546506142');
INSERT INTO `playlist_song` VALUES ('1623424503525', '1624546835299');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1624540295354');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1622104866862');
INSERT INTO `playlist_song` VALUES ('1626271168770', '1622110534718');
INSERT INTO `playlist_song` VALUES ('1626271168770', '1622110603944');
INSERT INTO `playlist_song` VALUES ('1626271168770', '1622110748238');
INSERT INTO `playlist_song` VALUES ('1626269205422', '1626272735139');
INSERT INTO `playlist_song` VALUES ('1626269334408', '1626273066287');
INSERT INTO `playlist_song` VALUES ('1626269291404', '1624540295354');
INSERT INTO `playlist_song` VALUES ('1626269205422', '1624540295354');
INSERT INTO `playlist_song` VALUES ('1626269334408', '1624540295354');
INSERT INTO `playlist_song` VALUES ('1626358080106', '1624546506142');
INSERT INTO `playlist_song` VALUES ('1626358080106', '1626360701597');
INSERT INTO `playlist_song` VALUES ('1626444193407', '1626233266278');
INSERT INTO `playlist_song` VALUES ('1626444193407', '1624375323999');
INSERT INTO `playlist_song` VALUES ('1626444193407', '1624546320157');
INSERT INTO `playlist_song` VALUES ('1626444193407', '1622104866862');
INSERT INTO `playlist_song` VALUES ('1626444193407', '1624540295354');
INSERT INTO `playlist_song` VALUES ('1623426299066', '1624540295354');
INSERT INTO `playlist_song` VALUES ('1626269244918', '1624549624782');
INSERT INTO `playlist_song` VALUES ('1626271168770', '1624540295354');
INSERT INTO `playlist_song` VALUES ('1626271168770', '1624546320157');
INSERT INTO `playlist_song` VALUES ('1626270935470', '1633919156741');
INSERT INTO `playlist_song` VALUES ('1626271101777', '1633919156741');
INSERT INTO `playlist_song` VALUES ('1626271309545', '1633919156741');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1633919156741');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1634458012381');
INSERT INTO `playlist_song` VALUES ('1635338688119', '1625408572563');
INSERT INTO `playlist_song` VALUES ('1624975632891', '1626272735139');
INSERT INTO `playlist_song` VALUES ('1635429991884', '1635429830242');
INSERT INTO `playlist_song` VALUES ('1635429991884', '1626360701597');
INSERT INTO `playlist_song` VALUES ('1635679467858', '1624375323999');
INSERT INTO `playlist_song` VALUES ('1635679540043', '1634541304221');
INSERT INTO `playlist_song` VALUES ('1635679540043', '1633919156741');
INSERT INTO `playlist_song` VALUES ('1635679540043', '1635507711961');
INSERT INTO `playlist_song` VALUES ('1635679507213', '1635508957215');
INSERT INTO `playlist_song` VALUES ('1635679467858', '1635680608268');
INSERT INTO `playlist_song` VALUES ('1635679507213', '1635506793225');
INSERT INTO `playlist_song` VALUES ('1635685505946', '1634531821765');
INSERT INTO `playlist_song` VALUES ('1636034772080', '1635337922244');
INSERT INTO `playlist_song` VALUES ('1636034772080', '1633946260220');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1635340172627');
INSERT INTO `playlist_song` VALUES ('1636034772080', '1634531821765');
INSERT INTO `playlist_song` VALUES ('1636034772080', '1635506793225');
INSERT INTO `playlist_song` VALUES ('1626271101777', '1635506366426');
INSERT INTO `playlist_song` VALUES ('1626271101777', '1634531821765');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1635507474940');
INSERT INTO `playlist_song` VALUES ('1623425577321', '1624546506142');
INSERT INTO `playlist_song` VALUES ('1626270935470', '1625408572563');
INSERT INTO `playlist_song` VALUES ('1626271309545', '1625408435039');
INSERT INTO `playlist_song` VALUES ('1624975688111', '1622110534718');
INSERT INTO `playlist_song` VALUES ('1624975632891', '1622110534718');
INSERT INTO `playlist_song` VALUES ('1626271168770', '1643436188086');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1643454106693');
INSERT INTO `playlist_song` VALUES ('1643517085989', '1634541304221');
INSERT INTO `playlist_song` VALUES ('1643517085989', '1643436188086');
INSERT INTO `playlist_song` VALUES ('1643517085989', '1643454106693');
INSERT INTO `playlist_song` VALUES ('1635685505946', '1643454792066');
INSERT INTO `playlist_song` VALUES ('1635685505946', '1624546506142');
INSERT INTO `playlist_song` VALUES ('1643517085989', '1643519328369');
INSERT INTO `playlist_song` VALUES ('1643517085989', '1643519796010');
INSERT INTO `playlist_song` VALUES ('1643517085989', '1643520839579');
INSERT INTO `playlist_song` VALUES ('1643522428342', '1634362102513');
INSERT INTO `playlist_song` VALUES ('1643522428342', '1643436188086');
INSERT INTO `playlist_song` VALUES ('1643522716214', '1643436188086');
INSERT INTO `playlist_song` VALUES ('1643522638202', '1635429830242');
INSERT INTO `playlist_song` VALUES ('1643522773880', '1622110534718');
INSERT INTO `playlist_song` VALUES ('1626270935470', '1643436188086');
INSERT INTO `playlist_song` VALUES ('1623425528589', '1643436188086');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1643880439323');
INSERT INTO `playlist_song` VALUES ('1643938110834', '1643938595197');
INSERT INTO `playlist_song` VALUES ('1643937860377', '1643938595197');
INSERT INTO `playlist_song` VALUES ('1635679540043', '1643938595197');
INSERT INTO `playlist_song` VALUES ('1624975445013', '1643880439323');
INSERT INTO `playlist_song` VALUES ('1623425702147', '1643880439323');
INSERT INTO `playlist_song` VALUES ('1624975632891', '1643880439323');
INSERT INTO `playlist_song` VALUES ('1624975506830', '1643454106693');
INSERT INTO `playlist_song` VALUES ('1644202533965', '1635508957215');
INSERT INTO `playlist_song` VALUES ('1644202455593', '1643454106693');
INSERT INTO `playlist_song` VALUES ('1644202412158', '1633919156741');
INSERT INTO `playlist_song` VALUES ('1644202796635', '1643519796010');
INSERT INTO `playlist_song` VALUES ('1644202494769', '1624375323999');
INSERT INTO `playlist_song` VALUES ('1644202412158', '1643880947532');
INSERT INTO `playlist_song` VALUES ('1644202754330', '1624547985767');
INSERT INTO `playlist_song` VALUES ('1644202455593', '1643880947532');
INSERT INTO `playlist_song` VALUES ('1644202455593', '1643436188086');
INSERT INTO `playlist_song` VALUES ('1644202754330', '1626273066287');
INSERT INTO `playlist_song` VALUES ('1643522225014', '1643938595197');
INSERT INTO `playlist_song` VALUES ('1643522428342', '1624549525985');
INSERT INTO `playlist_song` VALUES ('1643522225014', '1625408435039');
INSERT INTO `playlist_song` VALUES ('1643522225014', '1644374326583');
INSERT INTO `playlist_song` VALUES ('1643517085989', '1644375432188');
INSERT INTO `playlist_song` VALUES ('1643522225014', '1644374062902');
INSERT INTO `playlist_song` VALUES ('1643522225014', '1643454792066');
INSERT INTO `playlist_song` VALUES ('1643522225014', '1635680515627');
INSERT INTO `playlist_song` VALUES ('1643522225014', '1624540295354');
INSERT INTO `playlist_song` VALUES ('1643522225014', '1635506793225');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1643938595197');
INSERT INTO `playlist_song` VALUES ('1643522638202', '1635508957215');
INSERT INTO `playlist_song` VALUES ('1626269291404', '1643938595197');
INSERT INTO `playlist_song` VALUES ('1626269334408', '1624546506142');
INSERT INTO `playlist_song` VALUES ('1626269291404', '1635508957215');
INSERT INTO `playlist_song` VALUES ('1626269334408', '1635508957215');
INSERT INTO `playlist_song` VALUES ('1626269244918', '1643938595197');
INSERT INTO `playlist_song` VALUES ('1626269205422', '1643938595197');
INSERT INTO `playlist_song` VALUES ('1626269244918', '1634541304221');
INSERT INTO `playlist_song` VALUES ('1626269334408', '1644374062902');
INSERT INTO `playlist_song` VALUES ('1644202796635', '1635508957215');
INSERT INTO `playlist_song` VALUES ('1644202796635', '1643454106693');
INSERT INTO `playlist_song` VALUES ('1643937860377', '1635429386379');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1626272735139');
INSERT INTO `playlist_song` VALUES ('1623424503525', '1626272735139');
INSERT INTO `playlist_song` VALUES ('1626271168770', '1626272735139');
INSERT INTO `playlist_song` VALUES ('1626271309545', '1626272735139');
INSERT INTO `playlist_song` VALUES ('1626271101777', '1626272735139');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1643880947532');
INSERT INTO `playlist_song` VALUES ('1626270935470', '1635680608268');
INSERT INTO `playlist_song` VALUES ('1623426048988', '1643436188086');
INSERT INTO `playlist_song` VALUES ('1623426048988', '1626360701597');
INSERT INTO `playlist_song` VALUES ('1623424503525', '1647143678810');
INSERT INTO `playlist_song` VALUES ('1626271309545', '1647143678810');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1647144678278');
INSERT INTO `playlist_song` VALUES ('1624975445013', '1647143678810');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1647145343871');
INSERT INTO `playlist_song` VALUES ('1644202796635', '1643938595197');
INSERT INTO `playlist_song` VALUES ('1644202494769', '1635429830242');
INSERT INTO `playlist_song` VALUES ('1644202895296', '1643454106693');
INSERT INTO `playlist_song` VALUES ('1623424402288', '1648208054434');
INSERT INTO `playlist_song` VALUES ('1626271168770', '1648208054434');
INSERT INTO `playlist_song` VALUES ('1623424503525', '1647144678278');
INSERT INTO `playlist_song` VALUES ('1623424503525', '1648270454571');
INSERT INTO `playlist_song` VALUES ('1623425702147', '1648273424472');
INSERT INTO `playlist_song` VALUES ('1644286962553', '1648273424472');
INSERT INTO `playlist_song` VALUES ('1623425528589', '1648273167106');
INSERT INTO `playlist_song` VALUES ('1623425633574', '1643938595197');
INSERT INTO `playlist_song` VALUES ('1626269145664', '1648273167106');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1622103223653');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1643436188086');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1644374062902');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1635506793225');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1624540295354');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1647143678810');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1624546506142');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1635429386379');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1634531821765');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1648270454571');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1625408435039');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1643880947532');
INSERT INTO `playlist_song` VALUES ('1648549580754', '1626360701597');
INSERT INTO `playlist_song` VALUES ('1624975445013', '1634541304221');
INSERT INTO `playlist_song` VALUES ('1623425577321', '1643436188086');
INSERT INTO `playlist_song` VALUES ('1624975506830', '1635340172627');
INSERT INTO `playlist_song` VALUES ('1623425702147', '1635340172627');
INSERT INTO `playlist_song` VALUES ('1626271168770', '1644374062902');
INSERT INTO `playlist_song` VALUES ('1623425528589', '1649335319660');
INSERT INTO `playlist_song` VALUES ('1623425633574', '1649335319660');
INSERT INTO `playlist_song` VALUES ('1623425702147', '1649335319660');
INSERT INTO `playlist_song` VALUES ('1624975506830', '1649335319660');
INSERT INTO `playlist_song` VALUES ('1624975632891', '1649335319660');
INSERT INTO `playlist_song` VALUES ('1644286962553', '1649335319660');
INSERT INTO `playlist_song` VALUES ('1649666716862', '1635503448330');
INSERT INTO `playlist_song` VALUES ('1649666716862', '1648273167106');
INSERT INTO `playlist_song` VALUES ('1649666716862', '1648273334240');
INSERT INTO `playlist_song` VALUES ('1649666716862', '1648270454571');
INSERT INTO `playlist_song` VALUES ('1649666716862', '1649336428604');
INSERT INTO `playlist_song` VALUES ('1623425805027', '1634541304221');
INSERT INTO `playlist_song` VALUES ('1623425979492', '1634541304221');
INSERT INTO `playlist_song` VALUES ('1623425805027', '1648273167106');
INSERT INTO `playlist_song` VALUES ('1623425883687', '1626233266278');
INSERT INTO `playlist_song` VALUES ('1623425979492', '1649336428604');
INSERT INTO `playlist_song` VALUES ('1650161197364', '1624546108864');
INSERT INTO `playlist_song` VALUES ('1650161197364', '1624549624782');
INSERT INTO `playlist_song` VALUES ('1623425702147', '1635503448330');
INSERT INTO `playlist_song` VALUES ('1624975559551', '1635503448330');
INSERT INTO `playlist_song` VALUES ('1624975688111', '1635503448330');
INSERT INTO `playlist_song` VALUES ('1624975632891', '1635503448330');
INSERT INTO `playlist_song` VALUES ('1623424503525', '1649982278381');
INSERT INTO `playlist_song` VALUES ('1626271168770', '1649982278381');
INSERT INTO `playlist_song` VALUES ('1626271309545', '1649982278381');
INSERT INTO `playlist_song` VALUES ('1650240047485', '1643454106693');
INSERT INTO `playlist_song` VALUES ('1650240047485', '1634531821765');
INSERT INTO `playlist_song` VALUES ('1626253662753', '1648273167106');
INSERT INTO `playlist_song` VALUES ('1626270935470', '1649982278381');
INSERT INTO `playlist_song` VALUES ('1651623219117', '1622102944462');

-- ----------------------------
-- Table structure for program
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `playCount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `originalname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `dt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `cId`(`cId`) USING BTREE,
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `program_ibfk_2` FOREIGN KEY (`cId`) REFERENCES `channel_content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of program
-- ----------------------------
INSERT INTO `program` VALUES ('1635576745742', '《你压力大吗》郭德纲于谦', '20', '1621553753077', '1635575832956', '2021-10-30 14:52:25', 'audio/mpeg', './upload/channel/program', '1635577883728.mp3', 'obj_w5zDlMODwrDDiGjCn8Ky_11431432536_7c1d_92fc_b408_61e8831d9cd45625129ba4e91d5781dc.mp3', 27391417, '1505000', 'http://localhost:8200/channel/program?id=1635576745742');
INSERT INTO `program` VALUES ('1635576840856', '《梦中婚》郭德纲于谦', '29', '1621553753077', '1635575832956', '2021-10-30 14:54:00', 'audio/mpeg', './upload/channel/program', '1635578026789.mp3', '你要高雅.mp3', 12933478, '1707000', 'http://localhost:8200/channel/program?id=1635576840856');
INSERT INTO `program` VALUES ('1635578769546', '《我要奋斗》郭德纲于谦', '8', '1621553753077', '1635575832956', '2021-10-30 15:26:09', 'audio/mpeg', './upload/channel/program', '1635578955278.mp3', '我要奋斗.mp3', 15576813, '2732000', 'http://localhost:8200/channel/program?id=1635578769546');
INSERT INTO `program` VALUES ('1635578810357', '《戏曲杂谈》郭德纲于谦', '2', '1621553753077', '1635575832956', '2021-10-30 15:26:50', 'audio/mpeg', './upload/channel/program', '1635579035502.mp3', '戏曲杂谈.mp3', 17104502, '1640000', 'http://localhost:8200/channel/program?id=1635578810357');
INSERT INTO `program` VALUES ('1638604107220', ' 《算命大师》郭德纲，于谦', '1', '1621553753077', '1635575832956', '2021-12-04 15:48:27', 'audio/mpeg', './upload/channel/program', '1638604107239.mp3', '算命大师.mp3', 15397974, '1284000', 'http://localhost:8200/channel/program?id=1638604107220');
INSERT INTO `program` VALUES ('1638604321937', ' 《我怎么这么倒霉》郭德纲，于谦', '5', '1621553753077', '1635575832956', '2021-12-04 15:52:01', 'audio/mpeg', './upload/channel/program', '1638604321951.mp3', '我怎么这么倒霉.mp3', 26445889, '2203000', 'http://localhost:8200/channel/program?id=1638604321937');
INSERT INTO `program` VALUES ('1638604914973', ' 《五行诗》郭德纲，于谦', '1', '1621553753077', '1635575832956', '2021-12-04 16:01:54', 'audio/mpeg', './upload/channel/program', '1638604914994.mp3', '五行诗.mp3', 54370682, '2265417.143', 'http://localhost:8200/channel/program?id=1638604914973');
INSERT INTO `program` VALUES ('1638606411547', ' 送给咬牙坚持的你', '19', '1621586602550', '1634034840512', '2021-12-04 16:26:51', 'audio/mpeg', './upload/channel/program', '1638606411568.mp3', '送给咬牙坚持的你.mp3', 10295423, '257358.367', 'http://localhost:8200/channel/program?id=1638606411547');
INSERT INTO `program` VALUES ('1638606496898', ' 愿有一人，心疼你的坚强', '5', '1621586602550', '1634034840512', '2021-12-04 16:28:16', 'audio/mpeg', './upload/channel/program', '1638606496917.mp3', '愿有一人，心疼你的坚强.mp3', 10898329, '272431.02', 'http://localhost:8200/channel/program?id=1638606496898');
INSERT INTO `program` VALUES ('1638606641205', ' 有一种相爱，叫各自安好', '1', '1621586602550', '1634034840512', '2021-12-04 16:30:41', 'audio/mpeg', './upload/channel/program', '1638606641222.mp3', '有一种相爱，叫各自安好.mp3', 10470966, '261746.93899999998', 'http://localhost:8200/channel/program?id=1638606641205');
INSERT INTO `program` VALUES ('1638606813457', ' 得失', '0', '1621586602550', '1634034964713', '2021-12-04 16:33:33', 'audio/mpeg', './upload/channel/program', '1638606813474.mp3', '得失.mp3', 22713645, '567816', 'http://localhost:8200/channel/program?id=1638606813457');
INSERT INTO `program` VALUES ('1638606985584', ' 送给失眠的你', '2', '1621586602550', '1634035103223', '2021-12-04 16:36:25', 'audio/mpeg', './upload/channel/program', '1638606985600.mp3', '送给失眠的你.mp3', 45091245, '1127256', 'http://localhost:8200/channel/program?id=1638606985584');
INSERT INTO `program` VALUES ('1638607093649', ' 当你想不通的时候，听这个', '1', '1621586602550', '1634035103223', '2021-12-04 16:38:13', 'audio/mpeg', './upload/channel/program', '1638607093669.mp3', '当你想不通的时候，听这个.mp3', 16882605, '703416', 'http://localhost:8200/channel/program?id=1638607093649');
INSERT INTO `program` VALUES ('1638607187012', ' 我的宝贝小雅', '0', '1621586602550', '1634035200089', '2021-12-04 16:39:47', 'audio/mpeg', './upload/channel/program', '1638607187029.mp3', '我的宝贝小雅.mp3', 2324781, '96840', 'http://localhost:8200/channel/program?id=1638607187012');
INSERT INTO `program` VALUES ('1638607395667', ' 关灯了，我可以哭了吗', '1', '1621586602550', '1634035333656', '2021-12-04 16:43:15', 'audio/mpeg', './upload/channel/program', '1638607395683.mp3', '关灯了.mp3', 23399906, '974968.1630000001', 'http://localhost:8200/channel/program?id=1638607395667');
INSERT INTO `program` VALUES ('1638607509002', ' 女生只存在同性恋和双性恋吗？', '0', '1621586602550', '1634035466519', '2021-12-04 16:45:09', 'audio/mpeg', './upload/channel/program', '1638607509019.mp3', '同性恋.mp3', 11504370, '479320.816', 'http://localhost:8200/channel/program?id=1638607509002');
INSERT INTO `program` VALUES ('1638607657796', ' 让爱与浪漫杀死一切焦虑和无聊 ', '0', '1621586602550', '1634035609469', '2021-12-04 16:47:37', 'audio/mpeg', './upload/channel/program', '1638607657817.mp3', '让爱与浪漫杀死一切焦虑和无聊 .mp3', 27527671, '1146958.3669999999', 'http://localhost:8200/channel/program?id=1638607657796');
INSERT INTO `program` VALUES ('1638607710780', ' 我在整理岁月呢，我在记录时间呢', '0', '1621586602550', '1634035609469', '2021-12-04 16:48:30', 'audio/mpeg', './upload/channel/program', '1638607710804.mp3', '我在整理岁月呢，我在记录时间呢.mp3', 27799136, '1158269.388', 'http://localhost:8200/channel/program?id=1638607710780');
INSERT INTO `program` VALUES ('1638607834015', ' 分手，分手永远都准备不好', '8', '1621586602550', '1634035701805', '2021-12-04 16:50:34', 'audio/mpeg', './upload/channel/program', '1638607834032.mp3', '分手，分手永远都准备不好.mp3', 20803245, '520056.00000000006', 'http://localhost:8200/channel/program?id=1638607834015');
INSERT INTO `program` VALUES ('1643521752189', ' 第一届「硬地编辑部」颁奖典礼', '1', '1621586602550', '1634036792314', '2022-01-30 13:49:12', 'audio/mpeg', './upload/channel/program', '1643521752398.mp3', 'obj_w5zDlMODwrDDiGjCn8Ky_12789577784_b94c_486c_dd73_e48c33bd9e7dd97be227495242de59f7.mp3', 160404419, '4010040.464', 'http://localhost:8200/channel/program?id=1643521752189');
INSERT INTO `program` VALUES ('1648272606693', ' 不是谁，都能走进我心里 ', '1', '1621586602550', '1634034840512', '2022-03-26 13:30:06', 'audio/mpeg', './upload/channel/program', '1648272606720.mp3', 'obj_w5zDlMODwrDDiGjCn8Ky_13508336578_dae8_d948_05a9_e261b76e924c0f10cd8e6bbacb20bda8.mp3', 9963146, '249051.429', 'http://localhost:8200/channel/program?id=1648272606693');
INSERT INTO `program` VALUES ('1648272750443', ' 也许我们相遇是偶然', '0', '1621586602550', '1634034964713', '2022-03-26 13:32:30', 'audio/mpeg', './upload/channel/program', '1648272750462.mp3', 'obj_w5zDlMODwrDDiGjCn8Ky_12228156651_3d0d_d179_ed52_6bc48dc4296eda4ffef19211f666d9da.mp3', 10624365, '265584', 'http://localhost:8200/channel/program?id=1648272750443');
INSERT INTO `program` VALUES ('1648272872555', ' 最终也许是一个开始', '0', '1621586602550', '1634034964713', '2022-03-26 13:34:32', 'audio/mpeg', './upload/channel/program', '1648272872572.mp3', 'obj_w5zDlMODwrDDiGjCn8Ky_1968819938_f24e_b1cc_8283_3fbdf5fd654e3fab0d5eec3d135c9f95.mp3', 19877805, '496920', 'http://localhost:8200/channel/program?id=1648272872555');
INSERT INTO `program` VALUES ('1649731799878', ' 扒马褂', '1', '1621553753077', '1635575832956', '2022-04-12 10:49:59', 'audio/mpeg', './upload/channel/program', '1649731799910.mp3', '144a9fc2ffc4438f8e62e3ab4.mp3', 45137756, '3761449.796', 'http://localhost:8200/channel/program?id=1649731799878');
INSERT INTO `program` VALUES ('1650010765935', ' 《有哲理的人》岳云鹏 孙越', '3', '1621586669402', '1650010726370', '2022-04-15 16:19:25', 'audio/mpeg', './upload/channel/program', '1650010765960.mp3', '_group32_M03_61_63_wKgJnFmcIpeTLCxuAHNW3T0D778468.mp3', 7558877, '934686', 'http://localhost:8200/channel/program?id=1650010765935');
INSERT INTO `program` VALUES ('1650010956058', ' 《于谦不行了》岳云鹏 孙越', '18', '1621586669402', '1637996874647', '2022-04-15 16:22:36', 'audio/mpeg', './upload/channel/program', '1650010956077.mp3', 'yu.mp3', 15646088, '1934784', 'http://localhost:8200/channel/program?id=1650010956058');
INSERT INTO `program` VALUES ('1650611676829', ' 学小曲', '0', '1650161308411', '1650611580246', '2022-04-22 15:14:36', 'audio/mpeg', './upload/channel/program', '1650611676851.mp3', 'wKgJXlmC4pKgqLhxAK3KtYMxiZA587.mp3', 11389621, '1408391', 'http://localhost:8200/channel/program?id=1650611676829');
INSERT INTO `program` VALUES ('1650611918913', ' 单身男女', '0', '1650161308411', '1650611765980', '2022-04-22 15:18:38', 'audio/mpeg', './upload/channel/program', '1650611918935.mp3', 'wKgDYlV2-SXj4ahnAMQb6frn8jg917.mp3', 12852201, '1597800', 'http://localhost:8200/channel/program?id=1650611918913');
INSERT INTO `program` VALUES ('1650612065962', ' 大江东去', '4', '1650161308411', '1650611997653', '2022-04-22 15:21:05', 'audio/mpeg', './upload/channel/program', '1650612065990.mp3', '大江东去.mp3', 19243757, '2377066.009', 'http://localhost:8200/channel/program?id=1650612065962');
INSERT INTO `program` VALUES ('1650612153343', ' 真假曹操', '0', '1650161308411', '1650611997653', '2022-04-22 15:22:33', 'audio/mpeg', './upload/channel/program', '1650612153363.mp3', '真假曹操.mp3', 19351271, '2390336.009', 'http://localhost:8200/channel/program?id=1650612153343');
INSERT INTO `program` VALUES ('1650612433772', ' 古代钱庄把钱存放在什么样的地方？', '0', '1650161308411', '1650612367380', '2022-04-22 15:27:13', 'audio/mpeg', './upload/channel/program', '1650612433798.mp3', '古代钱庄把钱存放在什么样的地方？.mp3', 7358682, '908832', 'http://localhost:8200/channel/program?id=1650612433772');
INSERT INTO `program` VALUES ('1650612644836', ' 山脚下的麓湖-唯美纯音乐', '0', '1650161308411', '1650612563451', '2022-04-22 15:30:44', 'audio/mpeg', './upload/channel/program', '1650612644859.mp3', '山脚下的麓湖-唯美纯音乐.mp3', 2427372, '299625.011', 'http://localhost:8200/channel/program?id=1650612644836');
INSERT INTO `program` VALUES ('1650613540969', ' 《清洁女工之死》——阿加莎·克里斯蒂小说', '2', '1650161308411', '1650613406414', '2022-04-22 15:45:40', 'audio/mpeg', './upload/channel/program', '1650613540988.mp3', '《清洁女工之死》——阿加莎·克里斯蒂小说.mp3', 11214483, '1385174', 'http://localhost:8200/channel/program?id=1650613540969');
INSERT INTO `program` VALUES ('1650613620216', ' 露营游客遇到恐怖怪物接连失踪《邪恶力量》', '1', '1650161308411', '1650613406414', '2022-04-22 15:47:00', 'audio/mpeg', './upload/channel/program', '1650613620233.mp3', '露营游客遇到恐怖怪物接连失踪《邪恶力量》.mp3', 4484402, '553728.005', 'http://localhost:8200/channel/program?id=1650613620216');
INSERT INTO `program` VALUES ('1650613787963', ' 《血钻》——钻石背后的血腥真相你知道吗？', '0', '1650161308411', '1650613406414', '2022-04-22 15:49:47', 'audio/mpeg', './upload/channel/program', '1650613787987.mp3', '《血钻》——钻石背后的血腥真相你知道吗？.mp3', 8802963, '1087254', 'http://localhost:8200/channel/program?id=1650613787963');
INSERT INTO `program` VALUES ('1650614183491', ' 鬼怪假扮美女骗书生', '3', '1635685284424', '1650614109749', '2022-04-22 15:56:23', 'audio/mpeg', './upload/channel/program', '1650614183514.mp3', '鬼怪假扮美女骗书生.mp3', 6956824, '859208.005', 'http://localhost:8200/channel/program?id=1650614183491');
INSERT INTO `program` VALUES ('1650614301839', ' 豆瓣7.9分恐怖片，《招魂》的续集依然是经典！', '8', '1635685284424', '1650614109749', '2022-04-22 15:58:21', 'audio/mpeg', './upload/channel/program', '1650614301858.mp3', '豆瓣7.9分恐怖片，《招魂》的续集依然是经典！.mp3', 4383279, '541248.005', 'http://localhost:8200/channel/program?id=1650614301839');

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `arId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publishTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alia` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mp3Url` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `lyric` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `vip` int NULL DEFAULT NULL,
  `playCount` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `arId`(`arId`) USING BTREE,
  INDEX `alId`(`alId`) USING BTREE,
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`arId`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `song_ibfk_2` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES ('1622101289239', 'Lost Control', '1621603346150', '1621948204281', '1621267200000', 'Lost Control', 'http://localhost:8200/song/source?id=1622101289239', '[00:00.000] 作词 : Anders Froen/Sorana Pacurar/Thomas Troelsen\n[00:00.002] 作曲 : Anders Froen/Alan Walker/Magnus Martinsen/Sorana Pacurar/Fredrik Borch Olsen/Thomas Troelsen\n[00:00.04]Produced by：Alan Walker/Mood Melodies\n[00:00.05]Published by：MER Publishing/Copyright Control/Sony/ATV Music Publishing/EMI Music Publishing Denmark/Stellar Songs Ltd./Tileyard Music Publishing\n[00:00.06]Programmer：Alan Walker/Mood Melodies/Big Fred\n[00:00.07]Additional programming by：Magnify\n[00:00.08]Vocals by：Sorana/Mood Melodies\n[00:00.09]Executive Producer：Gunnar Greve\n[00:00.10]Mastered by：Sören Von Malmborg At Cosmos Mastering in Stockholm, Sweden\n[00:00.11]Co-produced by：Big Fred/Magnify\n[00:00.12]Mixed by：Sören Von Malmborg At Basecamp Studio in Stockholm, Sweden\n[00:00.13]Recorded at：MER Studios in Oslo, Norway\n[00:00.14]Repertoire Owner：MER Recordings (Swedish Deal)\n[00:00.15]\n[00:11.38]Mirrors they never lie\n[00:13.75]Don\'t see myself inside\n[00:16.47]Why can\'t I get it right\n[00:18.77]I don\'t know\n[00:21.72]You\'re always watching me fall\n[00:24.29]Shadows they like my wall\n[00:26.93]Why do I feel so small\n[00:29.23]I don\'t know\n[00:31.82]So I walk into the dead of night\n[00:34.76]Where my monsters like to hide\n[00:37.41]Chaos feels so good inside\n[00:39.64]Now I know\n[00:42.38]I lost\n[00:43.40]I lost\n[00:44.71]I lost control again\n[00:47.43]Always do the same and not to blame\n[00:50.11]I lost control again\n[00:52.66]I don\'t\n[00:54.00]I don\'t\n[00:55.30]I don\'t know who I am\n[00:57.92]Always do the same and not to blame\n[01:00.52]I lost control again\n[01:21.03]Oooh\n[01:24.41]I\'m tired of being afraid\n[01:26.85]But lately I lost my faith\n[01:29.90]What is love without pain\n[01:31.77]It ain\'t home\n[01:34.66]You\'re watching me but I\'m below\n[01:37.30]When I get caught I hope\n[01:39.62]It\'s that kind of blackout that will\n[01:42.30]Take me home\n[01:44.88]So I walk into the dead of night\n[01:47.81]Where my monsters like to hide\n[01:50.39]Chaos feels so good inside\n[01:52.73]Now I know\n[01:55.40]I lost\n[01:56.42]I lost\n[01:57.94]I lost control again\n[02:00.53]Always do the same and not to blame\n[02:03.03]I lost control again\n[02:05.81]I don\'t\n[02:07.04]I don\'t\n[02:08.38]I don\'t know who I am\n[02:10.99]Always do the same and not to blame\n[02:13.45]I lost control again\n[02:37.11]I know that I\'m a mess\n[02:39.00]But I ain\'t tryna be the best\n[02:41.90]So whatever\'s coming next\n[02:44.23]I\'d better pray\n[02:47.19]Never said I was an angel\n[02:49.74]I am damaged all the way\n[02:52.33]So whatever\'s coming next\n[02:54.68]I\'d better pray\n[02:57.86]I lost\n[02:59.23]I lost\n[03:00.52]I lost control again\n[03:03.09]Always do the same and not to blame\n[03:05.63]I lost control again\n[03:08.38]I don\'t\n[03:09.63]I don\'t\n[03:10.99]I don\'t know who I am\n[03:13.52]Always do the same and not to blame\n[03:16.04]I lost control again\n', 0, '25', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622101394846', 'I Don\'t Wanna Go', '1621603346150', '1621948204281', '1622217600000', 'I Don\'t Wanna Go', 'http://localhost:8200/song/source?id=1622101394846', NULL, 0, '5', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622101472154', 'Lily', '1621603346150', '1621948204281', '1621180800000', 'Lily', 'http://localhost:8200/song/source?id=1622101472154', NULL, 1, '13', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622101549091', 'Lonely', '1621603346150', '1621948204281', '1557072000000', 'Lonely', 'http://localhost:8200/song/source?id=1622101549091', NULL, 1, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622101615081', 'Do It All for You', '1621603346150', '1621948204281', '1558368000000', 'Do It All for You', 'http://localhost:8200/song/source?id=1622101615081', NULL, 1, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622102341993', 'justice', '1621602969680', '1621948599627', '1653580800000', 'justice', 'http://localhost:8200/song/source?id=1622102341993', NULL, 1, '119', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622102609215', 'Mistletoe', '1621602969680', '1621949107814', '1619971200000', 'Mistletoe', 'http://localhost:8200/song/source?id=1622102609215', NULL, 0, '6', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622102673371', 'Holy', '1621602969680', '1621949107814', '1615824000000', 'Holy', 'http://localhost:8200/song/source?id=1622102673371', NULL, 1, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622102743240', 'The Christmas Song (Chestnuts Roasting On An Open Fire)', '1621602969680', '1621949107814', '1616342400000', 'The Christmas Song (Chestnuts Roasting On An Open Fire)', 'http://localhost:8200/song/source?id=1622102743240', NULL, 1, '6', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622102944462', '是但求其爱', '1621602559815', '1622073564263', '1620576000000', '是但求其爱', 'http://localhost:8200/song/source?id=1622102944462', NULL, 1, '5', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622103084212', '致明日的舞', '1621602559815', '1622073673540', '1620748800000', '致明日的舞', 'http://localhost:8200/song/source?id=1622103084212', NULL, 1, '6', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622103223653', 'Lemon', '1621603618588', '1622074447978', '1620489600000', 'Lemon', 'http://localhost:8200/song/source?id=1622103223653', '[00:00.000] 作词 : 米津玄師\n[00:00.425] 作曲 : 米津玄師\n[00:00.850]夢ならばどれほどよかったでしょう\n[00:06.650]未だにあなたのことを夢にみる\n[00:12.340]忘れた物を取りに帰るように\n[00:17.660]古びた思い出の埃を払う\n[00:25.820]戻らない幸せがあることを\n[00:31.580]最後にあなたが教えてくれた\n[00:36.980]言えずに隠してた昏い過去も\n[00:42.550]あなたがいなきゃ永遠に昏いまま\n[00:48.230]きっともうこれ以上 傷つくことなど\n[00:53.750]ありはしないとわかっている\n[00:58.660]あの日の悲しみさえ\n[01:01.410]あの日の苦しみさえ\n[01:04.150]そのすべてを愛してた あなたとともに\n[01:09.800]胸に残り離れない\n[01:12.730]苦いレモンの匂い\n[01:15.730]雨が降り止むまでは帰れない\n[01:21.240]今でもあなたはわたしの光\n[01:37.600]暗闇であなたの背をなぞった\n[01:42.980]その輪郭を鮮明に覚えている\n[01:48.800]受け止めきれないものと出会うたび\n[01:54.400]溢れてやまないのは涙だけ\n[01:59.990]何をしていたの\n[02:02.760]何を見ていたの\n[02:05.580]わたしの知らない横顔で\n[02:10.390]どこかであなたが今\n[02:13.380]わたしと同じ様な\n[02:15.950]涙にくれ 淋しさの中にいるなら\n[02:21.470]わたしのことなどどうか 忘れてください\n[02:27.490]そんなことを心から願うほどに\n[02:32.910]今でもあなたはわたしの光\n[02:41.600]自分が思うより 恋をしていたあなたに\n[02:52.410]あれから思うように 息ができない\n[03:03.360]あんなに側にいたのにまるで嘘みたい\n[03:14.140]とても忘れられないそれだけが確か\n[03:30.430]あの日の悲しみさえ\n[03:33.200]あの日の苦しみさえ\n[03:35.910]その全てを愛してたあなたと共に\n[03:41.320]胸に残り離れない\n[03:44.280]苦いレモンの匂い\n[03:47.730]雨が降り止むまでは帰れない\n[03:52.840]切り分けた果実の片方の様に\n[03:58.590]今でもあなたはわたしの光\n', 0, '45', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622103280470', 'Paper Flower', '1621603618588', '1622074447978', '1620057600000', 'Paper Flower', 'http://localhost:8200/song/source?id=1622103280470', NULL, 1, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622103363485', 'Cranberry & Pancake', '1621603618588', '1622074447978', '1620576000000', 'Cranberry & Pancake', 'http://localhost:8200/song/source?id=1622103363485', NULL, 0, '2', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622103579245', 'カムパネルラ', '1621603618588', '1622074137833', '1588521600000', 'カムパネルラ', 'http://localhost:8200/song/source?id=1622103579245', NULL, 1, '12', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622103656946', 'Flamingo', '1621603618588', '1622074137833', '1590681600000', 'Flamingo', 'http://localhost:8200/song/source?id=1622103656946', NULL, 0, '15', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622103731345', '感電', '1621603618588', '1622074137833', '1589126400000', '感電', 'http://localhost:8200/song/source?id=1622103731345', NULL, 1, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622104614735', 'PLACEBO', '1621603618588', '1622074137833', '1590595200000', 'PLACEBO', 'http://localhost:8200/song/source?id=1622104614735', NULL, 0, '1', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622104693652', 'パプリカ', '1621603618588', '1622074137833', '1589126400000', 'パプリカ', 'http://localhost:8200/song/source?id=1622104693652', NULL, 0, '1', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622104866862', '馬と鹿', '1621603618588', '1622074240385', '1526227200000', '馬と鹿（米津玄师）', 'http://localhost:8200/song/source?id=1622104866862', NULL, 0, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622104915163', '海の幽霊', '1621603618588', '1622074240385', '1527523200000', '海の幽霊', 'http://localhost:8200/song/source?id=1622104915163', NULL, 1, '1', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622110534718', 'spark', '1622072451745', '1622074574710', '1620057600000', 'spark', 'http://localhost:8200/song/source?id=1622110534718', NULL, 1, '19', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622110603944', 'i know you are in trouble', '1622072451745', '1622074574710', '1621180800000', 'i know you are in trouble', 'http://localhost:8200/song/source?id=1622110603944', NULL, 1, '6', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622110656908', 'august', '1622072451745', '1622074645854', '1620057600000', 'august', 'http://localhost:8200/song/source?id=1622110656908', NULL, 0, '10', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622110700737', 'you are in love', '1622072451745', '1622074645854', '1526227200000', 'you are in love', 'http://localhost:8200/song/source?id=1622110700737', NULL, 0, '6', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622110748238', 'our song', '1622072451745', '1622074694370', '1620057600000', 'our song', 'http://localhost:8200/song/source?id=1622110748238', NULL, 0, '18', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622110787760', 'fifteen', '1622072451745', '1622074694370', '1620316800000', 'fifteen', 'http://localhost:8200/song/source?id=1622110787760', NULL, 0, '11', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622110818998', 'lovestory', '1622072451745', '1622074775169', '1619452800000', 'lovestory', 'http://localhost:8200/song/source?id=1622110818998', NULL, 1, '10', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622111035876', 'Never Grow Up', '1622072451745', '1622074775169', '1620057600000', 'Never Grow Up', 'http://localhost:8200/song/source?id=1622111035876', NULL, 0, '8', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1622111065068', 'Jump Then Fall', '1622072451745', '1622074775169', '1620576000000', 'Jump Then Fall', 'http://localhost:8200/song/source?id=1622111065068', NULL, 1, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1624372266021', 'Pale Blue', '1621603618588', '1624372189519', '1624204800000', '日剧《离婚活动主题曲》', 'http://localhost:8200/song/source?id=1624372266021', NULL, 1, '26', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1624375323999', 'Love again', '1623328403156', '1624375276272', '1624377600000', 'Love again', 'http://localhost:8200/song/source?id=1624375323999', '[00:00.000] 作曲 : Clarence Coffee Jr/Dua Lipa/Chelcee Grimes/Stephen Kozmeniuk\n[00:01.000] 制作人 : koz\n[00:02.000] 低音吉他 : Stuart Price\n[00:03.000] 中提琴 : Drew Jurecka\n[00:04.000] 音频工程师 : Matt Snell\n[00:05.000] 贝斯 : koz\n[00:06.000] 混音师 : Matty Green\n[00:07.000] 编程 : Lorna Blackwood\n[00:08.000] 弦乐编写 : Drew Jurecka\n[00:09.000] 附加制作 : Stuart Price\n[00:10.000] 人声制作 : Lorna Blackwood\n[00:11.000] 母带工程师 : Chris Gehringer\n[00:12.000] 和声 : Alma Goodman/Clarence Coffee Jr/Vanessa Luciano\n[00:13.000] 人声 : Dua Lipa\n[00:33.040]I never thought that I would find a way out\n[00:37.294]I never thought I’d hear my heart beat so loud\n[00:41.288]I can’t believe there’s something left in my chest anymore\n[00:45.654]But God damn, you got me in love again\n[00:49.869]I used to think that I was made out of stone\n[00:53.784]I used to spend so many nights on my own\n[00:57.791]I never knew I had it in me to dance anymore\n[01:02.113]But God damn, you got me in love again\n[01:06.297]\n[01:06.469]Show me, that Heaven’s right here baby\n[01:10.604]Touch me, so I know I’m not crazy\n[01:14.263]Never have I ever met somebody like you\n[01:18.503]Used to be afraid of love and what it might do\n[01:22.810]But God damn, you got me in love again\n[01:27.386]\n[01:28.260]You got me in love again\n[01:32.725]You got me in love again\n[01:36.707]You got me in love again\n[01:40.502]Again\n[01:42.503]\n[01:43.427]So many nights my tears fell harder than rain\n[01:47.569]Scared I would take my broken heart to the grave\n[01:51.827]I’d rather die than have to live in a storm like before\n[01:55.964]But God damn, you got me in love again\n[02:00.209]\n[02:00.357]Show me, that Heaven’s right here baby\n[02:04.476]Touch me, so I know I’m not crazy\n[02:08.064]Never have I ever met somebody like you\n[02:12.308]Used to be afraid of love and what it might do\n[02:16.625]But God damn, you got me in love again\n[02:20.993]\n[02:22.061]You got me in love again\n[02:26.056]You got me in love again\n[02:30.480]You got me in love again\n[02:34.320]Again\n[02:36.244]\n[02:37.329]I can’t believe, I can’t believe, I finally found someone\n[02:41.398]I’ll sink my teeth in disbelief cos you’re the one that I want\n[02:45.600]I can’t believe, I can’t believe, I’m not afraid anymore\n[02:49.767]But God damn, you got me in love again\n[02:54.534]\n[02:57.871]I never thought that I would find a way out\n[03:02.084]I never thought I’d hear my heart beat so loud\n[03:06.343]I can’t believe there’s something left in my chest anymore\n[03:10.384]But God damn, you got me in love again\n[03:15.783]\n[03:23.776]I can’t believe, I can’t believe, I finally found someone\n[03:27.969]I’ll sink my teeth in disbelief cos you’re the one that I want\n[03:32.243]I can’t believe there’s something left inside my chest anymore\n[03:36.321]But God damn, you got me in love again\n[03:41.523]\n[03:41.962]You got me in love again\n[03:45.997]You got me in love again\n[03:50.341]You got me in love again\n[03:52.750]And again, and again, and again and again\n', 1, '42', '2022-05-26 14:31:37');
INSERT INTO `song` VALUES ('1624540295354', 'butter', '1622072084825', '1623419176842', '1619452800000', '2021年4月27日，防弹少年团新曲《Butter》5月21日发售 欢快夏日英文歌曲。', 'http://localhost:8200/song/source?id=1624540295354', '[00:00.000] 作词 : Jenna Andrews/Rob Grimaldi/Stephen Kirk/RM/Alex Bilowitz/Sebastian Garcia/Ron Perry\n[00:01.000] 作曲 : Jenna Andrews/Rob Grimaldi/Stephen Kirk/RM/Alex Bilowitz/Sebastian Garcia/Ron Perry\n[00:03.589]\n[00:03.883]Smooth like butter\n[00:06.004]Like a criminal undercover\n[00:08.208]Gon’ pop like trouble\n[00:10.330]Breakin’ into your heart like that\n[00:12.422]\n[00:12.908]Cool shade stunner\n[00:14.771]Yeah I owe it all to my mother\n[00:17.177]Hot like summer\n[00:19.006]Yeah I’m makin’ you sweat like that\n[00:21.081]\n[00:21.306]Break it down\n[00:21.707]\n[00:21.900]Oh when I look in the mirror\n[00:24.114]I’ll melt your heart into 2\n[00:26.334]I got that superstar glow so\n[00:29.750]Do the boogie like\n[00:30.499]Side step right left to my beat (heartbeat)\n[00:30.576]\n[00:34.795]High like the moon rock with me baby\n[00:39.026]Know that I got that heat\n[00:40.723]Let me show you ‘cause talk is cheap\n[00:43.364]Side step right left to my beat (heartbeat)\n[00:46.290]Get it, let it roll\n[00:47.883]\n[00:48.073]Smooth like butter\n[00:49.638]Pull you in like no other\n[00:51.889]Don’t need no Usher\n[00:54.144]To remind me you got it bad\n[00:56.547]\n[00:56.857]Ain’t no other\n[00:58.366]That can sweep you up like a robber\n[01:00.541]Straight up, I got ya\n[01:02.831]Makin’ you fall like that\n[01:04.804]\n[01:04.979]Break it down\n[01:05.454]\n[01:05.651]Oh when I look in the mirror\n[01:07.779]I’ll melt your heart into 2\n[01:09.956]I got that superstar glow so\n[01:13.327]Do the boogie like\n[01:14.165]\n[01:14.363]Side step right left to my beat (heartbeat)\n[01:18.348]High like the moon rock with me baby\n[01:22.608]Know that I got that heat\n[01:24.332]Let me show you ‘cause talk is cheap\n[01:26.821]Side step right left to my beat (heartbeat)\n[01:29.949]Get it, let it roll\n[01:31.753]\n[01:38.610]Get it, let it roll\n[01:47.246]Get it, let it roll\n[01:49.161]\n[01:49.379]No ice on my wrist\n[01:50.521]I\'m that n-ice guy\n[01:51.535]Got that right body and that right mind\n[01:53.697]Rollin\' up to party got the right vibe\n[01:55.726]Smooth like butter\n[01:57.015]Hate us love us\n[01:58.145]\n[01:58.427]Fresh boy pull up and we lay low\n[02:00.114]All the playas get movin’ when the bass low\n[02:02.301]Got ARMY right behind us when we say so\n[02:05.644]Let\'s go\n[02:06.549]\n[02:06.746]Side step right left to my beat (heartbeat)\n[02:11.101]High like the moon rock with me baby\n[02:14.700]Know that I got that heat\n[02:16.695]Let me show you ‘cause talk is cheap\n[02:19.509]Side step right left to my beat (heartbeat)\n[02:22.304]Get it, let it roll\n[02:23.868]\n[02:24.082]Smooth like (butter)\n[02:24.813]Cool shade (stunner)\n[02:25.852]And you know we don\'t stop\n[02:28.026]\n[02:28.236]Hot like (summer)\n[02:29.102]Ain’t no (bummer)\n[02:30.317]You be like oh my god\n[02:32.486]\n[02:32.644]We gon’ make you rock and you say (yeah)\n[02:34.830]We gon’ make you bounce and you say (yeah)\n[02:36.866]\n[02:36.958]Hotter?\n[02:37.496]Sweeter!\n[02:38.039]Cooler?\n[02:38.596]Butter!\n[02:39.239]\n[02:39.662]Get it, let it roll\n[02:41.842]\n[02:42.015] \n[02:42.188] Produced by Rob Grimaldi, Stephen Kirk, Ron Perry\n[02:42.361] (Jenna Andrews, Rob Grimaldi, Stephen Kirk, RM, Alex Bilowitz, Sebastian Garcia, Ron Perry)\n[02:42.534] \n[02:42.707] Background Vocal - Jenna Andrews\n[02:42.880] Gang Vocal - RM, SUGA, j-hope\n[02:43.053] Vocal Production - Jenna Andrews, Stephen Kirk\n[02:43.226] Vocal Arrangement - Pdogg\n[02:43.399] Recording Engineers - Pdogg @ Dogg Bounce\n[02:43.572] 			 Juan “Saucy” Peña @ Larry and George Studios\n[02:43.745] 			 Keith Parry @ Larry and George Studios\n[02:43.918] \n[02:44.091] Mix Engineer - Serban Ghenea @ MixStar Studios, Virginia Beach, VA\n[02:44.264] (Assisted by John Hanes)\n[02:44.437] Mastering Engineer - Chris Gheringer @ Sterling Sound\n', 1, '103', '2022-05-26 14:59:45');
INSERT INTO `song` VALUES ('1624546049959', '阿刁', '1624545638880', '1624545961961', '1482249600000', '阿刁', 'http://localhost:8200/song/source?id=1624546049959', NULL, 1, '5', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1624546108864', '鼓楼', '1624545638880', '1624545961961', '1482249600000', '鼓楼', 'http://localhost:8200/song/source?id=1624546108864', '[00:00.000] 作词 : 赵雷\n[00:01.000] 作曲 : 赵雷\n[00:02.000] 编曲 : 赵雷/喜子\n[00:03.000] 贝斯 : 张岭\n[00:04.000] 鼓 : 贝贝\n[00:05.000] 箱琴 : 赵雷\n[00:06.000] 口琴 : 赵雷\n[00:07.000] MIDI : 喜子\n[00:08.000] 和声 : 赵雷/孙嫣然/唐宁\n[00:09.000] 电琴：喜子\n[00:25.600]我走在鼓楼下面 路在堵着\n[00:33.790]雨后的阳光散落 人们都出来了\n[00:41.320]\n[00:41.780]执着的迷惘的文艺青年很多\n[00:49.970]如果我无聊了就会来这里坐坐\n[00:56.800]\n[00:57.920]我是个沉默不语的靠着墙壁晒太阳的过客\n[01:06.070]如果我有些倦意了 就让我在这里独自醒过\n[01:15.260]我站在鼓楼上面 一切繁华与我无关\n[01:22.790]这是个拥挤的地方  而我却很平凡\n[01:31.980]\n[01:46.900]我走在鼓楼下面 淋湿的咖啡馆\n[01:54.960]睡不着的后海边 月亮还在抽着烟\n[02:03.150]喝醉的亲吻着 快活的人不眠\n[02:11.250]唯有我倚着围栏 对过往说晚安\n[02:19.100]\n[02:51.880]我是个沉默不语的靠着车窗想念你的乘客\n[02:59.890]当107路再次经过 时间是带走青春的电车\n[03:09.070]我站在什刹海边一切甜蜜与我无关\n[03:16.550]这是个拥挤的地方 而我却很孤单\n[03:24.250]我在鼓楼 我在鼓楼\n[03:32.270]我在鼓楼\n[03:40.270]我在鼓楼 我在鼓楼\n[03:48.340]我在鼓楼\n', 0, '24', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1624546320157', '成都', '1624545638880', '1624545961961', '1482249600000', '《成都》是赵雷演唱的歌曲，由赵雷创作词曲，收录于赵雷2016年发行的音乐专辑《无法长大》', 'http://localhost:8200/song/source?id=1624546320157', '[00:00.000] 作词 : 赵雷\n[00:01.000] 作曲 : 赵雷\n[00:03.269]编曲：赵雷/喜子\n[00:05.409]\n[00:18.744]让我掉下眼泪的\n[00:22.138]不止昨夜的酒\n[00:26.187]让我依依不舍的\n[00:30.218]不止你的温柔\n[00:34.185]余路还要走多久\n[00:38.218]你攥着我的手\n[00:42.176]让我感到为难的\n[00:45.984]是挣扎的自由\n[00:52.186]分别总是在九月\n[00:55.935]回忆是思念的愁\n[00:59.878]深秋嫩绿的垂柳\n[01:03.802]亲吻着我额头\n[01:07.696]在那座阴雨的小城里\n[01:11.835]我从未忘记你\n[01:15.877]成都 带不走的 只有你\n[01:23.740]和我在成都的街头走一走\n[01:31.721]直到所有的灯都熄灭了也不停留\n[01:39.451]你会挽着我的衣袖\n[01:43.392]我会把手揣进裤兜\n[01:47.297]走到玉林路的尽头\n[01:51.364]坐在小酒馆的门口\n[02:31.189]分别总是在九月\n[02:34.726]回忆是思念的愁\n[02:38.523]深秋嫩绿的垂柳\n[02:42.552]亲吻着我额头\n[02:46.530]在那座阴雨的小城里\n[02:50.650]我从未忘记你\n[02:54.459]成都 带不走的 只有你\n[03:02.260]和我在成都的街头走一走\n[03:10.433]直到所有的灯都熄灭了也不停留\n[03:18.294]你会挽着我的衣袖\n[03:22.022]我会把手揣进裤兜\n[03:26.142]走到玉林路的尽头\n[03:30.164]坐在小酒馆的门口\n[03:38.409]和我在成都的街头走一走\n[03:46.065]直到所有的灯都熄灭了也不停留\n[03:54.019]和我在成都的街头走一走\n[04:01.809]直到所有的灯都熄灭了也不停留\n[04:09.659]你会挽着我的衣袖\n[04:13.564]我会把手揣进裤兜\n[04:17.530]走到玉林路的尽头\n[04:21.581]走过小酒馆的门口\n[04:36.177]和我在成都的街头走一走\n[04:43.454]直到所有的灯都熄灭了也不停留\n[04:53.227]\n[05:21.058]制作人：赵雷/喜子/姜北生\n[05:21.858]BASS：张岭\n[05:22.641]鼓：贝贝\n[05:23.388]钢琴：柳森\n[05:24.091]箱琴：赵雷/喜子\n[05:24.827]笛子：祝子\n[05:25.539]弦乐编写：柳森\n[05:26.258]弦乐：亚洲爱乐国际乐团\n[05:27.005]和声：朱奇迹/赵雷/旭东\n[05:27.698]童声：朵朵/天天\n', 1, '34', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1624546506142', '我们的时光', '1624545638880', '1624546413717', '1413648000000', '我们的时光', 'http://localhost:8200/song/source?id=1624546506142', '[00:00.000] 作词 : 赵雷\n[00:01.000] 作曲 : 赵雷\n[00:32.900]头顶的太阳 燃烧着青春的余热\n[00:38.900]它从来不会放弃 照耀着我们行进\n[00:44.400]寒冬不经过这里 那只是迷雾的山林\n[00:49.700]走完苍老的石桥 感到潮湿的味道\n[00:55.900]翻过了青山 你说你看头顶斗笠的人们\n[01:01.899]海风拂过椰树吹散一路的风尘\n[01:06.700]这里就像与闹市隔绝的又一个世界\n[01:12.799]让我们疲倦的身体在这里 长久地停歇\n[01:41.700]翻过了青山 你说你看头顶斗笠的人们\n[01:46.799]海风拂过椰树吹散一路的风尘\n[01:52.799]这里就像与闹市隔绝的又一个世界\n[01:58.799]让我们疲倦的身体在这里 长久地停歇\n[02:04.400]厦门的时光 是我们的时光\n[02:10.399]大海的波浪 翻滚着我们的向往\n[02:15.899]山谷里何时会再传来我们的歌声\n[02:21.399]那一些欢笑已过去 那些往昔会铭记\n[02:27.399]我们的时光 是无忧的时光\n[02:32.699]精彩的年月 不会被什么改写\n[02:38.799]放纵的笑语 时常回荡在我们耳旁\n[02:43.699]那些路上的脚印 永远不会被掩藏', 1, '57', '2022-05-26 15:16:29');
INSERT INTO `song` VALUES ('1624546835299', '吉姆餐厅', '1624545638880', '1624546413717', '1413648000000', '吉姆餐厅', 'http://localhost:8200/song/source?id=1624546835299', NULL, 0, '34', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1624547985767', '亲爱的旅人啊', '1624547670156', '1624547874208', '1560441600000', '亲爱的旅人啊', 'http://localhost:8200/song/source?id=1624547985767', NULL, 1, '18', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1624549442936', '光辉岁月', '1624549103554', '1624549188385', '898790400000', '光辉岁月', 'http://localhost:8200/song/source?id=1624549442936', NULL, 1, '6', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1624549525985', '再见理想', '1624549103554', '1624549188385', '583081200000', '再见理想', 'http://localhost:8200/song/source?id=1624549525985', NULL, 1, '7', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1624549624782', '不再犹豫', '1624549103554', '1624549188385', '583081200000', '不再犹豫', 'http://localhost:8200/song/source?id=1624549624782', NULL, 1, '17', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625056579678', '2 Much', '1621602969680', '1621948599627', '1622476800000', '2 Much', 'http://localhost:8200/song/source?id=1625056579678', NULL, 1, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625056648865', 'Deserve You', '1621602969680', '1621948599627', '1623081600000', 'Deserve You', 'http://localhost:8200/song/source?id=1625056648865', NULL, 1, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625056743569', 'As i am', '1621602969680', '1621948599627', '1623859200000', '《As I Am》是由贾斯汀·比伯录唱的一首歌曲，被收录在他的录音室专辑《Justice》', 'http://localhost:8200/song/source?id=1625056743569', NULL, 0, '16', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625056808587', 'Die For You', '1621602969680', '1621948599627', '1623600000000', 'Die For You', 'http://localhost:8200/song/source?id=1625056808587', NULL, 0, '22', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625056892758', 'Somebody', '1621602969680', '1621948599627', '1591545600000', 'Somebody', 'http://localhost:8200/song/source?id=1625056892758', NULL, 0, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625056980100', 'Hold On', '1621602969680', '1621948912106', '1623513600000', 'Hold On', 'http://localhost:8200/song/source?id=1625056980100', NULL, 0, '14', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625057125791', 'Anyone', '1621602969680', '1621949008183', '1609430400000', '《Anyone》是Justin Bieber演唱的歌曲，由 Justin Bieber/Andrew Watt/Alexander Izquierdo/Michael Johnson/Jonathan Bellion作词作曲，收录在2021年1月1日发布的专辑《Anyone》中', 'http://localhost:8200/song/source?id=1625057125791', NULL, 0, '2', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625405714713', 'DON\'T FIGHT THE FEELING', '1625405303096', '1625405674442', '1622995200000', '主打歌《Don’t fight the feeling》是一首轻快的节奏、合成器音效和具有重量感的贝斯突出的舞曲，歌词中蕴含着在生活中遇到众多选择的瞬间，相信自己的信念，自由向前奔跑的年轻强大气场，可以感受到活力四射的魅力。', 'http://localhost:8200/song/source?id=1625405714713', NULL, 0, '10', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625408435039', '爱情转移', '1621602559815', '1625408324076', '1176739200000', '《爱情转移》是陈奕迅演唱的一首歌曲，由泽日生作曲，林夕作词，陈珀、江志仁编曲，收录在陈奕迅2007年4月24日由环球唱片发行的专辑《认了吧》中。', 'http://localhost:8200/song/source?id=1625408435039', '[00:00.000] 作词 : 林夕\n[00:01.000] 作曲 : Christopher Chak\n[00:02.000] 编曲 : 陈珀/C. Y. Kong\n[00:03.000] 制作人 : 梁荣骏\n[00:22.479]徘徊过多少橱窗 住过多少旅馆\n[00:26.936]才会觉得分离也并不冤枉\n[00:31.470]感情是用来浏览 还是用来珍藏\n[00:36.127]好让日子天天都过得难忘\n[00:40.690]熬过了多久患难 湿了多少眼眶\n[00:45.232]才能知道伤感是爱的遗产\n[00:49.829]流浪几张双人床 换过几次信仰\n[00:54.413]才让戒指义无反顾的交换\n[00:58.972]把一个人的温暖 转移到另一个的胸膛\n[01:04.122]让上次犯的错反省出梦想\n[01:08.686]每个人都是这样 享受过提心吊胆\n[01:13.192]才拒绝做爱情待罪的羔羊\n[01:17.822]回忆是抓不到的月光握紧就变黑暗\n[01:22.420]等虚假的背影消失于晴朗\n[01:26.971]阳光在身上流转 等所有业障被原谅\n[01:34.498]爱情不停站 想开往地老天荒\n[01:38.852]需要多勇敢\n[01:43.146]烛光照亮了晚餐 照不出个答案\n[01:47.723]恋爱不是温馨的请客吃饭\n[01:52.282]床单上铺满花瓣 拥抱让它成长\n[01:56.848]太拥挤就开到了别的土壤\n[02:01.438]感情需要人接班 接近换来期望\n[02:06.012]期望带来失望的恶性循环\n[02:10.580]短暂的总是浪漫 漫长总会不满\n[02:15.143]烧完美好青春换一个老伴\n[02:19.741]把一个人的温暖 转移到另一个的胸膛\n[02:24.919]让上次犯的错反省出梦想\n[02:29.482]每个人都是这样 享受过提心吊胆\n[02:34.019]才拒绝做爱情待罪的羔羊\n[02:38.578]回忆是抓不到的月光握紧就变黑暗\n[02:43.181]等虚假的背影消失于晴朗\n[02:47.745]阳光在身上流转 等所有业障被原谅\n[02:54.608]爱情不停站 想开往地老天荒\n[02:59.236]需要多勇敢\n[03:03.937]把一个人的温暖 转移到另一个的胸膛\n[03:09.211]让上次犯的错反省出梦想\n[03:13.935]每个人都是这样 享受过提心吊胆\n[03:18.629]才拒绝做爱情待罪的羔羊\n[03:23.308]回忆是抓不到的月光握紧就变黑暗\n[03:28.033]等虚假的背影消失于晴朗\n[03:32.780]阳光在身上流转 等所有业障被原谅\n[03:41.888]爱情不停站 想开往地老天荒\n[03:47.241]需要多勇敢\n[03:52.424]你不要失望 荡气回肠是为了\n[03:57.182]最美的平凡\n[04:00.984]\n[04:03.699]Production Coordination: Stanley Leung\n[04:04.699]Keyboards & Programming: 陈珀 / C.Y.Kong (江志仁)\n[04:05.699]Drums: Davy Chan (陈匡荣)\n[04:06.699]Bass: 细威\n[04:07.699]Guitar: Joey Tang (邓建明)\n[04:08.699]Percussion: Davy Chan & Kevin (Hardpack)\n[04:09.699]Strings Arranged & Conducted by 陈珀\n[04:10.699]Recorded at aroom studio & seewisehk,\n[04:11.699]Engineered by Davy Chan, Rob Porter & C.Y.Kong\n[04:12.699]Vocals Recorded at Avon Studios,\n[04:13.699]Engineered by Anthony Leung\n[04:14.699]Mixed by Simon Li at nOiz\n[04:15.699]OP: Forward Music Publishing Co Ltd / Denseline Co Ltd\n[04:16.699]SP: Fujipacific Music (S.E. Asia) Ltd / Warner Chappell Music Hong Kong Limited\n', 0, '22', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625408496042', '烟味', '1621602559815', '1625408324076', '1176739200000', '烟味', 'http://localhost:8200/song/source?id=1625408496042', NULL, 1, '7', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1625408572563', '好久不见', '1621602559815', '1625408324076', '1176739200000', '好久不见', 'http://localhost:8200/song/source?id=1625408572563', NULL, 0, '5', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1626233266278', '分飞', '1626233168015', '1626233207593', '946656000000', '《分飞》是黄郁作词，陈国华作曲，徐怀钰演唱的歌曲，于2000年1月1日发行', 'http://localhost:8200/song/source?id=1626233266278', '[00:00.000] 作词 : 黄郁\n[00:01.000] 作曲 : 陈国华\n[00:02.000] 编曲 : Terence Teo\n[00:25.02]你和我 相约在\n[00:27.74]午夜喧哗的大街\n[00:30.64]告诉我 这段感情\n[00:33.43]今夜将会是终点\n[00:36.17]傻傻地 看着你\n[00:39.00]眼角不流一滴泪\n[00:41.90]说好了 要坚强\n[00:44.72]不流泪\n[00:47.62]我以为 我可以\n[00:50.36]让爱变得很甜美\n[00:53.18]才发现 爱情竟是\n[00:56.05]一场残酷的考验\n[00:58.80]太愚昧 太依恋\n[01:01.64]才放你去自由飞\n[01:04.47]一瞬间 爱决堤\n[01:07.34]在今夜\n[01:13.06]雨纷飞\n[01:14.70]飞在天空里是我的眼泪\n[01:18.60]泪低垂\n[01:20.37]垂在手心里是你的余味\n[01:24.29]谁了解\n[01:26.09]真心的付出换来是离别\n[01:30.06]我知道\n[01:31.76]爱过后会心碎\n[01:35.63]我相信\n[01:37.27]爱情没有永远\n[02:06.59]我以为 我可以\n[02:09.49]让爱变得很甜美\n[02:12.31]才发现 爱情竟是\n[02:15.13]一场残酷的考验\n[02:17.92]太愚昧 太依恋\n[02:20.82]才放你去自由飞\n[02:23.62]一瞬间 爱决堤\n[02:26.41]在今夜\n[02:32.21]雨纷飞\n[02:33.87]飞在天空里是我的眼泪\n[02:37.76]泪低垂\n[02:39.48]垂在手心里是你的余味\n[02:43.36]谁了解\n[02:45.14]真心的付出换来是离别\n[02:49.03]我知道\n[02:50.76]爱过后会心碎\n[02:54.70]我相信\n[02:56.35]爱情没有永远\n[03:00.40]雨纷飞\n[03:02.07]飞在天空里是我的眼泪\n[03:05.93]泪低垂\n[03:07.84]垂在手心里是你的余味\n[03:11.60]谁了解\n[03:13.35]真心的付出换来是离别\n[03:17.30]我知道\n[03:18.99]爱过后会心碎\n[03:22.91]我相信\n[03:24.71]爱情没有永远', 1, '18', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1626272735139', 'How You Like That', '1626234023583', '1626272577568', '1601568000000', '《HOW YOU LIKE THAT》是由韩国女子演唱组合BLACKPINK演唱的一首歌曲，歌词为英语和韩语，该歌曲于2020年6月26日在各个音乐平台公开音源', 'http://localhost:8200/song/source?id=1626272735139', NULL, 1, '19', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1626272793322', 'Ice Cream', '1626234023583', '1626272577568', '1601568000000', 'Ice Cream', 'http://localhost:8200/song/source?id=1626272793322', NULL, 1, '2', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1626272834782', 'Pretty Savage', '1626234023583', '1626272577568', '1601568000000', 'Pretty Savage', 'http://localhost:8200/song/source?id=1626272834782', NULL, 1, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1626272881558', 'Lovesick Girls', '1626234023583', '1626272577568', '1601568000000', 'Lovesick Girls', 'http://localhost:8200/song/source?id=1626272881558', NULL, 0, '5', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1626272930895', 'Crazy Over You', '1626234023583', '1626272577568', '1601568000000', 'Crazy Over You', 'http://localhost:8200/song/source?id=1626272930895', NULL, 0, '2', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1626272963986', 'Love To Hate Me', '1626234023583', '1626272577568', '1601568000000', 'Love To Hate Me', 'http://localhost:8200/song/source?id=1626272963986', NULL, 1, '2', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1626273066287', 'You Never Know', '1626234023583', '1626272577568', '1601568000000', 'You Never Know', 'http://localhost:8200/song/source?id=1626273066287', NULL, 0, '10', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1626274222518', 'Permission to Dance', '1622072084825', '1623419176842', '1625068800000', 'Permission to Dance', 'http://localhost:8200/song/source?id=1626274222518', NULL, 1, '28', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1626360701597', 'Rage your dream', '1626360481630', '1626360628102', '1405008000000', 'Rage your dream', 'http://localhost:8200/song/source?id=1626360701597', '[00:00.77]作曲：木村贵志\n[00:01.77]作词：motsu\n[00:02.77]I got no impression\n[00:06.69]This town is made by imitation\n[00:10.58]Wanting your sensation\n[00:14.34]In this silly simulation\n[00:17.39]I wanna rage my dream\n[00:46.29]I got no impression　grayの感情\n[00:50.15]ボカシも入れ過ぎ　街中はimitation\n[00:54.12]Realを求めて　昂ぶるあなたが\n[00:58.12]近くによれないほどにアツくなる\n[01:02.13]Feel your frustration　あなたの叫びを\n[01:10.04]Taste your vibration　震える程に感じてる\n[01:17.68]Rage your dream　時を駆け抜けてゆく\n[01:21.59]風も　光満ちてゆく\n[01:25.62]Rage your dream　待っていることだけを\n[01:29.62]Feel the wind　忘れないでいて\n[01:33.96]Rage your dream　続く果てない道を\n[01:37.51]愛も過去も振り向かず\n[01:41.57]ゆける　あなた輝いている\n[01:45.57]Rage your dream　今を生きている\n[01:50.12]My pride says You gatta be wild and tough\n[01:52.62]そう　他人は介在しない\n[01:54.58]never stop　止まりたくない\n[01:56.43]犠牲になった愛がcryしても\n[01:58.43]Peak目指してsweep the winding road\n[02:00.39]Beep beep!　警告音なんてcheap\n[02:02.29]Sheep達は道あける\n[02:04.03]Coz I\'m never gonna stop streak my dream\n[02:06.23]Easyなmotivation　すべてはsimulation\n[02:10.09]逃げてみたって　何処でもsafety zone\n[02:14.09]何かを手に入れて　何かを忘れてく\n[02:18.15]世界は壊れても　変わらない\n[02:22.06]Beasty shout　誰の手にさえ負えない\n[02:30.12]激しい夢　時間さえも今越えてく\n[02:37.62]Rage your dream　風の中で眩しく\n[02:41.59]叫ぶあなた　夢達と\n[02:45.61]Rage your dream　鼓動止まる位に\n[02:49.63]I can feel　強く感じてる\n[02:53.80]Rage your dream　闇をはり裂いていく\n[02:57.61]Like a streak to the peak　世界中の\n[03:01.71]凍えきった夜を消してく\n[03:05.62]Rage your dream　道を開いてく\n[03:10.07]Di-ding dang another round, never slowdown\n[03:12.38]コンマゼロイチ秒でKnock down\n[03:14.38]余韻残し消えてこうto the next town\n[03:16.68]埃舞う　敗者地に這う\n[03:18.44]理屈だけのノーガキ達\n[03:20.29]邪魔クサイからシカトしていこう\n[03:22.34]Streaker去っていくStreetの向こう\n[03:24.45]Something they would know\n[03:25.79]Rage your dream　時を駆け抜けてゆく\n[03:29.65]風も　光満ちてゆく\n[03:33.70]Rage your dream　待っていることだけを\n[03:37.65]Feel the wind　忘れないでいて\n[03:41.70]Rage your dream　続く果てない道を\n[03:45.84]愛も過去も振り向かず\n[03:49.70]ゆける　あなた輝いている\n[03:53.70]Rage your dream　今を生きている\n', 0, '40', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1633919156741', '遇见', '1633918820863', '1633919083723', '1498838400000', '《遇见》是电影《向左走，向右走》的主题曲，是由易家扬作词，林一峰作曲，孙燕姿演唱的歌曲。收录于2003年8月1日发行的《The Moment》专辑中。', 'http://localhost:8200/song/source?id=1633919156741', '[00:00.000] 作词 : 易家扬\n[00:01.000] 作曲 : 林一峰\n[00:25.11]听见 冬天的离开\n[00:29.64]我在某年某月 醒过来\n[00:34.67]我想 我等 我期待\n[00:40.21]未来却不能因此安排\n[00:53.17]阴天 傍晚 车窗外\n[00:58.57]未来有一个人在等待\n[01:03.72]向左向右向前看\n[01:08.82]爱要拐几个弯才来\n[01:14.59]我遇见谁 会有怎样的对白\n[01:19.26]我等的人 他在多远的未来\n[01:24.67]我听见风来自地铁和人海\n[01:29.82]我排着队 拿着爱的号码牌\n[01:56.32]阴天 傍晚 车窗外\n[02:01.48]未来有一个人在等待\n[02:06.64]向左向右向前看\n[02:11.60]爱要拐几个弯才来\n[02:16.30]我遇见谁 会有怎样的对白\n[02:22.04]我等的人 他在多远的未来\n[02:26.89]我听见风来自地铁和人海\n[02:32.16]我排着队 拿着爱的号码牌\n[02:43.11]我往前飞 飞过一片时间海\n[02:47.76]我们也曾在爱情里受伤害\n[02:52.95]我看着路 梦的入口有点窄\n[02:58.00]我遇见你是最美丽的意外\n[03:05.90]总有一天 我的谜底会揭开\n', 1, '36', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1633946260220', '淋雨一直走', '1633945997178', '1633946154102', '1349971200000', '《淋雨一直走》是张韶涵演唱的一首歌曲，收录在张韶涵发行的专辑《有形的翅膀》中。', 'http://localhost:8200/song/source?id=1633946260220', '[00:00.000] 作词 : 姚若龙\n[00:01.000] 作曲 : Hermanni Kovalainen/Ilanguaq Lumholt/Henrik Tala\n[00:02.000] 编曲 : DJ Mobster Productions\n[00:03.000] 制作人 : Jae Chong\n[00:04.720]Oh～  人都应该有梦\n[00:07.420]有梦就别怕痛\n[00:12.050]有雷声在轰不停\n[00:14.430]雨泼进眼里看不清\n[00:16.970]谁急速狂飙\n[00:18.300]溅我一身 的泥泞\n[00:22.060]很确定我想去哪里\n[00:24.620]往天堂要跳过地狱\n[00:27.220]也不恐惧\n[00:28.600]不逃避\n[00:30.460]\n[00:30.710]这不是脾气\n[00:32.970]是所谓志气 与勇气\n[00:36.880]你能推我下悬崖\n[00:39.360]我能学会飞行\n[00:41.310]从不听\n[00:43.440]谁的命令\n[00:45.940]很独立\n[00:46.850]耳朵用来听自己的心灵\n[00:51.270]\n[00:51.580]淋雨一直走\n[00:53.910]是一颗宝石就该闪烁\n[00:57.100]人都应该有梦\n[00:58.630]Oh\n[00:59.660]有梦就别怕痛\n[01:01.550]淋雨一直走\n[01:04.020]是道阳光就该暖和\n[01:07.220]人都应该有梦\n[01:08.740]Oh\n[01:09.750]有梦就别怕痛\n[01:11.740]\n[01:16.060]有前面盘旋的秃鹰\n[01:18.810]有背后尖酸的耳语\n[01:21.400]黑色的童话\n[01:22.720]是给长大的洗礼\n[01:26.470]要独特才是流行\n[01:28.880]无法复制的自己\n[01:31.470]让我连受伤也有型\n[01:34.940]这不是脾气\n[01:37.340]是所谓志气 与勇气\n[01:41.130]你能推我下悬崖\n[01:43.770]我能学会飞行\n[01:45.580]从不听\n[01:47.870]谁的命令\n[01:50.310]很独立\n[01:51.230]耳朵用来听自己的心灵\n[01:55.660]\n[01:56.070]淋雨一直走\n[01:58.260]是一颗宝石就该闪烁\n[02:01.460]人都应该有梦\n[02:03.000]Oh\n[02:03.870]有梦就别怕痛\n[02:05.870]淋雨一直走\n[02:08.390]是道阳光就该暖和\n[02:11.610]人都应该有梦\n[02:13.090]Oh\n[02:14.100]有梦就别怕痛\n[02:15.600]\n[02:16.440]\n[02:17.410]有时掉进黑洞\n[02:20.010]有时候爬上彩虹\n[02:22.510]在下一秒钟\n[02:23.680]命运如何转动\n[02:24.900]没有人会晓得 Oh\n[02:27.590]我说希望无穷\n[02:30.100]你猜美梦成空\n[02:32.640]相信和怀疑\n[02:34.070]总要决斗\n[02:38.650]\n[02:39.260]淋雨一直走\n[02:41.650]是一颗宝石就该闪烁\n[02:44.780]人都应该有梦\n[02:46.260]Oh\n[02:47.340]有梦就别怕痛\n[02:49.270]淋雨一直走\n[02:51.810]是道阳光就该暖和\n[02:55.010]人都应该有梦\n[02:56.940]Oh\n[02:57.550]有梦就别怕痛\n[02:59.030]\n[02:59.640]淋雨一直走\n[03:01.970]是一颗宝石就该闪烁\n[03:05.110]人都应该有梦\n[03:06.640]Oh\n[03:07.710]有梦就别怕痛\n[03:09.640]淋雨一直走\n[03:12.180]是道阳光就该暖和\n[03:15.320]人都应该有梦\n[03:16.860]Oh\n[03:17.890]有梦就别怕痛\n[03:19.608]OC/OA : Hermanni Kovalainen/Ilanguaq Lumholt/Henrik Tala\n[03:19.720]\n[03:20.341]配唱制作人 : Jae Chong\n[03:20.641]计算机程序编写 : DJ Mobster\n[03:20.925]录音师 : 潘尧泓\n[03:21.209]录音室 : Lights Up Studio (台北)\n[03:21.443]混音师 : Jae Chong\n[03:21.689]混音室 : AZIATIX Studio\n[03:21.923]OP : Warner/Chappell Music Finland / DJ Mobster Publishing\n[03:22.169]SP : Warner/Chappell Music Taiwan Ltd.\n[03:22.441]ISRC TW-R03-12-02003', 0, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1633946866771', '千千阙歌', '1633946433290', '1633946790475', '617295600000', '《千千阙歌》是陈慧娴演唱的一首粤语歌曲，由林振强作词，马饲野康二作曲，卢东尼编曲，欧丁玉、陈永明、陈慧娴共同担任制作人，收录于1989年7月25日由环球唱片发行的专辑《永远是你的朋友》中', 'http://localhost:8200/song/source?id=1633946866771', '[00:00.000] 作词 : 林振强\n[00:01.000] 作曲 : Kohji Makanio\n[00:02.000] 编曲 : 卢东尼\n[00:03.000] 制作人 : 欧丁玉/陈永明/陈慧娴\n[00:15.50]徐徐回望\n[00:17.86]曾属于彼此的晚上\n[00:22.70]红红仍是你\n[00:24.75]赠我的心中艳阳\n[00:29.37]如流傻泪\n[00:31.92]祈望可体恤兼见谅\n[00:36.60]明晨离别你\n[00:39.00]路也许孤单得漫长\n[00:43.76]一瞬间 太多东西要讲\n[00:47.11]可惜即将在各一方\n[00:50.11]只好深深把这刻尽凝望\n[00:56.75]来日纵使千千阙歌\n[01:00.30]飘于远方我路上\n[01:03.93]来日纵使千千晚星\n[01:07.38]亮过今晚月亮\n[01:11.62]都比不起这宵美丽\n[01:15.08]亦绝不可使我更欣赏\n[01:18.28]AH 因你今晚共我唱\n[01:58.09]临行临别\n[02:00.29]才顿感哀伤的漂亮\n[02:05.15]原来全是你\n[02:07.36]令我的思忆漫长\n[02:12.24]何年何月\n[02:14.39]才又可今宵一样\n[02:18.68]停留凝望里\n[02:21.53]让眼睛讲彼此立场\n[02:26.12]当某天\n[02:27.38]雨点轻敲你窗\n[02:29.33]当风声吹乱你构想\n[02:32.69]可否抽空想这张旧模样\n[02:39.36]来日纵使千千阙歌\n[02:42.87]飘于远方我路上\n[02:46.39]来日纵使千千晚星\n[02:49.82]亮过今晚月亮\n[02:54.10]都比不起这宵美丽\n[02:57.39]亦绝不可使我更欣赏\n[03:00.89]AH 因你今晚共我唱\n[03:21.07]HA 怎都比不起这宵美丽\n[03:25.73]亦绝不可使我更欣赏\n[03:29.13]因今宵的我可共你唱\n[03:35.99]来日纵使千千阙歌\n[03:39.34]飘于远方我路上\n[03:42.99]来日纵使千千晚星\n[03:46.14]亮过今晚月亮\n[03:50.49]都比不起这宵美丽\n[03:53.95]亦绝不可使我更欣赏\n[03:57.30]AH 因你今晚共我唱\n[04:04.09]来日纵使千千阙歌\n[04:07.55]飘于远方我路上\n[04:11.25]来日纵使千千晚星\n[04:14.55]亮过今晚月亮\n[04:18.68]都比不起这宵美丽\n[04:22.18]都洗不清今晚我所想\n[04:25.63]因不知哪天再共你唱\n[04:53.538]Keyboards : 卢东尼/大谷幸\n[04:53.924]Drums : 冈本郭男\n[04:54.141]Bass : 渡边茂树\n[04:54.363]Guitars : 苏德华/伊丹雅博\n[04:54.556]Strings : Encora\n[04:54.746]Chorus : Nancy/May/李小梅/Patrick/Donald/Michael/Priscilla\n[04:54.962]Studios : Dragon Studio/Nippon Phonogram(Rhythm section)/EMI HK (Strings section)\n[04:55.196]OP : Johnny Co. Inc.\n[04:55.421]SP : Taiyo Music (HK) Ltd.', 0, '16', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1634362102513', '夜空中最亮的星', '1634361905977', '1634362031980', '1325260800000', '《夜空中最亮的星》是逃跑计划演唱的一首歌，由逃跑计划填词谱曲，收录于逃跑计划2011年发行的首张专辑《世界》中，同时还是微电影《摘星的你》主题曲  ，电影《流浪地球》片尾曲', 'http://localhost:8200/song/source?id=1634362102513', '[00:00.000] 作词 : 毛川/李赤\n[00:01.000] 作曲 : 毛川\n[00:02.000] 编曲 : Giles Tully/李赤\n[00:03.000] 制作人 : Giles Tully/李赤\n[00:17.680]夜空中最亮的星 能否听清\n[00:26.230]那仰望的人 心底的孤独和叹息\n[00:35.650]夜空中最亮的星 能否记起\n[00:44.210]曾与我同行 消失在风里的身影\n[00:52.540]我祈祷拥有一颗透明的心灵\n[00:57.640]和会流泪的眼睛\n[01:01.880]给我再去相信的勇气\n[01:06.400]越过谎言去拥抱你\n[01:10.420]每当我找不到存在的意义\n[01:15.300]每当我迷失在黑夜里\n[01:20.160]夜空中最亮的星\n[01:24.270]请指引我靠近你\n[01:37.880]夜空中最亮的星 是否知道\n[01:46.450]曾与我同行的身影 如今在哪里\n[01:55.450]夜空中最亮的星 是否在意\n[02:03.950]是等太阳升起 还是意外先来临\n[02:12.370]我宁愿所有痛苦都留在心里\n[02:17.690]也不愿忘记你的眼睛\n[02:22.270]给我再去相信的勇气\n[02:26.400]越过谎言去拥抱你\n[02:30.350]每当我找不到存在的意义\n[02:35.270]每当我迷失在黑夜里\n[02:40.720]夜空中最亮的星 请照亮我前行\n[03:05.420]我祈祷拥有一颗透明的心灵\n[03:10.870]和会流泪的眼睛\n[03:15.930]给我再去相信的勇气\n[03:19.660]越过谎言去拥抱你\n[03:23.600]每当我找不到存在的意义\n[03:28.760]每当我迷失在黑夜里\n[03:33.540]夜空中最亮的星\n[03:37.590]请照亮我前行\n[03:50.890]夜空中最亮的星 能否听清\n[03:59.810]那仰望的人 心底的孤独和叹息\n[04:00.463] 混音 : Giles Tully/Patrick Weyer-Brown/姜北生\n[04:01.116] 女声和声 : 孙亮亮\n[04:01.769] 弦乐制作 : 朱金泰\n[04:02.422] 弦乐编写 : 朱金泰/陈迪\n[04:03.075] 弦乐 : 中国国家交响乐团\n[04:03.728] 首席小提琴 : 董智敏\n[04:04.381] 录音棚 : 有沐录音棚 YUM Studio\n[04:05.034] 弦乐录音 : 杨杰/郑昊杰\n[04:05.687] 制作助理 : 哈斯瑚必来\n[04:06.340] 母带 : Patrick Weyer-Brown (FR) 法国SAE Paris 录音棚\n[04:06.993] Engineered by Hyperbolic Productions (Patrick Weyer-Brown & Giles Tully)\n[04:07.646] \n[04:08.299] Acoustic Guitar & Drum recorded by Hyperbolic Productions (Patrick Weyer-Brown) at YUM music\n[04:08.952] \n[04:09.605] Guitar Bass Vocal recorded by Hyperbolic Productions (Patrick Weyer-Brown & Giles Tully)\n[04:10.258] \n[04:10.911] 其他录音：时俊峰 福达录音棚 / 姜北生 环球唱片录音棚 / 方岩 Funky Studio\n[04:11.564] \n[04:12.217] 人声和声：逃跑计划\n', 1, '11', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1634458012381', 'again', '1634457797551', '1634457950420', '1243958400000', '歌曲《Again》在2009年6月3日发售，因其歌词和旋律与《钢之炼金术师》的世界观非常相近而深受粉丝的喜爱。', 'http://localhost:8200/song/source?id=1634458012381', NULL, 0, '6', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1634531821765', '有何不可', '1621602754351', '1634531460174', '1231516800000', '《有何不可》是2009年许嵩（Vae）演唱的歌曲，收录于专辑《自定义》中。', 'http://localhost:8200/song/source?id=1634531821765', '[00:00.000] 作词 : 许嵩\n[00:01.000] 作曲 : 许嵩\n[00:22.240]天空好想下雨\n[00:24.380]我好想住你隔壁\n[00:26.810]傻站在你家楼下\n[00:29.500]抬起头数乌云\n[00:31.160]如果场景里出现一架钢琴\n[00:33.640]我会唱歌给你听\n[00:35.900]哪怕好多盆水往下淋\n[00:41.060]夏天快要过去\n[00:43.340]请你少买冰淇淋\n[00:45.680]天凉就别穿短裙\n[00:47.830]别再那么淘气\n[00:50.060]如果有时不那么开心\n[00:52.470]我愿意将格洛米借给你\n[00:55.020]你其实明白我心意\n[00:58.290]为你唱这首歌没有什么风格\n[01:02.976]它仅仅代表着我想给你快乐\n[01:07.840]为你解冻冰河为你做一只扑火的飞蛾\n[01:12.998]没有什么事情是不值得\n[01:17.489]为你唱这首歌没有什么风格\n[01:21.998]它仅仅代表着我希望你快乐\n[01:26.688]为你辗转反侧为你放弃世界有何不可\n[01:32.328]夏末秋凉里带一点温热有换季的颜色\n[01:41.040]\n[01:57.908]天空好想下雨\n[01:59.378]我好想住你隔壁\n[02:02.296]傻站在你家楼下\n[02:03.846]抬起头数乌云\n[02:06.183]如果场景里出现一架钢琴\n[02:08.875]我会唱歌给你听\n[02:10.974]哪怕好多盆水往下淋\n[02:15.325]夏天快要过去\n[02:18.345]请你少买冰淇淋\n[02:21.484]天凉就别穿短裙\n[02:22.914]别再那么淘气\n[02:25.185]如果有时不那么开心\n[02:27.625]我愿意将格洛米借给你\n[02:30.015]你其实明白我心意\n[02:33.327]为你唱这首歌没有什么风格\n[02:37.976]它仅仅代表着我想给你快乐\n[02:42.835]为你解冻冰河为你做一只扑火的飞蛾\n[02:48.406]没有什么事情是不值得\n[02:52.416]为你唱这首歌没有什么风格\n[02:57.077]它仅仅代表着我希望你快乐\n[03:01.993]为你辗转反侧为你放弃世界有何不可\n[03:07.494]夏末秋凉里带一点温热\n[03:11.536]\n[03:20.924]为你解冻冰河为你做一只扑火的飞蛾\n[03:26.615]没有什么事情是不值得\n[03:30.525]为你唱这首歌没有什么风格\n[03:35.196]它仅仅代表着我希望你快乐\n[03:39.946]为你辗转反侧为你放弃世界有何不可\n[03:45.644]夏末秋凉里带一点温热有换季的颜色\n', 0, '42', '2022-05-26 15:03:24');
INSERT INTO `song` VALUES ('1634541304221', '纸短情长', '1634530730835', '1634541272001', '1539014400000', ' 蝉夏曾有你，城市曾有你。\n你曾有欢笑，你曾有不舍。\n而我，书写过一个又一个的雨季。\n轻轻地吹起这片纸，从正面到反面，都看不尽这故事。\n“我的故事还是关于你啊。” ', 'http://localhost:8200/song/source?id=1634541304221', '[00:00.000] 作词 : yes\n[00:01.000] 作曲 : yes\n[00:10.080]你陪我步入蝉夏 越过城市喧嚣\n[00:16.370]歌声还在游走 你榴花般的双眸\n[00:21.590]不见你的温柔 丢失花间欢笑\n[00:27.560]岁月无法停留 流云的等候\n[00:33.600]我真的好想你 在每一个雨季\n[00:38.750]你选择遗忘的 是我最不舍的\n[00:43.790]纸短情长啊 道不尽太多涟漪\n[00:49.060]我的故事都是关于你呀\n[00:53.430]怎么会爱上了他 并决定跟他回家\n[00:58.450]放弃了我的所有我的一切无所谓\n[01:03.190]纸短情长啊 诉不完当时年少\n[01:08.700]我的故事还是关于你啊\n[01:14.240]\n[01:32.350]你陪我步入蝉夏 越过城市喧嚣\n[01:38.040]歌声还在游走 你榴花般的双眸\n[01:42.570]不见你的温柔 丢失花间欢笑\n[01:47.310]岁月无法停留 流云的等候\n[01:52.590]我真的好想你 在每一个雨季\n[01:57.070]你选择遗忘的 是我最不舍的\n[02:01.980]纸短情长啊 道不尽太多涟漪\n[02:07.020]我的故事都是关于你呀\n[02:11.170]怎么会爱上了他 并决定跟他回家\n[02:16.370]放弃了我的所有我的一切无所谓\n[02:21.040]纸短情长啊 诉不完当时年少\n[02:26.420]我的故事还是关于你啊\n[02:32.460]\n[02:41.110]你陪我步入蝉夏 越过城市喧嚣\n[02:47.150]歌声还在游走 你榴花般的双眸\n[02:52.260]不见你的温柔 丢失花间欢笑\n[02:58.380]岁月无法停留 流云的等候\n[03:02.090]监制:姚政 唐晶晶\n[03:03.020]制作人:刘凯波\n[03:03.940]编曲:刘凯波\n[03:04.670]吉他:艾宇\n[03:05.150]Vocal录音:徐真真\n[03:05.640]Mix&Mastering：刘凯波\n[03:06.150]\n[99:00.01]本歌曲来自〖网易音乐人〗\n[99:00.02]10亿现金激励，千亿流量扶持！\n[99:00.03]合作：st399@vip.163.com\n', 1, '72', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635337922244', '对你爱不完', '1635337356115', '1635337496777', '754675200000', '对你爱不完》是郭富城于1990年发行的个人第一张普通话专辑，共收录了10首歌曲。该专辑由陈秀男担任制作人', 'http://localhost:8200/song/source?id=1635337922244', '[00:00.000] 作词 : 陈乐融\n[00:01.000] 作曲 : 羽田一郎\n[00:02.000] 编曲 : Ricky Ho\n[00:03.000]\n[00:42.671]灯初上夜未央\n[00:44.643]来往的人多匆忙\n[00:46.906]我不要太紧张\n[00:48.895]和别人一模样\n[00:50.676]但是你对我望\n[00:52.720]两只眼睛大又亮\n[00:54.933]我开始失去了主张\n[00:57.341]\n[00:58.700]风吹得路好长\n[01:00.776]一颗心晃呀晃\n[01:02.766]多想找人陪我逛\n[01:04.712]累了睡在马路上\n[01:06.721]表面上很倔强\n[01:08.752]其实内心一团糟\n[01:11.057]怕自己爱得像太阳\n[01:14.789](Hey, let\'s go)\n[01:16.766]胸中藏着一把火\n[01:18.819](Dancing in the night)\n[01:20.828]这种日子不好过\n[01:23.039]把承诺交给你\n[01:25.023]把微笑当作信\n[01:27.071]却怎么也抓不住你\n[01:30.379]对你爱爱爱不完\n[01:34.090]我可以天天月月年年到永远\n[01:38.359]So we love love love tonight\n[01:42.082]不愿意丝丝点点些些去面对\n[01:46.412]对你爱爱爱不完\n[01:50.181]相爱 原本 总是 这么难\n[01:54.388]\n[02:10.981]风吹得路好长\n[02:13.038]一颗心晃呀晃\n[02:15.063]多想找人陪我逛\n[02:17.045]累了睡在马路上\n[02:19.061]表面上很倔强\n[02:21.109]其实内心一团糟\n[02:23.339]怕自己爱得像太阳\n[02:27.037](Hey, let\'s go)\n[02:29.092]胸中藏着一把火\n[02:31.088](Dancing in the night)\n[02:33.097]这种日子不好过\n[02:35.301]把承诺交给你\n[02:37.341]把微笑当作信\n[02:39.338]却怎么也抓不住你\n[02:42.595]对你爱爱爱不完\n[02:46.375]我可以天天月月年年到永远\n[02:50.647]So we love love love tonight\n[02:54.415]不愿意丝丝点点些些去面对\n[02:58.696]对你爱爱爱不完\n[03:02.438]相爱 原本 总是 这么难\n[03:06.685]\n[03:30.824]对你爱爱爱不完\n[03:34.553]我可以天天月月年年到永远\n[03:38.829]So we love love love tonight\n[03:42.602]不愿意丝丝点点些些去面对\n[03:46.840]对你爱爱爱不完\n[03:50.623]相爱 原本 总是 这么难\n[03:54.869]对你爱爱爱不完\n[03:58.693]我可以天天月月年年到永远\n[04:02.948]So we love love love tonight\n[04:06.711]不愿意丝丝点点些些去面对\n[04:10.981]对你爱爱爱不完\n[04:14.646]相爱 原本 总是 这么难\n[04:19.036]\n', 1, '33', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635340172627', 'loser', '1621603618588', '1635340071562', '1474992000000', '《Loser》是米津玄师(よねづけんし)演唱的歌曲，收录在2016年9月28日《Loser / ナンバーナイン》专辑中。', 'http://localhost:8200/song/source?id=1635340172627', NULL, 1, '15', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635340334894', '春雷', '1621603618588', '1635340071562', '1474992000000', '《春雷》是米津玄师创作的单曲，收录在专辑BOOTLEG里', 'http://localhost:8200/song/source?id=1635340334894', NULL, 0, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635340469770', '打上火花', '1621603618588', '1635340071562', '1474992000000', '《打上花火》（打ち上げ花火）是由米津玄师填词、谱曲并与DAOKO共同演唱的歌曲，发布于2017年8月16日，是日本动画电影《升起的烟花，从下面看？还是从侧面看？》的主题曲', 'http://localhost:8200/song/source?id=1635340469770', NULL, 1, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635429386379', 'Time after Time', '1635339003293', '1635339149495', '908380800000', '名侦探柯南剧场版《迷宫的十字路口》主题曲', 'http://localhost:8200/song/source?id=1635429386379', NULL, 0, '15', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635429830242', '星辰大海', '1634531008629', '1635338243811', '1610640000000', '《星辰大海》是由瞿子千、刘涛、温莨作词，瞿子千、刘涛作曲，黄霄雲演唱的歌曲，发行于2021年1月15日。 [1]  收录于同名专辑《星辰大海》中。', 'http://localhost:8200/song/source?id=1635429830242', '[00:00.000] 作词 : 温莨/瞿子千/刘涛\n[00:01.000] 作曲 : 瞿子千/刘涛\n[00:02.000] 编曲 : 瞿子千\n[00:03.000] 制作人 : 瞿子千/刘涛\n[00:15.579]我愿变成一颗恒星\n[00:20.899]守护海底的蜂鸣\n[00:26.510]It\'s my dream it\'s magic\n[00:29.565]照亮你的心\n[00:32.182]To your eyes 有多远的距离\n[00:37.732]穿过人海 别停下来\n[00:40.822]趁现在还有期待\n[00:46.389]会不会我们的爱\n[00:49.071]会被风吹向大海\n[00:53.356]不再回来\n[00:57.473]每当你向我走来\n[01:00.936]告诉我星辰大海\n[01:15.018]遥遥微光 与我同行\n[01:17.839]盛开在黎明\n[01:20.662]To your eyes 有多远的距离\n[01:26.400]穿过人海 别停下来\n[01:29.358]趁现在还有期待\n[01:34.989]会不会我们的爱\n[01:38.087]会被风吹向大海\n[01:41.635]不再回来\n[01:45.802]每当你向我走来\n[01:49.485]告诉我星辰大海\n[02:15.098]趁现在还有期待\n[02:20.412]会不会我们的爱\n[02:23.342]会被风吹向大海\n[02:27.409]不再回来\n[02:31.909]每当你向我走来\n[02:35.078]告诉我星辰大海\n[02:43.573]会不会我们的爱\n[02:46.473]像星辰守护大海\n[02:50.038]不曾离开\n[02:54.789]我向你奔赴而来\n[02:57.889]你就是星辰大海\n[03:11.932]我眼中炽热的恒星\n[03:18.352]长夜里照我前行\n[03:19.030] 吉他 : 谭侃侃/瞿子千\n[03:19.708] 弦乐 : Maosir\n[03:20.386] 和声 : 金天/瞿子千/黄霄雲/郭钰菲/陆晶晶\n[03:21.064] 混音工程师 : 刘振东\n[03:21.742] 母带后期混音师 : 刘振东\n[03:22.420] 监制 : 陶诗\n[03:23.098] 艺人统筹 : 高赫阳/吉娜\n[03:23.776] 录音棚 : 好乐无荒（北京）录音棚\n[03:24.454] 制作公司 : 好乐无荒\n[03:25.132] 推广统筹 : 左左\n[03:25.810] OP : 好乐无荒\n[03:26.488] SP : 索尼音乐版权代理（北京）有限公司\n[03:27.166] 特别鸣谢：梦响强音文化传播（上海）有限公司\n[03:27.844] （本作品声明：著作权权利保留，未经许可，不得使用）\n', 0, '64', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635503448330', '起风了', '1635341469729', '1635503394595', '1543766400000', '《起风了》是由高桥优作曲、米果作词、买辣椒也用券演唱的歌曲，于2017年2月22日以单曲的形式发行，后因未获版权问题而下架，于2018年12月3日重新发行', 'http://localhost:8200/song/source?id=1635503448330', '[00:00.000] 作词 : 米果\n[00:01.000] 作曲 : 高橋優\n[00:02.000] 编曲 : 池窪浩一 (Kouichi Ikekubo)\n[00:25.237]这一路上走走停停\n[00:28.592]顺着少年漂流的痕迹\n[00:31.681]迈出车站的前一刻\n[00:34.795]竟有些犹豫\n[00:37.794]不禁笑这近乡情怯\n[00:41.191]仍无可避免\n[00:43.819]而长野的天\n[00:45.134]依旧那么暖\n[00:46.684]风吹起了从前\n[00:49.153]从前初识这世间\n[00:52.185]万般流连\n[00:53.962]看着天边似在眼前\n[00:56.798]也甘愿赴汤蹈火去走它一遍\n[01:01.966]如今走过这世间\n[01:05.001]万般流连\n[01:06.632]翻过岁月不同侧脸\n[01:09.861]措不及防闯入你的笑颜\n[01:15.513]我曾难自拔于世界之大\n[01:19.605]也沉溺于其中梦话\n[01:22.837]不得真假 不做挣扎 不惧笑话\n[01:28.501]我曾将青春翻涌成她\n[01:31.930]也曾指尖弹出盛夏\n[01:35.281]心之所动 且就随缘去吧\n[01:41.156]逆着光行走 任风吹雨打\n[01:58.028]短短的路走走停停\n[02:01.171]也有了几分的距离\n[02:04.236]不知抚摸的是故事 还是段心情\n[02:10.711]也许期待的不过是 与时间为敌\n[02:16.193]再次看到你\n[02:17.991]微凉晨光里\n[02:19.556]笑得很甜蜜\n[02:22.116]从前初识这世间\n[02:24.937]万般流连\n[02:26.663]看着天边似在眼前\n[02:29.616]也甘愿赴汤蹈火去走它一遍\n[02:34.711]如今走过这世间\n[02:37.657]万般流连\n[02:39.389]翻过岁月不同侧脸\n[02:42.360]措不及防闯入你的笑颜\n[02:48.265]我曾难自拔于世界之大\n[02:52.336]也沉溺于其中梦话\n[02:55.538]不得真假 不做挣扎 不惧笑话\n[03:01.140]我曾将青春翻涌成她\n[03:05.235]也曾指尖弹出盛夏\n[03:08.062]心之所动 且就随缘去吧\n[03:39.324]晚风吹起你鬓间的白发\n[03:43.574]抚平回忆留下的疤\n[03:46.788]你的眼中 明暗交杂 一笑生花\n[03:52.294]暮色遮住你蹒跚的步伐\n[03:56.330]走进床头藏起的画\n[03:59.544]画中的你 低着头说话\n[04:05.074]我仍感叹于世界之大\n[04:08.784]也沉醉于儿时情话\n[04:12.150]不剩真假 不做挣扎 无谓笑话\n[04:17.925]我终将青春还给了她\n[04:21.677]连同指尖弹出的盛夏\n[04:25.007]心之所动 就随风去了\n[04:30.601]以爱之名 你还愿意吗\n[04:38.541]\n[04:43.799] 吉他 : 池窪浩一 (Kouichi Ikekubo)\n[04:49.057] 贝斯 : 小島剛広 (Takehiro Kojima)\n[04:54.315] 鼓 : 吉田佳史 (TRICERATOPS) (Yoshifumi Yoshida(TRICERATOPS))\n[04:59.573] 键盘 : 平畑徹也 (Tetsuya Hirahata)\n[05:04.831] 小提琴 : 須磨和声 (Wasei Suma)\n[05:10.089] 弦乐 : 須磨和声/池窪浩一\n[05:15.347] 录音工程 : 玉乃井光紀 (Mitsunori Tamanoi) - studioFine\n[05:20.605] 发行 : Negia Entertainment Inc.\n[05:25.863] 特别支持：中村光雄(Mitsuo Nakamura)\n', 1, '61', '2022-05-26 15:13:35');
INSERT INTO `song` VALUES ('1635506366426', 'アイロニ ', '1635506130337', '1635506247250', '1591545600000', 'アイロニ ', 'http://localhost:8200/song/source?id=1635506366426', '[00:00.000] 作词 : すこっぷ\n[00:00.037] 作曲 : すこっぷ\n[00:00.75]少し歩き疲れたんだ\n[00:03.34]少し歩き疲れたんだ\n[00:06.05]月並みな表現だけど\n[00:08.23]人生とかいう長い道を\n[00:11.44]少し休みたいんだ\n[00:13.94]少し休みたいんだけど\n[00:16.81]時間は刻一刻残酷と\n[00:19.67]私を 引っぱっていくんだ\n[00:24.91]\n[00:38.18]うまくいきそうなんだけど\n[00:40.76]うまくいかないことばかりで\n[00:43.39]迂闊にも泣いてしまいそうになる\n[00:46.09]情けない本当にな\n[00:48.93]惨めな気持ちなんか\n[00:51.19]嫌というほど味わってきたし\n[00:54.13]とっくに悔しさなんてものは\n[00:56.84]捨ててきたはずなのに\n[00:59.72]絶望抱くほど\n[01:01.01]悪いわけじゃないけど\n[01:02.39]欲しいものは\n[01:03.19]いつも少し手には届かない\n[01:04.91]そんな半端だとねなんか\n[01:07.51]期待してしまうから\n[01:11.46]それならもういっそのこと\n[01:15.00]ドン底まで突き落としてよ\n[01:20.84]答えなんて言われたって\n[01:23.47]人によってすり替わってって\n[01:26.04]だから絶対なんて絶対\n[01:28.50]信じらんないよねぇ\n[01:31.50]苦しみって誰にもあるって\n[01:33.71]そんなのわかってるから何だって\n[01:36.76]なら笑って済ませばいいの？\n[01:39.16]もうわかんないよバカ！\n[01:42.42]\n[01:52.83]散々言われてきたくせに\n[01:55.53]なんだまんざらでもないんだ\n[01:58.14]簡単に考えたら楽なことも\n[02:01.06]難関に考えてたんだ\n[02:03.48]段々と色々めんどくなってもう\n[02:06.38]淡々と終わらせちゃおうか\n[02:08.88]「病んだ？」とかもう嫌になったから\n[02:11.56]やんわりと終わればもういいじゃんか\n[02:14.42]夢だとか希望とか\n[02:15.69]生きてる意味とか\n[02:17.06]別にそんなものはさして\n[02:18.21]必要ないから\n[02:19.55]具体的でわかりやすい\n[02:22.24]機会をください\n[02:26.24]泣き場所探すうちに\n[02:29.88]もう泣き疲れちゃったよ\n[02:35.31]きれいごとって嫌いだって\n[02:38.11]期待しちゃっても形になんなくて\n[02:40.74]「星が僕ら見守って」って\n[02:43.22]夜しかいないじゃん　ねぇ\n[02:46.08]君のその優しいとこ\n[02:48.77]不覚にも求めちゃうから\n[02:51.41]この心やらかいとこ\n[02:53.90]もう触んないで　ヤダ！\n[02:57.14]\n[03:17.94]もうほっといて\n[03:20.69]もう置いてって\n[03:23.15]汚れきったこの道は\n[03:25.91]もう変わんないよ嗚呼\n[03:30.19]疲れちゃって弱気になって\n[03:32.78]逃げ出したって無駄なんだって\n[03:35.35]だから内面耳塞いで\n[03:37.80]もう最低だって泣いて\n[03:40.61]人生って何なのって\n[03:43.40]わかんなくても生きてるだけで\n[03:46.24]幸せって思えばいいの？\n[03:48.50]もうわかんないよバカ！\n[03:52.01]\n[03:57.11]终わり\n', 1, '16', '2022-05-15 20:36:05');
INSERT INTO `song` VALUES ('1635506793225', '饿狼传说', '1635506538320', '1635506697059', '769363200000', '《饿狼传说》是由 潘伟源 填词， 刘诺生 谱曲和编曲， 张学友 演唱的一首歌曲，收录于1994年5月20日发行的同名专辑《 饿狼传说 》中。', 'http://localhost:8200/song/source?id=1635506793225', '[00:00.000] 作词 : 潘伟源\n[00:01.000] 作曲 : 刘诺生\n[00:02.000] 编曲 : 刘诺生\n[00:35.000]她熄掉晚灯 幽幽掩两肩\n[00:39.000]交织了火花 拘禁在沉淀\n[00:43.000]心刚被割损 经不起变迁\n[00:47.000]她偏以指尖 牵引着磁电\n[00:51.000]汹涌的爱\n[00:54.000]扑着我尽力乱吻乱缠\n[00:59.000]偏偏知道爱令我无明天\n[01:06.000]她倚着我肩 呼吸响耳边\n[01:10.000]高温已产生 色相令人乱\n[01:14.000]君子在扑火 吹不走暖烟\n[01:18.000]她加上嘴巴 给我做磨练\n[01:22.000]汹涌的爱\n[01:24.000]扑着我尽力乱吻乱缠\n[01:29.000]偏偏知道爱令我无明天\n[01:37.000]爱会像头饿狼\n[01:39.000]嘴巴似极甜\n[01:41.000]假使走近玩玩它凶相便呈现\n[01:45.000]爱会像头饿狼\n[01:47.000]岂可抱着眠\n[01:48.000]它必给我狠狠的伤势做留念\n[01:59.000]她倚着我肩 呼吸响耳边\n[02:03.000]高温已产生 色相令人乱\n[02:07.000]君子在扑火 吹不走暖烟\n[02:11.000]她加上嘴巴 给我做磨练\n[02:15.000]汹涌的爱\n[02:17.000]扑着我尽力乱吻乱缠\n[02:23.000]偏偏知道爱令我无明天\n[02:30.000]爱会像头饿狼\n[02:32.000]嘴巴似极甜\n[02:33.000]假使走近玩玩它凶相便呈现\n[02:37.000]爱会像头饿狼\n[02:39.000]岂可抱着眠\n[02:41.000]它必给我狠狠的伤势做留念\n[02:46.000]爱会像头饿狼\n[02:48.000]嘴巴似极甜\n[02:49.000]假使走近玩玩它凶相便呈现\n[02:53.000]爱会像头饿狼\n[02:55.000]岂可抱着眠\n[02:57.000]它必给我狠狠的伤势做留念\n[03:35.000]爱会像头饿狼\n[03:37.000]嘴巴似极甜\n[03:38.000]假使走近玩玩它凶相便呈现\n[03:42.000]爱会像头饿狼\n[03:44.000]岂可抱着眠\n[03:46.000]它必给我狠狠的伤势做留念\n[03:50.000]爱会像头饿狼\n[03:52.000]嘴巴似极甜\n[03:54.000]假使走近玩玩它凶相便呈现\n[03:58.000]爱会像头饿狼\n[04:00.000]岂可抱着眠\n[04:02.000]它必给我狠狠的伤势做留念\n[04:30.020]Publisher : PolyGram\n', 1, '80', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635507474940', '稻香', '1635507073391', '1635507329406', '1224000000000', '稻香》是周杰伦演唱的一首歌曲，由周杰伦作词、作曲，黄雨勋编曲，收录在周杰伦2008年10月15日发行的专辑《魔杰座》中；周杰伦在接受媒体采访时表示，《稻香》是因汶川地震创作的。', 'http://localhost:8200/song/source?id=1635507474940', NULL, 0, '21', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635507507293', '给我一首歌的时间', '1635507073391', '1635507329406', '1224000000000', '《给我一首歌的时间》是周杰伦演唱的一首歌曲，由周杰伦作词、作曲，林迈可编曲，收录在周杰伦2008年10月15日发行的专辑《魔杰座》中', 'http://localhost:8200/song/source?id=1635507507293', NULL, 1, '8', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635507711961', '兰亭序', '1635507073391', '1635507329406', '1224000000000', '《兰亭序》是周杰伦演唱的一首歌曲，由周杰伦作曲，方文山填词，钟兴民编曲，收录在周杰伦2008年10月15日发行的专辑《魔杰座》中', 'http://localhost:8200/song/source?id=1635507711961', NULL, 0, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635508957215', ' 僕が死のうと思ったのは ', '1622071800601', '1635508872682', '1377619200000', ' 僕が死のうと思ったのは ', 'http://localhost:8200/song/source?id=1635508957215', '[00:00.000] 作词 : 秋田ひろむ\n[00:01.000] 作曲 : 秋田ひろむ\n[00:02.000] 编曲 : 出羽良彰\n[00:28.080]僕が死のうと思ったのは ウミネコが桟橋で鳴いたから\n[00:39.130]波の随意に浮かんで消える 過去も啄ばんで飛んでいけ\n[00:50.670]僕が死のうと思ったのは 誕生日に杏の花が咲いたから\n[01:02.200]その木漏れ日でうたた寝したら 虫の死骸と土になれるかな\n[01:12.050]\n[01:14.110]薄荷飴 漁港の灯台 錆びたアーチ橋 捨てた自転車\n[01:20.070]木造の駅のストーブの前で どこにも旅立てない心\n[01:25.930]今日はまるで昨日みたいだ 明日を変えるなら今日を変えなきゃ\n[01:31.600]分かってる 分かってる けれど\n[01:39.850]僕が死のうと思ったのは 心が空っぽになったから\n[01:51.400]満たされないと泣いているのは きっと満たされたいと願うから\n[02:25.710]僕が死のうと思ったのは 靴紐が解けたから\n[02:37.100]結びなおすのは苦手なんだよ 人との繋がりもまた然り\n[02:48.390]僕が死のうと思ったのは 少年が僕を見つめていたから\n[02:59.870]ベッドの上で土下座してるよ あの日の僕にごめんなさいと\n[03:11.560]パソコンの薄明かり 上階の部屋の生活音\n[03:18.350]インターフォンのチャイムの音 耳を塞ぐ鳥かごの少年\n[03:23.940]見えない敵と戦ってる 六畳一間のドンキホーテ\n[03:29.650]ゴールはどうせ醜いものさ\n[03:37.790]僕が死のうと思ったのは 冷たい人と言われたから\n[03:49.340]愛されたいと泣いているのは 人の温もりを知ってしまったから\n[04:23.780]僕が死のうと思ったのは あなたが綺麗に笑うから\n[04:34.860]死ぬことばかり考えてしまうのは きっと生きる事に真面目すぎるから\n[04:46.600]僕が死のうと思ったのは まだあなたに出会ってなかったから\n[04:57.830]あなたのような人が生まれた 世界を少し好きになったよ\n[05:09.340]あなたのような人が生きてる 世界に少し期待するよ\n', 1, '29', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635680515627', 'see you again', '1622072527875', '1635680348714', '1453996800000', '《See You Again》是由美国说唱歌手维兹·卡利法与歌手查理·普斯合作演唱的一首歌曲，歌词、曲谱由DJ Frank E、查理·普斯、维兹·卡利法和安德鲁·希达尔等人共同创作完成。', 'http://localhost:8200/song/source?id=1635680515627', '[00:00.000] 作词 : Charlie Puth/Cameron Thomaz/Phoebe Cockburn/Andrew Cedar/Dann Hume/Joshua Karl Simon Hardy\n[00:01.000] 作曲 : Charlie Puth/Cameron Thomaz/Phoebe Cockburn/Andrew Cedar/Dann Hume/Joshua Karl Simon Hardy\n[00:10.440]It\'s been a long day without you my friend\n[00:17.400]And I\'ll tell you all about it when I see you again\n[00:23.200]We\'ve come a long way from where we began\n[00:29.080]Oh I\'ll tell you all about it when I see you again\n[00:35.100]When I see you again\n[00:39.920]Damn who knew all the planes we flew\n[00:42.900]Good things we\'ve been through\n[00:44.610]That I\'ll be standing right here\n[00:46.330]Talking to you about another path\n[00:48.750]I know we loved to hit the road and laugh\n[00:51.020]But something told me that it wouldn\'t last\n[00:53.390]Had to switch up look at things different see the bigger picture\n[00:57.100]Those were the days hard work forever pays\n[01:00.289]Now I see you in a better place\n[01:05.019]How could we not talk about family when family\'s all that we got?\n[01:08.659]Everything I went through you were standing there by my side\n[01:11.560]And now you gon\' be with me for the last ride\n[01:13.760]It\'s been a long day without you my friend\n[01:20.330]And I\'ll tell you all about it when I see you again\n[01:26.200]We\'ve come a long way from where we began\n[01:32.150]Oh I\'ll tell you all about it when I see you again\n[01:38.170]When I see you again\n[01:56.230]First you both go out your way\n[01:57.750]And the vibe is feeling strong and what\'s small turn to a friendship\n[02:01.540]a friendship turn to a bond and\n[02:03.390]that bond will never be broken the love will never get lost\n[02:08.229]And when brotherhood come first then the line\n[02:10.310]Will never be crossed established it on our own\n[02:12.729]When that line had to be drawn and that line is what we reach\n[02:15.330]So remember me when I\'m gone\n[02:19.960]How could we not talk about family when family\'s all that we got?\n[02:23.599]Everything I went through you were standing there by my side\n[02:26.550]And now you gon\' be with me for the last ride\n[02:29.080]So  let the light guide your way\n[02:32.080]Hold every memory as you go\n[02:38.139]And every road you take will always lead you home\n[02:49.190]Hoo\n[02:52.650]It\'s been a long day without you my friend\n[02:59.319]And I\'ll tell you all about it when I see you again\n[03:05.219]We\'ve come a long way from where we began\n[03:11.129]Oh I\'ll tell you all about it when I see you again\n[03:16.979]When I see you again\n[03:22.659]Again\n[03:29.050]When I see you again see you again\n[03:41.020]When I see you again\n[03:45.107]Producers : DJ Frank E / Charlie Puth / Andrew Cedar\n[03:45.360]Vocals : Charlie Puth / Wiz Khalifa / Annie & Chloe\n[03:45.538]String Arranger & Conductor : Brian Tyler\n[03:46.038]Recorded in 2014\n', 0, '6', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635680608268', 'We Don\'t Talk Anymore', '1622072527875', '1635680348714', '1453996800000', '《We Don\'t Talk Anymore》是由查理·普斯和赛琳娜·戈麦斯演唱的一首歌曲，词曲作者为查理·普斯、赛琳娜·戈麦斯和雅各布·卡舍·辛德林，收录于专辑《Nine Track Mind》中，并作为推广专辑的单曲于2016年5月24日通过大西洋唱片公司发行', 'http://localhost:8200/song/source?id=1635680608268', '[00:00.000] 作词 :  Charlie Puth / Jacob Kasher Hindlin / Selena Gomez\n[00:00.360] 作曲 :  Charlie Puth / Jacob Kasher Hindlin / Selena Gomez\n[00:00.720]We don\'t talk anymore, we don\'t talk anymore\n[00:05.420]We don\'t talk anymore, like we used to do\n[00:10.310]We don\'t love anymore\n[00:12.670]What was all of it for?\n[00:14.300]Oh, we don\'t talk anymore, like we used to do\n[00:19.880]I just heard you found the one you\'ve been looking\n[00:23.470]You\'ve been looking for\n[00:25.850]I wish I would have known that wasn\'t me\n[00:29.360]Cause even after all this time I still wonder\n[00:33.100]Why I can\'t move on\n[00:35.420]Just the way you did so easily\n[00:39.370]Don\'t wanna know\n[00:41.100]kind of dress you\'re wearing tonight\n[00:43.390]If he\'s holding onto you so tight\n[00:46.300]The way I did before\n[00:48.990]I overdosed\n[00:50.470]Should\'ve known your love was a game\n[00:53.000]Now I can\'t get you out of my brain\n[00:55.550]Oh, it\'s such a shame\n[00:58.200]We don\'t talk anymore, we don\'t talk anymore\n[01:03.000]We don\'t talk anymore, like we used to do\n[01:07.870]We don\'t love anymore\n[01:10.220]What was all of it for?\n[01:11.740]Oh, we don\'t talk anymore, like we used to do\n[01:17.440]I just hope you\'re lying next to somebody\n[01:20.540]Who knows how to love you like me\n[01:23.310]There must be a good reason that you\'re gone\n[01:27.070]Every now and then I think you\n[01:29.140]Might want me to come show up at your door\n[01:32.900]But I\'m just too afraid that I\'ll be wrong\n[01:36.900]Don\'t wanna know\n[01:38.530]If you\'re looking into her eyes\n[01:40.880]If she\'s holding onto you so tight the way I did before\n[01:46.490]I overdosed\n[01:48.070]Should\'ve known your love was a game\n[01:50.540]Now I can\'t get you out of my brain\n[01:53.190]Oh, it\'s such a shame\n[01:55.660]That we don\'t talk anymore (We don\'t, we don\'t)\n[01:58.230]We don\'t talk anymore (We don\'t, we don\'t)\n[02:00.640]We don\'t talk anymore, like we used to do\n[02:05.460]We don\'t love anymore (We don\'t, we don\'t)\n[02:07.750]What was all of it for? (We don\'t, we don\'t)\n[02:09.500]Oh, we don\'t talk anymore, like we used to do\n[02:23.760]Like we used to do\n[02:34.500]Don\'t wanna know\n[02:36.130]kind of dress you\'re wearing tonight\n[02:38.620]If he\'s giving it to you just right\n[02:41.100]The way I did before\n[02:44.110]I overdosed\n[02:45.640]Should\'ve known your love was a game\n[02:48.080]Now I can\'t get you out of my brain\n[02:50.710]Oh, it\'s such a shame\n[02:53.330]That we don\'t talk anymore (We don\'t, we don\'t)\n[02:55.880]We don\'t talk anymore (We don\'t, we don\'t)\n[02:58.200]We don\'t talk anymore, like we used to do\n[03:03.100]We don\'t love anymore (We don\'t, we don\'t)\n[03:05.360]What was all of it for? (We don\'t, we don\'t)\n[03:07.000]Oh, we don\'t talk anymore, like we used to do\n[03:12.650]We don\'t talk anymore\n[03:14.330]What kind of dress you\'re wearing tonight (Oh)\n[03:17.000]If he\'s holding onto you so tight (Oh)\n[03:19.540]The way I did before\n[03:22.230]We don\'t talk anymore (I overdosed)\n[03:24.080]Should\'ve known your love was a game (Oh)\n[03:26.620]Now I can\'t get you out of my brain (Woah)\n[03:29.220]Oh, it\'s such a shame\n[03:31.880]We don\'t talk anymore\n[03:35.880]Producer : Charlie Puth\n[03:36.880]Recorded in 2015', 1, '19', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1635681782848', '起风了', '1635681303898', '1635681648278', '1633363200000', '《起风了》是电视剧《加油，你是最棒的》主题曲，由高桥优作曲，米果作词，吴青峰演唱', 'http://localhost:8200/song/source?id=1635681782848', NULL, 1, '28', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643436188086', '一个像夏天，一个像秋天', '1643435446634', '1643435539795', '1149264000000', '《一个像夏天一个像秋天》是中国台湾流行音乐女歌手范玮琪演唱的一首友谊之歌曲，由姚若龙作词，陈小霞作曲，收录在范玮琪2006年发行的专辑《我们的纪念日》中。', 'http://localhost:8200/song/source?id=1643436188086', '[00:00.000] 作词 : 姚若龙\n[00:01.000] 作曲 : 陈小霞\n[00:04.17]编曲 : 吕绍淳/蔡庭贵\n[00:27.56]第一次见面看你不太顺眼\n[00:31.16]\n[00:32.01]谁知道后来关系那么密切\n[00:35.39]我们一个像夏天一个像秋天\n[00:39.91]却总能把冬天变成了春天\n[00:44.03]\n[00:45.56]你拖我离开一场爱的风雪\n[00:48.78]\n[00:50.04]我背你逃出一次梦的断裂\n[00:53.39]遇见一个人然后生命全改变\n[00:57.89]原来不是恋爱才有的情节\n[01:01.84]\n[01:03.23]如果不是你 我不会相信\n[01:07.96]朋友比情人还死心塌地\n[01:11.29]就算我忙恋爱 把你冷冻结冰\n[01:15.79]你也不会恨我 只是骂我几句\n[01:20.30]\n[01:21.12]如果不是你 我不会确定\n[01:25.84]朋友比情人更懂得倾听\n[01:29.23]我的弦外之音 我的有口无心\n[01:33.71]我离不开Darling 更离不开你\n[01:37.67]\n[01:57.30]你拖我离开一场爱的风雪\n[02:00.61]\n[02:01.78]我背你逃出一次梦的断裂\n[02:05.13]遇见一个人然后生命全改变\n[02:09.62]原来不是恋爱才有的情节\n[02:13.58]\n[02:14.92]如果不是你 我不会相信\n[02:19.71]朋友比情人还死心塌地\n[02:23.08]就算我忙恋爱 把你冷冻结冰\n[02:27.56]你也不会恨我 只是骂我几句\n[02:32.08]\n[02:32.91]如果不是你 我不会确定\n[02:37.65]朋友比情人更懂得倾听\n[02:41.00]我的弦外之音 我的有口无心\n[02:45.48]我离不开Darling 更离不开你\n[02:49.22]\n[02:51.17]你了解我所有得意的东西\n[02:54.49]才常泼我冷水怕我忘形\n[02:57.83]\n[03:00.13]你知道我所有丢脸的事情\n[03:03.42]却为我的美好形象保密\n[03:06.83]\n[03:08.77]如果不是你 我不会相信\n[03:13.56]朋友比情人还死心塌地\n[03:16.89]就算我忙恋爱 把你冷冻结冰\n[03:21.37]你也不会恨我 只是骂我几句\n[03:26.74]如果不是你 我不会确定\n[03:31.48]朋友比情人更懂得倾听\n[03:34.86]我的弦外之音 我的有口无心\n[03:39.32]我离不开Darling 更离不开你\n[04:01.10]制作人 : 陈俊廷\n[04:01.20]吉他 : 倪方来\n[04:01.30]贝斯 : 陈俊廷\n[04:01.40]鼓 : 陈柏州\n[04:01.50]和声编写 : 马毓芬\n[04:01.60]和声 : 马毓芬/陈俊廷\n[04:01.70]录音师 : 柯宗佑/陈俊廷\n[04:01.80]录音室 : 福茂录音室/杨大纬录音工作室\n[04:02.90]混音工程师 : 杨大纬\n[04:03.00]混音录音室 : 杨大纬录音工作室\n[04:03.10]OP : 屋顶音乐工作室(Admin by EMI MPT)\n[04:03.20]SP : Great Music Publishing Ltd.\n', 1, '157', '2022-05-26 14:32:30');
INSERT INTO `song` VALUES ('1643454106693', '山楂树之恋', '1643453833297', '1643453975767', '1570032000000', '山楂树之恋', 'http://localhost:8200/song/source?id=1643454106693', '[00:00.000] 作词 : 大能人\n[00:01.000] 作曲 : 编曲采样《情歌》前奏\n[00:02.000] 原唱 : 雷智皓(大能人)\n[00:03.000] 出品 : 网易音乐人 X 青云LAB\n[00:11.570]我的山楂树之恋\n[00:14.590]只有是和你才会纯洁\n[00:17.540]可以丢弃\n[00:18.730]我的底线\n[00:20.650]锁定与你的是我视线\n[00:23.690]我的山楂树之恋\n[00:26.800]永远站在你的身边\n[00:29.670]我保证我的爱不会变\n[00:32.110]共享永恒时间\n[00:33.120]像蝴蝶起舞翩翩\n[00:36.050]每次懊恼在于相见恨晚\n[00:38.960]不管相隔的距离是长\n[00:41.120]或是短\n[00:42.090]能在一起的时候不要快只想慢\n[00:45.320]想和你有个孩子\n[00:46.760]围着你团团转\n[00:48.270]世界变化不停\n[00:49.730]人潮川流不息\n[00:51.250]不在乎沉淀你肩膀上的经历\n[00:54.200]让你少份畏惧\n[00:55.870]还你一颗少女心\n[00:57.440]有一种超凡动力是为你而打拼\n[01:00.712]爱你的坦诚\n[01:01.781]像一面清澈的湖水\n[01:03.621]就算眼睛肿了我也觉得世上你最美\n[01:06.632]许愿十年之后你在我的枕边睡\n[01:09.546]我用我的嘴巴抚平你一天的疲惫\n[01:12.644]心里总有期待所以过的度日如年\n[01:15.885]每天会关注你生活的片片面面\n[01:18.766]你说心里话的时候我像在充电\n[01:21.736]不理睬的时候我只能自己去找空间\n[01:24.846]我的山楂树之恋\n[01:27.944]只有是和你才会纯洁\n[01:30.864]可以丢弃\n[01:32.057]我的底线\n[01:33.959]锁定与你的是我视线\n[01:37.057]我的山楂树之恋\n[01:40.137]永远站在你的身边\n[01:43.048]我保证我的爱不会变\n[01:45.447]共享永恒时间\n[01:46.447]像蝴蝶起舞翩翩\n[01:49.349]你的喜好你的习惯\n[01:50.887]你爱吃的我都记着\n[01:52.399]你爱的高冷我做不来\n[01:53.768]可以逐渐适应着\n[01:55.768]我不会\n[01:56.387]你没睡我不睡\n[01:58.459]即使第二天和你在一起会很疲惫\n[02:01.584]过的自由自在\n[02:02.992]美丽置身事外\n[02:04.525]陪你走路回家在每个\n[02:06.465]All day all night\n[02:07.647]也不能深陷情海\n[02:09.092]为了你的那一半\n[02:10.644]用太多的精力\n[02:11.774]因为上天自有安排\n[02:14.073]你是一只飞鸟\n[02:15.832]飞上我的树梢\n[02:17.174]从此我乏味的生活\n[02:19.353]变得热闹\n[02:20.323]我知道\n[02:21.313]你会为我停留\n[02:23.503]时间也会随之\n[02:24.872]而过的很久\n[02:26.313]说什么好\n[02:27.842]念什么糟\n[02:29.372]行如此情\n[02:30.533]却无从知晓\n[02:32.835]我怕来不及\n[02:34.353]我怕保不齐\n[02:35.946]山楂树下站的我和你\n[02:38.323]我的山楂树之恋\n[02:41.274]只有是和你才会纯洁\n[02:44.309]可以丢弃\n[02:45.405]我的底线\n[02:47.309]锁定与你的是我视线\n[02:50.405]我的山楂树之恋\n[02:53.485]永远站在你的身边\n[02:56.382]我保证我的爱不会变\n[02:58.823]共享永恒时间\n[02:59.872]像蝴蝶起舞翩翩', NULL, '109', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643454792066', 'call me baby', '1625405303096', '1643454724896', '1427644800000', '《CALL ME BABY》是是韩国男子组合EXO正规二辑《EXODUS》的主打曲，由Teddy Riley、DOM、이현승 for TRX、J.SOL(Jason J Lopez)、Dantae Johnson作曲，조윤경、 1월 8일(Jam Factory) 、김동현作词', 'http://localhost:8200/song/source?id=1643454792066', NULL, NULL, '37', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643519328369', '人生何处不相逢', '1633946433290', '1643519009398', '781200000000', '人生何处不相逢》是陈慧娴演唱的一首粤语歌曲，由简宁作词，罗大佑作曲、编曲  ，收录在陈慧娴1988年10月21日由环球唱片发行的粤语专辑《秋色》中', 'http://localhost:8200/song/source?id=1643519328369', '[00:00.000] 作词 : 简宁\n[00:01.000] 作曲 : 罗大佑\n[00:02.000] 编曲 : 罗大佑\n[00:03.000]监制 : 欧丁玉\n[00:04.000]Publisher : PolyGram\n[00:05.000]\n[00:17.319]随浪随风飘荡\n[00:21.295]随着一生里的浪\n[00:25.340]你我在重叠那一刹\n[00:29.247]顷刻各在一方\n[00:33.263]缘分随风飘荡\n[00:37.223]缘尽此生也守望\n[00:41.238]你我在凝望那一刹\n[00:45.180]心中有泪飘降\n[00:49.282]纵是告别也交出真心意\n[00:53.262]默默承受际遇\n[00:57.255]某月某日也许再可跟你\n[01:01.227]共聚重拾往事\n[01:05.310]无奈重遇那天存在永远\n[01:13.260]他方的晚空更是遥远\n[01:21.204]谁在黄金海岸\n[01:25.202]谁在烽烟彼岸\n[01:29.237]你我在回望那一刹\n[01:33.235]彼此慰问境况\n[01:37.164]\n[01:53.219]随浪随风飘荡\n[01:57.208]随着一生里的浪\n[02:01.215]你我在重叠那一刹\n[02:05.155]顷刻各在一方\n[02:09.194]缘分随风飘荡\n[02:13.190]缘尽此生也守望\n[02:17.141]你我在凝望那一刹\n[02:21.171]心中有泪飘降\n[02:25.196]纵是告别也交出真心意\n[02:29.204]默默承受际遇\n[02:33.207]某月某日也许再可跟你\n[02:37.155]共聚重拾往事\n[02:41.218]无奈重遇那天存在永远\n[02:49.130]他方的晚空更是遥远\n[02:57.135]谁在黄金海岸\n[03:01.117]谁在烽烟彼岸\n[03:05.075]你我在回望那一刹\n[03:09.107]彼此慰问境况\n[03:13.420]\n', NULL, '20', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643519796010', '飘洋过海来看你', '1643519541403', '1643519691617', '680886000000', '《漂洋过海来看你》是由李宗盛作词作曲，金智娟（娃娃）演唱的歌曲，该曲收录于金智娟1991年发行的专辑《大雨》中。', 'http://localhost:8200/song/source?id=1643519796010', '[00:00.000] 作词 : 李宗盛\n[00:01.000] 作曲 : 李宗盛\n[00:22.610]为你我用了半年的积蓄漂洋过海的来看你\n[00:30.410]为了这次相聚\n[00:33.599]我连见面时的呼吸都曾反复练习\n[00:38.990]言语从来没能将我的情意表达千万分之一\n[00:45.840]为了这个遗憾\n[00:48.339]我在夜里想了又想 不肯睡去\n[00:54.449]记忆它总是慢慢的累积\n[00:59.499]在我心中无法抹去\n[01:02.199]为了你的承诺\n[01:04.750]我在最绝望的时候 都忍着不哭泣\n[01:12.169]陌生的城市啊\n[01:15.429]熟悉的角落里\n[01:19.800]也曾彼此安慰\n[01:22.229]也曾相拥叹息\n[01:25.100]不管将会面对什么样的结局\n[01:27.830]在漫天风沙里\n[01:29.820]望着你远去\n[01:31.780]我竟悲伤得不能自己\n[01:35.420]多盼能送君千里\n[01:37.029]直到山穷水尽\n[01:39.860]一生和你相依\n[01:46.699]\n[01:49.470]\n[02:04.429]\n[02:08.039]为你我用了半年的积蓄漂洋过海的来看你\n[02:15.350]为了这次相聚\n[02:17.900]我连见面时的呼吸 都曾反复练习\n[02:23.300]言语从来没能将我的情意表达千万分之一\n[02:32.300]为了这个遗憾\n[02:34.850]我在夜里想了又想 不肯睡去\n[02:40.429]记忆它总是慢慢的累积\n[02:44.600]在我心中无法抹去\n[02:48.700]为了你的承诺\n[02:51.300]我在最绝望的时候 都忍着不哭泣\n[02:58.450]陌生的城市啊\n[03:01.980]熟悉的角落里\n[03:06.100]也曾彼此安慰\n[03:08.300]也曾相拥叹息\n[03:10.200]不管将会面对什么样的结局\n[03:13.470]在漫天风沙里\n[03:15.900]望着你远去\n[03:17.800]我竟悲伤得不能自己\n[03:22.100]多盼能送君千里\n[03:23.770]直到山穷水尽\n[03:25.780]一生和你相依\n[03:29.900]陌生的城市啊\n[03:33.510]熟悉的角落里\n[03:37.340]也曾彼此安慰\n[03:39.420]也曾相拥叹息\n[03:41.200]不管将会面对什么样的结局\n[03:45.110]在漫天风沙里\n[03:47.240]望着你远去\n[03:49.130]我竟悲伤得不能自己\n[03:52.890]多盼能送君千里\n[03:55.140]直到山穷水尽\n[03:57.200]一生和你相依\n[04:01.140]陌生的城市啊\n[04:04.810]熟悉的角落里\n[04:08.490]也曾彼此安慰\n[04:11.100]也曾相拥叹息\n[04:12.260]不管将会面对什么样的结局\n[04:17.400]在漫天风沙里\n[04:19.310]望着你远去\n[04:21.100]我竟悲伤得不能自己\n[04:26.000]多盼能送君千里\n[04:27.100]直到山穷水尽\n[04:29.150]一生和你相依\n', NULL, '69', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643520258396', 'ブルーバード', '1643520057257', '1643520177035', '1215532800000', 'ブルーバード', 'http://localhost:8200/song/source?id=1643520258396', NULL, NULL, '14', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643520839579', 'Counting Stars', '1643520681562', '1643520770093', '1364140800000', 'Counting Stars', 'http://localhost:8200/song/source?id=1643520839579', '[00:00.000] 作词 : Ryan Tedder\n[00:00.835] 作曲 : Ryan Tedder\n[00:01.670]Lately, I\'ve been, I\'ve been losing sleep\n[00:04.850]Dreaming about the things that we could be\n[00:09.480]But baby, I\'ve been, I\'ve been praying hard\n[00:13.480]Said no more counting dollars\n[00:16.040]We\'ll be counting stars\n[00:18.920]Yeah, we\'ll be counting stars\n[00:37.720]I see this life\n[00:39.030]Like a swinging vine\n[00:40.340]Swing my heart across the line\n[00:42.090]And in my face is flashing signs\n[00:43.970]Seek it out and ye\' shall find\n[00:46.160]Old, but I\'m not that old\n[00:48.160]Young, but I\'m not that bold\n[00:49.910]And I don\'t think the world is sold\n[00:51.850]I\'m just doing what we\'re told\n[00:54.440]I-I-I-I feel something so right\n[00:58.750]When doing the wrong thing\n[01:01.750]I-I-I-I feel something so wrong\n[01:06.310]When doing the right thing\n[01:09.880]I couldn\'t lie, couldn\'t lie, couldn\'t lie\n[01:13.500]Everything that kills me makes me feel alive\n[01:17.870]Lately, I\'ve been, I\'ve been losing sleep\n[01:21.390]Dreaming about the things that we could be\n[01:25.390]But baby, I\'ve been, I\'ve been praying hard\n[01:29.390]Said no more counting dollars\n[01:31.210]We\'ll be counting stars\n[01:33.210]Lately, I\'ve been, I\'ve been losing sleep\n[01:37.200]Dreaming about the things that we could be\n[01:41.210]But baby, I\'ve been, I\'ve been praying hard\n[01:45.210]Said no more counting dollars\n[01:47.140]We\'ll be, we\'ll be counting stars\n[01:56.390]I feel the love\n[01:57.640]And I feel it burn\n[01:59.080]Down this river, every turn\n[02:00.950]Hope is our four-letter word\n[02:02.950]Make that money\n[02:03.640]Watch it burn\n[02:04.950]Old, but I\'m not that old\n[02:06.830]Young, but I\'m not that bold\n[02:08.700]And I don\'t think the world is sold\n[02:10.960]On just doing what we\'re told\n[02:13.020]I-I-I-I feel something so wrong\n[02:17.210]by doing the right thing\n[02:20.400]I couldn\'t lie, couldn\'t lie, couldn\'t lie\n[02:24.640]Everything that drowns me makes me wanna fly\n[02:28.640]Lately, I\'ve been, I\'ve been losing sleep\n[02:32.250]Dreaming about the things that we could be\n[02:36.160]But baby, I\'ve been, I\'ve been praying hard\n[02:40.100]Said no more counting dollars\n[02:42.030]We\'ll be counting stars\n[02:44.220]Lately, I\'ve been, I\'ve been losing sleep\n[02:48.160]Dreaming about the things that we could be\n[02:51.910]But baby, I\'ve been, I\'ve been praying hard\n[02:55.970]Said no more counting dollars\n[02:57.860]We\'ll be, we\'ll be counting stars\n[03:04.100]Take that money\n[03:04.730]Watch it burn\n[03:05.600]Sink in the river\n[03:06.480]The lessons I\'ve learned\n[03:07.610]Take that money\n[03:08.490]Watch it burn\n[03:09.420]Sink in the river\n[03:10.420]The lessons I\'ve learned\n[03:11.540]Take that money\n[03:12.290]Watch it burn\n[03:13.290]Sink in the river\n[03:14.290]The lessons I\'ve learned\n[03:15.420]Take that money\n[03:16.170]Watch it burn\n[03:17.230]Sink in the river\n[03:18.170]The lessons I\'ve learned\n[03:19.610]Everything that kills me makes me feel alive\n[03:26.670]Lately, I\'ve been, I\'ve been losing sleep\n[03:30.350]Dreaming about the things that we could be\n[03:34.220]But baby, I\'ve been, I\'ve been praying hard\n[03:38.290]Said no more counting dollars\n[03:40.040]We\'ll be counting stars\n[03:42.100]Lately, I\'ve been, I\'ve been losing sleep\n[03:46.220]Dreaming about the things that we could be\n[03:49.970]But baby, I\'ve been, I\'ve been praying hard\n[03:54.100]Said no more counting dollars\n[03:55.910]We\'ll be, we\'ll be counting stars\n[03:58.400]Take that money\n[03:58.910]Watch it burn\n[03:59.720]Sink in the river\n[04:00.650]The lessons I\'ve learned\n[04:01.720]Take that money\n[04:02.400]Watch it burn\n[04:03.470]Sink in the river\n[04:04.530]The lessons I\'ve learned\n[04:05.650]Take that money\n[04:06.410]Watch it burn\n[04:07.470]Sink in the river\n[04:08.340]The lessons I\'ve learned\n[04:09.530]Take that money\n[04:10.150]Watch it burn\n[04:11.280]Sink in the river\n[04:12.350]The lessons I\'ve learned\n', NULL, '18', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643880439323', '小星星', '1635341560361', '1643880233413', '1289232000000', '《小星星》是汪苏泷作词作曲并演唱的歌曲，收录于2010年11月19日发布的专辑《慢慢懂》中。', 'http://localhost:8200/song/source?id=1643880439323', '[00:00.000] 作词 : 汪苏泷\n[00:01.000] 作曲 : 汪苏泷\n[00:02.000] 编曲 : 汪苏泷\n[00:16.645]承认不勇敢\n[00:19.768]你能不能别离开\n[00:23.562]很多爱不能重来\n[00:26.995]我应该释怀\n[00:30.529]在街头徘徊\n[00:33.545]下雨时为你撑伞\n[00:37.369]对你的爱成阻碍\n[00:40.931]祝福你愉快\n[00:44.699]窗外的天气\n[00:47.735]像你心忐忑不定\n[00:51.354]如果这是结局\n[00:53.437]我希望你是真的满意\n[00:58.941](希望你能听我)\n[01:00.737]你 就是我的小星星\n[01:04.016]挂 在那天上放光明\n[01:07.352]我已经决定要爱你\n[01:11.061]就不会轻易放弃\n[01:11.991](希望你能听我)\n[01:14.769]海 上流浪的许愿瓶\n[01:18.075]每 个心愿都是为你\n[01:21.394]就算不能够在一起\n[01:25.170]我还是为你担心\n[01:41.897]wo~窗外的天气\n[01:45.906]像你心忐忑不定\n[01:49.425]如果这是结局\n[01:52.047]我希望你是真的满意\n[01:57.126](希望你能听我)\n[01:58.908]你 就是我的小星星\n[02:02.183]挂 在那天上放光明\n[02:05.325]我已经决定要爱你\n[02:09.224]就不会轻易放弃\n[02:12.858]海 上流浪的许愿瓶\n[02:16.318]每 个心愿都是为你\n[02:19.984]就算不能够在一起\n[02:23.451]我还是为你担心\n[02:28.732]把 悲伤写成协奏曲\n[02:32.160]在 角落里为你弹琴\n[02:35.364]就算你可能听不清\n[02:39.331]也代表我的心意\n[02:41.950]也代表我的心\n[02:42.884]爱 不一定要很甜蜜\n[02:46.286]说 山盟海誓的言语\n[02:49.485]只要那幸福在心底\n[02:53.351]哪怕我一人演戏\n[03:02.215]其实每个人的心里都有一颗小星星', NULL, '54', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643880469014', '放不下', '1635341560361', '1643880233413', '1289232000000', '放不下', 'http://localhost:8200/song/source?id=1643880469014', NULL, NULL, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643880487897', '他的爱', '1635341560361', '1643880233413', '1289232000000', '他的爱', 'http://localhost:8200/song/source?id=1643880487897', NULL, NULL, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643880533074', '专属味道', '1635341560361', '1643880233413', '1289232000000', '《专属味道》由浑身洋溢着蓬勃朝气的19岁歌手Silence、超高人气的可爱美少女林希儿联手打造的一首网络歌曲。收录在Silence于2010年8月出品的专辑《七夕情人节EP》中。', 'http://localhost:8200/song/source?id=1643880533074', NULL, NULL, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643880947532', 'Blueming', '1622072019119', '1643880876793', '1574006400000', '《Blueming》是韩国女歌手李知恩（IU）发行的迷你专辑《Love Poem》中的一首主打歌曲', 'http://localhost:8200/song/source?id=1643880947532', NULL, 1, '51', '2022-05-26 15:08:59');
INSERT INTO `song` VALUES ('1643881216324', '他不懂', '1622072970585', '1643881097597', '1355932800000', '《他不懂》由周振霆、代岳东作词，唐湘智作曲，邓讴歌编曲，张杰演唱，收录在张杰第十张专辑《爱，不解释》中，是该专辑的第二主打。', 'http://localhost:8200/song/source?id=1643881216324', '[00:00.000] 作词 : 代岳东/周振霆\n[00:01.000] 作曲 : 唐湘智\n[00:19.410]他留给你是背影\n[00:25.060]关于爱情只字不提\n[00:29.850]害你哭红了眼睛\n[00:34.780]他把谎言说的竟然那么动听\n[00:40.750]他不止一次骗了你\n[00:44.710]不值得你再为他伤心\n[00:48.380]他不懂你的心假装冷静\n[00:53.180]他不懂爱情把它当游戏\n[00:56.170]他不懂表明相爱这件事\n[01:00.060]除了对不起就只剩叹息\n[01:04.060]他不懂你的心为何哭泣\n[01:08.950]窒息到快要不能呼吸\n[01:16.700]喔喔\n[01:18.880]他不懂你的心\n[01:23.230]\n[01:36.550]他把回忆留给你\n[01:43.640]连同忧伤强加给你\n[01:48.300]对你说来不公平\n[01:54.610]他的谎言句句说的那么动听\n[01:58.750]他不止一次骗了你\n[02:03.640]不值得你再为他伤心\n[02:07.980]他不懂你的心假装冷静\n[02:11.880]他不懂爱情把它当游戏\n[02:15.720]他不懂表明相爱这件事\n[02:19.630]除了对不起就只剩叹息\n[02:23.960]他不懂你的心为何哭泣\n[02:27.970]窒息到快要不能呼吸\n[02:36.070]喔喔\n[02:38.630]他不懂你的心\n[02:42.630]\n[02:56.250]他不懂你的心假装冷静\n[02:59.990]他不懂爱情把它当游戏\n[03:03.860]他不懂表明相爱这件事\n[03:07.720]除了对不起就只剩叹息\n[03:11.570]他不懂你的心为何哭泣\n[03:15.640]窒息到快要不能呼吸\n[03:23.800]喔喔\n[03:26.320]他不懂你的心\n', 0, '10', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1643938595197', '一路生花', '1643938461386', '1643938531634', '1610985600000', '我希望许过的愿望一路生花\n将那雨中的人藏在屋檐下\n岁月在冲刷逆流沧桑的喧哗\n安静的夜晚你在想谁吗\n        ', 'http://localhost:8200/song/source?id=1643938595197', '[00:00.000] 作词 : 宋普照\n[00:00.000] 作曲 : 张博文\n[00:00.00]一路生花 - 温奕心\n[00:00.73]词：宋普照\n[00:01.46]曲：张博文\n[00:02.20]编曲：李师珏\n[00:02.93]录音：田亮\n[00:03.67]和声：张修峰\n[00:04.40]特别鸣谢：郑浩纳豆\n[00:05.13]艺人统筹：冼嘉欣\n[00:05.87]推广策划：杨俊浩/Xray/赵若海\n[00:06.60]统筹：颖儿\n[00:07.34]联合『酷狗音乐人 • 星曜计划』\n[00:08.31]SP：繁星互娱\n[00:09.21]\n[00:22.11]海上的晚霞像年少的画\n[00:27.03]铺在天空等海鸥衔走它\n[00:31.59]\n[00:32.50]遥远的帆任风浪拍打\n[00:36.84]为梦再痛也不会害怕\n[00:41.33]\n[00:42.52]远走的风沙去谁的天涯\n[00:46.92]春天可曾在哪里见过他\n[00:51.33]\n[00:52.47]时间的手抚过了脸颊\n[00:56.86]他们谁都沉默不说话\n[01:01.52]\n[01:04.51]我希望许过的愿望一路生花\n[01:09.32]护送那时的梦抵挡过风沙\n[01:13.85]\n[01:14.44]指尖的樱花如诗写谁的韶华\n[01:19.31]疯狂的热爱夹带着文雅\n[01:23.10]\n[01:24.42]我希望许过的愿望一路生花\n[01:29.27]将那雨中的人藏在屋檐下\n[01:34.39]岁月在冲刷逆流沧桑的喧哗\n[01:39.36]安静的夜晚你在想谁吗\n[01:44.62]\n[02:07.55]远走的风沙去谁的天涯\n[02:12.08]春天可曾在哪里见过他\n[02:16.34]\n[02:17.51]时间的手抚过了脸颊\n[02:21.83]他们谁都沉默不说话\n[02:26.36]\n[02:29.51]我希望许过的愿望一路生花\n[02:34.16]护送那时的梦抵挡过风沙\n[02:38.88]\n[02:39.42]指尖的樱花如诗写谁的韶华\n[02:44.38]疯狂的热爱夹带着文雅\n[02:49.33]我希望许过的愿望一路生花\n[02:54.30]将那雨中的人藏在屋檐下\n[02:58.67]\n[02:59.44]岁月在冲刷逆流沧桑的喧哗\n[03:04.44]安静的夜晚你在想谁吗\n[03:08.88]\n[03:09.48]我希望许过的愿望一路生花\n[03:14.40]护送那时的梦抵挡过风沙\n[03:18.98]\n[03:19.61]指尖的樱花如诗写谁的韶华\n[03:24.32]疯狂的热爱夹带着文雅\n[03:29.53]我希望许过的愿望一路生花\n[03:34.34]将那雨中的人藏在屋檐下\n[03:39.36]岁月在冲刷逆流沧桑的喧哗\n[03:44.36]安静的夜晚你在想谁吗\n[03:48.89]\n[03:49.42]安静的夜晚你在想谁吗', 1, '100', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1644374062902', '雪龙吟', '1622072970585', '1644298968982', '1643040000000', '雪龙吟', 'http://localhost:8200/song/source?id=1644374062902', '[00:00.000] 作词 : 二水\n[00:00.474] 作曲 : 包胡尔查\n[00:00.948] 编曲 : 刘乐\n[00:01.422] 制作人 : 包胡尔查\n[00:01.896] 录音师 : 孙炜祁\n[00:02.370] 录音棚 : Shicong Fatnunu\n[00:02.844] 和声 : DBD CHORUS\n[00:03.318] 混音 : 张鸣利\n[00:03.792] 混音助理 : 李永乾\n[00:04.266] 母带 : 李琰祥/张鸣利ll\n[00:04.740] 制作 : 包胡尔查工作室\n[00:05.214] \n[00:05.688] Rap 编写:刘乐\n[00:06.162] \n[00:06.636] Rap Flow：杨和苏KeyNG\n[00:07.110] \n[00:07.584] 企划制作统筹：二水\n[00:08.73]我一声龙啸凌云志\n[00:12.66]热血燃冬扶摇起\n[00:16.68]看长城内外这天地\n[00:20.61]山河云开笑容里\n[00:24.69]我一声龙啸跨东西\n[00:28.68]踏雪而来创奇迹\n[00:32.67]来双奥之城感动你\n[00:36.57]神州铿锵亿万心\n[00:40.71]RAP:\n[00:40.89]我斟满来自东方的骄傲\n[00:42.99]痛饮一樽五千年的荣耀\n[00:44.94]四方英雄多多指教\n[00:46.83]我带着敬意向你们问声好\n[00:49.05]2008光芒依旧闪耀\n[00:50.88]圣火还在熊熊燃烧\n[00:52.86]老朋友坦诚相见的心跳\n[00:54.69]像中国的故事他传奇而美好\n[00:56.85]望长城内外雪花飘飘\n[00:58.98]冰雪健儿笑的多自豪\n[01:00.90]我张开海纳百川的怀抱\n[01:02.73]双奥之城繁星环绕\n[01:06.72]万里山河都在画里\n[01:10.68]金石铭刻盛世的崛起\n[01:14.64]春秋竹简泛黄入了泥\n[01:18.69]中国底气大写的传奇\n[01:22.74]苍山覆雪待写壮丽\n[01:26.73]共同愿望连接我和你\n[01:30.60]诗书古曲万卷成了集\n[01:34.71]寥寥数笔震撼这天地\n[01:46.71]我一声龙啸凌云志\n[01:50.67]热血燃冬扶摇起\n[01:54.66]看长城内外这天地\n[01:58.56]山河云开笑容里\n[02:02.70]我一声龙啸跨东西\n[02:06.72]踏雪而来创奇迹\n[02:10.71]来双奥之城感动你\n[02:14.58]神州铿锵亿万心\n[02:17.91]RAP:\n[02:18.96]五色的彩虹架起的跑道\n[02:20.94]千山万水缘起五环桥\n[02:22.80]世界的梦想最新的注脚\n[02:24.75]奇迹由我们共同来创造\n[02:26.73]你身如飞燕我好似游龙\n[02:28.86]我们御冰而行飞跃巅峰\n[02:30.96]每一个人都热情相拥\n[02:32.91]中国红最能让我们感动\n[02:34.83]望长城内外雪花飘飘\n[02:36.96]冰雪健儿笑的多自豪\n[02:38.88]我张开海纳百川的怀抱\n[02:40.71]双奥之城繁星环绕\n[02:44.73]我一声龙啸凌云志\n[02:48.66]热血燃冬扶摇起\n[02:52.65]看长城内外这天地\n[02:56.55]山河云开笑容里\n[03:00.69]我一声龙啸跨东西\n[03:04.68]踏雪而来创奇迹\n[03:08.67]来双奥之城感动你\n[03:12.54]神州铿锵亿万心', 0, '83', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1644374176123', '你头顶的风', '1644298601058', '1644298645535', '1642694400000', '你头顶的风', 'http://localhost:8200/song/source?id=1644374176123', NULL, NULL, '37', '2022-05-26 15:13:36');
INSERT INTO `song` VALUES ('1644374326583', '最美的太阳', '1622072970585', '1644287493057', '1166889600000', '最美的太阳', 'http://localhost:8200/song/source?id=1644374326583', '[00:00.000] 作词 : 刘吉宁\n[00:01.000] 作曲 : 刘吉宁\n[00:02.000] 编曲 : 周治平\n[00:03.000]\n[00:43.783]我的世界\n[00:47.332]因为有你才会美\n[00:50.142]我的天空\n[00:53.670]因为有你不会黑\n[00:56.578]给我快乐\n[01:00.101]为我伤心流眼泪\n[01:03.000]给我宽容\n[01:06.509]让我能展翅高飞\n[01:08.956]你的话你的泪\n[01:12.128]你的笑你的美\n[01:15.349]在我眼中胜过最美的玫瑰\n[01:21.735]抱着梦 往前飞\n[01:24.904]不逃避 不后退\n[01:28.091]你是我成功路上的堡垒\n[01:38.146]给我翅膀\n[01:41.929]让我可以翱翔\n[01:44.585]给我力量\n[01:48.054]是你让我变坚强\n[01:50.947]不怕受伤\n[01:54.309]因为有你在身旁\n[01:56.923]你的笑 你的泪\n[01:59.280]是我筑梦路上最美的太阳\n[02:04.986]\n[02:35.311]你的话你的泪\n[02:38.441]你的笑你的美\n[02:41.646]在我眼中胜过最美的玫瑰\n[02:48.067]抱着梦 往前飞\n[02:51.257]不逃避 不后退\n[02:54.463]你是我成功路上的堡垒\n[03:04.525]给我翅膀\n[03:08.297]让我可以翱翔\n[03:10.940]给我力量\n[03:14.450]是你让我变坚强\n[03:17.303]不怕受伤\n[03:20.711]因为有你在身旁\n[03:23.259]你的笑 你的泪\n[03:25.640]是我筑梦路上最美的太阳\n[03:33.332]给我翅膀\n[03:37.052]让我可以翱翔\n[03:39.794]给我力量\n[03:43.250]是你让我变坚强\n[03:46.149]不怕受伤\n[03:49.456]因为有你在身旁\n[03:52.030]你的笑 你的泪\n[03:54.440]是我筑梦路上最美的太阳\n[04:00.863]是我筑梦路上最美的太阳', 0, '13', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1644375432188', 'monsters', '1644375002022', '1644375339209', '1399737600000', 'monsters', 'http://localhost:8200/song/source?id=1644375432188', '[00:00.000]I see your monsters, I see your pain.\n[00:05.140]Tell me your problems,I\'ll chase them away.\n[00:10.960]I\'ll be your lighthouse.\n[00:13.820]I\'ll make it okay.\n[00:16.240]When I see your monsters\n[00:18.960]I\'ll stand there so brave,\n[00:21.110]and chase them all away.\n[00:26.890]In the dark we, we, we,\n[00:29.950]stand apart we, we,\n[00:32.610]never see that the things we need are staring right at us.\n[00:38.230]You just want to hide, hide,hide\n[00:40.780]never show your smile, smile.\n[00:43.600]Stand alone when you need someone\n[00:46.410]its the hardest thing of all\n[00:48.320]that you see are the bad, bad, bad memories\n[00:53.580]take your time, you\'ll find me.\n[00:57.090]I see your monsters,\n[01:00.010]I see your pain.\n[01:02.670]Tell me your problems,\n[01:05.380]I\'ll chase them away.\n[01:07.910]I\'ll be your lighthouse.\n[01:10.710]I\'ll make it okay.\n[01:13.320]When I see your monsters\n[01:16.090]I\'ll stand there so brave,\n[01:18.240]and chase them all away.\n[01:22.060]I can see the sky, sky, sky,\n[01:24.420]beautiful tonight, night\n[01:27.210]when you breathe why can\'t you see\n[01:29.870]the clouds are in your head\n[01:32.950]I will stay there there, there\n[01:35.310]no need to fear, fear,\n[01:37.910]when you need to talk it out with someone you can trust.\n[01:42.620]What you see are the bad, bad, bad memories\n[01:48.610]take your time you\'ll find me.\n[01:51.810]I see your monsters,\n[01:54.530]I see your pain.\n[01:57.230]Tell me your problems,\n[01:59.930]I\'ll chase them away.\n[02:02.640]I\'ll be your lighthouse.\n[02:05.380]I\'ll make it okay.\n[02:07.690]When I see your monsters\n[02:10.300]I\'ll stand there so brave,\n[02:12.410]and chase them all away.\n[02:18.030]I\'ll chase them all away\n[02:26.310]You\'ve got the chance to see the light,\n[02:32.540]even in the darkest night\n[02:37.840]And I will be here like you were for me,\n[02:44.410]so just let me in.\n[02:48.530]Cause... I see your monsters,\n[02:51.440]I see your pain.\n[02:54.190]Tell me your problems,\n[02:56.900]I\'ll chase them away.\n[02:59.620]I\'ll be your lighthouse.\n[03:02.220]I\'ll make it okay.\n[03:04.820]When I see your monsters\n[03:07.330]I\'ll stand there so brave,\n[03:11.620]I see your monsters,\n[03:13.750]I see your pain.\n[03:15.810]Tell me your problems,\n[03:18.580]I\'ll chase them away.\n[03:21.030]I\'ll be your lighthouse.\n[03:23.800]I\'ll make it okay.\n[03:26.500]When I see your monsters\n[03:29.010]I\'ll stand there so brave,\n[03:31.220]and chase them all away.', 1, '17', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1645600255159', '无名的人', '1621602849693', '1645598506732', '1639411200000', '由毛不易演唱，钱雷作曲，唐恬作词的动画电影《雄狮少年》主题曲《无名的人》2021年12月14日上线', 'http://localhost:8200/song/source?id=1645600255159', NULL, NULL, '11', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1647143678810', '和光同尘', '1624547670156', '1647143549483', '1608393600000', '《大江大河2》是由上海广播电视台、正午阳光、SMG尚世影业出品，改编自阿耐小说《大江东去》', 'http://localhost:8200/song/source?id=1647143678810', '[00:00.00]和光同尘 (《大江大河2》电视剧主题曲) - 周深\n[00:04.26]词：董颖达\n[00:04.97]曲：董颖达\n[00:05.58]编曲：董颖达\n[00:06.32]制作人：董颖达\n[00:07.29]和声：周深/许一鸣\n[00:07.93]人声录音/配唱：徐威@V-Studio（上海）\n[00:09.83]混音/母带：赵靖BIG.J@SBMS Beijing\n[00:11.31]特别鸣谢：周深工作室\n[00:12.82]版权方：东阳正午阳光影视有限公司\n[00:15.50]\n[00:20.31]和你一起歌\n[00:22.32]\n[00:23.11]和你一起合\n[00:25.30]\n[00:26.23]月落星沉\n[00:28.61]\n[00:29.31]日出东海\n[00:31.79]\n[00:32.75]和你走过\n[00:34.81]\n[00:35.81]理想的大河\n[00:38.38]\n[00:39.07]从容的\n[00:41.06]\n[00:42.16]沸腾着\n[00:44.78]你看那 盛放的花儿\n[00:47.71]来自期盼的种子\n[00:50.40]\n[00:50.99]你看那 丰硕果实\n[00:53.98]来自耕耘的浪漫\n[00:56.82]\n[00:57.45]宽广的大河\n[00:59.99]\n[01:00.61]来自八方汇聚的小溪\n[01:03.84]奔腾向前的大江\n[01:06.36]\n[01:07.00]来自高山的哺育\n[01:12.23]\n[01:13.98]和光同行\n[01:16.86]跌跌撞撞的摸索\n[01:19.02]\n[01:20.04]和光同舞\n[01:23.08]奋不顾身的坎坷\n[01:25.47]\n[01:26.26]和光同尘\n[01:29.35]不为盛名而来\n[01:32.66]不为低谷而去\n[01:38.40]你看那 盛放的花儿\n[01:41.30]来自期盼的种子\n[01:44.09]\n[01:44.65]你看那 丰硕果实\n[01:47.64]来自耕耘的浪漫\n[01:50.56]\n[01:51.10]宽广的大河\n[01:53.74]\n[01:54.31]来自八方汇聚的小溪\n[01:57.47]奔腾向前的大江\n[01:59.92]\n[02:00.62]来自高山的哺育\n[02:06.34]\n[02:07.54]和光同行\n[02:10.51]跌跌撞撞的摸索\n[02:12.60]\n[02:13.65]和光同舞\n[02:16.80]奋不顾身的坎坷\n[02:18.98]\n[02:19.96]和光同尘\n[02:23.13]不为盛名而来\n[02:26.20]不为低谷而去\n[02:32.10]你看那 盛放的花儿\n[02:34.97]来自期盼的种子\n[02:37.83]\n[02:38.39]你看那 丰硕果实\n[02:41.22]来自耕耘的浪漫\n[02:44.08]\n[02:45.29]和光同尘\n[02:48.30]不为盛名而来\n[02:50.83]\n[02:51.58]不为低谷而去\n[02:57.80]和光同行\n[03:01.00]跌跌撞撞的摸索\n[03:03.10]\n[03:04.11]和光同舞\n[03:07.31]奋不顾身的坎坷\n[03:09.55]\n[03:10.45]和光同尘\n[03:13.55]不为盛名而来\n[03:16.74]不为低谷而去\n[03:23.20]和光同尘\n[03:26.70]为你而来\n[03:28.78]\n[03:29.69]有你 我在\n', NULL, '28', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1647144314377', '拥抱你离去', '1647144073030', '1647144237369', '1513612800000', '《拥抱你离去》歌曲开始用一种淡淡的忧伤演绎着爱情离去时的无奈和心碎，随后忧伤的男声伴着和声娓娓轻诉将歌曲推向高潮，副歌部分极富张力和爆发的演绎就像歇斯底里地宣泄着爱情的伤痛', 'http://localhost:8200/song/source?id=1647144314377', NULL, 0, '5', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1647144678278', '都是你的错', '1647144476077', '1647144602353', '952963200000', '郑中基在2003年5月份推出的一张粤语精选专辑，其中收录了他16首歌曲.', 'http://localhost:8200/song/source?id=1647144678278', '[00:00.000] 作词 : 梁芷珊\n[00:01.000] 作曲 : 张宇\n[00:02.000] 编曲 : 陈家健\n[00:20.450]都是你的错 关心也是错\n[00:23.740]你还要把依依不舍都\n[00:25.920]挂于脸上\n[00:27.340]都是你的错 潇洒也是错\n[00:30.620]你还痛哭过\n[00:34.160]都是你的错 牺牲也是错\n[00:37.640]你还要听解释怎么\n[00:39.620]竟变得冷漠\n[00:41.390]都是你的错 知心也是错\n[00:44.520]你还看紧我\n[00:47.710]你叫我怎会可以放手\n[00:55.290]若你没厮守一生的决心\n[00:58.790]请不要爱上我这么一个人\n[01:02.270]在你字典中一句\n[01:04.498]挥之则去\n[01:06.260]对我仍过分\n[01:09.248]若你曾讲的都不可算真\n[01:12.739]请不要爱上我这么一个人\n[01:16.180]而其实我太认真\n[01:18.438]心中很记恨\n[01:23.049]都是你的错 关心也是错\n[01:26.328]你还要把依依不舍\n[01:28.260]都挂于脸上\n[01:29.968]都是你的错 潇洒也是错\n[01:33.260]你还痛哭过\n[01:36.700]都是你的错 牺牲也是错\n[01:40.188]你还要听解释\n[01:41.709]怎么竟变得冷漠\n[01:43.930]都是你的错 知心也是错\n[01:47.069]你还看紧我\n[01:50.360]你叫我怎会可以放手\n[01:57.900]若你没厮守一生的决心\n[02:01.278]请不要爱上我这么一个人\n[02:04.819]在你字典中一句\n[02:07.150]挥之则去\n[02:08.869]对我仍过分\n[02:11.799]若你曾讲的都不可算真\n[02:15.338]请不要爱上我这么一个人\n[02:18.769]而其实我太认真\n[02:21.099]心中很记恨\n[02:26.000]毋须关心我感受\n[02:32.879]毋须伤透后你方可以放手\n[02:55.440]若你曾讲的都不可算真\n[02:58.780]请不要爱上我这么一个人\n[03:02.229]而其实我太认真\n[03:04.560]心中很记恨\n[03:09.149]若你没厮守一生的决心\n[03:12.689]请不要爱上我这么一个人\n[03:16.129]在你字典中一句\n[03:18.409]挥之则去\n[03:20.179]对我仍过分\n[03:23.109]若你曾讲的都不可算真\n[03:26.649]请不要爱上我这么一个人\n[03:30.089]而其实我太认真\n[03:32.419]心中很记恨\n', 0, '17', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1647145343871', '吻别', '1635506538320', '1647145284879', '731260800000', '《吻别》是香港歌手张学友发行的第十七张专辑，也是第五张国语专辑，该唱片仅在台湾的销量就破百万，它以136万的销量成绩在台湾历年唱片销量榜位居第一', 'http://localhost:8200/song/source?id=1647145343871', '[00:00.000] 作词 : 何启弘\n[00:01.000] 作曲 : 殷文琦\n[00:02.000] 编曲 : 殷文琦\n[00:03.000] 制作人 : 黄庆元\n[00:04.00]\n[00:36.125]前尘往事成云烟\n[00:39.014]消散在彼此眼前\n[00:43.984]就连说过了再见\n[00:47.148]也看不见你有些哀怨\n[00:52.305]给我的一切\n[00:55.131]你不过是在敷衍\n[01:00.396]你笑得越无邪\n[01:02.859]我就会爱你爱得更狂野\n[01:06.518]总在刹那间有一些了解\n[01:10.492]说过的话不可能会实现\n[01:14.415]就在一转眼 发现你的脸\n[01:18.355]已经陌生 不会再像从前\n[01:22.290]我的世界开始下雪\n[01:26.700]冷得让我无法多爱一天\n[01:30.660]冷得连隐藏的遗憾\n[01:34.855]都那么地明显\n[01:38.022]我和你吻别在无人的街\n[01:42.676]让风痴笑我不能拒绝\n[01:45.884]我和你吻别在狂乱的夜\n[01:50.516]我的心等着迎接伤悲\n[01:57.655]\n[02:33.872]想要给你的思念\n[02:36.972]就像风筝断了线\n[02:41.892]飞不进你的世界\n[02:45.039]也温暖不了你的视线\n[02:50.219]我已经看见一出悲剧正上演\n[02:58.353]剧终没有喜悦\n[03:00.805]我仍然躲在你的梦里面\n[03:04.472]总在刹那间有一些了解\n[03:08.458]说过的话不可能会实现\n[03:12.359]就在一转眼 发现你的脸\n[03:16.335]已经陌生 不会再像从前\n[03:20.239]我的世界开始下雪\n[03:24.644]冷得让我无法多爱一天\n[03:28.585]冷得连隐藏的遗憾\n[03:32.777]都那么地明显\n[03:35.988]我和你吻别在无人的街\n[03:40.613]让风痴笑我不能拒绝\n[03:43.829]我和你吻别在狂乱的夜\n[03:48.470]我的心等着迎接伤悲\n[03:55.639]我和你吻别在无人的街\n[04:00.362]让风痴笑我不能拒绝\n[04:03.526]我和你吻别在狂乱的夜\n[04:08.162]我的心等着迎接伤悲\n[04:15.303]\n[04:20.388] 二胡 : 温金龙\n[04:25.473] 和声 : 罗添洲/薛忠铭/许子鸿/陈秀珠/陈丽莉/黄卓颖/黄秀侦\n[04:30.558] 录音师 : 徐崇宪/林明阳/王伟明/锺国泰\n[04:35.643] 混音师 : 林明阳/王伟明/锺国泰\n[04:40.728] 母带工程师 : 徐崇宪/林明阳\n[04:45.813] OP : PolyGram Taiwan\n[04:50.898] SP : PolyGram\n[04:55.983] 录音室 : 白金录音室/丽风录音室/Dragon Studio\n[05:01.068] 混音室 : 白金录音室\n[05:06.153] 母带后期处理录音室 : 丽风录音室\n', NULL, '10', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648208054434', '麻雀', '1622072806610', '1648207959257', '1596038400000', '渺小而又强大，脆弱而又顽强。', 'http://localhost:8200/song/source?id=1648208054434', '[00:00.000] 作词 : 李荣浩\n[00:01.000] 作曲 : 李荣浩\n[00:02.000] 编曲 : 李荣浩\n[00:03.000] 制作人 : 李荣浩\n[00:14.285]\n[00:22.837]山隔壁还是山\n[00:25.169]都有一个伴\n[00:28.202]相信海枯石烂\n[00:30.686]也许我笨蛋\n[00:33.686]飞太慢会落单\n[00:36.202]太快会受伤\n[00:39.237]日子不就都这样\n[00:44.185]\n[00:45.221]天会晴就会暗\n[00:47.654]我早就习惯\n[00:50.602]一日为了三餐\n[00:53.119]不至于寒酸\n[00:56.353]为给你取暖我把翅膀折断\n[01:01.722]我遭遇那些苦难\n[01:04.537]你却不管\n[01:06.935]\n[01:07.138]我飞翔在乌云之中\n[01:10.388]你看着我无动于衷\n[01:13.186]有多少次波涛汹涌\n[01:16.203]在我 心中\n[01:18.403]\n[01:18.619]你飞向了雪山之巅\n[01:21.552]我留在你回忆里面\n[01:24.403]你成仙我替你留守人间\n[01:30.019]麻雀也有明天\n[01:36.138]\n[01:55.670]天会晴就会暗\n[01:58.186]我早就习惯\n[02:01.102]一日为了三餐\n[02:03.703]不至于寒酸\n[02:06.786]为给你取暖我把翅膀折断\n[02:12.235]我遭遇那些苦难\n[02:15.051]你却不管\n[02:17.352]\n[02:17.638]我飞翔在乌云之中\n[02:21.068]你看着我无动于衷\n[02:23.786]有多少次波涛汹涌\n[02:26.752]在我 心中\n[02:29.052]\n[02:29.205]你飞向了雪山之巅\n[02:32.286]我留在你回忆里面\n[02:35.068]你成仙我替你留守人间\n[02:40.685]麻雀也有明天\n[02:46.703]\n[03:05.882]我飞翔在乌云之中\n[03:09.064]你看着我无动于衷\n[03:11.730]有多少次波涛汹涌\n[03:14.730]在我 心中\n[03:16.998]\n[03:17.151]你飞向了雪山之巅\n[03:20.265]我留在你回忆里面\n[03:23.083]你成仙我替你留守人间\n[03:28.781]麻雀也有明天\n[03:34.635]\n[03:35.449]吉他 : 李荣浩\n[03:36.247]贝斯 : 李荣浩\n[03:36.932]和音编写 : 李荣浩\n[03:37.632]和音 : 李荣浩\n[03:38.401]录音师 : 李荣浩\n[03:39.116]混音师 : 李荣浩\n[03:39.799]音乐制作助理 : 青格乐\n[03:40.497]录音工作室 : 北京一样音乐录音室\n[03:41.215]混音工作室 : 北京一样音乐录音室\n[03:41.895]母带后期制作人 : 李荣浩\n[03:42.532]母带后期处理工程师 : 周天澈\n[03:43.247]母带后期处理录音室 : Studio21A\n[03:45.706] 吉他 : 李荣浩\n[03:48.165] 贝斯 : 李荣浩\n[03:50.624] 和声编写 : 李荣浩\n[03:53.083] 和音 : 李荣浩\n[03:55.542] 录音师 : 李荣浩\n[03:58.001] 混音师 : 李荣浩\n[04:00.460] 音乐制作助理 : 青格乐\n[04:02.919] 录音工作室 : 北京一样音乐录音室\n[04:05.378] 混音室 : 北京一样音乐录音室\n[04:07.837] 母带制作 : 李荣浩\n[04:10.296] 母带工程师 : 周天澈\n[04:12.755] 母带后期处理录音室 : Studio21A', 1, '13', '2022-05-26 15:13:42');
INSERT INTO `song` VALUES ('1648208736500', '窗外', '1648208620910', '1648208672103', '925488000000', '窗外', 'http://localhost:8200/song/source?id=1648208736500', '[00:28.940]今夜我又来到你的窗外\n[00:33.310]窗帘上你的影子多么可爱\n[00:38.420]悄悄的爱过你这么多年\n[00:42.870]明天我就要离开\n[00:47.620]多少回我来到你的窗外\n[00:52.360]也曾想敲敲门叫你出来\n[00:56.700]想一想你的美丽\n[00:59.310]我的平凡\n[01:01.470]一次次默默走开\n[01:06.150]再见了心爱的梦中女孩\n[01:10.920]我将要去远方寻找未来\n[01:15.300]假如我有一天荣归故里\n[01:19.630]再到你窗外诉说情怀\n[01:24.510]再见了心爱的梦中女孩\n[01:29.390]对着你的影子说声珍重\n[01:33.930]假如我永远不再回来\n[01:37.990]就让月亮守在你窗外\n[01:42.970]\n[02:01.250]今夜我又来到你的窗外\n[02:05.320]窗帘上你的影子多么可爱\n[02:10.870]悄悄的爱过你这么多年\n[02:15.000]明天我就要离开\n[02:19.510]多少回我来到你的窗外\n[02:24.240]也曾想敲敲门叫你出来\n[02:28.820]想一想你的美丽\n[02:31.140]我的平凡\n[02:33.380]一次次默默走开\n[02:37.580]再见了心爱的梦中女孩\n[02:42.570]我将要去远方寻找未来\n[02:46.720]假如我有一天荣归故里\n[02:51.160]再到你窗外诉说情怀\n[02:55.840]再见了心爱的梦中女孩\n[03:00.450]对着你的影子说声珍重\n[03:05.260]假如我永远不再回来\n[03:09.350]就让月亮守在你窗外\n[03:14.130]再见了心爱的梦中女孩\n[03:19.020]我将要去远方寻找未来\n[03:23.670]假如我有一天荣归故里\n[03:27.760]再到你窗外诉说情怀\n[03:32.800]再见了心爱的梦中女孩\n[03:37.510]对着你的影子说声珍重\n[03:41.930]假如我永远不再回来\n[03:45.990]就让月亮守在你窗外\n[03:50.780]就让月亮守在你窗外\n', NULL, '14', '2022-05-26 15:02:21');
INSERT INTO `song` VALUES ('1648269910363', '라일락 ', '1622072019119', '1648269772859', '1616601600000', '눈물이 고여도 꾹 참을래\n\n내 마음 한켠 비밀스런', 'http://localhost:8200/song/source?id=1648269910363', NULL, 1, '14', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648270034330', 'Flu', '1622072019119', '1648269772859', '1616601600000', 'Flu', 'http://localhost:8200/song/source?id=1648270034330', NULL, 1, '10', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648270087790', 'Coin', '1622072019119', '1648269772859', '1616601600000', 'Coin', 'http://localhost:8200/song/source?id=1648270087790', NULL, 0, '6', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648270454571', 'Butter-Fly', '1622071867884', '1648270374236', '1262275200000', 'Butter-Fly(数码宝贝主题曲)', 'http://localhost:8200/song/source?id=1648270454571', NULL, NULL, '41', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648271712472', '爱的就是你', '1648271489040', '1648271623843', '1001174400000', '电视剧《蜜桃女孩》片头曲', 'http://localhost:8200/song/source?id=1648271712472', NULL, NULL, '5', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648273167106', 'Cruel Summer', '1622072451745', '1648273110035', '1566489600000', 'Cruel Summer', 'http://localhost:8200/song/source?id=1648273167106', NULL, 1, '103', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648273221025', 'the man', '1622072451745', '1648273110035', '1566489600000', 'the man', 'http://localhost:8200/song/source?id=1648273221025', NULL, 0, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648273273312', 'Cornelia Street', '1622072451745', '1648273110035', '1566489600000', 'Cornelia Street', 'http://localhost:8200/song/source?id=1648273273312', NULL, 0, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648273334240', 'Death By A Thousand Cuts', '1622072451745', '1648273110035', '1566489600000', 'Death By A Thousand Cuts', 'http://localhost:8200/song/source?id=1648273334240', NULL, 0, '25', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648273390456', 'You Need To Calm Down', '1622072451745', '1648273110035', '1566489600000', 'You Need To Calm Down', 'http://localhost:8200/song/source?id=1648273390456', NULL, 1, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1648273424472', 'Afterglow', '1622072451745', '1648273110035', '1566489600000', 'Afterglow', 'http://localhost:8200/song/source?id=1648273424472', NULL, 0, '13', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1649334883510', 'I Really Like You', '1649333771120', '1649333904053', '1453996800000', 'I Really Like You', 'http://localhost:8200/song/source?id=1649334883510', NULL, 1, '5', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1649335080451', 'Good Time', '1649333771120', '1649335015187', '1348761600000', 'Good Time', 'http://localhost:8200/song/source?id=1649335080451', NULL, 0, '11', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1649335244826', 'Call Me Maybe', '1649333771120', '1649335015187', '1348761600000', 'Call Me Maybe', 'http://localhost:8200/song/source?id=1649335244826', NULL, 1, '18', '2022-05-26 15:04:26');
INSERT INTO `song` VALUES ('1649335319660', 'Curiosity', '1649333771120', '1649335015187', '1348761600000', 'Curiosity', 'http://localhost:8200/song/source?id=1649335319660', NULL, 0, '14', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1649336428604', 'Five Hundred Miles', '1649335834894', '1649336326830', '1381248000000', '2013年Justin Timberlake 联手Carey Mulligan和Stark Sands在主演新片Inside Llewyn Davis《醉乡民谣》中深情献唱主题曲500 Miles，该片于2013年12月4日在比利时和法国上映 ，2014年1月2日在德国上映。', 'http://localhost:8200/song/source?id=1649336428604', NULL, 1, '20', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1649336837075', 'The Way I Still Love', '1649336637726', '1649336700163', '1393948800000', 'The Way I Still Love', 'http://localhost:8200/song/source?id=1649336837075', NULL, NULL, '5', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1649337040969', 'for him', '1622072666625', '1649336978859', '1449158400000', 'for him', 'http://localhost:8200/song/source?id=1649337040969', NULL, NULL, '1', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1649575133886', 'End Games', '1622072451745', '1649574999552', '1510243200000', 'End Games', 'http://localhost:8200/song/source?id=1649575133886', NULL, 0, '11', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1649575232381', 'look what you  made me do', '1622072451745', '1649574999552', '1510243200000', 'look what you  made me do', 'http://localhost:8200/song/source?id=1649575232381', NULL, NULL, '17', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1649982278381', '水中花', '1649982084489', '1649982201990', '1635436800000', '时光音乐会 第2期', 'http://localhost:8200/song/source?id=1649982278381', NULL, NULL, '49', '2022-05-15 20:30:05');
INSERT INTO `song` VALUES ('1650008526637', 'パプリカ（红辣椒）', '1621603618588', '1622074187201', '1581004800000', 'パプリカ', 'http://localhost:8200/song/source?id=1650008526637', NULL, 1, '2', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650008618850', '海の幽霊', '1621603618588', '1622074304369', '1559836800000', '海の幽霊', 'http://localhost:8200/song/source?id=1650008618850', NULL, NULL, '0', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650008684093', 'Flamingo', '1621603618588', '1622074381617', '1540915200000', 'Flamingo', 'http://localhost:8200/song/source?id=1650008684093', NULL, NULL, '0', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650008827783', '世界上不存在的歌', '1621602559815', '1622073722073', '1600272000000', '世界上不存在的歌', 'http://localhost:8200/song/source?id=1650008827783', NULL, NULL, '0', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650008891685', 'Shall We Talk', '1621602559815', '1622073777612', '1594742400000', 'Shall We Talk', 'http://localhost:8200/song/source?id=1650008891685', NULL, NULL, '0', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650008950243', 'Fight as ONE', '1621602559815', '1622073850159', '1588176000000', 'Fight as ONE', 'http://localhost:8200/song/source?id=1650008950243', NULL, NULL, '0', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650009022897', '相信你的人(《银河补习班》推广曲)', '1621602559815', '1622073934094', '1563811200000', '相信你的人', 'http://localhost:8200/song/source?id=1650009022897', NULL, NULL, '2', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650524182823', 'Just Dance', '1635341685282', '1650524098532', '1199116800000', 'Just Dance', 'http://localhost:8200/song/source?id=1650524182823', NULL, NULL, '3', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650524279021', 'Poker face', '1635341685282', '1650524098532', '1199116800000', 'Poker face', 'http://localhost:8200/song/source?id=1650524279021', NULL, NULL, '1', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650524544165', 'my all', '1634457674287', '1650524472384', '1199116800000', 'my all', 'http://localhost:8200/song/source?id=1650524544165', NULL, NULL, '2', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650524822781', 'Trouble Maker', '1622072283515', '1650524754518', '1322668800000', 'Trouble Maker', 'http://localhost:8200/song/source?id=1650524822781', NULL, NULL, '1', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650525007607', '出山', '1634530730835', '1650524958719', '1538064000000', '出山', 'http://localhost:8200/song/source?id=1650525007607', NULL, NULL, '4', '2022-05-26 15:08:43');
INSERT INTO `song` VALUES ('1650533635844', '情非得已', '1650533473576', '1650533560040', '1261065600000', '情非得已', 'http://localhost:8200/song/source?id=1650533635844', NULL, 0, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650533715475', '春泥', '1650533473576', '1650533560040', '1258473600000', '春泥', 'http://localhost:8200/song/source?id=1650533715475', NULL, 1, '2', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650786496187', 'Love Me Like You Do', '1650786261435', '1650786424016', '1446739200000', 'Love Me Like You Do', 'http://localhost:8200/song/source?id=1650786496187', NULL, 0, '4', '2022-05-15 20:23:02');
INSERT INTO `song` VALUES ('1650786700381', 'outside ', '1650786261435', '1650786613182', '1415808000000', 'Outside ', 'http://localhost:8200/song/source?id=1650786700381', NULL, 1, '2', '2022-05-15 20:23:02');

-- ----------------------------
-- Table structure for songsource
-- ----------------------------
DROP TABLE IF EXISTS `songsource`;
CREATE TABLE `songsource`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dt` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `songId`) USING BTREE,
  INDEX `songId`(`songId`) USING BTREE,
  CONSTRAINT `songId` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of songsource
-- ----------------------------
INSERT INTO `songsource` VALUES ('1622101289298', '1622101289239', 'lost control.mp3', 'audio/mpeg', './upload/song', '1622101289261.mp3', 8895260, '2021-05-27 15:41:29', '2021-05-27 15:41:29', 222354);
INSERT INTO `songsource` VALUES ('1622101394897', '1622101394846', 'I Don\'t Wanna Go.mp3', 'audio/mpeg', './upload/song', '1622101394868.mp3', 6469007, '2021-05-27 15:43:14', '2021-05-27 15:43:14', 161698);
INSERT INTO `songsource` VALUES ('1622101472210', '1622101472154', 'Lily.mp3', 'audio/mpeg', './upload/song', '1622101472174.mp3', 7835733, '2021-05-27 15:44:32', '2021-05-27 15:44:32', 195866);
INSERT INTO `songsource` VALUES ('1622101549145', '1622101549091', 'Lonely.mp3', 'audio/mpeg', './upload/song', '1622101549113.mp3', 8644485, '2021-05-27 15:45:49', '2021-05-27 15:45:49', 216085);
INSERT INTO `songsource` VALUES ('1622101615128', '1622101615081', 'Do It All for You.mp3', 'audio/mpeg', './upload/song', '1622101615102.mp3', 6985187, '2021-05-27 15:46:55', '2021-05-27 15:46:55', 174602);
INSERT INTO `songsource` VALUES ('1622102342050', '1622102341993', 'baby.mp3', 'audio/mpeg', './upload/song', '1622102342014.mp3', 8667503, '2021-05-27 15:59:02', '2021-05-27 15:59:02', 216660);
INSERT INTO `songsource` VALUES ('1622102609263', '1622102609215', 'Mistletoe.mp3', 'audio/mpeg', './upload/song', '1622102609235.mp3', 7325823, '2021-05-27 16:03:29', '2021-05-27 16:03:29', 183118);
INSERT INTO `songsource` VALUES ('1622102673436', '1622102673371', 'Holy.mp3', 'audio/mpeg', './upload/song', '1622102673391.mp3', 8486705, '2021-05-27 16:04:33', '2021-05-27 16:04:33', 212140);
INSERT INTO `songsource` VALUES ('1622102743301', '1622102743240', 'The Christmas Song (Chestnuts Roasting On An Open Fire).mp3', 'audio/mpeg', './upload/song', '1622102743259.mp3', 8660158, '2021-05-27 16:05:43', '2021-05-27 16:05:43', 216477);
INSERT INTO `songsource` VALUES ('1622102944536', '1622102944462', '但求是爱.mp3', 'audio/mpeg', './upload/song', '1622102944483.mp3', 10762493, '2021-05-27 16:09:04', '2021-05-27 16:09:04', 269035);
INSERT INTO `songsource` VALUES ('1622103084267', '1622103084212', '致明日的舞.mp3', 'audio/mpeg', './upload/song', '1622103084233.mp3', 8431325, '2021-05-27 16:11:24', '2021-05-27 16:11:24', 210756);
INSERT INTO `songsource` VALUES ('1622103223732', '1622103223653', 'Lemon.mp3', 'audio/mpeg', './upload/song', '1622103223673.mp3', 10247358, '2021-05-27 16:13:43', '2021-05-27 16:13:43', 256157);
INSERT INTO `songsource` VALUES ('1622103280546', '1622103280470', 'Paper Flower.mp3', 'audio/mpeg', './upload/song', '1622103280493.mp3', 11018493, '2021-05-27 16:14:40', '2021-05-27 16:14:40', 275435);
INSERT INTO `songsource` VALUES ('1622103363547', '1622103363485', 'Cranberry & Pancake.mp3', 'audio/mpeg', './upload/song', '1622103363505.mp3', 8424011, '2021-05-27 16:16:03', '2021-05-27 16:16:03', 210573);
INSERT INTO `songsource` VALUES ('1622103579302', '1622103579245', 'カムパネルラ.mp3', 'audio/mpeg', './upload/song', '1622103579266.mp3', 9431293, '2021-05-27 16:19:39', '2021-05-27 16:19:39', 235755);
INSERT INTO `songsource` VALUES ('1622103657003', '1622103656946', 'Flamingo.mp3', 'audio/mpeg', './upload/song', '1622103656967.mp3', 7857676, '2021-05-27 16:20:57', '2021-05-27 16:20:57', 196415);
INSERT INTO `songsource` VALUES ('1622103731409', '1622103731345', '感電.mp3', 'audio/mpeg', './upload/song', '1622103731364.mp3', 10583815, '2021-05-27 16:22:11', '2021-05-27 16:22:11', 264568);
INSERT INTO `songsource` VALUES ('1622104614794', '1622104614735', 'PLACEBO.mp3', 'audio/mpeg', './upload/song', '1622104614754.mp3', 9613105, '2021-05-27 16:36:54', '2021-05-27 16:36:54', 240300);
INSERT INTO `songsource` VALUES ('1622104693712', '1622104693652', 'パプリカ.mp3', 'audio/mpeg', './upload/song', '1622104693677.mp3', 8109497, '2021-05-27 16:38:13', '2021-05-27 16:38:13', 202710);
INSERT INTO `songsource` VALUES ('1622104866933', '1622104866862', '馬と鹿.mp3', 'audio/mpeg', './upload/song', '1622104866884.mp3', 10640240, '2021-05-27 16:41:06', '2021-05-27 16:41:06', 265979);
INSERT INTO `songsource` VALUES ('1622104915236', '1622104915163', '海の幽霊.mp3', 'audio/mpeg', './upload/song', '1622104915183.mp3', 9396811, '2021-05-27 16:41:55', '2021-05-27 16:41:55', 234893);
INSERT INTO `songsource` VALUES ('1622110534776', '1622110534718', 'spark.mp3', 'audio/mpeg', './upload/song', '1622110534735.mp3', 10540862, '2021-05-27 18:15:34', '2021-05-27 18:15:34', 263497);
INSERT INTO `songsource` VALUES ('1622110604006', '1622110603944', 'trouble.mp3', 'audio/mpeg', './upload/song', '1622110603964.mp3', 7403271, '2021-05-27 18:16:44', '2021-05-27 18:16:44', 185051);
INSERT INTO `songsource` VALUES ('1622110656938', '1622110656908', 'august.mp3', 'audio/mpeg', './upload/song', '1622110656926.mp3', 2521443, '2021-05-27 18:17:36', '2021-05-27 18:17:36', 157544);
INSERT INTO `songsource` VALUES ('1622110700795', '1622110700737', 'you are in love.mp3', 'audio/mpeg', './upload/song', '1622110700758.mp3', 9298695, '2021-05-27 18:18:20', '2021-05-27 18:18:20', 232438);
INSERT INTO `songsource` VALUES ('1622110748289', '1622110748238', 'our song.mp3', 'audio/mpeg', './upload/song', '1622110748257.mp3', 8139995, '2021-05-27 18:19:08', '2021-05-27 18:19:08', 203468);
INSERT INTO `songsource` VALUES ('1622110787838', '1622110787760', 'fifteen.mp3', 'audio/mpeg', './upload/song', '1622110787784.mp3', 11820974, '2021-05-27 18:19:47', '2021-05-27 18:19:47', 295393);
INSERT INTO `songsource` VALUES ('1622110819056', '1622110818998', 'lovestory.mp3', 'audio/mpeg', './upload/song', '1622110819017.mp3', 9433609, '2021-05-27 18:20:19', '2021-05-27 18:20:19', 235807);
INSERT INTO `songsource` VALUES ('1622111035952', '1622111035876', 'Never Grow Up.mp3', 'audio/mpeg', './upload/song', '1622111035906.mp3', 11631006, '2021-05-27 18:23:55', '2021-05-27 18:23:55', 290743);
INSERT INTO `songsource` VALUES ('1622111065123', '1622111065068', 'Jump Then Fall.mp3', 'audio/mpeg', './upload/song', '1622111065088.mp3', 9526461, '2021-05-27 18:24:25', '2021-05-27 18:24:25', 238132);
INSERT INTO `songsource` VALUES ('1624372266121', '1624372266021', 'Pale Blue - 米津玄師.mp3', 'audio/mpeg', './upload/song', '1624372266056.mp3', 12029996, '2021-06-22 22:31:06', '2021-06-22 22:31:06', 296594);
INSERT INTO `songsource` VALUES ('1624375324164', '1624375323999', 'Love Again - Dua Lipa.mp3', 'audio/mpeg', './upload/song', '1624375324057.mp3', 10393673, '2021-06-22 23:22:04', '2021-06-22 23:22:04', 258038);
INSERT INTO `songsource` VALUES ('1624540295409', '1624540295354', 'Butter.mp3', 'audio/mpeg', './upload/song', '1624540295391.mp3', 2656690, '2021-06-24 21:11:35', '2021-06-24 21:11:35', 164493);
INSERT INTO `songsource` VALUES ('1624546050061', '1624546049959', '阿刁 - 赵雷.mp3', 'audio/mpeg', './upload/song', '1624546049992.mp3', 15166051, '2021-06-24 22:47:30', '2021-06-24 22:47:30', 377940);
INSERT INTO `songsource` VALUES ('1624546108943', '1624546108864', '鼓楼 - 赵雷.mp3', 'audio/mpeg', './upload/song', '1624546108891.mp3', 11318737, '2021-06-24 22:48:28', '2021-06-24 22:48:28', 281757);
INSERT INTO `songsource` VALUES ('1624546320275', '1624546320157', '成都 - 赵雷.mp3', 'audio/mpeg', './upload/song', '1624546320202.mp3', 13915375, '2021-06-24 22:52:00', '2021-06-24 22:52:00', 328411);
INSERT INTO `songsource` VALUES ('1624546506221', '1624546506142', '我们的时光 - 赵雷.mp3', 'audio/mpeg', './upload/song', '1624546506177.mp3', 11055527, '2021-06-24 22:55:06', '2021-06-24 22:55:06', 270785);
INSERT INTO `songsource` VALUES ('1624546835383', '1624546835299', 'bed吉姆餐厅.mp3', 'audio/mpeg', './upload/song', '1624546835331.mp3', 5675511, '2021-06-24 23:00:35', '2021-06-24 23:00:35', 354691);
INSERT INTO `songsource` VALUES ('1624547985843', '1624547985767', '亲爱的旅人啊 - 周深.mp3', 'audio/mpeg', './upload/song', '1624547985813.mp3', 3980494, '2021-06-24 23:19:45', '2021-06-24 23:19:45', 244872);
INSERT INTO `songsource` VALUES ('1624549443094', '1624549442936', '光辉岁月 (粤语) - Beyond.mp3', 'audio/mpeg', './upload/song', '1624549442992.mp3', 12023944, '2021-06-24 23:44:03', '2021-06-24 23:44:03', 300042);
INSERT INTO `songsource` VALUES ('1624549526142', '1624549525985', '再见理想(1988年版) - Beyond.mp3', 'audio/mpeg', './upload/song', '1624549526042.mp3', 11867343, '2021-06-24 23:45:26', '2021-06-24 23:45:26', 296229);
INSERT INTO `songsource` VALUES ('1624549624933', '1624549624782', '不再犹豫 - 黄家驹.mp3', 'audio/mpeg', './upload/song', '1624549624840.mp3', 10162986, '2021-06-24 23:47:04', '2021-06-24 23:47:04', 253257);
INSERT INTO `songsource` VALUES ('1625056579714', '1625056579678', '2 Much - Justin Bieber.mp3', 'audio/mpeg', './upload/song', '1625056579705.mp3', 2488770, '2021-06-30 20:36:19', '2021-06-30 20:36:19', 152816);
INSERT INTO `songsource` VALUES ('1625056648896', '1625056648865', 'Deserve You - Justin Bieber.mp3', 'audio/mpeg', './upload/song', '1625056648885.mp3', 3040068, '2021-06-30 20:37:28', '2021-06-30 20:37:28', 187272);
INSERT INTO `songsource` VALUES ('1625056743608', '1625056743569', 'As I Am - Justin Bieber、Khalid.mp3', 'audio/mpeg', './upload/song', '1625056743595.mp3', 2834856, '2021-06-30 20:39:03', '2021-06-30 20:39:03', 174446);
INSERT INTO `songsource` VALUES ('1625056808622', '1625056808587', 'Die For You - Justin Bieber、Dominic Fike.mp3', 'audio/mpeg', './upload/song', '1625056808610.mp3', 3219398, '2021-06-30 20:40:08', '2021-06-30 20:40:08', 198478);
INSERT INTO `songsource` VALUES ('1625056892788', '1625056892758', 'Somebody - Justin Bieber.mp3', 'audio/mpeg', './upload/song', '1625056892777.mp3', 2915092, '2021-06-30 20:41:32', '2021-06-30 20:41:32', 179461);
INSERT INTO `songsource` VALUES ('1625056980131', '1625056980100', 'Hold On - Justin Bieber.mp3', 'audio/mpeg', './upload/song', '1625056980121.mp3', 2786227, '2021-06-30 20:43:00', '2021-06-30 20:43:00', 170841);
INSERT INTO `songsource` VALUES ('1625057125853', '1625057125791', 'Anyone - Justin Bieber.mp3', 'audio/mpeg', './upload/song', '1625057125829.mp3', 3096900, '2021-06-30 20:45:25', '2021-06-30 20:45:25', 190824);
INSERT INTO `songsource` VALUES ('1625405714765', '1625405714713', 'Don\'t fight the feeling - EXO.mp3', 'audio/mpeg', './upload/song', '1625405714742.mp3', 2883125, '2021-07-04 21:35:14', '2021-07-04 21:35:14', 176588);
INSERT INTO `songsource` VALUES ('1625408435117', '1625408435039', '爱情转移 - 陈奕迅.mp3', 'audio/mpeg', './upload/song', '1625408435072.mp3', 10426591, '2021-07-04 22:20:35', '2021-07-04 22:20:35', 260023);
INSERT INTO `songsource` VALUES ('1625408496108', '1625408496042', '烟味 - 陈奕迅.mp3', 'audio/mpeg', './upload/song', '1625408496070.mp3', 10561379, '2021-07-04 22:21:36', '2021-07-04 22:21:36', 263393);
INSERT INTO `songsource` VALUES ('1625408572629', '1625408572563', '好久不见 - 陈奕迅.mp3', 'audio/mpeg', './upload/song', '1625408572593.mp3', 10069923, '2021-07-04 22:22:52', '2021-07-04 22:22:52', 250540);
INSERT INTO `songsource` VALUES ('1626233266364', '1626233266278', '分飞 - 徐怀钰.mp3', 'audio/mpeg', './upload/song', '1626233266319.mp3', 9046423, '2021-07-14 11:27:46', '2021-07-14 11:27:46', 225176);
INSERT INTO `songsource` VALUES ('1626272735187', '1626272735139', 'How You Like That - BLACKPINK.mp3', 'audio/mpeg', './upload/song', '1626272735170.mp3', 2967090, '2021-07-14 22:25:35', '2021-07-14 22:25:35', 181290);
INSERT INTO `songsource` VALUES ('1626272793353', '1626272793322', 'Ice Cream (with Selena Gomez) - BLACKPINK、Selena Gomez.mp3', 'audio/mpeg', './upload/song', '1626272793342.mp3', 2837372, '2021-07-14 22:26:33', '2021-07-14 22:26:33', 175856);
INSERT INTO `songsource` VALUES ('1626272834812', '1626272834782', 'Pretty Savage - BLACKPINK.mp3', 'audio/mpeg', './upload/song', '1626272834800.mp3', 3210133, '2021-07-14 22:27:14', '2021-07-14 22:27:14', 199158);
INSERT INTO `songsource` VALUES ('1626272881593', '1626272881558', 'Lovesick Girls - BLACKPINK.mp3', 'audio/mpeg', './upload/song', '1626272881578.mp3', 3108571, '2021-07-14 22:28:01', '2021-07-14 22:28:01', 192810);
INSERT INTO `songsource` VALUES ('1626272930924', '1626272930895', 'Crazy Over You - BLACKPINK.mp3', 'audio/mpeg', './upload/song', '1626272930914.mp3', 2615379, '2021-07-14 22:28:50', '2021-07-14 22:28:50', 161985);
INSERT INTO `songsource` VALUES ('1626272964018', '1626272963986', 'Love To Hate Me - BLACKPINK.mp3', 'audio/mpeg', './upload/song', '1626272964006.mp3', 2741187, '2021-07-14 22:29:24', '2021-07-14 22:29:24', 169848);
INSERT INTO `songsource` VALUES ('1626273066328', '1626273066287', 'You Never Know - BLACKPINK.mp3', 'audio/mpeg', './upload/song', '1626273066312.mp3', 3691624, '2021-07-14 22:31:06', '2021-07-14 22:31:06', 229251);
INSERT INTO `songsource` VALUES ('1626274222552', '1626274222518', 'Permission to Dance - BTS.mp3', 'audio/mpeg', './upload/song', '1626274222541.mp3', 3042607, '2021-07-14 22:50:22', '2021-07-14 22:50:22', 187638);
INSERT INTO `songsource` VALUES ('1626360701683', '1626360701597', 'Rage Your Dream - m.o.v.e.mp3', 'audio/mpeg', './upload/song', '1626360701635.mp3', 10995688, '2021-07-15 22:51:41', '2021-07-15 22:51:41', 274181);
INSERT INTO `songsource` VALUES ('1633919156795', '1633919156741', '遇见 - 孙燕姿.mp3', 'audio/mpeg', './upload/song', '1633919156774.mp3', 3392685, '2021-10-11 10:25:56', '2021-10-11 10:25:56', 210625);
INSERT INTO `songsource` VALUES ('1633946260267', '1633946260220', '淋雨一直走 - 张韶涵.mp3', 'audio/mpeg', './upload/song', '1633946260250.mp3', 3330297, '2021-10-11 17:57:40', '2021-10-11 17:57:40', 204957);
INSERT INTO `songsource` VALUES ('1633946866830', '1633946866771', '千千阙歌 - 陈慧娴.mp3', 'audio/mpeg', './upload/song', '1633946866806.mp3', 4839207, '2021-10-11 18:07:46', '2021-10-11 18:07:46', 299154);
INSERT INTO `songsource` VALUES ('1634362102566', '1634362102513', '夜空中最亮的星 - 逃跑计划.mp3', 'audio/mpeg', './upload/song', '1634362102545.mp3', 4240982, '2021-10-16 13:28:22', '2021-10-16 13:28:22', 252264);
INSERT INTO `songsource` VALUES ('1634458012457', '1634458012381', 'again - YUI.mp3', 'audio/mpeg', './upload/song', '1634458012407.mp3', 10302788, '2021-10-17 16:06:52', '2021-10-17 16:06:52', 257541);
INSERT INTO `songsource` VALUES ('1634531821808', '1634531821765', '有何不可 - 许嵩.mp3', 'audio/mpeg', './upload/song', '1634531821790.mp3', 3896600, '2021-10-18 12:37:01', '2021-10-18 12:37:01', 241868);
INSERT INTO `songsource` VALUES ('1634541304267', '1634541304221', '纸短情长.mp3', 'audio/mpeg', './upload/song', '1634541304239.mp3', 2989654, '2021-10-18 15:15:04', '2021-10-18 15:15:04', 186749);
INSERT INTO `songsource` VALUES ('1635337922325', '1635337922244', '2382_3250_cc76_0a655958d453bdbced00d995150b318a.mp3', 'audio/mpeg', './upload/song', '1635337922273.mp3', 11162757, '2021-10-27 20:32:02', '2021-10-27 20:32:02', 279040);
INSERT INTO `songsource` VALUES ('1635340172700', '1635340172627', '40_d9d0a49289c9717f19b4ede7de15f7ed.mp3', 'audio/mpeg', './upload/song', '1635340172648.mp3', 9755211, '2021-10-27 21:09:32', '2021-10-27 21:09:32', 243853);
INSERT INTO `songsource` VALUES ('1635340334983', '1635340334894', 'obj_wo3DlMOGwrbDjj7DisKw_5537388017_6a83_4509_e15a_3a500790636c16b546d25a5171d94cfe.mp3', 'audio/mpeg', './upload/song', '1635340334917.mp3', 11558705, '2021-10-27 21:12:14', '2021-10-27 21:12:14', 288940);
INSERT INTO `songsource` VALUES ('1635340469833', '1635340469770', '春雷.mp3', 'audio/mpeg', './upload/song', '1635340469786.mp3', 10377970, '2021-10-27 21:14:29', '2021-10-27 21:14:29', 259422);
INSERT INTO `songsource` VALUES ('1635429386461', '1635429386379', 'Time after time ～花舞う街で～ (Time after time～在落花纷飞的街道上～) - 仓木麻衣.mp3', 'audio/mpeg', './upload/song', '1635429386423.mp3', 9862516, '2021-10-28 21:56:26', '2021-10-28 21:56:26', 244637);
INSERT INTO `songsource` VALUES ('1635429830312', '1635429830242', '星辰大海 - 黄霄雲.mp3', 'audio/mpeg', './upload/song', '1635429830272.mp3', 8359434, '2021-10-28 22:03:50', '2021-10-28 22:03:50', 207909);
INSERT INTO `songsource` VALUES ('1635503448442', '1635503448330', '起风了 - 买辣椒也用券.mp3', 'audio/mpeg', './upload/song', '1635503448387.mp3', 12387575, '2021-10-29 18:30:48', '2021-10-29 18:30:48', 325904);
INSERT INTO `songsource` VALUES ('1635506366488', '1635506366426', 'obj_w5zDlMODwrDDiGjCn8Ky_2803436043_05b3_caae_2261_d0a14fe01f4328351ec289e5907ea72e.mp3', 'audio/mpeg', './upload/song', '1635506366444.mp3', 9878509, '2021-10-29 19:19:26', '2021-10-29 19:19:26', 246936);
INSERT INTO `songsource` VALUES ('1635506793295', '1635506793225', 'obj_w5zDlMODwrDDiGjCn8Ky_1714505220_6b9b_cf53_3d4d_dae6d11d4f74372a7b6a4775a4499b5b.mp3', 'audio/mpeg', './upload/song', '1635506793241.mp3', 10841905, '2021-10-29 19:26:33', '2021-10-29 19:26:33', 271020);
INSERT INTO `songsource` VALUES ('1635507475006', '1635507474940', '稻香 - 周杰伦.mp3', 'audio/mpeg', './upload/song', '1635507474971.mp3', 9025225, '2021-10-29 19:37:55', '2021-10-29 19:37:55', 223504);
INSERT INTO `songsource` VALUES ('1635507507368', '1635507507293', '给我一首歌的时间 - 周杰伦.mp3', 'audio/mpeg', './upload/song', '1635507507325.mp3', 10229140, '2021-10-29 19:38:27', '2021-10-29 19:38:27', 253597);
INSERT INTO `songsource` VALUES ('1635507712030', '1635507711961', '兰亭序 - 周杰伦.mp3', 'audio/mpeg', './upload/song', '1635507711988.mp3', 10244953, '2021-10-29 19:41:52', '2021-10-29 19:41:52', 253989);
INSERT INTO `songsource` VALUES ('1635508957294', '1635508957215', 'obj_wo3DlMOG中岛美嘉.mp3', 'audio/mpeg', './upload/song', '1635508957235.mp3', 15223162, '2021-10-29 20:02:37', '2021-10-29 20:02:37', 380552);
INSERT INTO `songsource` VALUES ('1635680515728', '1635680515627', 'See You Again (feat. Charlie Puth) - Wiz Khalifa、Charlie Puth.mp3', 'audio/mpeg', './upload/song', '1635680515681.mp3', 9231250, '2021-10-31 19:41:55', '2021-10-31 19:41:55', 229564);
INSERT INTO `songsource` VALUES ('1635680608379', '1635680608268', 'We Don\'t Talk Anymore - Charlie Puth、Selena Gomez.mp3', 'audio/mpeg', './upload/song', '1635680608309.mp3', 8736009, '2021-10-31 19:43:28', '2021-10-31 19:43:28', 217757);
INSERT INTO `songsource` VALUES ('1635681782934', '1635681782848', '起风了 - 吴青峰.mp3', 'audio/mpeg', './upload/song', '1635681782886.mp3', 12647225, '2021-10-31 20:03:02', '2021-10-31 20:03:02', 313600);
INSERT INTO `songsource` VALUES ('1643436188179', '1643436188086', '一个像夏天一个像秋天 - 范玮琪.mp3', 'audio/mpeg', './upload/song', '1643436188136.mp3', 4066381, '2022-01-29 14:03:08', '2022-01-29 14:03:08', 251063);
INSERT INTO `songsource` VALUES ('1643454106777', '1643454106693', '山楂树の恋 - 程佳佳.mp3', 'audio/mpeg', './upload/song', '1643454106748.mp3', 3187098, '2022-01-29 19:01:46', '2022-01-29 19:01:46', 197851);
INSERT INTO `songsource` VALUES ('1643454792148', '1643454792066', 'CALL ME BABY - EXO.mp3', 'audio/mpeg', './upload/song', '1643454792120.mp3', 3395821, '2022-01-29 19:13:12', '2022-01-29 19:13:12', 211043);
INSERT INTO `songsource` VALUES ('1643519328419', '1643519328369', '人生何处不相逢 - 陈慧娴.mp3', 'audio/mpeg', './upload/song', '1643519328401.mp3', 3815406, '2022-01-30 13:08:48', '2022-01-30 13:08:48', 237061);
INSERT INTO `songsource` VALUES ('1643519796072', '1643519796010', '漂洋过海来看你 - 娃娃.mp3', 'audio/mpeg', './upload/song', '1643519796037.mp3', 5504334, '2022-01-30 13:16:36', '2022-01-30 13:16:36', 342178);
INSERT INTO `songsource` VALUES ('1643520258434', '1643520258396', 'ブルーバード - いきものがかり.mp3', 'audio/mpeg', './upload/song', '1643520258418.mp3', 3507861, '2022-01-30 13:24:18', '2022-01-30 13:24:18', 217678);
INSERT INTO `songsource` VALUES ('1643520839621', '1643520839579', 'Counting Stars - OneRepublic.mp3', 'audio/mpeg', './upload/song', '1643520839602.mp3', 4157733, '2022-01-30 13:33:59', '2022-01-30 13:33:59', 257306);
INSERT INTO `songsource` VALUES ('1643880439369', '1643880439323', '小星星 - 汪苏泷.mp3', 'audio/mpeg', './upload/song', '1643880439355.mp3', 3209282, '2022-02-03 17:27:19', '2022-02-03 17:27:19', 196937);
INSERT INTO `songsource` VALUES ('1643880469047', '1643880469014', '放不下 - 汪苏泷.mp3', 'audio/mpeg', './upload/song', '1643880469035.mp3', 3170412, '2022-02-03 17:27:49', '2022-02-03 17:27:49', 194508);
INSERT INTO `songsource` VALUES ('1643880487935', '1643880487897', '他的爱 - 汪苏泷.mp3', 'audio/mpeg', './upload/song', '1643880487918.mp3', 4223669, '2022-02-03 17:28:07', '2022-02-03 17:28:07', 260336);
INSERT INTO `songsource` VALUES ('1643880533115', '1643880533074', '专属味道 - 汪苏泷、林希儿.mp3', 'audio/mpeg', './upload/song', '1643880533099.mp3', 3322977, '2022-02-03 17:28:53', '2022-02-03 17:28:53', 204042);
INSERT INTO `songsource` VALUES ('1643880947566', '1643880947532', 'Blueming - IU.mp3', 'audio/mpeg', './upload/song', '1643880947553.mp3', 3511908, '2022-02-03 17:35:47', '2022-02-03 17:35:47', 217104);
INSERT INTO `songsource` VALUES ('1643881216375', '1643881216324', '他不懂 - 张杰.mp3', 'audio/mpeg', './upload/song', '1643881216360.mp3', 3734990, '2022-02-03 17:40:16', '2022-02-03 17:40:16', 231915);
INSERT INTO `songsource` VALUES ('1643938595246', '1643938595197', '一路生花 - 温奕心.mp3', 'audio/mpeg', './upload/song', '1643938595227.mp3', 4138268, '2022-02-04 09:36:35', '2022-02-04 09:36:35', 256287);
INSERT INTO `songsource` VALUES ('1644374062957', '1644374062902', '雪龙吟 - 张杰.mp3', 'audio/mpeg', './upload/song', '1644374062935.mp3', 3354591, '2022-02-09 10:34:22', '2022-02-09 10:34:22', 207673);
INSERT INTO `songsource` VALUES ('1644374176162', '1644374176123', '你头顶的风 - 王小帅.mp3', 'audio/mpeg', './upload/song', '1644374176145.mp3', 3701865, '2022-02-09 10:36:16', '2022-02-09 10:36:16', 227709);
INSERT INTO `songsource` VALUES ('1644374326625', '1644374326583', '最美的太阳 - 张杰.mp3', 'audio/mpeg', './upload/song', '1644374326605.mp3', 4137907, '2022-02-09 10:38:46', '2022-02-09 10:38:46', 257097);
INSERT INTO `songsource` VALUES ('1644375432225', '1644375432188', 'Monsters - Katie Sky.mp3', 'audio/mpeg', './upload/song', '1644375432211.mp3', 3528916, '2022-02-09 10:57:12', '2022-02-09 10:57:12', 217887);
INSERT INTO `songsource` VALUES ('1645600255204', '1645600255159', '无名的人 - 毛不易.mp3', 'audio/mpeg', './upload/song', '1645600255183.mp3', 4543064, '2022-02-23 15:10:55', '2022-02-23 15:10:55', 282227);
INSERT INTO `songsource` VALUES ('1647143678868', '1647143678810', '和光同尘  - 周深.mp3', 'audio/mpeg', './upload/song', '1647143678841.mp3', 4024916, '2022-03-13 11:54:38', '2022-03-13 11:54:38', 248633);
INSERT INTO `songsource` VALUES ('1647144314416', '1647144314377', '拥抱你离去 - 张北北.mp3', 'audio/mpeg', './upload/song', '1647144314403.mp3', 3900664, '2022-03-13 12:05:14', '2022-03-13 12:05:14', 242599);
INSERT INTO `songsource` VALUES ('1647144678323', '1647144678278', '都是你的错 - 陈慧琳、郑中基.mp3', 'audio/mpeg', './upload/song', '1647144678305.mp3', 4019805, '2022-03-13 12:11:18', '2022-03-13 12:11:18', 249234);
INSERT INTO `songsource` VALUES ('1647145343911', '1647145343871', '吻别 - 张学友.mp3', 'audio/mpeg', './upload/song', '1647145343892.mp3', 4947869, '2022-03-13 12:22:23', '2022-03-13 12:22:23', 306207);
INSERT INTO `songsource` VALUES ('1648208054481', '1648208054434', '麻雀 - 李荣浩.mp3', 'audio/mpeg', './upload/song', '1648208054462.mp3', 4110942, '2022-03-25 19:34:14', '2022-03-25 19:34:14', 252787);
INSERT INTO `songsource` VALUES ('1648208736540', '1648208736500', '窗外 - 李琛.mp3', 'audio/mpeg', './upload/song', '1648208736523.mp3', 4103884, '2022-03-25 19:45:36', '2022-03-25 19:45:36', 254955);
INSERT INTO `songsource` VALUES ('1648269910405', '1648269910363', '라일락 - IU.mp3', 'audio/mpeg', './upload/song', '1648269910390.mp3', 3468662, '2022-03-26 12:45:10', '2022-03-26 12:45:10', 214282);
INSERT INTO `songsource` VALUES ('1648270034362', '1648270034330', 'Flu - IU.mp3', 'audio/mpeg', './upload/song', '1648270034351.mp3', 3053628, '2022-03-26 12:47:14', '2022-03-26 12:47:14', 188343);
INSERT INTO `songsource` VALUES ('1648270087836', '1648270087790', 'Coin - IU.mp3', 'audio/mpeg', './upload/song', '1648270087823.mp3', 3130117, '2022-03-26 12:48:07', '2022-03-26 12:48:07', 193123);
INSERT INTO `songsource` VALUES ('1648270454612', '1648270454571', 'Butter-Fly - 和田光司.mp3', 'audio/mpeg', './upload/song', '1648270454596.mp3', 4189757, '2022-03-26 12:54:14', '2022-03-26 12:54:14', 258038);
INSERT INTO `songsource` VALUES ('1648271712511', '1648271712472', '爱的就是你 - 王力宏.mp3', 'audio/mpeg', './upload/song', '1648271712493.mp3', 4669662, '2022-03-26 13:15:12', '2022-03-26 13:15:12', 289437);
INSERT INTO `songsource` VALUES ('1648273167143', '1648273167106', 'Cruel Summer - Taylor Swift.mp3', 'audio/mpeg', './upload/song', '1648273167132.mp3', 2877066, '2022-03-26 13:39:27', '2022-03-26 13:39:27', 178469);
INSERT INTO `songsource` VALUES ('1648273221058', '1648273221025', 'The Man - Taylor Swift.mp3', 'audio/mpeg', './upload/song', '1648273221046.mp3', 3068063, '2022-03-26 13:40:21', '2022-03-26 13:40:21', 190407);
INSERT INTO `songsource` VALUES ('1648273273353', '1648273273312', 'Cornelia Street - Taylor Swift.mp3', 'audio/mpeg', './upload/song', '1648273273334.mp3', 4618290, '2022-03-26 13:41:13', '2022-03-26 13:41:13', 287295);
INSERT INTO `songsource` VALUES ('1648273334277', '1648273334240', 'Death By A Thousand Cuts - Taylor Swift.mp3', 'audio/mpeg', './upload/song', '1648273334265.mp3', 3198918, '2022-03-26 13:42:14', '2022-03-26 13:42:14', 198583);
INSERT INTO `songsource` VALUES ('1648273390488', '1648273390456', 'You Need To Calm Down - Taylor Swift.mp3', 'audio/mpeg', './upload/song', '1648273390477.mp3', 2763817, '2022-03-26 13:43:10', '2022-03-26 13:43:10', 171389);
INSERT INTO `songsource` VALUES ('1648273424506', '1648273424472', 'Afterglow - Taylor Swift.mp3', 'audio/mpeg', './upload/song', '1648273424492.mp3', 3594696, '2022-03-26 13:43:44', '2022-03-26 13:43:44', 223321);
INSERT INTO `songsource` VALUES ('1649334883569', '1649334883510', 'I Really Like You(Liam Keegan Remix Radio EditJapan Bonus Track) - Carly Rae Jepsen.mp3', 'audio/mpeg', './upload/song', '1649334883548.mp3', 3321467, '2022-04-07 20:34:43', '2022-04-07 20:34:43', 206080);
INSERT INTO `songsource` VALUES ('1649335080487', '1649335080451', 'Good Time - Carly Rae Jepsen.mp3', 'audio/mpeg', './upload/song', '1649335080475.mp3', 3302597, '2022-04-07 20:38:00', '2022-04-07 20:38:00', 205166);
INSERT INTO `songsource` VALUES ('1649335244864', '1649335244826', 'Call Me Maybe - Carly Rae Jepsen.mp3', 'audio/mpeg', './upload/song', '1649335244847.mp3', 3121047, '2022-04-07 20:40:44', '2022-04-07 20:40:44', 193907);
INSERT INTO `songsource` VALUES ('1649335319695', '1649335319660', 'Curiosity - Carly Rae Jepsen.mp3', 'audio/mpeg', './upload/song', '1649335319683.mp3', 3326977, '2022-04-07 20:41:59', '2022-04-07 20:41:59', 206498);
INSERT INTO `songsource` VALUES ('1649336428639', '1649336428604', 'Five Hundred Miles - Justin Timberlake、Carey Mulligan、Stark Sands.mp3', 'audio/mpeg', './upload/song', '1649336428627.mp3', 3320506, '2022-04-07 21:00:28', '2022-04-07 21:00:28', 205270);
INSERT INTO `songsource` VALUES ('1649336837187', '1649336837075', 'The_Way_I_Still_Love_You-Reynard_Silva-4126604.mp3', 'audio/mpeg', './upload/song', '1649336837099.mp3', 9078272, '2022-04-07 21:07:17', '2022-04-07 21:07:17', 226900);
INSERT INTO `songsource` VALUES ('1649337041005', '1649337040969', 'For him. - Troye Sivan、Allday.mp3', 'audio/mpeg', './upload/song', '1649337040991.mp3', 3364843, '2022-04-07 21:10:41', '2022-04-07 21:10:41', 208744);
INSERT INTO `songsource` VALUES ('1649575133944', '1649575133886', 'End Game - Taylor Swift、Ed Sheeran、Future.mp3', 'audio/mpeg', './upload/song', '1649575133918.mp3', 3971138, '2022-04-10 15:18:53', '2022-04-10 15:18:53', 244872);
INSERT INTO `songsource` VALUES ('1649575232420', '1649575232381', 'Look What You Made Me Do - Taylor Swift.mp3', 'audio/mpeg', './upload/song', '1649575232407.mp3', 3443669, '2022-04-10 15:20:32', '2022-04-10 15:20:32', 211905);
INSERT INTO `songsource` VALUES ('1649982278462', '1649982278381', '水中花(Live) - 郁可唯.mp3', 'audio/mpeg', './upload/song', '1649982278431.mp3', 3380034, '2022-04-15 08:24:38', '2022-04-15 08:24:38', 210051);
INSERT INTO `songsource` VALUES ('1650008526700', '1650008526637', 'パプリカ (红辣椒) - 米津玄师.mp3', 'audio/mpeg', './upload/song', '1650008526673.mp3', 3306445, '2022-04-15 15:42:06', '2022-04-15 15:42:06', 203076);
INSERT INTO `songsource` VALUES ('1650008618894', '1650008618850', '海の幽霊 - 米津玄师.mp3', 'audio/mpeg', './upload/song', '1650008618875.mp3', 3809238, '2022-04-15 15:43:38', '2022-04-15 15:43:38', 234501);
INSERT INTO `songsource` VALUES ('1650008684138', '1650008684093', 'Flamingo - 米津玄师.mp3', 'audio/mpeg', './upload/song', '1650008684121.mp3', 3199862, '2022-04-15 15:44:44', '2022-04-15 15:44:44', 196415);
INSERT INTO `songsource` VALUES ('1650008827837', '1650008827783', '世界上不存在的歌(2020 重唱版) - 陈奕迅.mp3', 'audio/mpeg', './upload/song', '1650008827819.mp3', 3776826, '2022-04-15 15:47:07', '2022-04-15 15:47:07', 233038);
INSERT INTO `songsource` VALUES ('1650008891737', '1650008891685', 'Shall We Talk(Tre Lune MMXIX) - 陈奕迅.mp3', 'audio/mpeg', './upload/song', '1650008891716.mp3', 4211389, '2022-04-15 15:48:11', '2022-04-15 15:48:11', 261851);
INSERT INTO `songsource` VALUES ('1650008950284', '1650008950243', 'Fight as ONE - 陈奕迅、蔡依林.mp3', 'audio/mpeg', './upload/song', '1650008950268.mp3', 3605964, '2022-04-15 15:49:10', '2022-04-15 15:49:10', 222198);
INSERT INTO `songsource` VALUES ('1650009022941', '1650009022897', '相信你的人 - 陈奕迅.mp3', 'audio/mpeg', './upload/song', '1650009022924.mp3', 4414576, '2022-04-15 15:50:22', '2022-04-15 15:50:22', 274260);
INSERT INTO `songsource` VALUES ('1650524182880', '1650524182823', 'Just Dance - Lady Gaga.mp3', 'audio/mpeg', './upload/song', '1650524182855.mp3', 3914066, '2022-04-21 14:56:22', '2022-04-21 14:56:22', 242051);
INSERT INTO `songsource` VALUES ('1650524279069', '1650524279021', 'Poker Face - Lady Gaga.mp3', 'audio/mpeg', './upload/song', '1650524279044.mp3', 3837162, '2022-04-21 14:57:59', '2022-04-21 14:57:59', 237244);
INSERT INTO `songsource` VALUES ('1650524544211', '1650524544165', 'MY ALL - 浜崎あゆみ.mp3', 'audio/mpeg', './upload/song', '1650524544190.mp3', 5222348, '2022-04-21 15:02:24', '2022-04-21 15:02:24', 322586);
INSERT INTO `songsource` VALUES ('1650524822827', '1650524822781', 'Trouble Maker - 张贤胜、泫雅.mp3', 'audio/mpeg', './upload/song', '1650524822809.mp3', 3519683, '2022-04-21 15:07:02', '2022-04-21 15:07:02', 219611);
INSERT INTO `songsource` VALUES ('1650525007659', '1650525007607', '出山 - 花粥、王胜娚.mp3', 'audio/mpeg', './upload/song', '1650525007639.mp3', 3219755, '2022-04-21 15:10:07', '2022-04-21 15:10:07', 200438);
INSERT INTO `songsource` VALUES ('1650533635902', '1650533635844', '情非得已 - 庾澄庆.mp3', 'audio/mpeg', './upload/song', '1650533635872.mp3', 4427325, '2022-04-21 17:33:55', '2022-04-21 17:33:55', 273998);
INSERT INTO `songsource` VALUES ('1650533715514', '1650533715475', '春泥 - 庾澄庆.mp3', 'audio/mpeg', './upload/song', '1650533715497.mp3', 4130762, '2022-04-21 17:35:15', '2022-04-21 17:35:15', 256026);
INSERT INTO `songsource` VALUES ('1650786496239', '1650786496187', 'Love Me Like You Do - Ellie Goulding.mp3', 'audio/mpeg', './upload/song', '1650786496217.mp3', 4044375, '2022-04-24 15:48:16', '2022-04-24 15:48:16', 250305);
INSERT INTO `songsource` VALUES ('1650786700419', '1650786700381', 'Outside - Calvin Harris、Ellie Goulding.mp3', 'audio/mpeg', './upload/song', '1650786700405.mp3', 3678028, '2022-04-24 15:51:40', '2022-04-24 15:51:40', 226482);

-- ----------------------------
-- Table structure for subscriber
-- ----------------------------
DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber`  (
  `alId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `arId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `alId`(`alId`) USING BTREE,
  INDEX `arId`(`arId`) USING BTREE,
  INDEX `vId`(`vId`) USING BTREE,
  INDEX `pId`(`pId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `subscriber_ibfk_6`(`cId`) USING BTREE,
  CONSTRAINT `subscriber_ibfk_1` FOREIGN KEY (`alId`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_2` FOREIGN KEY (`arId`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_3` FOREIGN KEY (`vId`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_4` FOREIGN KEY (`pId`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_ibfk_6` FOREIGN KEY (`cId`) REFERENCES `channel_content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscriber
-- ----------------------------
INSERT INTO `subscriber` VALUES ('1621948204281', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602559815', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602849693', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621603519600', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1622073673540', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1622074187201', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424503525', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424402288', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425577321', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES ('1622073564263', NULL, NULL, NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES ('1624546413717', NULL, NULL, NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602754351', NULL, NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072451745', NULL, NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424503525', '1625404058174', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425528589', '1625404058174', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623426341733', '1625404058174', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623426423882', '1625404058174', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425883687', '1625404058174', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424402288', '1625404058174', NULL);
INSERT INTO `subscriber` VALUES ('1621948204281', NULL, NULL, NULL, '1625404058174', NULL);
INSERT INTO `subscriber` VALUES ('1622074187201', NULL, NULL, NULL, '1625404058174', NULL);
INSERT INTO `subscriber` VALUES ('1622073564263', NULL, NULL, NULL, '1625404058174', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625405772980', NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625054670111', NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625054331380', NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625054974084', NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES ('1625408324076', NULL, NULL, NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072451745', NULL, NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1624549103554', NULL, NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625051913014', NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625055245420', NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602754351', NULL, NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES ('1626233207593', NULL, NULL, NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1626234023583', NULL, NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623426423882', '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424503525', '1626267479156', NULL);
INSERT INTO `subscriber` VALUES ('1622074187201', NULL, NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424503525', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425528589', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424402288', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623426209601', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623426299066', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425577321', '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425528589', '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1626234023583', NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425979492', '1626267479156', NULL);
INSERT INTO `subscriber` VALUES ('1621948204281', NULL, NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES ('1622073673540', NULL, NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES ('1626233207593', NULL, NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1626273942317', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625051433306', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625051913014', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625054974084', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625053198223', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625051160903', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625051012153', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625053676298', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425577321', '1626253954965', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1626360481630', NULL, NULL, '1626253954965', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425577321', '1626352819737', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1626269334408', '1626352819737', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425528589', '1626352819737', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425805027', '1626352819737', NULL);
INSERT INTO `subscriber` VALUES ('1624546413717', NULL, NULL, NULL, '1626352819737', NULL);
INSERT INTO `subscriber` VALUES ('1623419176842', NULL, NULL, NULL, '1626352819737', NULL);
INSERT INTO `subscriber` VALUES ('1622074447978', NULL, NULL, NULL, '1626352819737', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602849693', NULL, NULL, '1626352819737', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625053198223', NULL, '1626352819737', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625054670111', NULL, '1626352819737', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625054331380', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1626233168015', NULL, NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625054670111', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625055245420', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1626231160557', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623426048988', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1626233530174', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1635337496777', NULL, NULL, NULL, '1625404058174', NULL);
INSERT INTO `subscriber` VALUES ('1624375276272', NULL, NULL, NULL, '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424503525', '1621554155356', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635508469891', NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635862232233', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1635679540043', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES ('1624549188385', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1635337496777', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1640504921941', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1640503937398', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1636034772080', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1626269334408', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602441778', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1636028601995', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1636028601995', NULL, '1640498317915', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1635575832956');
INSERT INTO `subscriber` VALUES ('1633946790475', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1626233168015', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1634541272001', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1635506130337', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1626233207593', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1640503937398', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1621586602550', '1634034840512');
INSERT INTO `subscriber` VALUES (NULL, '1624545638880', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425577321', '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1635429991884', '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424503525', '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072084825', NULL, NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES ('1624547874208', NULL, NULL, NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635686390194', NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425528589', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1634034840512');
INSERT INTO `subscriber` VALUES ('1643435539795', NULL, NULL, NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1625405303096', NULL, NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES ('1643435539795', NULL, NULL, NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1636030025087', NULL, '1640498317915', NULL);
INSERT INTO `subscriber` VALUES ('1643435539795', NULL, NULL, NULL, '1640498470004', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1643435446634', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1643880233413', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1643435539795', NULL, NULL, NULL, '1640497617203', NULL);
INSERT INTO `subscriber` VALUES ('1633919083723', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1635679207853', '1635575832956');
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635686390194', NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635862727342', NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES ('1624549188385', NULL, NULL, NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES ('1643453975767', NULL, NULL, NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES ('1635506697059', NULL, NULL, NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643939055617', '1635679207853', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1635679507213', '1635679207853', NULL);
INSERT INTO `subscriber` VALUES ('1623419176842', NULL, NULL, NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602754351', NULL, NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1643435446634', NULL, NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1635679207853', '1634035333656');
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625053880065', NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072084825', NULL, NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072019119', NULL, NULL, '1635679207853', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424402288', '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643517085989', '1644202264813', NULL);
INSERT INTO `subscriber` VALUES ('1635337496777', NULL, NULL, NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1635341469729', NULL, NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072970585', NULL, NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES ('1644298645535', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1643435539795', NULL, NULL, NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602754351', NULL, NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1636028601995', NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1636352900663', NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635687185570', NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1644286690856', NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1640503572319', NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635339720965', NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602849693', NULL, NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1626234023583', NULL, NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643938110834', '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1643938461386', NULL, NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1640497948238', '1634035103223');
INSERT INTO `subscriber` VALUES (NULL, NULL, '1644286690856', NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643522225014', '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1643939608960', NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES ('1635506697059', NULL, NULL, NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625405772980', NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635429046087', NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES ('1624546413717', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1644286690856', NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1633946433290', NULL, NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643938110834', '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643517085989', '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424402288', '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1633919475129', NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1643939608960', NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635686390194', NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1635506130337', NULL, NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635862727342', NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1624545638880', NULL, NULL, '1635685284424', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1644286690856', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1643939608960', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1626360804975', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1626267479156', '1634034840512');
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1626267479156', '1634036792314');
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623424402288', '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1624545638880', NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1643939608960', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625053488369', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1635341560361', NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072019119', NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072970585', NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1624549103554', NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072906015', NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1633946433290', NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1634532125851', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625055161411', NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623426299066', '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072019119', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1644202533965', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1634035103223');
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1634035333656');
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1634035609469');
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1644202716412', '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425577321', '1621586669402', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643522638202', '1621586669402', NULL);
INSERT INTO `subscriber` VALUES ('1635506697059', NULL, NULL, NULL, '1621586669402', NULL);
INSERT INTO `subscriber` VALUES ('1635506247250', NULL, NULL, NULL, '1621586669402', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1640498622256', '1635575832956');
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1621586669402', '1635575832956');
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643517085989', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1643453833297', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643517085989', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643938110834', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1644202895296', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643522294080', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623426341733', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643937966776', '1621586602550', NULL);
INSERT INTO `subscriber` VALUES ('1644287493057', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1644298968982', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1635506697059', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1635506247250', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1623419176842', NULL, NULL, NULL, '1640497296254', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643517085989', '1640497296254', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1643455054797', NULL, '1640497617203', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1647144476077', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1648273110035', NULL, NULL, NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1625054670111', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1643522638202', '1640498317915', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1626267479156', '1635575832956');
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635686390194', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635862727342', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635505388432', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635505388432', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1634533890069', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1634533182631', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1640503572319', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602754351', NULL, NULL, '1640497296254', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602969680', NULL, NULL, '1640497296254', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072019119', NULL, NULL, '1640497296254', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072451745', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1649666716862', '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072451745', NULL, NULL, '1626267479156', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1644586646938', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1644286962553', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635505388432', NULL, '1622166913290', NULL);
INSERT INTO `subscriber` VALUES ('1622073564263', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425577321', '1640498317915', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425577321', '1635679207853', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623425577321', '1640497296254', NULL);
INSERT INTO `subscriber` VALUES ('1622073564263', NULL, NULL, NULL, '1640498317915', NULL);
INSERT INTO `subscriber` VALUES ('1622073564263', NULL, NULL, NULL, '1621586669402', NULL);
INSERT INTO `subscriber` VALUES ('1622073564263', NULL, NULL, NULL, '1622166913290', NULL);
INSERT INTO `subscriber` VALUES ('1622073564263', NULL, NULL, NULL, '1622167044223', NULL);
INSERT INTO `subscriber` VALUES ('1622073564263', NULL, NULL, NULL, '1640497617203', NULL);
INSERT INTO `subscriber` VALUES ('1622073564263', NULL, NULL, NULL, '1640497948238', NULL);
INSERT INTO `subscriber` VALUES ('1622073564263', NULL, NULL, NULL, '1640498622256', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1635338688119', '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1640504921941', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1649333771120', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1623328403156', NULL, NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1635341685282', NULL, NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1621586602550', '1637996874647');
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1621586602550', '1650010726370');
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635339720965', NULL, '1621586602550', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635686660644', NULL, '1621586669402', NULL);
INSERT INTO `subscriber` VALUES ('1634531460174', NULL, NULL, NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1621602754351', NULL, NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1622072451745', NULL, NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1626248858763', '1650614109749');
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1626358128252', '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1623426299066', '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635686660644', NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1636352900663', NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1643433735031', NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1626248858763', '1634034964713');
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, '1635429991884', '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635302223635', NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1650009471674', NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES ('1624549188385', NULL, NULL, NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1626233743392', NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1644586646938', NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1625405303096', NULL, NULL, '1626248858763', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635686390194', NULL, '1644202264813', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1636272273336', NULL, '1621586669402', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1636352900663', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES ('1635503394595', NULL, NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635687185570', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1651582837583', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, NULL, NULL, '1621553753077', '1634035701805');
INSERT INTO `subscriber` VALUES (NULL, NULL, '1634532125851', NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, '1624547670156', NULL, NULL, '1621553753077', NULL);
INSERT INTO `subscriber` VALUES (NULL, NULL, '1635862364296', NULL, '1644202264813', NULL);

-- ----------------------------
-- Table structure for thumb
-- ----------------------------
DROP TABLE IF EXISTS `thumb`;
CREATE TABLE `thumb`  (
  `vId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `commentId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `momentId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `vId`(`vId`) USING BTREE,
  INDEX `commentId`(`commentId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `thumb_ibfk_4`(`momentId`) USING BTREE,
  CONSTRAINT `thumb_ibfk_1` FOREIGN KEY (`vId`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thumb_ibfk_2` FOREIGN KEY (`commentId`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thumb_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thumb_ibfk_4` FOREIGN KEY (`momentId`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thumb
-- ----------------------------
INSERT INTO `thumb` VALUES (NULL, '1623674936959', '1621586602550', '2021-06-25 20:55:01', '2021-06-25 20:55:01', NULL);
INSERT INTO `thumb` VALUES (NULL, '1624369881765', '1621586602550', '2021-06-25 20:55:39', '2021-06-25 20:55:39', NULL);
INSERT INTO `thumb` VALUES (NULL, NULL, '1621553753077', '2021-07-12 17:09:09', '2021-07-12 17:09:09', '1626076253042');
INSERT INTO `thumb` VALUES ('1625051433306', NULL, '1621553753077', '2021-07-12 17:12:54', '2021-07-12 17:12:54', NULL);
INSERT INTO `thumb` VALUES (NULL, '1623681413959', '1621553753077', '2021-07-12 17:16:19', '2021-07-12 17:16:19', NULL);
INSERT INTO `thumb` VALUES ('1625051433306', NULL, '1621554155356', '2021-07-12 17:29:38', '2021-07-12 17:29:38', NULL);
INSERT INTO `thumb` VALUES ('1625053198223', NULL, '1621554155356', '2021-07-12 17:30:38', '2021-07-12 17:30:38', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626082426123', '1621554155356', '2021-07-12 17:33:48', '2021-07-12 17:33:48', NULL);
INSERT INTO `thumb` VALUES (NULL, NULL, '1621554155356', '2021-07-12 17:34:20', '2021-07-12 17:34:20', '1626076253042');
INSERT INTO `thumb` VALUES (NULL, '1625057356308', '1621554155356', '2021-07-12 17:37:31', '2021-07-12 17:37:31', NULL);
INSERT INTO `thumb` VALUES ('1625055245420', NULL, '1621554155356', '2021-07-12 17:37:55', '2021-07-12 17:37:55', NULL);
INSERT INTO `thumb` VALUES (NULL, '1625055305257', '1621554155356', '2021-07-12 17:38:06', '2021-07-12 17:38:06', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626082950486', '1621554155356', '2021-07-12 17:42:34', '2021-07-12 17:42:34', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626093916518', '1621554155356', '2021-07-12 21:35:01', '2021-07-12 21:35:01', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626080150394', '1621554155356', '2021-07-12 21:37:28', '2021-07-12 21:37:28', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626098318623', '1621554155356', '2021-07-12 21:58:41', '2021-07-12 21:58:41', NULL);
INSERT INTO `thumb` VALUES ('1625054331380', NULL, '1621554155356', '2021-07-12 22:00:16', '2021-07-12 22:00:16', NULL);
INSERT INTO `thumb` VALUES ('1625054974084', NULL, '1621554155356', '2021-07-12 22:08:08', '2021-07-12 22:08:08', NULL);
INSERT INTO `thumb` VALUES ('1625051913014', NULL, '1621554155356', '2021-07-14 08:32:58', '2021-07-14 08:32:58', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626222826314', '1621554155356', '2021-07-14 08:33:50', '2021-07-14 08:33:50', NULL);
INSERT INTO `thumb` VALUES ('1625054670111', NULL, '1621554155356', '2021-07-14 09:03:55', '2021-07-14 09:03:55', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626230546477', '1621554155356', '2021-07-14 10:42:29', '2021-07-14 10:42:29', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626098479270', '1621554155356', '2021-07-14 10:45:46', '2021-07-14 10:45:46', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626245002510', '1625404058174', '2021-07-14 14:43:24', '2021-07-14 14:43:24', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626274500101', '1626267479156', '2021-07-14 22:55:03', '2021-07-14 22:55:03', NULL);
INSERT INTO `thumb` VALUES ('1625053676298', NULL, '1626267479156', '2021-07-14 23:09:07', '2021-07-14 23:09:07', NULL);
INSERT INTO `thumb` VALUES (NULL, '1625057356308', '1626267479156', '2021-07-14 23:09:09', '2021-07-14 23:09:09', NULL);
INSERT INTO `thumb` VALUES (NULL, NULL, '1626253954965', '2021-07-15 08:06:52', '2021-07-15 08:06:52', '1626076253042');
INSERT INTO `thumb` VALUES (NULL, NULL, '1621553753077', '2021-07-15 16:09:49', '2021-07-15 16:09:49', '1626336578722');
INSERT INTO `thumb` VALUES (NULL, NULL, '1621553753077', '2021-07-15 16:15:18', '2021-07-15 16:15:18', '1626336182253');
INSERT INTO `thumb` VALUES (NULL, NULL, '1621554155356', '2021-07-15 16:20:54', '2021-07-15 16:20:54', '1626336321467');
INSERT INTO `thumb` VALUES (NULL, NULL, '1625404058174', '2021-07-15 16:33:52', '2021-07-15 16:33:52', '1626337998026');
INSERT INTO `thumb` VALUES ('1626273942317', NULL, '1626267479156', '2021-07-15 17:10:54', '2021-07-15 17:10:54', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626357075763', '1626267479156', '2021-07-15 21:52:15', '2021-07-15 21:52:15', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626360763320', '1626253954965', '2021-07-15 22:54:06', '2021-07-15 22:54:06', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626438623200', '1626352819737', '2021-07-16 20:30:26', '2021-07-16 20:30:26', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626444341415', '1626352819737', '2021-07-16 22:05:44', '2021-07-16 22:05:44', NULL);
INSERT INTO `thumb` VALUES (NULL, NULL, '1626352819737', '2021-07-18 20:23:47', '2021-07-18 20:23:47', '1626337998026');
INSERT INTO `thumb` VALUES ('1626233530174', NULL, '1626352819737', '2021-07-18 22:46:46', '2021-07-18 22:46:46', NULL);
INSERT INTO `thumb` VALUES ('1625054331380', NULL, '1626267479156', '2021-07-20 15:49:42', '2021-07-20 15:49:42', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626619855661', '1626267479156', '2021-08-08 11:00:58', '2021-08-08 11:00:58', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626619855661', '1621553753077', '2021-09-29 14:30:20', '2021-09-29 14:30:20', NULL);
INSERT INTO `thumb` VALUES (NULL, '1625054749904', '1621553753077', '2021-09-29 14:30:22', '2021-09-29 14:30:22', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626357075763', '1621553753077', '2021-10-08 15:41:20', '2021-10-08 15:41:20', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626353916566', '1621553753077', '2021-10-08 15:41:21', '2021-10-08 15:41:21', NULL);
INSERT INTO `thumb` VALUES ('1625054670111', NULL, '1621553753077', '2021-10-08 15:43:18', '2021-10-08 15:43:18', NULL);
INSERT INTO `thumb` VALUES ('1625054974084', NULL, '1621553753077', '2021-10-11 16:06:50', '2021-10-11 16:06:50', NULL);
INSERT INTO `thumb` VALUES (NULL, '1633939717293', '1621553753077', '2021-10-11 16:08:41', '2021-10-11 16:08:41', NULL);
INSERT INTO `thumb` VALUES ('1634533890069', NULL, '1621553753077', '2021-10-19 16:27:08', '2021-10-19 16:27:08', NULL);
INSERT INTO `thumb` VALUES (NULL, '1635429198075', '1622166913290', '2021-10-28 21:53:20', '2021-10-28 21:53:20', NULL);
INSERT INTO `thumb` VALUES (NULL, '1635680979001', '1635679207853', '2021-10-31 19:49:41', '2021-10-31 19:49:41', NULL);
INSERT INTO `thumb` VALUES ('1635504576446', NULL, '1635679207853', '2021-10-31 20:07:54', '2021-10-31 20:07:54', NULL);
INSERT INTO `thumb` VALUES (NULL, '1635684333827', '1635679207853', '2021-10-31 20:45:46', '2021-10-31 20:45:46', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636035627478', '1622167044223', '2021-11-04 22:20:30', '2021-11-04 22:20:30', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636184236381', '1621553753077', '2021-11-06 15:37:19', '2021-11-06 15:37:19', NULL);
INSERT INTO `thumb` VALUES ('1636029265659', NULL, '1621553753077', '2021-11-08 14:36:11', '2021-11-08 14:36:11', NULL);
INSERT INTO `thumb` VALUES ('1636353273700', NULL, '1621553753077', '2021-11-09 22:58:07', '2021-11-09 22:58:07', NULL);
INSERT INTO `thumb` VALUES (NULL, '1638606140378', '1635685284424', '2021-12-04 16:22:22', '2021-12-04 16:22:22', NULL);
INSERT INTO `thumb` VALUES (NULL, NULL, '1640498317915', '2021-12-26 13:59:36', '2021-12-26 13:59:36', '1626337998026');
INSERT INTO `thumb` VALUES (NULL, '1640503140472', '1640498622256', '2021-12-26 15:19:05', '2021-12-26 15:19:05', NULL);
INSERT INTO `thumb` VALUES (NULL, '1640503035566', '1621553753077', '2021-12-27 15:33:45', '2021-12-27 15:33:45', NULL);
INSERT INTO `thumb` VALUES (NULL, '1640498708997', '1621553753077', '2021-12-30 19:35:04', '2021-12-30 19:35:04', NULL);
INSERT INTO `thumb` VALUES ('1635686390194', NULL, '1621586602550', '2022-01-05 14:27:11', '2022-01-05 14:27:11', NULL);
INSERT INTO `thumb` VALUES (NULL, '1641984664098', '1621586602550', '2022-01-12 18:51:07', '2022-01-12 18:51:07', NULL);
INSERT INTO `thumb` VALUES (NULL, '1641985128226', '1621586602550', '2022-01-12 18:59:08', '2022-01-12 18:59:08', NULL);
INSERT INTO `thumb` VALUES (NULL, '1642495777207', '1635685284424', '2022-01-18 16:49:39', '2022-01-18 16:49:39', NULL);
INSERT INTO `thumb` VALUES (NULL, '1642495833828', '1621553753077', '2022-01-18 16:50:37', '2022-01-18 16:50:37', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626438623200', '1640497948238', '2022-01-19 14:42:53', '2022-01-19 14:42:53', NULL);
INSERT INTO `thumb` VALUES (NULL, '1642574437720', '1640497948238', '2022-01-19 14:43:02', '2022-01-19 14:43:02', NULL);
INSERT INTO `thumb` VALUES (NULL, NULL, '1640497948238', '2022-01-19 14:43:15', '2022-01-19 14:43:15', '1626337998026');
INSERT INTO `thumb` VALUES (NULL, '1642578392679', '1640497948238', '2022-01-19 15:46:49', '2022-01-19 15:46:49', NULL);
INSERT INTO `thumb` VALUES (NULL, '1642578717713', '1640497948238', '2022-01-19 16:02:17', '2022-01-19 16:02:17', NULL);
INSERT INTO `thumb` VALUES (NULL, '1642579675341', '1640497948238', '2022-01-19 16:07:59', '2022-01-19 16:07:59', NULL);
INSERT INTO `thumb` VALUES ('1634533182631', NULL, '1621586602550', '2022-01-21 10:20:42', '2022-01-21 10:20:42', NULL);
INSERT INTO `thumb` VALUES ('1634533182631', NULL, '1635685284424', '2022-01-21 10:22:39', '2022-01-21 10:22:39', NULL);
INSERT INTO `thumb` VALUES ('1634533890069', NULL, '1635685284424', '2022-01-21 10:22:55', '2022-01-21 10:22:55', NULL);
INSERT INTO `thumb` VALUES ('1634532454509', NULL, '1635685284424', '2022-01-21 10:24:00', '2022-01-21 10:24:00', NULL);
INSERT INTO `thumb` VALUES ('1634532454509', NULL, '1621586602550', '2022-01-21 10:24:55', '2022-01-21 10:24:55', NULL);
INSERT INTO `thumb` VALUES ('1640505141762', NULL, '1640498317915', '2022-01-22 16:24:54', '2022-01-22 16:24:54', NULL);
INSERT INTO `thumb` VALUES ('1635686390194', NULL, '1621553753077', '2022-01-22 17:23:58', '2022-01-22 17:23:58', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643517266946', '1640497948238', '2022-01-30 12:34:30', '2022-01-30 12:34:30', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643518088969', '1621586602550', '2022-01-30 12:48:11', '2022-01-30 12:48:11', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643518260212', '1635685284424', '2022-01-30 12:51:02', '2022-01-30 12:51:02', NULL);
INSERT INTO `thumb` VALUES ('1635862727342', NULL, '1640498317915', '2022-01-30 15:49:45', '2022-01-30 15:49:45', NULL);
INSERT INTO `thumb` VALUES ('1636030025087', NULL, '1640498317915', '2022-01-30 15:50:19', '2022-01-30 15:50:19', NULL);
INSERT INTO `thumb` VALUES (NULL, '1638606140378', '1640498470004', '2022-02-03 09:41:26', '2022-02-03 09:41:26', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643853034983', '1640498470004', '2022-02-03 09:51:02', '2022-02-03 09:51:02', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643879438291', '1621553753077', '2022-02-03 17:10:44', '2022-02-03 17:10:44', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643880626831', '1621553753077', '2022-02-03 17:30:28', '2022-02-03 17:30:28', NULL);
INSERT INTO `thumb` VALUES ('1643939608960', NULL, '1640497617203', '2022-02-04 09:57:30', '2022-02-04 09:57:30', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643942577602', '1635679207853', '2022-02-04 10:43:07', '2022-02-04 10:43:07', NULL);
INSERT INTO `thumb` VALUES ('1635686660644', NULL, '1635679207853', '2022-02-04 10:44:34', '2022-02-04 10:44:34', NULL);
INSERT INTO `thumb` VALUES ('1635862727342', NULL, '1635679207853', '2022-02-04 10:46:27', '2022-02-04 10:46:27', NULL);
INSERT INTO `thumb` VALUES ('1643433469235', NULL, '1621553753077', '2022-02-04 10:56:49', '2022-02-04 10:56:49', NULL);
INSERT INTO `thumb` VALUES ('1643939608960', NULL, '1635679207853', '2022-02-04 11:28:45', '2022-02-04 11:28:45', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643939653000', '1640498470004', '2022-02-06 18:05:53', '2022-02-06 18:05:53', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636182909875', '1640498470004', '2022-02-06 18:07:43', '2022-02-06 18:07:43', NULL);
INSERT INTO `thumb` VALUES ('1635301875892', NULL, '1640498470004', '2022-02-06 18:07:44', '2022-02-06 18:07:44', NULL);
INSERT INTO `thumb` VALUES ('1643939608960', NULL, '1621586602550', '2022-02-07 10:42:50', '2022-02-07 10:42:50', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643880626831', '1621586602550', '2022-02-07 10:44:06', '2022-02-07 10:44:06', NULL);
INSERT INTO `thumb` VALUES (NULL, '1642577889115', '1621586602550', '2022-02-08 10:05:39', '2022-02-08 10:05:39', NULL);
INSERT INTO `thumb` VALUES ('1625054331380', NULL, '1621586602550', '2022-02-08 10:06:52', '2022-02-08 10:06:52', NULL);
INSERT INTO `thumb` VALUES (NULL, '1640498043250', '1621586602550', '2022-02-08 10:07:54', '2022-02-08 10:07:54', NULL);
INSERT INTO `thumb` VALUES (NULL, '1642574834453', '1621586602550', '2022-02-08 10:08:05', '2022-02-08 10:08:05', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636182489974', '1621553753077', '2022-02-08 13:28:10', '2022-02-08 13:28:10', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643518061775', '1621553753077', '2022-02-08 13:33:09', '2022-02-08 13:33:09', NULL);
INSERT INTO `thumb` VALUES (NULL, '1644322968565', '1644202264813', '2022-02-08 20:23:20', '2022-02-08 20:23:20', NULL);
INSERT INTO `thumb` VALUES (NULL, '1644324979946', '1644202264813', '2022-02-08 20:57:24', '2022-02-08 20:57:24', NULL);
INSERT INTO `thumb` VALUES ('1635862727342', NULL, '1640497948238', '2022-02-08 21:01:33', '2022-02-08 21:01:33', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636182619005', '1640497948238', '2022-02-08 21:03:21', '2022-02-08 21:03:21', NULL);
INSERT INTO `thumb` VALUES ('1643939608960', NULL, '1640497948238', '2022-02-09 11:18:50', '2022-02-09 11:18:50', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643517644680', '1640497948238', '2022-02-09 11:19:35', '2022-02-09 11:19:35', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636182619005', '1635685284424', '2022-02-10 20:44:11', '2022-02-10 20:44:11', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643517480416', '1635685284424', '2022-02-10 20:54:27', '2022-02-10 20:54:27', NULL);
INSERT INTO `thumb` VALUES ('1643879245050', NULL, '1635685284424', '2022-02-10 21:03:43', '2022-02-10 21:03:43', NULL);
INSERT INTO `thumb` VALUES (NULL, '1640497920000', '1626267479156', '2022-02-11 20:10:14', '2022-02-11 20:10:14', NULL);
INSERT INTO `thumb` VALUES ('1635686660644', NULL, '1626267479156', '2022-02-11 21:17:53', '2022-02-11 21:17:53', NULL);
INSERT INTO `thumb` VALUES ('1635686390194', NULL, '1626267479156', '2022-02-11 21:21:58', '2022-02-11 21:21:58', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643517480416', '1626267479156', '2022-02-11 21:23:00', '2022-02-11 21:23:00', NULL);
INSERT INTO `thumb` VALUES (NULL, '1640503035566', '1626267479156', '2022-02-11 21:23:01', '2022-02-11 21:23:01', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636182619005', '1626267479156', '2022-02-11 21:23:02', '2022-02-11 21:23:02', NULL);
INSERT INTO `thumb` VALUES (NULL, '1640497497829', '1621553753077', '2022-02-11 21:43:15', '2022-02-11 21:43:15', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643517583794', '1621586669402', '2022-02-12 11:33:05', '2022-02-12 11:33:05', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636035710895', '1621553753077', '2022-02-18 14:57:40', '2022-02-18 14:57:40', NULL);
INSERT INTO `thumb` VALUES (NULL, '1645444329850', '1640497296254', '2022-02-21 19:52:12', '2022-02-21 19:52:12', NULL);
INSERT INTO `thumb` VALUES ('1644586646938', NULL, '1640497617203', '2022-02-23 16:18:54', '2022-02-23 16:18:54', NULL);
INSERT INTO `thumb` VALUES (NULL, '1644324845106', '1621553753077', '2022-03-02 10:29:15', '2022-03-02 10:29:15', NULL);
INSERT INTO `thumb` VALUES (NULL, NULL, '1621553753077', '2022-03-02 10:38:34', '2022-03-02 10:38:34', '1626337998026');
INSERT INTO `thumb` VALUES (NULL, NULL, '1621553753077', '2022-03-02 10:38:37', '2022-03-02 10:38:37', '1645170142775');
INSERT INTO `thumb` VALUES (NULL, '1635506848262', '1621553753077', '2022-03-02 10:39:14', '2022-03-02 10:39:14', NULL);
INSERT INTO `thumb` VALUES ('1644586646938', NULL, '1621553753077', '2022-03-05 14:38:43', '2022-03-05 14:38:43', NULL);
INSERT INTO `thumb` VALUES ('1643433735031', NULL, '1621553753077', '2022-03-25 19:59:08', '2022-03-25 19:59:08', NULL);
INSERT INTO `thumb` VALUES (NULL, '1644324863225', '1621553753077', '2022-03-25 20:00:15', '2022-03-25 20:00:15', NULL);
INSERT INTO `thumb` VALUES ('1648269327758', NULL, '1621553753077', '2022-03-26 12:36:18', '2022-03-26 12:36:18', NULL);
INSERT INTO `thumb` VALUES ('1648270710019', NULL, '1621553753077', '2022-03-26 13:00:18', '2022-03-26 13:00:18', NULL);
INSERT INTO `thumb` VALUES ('1625054670111', NULL, '1621586602550', '2022-03-26 13:51:01', '2022-03-26 13:51:01', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626619855661', '1621586602550', '2022-03-26 13:51:24', '2022-03-26 13:51:24', NULL);
INSERT INTO `thumb` VALUES (NULL, '1648273882434', '1621586602550', '2022-03-26 13:56:42', '2022-03-26 13:56:42', NULL);
INSERT INTO `thumb` VALUES (NULL, '1644324863225', '1621586602550', '2022-03-26 13:59:15', '2022-03-26 13:59:15', NULL);
INSERT INTO `thumb` VALUES ('1636028601995', NULL, '1621586602550', '2022-03-26 14:00:37', '2022-03-26 14:00:37', NULL);
INSERT INTO `thumb` VALUES (NULL, '1644585383642', '1621553753077', '2022-03-29 11:39:34', '2022-03-29 11:39:34', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643939653000', '1621553753077', '2022-03-29 11:39:36', '2022-03-29 11:39:36', NULL);
INSERT INTO `thumb` VALUES ('1648272232969', NULL, '1621553753077', '2022-04-04 09:41:16', '2022-04-04 09:41:16', NULL);
INSERT INTO `thumb` VALUES ('1635686660644', NULL, '1621586602550', '2022-04-04 16:12:07', '2022-04-04 16:12:07', NULL);
INSERT INTO `thumb` VALUES ('1635862727342', NULL, '1621586602550', '2022-04-04 16:12:31', '2022-04-04 16:12:31', NULL);
INSERT INTO `thumb` VALUES ('1644286690856', NULL, '1621586602550', '2022-04-04 16:12:42', '2022-04-04 16:12:42', NULL);
INSERT INTO `thumb` VALUES ('1635301875892', NULL, '1621586602550', '2022-04-04 16:12:56', '2022-04-04 16:12:56', NULL);
INSERT INTO `thumb` VALUES ('1635687185570', NULL, '1621586602550', '2022-04-04 16:24:10', '2022-04-04 16:24:10', NULL);
INSERT INTO `thumb` VALUES ('1635505388432', NULL, '1621586602550', '2022-04-04 16:27:18', '2022-04-04 16:27:18', NULL);
INSERT INTO `thumb` VALUES ('1635508469891', NULL, '1621586602550', '2022-04-04 16:27:31', '2022-04-04 16:27:31', NULL);
INSERT INTO `thumb` VALUES ('1635505223574', NULL, '1621586602550', '2022-04-04 16:27:44', '2022-04-04 16:27:44', NULL);
INSERT INTO `thumb` VALUES ('1636272273336', NULL, '1621553753077', '2022-04-04 16:28:19', '2022-04-04 16:28:19', NULL);
INSERT INTO `thumb` VALUES ('1634533890069', NULL, '1621586602550', '2022-04-04 16:30:41', '2022-04-04 16:30:41', NULL);
INSERT INTO `thumb` VALUES ('1635508469891', NULL, '1621553753077', '2022-04-04 18:20:56', '2022-04-04 18:20:56', NULL);
INSERT INTO `thumb` VALUES ('1640503572319', NULL, '1621586602550', '2022-04-04 21:27:43', '2022-04-04 21:27:43', NULL);
INSERT INTO `thumb` VALUES (NULL, '1635505759251', '1621586602550', '2022-04-04 21:29:36', '2022-04-04 21:29:36', NULL);
INSERT INTO `thumb` VALUES ('1644286690856', NULL, '1621553753077', '2022-04-05 21:20:07', '2022-04-05 21:20:07', NULL);
INSERT INTO `thumb` VALUES (NULL, '1649575745322', '1640497617203', '2022-04-10 15:29:20', '2022-04-10 15:29:20', NULL);
INSERT INTO `thumb` VALUES (NULL, '1649575732472', '1640497617203', '2022-04-10 15:29:21', '2022-04-10 15:29:21', NULL);
INSERT INTO `thumb` VALUES (NULL, '1649575683194', '1640497617203', '2022-04-10 15:29:36', '2022-04-10 15:29:36', NULL);
INSERT INTO `thumb` VALUES (NULL, '1649575673960', '1640497617203', '2022-04-10 15:29:38', '2022-04-10 15:29:38', NULL);
INSERT INTO `thumb` VALUES (NULL, '1649575664043', '1640497617203', '2022-04-10 15:29:40', '2022-04-10 15:29:40', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636182619005', '1640497617203', '2022-04-10 15:30:46', '2022-04-10 15:30:46', NULL);
INSERT INTO `thumb` VALUES (NULL, '1625055305257', '1621553753077', '2022-04-11 15:08:36', '2022-04-11 15:08:36', NULL);
INSERT INTO `thumb` VALUES (NULL, '1625055305257', '1640498317915', '2022-04-11 15:09:24', '2022-04-11 15:09:24', NULL);
INSERT INTO `thumb` VALUES (NULL, '1625055305257', '1626248858763', '2022-04-11 15:10:06', '2022-04-11 15:10:06', NULL);
INSERT INTO `thumb` VALUES (NULL, '1625057356308', '1626248858763', '2022-04-11 15:10:13', '2022-04-11 15:10:13', NULL);
INSERT INTO `thumb` VALUES ('1625053676298', NULL, '1626248858763', '2022-04-11 15:42:18', '2022-04-11 15:42:18', NULL);
INSERT INTO `thumb` VALUES (NULL, '1648209543917', '1626267479156', '2022-04-11 17:14:38', '2022-04-11 17:14:38', NULL);
INSERT INTO `thumb` VALUES (NULL, '1644585470816', '1621586602550', '2022-04-11 17:43:07', '2022-04-11 17:43:07', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636272869724', '1621586602550', '2022-04-11 17:43:08', '2022-04-11 17:43:08', NULL);
INSERT INTO `thumb` VALUES (NULL, '1649734171532', '1626267479156', '2022-04-12 11:29:33', '2022-04-12 11:29:33', NULL);
INSERT INTO `thumb` VALUES ('1625051012153', NULL, '1621586602550', '2022-04-12 14:38:06', '2022-04-12 14:38:06', NULL);
INSERT INTO `thumb` VALUES (NULL, NULL, '1621553753077', '2022-04-12 15:03:44', '2022-04-12 15:03:44', '1649746570152');
INSERT INTO `thumb` VALUES (NULL, NULL, '1621586602550', '2022-04-12 15:03:59', '2022-04-12 15:03:59', '1649746570152');
INSERT INTO `thumb` VALUES (NULL, '1649843004284', '1622166913290', '2022-04-13 17:44:56', '2022-04-13 17:44:56', NULL);
INSERT INTO `thumb` VALUES ('1635505388432', NULL, '1622166913290', '2022-04-13 17:48:15', '2022-04-13 17:48:15', NULL);
INSERT INTO `thumb` VALUES (NULL, '1650088585984', '1640497948238', '2022-04-17 09:21:47', '2022-04-17 09:21:47', NULL);
INSERT INTO `thumb` VALUES (NULL, '1650089267376', '1640497948238', '2022-04-17 09:21:55', '2022-04-17 09:21:55', NULL);
INSERT INTO `thumb` VALUES ('1650159272328', NULL, '1649241745130', '2022-04-18 15:17:59', '2022-04-18 15:17:59', NULL);
INSERT INTO `thumb` VALUES ('1650160491450', NULL, '1621586602550', '2022-04-21 16:12:05', '2022-04-21 16:12:05', NULL);
INSERT INTO `thumb` VALUES ('1635339720965', NULL, '1621586602550', '2022-04-21 16:27:51', '2022-04-21 16:27:51', NULL);
INSERT INTO `thumb` VALUES ('1640504921941', NULL, '1621553753077', '2022-04-22 16:53:43', '2022-04-22 16:53:43', NULL);
INSERT INTO `thumb` VALUES ('1635862727342', NULL, '1621586669402', '2022-04-23 10:47:14', '2022-04-23 10:47:14', NULL);
INSERT INTO `thumb` VALUES ('1644286690856', NULL, '1621586669402', '2022-04-23 10:47:15', '2022-04-23 10:47:15', NULL);
INSERT INTO `thumb` VALUES ('1636030025087', NULL, '1621586669402', '2022-04-23 10:47:17', '2022-04-23 10:47:17', NULL);
INSERT INTO `thumb` VALUES ('1635686660644', NULL, '1621586669402', '2022-04-23 16:41:34', '2022-04-23 16:41:34', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626767435483', '1621586669402', '2022-04-23 17:07:47', '2022-04-23 17:07:47', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626098479270', '1621586669402', '2022-04-23 17:07:48', '2022-04-23 17:07:48', NULL);
INSERT INTO `thumb` VALUES (NULL, '1626098465521', '1621586669402', '2022-04-23 17:07:51', '2022-04-23 17:07:51', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643942414832', '1621553753077', '2022-04-23 22:54:27', '2022-04-23 22:54:27', NULL);
INSERT INTO `thumb` VALUES (NULL, '1643942448137', '1621553753077', '2022-04-23 22:54:28', '2022-04-23 22:54:28', NULL);
INSERT INTO `thumb` VALUES (NULL, '1649668168562', '1621553753077', '2022-04-24 11:39:02', '2022-04-24 11:39:02', NULL);
INSERT INTO `thumb` VALUES (NULL, NULL, '1626248858763', '2022-04-24 14:11:31', '2022-04-24 14:11:31', '1649752262763');
INSERT INTO `thumb` VALUES (NULL, NULL, '1626248858763', '2022-04-24 14:11:33', '2022-04-24 14:11:33', '1650011706848');
INSERT INTO `thumb` VALUES ('1636352900663', NULL, '1626248858763', '2022-04-24 14:12:34', '2022-04-24 14:12:34', NULL);
INSERT INTO `thumb` VALUES ('1643433735031', NULL, '1626248858763', '2022-04-24 14:12:42', '2022-04-24 14:12:42', NULL);
INSERT INTO `thumb` VALUES ('1635302223635', NULL, '1626248858763', '2022-04-24 14:13:20', '2022-04-24 14:13:20', NULL);
INSERT INTO `thumb` VALUES ('1650009471674', NULL, '1626248858763', '2022-04-24 14:38:51', '2022-04-24 14:38:51', NULL);
INSERT INTO `thumb` VALUES (NULL, '1650009500717', '1626248858763', '2022-04-24 14:38:53', '2022-04-24 14:38:53', NULL);
INSERT INTO `thumb` VALUES ('1625054974084', NULL, '1626248858763', '2022-04-24 14:41:08', '2022-04-24 14:41:08', NULL);
INSERT INTO `thumb` VALUES ('1626233743392', NULL, '1626248858763', '2022-04-24 14:44:07', '2022-04-24 14:44:07', NULL);
INSERT INTO `thumb` VALUES ('1644586646938', NULL, '1626248858763', '2022-04-24 14:44:15', '2022-04-24 14:44:15', NULL);
INSERT INTO `thumb` VALUES ('1636272273336', NULL, '1621586669402', '2022-04-28 11:54:56', '2022-04-28 11:54:56', NULL);
INSERT INTO `thumb` VALUES ('1650159060727', NULL, '1621553753077', '2022-04-30 16:53:51', '2022-04-30 16:53:51', NULL);
INSERT INTO `thumb` VALUES ('1635504576446', NULL, '1621586602550', '2022-05-02 22:27:48', '2022-05-02 22:27:48', NULL);
INSERT INTO `thumb` VALUES (NULL, NULL, '1621553753077', '2022-05-07 14:33:09', '2022-05-07 14:33:09', '1650011706848');
INSERT INTO `thumb` VALUES (NULL, '1651905187429', '1621553753077', '2022-05-07 14:33:10', '2022-05-07 14:33:10', NULL);
INSERT INTO `thumb` VALUES (NULL, '1650009500717', '1621553753077', '2022-05-07 15:04:42', '2022-05-07 15:04:42', NULL);
INSERT INTO `thumb` VALUES (NULL, '1649734307113', '1621553753077', '2022-05-07 15:41:42', '2022-05-07 15:41:42', NULL);
INSERT INTO `thumb` VALUES ('1651582837583', NULL, '1621553753077', '2022-05-09 08:07:40', '2022-05-09 08:07:40', NULL);
INSERT INTO `thumb` VALUES (NULL, '1636182619005', '1621553753077', '2022-05-15 20:36:30', '2022-05-15 20:36:30', NULL);
INSERT INTO `thumb` VALUES (NULL, '1642578676207', '1621553753077', '2022-05-15 20:36:30', '2022-05-15 20:36:30', NULL);

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `coverUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `originalname` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1640419561892', '写给你的一封信', ' 先给首条“丁磊和颜人中互动动态”点个赞再互动吧！', 'http://localhost:8200/topic/cover?id=1640419561892', '1621553753077', '2021-12-25 16:06:01', '2022-05-15 20:23:05', '109951166784443767.jpg', 'image/jpeg', './upload/topic/cover', '1640419561911.jpg', 47468);
INSERT INTO `topic` VALUES ('1640419636221', ' 早安世界', ' 坚持早起的人都特别可爱', 'http://localhost:8200/topic/cover?id=1640419636221', '1621553753077', '2021-12-25 16:07:16', '2022-05-15 20:23:05', '1382086119978787.jpg', 'image/jpeg', './upload/topic/cover', '1640419636236.jpg', 17205);
INSERT INTO `topic` VALUES ('1640419701458', ' 晚安时光', '山茶花的红终究抵不过大海深处的群青', 'http://localhost:8200/topic/cover?id=1640419701458', '1621553753077', '2021-12-25 16:08:21', '2022-05-15 20:23:05', '1412872450890167.jpg', 'image/jpeg', './upload/topic/cover', '1640419701472.jpg', 29199);
INSERT INTO `topic` VALUES ('1640419955763', ' 独家', ' 独家', 'http://localhost:8200/topic/cover?id=1640419955763', '1621553753077', '2021-12-25 16:12:35', '2022-05-15 20:23:05', '19041342369886874.jpg', 'image/jpeg', './upload/topic/cover', '1640419955778.jpg', 11755);
INSERT INTO `topic` VALUES ('1640496312923', ' 你的周末日常', ' 周末你都是怎么过的？瘫在家里，还是出门玩耍？快点晒出来吧！', 'http://localhost:8200/topic/cover?id=1640496312923', '1621553753077', '2021-12-26 13:25:12', '2022-05-15 20:23:05', '3418381668125153.jpg', 'image/jpeg', './upload/topic/cover', '1640496312943.jpg', 24787);

-- ----------------------------
-- Table structure for toplist
-- ----------------------------
DROP TABLE IF EXISTS `toplist`;
CREATE TABLE `toplist`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coverUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT 0,
  `playCount` int NULL DEFAULT 0,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1621553753077',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of toplist
-- ----------------------------
INSERT INTO `toplist` VALUES ('1623029817235', '飙升榜', '2021-09-07 09:36:57', '2022-05-26 15:13:42', 'http://localhost:8200/toplist/cover?tId=1623029817235', '一天内热度上升最快的歌曲', 1, 20, '1645620606883');
INSERT INTO `toplist` VALUES ('1623029929854', '新歌榜', '2021-09-07 09:38:49', '2022-05-15 20:23:09', 'http://localhost:8200/toplist/cover?tId=1623029929854', '一个月内发布的新歌', 1, 7, '1645620606883');
INSERT INTO `toplist` VALUES ('1623030010273', '热歌榜', '2021-09-07 09:40:10', '2022-05-15 20:23:09', 'http://localhost:8200/toplist/cover?tId=1623030010273', '一个月内收听的最新歌曲', 1, 1, '1645620606883');
INSERT INTO `toplist` VALUES ('1623030048873', '流行榜', '2021-09-07 09:40:48', '2022-05-15 20:23:09', 'http://localhost:8200/toplist/cover?tId=1623030048873', '一个月内流行歌曲', 1, 11, '1645620606883');
INSERT INTO `toplist` VALUES ('1623150157068', '韩语榜', '2021-09-08 19:02:37', '2022-05-15 20:23:09', 'http://localhost:8200/toplist/cover?tId=1623150157068', '流行韩语歌曲', 0, 1, '1645620606883');
INSERT INTO `toplist` VALUES ('1623150200566', '欧美热歌榜', '2021-09-08 19:03:20', '2022-05-15 20:23:09', 'http://localhost:8200/toplist/cover?tId=1623150200566', '近一个月内欧美热歌', 0, 3, '1645620606883');
INSERT INTO `toplist` VALUES ('1623150255676', '日语榜', '2021-09-08 19:04:15', '2022-05-15 20:23:09', 'http://localhost:8200/toplist/cover?tId=1623150255676', '近一个月内日语歌曲', 0, 0, '1645620606883');

-- ----------------------------
-- Table structure for toplist_cover
-- ----------------------------
DROP TABLE IF EXISTS `toplist_cover`;
CREATE TABLE `toplist_cover`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mimetype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tId`(`tId`) USING BTREE,
  CONSTRAINT `toplist_cover_ibfk_1` FOREIGN KEY (`tId`) REFERENCES `toplist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of toplist_cover
-- ----------------------------
INSERT INTO `toplist_cover` VALUES ('1623029817253', '1623029817235', '飙升榜.svg', './upload/toplist/cover', '1623029817252.svg', 10759, '2021-06-07 09:36:57', '2021-06-07 09:36:57', 'image/svg+xml');
INSERT INTO `toplist_cover` VALUES ('1623029929874', '1623029929854', '新歌榜.svg', './upload/toplist/cover', '1623029929873.svg', 10176, '2021-06-07 09:38:49', '2021-06-07 09:38:49', 'image/svg+xml');
INSERT INTO `toplist_cover` VALUES ('1623030010289', '1623030010273', '热歌榜.svg', './upload/toplist/cover', '1623030010288.svg', 10348, '2021-06-07 09:40:10', '2021-06-07 09:40:10', 'image/svg+xml');
INSERT INTO `toplist_cover` VALUES ('1623030048888', '1623030048873', '流行榜.svg', './upload/toplist/cover', '1623030048887.svg', 8997, '2021-06-07 09:40:48', '2021-06-07 09:40:48', 'image/svg+xml');
INSERT INTO `toplist_cover` VALUES ('1623150157094', '1623150157068', '109951165611550672.jpg', './upload/toplist/cover', '1623150157090.jpg', 14607, '2021-06-08 19:02:37', '2021-06-08 19:02:37', 'image/jpeg');
INSERT INTO `toplist_cover` VALUES ('1623150200582', '1623150200566', '109951165752868980.jpg', './upload/toplist/cover', '1623150200580.jpg', 16040, '2021-06-08 19:03:20', '2021-06-08 19:03:20', 'image/jpeg');
INSERT INTO `toplist_cover` VALUES ('1623150255691', '1623150255676', '109951165611548673.jpg', './upload/toplist/cover', '1623150255690.jpg', 10391, '2021-06-08 19:04:15', '2021-06-08 19:04:15', 'image/jpeg');

-- ----------------------------
-- Table structure for toplist_song
-- ----------------------------
DROP TABLE IF EXISTS `toplist_song`;
CREATE TABLE `toplist_song`  (
  `tId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `diff` int NULL DEFAULT 0,
  INDEX `tId`(`tId`) USING BTREE,
  INDEX `songId`(`songId`) USING BTREE,
  CONSTRAINT `toplist_song_ibfk_1` FOREIGN KEY (`tId`) REFERENCES `toplist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `toplist_song_ibfk_2` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of toplist_song
-- ----------------------------
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622110603944', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1633919156741', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622110534718', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1644374326583', 5);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1626272735139', 3);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1624546320157', 3);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643519328369', 3);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1625408435039', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1626233266278', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643881216324', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1633946866771', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648208054434', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622110818998', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1624375323999', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635340172627', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622111065068', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622110656908', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643520839579', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1647144678278', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643519796010', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648273424472', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648271712472', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1644375432188', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648208736500', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1647145343871', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648269910363', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643938595197', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635503448330', 8);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648270454571', 4);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1647144314377', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648273221025', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1624546108864', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643454106693', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635429386379', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635507474940', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635507507293', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643880439323', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635680608268', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635508957215', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622103280470', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1624546506142', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648273334240', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622103223653', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1624540295354', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643520258396', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1634458012381', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1625405714713', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1644374176123', 6);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622110748238', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622102341993', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1644374062902', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1634541304221', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635506366426', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1624546835299', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1626360701597', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648273167106', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1649335319660', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1650786496187', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1650786700381', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648270034330', 2);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635337922244', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1645600255159', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648273273312', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622101289239', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622101394846', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1625408496042', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1626273066287', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622110787760', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1649335244826', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1650524182823', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643880947532', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1626274222518', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1649335080451', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635681782848', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1647143678810', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1626272834782', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643454792066', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1634531821765', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1624546049959', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1624549525985', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1624549442936', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1624549624782', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1643436188086', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1649575232381', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622111035876', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622110700737', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622102743240', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1649336837075', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1648270087790', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1649982278381', 3);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635429830242', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1635506793225', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1622102944462', 1);
INSERT INTO `toplist_song` VALUES ('1623029817235', '1649336428604', 1);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1644374062902', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1645600255159', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1649982278381', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1635681782848', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1624372266021', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1624375323999', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1625405714713', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1624540295354', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1626274222518', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1625056980100', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622101289239', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622101394846', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622101472154', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622101549091', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622101615081', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622102609215', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622102673371', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622102743240', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622102341993', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1625056808587', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1625056743569', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1625056648865', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1625056579678', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1625056892758', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1625057125791', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1648269910363', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1648270034330', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1648270087790', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1644374176123', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1643938595197', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1635429830242', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1647143678810', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1626272963986', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1626272930895', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1626272881558', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1626272834782', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1626272735139', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1626273066287', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1626272793322', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1648208054434', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1635506366426', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622110748238', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1622110787760', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1643880947532', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1648273221025', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1648273167106', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1648273424472', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1648273390456', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1648273334240', 0);
INSERT INTO `toplist_song` VALUES ('1623029929854', '1648273273312', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1643436188086', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1622102341993', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1643454106693', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1648273167106', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1643938595197', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1624540295354', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1644374062902', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1635506793225', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1643519796010', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1634541304221', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1635429830242', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1624546506142', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1635503448330', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1643880439323', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1622103223653', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1643880947532', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1648270454571', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1626360701597', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1624375323999', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1634531821765', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1649982278381', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1643454792066', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1633919156741', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1644374176123', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1624546320157', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1624546835299', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1635337922244', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1635508957215', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1647143678810', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1626274222518', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1624372266021', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1635681782848', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1648273334240', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1622101289239', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1624546108864', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1625056808587', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1625408435039', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1635507474940', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1643519328369', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1649336428604', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1622110534718', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1635680608268', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1643520839579', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1626233266278', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1622110748238', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1624547985767', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1626272735139', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1624549624782', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1644375432188', 0);
INSERT INTO `toplist_song` VALUES ('1623030010273', '1647144678278', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1624540295354', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1635506793225', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1649575232381', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1643938595197', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1643436188086', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1634531821765', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1633946866771', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1648273167106', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1626272735139', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1635506366426', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1643880439323', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1633919156741', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1643454106693', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1624546506142', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1635340172627', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1626360701597', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1626233266278', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1635337922244', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1634362102513', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1647144678278', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622103223653', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1635340334894', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1635429386379', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1635508957215', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622110534718', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1624375323999', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1634541304221', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1624546320157', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1635680608268', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1635503448330', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1648208054434', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1644375432188', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1643519796010', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1635429830242', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1648270454571', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622101289239', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1625408435039', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622103280470', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622111035876', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622111065068', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622103084212', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1650786700381', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622110748238', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622110656908', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622110787760', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622102341993', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622101615081', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622101394846', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622110603944', 0);
INSERT INTO `toplist_song` VALUES ('1623030048873', '1622110818998', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1624540295354', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1648270034330', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1625405714713', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1648270087790', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1643880947532', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1643454792066', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1626272834782', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1626272881558', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1626274222518', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1626272793322', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1626272930895', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1626272963986', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1626272735139', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1648269910363', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1626273066287', 0);
INSERT INTO `toplist_song` VALUES ('1623150157068', '1650524822781', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1649575133886', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622110656908', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622110787760', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1649575232381', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622111035876', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622110603944', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622110700737', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1635680515627', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622101394846', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622102609215', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622102743240', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1649334883510', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1649336837075', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622111065068', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1625056892758', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622101549091', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622101615081', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1648273273312', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1648273221025', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1624375323999', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622102673371', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1625056579678', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1625056648865', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1648273390456', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1650524182823', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1650786496187', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1648273334240', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622101289239', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1625056808587', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1649336428604', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1650786700381', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1625057125791', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1635680608268', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622110534718', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622110748238', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1643520839579', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1644375432188', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1625056743569', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1649335244826', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1625056980100', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1649335319660', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1648273424472', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622102341993', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622101472154', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1649335080451', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1648273167106', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1622110818998', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1649337040969', 0);
INSERT INTO `toplist_song` VALUES ('1623150200566', '1650524279021', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1622103656946', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1643520258396', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1622103579245', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1634458012381', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1622103223653', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1648270454571', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1626360701597', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1622103731345', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1622103280470', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1622104866862', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1635340334894', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1635508957215', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1624372266021', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1622103363485', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1635340469770', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1650524544165', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1635340172627', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1635429386379', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1635506366426', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1622104614735', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1622104693652', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1622104915163', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1650008526637', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1650008618850', 0);
INSERT INTO `toplist_song` VALUES ('1623150255676', '1650008684093', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatarUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `auth` int NULL DEFAULT 0,
  `expireTime` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `cId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `manage` int NULL DEFAULT 0,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1621553753077', '叶子', '123', 'http://localhost:8200/user/avatar?id=1621553753077', '2021-08-21 07:35:53', '2022-05-15 20:23:12', 1, '2022-10-06 18:58:04', '1643091252790', 1);
INSERT INTO `user` VALUES ('1621554155356', 'who1', '123', 'http://localhost:8200/user/avatar?id=1621554155356', '2021-08-21 07:42:35', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 1);
INSERT INTO `user` VALUES ('1621586602550', 'Bug码', '456', 'http://localhost:8200/user/avatar?id=1621586602550', '2021-08-21 16:43:22', '2022-05-15 20:23:12', 1, '2023-04-04 19:03:32', '1643091264205', 0);
INSERT INTO `user` VALUES ('1621586669402', '小夜刀', '123', 'http://localhost:8200/user/avatar?id=1621586669402', '2021-08-21 16:44:29', '2022-05-15 20:23:12', 1, '2023-04-10 14:25:17', '1643091264205', 0);
INSERT INTO `user` VALUES ('1622166913290', '阮籍', '123', 'http://localhost:8200/user/avatar?id=1622166913290', '2021-08-28 09:55:13', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1622167044223', '嵇康', '123', 'http://localhost:8200/user/avatar?id=1622167044223', '2021-08-28 09:57:24', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1625404058174', '爱音乐', '567', 'http://localhost:8200/user/avatar?id=1625404058174', '2021-09-04 21:07:38', '2022-05-15 20:23:12', 1, '2023-04-29 18:36:57', '1643091264205', 0);
INSERT INTO `user` VALUES ('1626248858763', '呜呜', '123', 'http://localhost:8200/user/avatar?id=1626248858763', '2021-09-14 15:47:38', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1626253954965', '鸡不鸣', '456', 'http://localhost:8200/user/avatar?id=1626253954965', '2021-09-14 17:12:34', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1626267479156', '秃顶的码农', '234', 'http://localhost:8200/user/avatar?id=1626267479156', '2021-09-14 20:57:59', '2022-05-15 20:23:12', 1, '2022-10-08 17:00:56', '1643091252790', 0);
INSERT INTO `user` VALUES ('1626352819737', '小三', '123', 'http://localhost:8200/user/avatar?id=1626352819737', '2021-09-15 20:40:19', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1635679207853', '小明', '123', 'http://localhost:8200/user/avatar?id=1635679207853', '2021-10-31 19:20:07', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1635685284424', '我是个好人', '456', 'http://localhost:8200/user/avatar?id=1635685284424', '2021-10-31 21:01:24', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1640497296254', '洗袜子', '123', 'http://localhost:8200/user/avatar?id=1640497296254', '2021-12-26 13:41:36', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1640497617203', '华子', '456', 'http://localhost:8200/user/avatar?id=1640497617203', '2021-12-26 13:46:57', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1640497948238', '诸葛铁蛋', '123', 'http://localhost:8200/user/avatar?id=1640497948238', '2021-12-26 13:52:28', '2022-05-15 20:23:12', 1, '2022-10-06 19:05:14', '1643091252790', 0);
INSERT INTO `user` VALUES ('1640498122016', '如果再见', '123', 'http://localhost:8200/user/avatar?id=1640498122016', '2021-12-26 13:55:22', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1640498317915', '靡靡', '123', 'http://localhost:8200/user/avatar?id=1640498317915', '2021-12-26 13:58:37', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1640498470004', '狗头', '123', 'http://localhost:8200/user/avatar?id=1640498470004', '2021-12-26 14:01:10', '2022-05-15 20:23:12', 1, '2022-08-02 18:38:29', '1643091239804', 0);
INSERT INTO `user` VALUES ('1640498622256', '绯色', '123', 'http://localhost:8200/user/avatar?id=1640498622256', '2021-12-26 14:03:42', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1644202264813', 'baby', '123', 'http://localhost:8200/user/avatar?id=1644202264813', '2022-02-07 10:51:04', '2022-05-25 15:57:07', 1, '2022-11-21 15:57:07', '1643091252790', 0);
INSERT INTO `user` VALUES ('1644398546607', '牲畜', '123', 'http://localhost:8200/user/avatar?id=1644398546607', '2022-02-09 17:22:26', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1645620606883', 'guobin', '123', 'http://localhost:8200/user/avatar?id=1645620606883', '2022-02-23 20:50:06', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 1);
INSERT INTO `user` VALUES ('1649236303322', '鸡冠', '123', 'http://localhost:8200/user/avatar?id=1649236303322', '2022-04-06 17:11:43', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1649241745130', 'iu', '123', 'http://localhost:8200/user/avatar?id=1649241745130', '2022-04-06 18:42:25', '2022-05-15 20:23:12', 1, '2022-10-15 14:53:55', '1643091252790', 0);
INSERT INTO `user` VALUES ('1650161308411', '卡机', '123', 'http://localhost:8200/user/avatar?id=1650161308411', '2022-04-17 10:08:28', '2022-05-15 20:23:12', 0, '0000-00-00 00:00:00', NULL, 0);
INSERT INTO `user` VALUES ('1651480823572', '张张', '123', 'http://localhost:8200/user/avatar?id=1651480823572', '2022-05-02 16:40:23', '2022-05-15 20:23:12', 1, '2022-10-30 21:18:19', '1643091252790', 0);
INSERT INTO `user` VALUES ('1652072769271', 'gb', '123', NULL, '2022-05-09 13:06:09', '2022-05-09 13:07:08', 1, '2022-11-05 13:07:09', '1643091252790', 0);

-- ----------------------------
-- Table structure for verifyimg
-- ----------------------------
DROP TABLE IF EXISTS `verifyimg`;
CREATE TABLE `verifyimg`  (
  `outId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `innerId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `scale` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `picUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`outId`) USING BTREE,
  INDEX `innerId`(`innerId`) USING BTREE,
  CONSTRAINT `verifyimg_ibfk_1` FOREIGN KEY (`innerId`) REFERENCES `verifyimg` (`outId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of verifyimg
-- ----------------------------
INSERT INTO `verifyimg` VALUES ('1644043640946', 'outer.jpg', 'image/jpeg', './upload/verify', '1644043640944.jpg', 11950, NULL, NULL, 'http://localhost:8200/verify/img?id=1644043640946');
INSERT INTO `verifyimg` VALUES ('1644043672124', 'inner.png', 'image/png', './upload/verify', '1644043672123.png', 5386, '1644043640946', '0.25', 'http://localhost:8200/verify/img?id=1644043672124');
INSERT INTO `verifyimg` VALUES ('1644043703243', '6c82b3f3724947608d702ffee7a60381.jpg', 'image/jpeg', './upload/verify', '1644043703242.jpg', 17385, NULL, NULL, 'http://localhost:8200/verify/img?id=1644043703243');
INSERT INTO `verifyimg` VALUES ('1644043721463', '1c06b32830544bb083cd2c752068b606.png', 'image/png', './upload/verify', '1644043721462.png', 6305, '1644043703243', '0.73', 'http://localhost:8200/verify/img?id=1644043721463');
INSERT INTO `verifyimg` VALUES ('1644044433110', 'outer.jpg', 'image/jpeg', './upload/verify', '1644044433106.jpg', 20385, NULL, NULL, 'http://localhost:8200/verify/img?id=1644044433110');
INSERT INTO `verifyimg` VALUES ('1644044465080', 'inner.png', 'image/png', './upload/verify', '1644044465079.png', 6278, '1644044433110', '0.61', 'http://localhost:8200/verify/img?id=1644044465080');
INSERT INTO `verifyimg` VALUES ('1644045176216', '5d51005794ce477daa79b59e3f9ddc26.jpg', 'image/jpeg', './upload/verify', '1644045176213.jpg', 12465, NULL, NULL, 'http://localhost:8200/verify/img?id=1644045176216');
INSERT INTO `verifyimg` VALUES ('1644045194944', 'f30196809fbb4d5ca44f275b048f0697.png', 'image/png', './upload/verify', '1644045194943.png', 6846, '1644045176216', '0.74', 'http://localhost:8200/verify/img?id=1644045194944');
INSERT INTO `verifyimg` VALUES ('1644045289447', '9f7c3bb7b1ae4134aae109fe1c63402e.jpg', 'image/jpeg', './upload/verify', '1644045289446.jpg', 24769, NULL, NULL, 'http://localhost:8200/verify/img?id=1644045289447');
INSERT INTO `verifyimg` VALUES ('1644045309227', '11bcd00e3f4846bfa3d4a63880ba5998.png', 'image/png', './upload/verify', '1644045309227.png', 7217, '1644045289447', '0.29', 'http://localhost:8200/verify/img?id=1644045309227');
INSERT INTO `verifyimg` VALUES ('1644045375935', 'e77e6478b921426a99a2b8f58578d107.jpg', 'image/jpeg', './upload/verify', '1644045375934.jpg', 17023, NULL, NULL, 'http://localhost:8200/verify/img?id=1644045375935');
INSERT INTO `verifyimg` VALUES ('1644045393874', '5e31352a427e4774bfefc3356aa863a4.png', 'image/png', './upload/verify', '1644045393873.png', 4348, '1644045375935', '0.3', 'http://localhost:8200/verify/img?id=1644045393874');
INSERT INTO `verifyimg` VALUES ('1644045483164', '1b3f729f26474e718e27f6812a8f6b4b.jpg', 'image/jpeg', './upload/verify', '1644045483162.jpg', 8993, NULL, NULL, 'http://localhost:8200/verify/img?id=1644045483164');
INSERT INTO `verifyimg` VALUES ('1644045500531', '3dee08609ae84879baab41759d8477eb.png', 'image/png', './upload/verify', '1644045500529.png', 5524, '1644045483164', '0.37', 'http://localhost:8200/verify/img?id=1644045500531');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `vid` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `coverUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cateId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `playCount` int NULL DEFAULT 0,
  `type` int NULL DEFAULT 0,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `originalname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT 0,
  `dt` int NULL DEFAULT 0,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `songId` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`vid`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `cateId`(`cateId`) USING BTREE,
  INDEX `video_mv-song`(`songId`) USING BTREE,
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_ibfk_2` FOREIGN KEY (`cateId`) REFERENCES `video_cate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_mv-song` FOREIGN KEY (`songId`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1625050801876', '一个beat的时间带你穿越回90年代的香港', '1621553753077', 'http://localhost:8200/video/cover?id=1625050801876', '1623160657342', 3, 0, '2021-08-30 19:00:01', '2022-05-15 20:23:18', '360175298-1-208.mp4', 'video/mp4', './upload/video/source', '1625050801900.mp4', 22966037, 182485, 'http://localhost:8200/video?id=1625050801876', '一个beat的时间带你穿越回90年代的香港', NULL);
INSERT INTO `video` VALUES ('1625051012153', 'Home We\'ll Go', '1621553753077', 'http://localhost:8200/video/cover?id=1625051012153', '1623160657342', 4, 0, '2021-08-30 19:03:32', '2022-05-15 20:23:18', '362118363-1-208.mp4', 'video/mp4', './upload/video/source', '1625051012168.mp4', 30442643, 243485, 'http://localhost:8200/video?id=1625051012153', 'Home We\'ll Go', NULL);
INSERT INTO `video` VALUES ('1625051160903', 'ANGEMI - Witches', '1621553753077', 'http://localhost:8200/video/cover?id=1625051160903', '1623160657342', 2, 0, '2021-08-30 19:06:00', '2022-05-15 20:23:18', '362046621-1-192.mp4', 'video/mp4', './upload/video/source', '1625051160916.mp4', 44693792, 189382, 'http://localhost:8200/video?id=1625051160903', '极致电音', NULL);
INSERT INTO `video` VALUES ('1625051322616', 'BRAVE GIRLS - Chi Mat Ba Ram 勇敢女孩', '1621586669402', 'http://localhost:8200/video/cover?id=1625051322616', '1623160657342', 4, 0, '2021-08-30 19:08:42', '2022-05-15 20:23:18', '361959278-1-192.mp4', 'video/mp4', './upload/video/source', '1625051322629.mp4', 59521507, 253075, 'http://localhost:8200/video?id=1625051322616', 'BRAVE GIRLS - Chi Mat Ba Ram 勇敢女孩', NULL);
INSERT INTO `video` VALUES ('1625051433306', 'RUQOA - Leave Me Alone - RUQOA - Leave Me Alone', '1621586669402', 'http://localhost:8200/video/cover?id=1625051433306', '1623160657342', 3, 0, '2021-08-30 19:10:33', '2022-05-15 20:23:18', '359165513-1-208.mp4', 'video/mp4', './upload/video/source', '1625051433325.mp4', 26355019, 193144, 'http://localhost:8200/video?id=1625051433306', 'RUQOA - Leave Me Alone - RUQOA - Leave Me Alone', NULL);
INSERT INTO `video` VALUES ('1625051550841', 'Paradise feat. Grace - Oceans - Paradise feat. Grace - Oceans', '1621586669402', 'http://localhost:8200/video/cover?id=1625051550841', '1623160657342', 0, 0, '2021-08-30 19:12:30', '2022-05-15 20:23:18', 'dom8.mp4', 'video/mp4', './upload/video/source', '1625051550859.mp4', 32208848, 295428, 'http://localhost:8200/video?id=1625051550841', 'Paradise feat. Grace - Oceans - Paradise feat. Grace - Oceans', NULL);
INSERT INTO `video` VALUES ('1625051913014', '猫和老鼠电音', '1621586669402', 'http://localhost:8200/video/cover?id=1625051913014', '1623160657342', 4, 0, '2021-08-30 19:18:33', '2022-05-15 20:23:18', '361788426-1-208.mp4', 'video/mp4', './upload/video/source', '1625051913029.mp4', 91965025, 262549, 'http://localhost:8200/video?id=1625051913014', '猫和老鼠电音', NULL);
INSERT INTO `video` VALUES ('1625052103190', '油管电音神曲TOP10', '1621586669402', 'http://localhost:8200/video/cover?id=1625052103190', '1623160657342', 0, 0, '2021-08-30 19:21:43', '2022-05-15 20:23:18', '361602475-1-192.mp4', 'video/mp4', './upload/video/source', '1625052103210.mp4', 34115067, 301909, 'http://localhost:8200/video?id=1625052103190', '油管电音神曲TOP10', NULL);
INSERT INTO `video` VALUES ('1625052377257', 'Mandy Jiroux ft. Reez', '1621586669402', 'http://localhost:8200/video/cover?id=1625052377257', '1623160657342', 1, 0, '2021-08-30 19:26:17', '2022-05-15 20:23:18', '361535734-1-208.mp4', 'video/mp4', './upload/video/source', '1625052377276.mp4', 59549690, 202943, 'http://localhost:8200/video?id=1625052377257', 'Mandy Jiroux ft. Reez', NULL);
INSERT INTO `video` VALUES ('1625052620454', '这个《山河令》混剪居然剪的是！！！', '1621586669402', 'http://localhost:8200/video/cover?id=1625052620454', '1623160684310', 1, 0, '2021-08-30 19:30:20', '2022-05-15 20:23:18', '355644771-1-208.mp4', 'video/mp4', './upload/video/source', '1625052620471.mp4', 74562968, 201963, 'http://localhost:8200/video?id=1625052620454', '这个《山河令》混剪居然剪的是！！！', NULL);
INSERT INTO `video` VALUES ('1625053198223', '出山', '1621586669402', 'http://localhost:8200/video/cover?id=1625053198223', '1623160684310', 13, 0, '2021-08-30 19:39:58', '2022-05-15 20:23:18', '77237833-1-208.mp4', 'video/mp4', './upload/video/source', '1625053198246.mp4', 58488784, 144363, 'http://localhost:8200/video?id=1625053198223', '出山', NULL);
INSERT INTO `video` VALUES ('1625053488369', 'Taylor Swift - How you get the girl (1989 Tour)', '1621586669402', 'http://localhost:8200/video/cover?id=1625053488369', '1623160724807', 3, 0, '2021-08-30 19:44:48', '2022-05-15 20:23:18', '362186764-1-208.mp4', 'video/mp4', './upload/video/source', '1625053488386.mp4', 110395989, 319460, 'http://localhost:8200/video?id=1625053488369', 'Taylor Swift - How you get the girl (1989 Tour)', NULL);
INSERT INTO `video` VALUES ('1625053676298', '【YUI】钢之炼金术师FA OP1「again」中日字幕', '1621586669402', 'http://localhost:8200/video/cover?id=1625053676298', '1623160724807', 1, 0, '2021-08-30 19:47:56', '2022-05-15 20:23:18', '36706221-1-208.mp4', 'video/mp4', './upload/video/source', '1625053676318.mp4', 105091312, 246379, 'http://localhost:8200/video?id=1625053676298', '【YUI】钢之炼金术师FA OP1「again」中日字幕', NULL);
INSERT INTO `video` VALUES ('1625053880065', 'Lemon', '1621586669402', 'http://localhost:8200/video/cover?id=1625053880065', '1623160774837', 7, 1, '2021-08-30 19:51:20', '2022-05-15 20:23:18', '109819229-1-208.mp4', 'video/mp4', './upload/video/source', '1625053880082.mp4', 27092803, 274367, 'http://localhost:8200/video?id=1625053880065', NULL, '1622103223653');
INSERT INTO `video` VALUES ('1625054132725', '米津玄师 八爷 神级现场live', '1621586669402', 'http://localhost:8200/video/cover?id=1625054132725', '1623160724807', 1, 0, '2021-08-30 19:55:32', '2022-05-15 20:23:18', '225098930-1-208.mp4', 'video/mp4', './upload/video/source', '1625054132741.mp4', 35551159, 291734, 'http://localhost:8200/video?id=1625054132725', '米津玄师 八爷 神级现场live', NULL);
INSERT INTO `video` VALUES ('1625054331380', 'loser日中字幕现场版', '1621586669402', 'http://localhost:8200/video/cover?id=1625054331380', '1623160724807', 11, 0, '2021-08-30 19:58:51', '2022-05-15 20:23:18', '133882476-1-160.mp4', 'video/mp4', './upload/video/source', '1625054331398.mp4', 31523624, 249540, 'http://localhost:8200/video?id=1625054331380', 'loser日中字幕现场版', NULL);
INSERT INTO `video` VALUES ('1625054670111', 'butter', '1621586669402', 'http://localhost:8200/video/cover?id=1625054670111', '1623160769739', 13, 1, '2021-08-30 20:04:30', '2022-05-15 20:23:18', '341875372-1-208.mp4', 'video/mp4', './upload/video/source', '1625054670127.mp4', 44189553, 182811, 'http://localhost:8200/video?id=1625054670111', NULL, '1624540295354');
INSERT INTO `video` VALUES ('1625054974084', '我们的时光', '1621586669402', 'http://localhost:8200/video/cover?id=1625054974084', '1623160763019', 13, 1, '2021-08-30 20:09:34', '2022-05-15 20:23:18', '30557363-1-208.mp4', 'video/mp4', './upload/video/source', '1625054974100.mp4', 70603913, 287394, 'http://localhost:8200/video?id=1625054974084', NULL, '1624546506142');
INSERT INTO `video` VALUES ('1625055161411', '成都', '1621586669402', 'http://localhost:8200/video/cover?id=1625055161411', '1623160763019', 19, 1, '2021-08-30 20:12:41', '2022-05-15 20:23:18', '24364921-1-208.mp4', 'video/mp4', './upload/video/source', '1625055161429.mp4', 90095468, 364460, 'http://localhost:8200/video?id=1625055161411', NULL, '1624546320157');
INSERT INTO `video` VALUES ('1625055245420', '成都 我是歌手现场版-赵雷', '1621586669402', 'http://localhost:8200/video/cover?id=1625055245420', '1623160724807', 11, 0, '2021-08-30 20:14:05', '2022-05-15 20:23:18', '18194228-1-208.mp4', 'video/mp4', './upload/video/source', '1625055245436.mp4', 80906714, 339733, 'http://localhost:8200/video?id=1625055245420', '成都 我是歌手现场版-赵雷', NULL);
INSERT INTO `video` VALUES ('1625055706152', '亲爱的旅人', '1621586669402', 'http://localhost:8200/video/cover?id=1625055706152', '1623160763019', 10, 1, '2021-08-30 20:21:46', '2022-05-15 20:23:18', '97160161-1-192.mp4', 'video/mp4', './upload/video/source', '1625055706172.mp4', 63468768, 254635, 'http://localhost:8200/video?id=1625055706152', '亲爱的旅人啊', '1624547985767');
INSERT INTO `video` VALUES ('1625055843087', 'Beyond-不再犹豫 1991演唱会现场版', '1621586669402', 'http://localhost:8200/video/cover?id=1625055843087', '1623160724807', 1, 0, '2021-08-30 20:24:03', '2022-05-15 20:23:18', '28205613-1-160.mp4', 'video/mp4', './upload/video/source', '1625055843101.mp4', 66352988, 280661, 'http://localhost:8200/video?id=1625055843087', 'Beyond-不再犹豫 1991演唱会现场版', NULL);
INSERT INTO `video` VALUES ('1625056118822', 'Love again', '1621586669402', 'http://localhost:8200/video/cover?id=1625056118822', '1623160781152', 5, 1, '2021-08-30 20:28:38', '2022-05-15 20:23:18', '348902228_f22-1-208.mp4', 'video/mp4', './upload/video/source', '1625056118840.mp4', 61774357, 262386, 'http://localhost:8200/video?id=1625056118822', NULL, '1624375323999');
INSERT INTO `video` VALUES ('1625405772980', 'DON\'T FIGHT THE FEELING', '1621553753077', 'http://localhost:8200/video/cover?id=1625405772980', '1623160769739', 3, 1, '2021-09-04 21:36:12', '2022-05-15 20:23:18', '350371102-1-208.mp4', 'video/mp4', './upload/video/source', '1625405772998.mp4', 78686204, 222122, 'http://localhost:8200/video?id=1625405772980', NULL, '1625405714713');
INSERT INTO `video` VALUES ('1626231160557', 'spark', '1621553753077', 'http://localhost:8200/video/cover?id=1626231160557', '1623160781152', 3, 1, '2021-09-14 10:52:40', '2022-05-15 20:23:18', 'spark fly.mp4', 'video/mp4', './upload/video/source', '1626231160582.mp4', 103027003, 269977, 'http://localhost:8200/video?id=1626231160557', NULL, '1622110534718');
INSERT INTO `video` VALUES ('1626231463399', 'Lost Control', '1621553753077', 'http://localhost:8200/video/cover?id=1626231463399', '1623160781152', 1, 1, '2021-09-14 10:57:43', '2022-05-15 20:23:18', 'lost control.mp4', 'video/mp4', './upload/video/source', '1626231463418.mp4', 82759549, 216456, 'http://localhost:8200/video?id=1626231463399', NULL, '1622101289239');
INSERT INTO `video` VALUES ('1626231727362', '吉姆餐厅', '1621553753077', 'http://localhost:8200/video/cover?id=1626231727362', '1623160763019', 6, 1, '2021-09-14 11:02:07', '2022-05-15 20:23:18', '吉姆餐厅.mp4', 'video/mp4', './upload/video/source', '1626231727380.mp4', 90398289, 349692, 'http://localhost:8200/video?id=1626231727362', NULL, '1624546835299');
INSERT INTO `video` VALUES ('1626232870695', '光辉岁月', '1621553753077', 'http://localhost:8200/video/cover?id=1626232870695', '1623160763019', 4, 1, '2021-09-14 11:21:10', '2022-05-15 20:23:18', '光辉岁月.mp4', 'video/mp4', './upload/video/source', '1626232870718.mp4', 72119828, 292971, 'http://localhost:8200/video?id=1626232870695', NULL, '1624549442936');
INSERT INTO `video` VALUES ('1626233530174', '分飞', '1621553753077', 'http://localhost:8200/video/cover?id=1626233530174', '1623160763019', 4, 1, '2021-09-14 11:32:10', '2022-05-15 20:23:18', '分飞.mp4', 'video/mp4', './upload/video/source', '1626233530194.mp4', 30068160, 221286, 'http://localhost:8200/video?id=1626233530174', NULL, '1626233266278');
INSERT INTO `video` VALUES ('1626233743392', '好久不见', '1621553753077', 'http://localhost:8200/video/cover?id=1626233743392', '1623160763019', 4, 1, '2021-09-14 11:35:43', '2022-05-15 20:23:18', '好久不见.mp4', 'video/mp4', './upload/video/source', '1626233743410.mp4', 96409979, 247533, 'http://localhost:8200/video?id=1626233743392', NULL, '1625408572563');
INSERT INTO `video` VALUES ('1626233855865', '爱情转移', '1621553753077', 'http://localhost:8200/video/cover?id=1626233855865', '1623160763019', 1, 1, '2021-09-14 11:37:35', '2022-05-15 20:23:18', '爱情转移.mp4', 'video/mp4', './upload/video/source', '1626233855883.mp4', 8616142, 256070, 'http://localhost:8200/video?id=1626233855865', NULL, '1625408435039');
INSERT INTO `video` VALUES ('1626273942317', 'Lovesick Girls', '1626253954965', 'http://localhost:8200/video/cover?id=1626273942317', '1623160769739', 10, 1, '2021-09-14 22:45:42', '2022-05-15 20:23:18', 'BLACKPINK - \'Lovesick Girls\' DANCE PRACTICE VIDEO.mp4', 'video/mp4', './upload/video/source', '1626273942333.mp4', 57940440, 197951, 'http://localhost:8200/video?id=1626273942317', NULL, '1626272881558');
INSERT INTO `video` VALUES ('1626274452647', 'Permission to Dance', '1626253954965', 'http://localhost:8200/video/cover?id=1626274452647', '1623160769739', 1, 1, '2021-09-14 22:54:12', '2022-05-15 20:23:18', 'BTS (방탄소년단) \'Permission to Dance\' Official MV.mp4', 'video/mp4', './upload/video/source', '1626274452665.mp4', 38183160, 299468, 'http://localhost:8200/video?id=1626274452647', NULL, '1626274222518');
INSERT INTO `video` VALUES ('1626360804975', 'Rage your dream', '1621553753077', 'http://localhost:8200/video/cover?id=1626360804975', '1623160774837', 8, 1, '2021-09-15 22:53:24', '2022-05-15 20:23:18', 'your dream.mp4', 'video/mp4', './upload/video/source', '1626360804991.mp4', 14977308, 283794, 'http://localhost:8200/video?id=1626360804975', NULL, '1626360701597');
INSERT INTO `video` VALUES ('1633919475129', '遇见', '1621554155356', 'http://localhost:8200/video/cover?id=1633919475129', '1623160763019', 11, 1, '2021-10-11 10:31:15', '2022-05-15 20:23:18', '遇见.mp4', 'video/mp4', './upload/video/source', '1633919475144.mp4', 57762138, 207509, 'http://localhost:8200/video?id=1633919475129', NULL, '1633919156741');
INSERT INTO `video` VALUES ('1633947139857', '千千阙歌', '1621553753077', 'http://localhost:8200/video/cover?id=1633947139857', '1623160763019', 10, 1, '2021-10-11 18:12:19', '2022-05-15 20:23:18', '392091001-1-208.mp4', 'video/mp4', './upload/video/source', '1633947139878.mp4', 81762735, 294997, 'http://localhost:8200/video?id=1633947139857', NULL, '1633946866771');
INSERT INTO `video` VALUES ('1634532125851', '有何不可', '1621553753077', 'http://localhost:8200/video/cover?id=1634532125851', '1623160763019', 6, 1, '2021-10-18 12:42:05', '2022-05-26 15:03:25', '180798224-1-208.mp4', 'video/mp4', './upload/video/source', '1634532125866.mp4', 95571570, 238230, 'http://localhost:8200/video?id=1634532125851', NULL, '1634531821765');
INSERT INTO `video` VALUES ('1634532454509', '徐良词曲！叶洛洛演唱国风原创《兰若雨》', '1621553753077', 'http://localhost:8200/video/cover?id=1634532454509', '1623160684310', 3, 0, '2021-10-18 12:47:34', '2022-05-15 20:23:18', '253657465-1-208.mp4', 'video/mp4', './upload/video/source', '1634532454533.mp4', 72082241, 218518, 'http://localhost:8200/video?id=1634532454509', '徐良词曲！叶洛洛演唱国风原创《兰若雨》', NULL);
INSERT INTO `video` VALUES ('1634532704420', '清明上河图', '1621553753077', 'http://localhost:8200/video/cover?id=1634532704420', '1623160684310', 2, 0, '2021-10-18 12:51:44', '2022-05-15 20:23:18', '114270799-1-208.mp4', 'video/mp4', './upload/video/source', '1634532704441.mp4', 72322586, 273302, 'http://localhost:8200/video?id=1634532704420', '这次，《清明上河图》“锦”上添花', NULL);
INSERT INTO `video` VALUES ('1634532943030', ' All Falls Down', '1621553753077', 'http://localhost:8200/video/cover?id=1634532943030', '1623160657342', 2, 0, '2021-10-18 12:55:43', '2022-05-15 20:23:18', '246314711-1-208.mp4', 'video/mp4', './upload/video/source', '1634532943055.mp4', 49674408, 204032, 'http://localhost:8200/video?id=1634532943030', 'Alan Walker - All Falls Down 官方MV (ft. Noah Cyrus with Digital Farm Animals)', NULL);
INSERT INTO `video` VALUES ('1634533182631', '审判', '1621553753077', 'http://localhost:8200/video/cover?id=1634533182631', '1623160698802', 13, 0, '2021-10-18 12:59:42', '2022-05-15 20:23:18', '52319198-1-192.mp4', 'video/mp4', './upload/video/source', '1634533182650.mp4', 41415701, 288320, 'http://localhost:8200/video?id=1634533182631', '继《请把女儿嫁给我》之后，又一首日本洗脑Rap神曲——《审判》', NULL);
INSERT INTO `video` VALUES ('1634533890069', 'butter', '1621553753077', 'http://localhost:8200/video/cover?id=1634533890069', '1623160732045', 22, 0, '2021-10-18 13:11:30', '2022-05-15 20:23:18', '355682525-1-208.mp4', 'video/mp4', './upload/video/source', '1634533890087.mp4', 67637356, 196459, 'http://localhost:8200/video?id=1634533890069', '史上最迷你防弹BTS‘Butter’ 高还原度', NULL);
INSERT INTO `video` VALUES ('1635301875892', '电 音 喜 羊 羊', '1626267479156', 'http://localhost:8200/video/cover?id=1635301875892', '1623160657342', 29, 0, '2021-10-27 10:31:15', '2022-05-15 20:23:18', '118395379-1-208.mp4', 'video/mp4', './upload/video/source', '1635301875923.mp4', 19097094, 130774, 'http://localhost:8200/video?id=1635301875892', '中西合璧，羊羊得意', NULL);
INSERT INTO `video` VALUES ('1635302223635', '唢呐带你上高速，闫永强唢呐电音版《The Spectre》 打开新世界', '1626267479156', 'http://localhost:8200/video/cover?id=1635302223635', '1623160657342', 6, 0, '2021-10-27 10:37:03', '2022-05-15 20:23:18', '211345359-1-208.mp4', 'video/mp4', './upload/video/source', '1635302223655.mp4', 38723866, 95638, 'http://localhost:8200/video?id=1635302223635', '唢呐带你上高速，来自上海音乐学院唢呐专业第一名的强哥——闫永强，放话“谁敢选我谁就是最强Fman”，快来和鹅一起云蹦迪！', NULL);
INSERT INTO `video` VALUES ('1635339720965', '淋雨一直走', '1621553753077', 'http://localhost:8200/video/cover?id=1635339720965', '1623160763019', 6, 1, '2021-10-27 21:02:00', '2022-05-15 20:23:18', '18616419-1-208.mp4', 'video/mp4', './upload/video/source', '1635339720980.mp4', 50736866, 216695, 'http://localhost:8200/video?id=1635339720965', NULL, '1633946260220');
INSERT INTO `video` VALUES ('1635429046087', 'again', '1621553753077', 'http://localhost:8200/video/cover?id=1635429046087', '1623160774837', 2, 1, '2021-10-28 21:50:46', '2022-05-15 20:23:18', '128477708-1-192.mp4', 'video/mp4', './upload/video/source', '1635429046109.mp4', 67628020, 252331, 'http://localhost:8200/video?id=1635429046087', NULL, '1634458012381');
INSERT INTO `video` VALUES ('1635504051409', 'Counting Stars', '1622167044223', 'http://localhost:8200/video/cover?id=1635504051409', '1623160724807', 2, 0, '2021-10-29 18:40:51', '2022-05-15 20:23:18', '432356068-1-208.mp4', 'video/mp4', './upload/video/source', '1635504051426.mp4', 101969321, 276416, 'http://localhost:8200/video?id=1635504051409', '共和时代《Counting Stars》核能现场！一起来数星星吧！', NULL);
INSERT INTO `video` VALUES ('1635504576446', '断眉查理普斯和后街男孩饶舌互怼，场面异常的紧张刺激', '1622167044223', 'http://localhost:8200/video/cover?id=1635504576446', '1623160698802', 5, 0, '2021-10-29 18:49:36', '2022-05-26 14:55:24', 'cha.mp4', 'video/mp4', './upload/video/source', '1635504576469.mp4', 16225732, 307374, 'http://localhost:8200/video?id=1635504576446', '断眉查理普斯和后街男孩饶舌互怼，场面异常的紧张刺激', NULL);
INSERT INTO `video` VALUES ('1635505000744', 'We Dont Talk Anymore', '1622167044223', 'http://localhost:8200/video/cover?id=1635505000744', '1623160724807', 1, 0, '2021-10-29 18:56:40', '2022-05-15 20:23:18', '42306545_da2-1-6.mp4', 'video/mp4', './upload/video/source', '1635505000762.mp4', 5348875, 184041, 'http://localhost:8200/video?id=1635505000744', '查理普斯联手赛琳娜·戈麦斯演绎热门单曲We Dont Talk Anymore,精彩演唱会合唱版本', NULL);
INSERT INTO `video` VALUES ('1635505223574', '慕夏', '1622167044223', 'http://localhost:8200/video/cover?id=1635505223574', '1623160707116', 6, 0, '2021-10-29 19:00:23', '2022-05-15 20:23:18', '慕夏.mp4', 'video/mp4', './upload/video/source', '1635505223590.mp4', 69114524, 170347, 'http://localhost:8200/video?id=1635505223574', '《慕夏》动漫MV-等什么君', NULL);
INSERT INTO `video` VALUES ('1635505388432', 'My Soul', '1622167044223', 'http://localhost:8200/video/cover?id=1635505388432', '1623160691774', 9, 0, '2021-10-29 19:03:08', '2022-05-15 20:23:18', '115098415-1-208.mp4', 'video/mp4', './upload/video/source', '1635505388447.mp4', 92515761, 228502, 'http://localhost:8200/video?id=1635505388432', '治愈音乐《My Soul》曾经循环无数次的音乐', NULL);
INSERT INTO `video` VALUES ('1635508469891', '白月光与朱砂痣', '1622167044223', 'http://localhost:8200/video/cover?id=1635508469891', '1623160707116', 10, 0, '2021-10-29 19:54:29', '2022-05-15 20:23:18', '280009221-1-208.mp4', 'video/mp4', './upload/video/source', '1635508469909.mp4', 43944208, 207382, 'http://localhost:8200/video?id=1635508469891', '大籽《白月光与朱砂痣》完整版', NULL);
INSERT INTO `video` VALUES ('1635680912753', 'see you again', '1635679207853', 'http://localhost:8200/video/cover?id=1635680912753', '1623160781152', 2, 1, '2021-10-31 19:48:32', '2022-05-15 20:23:18', 'see you again.mp4', 'video/mp4', './upload/video/source', '1635680912770.mp4', 53357184, 228181, 'http://localhost:8200/video?id=1635680912753', NULL, '1635680515627');
INSERT INTO `video` VALUES ('1635681182331', 'We Don\'t Talk Anymore', '1635679207853', 'http://localhost:8200/video/cover?id=1635681182331', '1623160781152', 1, 1, '2021-10-31 19:53:02', '2022-05-15 20:23:18', 'we.mp4', 'video/mp4', './upload/video/source', '1635681182351.mp4', 41814199, 230551, 'http://localhost:8200/video?id=1635681182331', NULL, '1635680608268');
INSERT INTO `video` VALUES ('1635682038475', '起风了', '1635679207853', 'http://localhost:8200/video/cover?id=1635682038475', '1623160724807', 4, 0, '2021-10-31 20:07:18', '2022-05-15 20:23:18', '起风了.mp4', 'video/mp4', './upload/video/source', '1635682038490.mp4', 114237987, 309291, 'http://localhost:8200/video?id=1635682038475', '《起风了》是电视剧《加油，你是最棒的》主题曲，由高桥优作曲，米果作词，吴青峰演唱', NULL);
INSERT INTO `video` VALUES ('1635686390194', 'S.H.E成名曲《Super Star》', '1635679207853', 'http://localhost:8200/video/cover?id=1635686390194', '1623160647312', 482, 0, '2021-10-31 21:19:50', '2022-05-26 15:16:52', '55193133-1-192.mp4', 'video/mp4', './upload/video/source', '1635686390211.mp4', 57290680, 231062, 'http://localhost:8200/video?id=1635686390194', 'S.H.E成名曲《Super Star》，曾经火遍大江南北的神曲！', NULL);
INSERT INTO `video` VALUES ('1635686660644', 'for him', '1635679207853', 'http://localhost:8200/video/cover?id=1635686660644', '1623160647312', 168, 0, '2021-10-31 21:24:20', '2022-05-15 20:23:18', '371097743-1-208.mp4', 'video/mp4', './upload/video/source', '1635686660663.mp4', 68896719, 258859, 'http://localhost:8200/video?id=1635686660644', '戳爷《for him.》超清现场！！！ 特洛耶·希文', NULL);
INSERT INTO `video` VALUES ('1635687185570', 'unnatural×Lemon', '1635679207853', 'http://localhost:8200/video/cover?id=1635687185570', '1623160647312', 20, 0, '2021-10-31 21:33:05', '2022-05-15 20:23:18', '33327178-1-192.mp4', 'video/mp4', './upload/video/source', '1635687185587.mp4', 61763459, 249404, 'http://localhost:8200/video?id=1635687185570', 'Youtube上播放量3.89亿的Lemon是什么样子的？', NULL);
INSERT INTO `video` VALUES ('1635687874954', 'One Day', '1635679207853', 'http://localhost:8200/video/cover?id=1635687874954', '1623160647312', 6, 0, '2021-10-31 21:44:34', '2022-05-26 14:58:39', '34623674-1-208.mp4', 'video/mp4', './upload/video/source', '1635687874982.mp4', 139420696, 344720, 'http://localhost:8200/video?id=1635687874954', '曾经在Youtube上风靡全球的一则正能量MV，Matisyahu《One Day》', NULL);
INSERT INTO `video` VALUES ('1635861806203', '海阔天空', '1635679207853', 'http://localhost:8200/video/cover?id=1635861806203', '1623160647312', 2, 0, '2021-11-02 22:03:26', '2022-05-15 20:23:18', '开阔天空.mp4', 'video/mp4', './upload/video/source', '1635861806231.mp4', 54415098, 202411, 'http://localhost:8200/video?id=1635861806203', 'Beyond《海阔天空》神级现场！纪念黄家驹！', NULL);
INSERT INTO `video` VALUES ('1635861963725', '田馥甄《小幸运》万人大合唱现场！', '1635679207853', 'http://localhost:8200/video/cover?id=1635861963725', '1623160647312', 5, 0, '2021-11-02 22:06:03', '2022-05-15 20:23:18', '小幸运.mp4', 'video/mp4', './upload/video/source', '1635861963742.mp4', 88216129, 264277, 'http://localhost:8200/video?id=1635861963725', '田馥甄《小幸运》万人大合唱现场！青春是一场旅行！', NULL);
INSERT INTO `video` VALUES ('1635862232233', '苏打绿《小情歌》', '1635679207853', 'http://localhost:8200/video/cover?id=1635862232233', '1623160647312', 5, 0, '2021-11-02 22:10:32', '2022-05-15 20:23:18', '情歌.mp4', 'video/mp4', './upload/video/source', '1635862232250.mp4', 90804928, 246720, 'http://localhost:8200/video?id=1635862232233', '苏打绿《小情歌》万人大合唱现场！突然泪流满面！', NULL);
INSERT INTO `video` VALUES ('1635862364296', 'Yesterday Once More', '1635679207853', 'http://localhost:8200/video/cover?id=1635862364296', '1623160647312', 3, 0, '2021-11-02 22:12:44', '2022-05-26 14:58:53', 'yesterday.mp4', 'video/mp4', './upload/video/source', '1635862364311.mp4', 27052372, 233433, 'http://localhost:8200/video?id=1635862364296', '卡朋特乐队《Yesterday Once More》奥斯卡金曲！爷青回！', NULL);
INSERT INTO `video` VALUES ('1635862727342', '我的名字叫伊莲', '1635679207853', 'http://localhost:8200/video/cover?id=1635862727342', '1623160647312', 15, 0, '2021-11-02 22:18:47', '2022-05-26 14:38:15', '伊莲.mp4', 'video/mp4', './upload/video/source', '1635862727357.mp4', 68347497, 226500, 'http://localhost:8200/video?id=1635862727342', '经典法语歌曲《我的名字叫伊莲》，配上苏菲玛索，唯美又动听！', NULL);
INSERT INTO `video` VALUES ('1635863182476', 'Daniel Powter《Free Loop》', '1635679207853', 'http://localhost:8200/video/cover?id=1635863182476', '1623160647312', 9, 0, '2021-11-02 22:26:22', '2022-05-26 14:58:11', 'hard tot me.mp4', 'video/mp4', './upload/video/source', '1635863182500.mp4', 65672271, 221248, 'http://localhost:8200/video?id=1635863182476', 'Daniel Powter《Free Loop》MV 中英字幕 经典英文歌曲', NULL);
INSERT INTO `video` VALUES ('1635863782146', ' Time after time ～ 在落花纷飞的街道上 ～', '1635679207853', 'http://localhost:8200/video/cover?id=1635863782146', '1623160647312', 6, 0, '2021-11-02 22:36:22', '2022-05-15 20:23:18', 'time after time.mp4', 'video/mp4', './upload/video/source', '1635863782165.mp4', 16455320, 247246, 'http://localhost:8200/video?id=1635863782146', '名侦探柯南剧场版主题曲07 Time after time ～ 在落花纷飞的街道上 ～', NULL);
INSERT INTO `video` VALUES ('1636028032035', 'Junsun Yoo编舞Uptown Funk', '1635685284424', 'http://localhost:8200/video/cover?id=1636028032035', '1623160647312', 3, 0, '2021-11-04 20:13:52', '2022-05-15 20:23:18', '27693731-1-208.mp4', 'video/mp4', './upload/video/source', '1636028032058.mp4', 101328889, 300523, 'http://localhost:8200/video?id=1636028032035', '舞者: Junsun Yoo\n歌曲名: Uptown Funk\n简介: 【1M】Junsun Yoo编舞Uptown Funk', NULL);
INSERT INTO `video` VALUES ('1636028601995', '经典日漫《龙珠》主题曲', '1635685284424', 'http://localhost:8200/video/cover?id=1636028601995', '1623160647312', 61, 0, '2021-11-04 20:23:21', '2022-05-26 14:23:46', '龙珠.mp4', 'video/mp4', './upload/video/source', '1636028602016.mp4', 88779626, 232641, 'http://localhost:8200/video?id=1636028601995', '经典日漫《龙珠》主题曲，勾起多少童年的回忆啊！', NULL);
INSERT INTO `video` VALUES ('1636029265659', '渔舟唱晚', '1622167044223', 'http://localhost:8200/video/cover?id=1636029265659', '1623160647312', 8, 0, '2021-11-04 20:34:25', '2022-05-15 20:23:18', '渔舟唱晚.mp4', 'video/mp4', './upload/video/source', '1636029265677.mp4', 52522971, 142976, 'http://localhost:8200/video?id=1636029265659', '一首《渔舟唱晚》配上年代感的画面，前奏响起那刻，回忆涌上心头', NULL);
INSERT INTO `video` VALUES ('1636029682642', '怨苍天变了心', '1622167044223', 'http://localhost:8200/video/cover?id=1636029682642', '1623160647312', 15, 0, '2021-11-04 20:41:22', '2022-05-15 20:23:18', '怨苍天变了心.mp4', 'video/mp4', './upload/video/source', '1636029682665.mp4', 87958020, 238720, 'http://localhost:8200/video?id=1636029682642', '周星驰，巩俐《怨苍天变了心》', NULL);
INSERT INTO `video` VALUES ('1636030025087', '《New Boy》', '1622167044223', 'http://localhost:8200/video/cover?id=1636030025087', '1623160647312', 10, 0, '2021-11-04 20:47:05', '2022-05-15 20:23:18', 'New Boy房东的猫陈婧霏.mp4', 'video/mp4', './upload/video/source', '1636030025106.mp4', 93468903, 253330, 'http://localhost:8200/video?id=1636030025087', 'New Boy》房东的猫/陈婧霏', NULL);
INSERT INTO `video` VALUES ('1636272273336', '传销现场，日本网红最强洗脑神曲《把女儿嫁给我吧》', '1621586669402', 'http://localhost:8200/video/cover?id=1636272273336', '1623160698802', 10, 0, '2021-11-07 16:04:33', '2022-05-15 20:23:18', '请把女儿嫁给我.mp4', 'video/mp4', './upload/video/source', '1636272273358.mp4', 65364835, 322247, 'http://localhost:8200/video?id=1636272273336', '《把女儿嫁给我》日本网红EGU-SPLOSION，新年最强洗脑神曲。听一遍我就在跟着哼了。', NULL);
INSERT INTO `video` VALUES ('1636272552801', '《I Wish》 by Tom MacDonald', '1621586669402', 'http://localhost:8200/video/cover?id=1636272552801', '1623160698802', 0, 0, '2021-11-07 16:09:12', '2022-05-15 20:23:18', 'i whish.mp4', 'video/mp4', './upload/video/source', '1636272552818.mp4', 31887036, 214204, 'http://localhost:8200/video?id=1636272552801', '超治愈人心的说唱《I Wish》 by Tom MacDonald', NULL);
INSERT INTO `video` VALUES ('1636352900663', '《Love Me Like You Do》', '1621586602550', 'http://localhost:8200/video/cover?id=1636352900663', '1623160647312', 12, 0, '2021-11-08 14:28:20', '2022-05-15 20:23:18', 'like memp4.mp4', 'video/mp4', './upload/video/source', '1636352900683.mp4', 72887104, 249237, 'http://localhost:8200/video?id=1636352900663', '红遍全球的经典神曲《Love Me Like You Do》第一次听就爱上了！', NULL);
INSERT INTO `video` VALUES ('1636353273700', 'Pháo,KAIZ - 2 Phút Hơn (KAIZ Remix)', '1621586602550', 'http://localhost:8200/video/cover?id=1636353273700', '1623160657342', 6, 0, '2021-11-08 14:34:33', '2022-05-15 20:23:18', 'phao.mp4', 'video/mp4', './upload/video/source', '1636353273715.mp4', 38349548, 181812, 'http://localhost:8200/video?id=1636353273700', 'Pháo / KAIZ', NULL);
INSERT INTO `video` VALUES ('1640503572319', '经典歌曲《人生何处不相逢》，歌词太美了，让人回味无穷！', '1640497948238', 'http://localhost:8200/video/cover?id=1640503572319', '1623160647312', 9, 0, '2021-12-26 15:26:12', '2022-05-15 20:23:18', '461501970-1-208.mp4', 'video/mp4', './upload/video/source', '1640503572347.mp4', 63128062, 194880, 'http://localhost:8200/video?id=1640503572319', '经典歌曲《人生何处不相逢》，歌词太美了，让人回味无穷！', NULL);
INSERT INTO `video` VALUES ('1640503937398', '伍佰《再度重相逢》神级现场！DNA真的动了！', '1640497948238', 'http://localhost:8200/video/cover?id=1640503937398', '1623160647312', 16, 0, '2021-12-26 15:32:17', '2022-05-15 20:23:18', '341751504-1-208.mp4', 'video/mp4', './upload/video/source', '1640503937417.mp4', 75960907, 215000, 'http://localhost:8200/video?id=1640503937398', '这个《再度重相逢》，也只有伍佰唱有内味\n夏天了，突然发现电脑烫的让人心有点慌', NULL);
INSERT INTO `video` VALUES ('1640504400561', '五月天《温柔》核能现场！五月当然要听五月天！', '1640498317915', 'http://localhost:8200/video/cover?id=1640504400561', '1623160647312', 1, 0, '2021-12-26 15:40:00', '2022-05-15 20:23:18', '283105875-1-208.mp4', 'video/mp4', './upload/video/source', '1640504400580.mp4', 99510502, 270833, 'http://localhost:8200/video?id=1640504400561', '《温柔》核能现场', NULL);
INSERT INTO `video` VALUES ('1640504921941', '重返20岁—没人打开的记忆 是你曾经的辛苦', '1621586602550', 'http://localhost:8200/video/cover?id=1640504921941', '1623160647312', 12, 0, '2021-12-26 15:48:41', '2022-05-15 20:23:18', '138213461-1-192.mp4', 'video/mp4', './upload/video/source', '1640504921956.mp4', 39676512, 206800, 'http://localhost:8200/video?id=1640504921941', '伴随着杨子姗微低沉的嗓音唱出的《微甜的回忆》，穿插着对过往的回忆，使每个人都会想到自己曾经的努力、辛苦、不容易。歌词很应景，很感人。', NULL);
INSERT INTO `video` VALUES ('1640505141762', '《重返20岁》主题曲MV 鹿晗献唱“我们的明天”', '1640498317915', 'http://localhost:8200/video/cover?id=1640505141762', '1623160647312', 7, 0, '2021-12-26 15:52:21', '2022-05-15 20:23:18', '302575958-1-160.mp4', 'video/mp4', './upload/video/source', '1640505141779.mp4', 15944870, 250206, 'http://localhost:8200/video?id=1640505141762', '由陈正道执导，“薇女郎”杨子姗、金马影后归亚蕾、“大仁哥”陈柏霖及超人气偶像鹿晗领衔主演的奇幻爱情喜剧《重返20岁》将于2015年1月15日正式公映，爆笑开年。《重返20岁》发布主题曲MV，这也是鹿晗首次为电影主题曲献声。', NULL);
INSERT INTO `video` VALUES ('1642497372188', '鼓楼', '1621553753077', 'http://localhost:8200/video/cover?id=1642497372188', '1623160763019', 2, 1, '2022-01-18 17:16:12', '2022-05-15 20:23:18', '243932563-1-208.mp4', 'video/mp4', './upload/video/source', '1642497372210.mp4', 91804578, 255605, 'http://localhost:8200/video?id=1642497372188', NULL, '1624546108864');
INSERT INTO `video` VALUES ('1643433187416', '最近超火的这首《山楂树之恋》真的可以单曲循环一整天！', '1640498317915', 'http://localhost:8200/video/cover?id=1643433187416', '1623160647312', 3, 0, '2022-01-29 13:13:07', '2022-05-15 20:23:18', '山楂树之恋.mp4', 'video/mp4', './upload/video/source', '1643433187465.mp4', 74926520, 184214, 'http://localhost:8200/video?id=1643433187416', '最近超火的这首《山楂树之恋》真的可以单曲循环一整天！', NULL);
INSERT INTO `video` VALUES ('1643433469235', '原版《起风了》买辣椒也用券', '1640498317915', 'http://localhost:8200/video/cover?id=1643433469235', '1623160647312', 7, 0, '2022-01-29 13:17:49', '2022-05-15 20:23:18', '起风了.mp4', 'video/mp4', './upload/video/source', '1643433469257.mp4', 101927701, 309141, 'http://localhost:8200/video?id=1643433469235', '我终将青春还给了她 连同指尖弹出的盛夏', NULL);
INSERT INTO `video` VALUES ('1643433735031', '别 人 家 的 龙', '1640498317915', 'http://localhost:8200/video/cover?id=1643433735031', '1623160657342', 43, 0, '2022-01-29 13:22:15', '2022-05-26 15:05:06', '389556275-1-208.mp4', 'video/mp4', './upload/video/source', '1643433735061.mp4', 41058367, 122261, 'http://localhost:8200/video?id=1643433735031', '伊露露的__看久也就接受了，果然可爱可以战胜一切！', NULL);
INSERT INTO `video` VALUES ('1643455054797', 'call me baby', '1621553753077', 'http://localhost:8200/video/cover?id=1643455054797', '1623160769739', 14, 1, '2022-01-29 19:17:34', '2022-05-15 20:23:18', '59289663-1-208.mp4', 'video/mp4', './upload/video/source', '1643455054829.mp4', 94572670, 236596, 'http://localhost:8200/video?id=1643455054797', NULL, '1643454792066');
INSERT INTO `video` VALUES ('1643879245050', '一个像夏天，一个像秋天', '1621553753077', 'http://localhost:8200/video/cover?id=1643879245050', '1623160763019', 28, 1, '2022-02-03 17:07:25', '2022-05-15 20:23:18', '一个像.mp4', 'video/mp4', './upload/video/source', '1643879245070.mp4', 16861061, 248320, 'http://localhost:8200/video?id=1643879245050', NULL, '1643436188086');
INSERT INTO `video` VALUES ('1643939608960', '一路生花', '1621553753077', 'http://localhost:8200/video/cover?id=1643939608960', '1623160763019', 30, 1, '2022-02-04 09:53:28', '2022-05-15 20:23:18', '442946055-1-208.mp4', 'video/mp4', './upload/video/source', '1643939608975.mp4', 53262251, 256811, 'http://localhost:8200/video?id=1643939608960', '坚守是', '1643938595197');
INSERT INTO `video` VALUES ('1643940488762', 'I Hate Myself for Loving You', '1621553753077', 'http://localhost:8200/video/cover?id=1643940488762', '1623160647312', 1, 0, '2022-02-04 10:08:08', '2022-05-15 20:23:18', '472513928-1-208.mp4', 'video/mp4', './upload/video/source', '1643940488783.mp4', 84767788, 245760, 'http://localhost:8200/video?id=1643940488762', '80年代摇滚女王经典之作《I Hate Myself for Loving You》好听', NULL);
INSERT INTO `video` VALUES ('1644286690856', 'Taylor Swift | 你是我见过最美的心碎之夏/Cruel Summer', '1621586602550', 'http://localhost:8200/video/cover?id=1644286690856', '1623160647312', 29, 0, '2022-02-08 10:18:10', '2022-05-15 20:23:18', '泰勒斯威夫特.mp4', 'video/mp4', './upload/video/source', '1644286690876.mp4', 71194870, 175680, 'http://localhost:8200/video?id=1644286690856', '真的全专无粪曲，我敢说自lover她就一直在突破自己的极限', NULL);
INSERT INTO `video` VALUES ('1644299720534', '周深 郭沁 大鱼海棠主题曲《大鱼》 超级好听！！空灵！', '1621553753077', 'http://localhost:8200/video/cover?id=1644299720534', '1623160647312', 3, 0, '2022-02-08 13:55:20', '2022-05-15 20:23:18', '大鱼海棠.mp4', 'video/mp4', './upload/video/source', '1644299720558.mp4', 73746142, 259088, 'http://localhost:8200/video?id=1644299720534', '这个现场版的大鱼最出色     音色    画面感    和声都远可挑剔。已听不数次', NULL);
INSERT INTO `video` VALUES ('1644375749656', '爱你三千遍》原曲《Monsters》I love you three thousand', '1640497948238', 'http://localhost:8200/video/cover?id=1644375749656', '1623160647312', 2, 0, '2022-02-09 11:02:29', '2022-05-15 20:23:18', '112436589-1-208.mp4', 'video/mp4', './upload/video/source', '1644375749676.mp4', 72490055, 222102, 'http://localhost:8200/video?id=1644375749656', '复联4原盘出来了，又出现看了几遍，这个视频熬了好久才终于弄出来的，I love you three thousand。', NULL);
INSERT INTO `video` VALUES ('1644586646938', 'Blueming', '1621553753077', 'http://localhost:8200/video/cover?id=1644586646938', '1623160769739', 10, 1, '2022-02-11 21:37:26', '2022-05-15 20:23:18', '196078005-1-208.mp4', 'video/mp4', './upload/video/source', '1644586646965.mp4', 93900720, 246401, 'http://localhost:8200/video?id=1644586646938', NULL, '1643880947532');
INSERT INTO `video` VALUES ('1644586859539', ' 僕が死のうと思ったのは ', '1621553753077', 'http://localhost:8200/video/cover?id=1644586859539', '1623160774837', 0, 1, '2022-02-11 21:40:59', '2022-05-15 20:23:18', '101298659-1-192.mp4', 'video/mp4', './upload/video/source', '1644586859559.mp4', 60541300, 380273, 'http://localhost:8200/video?id=1644586859539', NULL, '1635508957215');
INSERT INTO `video` VALUES ('1648269109899', 'Time after Time', '1645620606883', 'http://localhost:8200/video/cover?id=1648269109899', '1623160774837', 1, 1, '2022-03-26 12:31:49', '2022-05-15 20:23:18', '175525923-1-160.mp4', 'video/mp4', './upload/video/source', '1648269109926.mp4', 16455320, 247246, 'http://localhost:8200/video?id=1648269109899', NULL, '1635429386379');
INSERT INTO `video` VALUES ('1648269327758', 'monsters', '1645620606883', 'http://localhost:8200/video/cover?id=1648269327758', '1623160781152', 2, 1, '2022-03-26 12:35:27', '2022-05-15 20:23:18', '448187819-1-208.mp4', 'video/mp4', './upload/video/source', '1648269327778.mp4', 61139146, 217963, 'http://localhost:8200/video?id=1648269327758', NULL, '1644375432188');
INSERT INTO `video` VALUES ('1648269508558', '和光同尘', '1645620606883', 'http://localhost:8200/video/cover?id=1648269508558', '1623160763019', 4, 1, '2022-03-26 12:38:28', '2022-05-15 20:23:18', '267239297-1-208.mp4', 'video/mp4', './upload/video/source', '1648269508588.mp4', 48886733, 247897, 'http://localhost:8200/video?id=1648269508558', NULL, '1647143678810');
INSERT INTO `video` VALUES ('1648270710019', 'Butter-Fly', '1645620606883', 'http://localhost:8200/video/cover?id=1648270710019', '1623160774837', 3, 1, '2022-03-26 12:58:30', '2022-05-15 20:23:18', '133191492-1-208.mp4', 'video/mp4', './upload/video/source', '1648270710037.mp4', 163732727, 403803, 'http://localhost:8200/video?id=1648270710019', NULL, '1648270454571');
INSERT INTO `video` VALUES ('1648272232969', '麻雀', '1645620606883', 'http://localhost:8200/video/cover?id=1648272232969', '1623160763019', 4, 1, '2022-03-26 13:23:52', '2022-05-15 20:23:18', '134533761-1-208.mp4', 'video/mp4', './upload/video/source', '1648272232985.mp4', 49064314, 268096, 'http://localhost:8200/video?id=1648272232969', NULL, '1648208054434');
INSERT INTO `video` VALUES ('1650009471674', '水中花', '1645620606883', 'http://localhost:8200/video/cover?id=1650009471674', '1623160763019', 30, 1, '2022-04-15 15:57:51', '2022-05-26 15:03:57', '432994544-1-208.mp4', 'video/mp4', './upload/video/source', '1650009471692.mp4', 56324848, 226673, 'http://localhost:8200/video?id=1650009471674', NULL, '1649982278381');
INSERT INTO `video` VALUES ('1650159060727', '超好听的樱花泪 Sakura Tearsチェリーの', '1621586602550', 'http://localhost:8200/video/cover?id=1650159060727', '1623160691774', 5, 0, '2022-04-17 09:31:00', '2022-05-15 20:23:18', '194822809-1-208.mp4', 'video/mp4', './upload/video/source', '1650159060750.mp4', 11186056, 182102, 'http://localhost:8200/video?id=1650159060727', '超好听的樱花泪 Sakura Tearsチェリーの涙动漫音乐 动漫歌曲纯音乐慢节奏摇滚 夜深人静睡觉的心灵曲 电音', NULL);
INSERT INTO `video` VALUES ('1650159272328', '<赤伶>张含韵戏腔绝了 可塑性太强了', '1621586602550', 'http://localhost:8200/video/cover?id=1650159272328', '1623160707116', 5, 0, '2022-04-17 09:34:32', '2022-05-15 20:23:18', '418283729-1-208.mp4', 'video/mp4', './upload/video/source', '1650159272341.mp4', 70432374, 204010, 'http://localhost:8200/video?id=1650159272328', '20210921 无锡光影音乐节 开幕式 现场全开麦演唱', NULL);
INSERT INTO `video` VALUES ('1650159394116', '汪六六 1080p MV完整版 (人静的雨夜想起了她，我多想回到家乡...)', '1621586602550', 'http://localhost:8200/video/cover?id=1650159394116', '1623160732045', 7, 0, '2022-04-17 09:36:34', '2022-05-15 20:23:18', '510683083-1-208.mp4', 'video/mp4', './upload/video/source', '1650159394138.mp4', 65624381, 182579, 'http://localhost:8200/video?id=1650159394116', '人静的雨夜想起了她，我多想回到家乡...', NULL);
INSERT INTO `video` VALUES ('1650160286946', '蹲妹现场Carly Rae Jepsen - Curiosity (Live) Singapore Social', '1621586602550', 'http://localhost:8200/video/cover?id=1650160286946', '1623160724807', 3, 0, '2022-04-17 09:51:26', '2022-05-15 20:23:18', '17145790_da3-1-16.mp4', 'video/mp4', './upload/video/source', '1650160286967.mp4', 13995606, 265409, 'http://localhost:8200/video?id=1650160286946', '蹲妹现场Carly Rae Jepsen - Curiosity (Live) Singapore Social', NULL);
INSERT INTO `video` VALUES ('1650160491450', 'Five Hundred Miles', '1621586602550', 'http://localhost:8200/video/cover?id=1650160491450', '1623160647312', 3, 0, '2022-04-17 09:54:51', '2022-05-15 20:23:18', '69360718_da2-1-16.mp4', 'video/mp4', './upload/video/source', '1650160491470.mp4', 10916936, 207081, 'http://localhost:8200/video?id=1650160491450', '醉乡民谣」主题曲剪辑。愿漂泊的你，心有慰藉。。', NULL);
INSERT INTO `video` VALUES ('1650787448533', 'Trouble Maker', '1645620606883', 'http://localhost:8200/video/cover?id=1650787448533', '1623160769739', 1, 1, '2022-04-24 16:04:08', '2022-05-15 20:23:18', '45611618-1-208.mp4', 'video/mp4', './upload/video/source', '1650787448558.mp4', 89223106, 259755, 'http://localhost:8200/video?id=1650787448533', 'Trouble Maker', '1650524822781');
INSERT INTO `video` VALUES ('1651582837583', '爱的魔力', '1645620606883', 'http://localhost:8200/video/cover?id=1651582837583', '1623160647312', 4, 0, '2022-05-03 21:00:37', '2022-05-15 20:23:18', '421257292-1-208.mp4', 'video/mp4', './upload/video/source', '1651582837611.mp4', 64340814, 193195, 'http://localhost:8200/video?id=1651582837583', '爱的魔力-金莎', NULL);

-- ----------------------------
-- Table structure for video_cate
-- ----------------------------
DROP TABLE IF EXISTS `video_cate`;
CREATE TABLE `video_cate`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_cate
-- ----------------------------
INSERT INTO `video_cate` VALUES ('1623160647312', '流行', 0);
INSERT INTO `video_cate` VALUES ('1623160657342', '电音', 0);
INSERT INTO `video_cate` VALUES ('1623160684310', '古风', 0);
INSERT INTO `video_cate` VALUES ('1623160691774', '纯音乐', 0);
INSERT INTO `video_cate` VALUES ('1623160698802', '说唱', 0);
INSERT INTO `video_cate` VALUES ('1623160707116', '中国风', 0);
INSERT INTO `video_cate` VALUES ('1623160724807', '现场', 0);
INSERT INTO `video_cate` VALUES ('1623160732045', '翻唱', 0);
INSERT INTO `video_cate` VALUES ('1623160763019', '华语', 1);
INSERT INTO `video_cate` VALUES ('1623160769739', '韩国', 1);
INSERT INTO `video_cate` VALUES ('1623160774837', '日本', 1);
INSERT INTO `video_cate` VALUES ('1623160781152', '欧美', 1);
INSERT INTO `video_cate` VALUES ('1623160812537', '其它', 1);
INSERT INTO `video_cate` VALUES ('1645688965252', 'BGM', 0);
INSERT INTO `video_cate` VALUES ('1645700483820', '挪威', 1);

-- ----------------------------
-- Table structure for video_cover
-- ----------------------------
DROP TABLE IF EXISTS `video_cover`;
CREATE TABLE `video_cover`  (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vid` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `originalname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mimetype` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dest` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT 0,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vid`(`vid`) USING BTREE,
  CONSTRAINT `video_cover_ibfk_1` FOREIGN KEY (`vid`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_cover
-- ----------------------------
INSERT INTO `video_cover` VALUES ('1625050801925', '1625050801876', '278e1ebd68d8d662a3dc1728ac54af882b486b3d.jpg', 'image/jpeg', './upload/video/cover', '1625050801905.jpg', 1094598, '2021-06-30 19:00:01', '2021-06-30 19:00:01');
INSERT INTO `video_cover` VALUES ('1625051012171', '1625051012153', 'af8e444608f395f5b0f996174ed7955b56196f32.jpg', 'image/jpeg', './upload/video/cover', '1625051012170.jpg', 86400, '2021-06-30 19:03:32', '2021-06-30 19:03:32');
INSERT INTO `video_cover` VALUES ('1625051160920', '1625051160903', '46031684b62660053f1d47bae5c6b5497d8c2e94.jpg', 'image/jpeg', './upload/video/cover', '1625051160919.jpg', 88183, '2021-06-30 19:06:00', '2021-06-30 19:06:00');
INSERT INTO `video_cover` VALUES ('1625051322632', '1625051322616', 'f3a8afc4c30d403a0e2cdf6a49b2e60a7f14d5b1.jpg', 'image/jpeg', './upload/video/cover', '1625051322631.jpg', 46277, '2021-06-30 19:08:42', '2021-06-30 19:08:42');
INSERT INTO `video_cover` VALUES ('1625051433331', '1625051433306', 'ade19655a4f0dfa9c7f8418cf6cd31f1abe7f921.jpg', 'image/jpeg', './upload/video/cover', '1625051433329.jpg', 195396, '2021-06-30 19:10:33', '2021-06-30 19:10:33');
INSERT INTO `video_cover` VALUES ('1625051550863', '1625051550841', '7dca45cbdb0fec6007e599ca7293bf24638e6db6.jpg', 'image/jpeg', './upload/video/cover', '1625051550861.jpg', 180460, '2021-06-30 19:12:30', '2021-06-30 19:12:30');
INSERT INTO `video_cover` VALUES ('1625051913033', '1625051913014', 'e65bdf9121398ad88785a55294634a49926b7b17.jpg', 'image/jpeg', './upload/video/cover', '1625051913031.jpg', 158157, '2021-06-30 19:18:33', '2021-06-30 19:18:33');
INSERT INTO `video_cover` VALUES ('1625052103214', '1625052103190', 'aa3db06a26d11b14c1762e4d1f707f9fc190fdd2.jpg', 'image/jpeg', './upload/video/cover', '1625052103212.jpg', 255996, '2021-06-30 19:21:43', '2021-06-30 19:21:43');
INSERT INTO `video_cover` VALUES ('1625052377279', '1625052377257', '86615c7f34c341970271fa164a81ffb6a1ee04ce.jpg', 'image/jpeg', './upload/video/cover', '1625052377277.jpg', 82265, '2021-06-30 19:26:17', '2021-06-30 19:26:17');
INSERT INTO `video_cover` VALUES ('1625052620477', '1625052620454', 'a827b4ca33ad06f4bc035a316c467f6c1e6cb911.jpg', 'image/jpeg', './upload/video/cover', '1625052620475.jpg', 149005, '2021-06-30 19:30:20', '2021-06-30 19:30:20');
INSERT INTO `video_cover` VALUES ('1625053198250', '1625053198223', '60e34a2deda7ddac4806eb70f8c4cef294c41d17.jpg', 'image/jpeg', './upload/video/cover', '1625053198249.jpg', 143545, '2021-06-30 19:39:58', '2021-06-30 19:39:58');
INSERT INTO `video_cover` VALUES ('1625053488390', '1625053488369', 'f2a75ce983712abf11315ef17065acaf6df36cc7.jpg', 'image/jpeg', './upload/video/cover', '1625053488388.jpg', 129774, '2021-06-30 19:44:48', '2021-06-30 19:44:48');
INSERT INTO `video_cover` VALUES ('1625053676323', '1625053676298', '31dd7a0bbd7594926717ec138689156e395e888d.jpg', 'image/jpeg', './upload/video/cover', '1625053676321.jpg', 125699, '2021-06-30 19:47:56', '2021-06-30 19:47:56');
INSERT INTO `video_cover` VALUES ('1625053880088', '1625053880065', 'b52bfef3cc286a6180f0e4eabb6edb144440b47f.png', 'image/png', './upload/video/cover', '1625053880085.png', 639423, '2021-06-30 19:51:20', '2021-06-30 19:51:20');
INSERT INTO `video_cover` VALUES ('1625054132749', '1625054132725', '0a2182662991fe548b01a88e31659cc55e88a97f.jpg', 'image/jpeg', './upload/video/cover', '1625054132743.jpg', 749357, '2021-06-30 19:55:32', '2021-06-30 19:55:32');
INSERT INTO `video_cover` VALUES ('1625054331401', '1625054331380', '44b.jpg', 'image/jpeg', './upload/video/cover', '1625054331399.jpg', 3874, '2021-06-30 19:58:51', '2021-06-30 19:58:51');
INSERT INTO `video_cover` VALUES ('1625054670129', '1625054670111', '672ae.jpg', 'image/jpeg', './upload/video/cover', '1625054670128.jpg', 7092, '2021-06-30 20:04:30', '2021-06-30 20:04:30');
INSERT INTO `video_cover` VALUES ('1625054974103', '1625054974084', '99d4e6300abfac.jpg', 'image/jpeg', './upload/video/cover', '1625054974102.jpg', 5868, '2021-06-30 20:09:34', '2021-06-30 20:09:34');
INSERT INTO `video_cover` VALUES ('1625055161433', '1625055161411', '978473.jpg', 'image/jpeg', './upload/video/cover', '1625055161432.jpg', 7314, '2021-06-30 20:12:41', '2021-06-30 20:12:41');
INSERT INTO `video_cover` VALUES ('1625055245442', '1625055245420', '6af2.jpg', 'image/jpeg', './upload/video/cover', '1625055245440.jpg', 9798, '2021-06-30 20:14:05', '2021-06-30 20:14:05');
INSERT INTO `video_cover` VALUES ('1625055706176', '1625055706152', 'a88eff7e17.jpg', 'image/jpeg', './upload/video/cover', '1625055706174.jpg', 26546, '2021-06-30 20:21:46', '2021-06-30 20:21:46');
INSERT INTO `video_cover` VALUES ('1625055843103', '1625055843087', '5555.jpg', 'image/jpeg', './upload/video/cover', '1625055843102.jpg', 14132, '2021-06-30 20:24:03', '2021-06-30 20:24:03');
INSERT INTO `video_cover` VALUES ('1625056118844', '1625056118822', '05b9f3b750c3.jpg', 'image/jpeg', './upload/video/cover', '1625056118843.jpg', 7564, '2021-06-30 20:28:38', '2021-06-30 20:28:38');
INSERT INTO `video_cover` VALUES ('1625405773003', '1625405772980', 'b84524.jpg', 'image/jpeg', './upload/video/cover', '1625405773001.jpg', 12204, '2021-07-04 21:36:13', '2021-07-04 21:36:13');
INSERT INTO `video_cover` VALUES ('1626231160588', '1626231160557', 'spark fly.jpg', 'image/jpeg', './upload/video/cover', '1626231160585.jpg', 7220, '2021-07-14 10:52:40', '2021-07-14 10:52:40');
INSERT INTO `video_cover` VALUES ('1626231463423', '1626231463399', 'lost control.jpg', 'image/jpeg', './upload/video/cover', '1626231463421.jpg', 5918, '2021-07-14 10:57:43', '2021-07-14 10:57:43');
INSERT INTO `video_cover` VALUES ('1626231727384', '1626231727362', '吉姆餐厅.jpg', 'image/jpeg', './upload/video/cover', '1626231727382.jpg', 5080, '2021-07-14 11:02:07', '2021-07-14 11:02:07');
INSERT INTO `video_cover` VALUES ('1626232870725', '1626232870695', '光辉岁月.jpg', 'image/jpeg', './upload/video/cover', '1626232870722.jpg', 5238, '2021-07-14 11:21:10', '2021-07-14 11:21:10');
INSERT INTO `video_cover` VALUES ('1626233530197', '1626233530174', '分飞.jpg', 'image/jpeg', './upload/video/cover', '1626233530196.jpg', 4134, '2021-07-14 11:32:10', '2021-07-14 11:32:10');
INSERT INTO `video_cover` VALUES ('1626233743414', '1626233743392', '好久不见.jpg', 'image/jpeg', './upload/video/cover', '1626233743412.jpg', 6324, '2021-07-14 11:35:43', '2021-07-14 11:35:43');
INSERT INTO `video_cover` VALUES ('1626233855887', '1626233855865', '爱情转移.jpg', 'image/jpeg', './upload/video/cover', '1626233855886.jpg', 11372, '2021-07-14 11:37:35', '2021-07-14 11:37:35');
INSERT INTO `video_cover` VALUES ('1626273942336', '1626273942317', '8dbc2.jpg', 'image/jpeg', './upload/video/cover', '1626273942335.jpg', 6258, '2021-07-14 22:45:42', '2021-07-14 22:45:42');
INSERT INTO `video_cover` VALUES ('1626274452669', '1626274452647', '9565ccc37.jpg', 'image/jpeg', './upload/video/cover', '1626274452668.jpg', 12910, '2021-07-14 22:54:12', '2021-07-14 22:54:12');
INSERT INTO `video_cover` VALUES ('1626360804994', '1626360804975', 'your dream.jpg', 'image/jpeg', './upload/video/cover', '1626360804992.jpg', 10944, '2021-07-15 22:53:24', '2021-07-15 22:53:24');
INSERT INTO `video_cover` VALUES ('1633919475148', '1633919475129', '遇见孙燕姿.jpg', 'image/jpeg', './upload/video/cover', '1633919475147.jpg', 3602, '2021-10-11 10:31:15', '2021-10-11 10:31:15');
INSERT INTO `video_cover` VALUES ('1633947139884', '1633947139857', '3.jpg', 'image/jpeg', './upload/video/cover', '1633947139881.jpg', 5516, '2021-10-11 18:12:19', '2021-10-11 18:12:19');
INSERT INTO `video_cover` VALUES ('1634532125869', '1634532125851', '40128.png', 'image/png', './upload/video/cover', '1634532125868.png', 7880, '2021-10-18 12:42:05', '2021-10-18 12:42:05');
INSERT INTO `video_cover` VALUES ('1634532454539', '1634532454509', '239bd1a4b421b3a.jpg', 'image/jpeg', './upload/video/cover', '1634532454537.jpg', 7756, '2021-10-18 12:47:34', '2021-10-18 12:47:34');
INSERT INTO `video_cover` VALUES ('1634532704445', '1634532704420', 'f019c97f7.jpg', 'image/jpeg', './upload/video/cover', '1634532704443.jpg', 12050, '2021-10-18 12:51:44', '2021-10-18 12:51:44');
INSERT INTO `video_cover` VALUES ('1634532943060', '1634532943030', '2326302.jpg', 'image/jpeg', './upload/video/cover', '1634532943058.jpg', 3032, '2021-10-18 12:55:43', '2021-10-18 12:55:43');
INSERT INTO `video_cover` VALUES ('1634533182655', '1634533182631', '8787c06b979e05dd6a59444.png', 'image/png', './upload/video/cover', '1634533182653.png', 5866, '2021-10-18 12:59:42', '2021-10-18 12:59:42');
INSERT INTO `video_cover` VALUES ('1634533890090', '1634533890069', '785ce4f2e3f7.jpg', 'image/jpeg', './upload/video/cover', '1634533890089.jpg', 9244, '2021-10-18 13:11:30', '2021-10-18 13:11:30');
INSERT INTO `video_cover` VALUES ('1635301875929', '1635301875892', '5b2f98bf8daeb1.jpg', 'image/jpeg', './upload/video/cover', '1635301875926.jpg', 5042, '2021-10-27 10:31:15', '2021-10-27 10:31:15');
INSERT INTO `video_cover` VALUES ('1635302223658', '1635302223635', 'e3d7a788d25d583a664d109f04b8b.jpg', 'image/jpeg', './upload/video/cover', '1635302223656.jpg', 11720, '2021-10-27 10:37:03', '2021-10-27 10:37:03');
INSERT INTO `video_cover` VALUES ('1635339720985', '1635339720965', '9445a592f6251b.jpg', 'image/jpeg', './upload/video/cover', '1635339720982.jpg', 10768, '2021-10-27 21:02:00', '2021-10-27 21:02:00');
INSERT INTO `video_cover` VALUES ('1635429046116', '1635429046087', '93d7a88a6ec78b.jpg', 'image/jpeg', './upload/video/cover', '1635429046113.jpg', 15634, '2021-10-28 21:50:46', '2021-10-28 21:50:46');
INSERT INTO `video_cover` VALUES ('1635504051430', '1635504051409', '3f296ae3ef75ae7d7ce8a.jpg', 'image/jpeg', './upload/video/cover', '1635504051428.jpg', 5078, '2021-10-29 18:40:51', '2021-10-29 18:40:51');
INSERT INTO `video_cover` VALUES ('1635504576475', '1635504576446', '130ab6268efe9592399dcb2.jpg', 'image/jpeg', './upload/video/cover', '1635504576473.jpg', 9586, '2021-10-29 18:49:36', '2021-10-29 18:49:36');
INSERT INTO `video_cover` VALUES ('1635505000765', '1635505000744', '7157fe1f7b55a2b2c.jpg', 'image/jpeg', './upload/video/cover', '1635505000764.jpg', 7020, '2021-10-29 18:56:40', '2021-10-29 18:56:40');
INSERT INTO `video_cover` VALUES ('1635505223596', '1635505223574', '72d3be60e62.jpg', 'image/jpeg', './upload/video/cover', '1635505223594.jpg', 5328, '2021-10-29 19:00:23', '2021-10-29 19:00:23');
INSERT INTO `video_cover` VALUES ('1635505388451', '1635505388432', '632810dbc0fc5de05aa.jpg', 'image/jpeg', './upload/video/cover', '1635505388449.jpg', 13364, '2021-10-29 19:03:08', '2021-10-29 19:03:08');
INSERT INTO `video_cover` VALUES ('1635508469913', '1635508469891', '2a18162e.jpg', 'image/jpeg', './upload/video/cover', '1635508469911.jpg', 3328, '2021-10-29 19:54:29', '2021-10-29 19:54:29');
INSERT INTO `video_cover` VALUES ('1635680912773', '1635680912753', 'c4a47d06435e.jpg', 'image/jpeg', './upload/video/cover', '1635680912771.jpg', 6292, '2021-10-31 19:48:32', '2021-10-31 19:48:32');
INSERT INTO `video_cover` VALUES ('1635681182356', '1635681182331', 'f2ff11d60a2181ba090a6381.jpg', 'image/jpeg', './upload/video/cover', '1635681182354.jpg', 5570, '2021-10-31 19:53:02', '2021-10-31 19:53:02');
INSERT INTO `video_cover` VALUES ('1635682038493', '1635682038475', '25efb9d58eb6157748802de4ace5454a42c918c2.jpg', 'image/jpeg', './upload/video/cover', '1635682038492.jpg', 8090, '2021-10-31 20:07:18', '2021-10-31 20:07:18');
INSERT INTO `video_cover` VALUES ('1635686390214', '1635686390194', '284f2ebb322781d4887fc4ce585982c513b510e0.jpg', 'image/jpeg', './upload/video/cover', '1635686390213.jpg', 9112, '2021-10-31 21:19:50', '2021-10-31 21:19:50');
INSERT INTO `video_cover` VALUES ('1635686660666', '1635686660644', 'f08976341ca03da1eb79567.jpg', 'image/jpeg', './upload/video/cover', '1635686660665.jpg', 4316, '2021-10-31 21:24:20', '2021-10-31 21:24:20');
INSERT INTO `video_cover` VALUES ('1635687185590', '1635687185570', '81c35ab1d389f8c73d0f3.jpg', 'image/jpeg', './upload/video/cover', '1635687185589.jpg', 5664, '2021-10-31 21:33:05', '2021-10-31 21:33:05');
INSERT INTO `video_cover` VALUES ('1635687874986', '1635687874954', '4c038ff380d04563.jpg', 'image/jpeg', './upload/video/cover', '1635687874985.jpg', 14002, '2021-10-31 21:44:34', '2021-10-31 21:44:34');
INSERT INTO `video_cover` VALUES ('1635861806239', '1635861806203', '60deb90e71bd92eed85819aa40d438bdd8bc5b29.jpg', 'image/jpeg', './upload/video/cover', '1635861806237.jpg', 5672, '2021-11-02 22:03:26', '2021-11-02 22:03:26');
INSERT INTO `video_cover` VALUES ('1635861963747', '1635861963725', 'a5deee1cb2113768105c1e1f515fb9c581fd90dd.jpg', 'image/jpeg', './upload/video/cover', '1635861963745.jpg', 3934, '2021-11-02 22:06:03', '2021-11-02 22:06:03');
INSERT INTO `video_cover` VALUES ('1635862232254', '1635862232233', '60c7db68ab3623.jpg', 'image/jpeg', './upload/video/cover', '1635862232253.jpg', 7624, '2021-11-02 22:10:32', '2021-11-02 22:10:32');
INSERT INTO `video_cover` VALUES ('1635862364315', '1635862364296', '19c2f5049f2841878.jpg', 'image/jpeg', './upload/video/cover', '1635862364314.jpg', 5108, '2021-11-02 22:12:44', '2021-11-02 22:12:44');
INSERT INTO `video_cover` VALUES ('1635862727360', '1635862727342', '88748b4cba462c67b2c.jpg', 'image/jpeg', './upload/video/cover', '1635862727359.jpg', 5988, '2021-11-02 22:18:47', '2021-11-02 22:18:47');
INSERT INTO `video_cover` VALUES ('1635863182506', '1635863182476', 'cc0ebf75b8aa0ceb1.jpg', 'image/jpeg', './upload/video/cover', '1635863182502.jpg', 10506, '2021-11-02 22:26:22', '2021-11-02 22:26:22');
INSERT INTO `video_cover` VALUES ('1635863782170', '1635863782146', 'f33e60d64d473.jpg', 'image/jpeg', './upload/video/cover', '1635863782168.jpg', 14852, '2021-11-02 22:36:22', '2021-11-02 22:36:22');
INSERT INTO `video_cover` VALUES ('1636028032065', '1636028032035', '41c4e81781.jpg', 'image/jpeg', './upload/video/cover', '1636028032062.jpg', 11828, '2021-11-04 20:13:52', '2021-11-04 20:13:52');
INSERT INTO `video_cover` VALUES ('1636028602021', '1636028601995', '05b7a1a0aa6ba4e5ac65.jpg', 'image/jpeg', './upload/video/cover', '1636028602019.jpg', 21862, '2021-11-04 20:23:22', '2021-11-04 20:23:22');
INSERT INTO `video_cover` VALUES ('1636029265681', '1636029265659', '4a7c2c738cee7fe40771b534.jpg', 'image/jpeg', './upload/video/cover', '1636029265680.jpg', 22544, '2021-11-04 20:34:25', '2021-11-04 20:34:25');
INSERT INTO `video_cover` VALUES ('1636029682669', '1636029682642', 'd8571b1a2ed60f.jpg', 'image/jpeg', './upload/video/cover', '1636029682667.jpg', 5144, '2021-11-04 20:41:22', '2021-11-04 20:41:22');
INSERT INTO `video_cover` VALUES ('1636030025110', '1636030025087', 'a5f251a4f67dccb641.jpg', 'image/jpeg', './upload/video/cover', '1636030025109.jpg', 10068, '2021-11-04 20:47:05', '2021-11-04 20:47:05');
INSERT INTO `video_cover` VALUES ('1636272273362', '1636272273336', '620ff8e.png', 'image/png', './upload/video/cover', '1636272273361.png', 12838, '2021-11-07 16:04:33', '2021-11-07 16:04:33');
INSERT INTO `video_cover` VALUES ('1636272552823', '1636272552801', '51ed73c7a09.jpg', 'image/jpeg', './upload/video/cover', '1636272552821.jpg', 3922, '2021-11-07 16:09:12', '2021-11-07 16:09:12');
INSERT INTO `video_cover` VALUES ('1636352900690', '1636352900663', 'cd13a8e43d9cf.jpg', 'image/jpeg', './upload/video/cover', '1636352900687.jpg', 4748, '2021-11-08 14:28:20', '2021-11-08 14:28:20');
INSERT INTO `video_cover` VALUES ('1636353273719', '1636353273700', 'c68df08ec.png', 'image/png', './upload/video/cover', '1636353273718.png', 5854, '2021-11-08 14:34:33', '2021-11-08 14:34:33');
INSERT INTO `video_cover` VALUES ('1640503572354', '1640503572319', 'a8479e30d.jpg', 'image/jpeg', './upload/video/cover', '1640503572352.jpg', 7074, '2021-12-26 15:26:12', '2021-12-26 15:26:12');
INSERT INTO `video_cover` VALUES ('1640503937423', '1640503937398', '34d8b2.jpg', 'image/jpeg', './upload/video/cover', '1640503937420.jpg', 3298, '2021-12-26 15:32:17', '2021-12-26 15:32:17');
INSERT INTO `video_cover` VALUES ('1640504400585', '1640504400561', '3afe734.jpg', 'image/jpeg', './upload/video/cover', '1640504400583.jpg', 4712, '2021-12-26 15:40:00', '2021-12-26 15:40:00');
INSERT INTO `video_cover` VALUES ('1640504921960', '1640504921941', 'a74dc0bbe68951d40bb9230867de19a2db4c73ed.jpg', 'image/jpeg', './upload/video/cover', '1640504921959.jpg', 3282, '2021-12-26 15:48:41', '2021-12-26 15:48:41');
INSERT INTO `video_cover` VALUES ('1640505141783', '1640505141762', '1060f11e0a80573e8c.jpg', 'image/jpeg', './upload/video/cover', '1640505141781.jpg', 7510, '2021-12-26 15:52:21', '2021-12-26 15:52:21');
INSERT INTO `video_cover` VALUES ('1642497372216', '1642497372188', '50ea82f8e9b7e0b.jpg', 'image/jpeg', './upload/video/cover', '1642497372213.jpg', 10736, '2022-01-18 17:16:12', '2022-01-18 17:16:12');
INSERT INTO `video_cover` VALUES ('1643433187483', '1643433187416', 'fd3120.jpg', 'image/jpeg', './upload/video/cover', '1643433187476.jpg', 10980, '2022-01-29 13:13:07', '2022-01-29 13:13:07');
INSERT INTO `video_cover` VALUES ('1643433469264', '1643433469235', '8dc2a7934b0df70b6d.jpg', 'image/jpeg', './upload/video/cover', '1643433469262.jpg', 8086, '2022-01-29 13:17:49', '2022-01-29 13:17:49');
INSERT INTO `video_cover` VALUES ('1643433735069', '1643433735031', '73230d8.jpg', 'image/jpeg', './upload/video/cover', '1643433735067.jpg', 6542, '2022-01-29 13:22:15', '2022-01-29 13:22:15');
INSERT INTO `video_cover` VALUES ('1643455054839', '1643455054797', 'f37610.jpg', 'image/jpeg', './upload/video/cover', '1643455054836.jpg', 6332, '2022-01-29 19:17:34', '2022-01-29 19:17:34');
INSERT INTO `video_cover` VALUES ('1643879245078', '1643879245050', '2ab.jpg', 'image/jpeg', './upload/video/cover', '1643879245076.jpg', 10952, '2022-02-03 17:07:25', '2022-02-03 17:07:25');
INSERT INTO `video_cover` VALUES ('1643939608978', '1643939608960', '1f58ff81311edaa.jpg', 'image/jpeg', './upload/video/cover', '1643939608977.jpg', 4388, '2022-02-04 09:53:28', '2022-02-04 09:53:28');
INSERT INTO `video_cover` VALUES ('1643940488789', '1643940488762', '8dbdd06374155c3dd.jpg', 'image/jpeg', './upload/video/cover', '1643940488786.jpg', 4170, '2022-02-04 10:08:08', '2022-02-04 10:08:08');
INSERT INTO `video_cover` VALUES ('1644286690884', '1644286690856', '102d6.jpg', 'image/jpeg', './upload/video/cover', '1644286690881.jpg', 9688, '2022-02-08 10:18:10', '2022-02-08 10:18:10');
INSERT INTO `video_cover` VALUES ('1644299720570', '1644299720534', '13.jpg', 'image/jpeg', './upload/video/cover', '1644299720562.jpg', 10822, '2022-02-08 13:55:20', '2022-02-08 13:55:20');
INSERT INTO `video_cover` VALUES ('1644375749681', '1644375749656', 'cd164580a673e82ee6457e2.jpg', 'image/jpeg', './upload/video/cover', '1644375749678.jpg', 4686, '2022-02-09 11:02:29', '2022-02-09 11:02:29');
INSERT INTO `video_cover` VALUES ('1644586646972', '1644586646938', '13e7716a.jpg', 'image/jpeg', './upload/video/cover', '1644586646969.jpg', 7424, '2022-02-11 21:37:26', '2022-02-11 21:37:26');
INSERT INTO `video_cover` VALUES ('1644586859562', '1644586859539', '1a50fda2585a8aedf1f.jpg', 'image/jpeg', './upload/video/cover', '1644586859561.jpg', 7450, '2022-02-11 21:40:59', '2022-02-11 21:40:59');
INSERT INTO `video_cover` VALUES ('1648269109934', '1648269109899', '60d64d473.jpg', 'image/jpeg', './upload/video/cover', '1648269109931.jpg', 10160, '2022-03-26 12:31:49', '2022-03-26 12:31:49');
INSERT INTO `video_cover` VALUES ('1648269327783', '1648269327758', 'fe9559213.jpg', 'image/jpeg', './upload/video/cover', '1648269327781.jpg', 3192, '2022-03-26 12:35:27', '2022-03-26 12:35:27');
INSERT INTO `video_cover` VALUES ('1648269508596', '1648269508558', '5578ff440fd11.jpg', 'image/jpeg', './upload/video/cover', '1648269508593.jpg', 5366, '2022-03-26 12:38:28', '2022-03-26 12:38:28');
INSERT INTO `video_cover` VALUES ('1648270710043', '1648270710019', '1f8b18e74c50cf.jpg', 'image/jpeg', './upload/video/cover', '1648270710041.jpg', 9078, '2022-03-26 12:58:30', '2022-03-26 12:58:30');
INSERT INTO `video_cover` VALUES ('1648272232988', '1648272232969', 'c2be9f83b729a3ed0e35f008ab795919b257de4c.jpg', 'image/jpeg', './upload/video/cover', '1648272232986.jpg', 12534, '2022-03-26 13:23:52', '2022-03-26 13:23:52');
INSERT INTO `video_cover` VALUES ('1650009471696', '1650009471674', '20f9acd4ec08d2f8c1beec80a5da7fd6726f0802.jpg', 'image/jpeg', './upload/video/cover', '1650009471694.jpg', 18264, '2022-04-15 15:57:51', '2022-04-15 15:57:51');
INSERT INTO `video_cover` VALUES ('1650159060760', '1650159060727', '7565702c92e98a0ed298fd4bc2ba6246ae5c9c3c.jpg', 'image/jpeg', './upload/video/cover', '1650159060756.jpg', 24434, '2022-04-17 09:31:00', '2022-04-17 09:31:00');
INSERT INTO `video_cover` VALUES ('1650159272345', '1650159272328', 'a59ee49cc390feb6d306679cc18381c77bd4f8ba.jpg', 'image/jpeg', './upload/video/cover', '1650159272343.jpg', 24600, '2022-04-17 09:34:32', '2022-04-17 09:34:32');
INSERT INTO `video_cover` VALUES ('1650159394145', '1650159394116', '3aceea6f4d69315273015392c9376aa058387d72.jpg', 'image/jpeg', './upload/video/cover', '1650159394143.jpg', 17522, '2022-04-17 09:36:34', '2022-04-17 09:36:34');
INSERT INTO `video_cover` VALUES ('1650160286972', '1650160286946', '5742f5f028cfe3f8ec37431ea07c2d3a871d6ec5.png', 'image/png', './upload/video/cover', '1650160286970.png', 10236, '2022-04-17 09:51:26', '2022-04-17 09:51:26');
INSERT INTO `video_cover` VALUES ('1650160491474', '1650160491450', 'a84d80ce38c83f57ecde01d2af20799c6f28dcb1.jpg', 'image/jpeg', './upload/video/cover', '1650160491473.jpg', 26546, '2022-04-17 09:54:51', '2022-04-17 09:54:51');
INSERT INTO `video_cover` VALUES ('1650787448565', '1650787448533', 'f016b112a1146ca3206b3f9e5a66f5207016db6b.jpg', 'image/jpeg', './upload/video/cover', '1650787448562.jpg', 26216, '2022-04-24 16:04:08', '2022-04-24 16:04:08');
INSERT INTO `video_cover` VALUES ('1651582837617', '1651582837583', '2df.jpg', 'image/jpeg', './upload/video/cover', '1651582837613.jpg', 12610, '2022-05-03 21:00:37', '2022-05-03 21:00:37');

SET FOREIGN_KEY_CHECKS = 1;

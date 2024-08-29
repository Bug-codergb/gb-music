const path = require('path');
const fs = require("fs");
const multer = require('multer');
const fileStorage = (file_path) => {
  const rootPath = process.cwd();
  const targetPath = path.resolve(rootPath,file_path);
  try{
    fs.accessSync(targetPath);
  }catch (e) {
    console.log(e.message);
    fs.mkdirSync(targetPath,{ recursive: true });
  }
  const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, file_path);
    },
    filename: function (req, file, cb) {
      cb(null, new Date().getTime() + path.extname(file.originalname));
    }
  });
  return storage;
};
//用户头像
const uploadAvatar = multer({ storage: fileStorage('./upload/avatar') });
//歌手头像
const artistAvatar = multer({ storage: fileStorage('./upload/artist/avatar') });
//专辑封面
const albumCover = multer({ storage: fileStorage('./upload/album/cover') });
//上传歌曲
const song = multer({ storage: fileStorage('./upload/song') });
//上传歌单封面
const playlistCover = multer({
  storage: fileStorage('./upload/playlist/cover')
});
//上传榜单封面
const toplistCover = multer({ storage: fileStorage('./upload/toplist/cover') });
//上传视频
const video = multer({ storage: fileStorage('./upload/video/source') });
//上传视频封面
const videoCover = multer({ storage: fileStorage('./upload/video/cover') });
//上传banner图片
const bannerImg = multer({ storage: fileStorage('./upload/banner/recommend') });

//上传动态图片
const momentImg = multer({ storage: fileStorage('./upload/moment/picture') });
//上传频道内容图片
const channelCover = multer({ storage: fileStorage('./upload/channel/cover') });
//上传program源文件
const programSource = multer({
  storage: fileStorage('./upload/channel/program')
});
//上传话题图片
const topicCover = multer({ storage: fileStorage('./upload/topic/cover') });
//上传验证图片
const verify = multer({ storage: fileStorage('./upload/verify') });

//电台icon
const channelIcon = multer({ storage: fileStorage('./upload/channel/icon') });
module.exports = {
  uploadAvatar,
  artistAvatar,
  albumCover,
  song,
  playlistCover,
  toplistCover,
  video,
  videoCover,
  bannerImg,
  momentImg,
  channelCover,
  programSource,
  topicCover,
  verify,
  channelIcon
};

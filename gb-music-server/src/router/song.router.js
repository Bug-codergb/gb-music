const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const {
  create,
  uploadSong,
  getSong,
  getRecSong,
  getSongURL,
  getSongDetail,
  getAllSong,
  addSongToTop,
  addLyric,
  getLyric,
  addPlayCount,
  download,
  updateSongVip,
  deleteSong,
  updateSong
} = require('../controller/song.controller');
const { song } = require('../middleware/file.middleware');
const { isExistsSong, isVip } = require('../middleware/song.middleware');
//添加歌曲信息
router.post('/', loginAuth, create);
//上传歌曲
router.post('/upload', loginAuth, isExistsSong, song.single('song'), uploadSong);
//获取歌曲
router.get('/source', getSong);
//获取推荐歌曲
router.get('/recommend', getRecSong);
//获取歌曲播放地址
router.get('/url', getSongURL);
//获取歌曲详情
router.get('/detail', getSongDetail);
//获取所有歌曲
router.get('/all', getAllSong);
//上传歌词
router.post('/lyric', loginAuth, addLyric);
//获取歌词
router.get('/lyric', getLyric);
//为歌曲添加播放量
router.post('/playCount', addPlayCount);
//下载歌曲
router.post('/download', loginAuth, isVip, download);
//更新歌曲vip
router.post('/vip/update', loginAuth, updateSongVip);
//删除歌曲
router.post('/delete', loginAuth, deleteSong);

//更新歌曲信息
router.post('/update', loginAuth, updateSong);
module.exports = router;

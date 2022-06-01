const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { toplistCover } = require('../middleware/file.middleware');
const {
  createToplist,
  uploadCover,
  getToplistCover,
  getOfficialTop,
  addSongToTop,
  getToplistDetail,
  getHotToplist,
  removeSong,
  exportSong,
  getSimiToplist,
  deleteToplist,
  addPlayCount
} = require('../controller/toplist.controller');
//添加榜单
router.post('/', loginAuth, createToplist);
//上传歌单封面
router.post('/upload', loginAuth, toplistCover.single('cover'), uploadCover);
//获取榜单封面
router.get('/cover', getToplistCover);
//获取官方榜单
router.get('/official', getOfficialTop);
//获取其他榜单
router.get('/hot', getHotToplist);
//将歌曲加入排行榜
router.post('/song', loginAuth, addSongToTop);
//移出榜单
router.post('/song/remove', loginAuth, removeSong);
//获取榜单详情
router.get('/detail', getToplistDetail);
//批量加入榜单
router.post('/export', exportSong);
//获取相关榜单
router.get('/simi', getSimiToplist);
//删除排行榜信息
router.post('/delete', loginAuth, deleteToplist);
//添加播放量
router.post('/playCount/add', addPlayCount);
module.exports = router;

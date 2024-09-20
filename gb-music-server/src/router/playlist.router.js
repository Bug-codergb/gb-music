const express = require('express');
const router = express.Router();
const {
  create,
  uploadCover,
  getPlayListCover,
  addCate,
  getUserPlaylist,
  getRecPlaylist,
  addSongToPlay,
  addCateForPlay,
  getPlayDetail,
  getAllCate,
  getCateDetail,
  getAllPlaylist,
  delPlaylist,
  getSubUser,
  addPlayCount,
  getIncludePlaylist,
  getHotPlaylist,
  updatePlaylist,
  getPlaylistData,
  delPlaylistCate,
  setPlaylistBatchCate
} = require('../controller/playlist.controller');
const { loginAuth } = require('../middleware/auth.middleware');
const { paramCheck } = require('../middleware/playlist.middleware');
const { playlistCover } = require('../middleware/file.middleware');
//添加歌单
router.post('/', loginAuth, paramCheck, create);
//添加歌单封面
router.post('/cover', loginAuth, playlistCover.single('cover'), uploadCover);
//获取歌单封面
router.get('/cover', getPlayListCover);
//添加歌单分类
router.post('/cate', loginAuth, addCate);
//获取用户歌单
router.get('/user', getUserPlaylist);
//获取推荐歌单
router.get('/recommend', getRecPlaylist);
//歌曲加入歌单
router.post('/song', loginAuth, addSongToPlay);
//为歌单(具体)添加分类
router.post('/cate/add', loginAuth, addCateForPlay);
//获取歌单详情
router.get('/detail', getPlayDetail);
//获取所有歌单分类
router.get('/cate', getAllCate);
//获取分类下歌单
router.get('/cate/detail', getCateDetail);
//获取全部歌单
router.get('/all', getAllPlaylist);
//删除歌单
router.post('/delete', loginAuth, delPlaylist);
//获取歌单收藏者
router.get('/sub/user', getSubUser);
//为歌单添加播放量
router.post('/playCount/add', addPlayCount);
//包含这首歌的歌单
router.get('/song/include', getIncludePlaylist);
//获取热门歌单
router.get('/hot', getHotPlaylist);
//获取歌单数据
router.get('/data', loginAuth, getPlaylistData);
//更新歌单信息
router.post('/update', loginAuth, updatePlaylist);
//删除歌单分类
router.post('/cate/delete', loginAuth, delPlaylistCate);
router.post("/cate/set/batch",loginAuth,setPlaylistBatchCate);
module.exports = router;

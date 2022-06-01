const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { isExistsAvatar } = require('../middleware/artist.middleware');
const { artistAvatar } = require('../middleware/file.middleware');
const {
  create,
  uploadAvatar,
  getAvatar,
  getArtistCate,
  addArtistCate,
  getAllArtist,
  getCateArtist,
  getRecArtist,
  getArtistDetail,
  delArtist,
  getArtistMV,
  getSimiArtist,
  addArtistType,
  setArtistType,
  getArtistType,
  setArtistCate,
  getArtistAlbum,
  getArtistSong,
  updateUserMsg,
  getArtistData,
  getHotArtist,
  deleteCate,
  deleteArtistType
} = require('../controller/artist.controller');
//添加歌手
router.post('/', loginAuth, create);
//上传歌手头像
router.post(
  '/upload/avatar',
  loginAuth,
  isExistsAvatar,
  artistAvatar.single('artist_avatar'),
  uploadAvatar
);
//获取歌手头像
router.get('/avatar', getAvatar);
//添加歌手分类
router.post('/cate', loginAuth, addArtistCate);
//获取歌手分类
router.get('/cate', getArtistCate);
//设置歌手cate
router.post('/cate/set', loginAuth, setArtistCate);
//获取所有歌手
router.get('/', getAllArtist);
//获取分类下歌手
router.get('/cate/detail', getCateArtist);
//获取推荐歌手
router.get('/recommend', getRecArtist);
//获取歌手详情
router.get('/detail', getArtistDetail);
//删除歌手
router.post('/delete', loginAuth, delArtist);
//获取歌手MV
router.get('/mv', getArtistMV);
//获取相似歌手
router.get('/simi', getSimiArtist);
//添加歌手type
router.post('/type', addArtistType);
//设置歌手type
router.post('/type/set', setArtistType);
//获取歌手type
router.get('/type', getArtistType);
//获取歌手专辑
router.get('/album', getArtistAlbum);
//获取歌手歌曲
router.get('/song', getArtistSong);
//更新歌手信息//简介和名称
router.post('/update', loginAuth, updateUserMsg);
//获取歌手看版数据
router.get('/data', loginAuth, getArtistData);
//获取热门歌手(详情页)
router.get('/hot', getHotArtist);
//删除歌手cate
router.post('/cate/delete', loginAuth, deleteCate);
//删除歌手type
router.post('/type/delete', loginAuth, deleteArtistType);
module.exports = router;

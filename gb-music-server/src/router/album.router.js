const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { isExistsAlbum, isExistsCover, paramCheck } = require('../middleware/album.middleware');
const {
  create,
  addAlbum,
  uploadCover,
  getAlbumCover,
  getAlbumCate,
  getAllAlbum,
  getAlbumDetail,
  getRecAlbum,
  getCateAlbumDetail,
  delAlbum,
  delAlbumSong,
  getSubUser,
  getHotAlbum,
  getAlbumData,
  updateAlbum,
  delAlbumCate
} = require('../controller/album.controller');
const { albumCover } = require('../middleware/file.middleware');
//添加专辑分类
router.post('/cate', loginAuth, create);
//添加专辑
router.post('/', loginAuth, isExistsAlbum, addAlbum);
//上传专辑封面
router.post(
  '/upload/cover',
  loginAuth,
  isExistsCover,
  albumCover.single('album_cover'),
  uploadCover
);
//获取专辑封面
router.get('/cover', getAlbumCover);
//获取专辑分类
router.get('/cate', getAlbumCate);
//获取所有专辑
router.get('/all', getAllAlbum);
//获取专辑详情
router.get('/detail', paramCheck, getAlbumDetail);
//获取推荐专辑
router.get('/recommend', getRecAlbum);
//获取分类下专辑
router.get('/cate/detail', getCateAlbumDetail);
//删除专辑
router.post('/delete', loginAuth, delAlbum);
//删除专辑下歌曲
router.post('/song/delete', loginAuth, delAlbumSong);
//获取专辑收藏者
router.get('/sub/user', getSubUser);
//获取热门专辑
router.get('/hot', getHotAlbum);
//获取专辑data
router.get('/data', getAlbumData);
//更新专辑信息(名称，简介，发布时间)
router.post('/update', loginAuth, updateAlbum);
//删除专辑分类
router.post('/cate/delete', loginAuth, delAlbumCate);
module.exports = router;

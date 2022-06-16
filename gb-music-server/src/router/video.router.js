const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { video, videoCover } = require('../middleware/file.middleware');
const {
  addVideoCate,
  addVideo,
  uploadVideo,
  getVideoSource,
  uploadCover,
  getVideoCover,
  getAllCate,
  getCateVideo,
  getVideoURL,
  getVideoDetail,
  delVideo,
  getSimilarVideo,
  addPlayCount,
  getVideoRank,
  updateVideo,
  getVideoData,
  getMVData,
  getRecVideo,
  delVideoCate
} = require('../controller/video.controller');
//添加视频分类
router.post('/cate', loginAuth, addVideoCate);
//添加视频
router.post('/', loginAuth, addVideo);
//上传视频
router.post('/upload', loginAuth, video.single('video'), uploadVideo);
//获取视频
router.get('/', getVideoSource);
//上传视频
router.post('/cover/upload', loginAuth, videoCover.single('cover'), uploadCover);
//获取视频封面
router.get('/cover', getVideoCover);
//获取视频分类
router.get('/cate/all', getAllCate);
//获取分类下视频
router.get('/cate/detail', getCateVideo);
//获取视频URL
router.get('/url', getVideoURL);
//获取视频详情
router.get('/detail', getVideoDetail);
//删除视频
router.post('/delete', loginAuth, delVideo);
//获取相关视频
router.get('/similar', getSimilarVideo);
//为视频添加播放量
router.post('/playCount', loginAuth, addPlayCount);

//获取mv排行
router.get('/toplist', getVideoRank);
//更新视频信息
router.post('/update', loginAuth, updateVideo);
//获取视频数据
router.get('/data', loginAuth, getVideoData);
//mv数据
router.get('/mv/data', loginAuth, getMVData);
//获取推荐视频
router.get('/recommend', loginAuth, getRecVideo);
//删除视频分类
router.post('/cate/delete', loginAuth, delVideoCate);
module.exports = router;

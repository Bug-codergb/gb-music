const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { channelCover, programSource, channelIcon } = require('../middleware/file.middleware');
const {
  create,
  delChannel,
  addContent,
  uploadContentCover,
  getContentCover,
  getAllChannel,
  getContent,
  addProgram,
  addProgramSource,
  getProgram,
  getChannelDetail,
  getUserChannel,
  getUserChannelCount,
  addPlayCount,
  getHotChannel,
  getChannelHotContent,
  getProgramDetail,
  getProgramURL,
  getChannelSubUser,
  getChannelData,
  getChannelCover,
  updateCover,
  updateChannel,
  deleteChannelContent,
  getUserProgramList,
  deleteProgram,
  getUserChannelDetail
} = require('../controller/channel.controller');
router.post('/', loginAuth, channelIcon.single('channel'), create);
router.get('/cover', getChannelCover);
//更新封面
router.post('/update/cover', channelIcon.single('channel'), updateCover);
router.post('/delete', loginAuth, delChannel);
//添加频道内容
router.post('/content/add', loginAuth, addContent);
//上传频道内容图片
router.post('/content/upload', loginAuth, channelCover.single('cover'), uploadContentCover);
//获取频道内容图片
router.get('/content/cover', getContentCover);
//获取所有频道
router.get('/all', getAllChannel);
//获取电台内容
router.get('/content', getContent);
//上传program
router.post('/program', loginAuth, addProgram);
//上传program源文件
router.post('/program/source', loginAuth, programSource.single('program'), addProgramSource);
//获取program源文件
router.get('/program', getProgram);
//获取电台详情
router.get('/detail', getChannelDetail);
//获取用户电台
router.get('/user', getUserChannel);
//获取用户电台数据
router.get('/count', getUserChannelCount);
//添加播放量(节目)
router.post('/playCount', loginAuth, addPlayCount);
//获取热门电台（首页）
router.get('/hot', getHotChannel);

//获取（电台页） 各电台内容
router.get('/content/hot', getChannelHotContent);
//获取节目详情(detail)
router.get('/program/detail', getProgramDetail);
//获取节目URL
router.get('/program/url', getProgramURL);
//获取电台收藏者
router.get('/sub/user', getChannelSubUser);
//获取电台数据
router.get('/data', loginAuth, getChannelData);
//更新电台信息
router.post('/content/update', loginAuth, updateChannel);
//删除电台信息
router.post('/content/delete', loginAuth, deleteChannelContent);
//用户播单列表
router.post('/program/list', loginAuth, getUserProgramList);
//删除节目
router.post("/program/delete/:id",loginAuth,deleteProgram);
//获取用户频道
router.post("/user/detail/:userId",loginAuth,getUserChannelDetail);
module.exports = router;

const express = require('express');
const router = express.Router();
const { uploadAvatar } = require('../middleware/file.middleware');
const { isExistsAvatar } = require('../middleware/user.middleware');
const {
  create,
  getUserAvatar,
  setUserFavorite,
  getUserFavorite,
  getUserDetail,
  getOtherUserDetail,
  getUserChannel,
  cancelFavorite,
  getUserVioData,
  getUserVioList,
  getUserProgram,
  getUserFans,
  getManageVio,
  getUserAllComment,
  getUserCount,
  getUserList,
  updateUserExpire,
  updateUserMsg,
  getUserMomentData,
  getUserMoment,
  getSystemData,
  deleteUser,
  getSimpleInfo,
  updateUserPassword
} = require('../controller/user.controller');
const { loginAuth } = require('../middleware/auth.middleware');
//头像上传
router.post('/upload/avatar', loginAuth, isExistsAvatar, uploadAvatar.single('avatar'), create);
router.get('/avatar', getUserAvatar);
//用户喜欢歌曲
router.post('/favorite', loginAuth, setUserFavorite);
router.get('/favorite', loginAuth, getUserFavorite);
//取消喜欢
router.post('/favorite/cancel', loginAuth, cancelFavorite);
router.get('/detail', loginAuth, getUserDetail);
router.post('/other/detail', loginAuth, getOtherUserDetail);
router.post('/channel', loginAuth, getUserChannel);

//获取用户视频数据
router.post('/data/video', loginAuth, getUserVioData);
//获取用户动态视频
router.post('/data/moment', loginAuth, getUserMomentData);
//获取用户视频列表
router.post('/video/list', loginAuth, getUserVioList);
//获取用户声音列表
router.post('/program/list', loginAuth, getUserProgram);
//获取用户粉丝
router.post('/fans', loginAuth, getUserFans);
//获取视频管理视频列表 （manage）
router.post('/manage/video', loginAuth, getManageVio);
//获取用户全部评论
router.post('/comment/all', loginAuth, getUserAllComment);
//获取系统用户人数信息
router.get('/count', loginAuth, getUserCount);
//获取用户列表
router.post('/list', loginAuth, getUserList);
//更新用户vip信息
router.post('/expire', loginAuth, updateUserExpire);
//更新用户信息
router.post('/update', loginAuth, updateUserMsg);
//获取用户动态
router.post('/moment', loginAuth, getUserMoment);
//获取系统总数据
router.post('/system/data', loginAuth, getSystemData);
//删除用户
router.post('/delete', loginAuth, deleteUser);
//获取用户简略信息 (关注，粉丝，动态)
router.get('/simple', loginAuth, getSimpleInfo);
router.post("/update/password",loginAuth, updateUserPassword);
module.exports = router;

const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const {
  subMusic,
  getUserSub,
  getUserPlaylist,
  cancelSub
} = require('../controller/sub.controller');
//收藏
router.post('/', loginAuth, subMusic);
//取消收藏
router.post('/cancel', loginAuth, cancelSub);
//获取用户收藏
router.get('/user/:subName', loginAuth, getUserSub);
//获取用户收藏歌单(用户详情页)
router.post('/user/playlist', getUserPlaylist);
module.exports = router;

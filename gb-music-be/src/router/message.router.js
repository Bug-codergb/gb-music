const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const {
  publishAlbum,
  createPlaylist,
  thumbComment,
  publishVideo,
  publishChannel,
  getMessage,
  readMessage,
  getMessageVideo,
  getThumbComment,
  getAlbumMsg,
  getPlaylistMsg,
  getChannelMsg,
  deleteMsg,
  readSingleMsg
} = require('../controller/message.controller');
//发布了专辑
router.post('/album', loginAuth, publishAlbum);
//创建了歌单
router.post('/playlist', loginAuth, createPlaylist);
//点赞了评论
router.post('/comment', loginAuth, thumbComment);
//发布了视频
router.post('/video', loginAuth, publishVideo);
//发布了声音
router.post('/channel', loginAuth, publishChannel);
//获取通知
router.get('/', loginAuth, getMessage);
//一键已读
router.post('/read', loginAuth, readMessage);
//详情页
//发布了视频
router.post('/detail/video', loginAuth, getMessageVideo);
//点赞了评论
router.post('/detail/comment', loginAuth, getThumbComment);
//歌手发布了专辑
router.post('/detail/album', loginAuth, getAlbumMsg);
//创建了歌单
router.post('/detail/playlist', loginAuth, getPlaylistMsg);
//发布了声音
router.post('/detail/channel', loginAuth, getChannelMsg);
//删除消息
router.post('/delete', loginAuth, deleteMsg);
//已读消息
router.post('/read/single', loginAuth, readSingleMsg);
module.exports = router;

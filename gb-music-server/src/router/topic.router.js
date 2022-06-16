const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { topicCover } = require('../middleware/file.middleware');
const {
  create,
  uploadCover,
  getTopicCover,
  getHotTopic,
  getTopicDetail,
  getAllTopic
} = require('../controller/topic.controller');
router.post('/', loginAuth, create);
router.post('/upload/cover', loginAuth, topicCover.single('cover'), uploadCover);
//获取话题封面
router.get('/cover', getTopicCover);
//获取热门话题
router.get('/hot', getHotTopic);
//获取话题详情
router.get('/detail', getTopicDetail);
//获取全部话题
router.get('/all', getAllTopic);
module.exports = router;

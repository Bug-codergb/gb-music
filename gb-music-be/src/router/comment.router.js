const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const {
  create,
  replyComment,
  getAllComment,
  deleteComment
} = require('../controller/comment.controller');
//评论
router.post('/', loginAuth, create);
//回复评论
router.post('/reply', loginAuth, replyComment);
//获取所有评论
router.get('/all', getAllComment);
//删除评论
router.post('/delete', loginAuth, deleteComment);
module.exports = router;

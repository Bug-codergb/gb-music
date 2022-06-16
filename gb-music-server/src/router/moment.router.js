const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { momentImg } = require('../middleware/file.middleware');
const {
  create,
  uploadPic,
  delMoment,
  getSong,
  getMomentPic,
  getAllMoment,
  getHotMoment
} = require('../controller/moment.controller');
//添加动态
router.post('/', loginAuth, create);
//上传动态图片
router.post('/upload/picture', loginAuth, momentImg.single('picture'), uploadPic);
//获取动态图片
router.get('/picture', getMomentPic);
//删除动态
router.post('/delete', loginAuth, delMoment);
//搜索歌曲
router.get('/search/song', getSong);
//获取所有动态
router.get('/all', getAllMoment);
//获取推荐动态
router.get('/hot', getHotMoment);
module.exports = router;

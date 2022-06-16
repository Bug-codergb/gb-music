const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { bannerImg } = require('../middleware/file.middleware');
const {
  create,
  uploadImg,
  getBannerImg,
  getRecBanner,
  getBannerList,
  deleteBanner
} = require('../controller/banner.controller');
router.post('/', loginAuth, create);
//上传banner图片
router.post('/img', loginAuth, bannerImg.single('banner'), uploadImg);
//获取banner图片
router.get('/', getBannerImg);
//获取banner
router.get('/recommend', getRecBanner);
//获取所有banner信息（详细信息）
router.get('/list', getBannerList);
//删除banner
router.post('/delete', loginAuth, deleteBanner);
module.exports = router;

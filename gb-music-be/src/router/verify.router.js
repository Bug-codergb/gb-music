const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { verify } = require('../middleware/file.middleware');
const { create, getVerifyImg, getAllVerifyImg } = require('../controller/verify.controller');
router.post('/', loginAuth, verify.single('verify'), create);
//查看图片
router.get('/img', getVerifyImg);
//获取所有验证图片
router.get('/img/cover', getAllVerifyImg);
module.exports = router;

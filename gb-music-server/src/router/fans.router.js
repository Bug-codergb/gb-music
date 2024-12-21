const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { create,cancelFans } = require('../controller/fans.controller');
//关注用户
router.post('/', loginAuth, create);
//取消关注
router.post("/cancel",loginAuth,cancelFans);
module.exports = router;

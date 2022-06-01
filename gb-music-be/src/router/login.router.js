const express = require('express');
const router = express.Router();
const { loginVerify } = require('../middleware/verify.middleware');
const { login } = require('../controller/login.controller');
//登录
router.post('/', loginVerify, login);
module.exports = router;

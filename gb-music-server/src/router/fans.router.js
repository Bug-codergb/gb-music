const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { create } = require('../controller/fans.controller');
//关注用户
router.post('/', loginAuth, create);
module.exports = router;

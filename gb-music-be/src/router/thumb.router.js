const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { create, cancel } = require('../controller/thumb.controller');
//点赞
router.post('/', loginAuth, create);
//取消点赞
router.post('/cancel', loginAuth, cancel);
module.exports = router;

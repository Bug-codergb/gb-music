const express = require('express');
const expressWs = require('express-ws');
const router = express.Router();
expressWs(router);
const { loginAuth } = require('../middleware/auth.middleware');
const { getLineUser, getLineCount } = require('../controller/line.controller');
router.ws('/user', getLineUser);
router.ws('/count', getLineCount);
module.exports = router;

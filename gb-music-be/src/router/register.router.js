const express = require('express');
const router = express.Router();
const { registerVerify } = require('../middleware/verify.middleware');
const { create } = require('../controller/register.controller');
router.post('/', registerVerify, create);
module.exports = router;

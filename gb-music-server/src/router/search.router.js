const express = require('express');
const router = express.Router();
const { getSearchMatch } = require('../controller/search.controller');
//搜索匹配
router.get('/', getSearchMatch);
module.exports = router;

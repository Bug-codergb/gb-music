const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { create, deleteCombo, updateCombo, getAllCombo } = require('../controller/combo.controller');
router.post('/', loginAuth, create);
//删除
router.post('/delete', loginAuth, deleteCombo);
//更新套餐
router.post('/update', loginAuth, updateCombo);
//获取套餐
router.get('/all', loginAuth, getAllCombo);
module.exports = router;

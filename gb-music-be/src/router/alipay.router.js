const express = require('express');
const router = express.Router();
const { create, queryStatus, joinVIP, closeOrder } = require('../controller/alipay.controller');
const { loginAuth } = require('../middleware/auth.middleware');
router.post('/', loginAuth, create);
router.post('/query', loginAuth, queryStatus);
//关闭订单
router.post('/close', loginAuth, closeOrder);
router.post('/join', loginAuth, joinVIP);
//更新数据库订单信息
//router.post("/update",loginAuth,updateOrderStatus)
module.exports = router;

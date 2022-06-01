const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const {
  getVipMessage,
  getUserHistoryVIP,
  deleteHistory,
  getVIPOrderData
} = require('../controller/vip.controller');
//查询vip信息
router.get('/', loginAuth, getVipMessage);
//获取用户VIP历史信息
router.post('/history', loginAuth, getUserHistoryVIP);
//删除VIP纪录
router.post('/history/delete', loginAuth, deleteHistory);

//获取订单数据
router.get('/order/data', loginAuth, getVIPOrderData);
module.exports = router;

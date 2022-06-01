const express = require('express');
const router = express.Router();
const { loginAuth } = require('../middleware/auth.middleware');
const { getAllOrder } = require('../controller/order.controller');
router.post('/all', loginAuth, getAllOrder);
module.exports = router;

const { getAllOrderService } = require('../service/order.service');
class OrderController {
  async getAllOrder(req, res, next) {
    const { offset = '0', limit = '20', order = -1, status = -1 } = req.body;
    const result = await getAllOrderService(offset, limit, order, status);
    res.json(result);
  }
}
module.exports = new OrderController();

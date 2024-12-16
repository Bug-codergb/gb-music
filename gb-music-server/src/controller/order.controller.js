const { getAllOrderService } = require('../service/order.service');
class OrderController {
  async getAllOrder(req, res, next) {
    let  { offset = '0', limit = '20', order = -1, status = -1 } = req.body;

    limit = `${limit}`;
    offset = `${offset}`
    const result = await getAllOrderService(offset, limit, order, status);
    res.json(result);
  }
}
module.exports = new OrderController();

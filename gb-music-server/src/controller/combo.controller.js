const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const {
  createService,
  deleteComboService,
  updateComboService,
  getAllComboService
} = require('../service/combo.service');
class ComboController {
  async create(req, res, next) {
    const { name, price } = req.body;
    if (!isEmpty(name, '名称不能为空', next) && !isEmpty(price, '价格不能为空', next)) {
      const result = await createService(name, price);
      res.json(result);
    }
  }
  async deleteCombo(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await deleteComboService(id);
      res.json(result);
    }
  }
  async updateCombo(req, res, next) {
    const { id = '', name = '', price = '' } = req.body;
    const result = await updateComboService(id, name, price);
    res.json(result);
  }
  async getAllCombo(req, res, next) {
    try {
      const result = await getAllComboService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
}
module.exports = new ComboController();

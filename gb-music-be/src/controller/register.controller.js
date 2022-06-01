const { registerService } = require('../service/register.service');
const { isEmpty } = require('../utils/isEmpty');
class RegisterController {
  async create(req, res, next) {
    const { userName, password } = req.body;
    if (!isEmpty(userName, '用户名不能为空', next) && !isEmpty(password, '密码不能为空', next)) {
      const result = await registerService(userName, password);
      res.json(result);
    }
  }
}
module.exports = new RegisterController();

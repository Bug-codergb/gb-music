const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const { createService, hasCreatedService,cancelFansService } = require('../service/fans.service');
class FansController {
  async create(req, res, next) {
    try {
      const { userId } = req.user;
      const { upId } = req.body;
      if (!isEmpty(upId, '用户ID不能为空', next)) {
        const has = await hasCreatedService(userId, upId);
        if (!has[0]) {
          const result = await createService(userId, upId);
          res.json(result);
        } else {
          next(new Error(errorType.AlREADLY_FOLLOWING));
        }
      }
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async cancelFans(req,res,next){
    try{
      const { userId,upId } = req.body;
      if(!isEmpty(userId,"用户ID不能为空",next) && !isEmpty(upId,"upId不能为空",next)){
        const result = cancelFansService(userId,upId);
        res.json(result);
      }
    }catch (e) {

    }
  }
}
module.exports = new FansController();

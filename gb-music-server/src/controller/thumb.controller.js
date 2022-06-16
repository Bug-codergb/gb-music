const errorType = require('../constants/errorType');
const { createService, getThumbByUserService, cancelService } = require('../service/thumb.service');
class ThumbController {
  async create(req, res, next) {
    const { userId } = req.user;
    const source = Object.keys(req.body);
    if (source.length !== 0) {
      const key = source[0];
      const id = req.body[key];
      const result = await getThumbByUserService(userId, key, id);
      if (result.length === 0) {
        const result = await createService(userId, key, id);
        res.json(result);
      } else {
        next(new Error(errorType.ALREADY_THUMBED));
      }
    } else {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
  async cancel(req, res, next) {
    const { userId } = req.user;
    const source = Object.keys(req.body);
    if (source.length !== 0) {
      const key = source[0];
      const id = req.body[key];
      const result = await cancelService(id, key, userId);
      res.json(result);
    } else {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
}
module.exports = new ThumbController();

const path = require('path');
const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const {
  createService,
  getVerifyImgService,
  getAllVerifyImgService
} = require('../service/verify.service');
class VerifyController {
  async create(req, res, next) {
    const { innerId } = req.query;
    const { originalname, mimetype, destination, filename, size } = req.file;
    if (
      !isEmpty(innerId, 'innerId不能为空', next) &&
      !isEmpty(mimetype, 'mimetype不能为空', next)
    ) {
      let result = null;
      if (!innerId) {
        result = await createService(originalname, mimetype, destination, filename, size);
      } else {
        result = await createService(originalname, mimetype, destination, filename, size, innerId);
      }
      res.json(result);
    }
  }
  async getVerifyImg(req, res, next) {
    try {
      const { id } = req.query;
      if (!isEmpty(id, 'id不能为空', next)) {
        const result = await getVerifyImgService(id);
        if (result.length !== 0) {
          const { filename, mimetype, dest } = result[0];
          res.set('content-type', mimetype);
          const filePath = path.resolve(__dirname, '../../', `${dest}/${filename}`);
          res.sendFile(filePath);
        }
      }
    } catch (e) {
      console.log(e);
    }
  }
  async getAllVerifyImg(req, res, next) {
    try {
      const result = await getAllVerifyImgService();
      res.json(result);
    } catch (e) {
      next(errorType.SERVER_INTERNAL_ERROR);
    }
  }
}
module.exports = new VerifyController();

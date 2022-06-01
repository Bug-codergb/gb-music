const path = require('path');
const { selectBannerType } = require('../utils/bannerType');
const { isExistsFile } = require('../utils/isExists');
const { delFile } = require('../utils/deleteFile');
const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const {
  createService,
  uploadImgService,
  getBannerImgService,
  getRecBannerService,
  getBannerListService,
  getBannerFileMsgService,
  deleteBannerService
} = require('../service/banner.service');
class BannerController {
  async create(req, res, next) {
    try {
      const source = Object.keys(req.body);
      const key = source[0];
      const id = req.body[source[0]];
      const type = selectBannerType(key);
      const result = await createService(key, id, type);
      res.json({
        id: result
      });
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //上传banner图片
  async uploadImg(req, res, next) {
    try {
      const { originalname, mimetype, destination, filename, size } = req.file;
      const source = Object.keys(req.query);
      const key = source[0];
      const id = req.query[source[0]];
      const result = await uploadImgService(
        key,
        id,
        originalname,
        mimetype,
        destination,
        filename,
        size
      );
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取banner图片
  async getBannerImg(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await getBannerImgService(id);
      const { mimetype, dest, filename } = result[0];
      res.set('content-type', mimetype);
      res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
    }
  }
  //获取banner
  async getRecBanner(req, res, next) {
    try {
      const result = await getRecBannerService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取所有banner详细信息
  async getBannerList(req, res, next) {
    try {
      const result = await getBannerListService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //删除banner
  async deleteBanner(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, 'id不能为空', next)) {
      const msg = await getBannerFileMsgService(id);
      if (msg.length !== 0) {
        const { originalname, mimetype, dest, filename, size } = msg[0];
        const rootPath = path.resolve(__dirname, '../../');
        const filePath = path.resolve(rootPath, `${dest}/${filename}`);
        try {
          const data = await isExistsFile(filePath);
          const del = await delFile(data);
          const result = await deleteBannerService(id);
          res.json(result);
        } catch (e) {
          console.log(e);
        }
      }
    }
  }
}
module.exports = new BannerController();

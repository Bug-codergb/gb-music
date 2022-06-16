const path = require('path');
const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const { isExistsFile } = require('../utils/isExists');
const { delFile } = require('../utils/deleteFile');
const {
  createService,
  uploadPicService,
  delMomentService,
  getMomentByIdService,
  getSongService,
  getPictureByIdService,
  getAllMomentService,
  getMomentCountService,
  getHotMomentService
} = require('../service/moment.service');
class MomentController {
  async create(req, res, next) {
    const { userId } = req.user;
    const { content, songId, tId } = req.body;
    if (
      !isEmpty(content, '动态内容不能为空', next) &&
      !isEmpty(songId, '歌曲ID不能为空', next) &&
      !isEmpty(tId, '话题内容不能为空', next)
    ) {
      const result = await createService(content, userId, songId, tId);
      res.json({ id: result });
    }
  }
  //上传动态图片
  async uploadPic(req, res, next) {
    const { id } = req.query;
    const { originalname, mimetype, destination, filename, size } = req.file;
    if (!isEmpty(id, '动态ID不能为空', next) && !isEmpty(mimetype, 'mimetype不能为空', next)) {
      const result = await uploadPicService(
        id,
        originalname,
        mimetype,
        destination,
        filename,
        size
      );
      res.json(result);
    }
  }
  //获取动态图片
  async getMomentPic(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '动态ID不能为空', next)) {
      const pic = await getPictureByIdService(id);
      if (pic.length !== 0) {
        const { mimetype, dest, filename } = pic[0];
        res.set('content-type', mimetype);
        res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
      }
    }
  }
  //删除动态
  async delMoment(req, res, next) {
    const { id } = req.body;
    const { userId } = req.user;
    if (!isEmpty(id, '动态ID不能为空', next)) {
      const isAuth = await getMomentByIdService(id, userId);
      try {
        if (isAuth.length !== 0) {
          const { id, userId, dest, filename } = isAuth[0];
          const sourcePath = path.resolve(__dirname, '../../', `${dest}/${filename}`);
          const data = await isExistsFile(sourcePath);
          await delFile(data);
        } else {
          next(new Error(errorType.NO_OPERATION_PERMISSION));
        }
      } catch (e) {
        next(new Error(errorType.FILE_OPERATION_FAILED));
      } finally {
        const result = await delMomentService(id, userId);
        res.json(result);
      }
    }
  }
  //获取搜索song
  async getSong(req, res, next) {
    const { keyword = '' } = req.query;
    if (keyword.trim().length === 0) {
      res.json([]);
    } else {
      const result = await getSongService(keyword);
      res.json(result);
    }
  }
  //获取所有动态
  async getAllMoment(req, res, next) {
    try {
      const { offset, limit } = req.query;
      const result = await getAllMomentService(offset, limit);
      const data = await getMomentCountService();
      const { count } = data[0];
      res.json({
        count: count,
        moments: result
      });
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取推荐动态
  async getHotMoment(req, res, next) {
    try {
      const result = await getHotMomentService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
}
module.exports = new MomentController();

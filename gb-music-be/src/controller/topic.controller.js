const path = require('path');
const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const {
  createService,
  uploadCoverService,
  getTopicCoverService,
  getHotTopicService,
  getTopicDetailService,
  getAllTopicService
} = require('../service/topic.service');
class TopicController {
  async create(req, res, next) {
    const { name, description } = req.body;
    const { userId } = req.user;
    if (
      !isEmpty(name, '话题名称不能为空', next) &&
      !isEmpty(description, '话题简介不能为空', next)
    ) {
      const result = await createService(name, description, userId);
      res.json({ id: result });
    }
  }
  async uploadCover(req, res, next) {
    const { id } = req.query;
    const { originalname, mimetype, destination, filename, size } = req.file;
    if (!isEmpty(id, '话题id不能为空', next) && !isEmpty(mimetype, 'mimetype不能为空', next)) {
      const result = await uploadCoverService(
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
  async getTopicCover(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '话题id不能为空', next)) {
      const result = await getTopicCoverService(id);
      const { mimetype, dest, filename } = result[0];
      res.set('Content-type', mimetype);
      res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
    }
  }
  //获取热门话题
  async getHotTopic(req, res, next) {
    try {
      const result = await getHotTopicService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取话题详情
  async getTopicDetail(req, res, next) {
    const { offset = '0', limit = '30', id } = req.query;
    if (!isEmpty(id, '话题id不能为空', next)) {
      const result = await getTopicDetailService(id, offset, limit);
      res.json(result);
    }
  }
  //获取所有话题
  async getAllTopic(req, res, next) {
    try {
      const result = await getAllTopicService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
}
module.exports = new TopicController();

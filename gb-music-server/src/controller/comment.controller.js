const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const {
  createService,
  replyCommentService,
  getAllCommentService,
  getUserCommentService,
  deleteCommentService
} = require('../service/comment.service');
class CommentController {
  async create(req, res, next) {
    const { userId } = req.user;
    const { content } = req.body;
    if (!isEmpty(content, '内容不能为空', next)) {
      let source = Object.keys(req.body).filter((item, index) => {
        return item !== 'content';
      });
      const key = source[0];
      const id = req.body[source[0]];
      const result = await createService(userId, content, key, id);
      res.json(result);
    }
  }
  //回复评论
  async replyComment(req, res, next) {
    const { userId } = req.user;
    const { content, id } = req.body;
    if (!isEmpty(content, '评论内容不能为空', next) && !isEmpty(id, '评论ID不能为空', next)) {
      const result = await replyCommentService(userId, content, id);
      res.json(result);
    }
  }
  //获取所有评论
  async getAllComment(req, res, next) {
    try {
      const { offset = '0', limit = '30' } = req.query;
      const source = Object.keys(req.query).filter((item, index) => {
        return item !== 'offset' && item !== 'limit';
      });
      const key = source[0];
      const id = req.query[key];
      const result = await getAllCommentService(offset, limit, key, id);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
  //删除评论
  async deleteComment(req, res, next) {
    const { userId } = req.user;
    const { id } = req.body;
    if (!isEmpty(id, 'id不能为空', next)) {
      const com = await getUserCommentService(userId, id);
      if (com.length === 0) {
        next(new Error(errorType.NO_OPERATION_PERMISSION));
      } else {
        const result = await deleteCommentService(userId, id);
        res.json(result);
      }
    }
  }
}
module.exports = new CommentController();

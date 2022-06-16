const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const { message } = require('../constants/message');
const {
  publishAlbumService,
  createPlaylistService,
  thumbCommentService,
  publishVideoService,
  publishChannelService,
  getMessageService,
  thumbCommentMsgService,
  publishAlbumMsgService,
  readMessageService,
  getMessageVideoService,
  getThumbCommentService,
  getAlbumMsgService,
  getPlaylistMsgService,
  getChannelMsgService,
  deleteMsgService,
  readSingleMsgService
} = require('../service/message.service');
class MessageController {
  async publishAlbum(req, res, next) {
    try {
      const { arId, content, alId } = req.body;
      if (
        !isEmpty(arId, '歌手ID不能为空', next) &&
        !isEmpty(content, '内容不能为空', next) &&
        !isEmpty(alId, '专辑Id不能为空', next)
      ) {
        if (!message.includes(content)) {
          next(new Error(errorType.YOU_DID_SOMETHING_WRONG));
        } else {
          const result = await publishAlbumService(arId, content, alId);
          res.json(result);
        }
      }
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async createPlaylist(req, res, next) {
    try {
      const { content, pId } = req.body;
      if (!isEmpty(content, '内容不能为空', next) && !isEmpty(pId, '歌单ID不能为空', next)) {
        if (!message.includes(content)) {
          next(new Error(errorType.YOU_DID_SOMETHING_WRONG));
        } else {
          const { userId } = req.user;
          const result = await createPlaylistService(userId, content, pId);
          res.json(result);
        }
      }
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //点赞了评论
  async thumbComment(req, res, next) {
    try {
      const { content, cId } = req.body;
      if (!isEmpty(content, '内容不能为空', next) && !isEmpty(cId, '电台id不能为空', next)) {
        if (!message.includes(content)) {
          next(new Error(errorType.YOU_DID_SOMETHING_WRONG));
        } else {
          const { userId } = req.user;
          const result = await thumbCommentService(userId, cId, content);
          res.json(result);
        }
      }
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //发布了视频
  async publishVideo(req, res, next) {
    try {
      const { content, vId } = req.body;
      if (isEmpty(content, '内容不能为空', next) && !isEmpty(vId, '视频ID不能为空', vId)) {
        if (!message.includes(content)) {
          next(new Error(errorType.YOU_DID_SOMETHING_WRONG));
        } else {
          const { userId } = req.user;
          const result = await publishVideoService(userId, vId, content);
          res.json(result);
        }
      }
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //发布了声音
  async publishChannel(req, res, next) {
    try {
      const { content, ccId } = req.body;
      if (!isEmpty(content, '内容不能为空', next) && !isEmpty(ccId, '电台ID不能为空', next)) {
        if (!message.includes(content)) {
          next(new Error(errorType.YOU_DID_SOMETHING_WRONG));
        } else {
          const { userId } = req.user;
          const result = await publishChannelService(userId, ccId, content);
          res.json(result);
        }
      }
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取通知
  async getMessage(req, res, next) {
    const { userId } = req.user;
    const msg = await getMessageService(userId);
    const com = await thumbCommentMsgService(userId);
    const albums = await publishAlbumMsgService(userId);
    try {
      let video = [],
        channel = [],
        playlist = [],
        comment = [],
        album = [],
        count = 0;
      video = msg.filter((item, index) => {
        return item.video !== null;
      });
      channel = msg.filter((item, index) => {
        return item.channel !== null;
      });
      playlist = msg.filter((item, index) => {
        return item.playlist !== null;
      });
      comment = com.filter((item, index) => {
        return item.comment !== null;
      });
      album = albums.filter((item, index) => {
        return item.artist !== null;
      });
      count = video.length + channel.length + playlist.length + comment.length + album.length;
      res.json({
        count,
        message: {
          video,
          channel,
          playlist,
          comment,
          album
        }
      });
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //一键已读
  async readMessage(req, res, next) {
    const { id } = req.body;
    if (id.length !== 0) {
      const result = await readMessageService(id);
      res.json(result);
    } else {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
  async getMessageVideo(req, res, next) {
    try {
      const { userId } = req.user;
      const { offset = '0', limit = '15' } = req.body;
      const result = await getMessageVideoService(userId, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //点赞了评论
  async getThumbComment(req, res, next) {
    try {
      const { userId } = req.user;
      const { offset = '0', limit = '15' } = req.body;
      const result = await getThumbCommentService(userId, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //发布了专辑
  async getAlbumMsg(req, res, next) {
    try {
      const { userId } = req.user;
      const { offset = '0', limit = '15' } = req.body;
      const result = await getAlbumMsgService(userId, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async getPlaylistMsg(req, res, next) {
    try {
      const { userId } = req.user;
      const { offset = '0', limit = '15' } = req.body;
      const result = await getPlaylistMsgService(userId, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async getChannelMsg(req, res, next) {
    try {
      const { userId } = req.user;
      const { offset = '0', limit = '15' } = req.body;
      const result = await getChannelMsgService(userId, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async deleteMsg(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '消息ID不能为空', next)) {
      const result = await deleteMsgService(id);
      res.json(result);
    }
  }
  //已读消息(一条)
  async readSingleMsg(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '消息ID不能为空', next)) {
      const result = await readSingleMsgService(id);
      res.json(result);
    }
  }
}
module.exports = new MessageController();

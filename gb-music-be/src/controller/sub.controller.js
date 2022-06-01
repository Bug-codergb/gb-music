const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const {
  subMusicService,
  cancelSubService,
  getMusicByIdService,
  getUserSubService,
  getUserPlaylistService,

  getUserSubAlbumService,
  getUserSubArtistService,
  getUserSubVideoService,
  getUserChannelService
} = require('../service/sub.service');
class SubController {
  async subMusic(req, res, next) {
    const { userId } = req.user;
    const source = Object.keys(req.body);
    const key = source[0];
    const sub = await getMusicByIdService(userId, req.body[key], key);
    if (sub.length === 0) {
      const result = await subMusicService(userId, req.body[key], key);
      res.json(result);
    } else {
      next(new Error(errorType.COLLECTED));
    }
  }
  //取消收藏
  async cancelSub(req, res, next) {
    try {
      const { userId } = req.user;
      const source = Object.keys(req.body);
      const key = source[0];
      const result = await cancelSubService(userId, req.body[key], key);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取用户收藏
  async getUserSub(req, res, next) {
    const { userId } = req.user;
    const { offset = '0', limit = '30' } = req.query;
    const { subName } = req.params;
    if (!isEmpty(subName, '收藏类型不能为空', next)) {
      if (subName === 'album') {
        const result = await getUserSubAlbumService(userId, offset, limit);
        res.json(result);
      } else if (subName === 'artist') {
        const result = await getUserSubArtistService(userId, offset, limit);
        res.json(result);
      } else if (subName === 'video') {
        const result = await getUserSubVideoService(userId, offset, limit);
        res.json(result);
      } else if (subName === 'channel') {
        const result = await getUserChannelService(userId, offset, limit);
        res.json(result);
      }
    }
  }
  //获取用户收藏歌单
  async getUserPlaylist(req, res, next) {
    const { userId } = req.body;
    if (!isEmpty(userId, '用户ID不能为空', next)) {
      const { offset = '0', limit = '8' } = req.query;
      const result = await getUserPlaylistService(userId, offset, limit);
      res.json(result);
    }
  }
}
module.exports = new SubController();

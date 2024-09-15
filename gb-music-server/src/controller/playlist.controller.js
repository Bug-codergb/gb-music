const path = require('path');
const { tran } = require('../utils/tran');
const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const { isExistsFile } = require('../utils/isExists');
const { delFile } = require('../utils/deleteFile');
const {
  createService,
  uploadCoverService,
  getPlayListCoverService,
  addCateService,
  getUserPlaylistService,
  getRecPlaylistService,
  getPlayBySongService,
  addSongToPlayService,
  addCateForPlayService,
  judgePlaylistCateService,
  limitPlayCate,
  getPlayDetailService,
  getAllCateService,
  getCateDetailService,
  getPlayListCountService,
  getAllPlaylistService,
  delPlaylistService,
  getPlaylistCoverFileService,
  getSubUserService,
  getPlaylistService,
  updatePlayCountService,
  getIncludePlaylistService,
  getHotPlaylistService,
  getPlaylistDataService,
  updatePlaylistService,
  delPlaylistCateService
} = require('../service/playlist.service');
const { paramsCheckHandle } = require('../utils/paramsCheckHandle');
class PlaylistController {
  async create(req, res, next) {
    const { name, desc } = req.body;
    const { userId } = req.user;
    if (!isEmpty(name, '歌单名称不能为空', next) && !isEmpty(desc, '歌单简介不能为空', next)) {
      const result = await createService(name, desc, userId);
      res.json({
        id: result
      });
    }
  }
  //上传歌单封面
  async uploadCover(req, res, next) {
    const { pId } = req.query;
    const { originalname, mimetype, destination, filename, size } = req.file;
    if (!isEmpty(pId, '歌单ID不能为空', next) && !isEmpty(mimetype, 'mimetype不能为空', next)) {
      const result = await uploadCoverService(
        pId,
        originalname,
        mimetype,
        destination,
        filename,
        size
      );
      res.json(result);
    }
  }
  //获取歌单封面
  async getPlayListCover(req, res, next) {
    const { id, w = '150', h } = req.query;
    if (!isEmpty(id, '歌单ID不能为空', next)) {
      const result = await getPlayListCoverService(id);
      if(result.length!==0){
        const { mimetype, dest, filename } = result[0];
        const filePath = path.resolve(__dirname, '../../', dest, filename);
        try {
          const buffer = await tran(filePath, `${dest}/${filename}`, mimetype, w, h);
          res.set('content-type', mimetype);
          res.send(buffer);
        } catch (e) {
          res.set('content-type', mimetype);
          res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
        }
      }else{
        res.json({
          message:"暂无图片",
          status:404
        })
      }

    }
  }
  //添加歌单分类
  async addCate(req, res, next) {
    const { name } = req.body;
    if (!isEmpty(name, '分类名称不能为空', next)) {
      const result = await addCateService(name);
      res.json(result);
    }
  }
  //获取用户歌单
  async getUserPlaylist(req, res, next) {
    const { userId, offset = '0', limit = '30' } = req.query;
    if (!isEmpty(userId, '用户ID不能为空', next)) {
      const result = await getUserPlaylistService(userId, offset, limit);
      res.json(result);
    }
  }
  //获取推荐歌单
  async getRecPlaylist(req, res, next) {
    try {
      const { offset = '0', limit = '30' } = req.query;
      const result = await getRecPlaylistService(offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //添加个渠道歌单
  async addSongToPlay(req, res, next) {
    const { pId, songId } = req.body;
    if (!isEmpty(pId, '歌单id不能为空', pId) && !isEmpty(songId, '歌曲id不能为空', next)) {
      const result = await getPlayBySongService(pId, songId);
      if (result.length === 0) {
        const result = await addSongToPlayService(pId, songId);
        res.json(result);
      } else {
        next(new Error(errorType.SONG_ALREADY_EXISTS));
      }
    }
  }
  //为歌单添加分类
  async addCateForPlay(req, res, next) {
    const { pId, cateId } = req.body;
    if (!isEmpty(pId, '歌单id不能为空', next) && !isEmpty(cateId, '歌单ID不能为空', next)) {
      const result = await judgePlaylistCateService(pId, cateId);
      let { count } = await limitPlayCate(pId);
      if (!count) {
        count = 0;
      }
      if (result.length === 0 && count < 3) {
        const result = await addCateForPlayService(pId, cateId);
        res.json(result);
      } else if (result.length !== 0) {
        next(new Error(errorType.PLAY_LIST_CATE_ALREADY_EXISTS));
      } else if (count >= 3) {
        next(new Error(errorType.PLAYLIST_CATEGORIES_CANNOT_EXCEED_3));
      }
    }
  }
  //获取各单详情
  async getPlayDetail(req, res, next) {
    const { id } = req.query;
    console.log(id,"歌单id")
    if (!isEmpty(id, '歌单id不能为空', next)) {
      const result = await getPlayDetailService(id);
      console.log(result[0])
      res.json(result[0]);
    }
  }
  //获取所有歌单分类
  async getAllCate(req, res, next) {
    try {
      const { offset = '0', limit = '30' } = req.query;
      const result = await getAllCateService(offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取分类下歌单
  async getCateDetail(req, res, next) {
    try {
      const { cateId, limit = '20', offset = '0' } = req.query;
      const result = await getCateDetailService(cateId, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取全部歌单
  async getAllPlaylist(req, res, next) {
    const { offset = '0', limit = '30', keyword = '' } = req.query;
    const result = await getAllPlaylistService(offset, limit, keyword);
    const data = await getPlayListCountService(keyword);
    const { count } = data[0];
    res.json({
      count,
      playlists: result
    });
  }
  //删除歌单
  async delPlaylist(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '歌单ID不能为空', next)) {
      const result = await getPlaylistCoverFileService(id);
      const { dest, filename } = result[0];
      try {
        const data = await isExistsFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
        await delFile(data);
        const result = await delPlaylistService(id);
        res.json(result);
      } catch (e) {
        console.log(e);
        next(new Error(errorType.FILE_OPERATION_FAILED));
      }finally {
        const result = await delPlaylistService(id);
      }
    }
  }
  //获取歌单收藏者
  async getSubUser(req, res, next) {
    let { id, offset = '0', limit = '30' } = req.query;
    if (!isEmpty(id, '歌单id不能为空', next)) {
      const result = await getSubUserService(id, offset, limit);
      res.json(result);
    }
  }
  //为歌单添加播放量
  async addPlayCount(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '歌单id不能为空', next)) {
      const result = await getPlaylistService(id);
      let { playCount } = result[0];
      playCount += 1;
      await updatePlayCountService(playCount, id);
      res.json({
        message: 'ok'
      });
    }
  }
  //获取包含这首歌的歌单
  async getIncludePlaylist(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '歌单ID不能为空', next)) {
      const result = await getIncludePlaylistService(id);
      res.json(result);
    }
  }
  //获取热门歌单
  async getHotPlaylist(req, res, next) {
    try {
      const result = await getHotPlaylistService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取歌单数据
  async getPlaylistData(req, res, next) {
    try {
      const result = await getPlaylistDataService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //更新歌单信息
  async updatePlaylist(req, res, next) {
    const { name = '', desc = '', cate = [], id = '' } = req.body;
    if (
      name.trim().length === 0 ||
      desc.trim().length === 0 ||
      cate.length === 0 ||
      id.trim().length === 0
    ) {
      next(new Error(errorType.PARAMETER_ERROR));
    } else {
      const result = await updatePlaylistService(id, name, desc, cate);
      res.json(result);
    }
  }
  //删除歌单分类
  async delPlaylistCate(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '分类id不能为空', next)) {
      const result = await delPlaylistCateService(id);
      res.json(result);
    }
  }
}
module.exports = new PlaylistController();

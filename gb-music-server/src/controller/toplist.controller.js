const path = require('path');
const fs = require('fs');
const { isExistsFile } = require('../utils/isExists');
const { delFile } = require('../utils/deleteFile');
const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const {
  createToplistService,
  uploadCoverService,
  getToplistCoverService,
  getOfficialTopService,
  addSongToTopService,
  getSongOfficialService,
  getToplistDetailService,
  getHotToplistService,
  removeSongService,
  exportSongService,
  getToplistSimpleService,
  getSoarListService,
  getSimiToplistService,
  deleteToplistService,
  getAllToplistMsgService,
  updatePlayCountService,
  getToplistTypeCountService
} = require('../service/toplist.service');
class ToplistController {
  async createToplist(req, res, next) {
    const { name, desc,type=0 } = req.body;
    if (!isEmpty(name, '榜单名称不能为空', next) && !isEmpty(desc, '榜单简介不能为空', next)) {
      const result = await createToplistService(name, desc,type);
      res.json({ tId: result });
    }
  }
  //上传歌单封面
  async uploadCover(req, res, next) {
    const { tId } = req.query;
    const { originalname, destination, filename, size, mimetype } = req.file;
    if (!isEmpty(tId, '榜单id不能为空', next) && !isEmpty(mimetype, 'mimetype不能为空', next)) {
      const result = await uploadCoverService(
        tId,
        originalname,
        destination,
        filename,
        size,
        mimetype
      );
      res.json(result);
    }
  }
  //获取榜单封面
  async getToplistCover(req, res, next) {
    const { tId } = req.query;
    if (!isEmpty(tId, '榜单id不能为空', next)) {
      const result = await getToplistCoverService(tId);
      const { dest, filename, mimetype } = result[0];
      res.set('content-type', mimetype);
      res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
    }
  }
  //获取官方榜单
  async getOfficialTop(req, res, next) {
    try {
      const result = await getOfficialTopService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //将歌曲加入排行榜
  async addSongToTop(req, res, next) {
    try {
      const { tId, songId } = req.body;
      if (!isEmpty(tId, '榜单id不能为空', next) && !isEmpty(songId, '歌曲id不能为空', next)) {
        const result = await getSongOfficialService(tId, songId);
        if (result.length === 0) {
          const result = await addSongToTopService(tId, songId);
          res.json(result);
        } else {
          next(new Error(errorType.SONGS_ALREADY_ON_THE_TOPLIST));
        }
      }
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取榜单详情
  async getToplistDetail(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '榜单id不能为空', next)) {
      const type = await getToplistSimpleService(id);
      const { name } = type[0];
      if (name === '飙升榜') {
        const result = await getSoarListService(id);
        const songs = [];
        result.forEach((item, index) => {
          songs.push(item.song);
        });
        const { name, createTime, updateTime, coverUrl, description, type, playCount, user } =
          result[0];
        res.json({
          id,
          name,
          createTime,
          updateTime,
          coverUrl,
          description,
          type,
          playCount,
          user,
          songs
        });
      } else {
        const result = await getToplistDetailService(id);
        res.json(result ? result[0] : {});
      }
    }
  }
  //获取其它榜单
  async getHotToplist(req, res, next) {
    try {
      const result = await getHotToplistService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //移除排行榜歌曲
  async removeSong(req, res, next) {
    const { tId, sId } = req.body;
    if (!isEmpty(tId, '榜单id不能为空', next) && !isEmpty(sId, '歌曲id不能为空', next)) {
      const result = await removeSongService(tId, sId);
      res.json(result);
    }
  }
  //批量导入榜单
  async exportSong(req, res, next) {
    try {
      const result = await exportSongService();
      res.json({
        status: 200
      });
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取相关榜单
  async getSimiToplist(req, res, next) {
    try {
      const result = await getSimiToplistService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //删除排行榜
  async deleteToplist(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '榜单id不能为空', next)) {
      const data = await getAllToplistMsgService(id);
      if (data.length !== 0) {
        const info = data[0];
        const { dest, filename } = info;
        const root = path.resolve(__dirname, '../../', `${dest}/${filename}`);
        try {
          const isExists = await isExistsFile(root);
          const data = await delFile(isExists);
          await deleteToplistService(id);
          res.json({
            code: 200,
            message: '删除成功'
          });
        } catch (e) {
          await deleteToplistService(id);
          res.json({
            code: 200,
            message: '删除成功'
          });
        }
      } else {
        res.json({
          status: 400,
          message: '排行榜不存在'
        });
      }
    }
  }
  async addPlayCount(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await getAllToplistMsgService(id);
      if (result.length !== 0) {
        let { playCount } = result[0];
        playCount += 1;
        const data = await updatePlayCountService(id, playCount);
        res.json(data);
      } else {
        next(new Error(errorType.PARAMETER_ERROR));
      }
    }
  }
  async getToplistTypeCount(req,res,next){
    try{
      const ret = await getToplistTypeCountService();
      res.json(ret);
    }catch (e) {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
}
module.exports = new ToplistController();

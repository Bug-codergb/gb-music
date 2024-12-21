const path = require('path');
const { tran } = require('../utils/tran');
const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const { isExistsFile } = require('../utils/isExists');
const { delFile } = require('../utils/deleteFile');
const {
  createService,
  getChannelCoverService,
  delChannelService,
  addContentService,
  uploadContentCoverService,
  getContentCoverService,
  getAllChannelService,
  getContentService,
  getContentCountService,
  addProgramService,
  addProgramSourceService,
  getProgramService,
  getChannelDetailService,
  getUserChannelService,
  getUserChannelCountService,
  addPlayCountService,
  getHotChannelService,
  getChannelHotContentService,
  getProgramDetailService,
  getProgramURLService,
  getChannelSubUserService,
  getChannelDataService,
  updateCoverService,
  updateChannelService,
  getChannelContentFileService,
  deleteChannelContentService,
  getChannelFileService,
  getUserProgramListService,
  deleteProgramService,
  getUserChannelDetailService
} = require('../service/channel.service');
class ChannelController {
  async create(req, res, next) {
    const { content } = req.body;
    const { originalname, mimetype, destination, filename, size } = req.file;
    if (
      !isEmpty(content, '电台内容不能为空', next) &&
      !isEmpty(mimetype, 'mimetype不能为空', next)
    ) {
      if (content) {
        const result = await createService(
          content,
          originalname,
          mimetype,
          destination,
          filename,
          size
        );
        res.json(result);
      }
    }
  }
  async getChannelCover(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await getChannelCoverService(id);
      if (result.length !== 0) {
        const { mimetype, dest, filename } = result[0];
        res.set('content-type', mimetype);
        res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
      }
    }
  }
  async updateCover(req, res, next) {
    const { id } = req.body;
    const { originalname, mimetype, destination, filename, size } = req.file;
    if (!isEmpty(id, 'id不能为空', next) && !isEmpty(mimetype, 'mimetype不能为空', next)) {
      const result = await updateCoverService(
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
  async delChannel(req, res, next) {
    try {
      const { id } = req.body;
      if (!isEmpty(id, '电台ID不能为空', next)) {
        const fileData = await getChannelFileService(id);
        if (fileData.length !== 0) {
          const { dest, filename } = fileData[0];
          const rootPath = path.resolve(__dirname, '../../');
          const filePath = path.resolve(rootPath, `./${dest}/${filename}`);
          const data = await isExistsFile(filePath);
          await delFile(data);
        }
        const result = await delChannelService(id);
        res.json(result);
      }
    } catch (e) {
      next(new Error(errorType.FILE_OPERATION_FAILED));
    }
  }
  //添加频道内容
  async addContent(req, res, next) {
    const { cId, name, description } = req.body;
    if (
      !isEmpty(cId, '电台ID不能为空', next) &&
      !isEmpty(name, '电台名称不能为空', next) &&
      !isEmpty(description, '电台简介不能为空', next)
    ) {
      const { userId } = req.user;
      const result = await addContentService(cId, name, description, userId);
      res.json({
        id: result
      });
    }
  }
  //上传频道内容封面
  async uploadContentCover(req, res, next) {
    const { originalname, mimetype, destination, filename, size } = req.file;
    const { id } = req.body;
    if (!isEmpty(id, 'id不能为空', next) && !isEmpty(mimetype, 'mimetype不能为空', next)) {
      const result = await uploadContentCoverService(
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
  //获取频道内容图片
  async getContentCover(req, res, next) {
    const { id, w = '170', h } = req.query;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await getContentCoverService(id);
      const { originalname, mimetype, size, dest, filename } = result[0];
      try {
        const filePath = path.resolve(__dirname, '../../', dest, filename);
        const buffer = await tran(filePath, `${dest}/${filename}`, mimetype, w, h);
        res.set('content-type', mimetype);
        res.send(buffer);
      } catch (e) {
        console.log(e);
        res.set('content-type', mimetype);
        res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
      }
    }
  }
  //获取所有频道
  async getAllChannel(req, res, next) {
    try {
      const result = await getAllChannelService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取电台内容
  async getContent(req, res, next) {
    const { id, offset = '0', limit = '30' } = req.query;
    if (!isEmpty(id, 'ID不能为空', next)) {
      const data = await getContentCountService(id);
      const result = await getContentService(id, offset, limit);
      if (result.length !== 0) {
        const channel = result[0].channel;
        result.forEach((item, index) => {
          delete item.channel;
        });
        res.json({
          count: data[0].count,
          category: channel,
          channel: result
        });
      } else {
        res.json({
          count: 0,
          channel: [],
          message: '暂无结果'
        });
      }
    }
  }
  //上传program
  async addProgram(req, res, next) {
    try{
      const { name, cId } = req.body;
      const { userId } = req.user;
      if (name.trim().length !== 0 && cId.trim().length !== 0) {
        const result = await addProgramService(name, userId, cId);
        res.json({
          id: result
        });
      } else {
        next(new Error(errorType.PARAMETER_ERROR));
      }
    }catch (e) {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
  //添加program源文件
  async addProgramSource(req, res, next) {
    const { id } = req.query;
    const { mimetype, destination, filename, originalname, size } = req.file;
    const { dt } = req.body;
    if (
      !isEmpty(id, 'id不能为空', next) &&
      !isEmpty(dt, '时长不能为空', next) &&
      !isEmpty(mimetype, 'mimetype不能为空', next)
    ) {
      const result = await addProgramSourceService(
        id,
        mimetype,
        destination,
        filename,
        originalname,
        size,
        dt
      );
      res.json(result);
    }
  }
  //获取program
  async getProgram(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await getProgramService(id);
      const { mimetype, dest, filename } = result[0];
      res.set('content-type', mimetype);
      res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
    }
  }
  //获取电台详情
  async getChannelDetail(req, res, next) {
    const { id } = req.query;
    const { offset = '0', limit = '30' } = req.query;
    if (id) {
      let data = await getChannelDetailService(id, offset, limit);
      if (data.length !== 0) {
        const { channel } = data[0];
        data.forEach((item, index) => {
          delete item.channel;
        });
        if(data && data.length!==0) data = data.filter((item)=>item.id!==null && item.id!=='');
        channel.programs = data;
        res.json(channel);
      } else {
        res.json({
          message: '暂无声音'
        });
      }
    } else {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
  //获取用户电台
  async getUserChannel(req, res, next) {
    const { userId, cId, offset = '0', limit = '30' } = req.query;
    if (userId && cId) {
      const result = await getUserChannelService(userId, cId, offset, limit);
      res.json(result);
    } else {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
  //获取用户电台
  async getUserChannelCount(req, res, next) {
    const { userId } = req.query;
    if (!isEmpty(userId, '用户ID不能为空', next)) {
      const result = await getUserChannelCountService(userId);
      res.json(result);
    }
  }
  //添加播放量（节目）
  async addPlayCount(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await addPlayCountService(id);
      res.json(result);
    }
  }
  //获取热门电台
  async getHotChannel(req, res, next) {
    try {
      const result = await getHotChannelService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取（电台页） 各电台内容
  async getChannelHotContent(req, res, next) {
    try {
      const result = await getChannelHotContentService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async getProgramDetail(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await getProgramDetailService(id);
      res.json(result[0]);
    }
  }
  async getProgramURL(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await getProgramURLService(id);
      res.json(result[0]);
    }
  }
  async getChannelSubUser(req, res, next) {
    const { cId, offset = '0', limit = '30' } = req.query;
    if (!isEmpty(cId, '电台ID不能为空', next)) {
      const result = await getChannelSubUserService(cId, offset, limit);
      res.json(result);
    }
  }
  //获取电台数据
  async getChannelData(req, res, next) {
    try {
      const result = await getChannelDataService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //更新电台信息
  async updateChannel(req, res, next) {
    const { id = '', name = '', desc = '', cate = '' } = req.body;
    if (
      id.trim().length === 0 ||
      name.trim().length === 0 ||
      desc.trim().length === 0 ||
      cate.trim().length === 0
    ) {
      next(new Error(errorType.PARAMETER_ERROR));
    } else {
      const result = await updateChannelService(id, name, desc, cate);
      res.json(result);
    }
  }
  async deleteChannelContent(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, 'id不能为空', next)) {
      const fileData = await getChannelContentFileService(id);
      if (fileData.length !== 0) {
        const { dest, filename } = fileData[0];
        const rootPath = path.resolve(__dirname, '../../');
        const filePath = path.resolve(rootPath, `./${dest}/${filename}`);
        try {
          const data = await isExistsFile(filePath);
          await delFile(data);
          const result = await deleteChannelContentService(id);
          res.json(result);
        } catch (e) {}
      } else {
        next(new Error(errorType.PARAMETER_ERROR));
      }
    }
  }
  async getUserProgramList(req, res, next) {
    const { userId } = req.user;
    const result = await getUserProgramListService(userId);
    res.json(result);
  }
  async deleteProgram(req,res,next){
    const { id } = req.params;
    const ret = await deleteProgramService(id);
    res.json(ret);
  }
  async getUserChannelDetail(req,res,next){
    const { userId } = req.params;
    const ret = await getUserChannelDetailService(userId);
    res.json({
      channel:ret
    })
  }
}
module.exports = new ChannelController();

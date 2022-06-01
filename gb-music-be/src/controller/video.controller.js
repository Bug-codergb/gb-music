const path = require('path');
const { tran } = require('../utils/tran');
const jwt = require('jsonwebtoken');
const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const { MEDIA_PUBLIC_KEY, MEDIA_PRIVATE_KEY } = require('../app/config');
const { recommend } = require('../utils/recommend');
const fs = require('fs');
const { isExistsFile } = require('../utils/isExists');
const { delFile } = require('../utils/deleteFile');
const {
  addVideoCateService,
  addVideoService,
  uploadVideoService,
  getVideoSourceService,
  uploadCoverService,
  getVideoCoverService,
  getAllCateService,
  getCateVideoService,
  getVideoURLService,
  getVideoDetailService,
  delVideoService,
  getSimilarVideoService,
  addPlayCountService,
  updatePlayCountService,
  getVideoRankService,
  updateVideoService,
  getVideoDataService,
  getMVDataService,
  getRecUserListService,
  delVideoCateService
} = require('../service/video.service');
class VideoController {
  async addVideoCate(req, res, next) {
    const { type, name } = req.body;
    if (!isEmpty(type, '视频类型不能为空', next) && !isEmpty(name, '分类名称不能为空', next)) {
      const result = await addVideoCateService(name, type);
      res.json(result);
    }
  }
  //添加视频
  async addVideo(req, res, next) {
    let { name, desc, cateId, type, songId } = req.body;
    if (
      !isEmpty(name, '视频名称不能为空', next) &&
      !isEmpty(desc, '视频简介不能为空', next) &&
      !isEmpty(cateId, '视频分类ID不能为空', next) &&
      !isEmpty(type, '视频类型不能为空', next)
    ) {
      const { userId } = req.user;
      if (!songId) {
        songId = null;
      }
      const result = await addVideoService(name, desc, userId, cateId, type, songId);
      res.json({ id: result });
    }
  }
  //上传视频
  async uploadVideo(req, res, next) {
    const { vid } = req.query;
    const { dt } = req.body;
    if (!isEmpty(vid, '视频ID不能为空', next) && !isEmpty(dt, '视频时长不能为空', next)) {
      const { originalname, mimetype, destination, filename, size } = req.file;
      const result = await uploadVideoService(
        dt,
        vid,
        originalname,
        mimetype,
        destination,
        filename,
        size
      );
      res.json(result);
    }
  }
  //获取视频
  async getVideoSource(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '视频ID不能为空', next)) {
      const result = await getVideoSourceService(id);
      const { filename, size, mimetype, dest } = result[0];
      res.set('content-type', mimetype);
      res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
    }
  }
  //上传视频封面
  async uploadCover(req, res, next) {
    const { id } = req.query;
    const { originalname, mimetype, destination, filename, size } = req.file;
    if (!isEmpty(id, '视频id不能为空', next) && !isEmpty(mimetype, 'mimetype不能为空', next)) {
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
  //获取视频封面
  async getVideoCover(req, res, next) {
    const { id, w = '200', h } = req.query;
    if (!isEmpty(id, '视频ID不能为空', next)) {
      const result = await getVideoCoverService(id);
      const { size, filename, mimetype, dest } = result[0];
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
  //获取视频分类
  async getAllCate(req, res, next) {
    let { type } = req.query;
    if (!type) {
      type = 0;
    }
    const result = await getAllCateService(type);
    res.json(result);
  }
  //获取分类下视频
  async getCateVideo(req, res, next) {
    let { cateId, type, offset = '0', limit = '30', keyword = '' } = req.query;
    if (!isEmpty(cateId, '视频分类id不能为空', next)) {
      if (!type) {
        type = 0;
      }
      const result = await getCateVideoService(cateId, type, offset, limit, keyword);
      res.json(result);
    }
  }
  //获取视频URL
  async getVideoURL(req, res, next) {
    const { vid } = req.query;
    if (!isEmpty(vid, '视频id不能为空', next)) {
      const result = await getVideoURLService(vid);
      const { url, dt, name } = result[0];
      try {
        const tokenURL = jwt.sign({ url, vid }, MEDIA_PRIVATE_KEY, {
          expiresIn: 60 * 60 * 24 * 7,
          algorithm: 'RS256'
        });
        res.json({
          ...result[0],
          url: tokenURL
        });
      } catch (e) {
        console.log(e);
      }
    }
  }
  //获取视频详情
  async getVideoDetail(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '视频id不能为空', next)) {
      const result = await getVideoDetailService(id);
      res.json(result[0]);
    }
  }
  //删除视频
  async delVideo(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '视频id不能为空', next)) {
      const videoSource = await getVideoSourceService(id);
      try {
        if (videoSource.length !== 0) {
          let { dest, filename } = videoSource[0];
          const data = await isExistsFile(`${dest}/${filename}`);
          await delFile(data);
        }
        const coverSource = await getVideoCoverService(id);
        if (coverSource.length !== 0) {
          const { dest, filename } = coverSource[0];
          const data = await isExistsFile(`${dest}/${filename}`);
          await delFile(data);
        }
      } catch (e) {
        next(new Error(errorType.FILE_OPERATION_FAILED));
      } finally {
        const result = await delVideoService(id);
        res.json(result);
      }
    }
  }
  //获取相关视频
  async getSimilarVideo(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '视频id不能为空', next)) {
      const result = await getSimilarVideoService(id);
      res.json(result);
    }
  }
  //添加视频播放量
  async addPlayCount(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '视频id不能为空', next)) {
      const result = await addPlayCountService(id);
      let { playCount } = result[0];
      playCount += 1;
      await updatePlayCountService(id, playCount);
      res.json({
        message: 'ok'
      });
    }
  }
  //获取mv排行榜
  async getVideoRank(req, res, next) {
    const ids = await getAllCateService(1);
    if (ids.length !== 0) {
      const id = ids[0].id;
      const { cateId = id, offset = '0', limit = '30' } = req.query;
      const result = await getVideoRankService(cateId, offset, limit);
      res.json(result);
    } else {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //更新视频信息
  async updateVideo(req, res, next) {
    const { id, name = '', desc = '', cate } = req.body;
    if (!isEmpty(id, '视频id不能为空', next) && !isEmpty(cate, '分类不能为空', next)) {
      const result = await updateVideoService(id, name, desc, cate);
      res.json(result);
    }
  }
  //获取视频数据
  async getVideoData(req, res, next) {
    try {
      const result = await getVideoDataService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取MV数据
  async getMVData(req, res, next) {
    try {
      const result = await getMVDataService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取推荐视频
  async getRecVideo(req, res, next) {
    try {
      const { userId } = req.user;
      const result = await getRecUserListService();
      const userList = result.map((item, index) => {
        let tmp = [];
        tmp.push(...item.video);
        tmp.unshift(item.userId);
        return tmp;
      });
      const isThumb = userList.findIndex((item, index) => {
        return item.includes(userId);
      });
      if (isThumb !== -1) {
        const recVideo = recommend(userList.length, userList, userId);
        let videoList = [];
        if (recVideo.length !== 0) {
          for (let item of recVideo.slice(0, 8)) {
            const data = await getVideoDetailService(item.name);
            videoList.push(data[0]);
          }
        }
        res.json(videoList);
      } else {
        res.json([]);
      }
    } catch (e) {
      console.log(e);
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async delVideoCate(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '分类id不能为空', next)) {
      const result = await delVideoCateService(id);
      res.json(result);
    }
  }
}
module.exports = new VideoController();

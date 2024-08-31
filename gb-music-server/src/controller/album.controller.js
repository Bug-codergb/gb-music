const path = require('path');
const errorType = require('../constants/errorType');
const { tran } = require('../utils/tran');
const { isExistsFile } = require('../utils/isExists');
const { delFile } = require('../utils/deleteFile');
const { isEmpty } = require('../utils/isEmpty');
const {
  createService,
  addAlbumService,
  uploadCoverService,
  getAlbumCoverService,
  getAlbumCateService,
  getAllAlbumService,
  getAlbumDetailService,
  getRecAlbumService,
  getCateAlbumDetailService,
  delAlbumService,
  getCoverByIdService,
  getSourceByAlbumService,
  delAlbumSongService,
  getSongSourceService,
  getSubUserService,
  getHotAlbumService,
  getCateAlbumCountService,
  getAlbumDataService,
  updateAlbumService,
  delAlbumCateService
} = require('../service/album.service');
class AlbumController {
  //添加专辑分类
  async create(req, res, next) {
    const { name } = req.body;
    if (!isEmpty(name, '专辑分类不能为空', next)) {
      const result = await createService(name);
      res.json(result);
    }
  }
  //添加专辑
  async addAlbum(req, res, next) {
    try {
      const { name, publishTime, description, arId, cateId } = req.body;
      if (
        !isEmpty(name, '专辑名称不能为空', next) &&
        !isEmpty(publishTime, '专辑发布时间不能为空', next) &&
        !isEmpty(description, '专辑简介不能为空', next) &&
        !isEmpty(arId, '歌手ID不能为空', next) &&
        !isEmpty(cateId, '专辑分类ID不能为空', next)
      ) {
        const result = await addAlbumService(name, publishTime, description, arId, cateId);
        res.json({
          id: result,
          name
        });
      }
    } catch (e) {
      console.log(e);
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //上传专辑封面
  async uploadCover(req, res, next) {
    try {
      const { id } = req.query;
      if (!isEmpty(id, '专辑ID不能为空', next)) {
        const { originalname, mimetype, destination, filename, size } = req.file;
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
    } catch (e) {
      console.log(e);
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取专辑封面
  async getAlbumCover(req, res, next) {
    const { id, w = '130', h } = req.query;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await getAlbumCoverService(id);
      if(result.length!==0){
        const { dest, mimetype, filename } = result[0];
        try {
          const filePath = path.resolve(__dirname, '../../', dest, filename);
          const buffer = await tran(filePath, `${dest}/${filename}`, mimetype, w, h);
          res.set('content-type', mimetype);
          res.send(buffer);
        } catch (e) {
          res.set('content-type', mimetype);
          res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
        }
      }else{
        res.send({
          message:"封面未找到",
          status:400
        })
      }
    }
  }
  //获取专辑分类
  async getAlbumCate(req, res, next) {
    const result = await getAlbumCateService();
    res.json(result);
  }
  //获取所有专辑
  async getAllAlbum(req, res, next) {
    const { offset = '0', limit = '30' } = req.query;
    const result = await getAllAlbumService(offset, limit);
    res.json(result);
  }
  //获取专辑详情
  async getAlbumDetail(req, res, next) {
    try {
      const { albumId } = req.query;
      if (!isEmpty(albumId, '专辑ID不能为空', next)) {
        const result = await getAlbumDetailService(albumId);
        res.json(result[0]);
      }
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取推荐专辑
  async getRecAlbum(req, res, next) {
    try {
      const { offset = '0', limit = '30' } = req.query;
      const result = await getRecAlbumService(offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取分类下专辑
  async getCateAlbumDetail(req, res, next) {
    try {
      const { id = '', offset = '0', limit = '70', keyword = '' } = req.query;
      const countRes = await getCateAlbumCountService(id, keyword);
      let { count } = countRes;
      let result = await getCateAlbumDetailService(id, keyword, offset, limit);
      result = result || [];
      let albumName = '';
      const album = [];
      result.forEach((item, index) => {
        if (item.album) {
          album.push(item.album);
        }
      });
      if (result.length !== 0) {
        const { name } = result[0];
        albumName = name;
      }
      res.json({
        id,
        name: albumName,
        count,
        album
      });
    } catch (e) {
      console.log(e);
    }
  }
  //删除专辑
  async delAlbum(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, 'id不能为空', next)) {
      const cover = await getCoverByIdService(id);
      const { dest, filename } = cover[0];
      const filePath = path.resolve(__dirname, '../../', `${dest}/${filename}`);
      const songSource = await getSourceByAlbumService(id);
      try {
        if (songSource.length !== 0) {
          for (let item of songSource) {
            const { dest, filename } = item;
            const filePath = path.resolve(__dirname, '../../', `${dest}/${filename}`);
            const data = await isExistsFile(filePath);
            if (data) {
              await delFile(data);
            }
          }
        }
        const data = await isExistsFile(filePath);
        await delFile(data);
        const result = await delAlbumService(id);
        res.json({
          message: 'ok'
        });
      } catch (e) {
        console.log(e);
        next(new Error(errorType.FILE_OPERATION_FAILED));
      }
    }
  }
  //删除专辑下歌曲
  async delAlbumSong(req, res, next) {
    const { songId, alId } = req.body;
    if (!isEmpty(songId, '歌曲ID不能为空', next) && !isEmpty(alId, '专辑ID不能为空', next)) {
      const result = await getSongSourceService(songId, alId);
      const { dest, filename } = result[0];
      try {
        const data = await isExistsFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
        await delFile(data);
        const result = await delAlbumSongService(songId, alId);
        res.json(result);
      } catch (e) {
        console.log(e);
        next(new Error(errorType.FILE_OPERATION_FAILED));
      }
    }
  }
  //获取专辑收藏者
  async getSubUser(req, res, next) {
    const { id, offset = '0', limit = '30' } = req.query;
    if (!isEmpty(id, '专辑ID不能为空', next)) {
      const result = await getSubUserService(id, offset, limit);
      res.json(result);
    }
  }
  //获取热门专辑
  async getHotAlbum(req, res, next) {
    try {
      const result = await getHotAlbumService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取专辑数据
  async getAlbumData(req, res, next) {
    try {
      const result = await getAlbumDataService();
      let total = 0;
      let data = [];
      if (result.length !== 0) {
        result.forEach((item, index) => {
          data.push(item.album);
        });
      }
      total = data
        .map((item, index) => {
          return item.count;
        })
        .reduce((prev, next) => {
          return prev + next;
        });
      res.json({
        total,
        album: data
      });
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //更新专辑信息
  async updateAlbum(req, res, next) {
    const { alId, name = '', desc = '', publishTime = '' } = req.body;
    if (name.length === 0 && desc.length === 0 && publishTime.length === 0) {
      next(new Error(errorType.PARAMETER_ERROR));
    } else {
      const result = await updateAlbumService(alId, name, desc, publishTime);
      res.json(result);
    }
  }
  //删除专辑分类
  async delAlbumCate(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '分类id不能为空', next)) {
      const result = await delAlbumCateService(id);
      res.json(result);
    }
  }
}
module.exports = new AlbumController();

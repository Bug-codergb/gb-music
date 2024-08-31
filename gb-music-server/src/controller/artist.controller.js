const path = require('path');
const errorType = require('../constants/errorType');
const { isExistsFile } = require('../utils/isExists');
const { delFile } = require('../utils/deleteFile');
const pinyin_dict = require('../static/pinyin_dict_notone');
const pinyinUtil = require('../static/pinyinUtil');
const { isEmpty } = require('../utils/isEmpty');
const {
  createService,
  uploadAvatarService,
  getAvatarService,
  addArtistCateService,
  getArtistCateService,
  getAllArtistService,
  getCateArtistService,
  setArtistCateService,
  getRecArtistService,
  getArtistDetailService,
  delArtistService,
  getArtistAvatarService,
  getArtistMVService,
  getSimiArtistService,
  addArtistTypeService,
  setArtistTypeService,
  getArtistTypeService,
  getArtistAlbumService,
  getArtistSongService,
  updateUserMsgService,
  getArtistDataService,
  getHotArtistService,
  deleteCateService,
  deleteArtistTypeService
} = require('../service/artist.service');
class ArtistController {
  //添加歌手
  async create(req, res, next) {
    const { name = '', desc = '', area = '' } = req.body;
    if (
      !isEmpty(name, '歌手名称不能为空', next) &&
      !isEmpty(desc, '歌手简介不能为空', next) &&
      !isEmpty(area, '歌手类型不能为空', next)
    ) {
      const result = await createService(name, desc, area);
      res.json(result);
    }
  }
  //添加歌手头像
  async uploadAvatar(req, res, next) {
    const { originalname, mimetype, destination, filename, size } = req.file;
    const { arId = '' } = req.query;
    if (!isEmpty(arId, '歌手ID不能为空', next)) {
      const result = await uploadAvatarService(
        arId,
        originalname,
        mimetype,
        destination,
        filename,
        size
      );
      res.json(result);
    }
  }
  //获取歌手头像
  async getAvatar(req, res, next) {
    const { id = '' } = req.query;
    if (!isEmpty(id, 'ID不能为空', next)) {
      const result = await getAvatarService(id);
      if (result[0]) {
        const { dest, mimetype, filename } = result[0];
        res.set('content-type', mimetype);
        res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
      } else {
        next(new Error(errorType.NO_AVATAR));
      }
    }
  }
  //添加歌手分类
  async addArtistCate(req, res, next) {
    const { name = '' } = req.body;
    if (!isEmpty(name, '分类名称不能为空', next)) {
      const result = await addArtistCateService(name);
      res.json(result);
    }
  }
  //获取歌手分类
  async getArtistCate(req, res, next) {
    try {
      const result = await getArtistCateService();
      result.unshift({ id: '0', name: '全部' });
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //设置歌手cate
  async setArtistCate(req, res, next) {
    const { arId = '', cateId = '' } = req.body;
    if (!isEmpty(arId, '歌手ID不能为空', next) && !isEmpty(cateId, '分类ID不能为空', next)) {
      const result = await setArtistCateService(arId, cateId);
      res.json(result);
    }
  }
  //获取所有歌手
  async getAllArtist(req, res, next) {
    try {
      const { offset = '0', limit = '30' } = req.query;
      const result = await getAllArtistService(offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取分类下歌手
  async getCateArtist(req, res, next) {
    const {
      offset = '0',
      limit = '40',
      area = 0,
      type = '0',
      letter = '',
      keyword = ''
    } = req.query;
    if (letter !== '全部') {
      let result = await getCateArtistService(offset, '1000000', area, type, letter, keyword);
      let data = result.result.filter((item, index) => {
        const arName = global.pinyinUtil.getPinyin(item.name);
        return arName.toUpperCase().charAt(0) === letter;
      });
      res.json({
        count: data.length,
        artists: data.slice(offset * 1, offset * 1 + limit * 1)
      });
    } else {
      let result = await getCateArtistService(offset, limit, area, type, letter, keyword);
      res.json({
        count: result.count,
        artists: result.result
      });
    }
  }
  //获取推荐歌手
  async getRecArtist(req, res, next) {
    try {
      const { offset = '0', limit = '30' } = req.query;
      const result = await getRecArtistService(offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取歌手详情
  async getArtistDetail(req, res, next) {
    try {
      const { id = '' } = req.query;
      if (!isEmpty(id, '歌手ID不能为空', next)) {
        const result = await getArtistDetailService(id);
        res.json(result[0]);
      }
    } catch (e) {
      console.log(e);
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //删除歌手
  async delArtist(req, res, next) {
    try {
      const { id = '' } = req.body;
      if (!isEmpty(id, '歌手ID不能为空', next)) {
        const avatarFile = await getArtistAvatarService(id);
        const { dest, filename } = avatarFile[0]||{};
        if(dest&& filename){
          const filePath = path.resolve(__dirname, '../../', `${dest}/${filename}`);
          isExistsFile(filePath)
            .then((data) => {
              delFile(data).then(async (data) => {
                const result = await delArtistService(id);
                res.json(result);
              });
            })
            .catch((err) => {
              return new Error(errorType.FILE_OPERATION_FAILED);
            });
        }else{
          const result = await delArtistService(id);
          res.json(result);
        }
      }
    } catch (e) {
      console.log(e);
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取歌手MV
  async getArtistMV(req, res, next) {
    try {
      const { id = '' } = req.query;
      if (!isEmpty(id, '歌手ID不能为空', next)) {
        const result = await getArtistMVService(id);
        res.json(result);
      }
    } catch (e) {
      console.log(e);
    }
  }
  //获取相似歌手
  async getSimiArtist(req, res, next) {
    const { area, offset = '0', limit = '15' } = req.query;
    if (!isEmpty(area, '歌手类型不能为空', next)) {
      const result = await getSimiArtistService(area, offset, limit);
      res.json(result);
    }
  }
  //添加歌手type
  async addArtistType(req, res, next) {
    const { name } = req.body;
    if (!isEmpty(name, '类型名称不能为空', next)) {
      const result = await addArtistTypeService(name);
      res.json(result);
    }
  }
  //设置歌手type
  async setArtistType(req, res, next) {
    const { arId, type } = req.body;
    if (!isEmpty(arId, '歌手ID不能为空', next) && !isEmpty(type, '歌手类型不能为空', next)) {
      const result = await setArtistTypeService(arId, type);
      res.json(result);
    }
  }
  async getArtistType(req, res, next) {
    try {
      const result = await getArtistTypeService();
      result.unshift({ id: '0', name: '全部' });
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取歌手专辑
  async getArtistAlbum(req, res, next) {
    const { arId = '', offset = '0', limit = '30' } = req.query;
    if (!isEmpty(arId, '歌手ID不能为空', next)) {
      const result = await getArtistAlbumService(arId, offset, limit);
      res.json(result);
    }
  }
  //获取歌手歌曲
  async getArtistSong(req, res, next) {
    const { id, offset = '0', limit = '30' } = req.query;
    if (!isEmpty(id, '歌手ID不能为空', next)) {
      const result = await getArtistSongService(id, offset, limit);
      res.json(result);
    }
  }
  //更新歌手信息
  async updateUserMsg(req, res, next) {
    const { arId, name = '', desc = '' } = req.body;
    if (!isEmpty(arId, '歌手ID不能为空', next)) {
      if (name.length === 0 && desc.length === 0) {
        next(new Error(errorType.PARAMETER_ERROR));
      } else {
        const result = await updateUserMsgService(arId, name, desc);
        res.json(result);
      }
    }
  }
  //获取歌手看版信息
  async getArtistData(req, res, next) {
    try {
      const result = await getArtistDataService();
      res.json(result[0]);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取热门歌手
  async getHotArtist(req, res, next) {
    try {
      const result = await getHotArtistService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //删除歌手categories
  async deleteCate(req, res, next) {
    const { cateId } = req.body;
    if (!isEmpty(cateId, '分类id不能为空', next)) {
      const result = await deleteCateService(cateId);
      res.json(result);
    }
  }
  //删除歌手type
  async deleteArtistType(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '类型id不能为空', next)) {
      const result = await deleteArtistTypeService(id);
      res.json(result);
    }
  }
}
module.exports = new ArtistController();

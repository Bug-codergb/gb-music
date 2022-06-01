const path = require('path');
const client = require('../app/redis');
const jwt = require('jsonwebtoken');
const errorType = require('../constants/errorType');
const { MEDIA_PRIVATE_KEY } = require('../app/config');
const { formatTime } = require('../utils/formatTime');
const { isExistsFile } = require('../utils/isExists');
const { delFile } = require('../utils/deleteFile');
const { isEmpty } = require('../utils/isEmpty');
const {
  createService,
  uploadSongService,
  getSongSourceService,
  getRecSongService,
  getSongURL,
  getSongDetailService,
  getAllSongService,
  addSongToTopService,
  getSongCuntService,
  addLyricService,
  getLyricService,
  addPlayCountService,
  getSongPlayCount,
  updateSongVipService,
  getSongMsgService,
  deleteSongService,
  updateSongService,
  updateLyricService
} = require('../service/song.service');
class SongController {
  async create(req, res, next) {
    const { name, arId, alId, publishTime, alia } = req.body;
    if (
      !isEmpty(name, '歌曲名称不能为空', next) &&
      !isEmpty(arId, '歌手ID不能为空', next) &&
      !isEmpty(alId, '专辑ID不能为空', next) &&
      !isEmpty(publishTime, '发布时间不能为空', next) &&
      !isEmpty(alia, '歌曲别名不能为空', next)
    ) {
      const result = await createService(name, arId, alId, publishTime, alia);
      res.json({
        songId: result,
        name
      });
    }
  }
  //上传歌曲
  async uploadSong(req, res, next) {
    try {
      const { songId } = req.query;
      const { originalname, mimetype, destination, filename, size } = req.file;
      const { dt } = req.body;
      if (
        !isEmpty(songId, '歌曲id不能为空', next) &&
        !isEmpty(mimetype, 'mimetype不能为空', next) &&
        !isEmpty(dt, '时长不能为空', next)
      ) {
        const result = await uploadSongService(
          songId,
          originalname,
          mimetype,
          destination,
          filename,
          size,
          dt
        );
        res.json(result);
      }
    } catch (e) {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
  //获取歌曲
  async getSong(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '歌曲ID不能为空', next)) {
      const result = await getSongSourceService(id);
      const { dest, filename, mimetype } = result[0];
      res.set('content-type', mimetype);
      res.sendFile(path.resolve(__dirname, '../../', `${dest}/${filename}`));
    }
  }
  //获取推荐歌曲
  async getRecSong(req, res, next) {
    try {
      const { offset = '0', limit = '30' } = req.query;
      const result = await getRecSongService(offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
  //获取歌曲播放地址
  async getSongURL(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '歌曲ID不能为空', next)) {
      const result = await getSongURL(id);
      const { mp3Url } = result[0];
      try {
        const tokenUrl = jwt.sign({ mp3Url }, MEDIA_PRIVATE_KEY, {
          expiresIn: 60 * 60 * 24 * 7,
          algorithm: 'RS256'
        });
        res.json({
          ...result[0],
          mp3Url: tokenUrl
        });
      } catch (e) {
        console.log(e);
      }
    }
  }
  //获取歌曲详情
  async getSongDetail(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '歌曲ID不能为空', next)) {
      const result = await getSongDetailService(id);
      res.json(result[0]);
    }
  }
  //获取所有歌曲
  async getAllSong(req, res, next) {
    try {
      const { offset = '0', limit = '30', keyword = '' } = req.query;
      const result = await getAllSongService(offset, limit, keyword);
      const count = await getSongCuntService(keyword);
      res.json({
        count: count[0].count,
        songs: result
      });
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //添加歌词
  async addLyric(req, res, next) {
    try {
      const { id, lyric } = req.body;
      if (!isEmpty(id, '歌曲id不能为空', next) && !isEmpty(lyric, '歌词不能为空', next)) {
        const result = await addLyricService(id, lyric);
        res.json(result[0]);
      }
    } catch (e) {
      console.log(e);
      res.json(e);
    }
  }
  //获取歌词
  async getLyric(req, res, next) {
    const { id } = req.query;
    if (!isEmpty(id, '歌曲id不能为空', next)) {
      const result = await getLyricService(id);
      res.json(result[0]);
    }
  }
  //为歌曲添加播放量
  async addPlayCount(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '歌曲id不能为空', next)) {
      const count = await getSongPlayCount(id);
      const { playCount } = count[0];
      const data = await addPlayCountService(id, parseInt(playCount) + 1);
      const currentTime = formatTime(new Date().getTime(), 'yyyy-MM-dd');
      const time = await client.get(`${currentTime}`);
      if (!time) {
        let songs = [];
        songs.push({
          id,
          playCount: parseInt(playCount) + 1,
          curPlayCount: 1
        });
        await client.set(currentTime, JSON.stringify(songs));
      } else {
        const songs = JSON.parse(time);
        const isExists = songs.findIndex((item, index) => {
          return item.id === id;
        });
        if (isExists !== -1) {
          //存在
          songs[isExists].playCount = parseInt(playCount) + 1;
          songs[isExists].curPlayCount = (songs[isExists].curPlayCount || 0) + 1;
          await client.set(currentTime, JSON.stringify(songs));
        } else {
          songs.push({
            id,
            playCount: parseInt(playCount) + 1,
            curPlayCount: 1
          });
          await client.set(currentTime, JSON.stringify(songs));
        }
      }
      res.json(data);
    }
  }
  //下载歌曲
  async download(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '歌曲id不能为空', next)) {
      const result = await getSongSourceService(id);
      if (result.length !== 0) {
        try {
          const { dest, filename, originalname } = result[0];
          res.download(path.resolve(__dirname, '../../', `${dest}/${filename}`), originalname);
        } catch (e) {
          console.log(e);
        }
      }
    }
  }
  //更新歌曲vip
  async updateSongVip(req, res, next) {
    const { vip, id } = req.body;
    if (!isEmpty(vip, 'vip类型不能为空', next) && !isEmpty(id, '歌曲id不能为空', next)) {
      const flag = [0, 1].findIndex((item, index) => {
        return item === vip * 1;
      });
      if (flag === -1) {
        next(new Error(errorType.PARAMETER_ERROR));
      } else {
        const result = await updateSongVipService(vip, id);
        res.json(result);
      }
    }
  }
  //删除歌曲
  async deleteSong(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, '歌曲id不能为空', next)) {
      const result = await getSongMsgService(id);
      const { originalname, dest, filename } = result[0];
      const songPath = path.resolve(__dirname, '../../', `${dest}/${filename}`);
      try {
        const isExists = await isExistsFile(songPath);
        const result = await delFile(songPath);
        const del = await deleteSongService(id);
        res.json(del);
      } catch (e) {
        console.log(e);
      }
    }
  }
  //更新歌曲信息
  async updateSong(req, res, next) {
    try {
      const { id, name = '', alia = '', publishTime, vip = 0, lyric = '' } = req.body;
      const result = await updateSongService(id, name, alia, publishTime, vip);
      const data = await updateLyricService(id, lyric);
      res.json({
        ...result,
        ...data
      });
    } catch (e) {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
}
module.exports = new SongController();

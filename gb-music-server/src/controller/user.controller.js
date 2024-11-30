const path = require('path');
const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const { tran } = require('../utils/tran');
const { isExistsFile } = require('../utils/isExists');
const { delFile } = require('../utils/deleteFile');
const { formatTime } = require('../utils/formatTime');
const {
  createService,
  getUserAvatarService,
  setUserFavoriteService,
  isFavoriteService,
  getUserFavoriteService,
  getUserDetailService,
  getOtherUserDetailService,
  getUserChannelService,
  cancelFavoriteService,
  getUserVioDataService,
  getUserVioListService,
  getUserProgramService,
  getUserFansService,
  getManageVioService,
  getUserAllCommentService,
  getUserCountService,
  getUserListService,
  getUserVIPService,
  updateUserExpireService,
  updateUserMsgService,
  getUserMomentDataService,
  getUserMomentService,
  getSystemDataService,
  getUserFileService,
  deleteUserService,
  getSimpleInfoService,
  updateUserPasswordService
} = require('../service/user.service');
class UserController {
  //头像上传
  async create(req, res, next) {
    const { userId, userName } = req.user;
    if(!req.file || Object.keys(req.file).length===0){
      return next(new Error(errorType.FILE_OPERATION_FAILED));
    }
    const { originalname, mimetype, destination, filename, size } = req.file;
    if (!isEmpty(mimetype, 'mimetype不能为空', next)) {
      const result = await createService(
        userId,
        originalname,
        mimetype,
        destination,
        filename,
        size
      );
      res.json(result);
    }
  }
  //获取用户头象
  async getUserAvatar(req, res, next) {
    const { id, w = '100', h } = req.query;
    if (!isEmpty(id, 'id不能为空', next)) {
      const result = await getUserAvatarService(id);
      if (result[0]) {
        const { dest, mimetype, filename } = result[0];
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
      } else {
        next(new Error(errorType.NO_AVATAR));
      }
    }
  }
  //用户喜欢歌曲
  async setUserFavorite(req, res, next) {
    const { userId } = req.user;
    const { id } = req.body;
    if (!isEmpty(id, '歌曲id不能为空', next)) {
      const data = await isFavoriteService(id, userId);
      if (data.length === 0) {
        const result = await setUserFavoriteService(id, userId);
        res.json(result);
      } else {
        next(new Error(errorType.ALREADY_ADDED_TO_LIKE_LIST));
      }
    }
  }
  //获取用户喜欢歌曲
  async getUserFavorite(req, res, next) {
    const { userId } = req.user;
    let { offset = '0', limit = '30' } = req.query;
    if (!offset || !limit) {
      offset = '0';
      limit = '30';
    }
    let user = null;
    const result = await getUserFavoriteService(userId, offset, limit);
    if (result && result.songs && result.songs.length !== 0) {
      user = result.songs.user;
      result.songs.forEach((item, index) => {
        return delete item.user;
      });
    }
    res.json({
      user,
      songList: result||[]
    });
  }
  //用户取消喜欢
  async cancelFavorite(req, res, next) {
    const { userId } = req.user;
    const { songId } = req.body;
    if (!isEmpty(songId, '歌曲id不能为空', next)) {
      const result = await cancelFavoriteService(songId, userId);
      res.json(result);
    }
  }
  //获取用户详情
  async getUserDetail(req, res, next) {
    try {
      const { userId } = req.user;
      const result = await getUserDetailService(userId);
      res.json(result[0]);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取其他用户详情
  async getOtherUserDetail(req, res, next) {
    try {
      const { userId } = req.body;
      if (!isEmpty(userId, '用户id不能为空', next)) {
        const result = await getOtherUserDetailService(userId);
        if (result.length !== 0) {
          result[0].subscriber.album = result[0].subscriber.album.filter((item, index) => {
            return item !== null;
          });
          result[0].subscriber.artist = result[0].subscriber.artist.filter((item, index) => {
            return item !== null;
          });
          result[0].subscriber.video = result[0].subscriber.video.filter((item, index) => {
            return item !== null;
          });
          result[0].subscriber.playlist = result[0].subscriber.playlist.filter((item, index) => {
            return item !== null;
          });
          res.json(result[0]);
        } else {
          console.log(result);
          res.json(result[0]);
        }
      }
    } catch (e) {
      console.log(e);
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取用户电台
  async getUserChannel(req, res, next) {
    const { userId, offset = '0', limit = '8' } = req.body;
    if (!isEmpty(userId, '用户id不能为空', next)) {
      const result = await getUserChannelService(userId, offset, limit);
      res.json(result);
    }
  }
  //获取用户视频数据
  async getUserVioData(req, res, next) {
    try {
      const { userId } = req.user;
      const result = await getUserVioDataService(userId);
      let thumb = 0,
        playCount = 0,
        comment = 0;
      if (result.length !== 0) {
        const playCountArr = result.map((item, index) => {
          return item.playCount;
        });
        const thumbArr = result.map((item, index) => {
          return item.thumb;
        });
        const commentArr = result.map((item, index) => {
          return item.comment;
        });
        playCount = playCountArr.reduce((prev, next) => {
          return prev + next;
        });
        thumb = thumbArr.reduce((prev, next) => {
          return prev + next;
        });
        comment = commentArr.reduce((prev, next) => {
          return prev + next;
        });
      }
      res.json({
        video: result.length,
        playCount,
        thumb,
        comment
      });
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取用户动态数据
  async getUserMomentData(req, res, next) {
    try {
      const { userId } = req.user;
      const result = await getUserMomentDataService(userId);
      res.json(result[0]);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取用户视频列表
  async getUserVioList(req, res, next) {
    try {
      const { userId } = req.user;
      const { offset = '0', limit = '5' } = req.query;
      const result = await getUserVioListService(userId, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取用户声音列表
  async getUserProgram(req, res, next) {
    try {
      const { offset = '0', limit = '10' } = req.query;
      const { userId } = req.user;
      const result = await getUserProgramService(userId, offset, limit);
      const Programdata = await getUserProgramService(userId, '0', `${result.count}`);

      let playCount = 0,
        comment = 0;
      const playCountArr = Programdata.channel.map((item, index) => {
        return item.playCount;
      });
      const commentArr = Programdata.channel.map((item, index) => {
        return item.comment;
      });
      if (playCountArr.length !== 0 && commentArr.length !== 0) {
        playCount = playCountArr.reduce((prev, next) => {
          return prev + next;
        }, 0);
        comment = commentArr.reduce((prev, next) => {
          return prev + next;
        });
      }
      Object.assign(result, {
        playCount,
        comment
      });
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取用户粉丝
  async getUserFans(req, res, next) {
    try {
      const { userId } = req.user;
      const { offset = '0', limit = '30' } = req.query;
      const result = await getUserFansService(userId, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取视频管理视频列表
  async getManageVio(req, res, next) {
    try {
      const { offset = '0', limit = '10' } = req.query;
      const { userId } = req.user;
      const result = await getManageVioService(userId, offset, limit);
      const { video, count } = result;
      let time = [];
      time = video.map((item, index) => {
        return {
          updateTime: item.createTime,
          createTime: item.createTime.getMonth() + 1,
          video: []
        };
      });
      time = time.filter((item, index) => {
        return (
          index ===
          time.findIndex((it, index) => {
            return item.createTime === it.createTime;
          })
        );
      });
      time.forEach((item, index) => {
        video.forEach((v, i) => {
          if (v.createTime.getMonth() + 1 === item.createTime) {
            item.video.push(v);
          }
        });
      });
      time.sort((a, b) => {
        return b.createTime - a.createTime;
      });
      time.forEach((item, index) => {
        delete item.createTime;
      });

      res.json({
        count,
        video: time
      });
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取用户全部评论
  async getUserAllComment(req, res, next) {
    try {
      const { userId } = req.user;
      const { offset = '0', limit = '30' } = req.query;
      const result = await getUserAllCommentService(userId, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取用户人数信息
  async getUserCount(req, res, next) {
    try {
      const result = await getUserCountService();
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取用户列表
  async getUserList(req, res, next) {
    try {
      const { vip = -1, manage = -1, keyword = '', offset = '0', limit = '30' } = req.body;
      const result = await getUserListService(vip, manage, keyword, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async updateUserExpire(req, res, next) {
    try {
      const { userId } = req.user;
      const userVip = await getUserVIPService(userId);
      if (userVip.length !== 0) {
        const { expireTime, auth } = userVip[0];
        if (auth === 1) {
          let timestamp = new Date(expireTime).getTime();
          let currentTime = new Date().getTime();
          if (currentTime > timestamp) {
            const result = await updateUserExpireService(userId);
            res.json({
              code: 200,
              message: '您的VIP已过期，开通VIP后畅想'
            });
          } else {
            res.json({
              code: 400,
              message: 'VIP未过期'
            });
          }
        } else {
          res.json({
            code: 400,
            message: '你还未开通VIP'
          });
        }
      }
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async updateUserMsg(req, res, next) {
    try {
      let { userId, vip = 0, name, manage = 0, expireTime = 0, combo } = req.body;
      if (!isEmpty(userId, '用户id不能为空', next) && !isEmpty(name, '用户名不能为空', next)) {
        if (vip === 0) {
          combo = null;
          expireTime = 0;
          const result = await updateUserMsgService(userId, vip, name, manage, expireTime, combo);
          res.json(result);
        } else if (vip === 1) {
          const result = await updateUserMsgService(userId, vip, name, manage, expireTime, combo);
          res.json(result);
        }
      }
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async getUserMoment(req, res, next) {
    try {
      const { userId } = req.user;
      const { offset = '0', limit = '15' } = req.body;
      const result = await getUserMomentService(userId, offset, limit);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  async getSystemData(req, res, next) {
    const result = await getSystemDataService();
    res.json(result);
  }
  async deleteUser(req, res, next) {
    const { userId } = req.body;
    if (!isEmpty(userId, '用户id不能为空', next)) {
      const fileData = await getUserFileService(userId);
      if (fileData.length !== 0) {
        const { dest, filename } = fileData[0];
        const rootPath = path.resolve(__dirname, '../../');
        const filePath = path.resolve(rootPath, `./${dest}/${filename}`);
        try {
          const data = await isExistsFile(filePath);
          await delFile(data);
          const result = await deleteUserService(userId);
          res.json(result);
        } catch (e) {
          console.log(e);
        }
      } else {
        const result = await deleteUserService(userId);
        next(new Error(errorType.PARAMETER_ERROR));
      }
    }
  }
  async getSimpleInfo(req, res, next) {
    const { userId } = req.query;
    if (!isEmpty(userId, '用户id不能为空', next)) {
      const result = await getSimpleInfoService(userId);
      res.json(result[0]);
    }
  }
  async updateUserPassword(req,res,next){
    const { userId } = req.user;
    const { userName,password } = req.body;
    if(!isEmpty(userId,"用户id不能为空",next) && !isEmpty(password,"密码不能为空",next)){
      const result = await updateUserPasswordService(userId,userName,password);
      res.json(result[0]);
    }
  }
}
module.exports = new UserController();

const errorType = require('../constants/errorType');
function errorHandle(err, req, res, next) {
  let message = '';
  let status = 404;
  switch (err.message) {
    case errorType.USER_NAME_OR_PASSWORD_IS_NOT_NULL:
      message = '用户名或者密码不能为空';
      status = 400;
      break;
    case errorType.THE_USER_NAME_ALREADY_EXISTS:
      message = '用户名已经存在';
      status = 409;
      break;
    case errorType.USERNAME_OR_PASSWORD_IS_INCORRECT:
      message = '用户名或者密码错误';
      status = 401;
      break;
    case errorType.PLEASE_SIGN_IN:
      message = '请登录';
      status = 403;
      break;
    case errorType.NO_AVATAR:
      message = '暂无头像';
      status = 404;
      break;
    case errorType.AVATAR_ALREADY_EXISTS:
      message = '头像已经存在';
      status = 409;
      break;
    case errorType.ALBUM_ALREADY_EXISTS:
      message = '专辑已经存在';
      status = 409;
      break;
    case errorType.ALBUM_COVER_ALREADY_EXISTS:
      message = '专辑封面已经存在';
      status = 409;
      break;
    case errorType.SONG_ALREADY_EXISTS:
      message = '歌曲已经存在';
      status = 409;
      break;
    case errorType.REQUEST_PARAMETER_CANNOT_BE_EMPTY:
      message = '请求参数不能为空';
      status = 400;
      break;
    case errorType.PLAY_LIST_CATE_ALREADY_EXISTS:
      message = '歌单分类已经存在';
      status = 409;
      break;
    case errorType.PLAYLIST_CATEGORIES_CANNOT_EXCEED_3:
      message = '歌单分类不能超过3';
      status = 400;
      break;
    case errorType.SONGS_ALREADY_ON_THE_TOPLIST:
      message = '榜单中已经存在歌曲';
      status = 409;
      break;
    case errorType.FILE_OPERATION_FAILED:
      message = '操作失败';
      status = 500;
      break;
    case errorType.ALREADY_ADDED_TO_LIKE_LIST:
      message = '已经加入喜欢列表';
      status = 409;
      break;
    case errorType.COLLECTED:
      message = '已收藏';
      status = 409;
      break;
    case errorType.ALREADY_THUMBED:
      message = '您已经点赞';
      status = 409;
      break;
    case errorType.NO_OPERATION_PERMISSION:
      message = '没有操作的权限';
      status = 403;
      break;
    case errorType.AlREADLY_FOLLOWING:
      message = '您已关注';
      status = 409;
      break;
    case errorType.SERVER_INTERNAL_ERROR:
      message = '服务器内部错误';
      status = 500;
      break;
    case errorType.YOU_HAVE_NOT_ACTIVATED_VIP:
      message = '你还未开通VIP';
      status = 401;
      break;
    case errorType.YOU_DID_SOMETHING_WRONG:
      message = '您的操作有误';
      status = 400;
      break;
    case errorType.PARAMETER_ERROR:
      message = '参数错误';
      status = 400;
      break;
    default:
      message = err.msg;
      status = 400;
  }
  res.status(status);
  res.json({
    message
  });
}
module.exports = errorHandle;

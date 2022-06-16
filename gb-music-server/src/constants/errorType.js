const USER_NAME_OR_PASSWORD_IS_NOT_NULL = 'The user name or password cannot be empty';
const THE_USER_NAME_ALREADY_EXISTS = 'The user name already exists';
const USERNAME_OR_PASSWORD_IS_INCORRECT = 'Username or password is incorrect';
const PLEASE_SIGN_IN = 'please sign in';
const AVATAR_ALREADY_EXISTS = 'Avatar already exists';
const NO_AVATAR = 'no avatar';

const ALBUM_ALREADY_EXISTS = 'album already exists';
const ALBUM_COVER_ALREADY_EXISTS = 'album cover already exists';

const SONG_ALREADY_EXISTS = 'song already exists';

const REQUEST_PARAMETER_CANNOT_BE_EMPTY = 'Request parameter cannot be empty';

//歌单分类
const PLAY_LIST_CATE_ALREADY_EXISTS = 'playlist cate already exists';
const PLAYLIST_CATEGORIES_CANNOT_EXCEED_3 = 'Playlist categories cannot exceed 3';

//榜单中是否已经存在歌曲
const SONGS_ALREADY_ON_THE_TOPLIST = 'Songs already on the toplist';
//已经加入喜欢列表
const ALREADY_ADDED_TO_LIKE_LIST = 'Already added to like list';
//文件操作失败
const FILE_OPERATION_FAILED = 'File operation failed';
//已收藏
const COLLECTED = 'collected';
//已经点赞
const ALREADY_THUMBED = 'Already thumbed';
//没有操作的权限
const NO_OPERATION_PERMISSION = 'No operation permission';

//已经关注
const AlREADLY_FOLLOWING = 'already following';

//服务器内部错误
const SERVER_INTERNAL_ERROR = 'server internal error';
//未开通VIP
const YOU_HAVE_NOT_ACTIVATED_VIP = 'You have not activated VIP';
//您的操作有误
const YOU_DID_SOMETHING_WRONG = 'You did something wrong';
//参数错误
const PARAMETER_ERROR = 'parameter_error';
//参数不能为空
function paramsEmpty(error, msg) {
  let p = error.toUpperCase().replace(/\s/, '_');
  return {
    error: p,
    msg
  };
}
module.exports = {
  USER_NAME_OR_PASSWORD_IS_NOT_NULL,
  THE_USER_NAME_ALREADY_EXISTS,
  USERNAME_OR_PASSWORD_IS_INCORRECT,
  PLEASE_SIGN_IN,
  NO_AVATAR,
  AVATAR_ALREADY_EXISTS,
  ALBUM_ALREADY_EXISTS,
  ALBUM_COVER_ALREADY_EXISTS,
  SONG_ALREADY_EXISTS,
  REQUEST_PARAMETER_CANNOT_BE_EMPTY,
  PLAY_LIST_CATE_ALREADY_EXISTS,
  PLAYLIST_CATEGORIES_CANNOT_EXCEED_3,
  SONGS_ALREADY_ON_THE_TOPLIST,
  FILE_OPERATION_FAILED,
  ALREADY_ADDED_TO_LIKE_LIST,
  COLLECTED,
  ALREADY_THUMBED,
  NO_OPERATION_PERMISSION,
  AlREADLY_FOLLOWING,
  SERVER_INTERNAL_ERROR,
  YOU_HAVE_NOT_ACTIVATED_VIP,
  YOU_DID_SOMETHING_WRONG,
  PARAMETER_ERROR,
  paramsEmpty
};

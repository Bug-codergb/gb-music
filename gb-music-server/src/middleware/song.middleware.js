const { isExists } = require('../utils/isExists');
const errorType = require('../constants/errorType');
const { getSongSourceService } = require('../service/song.service');
const { getUserInfoService } = require('../service/login.service');
async function isExistsSong(req, res, next) {
  const { songId } = req.query;
  await isExists(songId, getSongSourceService, errorType.SONG_ALREADY_EXISTS, next);
}
async function isVip(req, res, next) {
  const { userId } = req.user;
  const result = await getUserInfoService(userId);
  const { auth } = result;
  if (auth === 0) {
    next(new Error(errorType.YOU_HAVE_NOT_ACTIVATED_VIP));
  } else {
    next();
  }
}
module.exports = {
  isExistsSong,
  isVip
};

const errorType = require('../constants/errorType');
const { getAvatarService } = require('../service/artist.service');
const isExistsAvatar = async (req, res, next) => {
  const { arId } = req.query;
  const result = await getAvatarService(arId);
  if (result[0]) {
    next(new Error(errorType.AVATAR_ALREADY_EXISTS));
  } else {
    next();
  }
};
module.exports = {
  isExistsAvatar
};

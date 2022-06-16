const errorType = require('../constants/errorType');
const { getUserAvatarService } = require('../service/user.service');
const isExistsAvatar = async (req, res, next) => {
  const { userId } = req.user;
  const result = await getUserAvatarService(userId);
  if (result[0]) {
    next(new Error(errorType.AVATAR_ALREADY_EXISTS));
  } else {
    next();
  }
};
module.exports = {
  isExistsAvatar
};

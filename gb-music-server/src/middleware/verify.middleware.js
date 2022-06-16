const errorType = require('../constants/errorType');
const { getUserName } = require('../service/register.service');
const { getUserMsg } = require('../service/login.service');
//注册验证
async function registerVerify(req, res, next) {
  const { userName, password } = req.body;
  if (userName.trim().length === 0 || password.trim().length === 0 || !userName || !password) {
    next(new Error(errorType.USER_NAME_OR_PASSWORD_IS_NOT_NULL));
  }
  const result = await getUserName(userName);
  if (result.length === 0) {
    next();
  } else {
    next(new Error(errorType.THE_USER_NAME_ALREADY_EXISTS));
  }
}
//登录验证
async function loginVerify(req, res, next) {
  const { userName, password } = req.body;
  if (userName.trim().length === 0 || password.trim().length === 0 || !userName || !password) {
    next(new Error(errorType.USER_NAME_OR_PASSWORD_IS_NOT_NULL));
  } else {
    const result = await getUserMsg(userName, password);
    if (result[0]) {
      const { userId, userName, avatarUrl } = result[0];
      req.user = {
        userId,
        userName,
        avatarUrl
      };
      next();
    } else {
      next(new Error(errorType.USERNAME_OR_PASSWORD_IS_INCORRECT));
    }
  }
}
module.exports = {
  registerVerify,
  loginVerify
};

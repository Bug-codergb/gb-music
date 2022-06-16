const jwt = require('jsonwebtoken');
const errorType = require('../constants/errorType');
const { PUBLIC_KEY } = require('../app/config');
//是否登录
function loginAuth(req, res, next) {
  const authorization = req.get('authorization');
  if (authorization) {
    const token = authorization.replace('Bearer ', '');
    try {
      const result = jwt.verify(token, PUBLIC_KEY, {
        algorithms: ['RS256']
      });
      const { userId, userName } = result;
      req.user = {
        userId,
        userName
      };
      next();
    } catch (e) {
      next(new Error(errorType.PLEASE_SIGN_IN));
    }
  } else {
    next(new Error(errorType.PLEASE_SIGN_IN));
  }
}
module.exports = {
  loginAuth
};

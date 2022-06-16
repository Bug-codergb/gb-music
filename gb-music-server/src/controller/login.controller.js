const jwt = require('jsonwebtoken');
const { PRIVATE_KEY } = require('../app/config');
const { getUserInfoService } = require('../service/login.service');
class LoginController {
  async login(req, res, next) {
    const { userId, userName, avatarUrl } = req.user;
    const token = jwt.sign({ userId, userName }, PRIVATE_KEY, {
      expiresIn: 60 * 60 * 24,
      algorithm: 'RS256'
    });
    const userInfo = await getUserInfoService(userId);
    res.json({
      token: token,
      userName,
      userId,
      avatarUrl,
      ...userInfo
    });
  }
}
module.exports = new LoginController();

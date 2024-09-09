const express = require('express');
//const http2Express = require('http2-express-bridge');
//const compression = require('compression');
const {whiteList} = require("../constants/whiteList")
const http2 = require('http2');
const jwt = require('jsonwebtoken');
const { readFileSync } = require('fs');
const path = require('path');
const expressWS = require('express-ws');
const { PUBLIC_KEY } = require('./config');
const errorType = require('../constants/errorType');

//const app = http2Express(express);
const app =express();
const wsApp = express();
expressWS(wsApp);

const errorHandle = require('./errorHandle');

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(async (req, res, next) => {
  res.set('Access-Control-Allow-Origin', '*');
  res.set('Access-Control-Allow-Headers', 'POST,Origin,Content-Type,Accept,authorization');
  const authorization = req.get('authorization');
  if(whiteList.includes(req.url)){
    return next();
  }else{
    if (authorization) {
      const token = authorization.replace('Bearer ', '');
      try {
        jwt.verify(token, PUBLIC_KEY, {
          algorithms: ['RS256']
        });
        next();
      } catch (e) {
        next(new Error(errorType.PLEASE_SIGN_IN));
      }
    } else {
      await next();
    }
  }

});
//注册
const registerRouter = require('../router/register.router');
//登录
const loginRouter = require('../router/login.router');
//用户
const userRouter = require('../router/user.router');
//歌手
const artistRouter = require('../router/artist.router');
//专辑
const albumRouter = require('../router/album.router');
//歌曲
const songRouter = require('../router/song.router');
//歌单
const playlistRouter = require('../router/playlist.router');
//排行榜
const toplistRouter = require('../router/toplist.router');
//视频
const videoRouter = require('../router/video.router');
//收藏
const subRouter = require('../router/sub.router');
//评论
const commentRouter = require('../router/comment.router');
//banner
const bannerRouter = require('../router/bannner.router');
//点赞
const thumbRouter = require('../router/thumb.router');
//搜索
const searchRouter = require('../router/search.router');
//音乐动态
const momentRouter = require('../router/moment.router');
//电台
const channelRouter = require('../router/channel.router');
//话题
const topicRouter = require('../router/topic.router');
//关注
const fansRouter = require('../router/fans.router');
//vip价格
const comboRouter = require('../router/combo.router');
const alipayRouter = require('../router/alipay.router');
//通知
const messageRouter = require('../router/message.router');
//验证码
const verifyRouter = require('../router/verify.router');
//vip
const vipRouter = require('../router/vip.router');
//在线
const lineRouter = require('../router/line.router');
//订单
const orderRouter = require('../router/order.router');
wsApp.use('/line', lineRouter);
app.use('/register', registerRouter);
app.use('/login', loginRouter);
app.use('/user', userRouter);
app.use('/artist', artistRouter);
app.use('/album', albumRouter);
app.use('/song', songRouter);
app.use('/playlist', playlistRouter);
app.use('/toplist', toplistRouter);
app.use('/video', videoRouter);
app.use('/sub', subRouter);
app.use('/comment', commentRouter);
app.use('/banner', bannerRouter);
app.use('/thumb', thumbRouter);
app.use('/search', searchRouter);
app.use('/moment', momentRouter);
app.use('/channel', channelRouter);
app.use('/topic', topicRouter);
app.use('/fans', fansRouter);
app.use('/combo', comboRouter);
app.use('/pay', alipayRouter);
app.use('/message', messageRouter);
app.use('/verify', verifyRouter);
app.use('/vip', vipRouter);
app.use('/order', orderRouter);
app.use(errorHandle);

const options = {
  key: readFileSync(path.resolve(__dirname, './ssl/ssl.key')),
  cert: readFileSync(path.resolve(__dirname, './ssl/ssl.pem')),
  allowHTTP1: true
};
//const server = http2.createSecureServer(options, app);
module.exports = {
  app,
  //server,
  wsApp
};

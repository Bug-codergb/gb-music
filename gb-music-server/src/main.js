const { app, wsApp } = require('./app/index');
const database = require('./app/database');
const redis = require('./app/redis');
const { APP_PORT, WS_PORT } = require('./app/config');
app.listen(APP_PORT, () => {
  console.log('服务启动:', APP_PORT);
});
wsApp.listen(WS_PORT, () => {
  console.log('socket启动', WS_PORT);
});

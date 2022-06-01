const util = require('util');
const redis = require('redis');
const { REDIS_URL } = require('../app/config');
const client = redis.createClient(REDIS_URL);
client.on('connect', () => {
  console.log('redis 连接成功');
});
client.on('error', (e) => {
  console.log(e);
});
client.set = util.promisify(client.set);
client.get = util.promisify(client.get);
module.exports = client;

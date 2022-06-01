const { deduplicate } = require('../utils/deduplication');
const { getSum } = require('../utils/getSum');
let users = [];
class LineController {
  async getLineUser(ws, req) {
    const { userId } = req.query;
    ws.on('message', function (msg) {
      users.push(msg);
      console.log(`建立连接-${msg}`);
    });
    ws.on('close', function () {
      console.log(`关闭连接-${userId}`);
      const isExists = users.findIndex((item, index) => {
        return item === userId;
      });
      if (isExists !== -1) {
        users.splice(isExists, 1);
      }
    });
  }
  async getLineCount(ws, req) {
    let newPrototype = Object.create(Array.prototype);
    let methods = ['push', 'pop', 'shift', 'unshift', 'reverse', 'sort', 'splice'];
    methods.forEach((method) => {
      newPrototype[method] = function (...args) {
        if (`${method}` === 'push') {
          const item = [...args];
          const isExists = users.indexOf(item[0]);
          if (isExists === -1) {
            ws.send(deduplicate(users).length + 1);
          }
        } else if (`${method}` === 'splice') {
          if (users.length - 1 < 0) {
            ws.send(0);
          } else {
            const item = [...args];
            const sum = getSum(users[item[0]], users);
            console.log({
              name: '关闭',
              item: item[0],
              users,
              'users[item[0]]': users[item[0]]
            });
            if (sum > 1) {
              ws.send(deduplicate(users).length);
            } else {
              ws.send(deduplicate(users).length - 1);
            }
          }
        }
        return Array.prototype[method].call(this, ...args);
      };
    });
    users.__proto__ = newPrototype;
    ws.on('message', function (msg) {
      if (msg === 'connect') {
        ws.send(deduplicate(users).length);
      }
    });
  }
}
module.exports = new LineController();

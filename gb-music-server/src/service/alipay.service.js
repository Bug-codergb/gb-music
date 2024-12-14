const connection = require('../app/database');
const { formatTime } = require('../utils/formatTime');
class AlipayService {
  async joinVIPService(cId, name, userId) {
    try {
      const currentTime = new Date().getTime();
      const expireTime = currentTime + 60 * 60 * 24 * 30 * 1000 * name;
      const sql = `update user set auth=1,expireTime=?,cId=? where userId=?`;
      const result = await connection.execute(sql, [new Date(expireTime), cId, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async createOrderService(orderId,userId, price, cId) {
    try {

      const tmp = '`order`';
      const sql = `insert into ${tmp}(id,userId,price,cId,status) values(?,?,?,?,?)`;
      const result = await connection.execute(sql, [orderId, userId, price, cId, 0]);
      return orderId;
    } catch (e) {
      console.log(e);
    }
  }
  async updateOrderService(id) {
    try {
      const tmp = '`order`';
      const sql = `update ${tmp} set status=1 where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new AlipayService();

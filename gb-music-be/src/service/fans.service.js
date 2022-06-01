const connection = require('../app/database');
class FansService {
  async createService(userId, upId) {
    try {
      const id = new Date().getTime();
      const sql = `insert into fans(id,userId,upId) values(?,?,?)`;
      const result = await connection.execute(sql, [id, userId, upId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //是否已经关注
  async hasCreatedService(userId, upId) {
    try {
      const sql = `select id from fans where userId=? and upId=?`;
      const result = await connection.execute(sql, [userId, upId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new FansService();

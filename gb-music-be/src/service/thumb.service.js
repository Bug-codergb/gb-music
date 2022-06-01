const connection = require('../app/database');
class ThumbService {
  async createService(userId, key, id) {
    try {
      const sql = `insert into thumb(${key},userId) values(?,?)`;
      const result = await connection.execute(sql, [id, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //是否已经点赞
  async getThumbByUserService(userId, key, id) {
    try {
      const sql = `select userId createTime,updateTime from thumb where ${key}=? and userId=?`;
      const result = await connection.execute(sql, [id, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //取消点赞
  async cancelService(id, key, userId) {
    try {
      const sql = `delete from thumb where ${key}=? and userId=?`;
      const result = await connection.execute(sql, [id, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new ThumbService();

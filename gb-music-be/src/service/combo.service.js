const connection = require('../app/database');
const errorType = require('../constants/errorType');
class ComboService {
  async createService(name, price) {
    try {
      const id = new Date().getTime();
      const sql = `insert into combo (id,name,price) values(?,?,?)`;
      const result = await connection.execute(sql, [id, name, price]);
      return result[0];
    } catch (e) {
      new Error(errorType.SERVER_INTERNAL_ERROR);
    }
  }
  async deleteComboService(id) {
    try {
      const sql = `delete from combo where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async updateComboService(id, name, price) {
    try {
      if (name && price) {
        try {
          const sql = `update combo set name=?,price=? where id=?`;
          const result = await connection.execute(sql, [name, price, id]);
          return result[0];
        } catch (e) {
          console.log(e);
        }
      } else if (!name && price) {
        const sql = `update combo set price=? where id=?`;
        const result = await connection.execute(sql, [price, id]);
        return result[0];
      } else if (name && !price) {
        const sql = `update combo set name=? where id=?`;
        const result = await connection.execute(sql, [name, id]);
        return result[0];
      }
    } catch (e) {
      console.log(e);
    }
  }
  async getAllComboService() {
    try {
      const sql = `select id,name,price from combo`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {}
  }
}
module.exports = new ComboService();

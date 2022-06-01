const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class RegisterService {
  async getUserName(userName) {
    const sql = `select userId,userName avatarUrl from user where userName=?`;
    const result = await connection.execute(sql, [userName]);
    return result[0];
  }
  async registerService(userName, password) {
    try {
      const id = new Date().getTime();
      //const avatarUrl=`${APP_HOST}:${APP_PORT}/user/avatar?id=${id}`;
      const sql = `insert into user(userId,userName,password) values(?,?,?)`;
      const result = await connection.execute(sql, [id, userName, password]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new RegisterService();

const connection = require('../app/database');
class LoginService {
  async getUserMsg(userName, password) {
    const sql = `select * from user where userName=? and password=?`;
    const result = await connection.execute(sql, [userName, password]);
    return result[0];
  }
  async getUserInfoService(userId) {
    try {
      const sql = `select userId,userName,avatarUrl,createTime,updateTime,auth,manage from user where userId=?`;
      const result = await connection.execute(sql, [userId]);
      let tmp = {};
      if (result[0][0]) {
        const { auth } = result[0][0];
        if (auth === 1) {
          const sql = `
                select userId,userName,avatarUrl,u.createTime,u.updateTime,auth,
                 JSON_OBJECT('id',combo.id,'name',combo.name,'price',combo.price,'expireTime',expireTime) as vip
                from user as u
                LEFT JOIN combo on combo.id=u.cId			 
                where userId=?`;
          tmp = (await connection.execute(sql, [userId]))[0][0];
        }
      }
      Object.assign(result[0][0], tmp);
      return result[0][0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new LoginService();

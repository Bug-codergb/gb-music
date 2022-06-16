const connection = require('../app/database');
class VipService {
  async getVipMessageService(userId) {
    try {
      const sql = `
      select userId,userName,avatarUrl,u.createTime,u.updateTime,auth,
       JSON_OBJECT('id',c.id,'name',c.name,'price',c.price,'expireTime',expireTime,
			             'createTime',c.createTime,'updateTime',c.updateTime) as vip
      from user as u
      LEFT JOIN combo as c on c.id=u.cId
      where userId=?`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getUserHistoryVIPService(userId) {
    try {
      const tmp = '`order`';
      const sql = `select o.id,(select JSON_OBJECT('userId',u.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
           from user as u where u.userId=o.userId) as user,o.createTime,o.status,
					 JSON_OBJECT('id',c.id,'name',c.name,'price',c.price) as vip
        from ${tmp} as o
        LEFT JOIN combo as c on c.id=o.cId
        where o.userId=? and o.delete=0
        order by o.createTime desc`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async deleteHistoryService(id) {
    try {
      let tmp = '`order`';
      let temp = '`delete`';
      const sql = `update ${tmp} set ${temp}=1 where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getVIPOrderDataService() {
    try {
      let tmp = '`order`';
      const sql = `
        select c.id,c.name,count(ord.cId) as count,JSON_ARRAYAGG(
       JSON_OBJECT('id',ord.id,'joinTime',left(ord.createTime,7))
			  ) as ${tmp}
       from combo as c
       LEFT JOIN ${tmp} as ord on ord.cId=c.id
       where ord.status=1 and ord.createTime BETWEEN date_sub(now(),INTERVAL 6 month) and now()
       GROUP BY c.id`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new VipService();

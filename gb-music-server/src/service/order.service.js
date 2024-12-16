const connection = require('../app/database');
class OrderService {
  async getAllOrderService(offset, limit, orderType, status) {
    let exec = `where c.id=? and o.status =?`;
    if (orderType === -1 && status === -1) {
      exec = '';
    } else if (orderType === -1 && status !== -1) {
      exec = `where o.status=?`;
    } else if (orderType !== -1 && status === -1) {
      exec = `where c.id=?`;
    }
    try {
      let tmp = '`order`';
      const sql = `
      select o.id,(select JSON_OBJECT('userId',o.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
             from user as u
						 where u.userId=o.userId
            ) as user,
       o.createTime,JSON_OBJECT(
       'id',c.id,'name',c.name,'price',c.price,'createTime',c.createTime,'updateTime',c.updateTime
			 ) as combo,status
     from ${tmp} as o
     LEFT JOIN combo as c on c.id=o.cId
     ${exec}
     limit ?,?`;
      console.log(sql)
      const countSQL = `select count(o.id) as count
                       from ${tmp} as o
                       LEFT JOIN combo as c on c.id=o.cId
                       ${exec}`;
      let result = [];
      let count = [];
      if (orderType === -1 && status === -1) {
        result = await connection.execute(sql, [offset, limit]);
        count = await connection.execute(countSQL);
      } else if (orderType === -1 && status !== -1) {
        result = await connection.execute(sql, [status, offset, limit]);
        count = await connection.execute(countSQL, [status]);
      } else if (orderType !== -1 && status === -1) {
        result = await connection.execute(sql, [orderType, offset, limit]);
        count = await connection.execute(countSQL, [orderType]);
      } else {
        result = await connection.execute(sql, [orderType, status, offset, limit]);
        count = await connection.execute(countSQL, [orderType, status]);
      }
      console.log(sql)
      return {
        count: count[0][0].count,
        order: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new OrderService();

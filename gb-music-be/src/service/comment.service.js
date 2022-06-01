const connection = require('../app/database');
class CommentService {
  async createService(userId, content, key, id) {
    try {
      const commentId = new Date().getTime();
      const sql = `insert into comment(id,content,${key},userId) values(?,?,?,?)`;
      const result = await connection.execute(sql, [commentId, content, id, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async replyCommentService(userId, content, id) {
    try {
      const commentId = new Date().getTime();
      const sql = `insert into comment(id,content,replyId,userId) values(?,?,?,?)`;
      const result = await connection.execute(sql, [commentId, content, id, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取所有评论
  async getAllCommentService(offset, limit, key, id) {
    try {
      if (key === 'cId') {
        key = 'c.cId';
      }
      const sql = `
        SELECT c.id,c.content,c.createTime,c.updateTime,
       JSON_OBJECT('userId',c.userId,'userName',u.userName,'avatarUrl',u.avatarUrl) as user,
			 (select JSON_ARRAYAGG(json_object(
			  'id',com.id,'content',com.content,'createTime',com.createTime,'updateTime',com.updateTime,
				'user',(select JSON_OBJECT('userId',com.userId,'userName',user.userName,'avatarUrl',user.avatarUrl)
				FROM user where user.userId=com.userId)
			 )) from comment as com where com.replyId=c.id) as reply
        from comment as c
        LEFT JOIN user as u on u.userId=c.userId
        where ${key}=?
        ORDER BY c.createTime desc
        limit ?,?`;
      const result = await connection.execute(sql, [id, offset, limit]);
      const count = `
              SELECT count(c.id) as count
              from comment as c
              LEFT JOIN user as u on u.userId=c.userId
              where ${key}=?`;
      const res = await connection.execute(count, [id]);
      return {
        count: res[0][0].count,
        comments: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getUserCommentService(userId, cId) {
    try {
      const sql = `select id,content from comment where userId=? and id=?`;
      const result = await connection.execute(sql, [userId, cId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除评论
  async deleteCommentService(userId, cId) {
    try {
      const sql = `delete from comment where userId=? and id=?`;
      const result = await connection.execute(sql, [userId, cId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new CommentService();

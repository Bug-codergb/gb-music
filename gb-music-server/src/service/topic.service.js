const connection = require('../app/database');
const { APP_HOST, APP_PORT } = require('../app/config');
class TopicService {
  async createService(name, description, userId) {
    try {
      const id = new Date().getTime();
      const coverURL = `${APP_HOST}:${APP_PORT}/topic/cover?id=${id}`;
      const sql = `
          insert into topic (id,name,description,userId,coverUrl) values(?,?,?,?,?)`;
      const result = await connection.execute(sql, [id, name, description, userId, coverURL]);
      return id;
    } catch (e) {
      return e;
    }
  }
  async uploadCoverService(id, originalname, mimetype, destination, filename, size) {
    try {
      const sql = `update topic set originalname=?,mimetype=?,dest=?,filename=?,size=? where id=?`;
      const result = await connection.execute(sql, [
        originalname,
        mimetype,
        destination,
        filename,
        size,
        id
      ]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getTopicCoverService(id) {
    try {
      const sql = 'select id,name,originalname,mimetype,dest,filename,size from topic where id=?';
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取热门话题
  async getHotTopicService() {
    try {
      const sql = `select t.id,t.name,t.description,t.coverUrl,t.createTime,t.updateTime,
       (select JSON_OBJECT('userId',t.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			  FROM user as u where u.userId=t.userId) as user
       from topic as t
       limit 0,10`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取话题详情
  async getTopicDetailService(id, offset, limit) {
    try {
      const topic = `select t.id,t.name,t.description,t.coverUrl,t.createTime,t.updateTime,
       (select JSON_OBJECT('userId',t.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			  FROM user as u where u.userId=t.userId) as user
       from topic as t
       where t.id=?`;

      const topicRes = await connection.execute(topic, [id]);

      const moments = `select m.id,content,(select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
       from user as u where u.userId=m.userId) as user,
			 JSON_OBJECT('id',songId,'name',s.name,'publishTime',s.publishTime,'alia',s.alia,
       'artist',(select JSON_OBJECT(
			  'id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl
			 ) FROM artist as ar where ar.id=s.arId),
			 'album',(select JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,'publishTime',al.publishTime,
			         'description',al.description)
			   FROM album as al where al.id=s.alId)) as song,
       createTime,m.updateTime,picUrl
       from moment as  m
       INNER JOIN song as s on s.id=m.songId
       where tId=?
       ORDER BY m.createTime desc
        limit ?,?`;

      const momentRes = await connection.execute(moments, [id, offset, limit]);
      return {
        ...topicRes[0][0],
        moments: momentRes[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取全部话题
  async getAllTopicService() {
    try {
      const sql = `select id,name,description,coverUrl,t.createTime,t.updateTime,
                   JSON_OBJECT('userId',t.userId,'userName',u.userName,'avatarUrl',u.avatarUrl) as user
                   from topic as t
                   LEFT JOIN user as u on u.userId=t.userId`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new TopicService();

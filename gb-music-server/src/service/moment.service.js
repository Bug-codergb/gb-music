const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class MomentService {
  async createService(content, userId, songId, tId) {
    try {
      const id = new Date().getTime();
      const url = `${APP_HOST}:${APP_PORT}/moment/picture?id=${id}`;
      const sql = `insert into moment(id,content,userId,songId,picUrl,tId) value(?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [id, content, userId, songId, url, tId]);
      return id;
    } catch (e) {
      throw e;
    }
  }
  //上传动态图片
  async uploadPicService(id, originalname, mimetype, dest, filename, size) {
    try {
      const sql = `update moment set originalname=?,mimetype=?,dest=?,filename=?,size=? where id=?`;
      const result = await connection.execute(sql, [
        originalname,
        mimetype,
        dest,
        filename,
        size,
        id
      ]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //是否可以删除
  async getMomentByIdService(id, userId) {
    try {
      const sql = `select id,content,userId,songId,createTime,updateTime,originalname,mimetype,dest,filename,size
                   from moment
                   where id=? and userId=?`;
      const result = await connection.execute(sql, [id, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getPictureByIdService(id) {
    try {
      const sql = `select originalname,mimetype,dest,filename,size
                   from moment
                   where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除动态
  async delMomentService(id, userId) {
    try {
      const sql = `delete from moment where id=? and userId=?`;
      const result = await connection.execute(sql, [id, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取搜索歌曲
  async getSongService(keyword) {
    try {
      const sql = `
        select s.id,s.name,s.publishTime,alia,
       JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,'publishTime',
			              al.publishTime,'description',al.description) AS album,
       JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl) AS artist,
			 (select dt from songsource as ss where ss.songId=s.id) as duration
       from song as s
       LEFT JOIN album as al on al.id=s.alId
       LEFT JOIN artist as ar on ar.id=s.arId
       where s.name like '%${keyword}%'`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取动态条数
  async getMomentCountService() {
    try {
      const sql = `select count(id) as count from moment`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取所有动态
  async getAllMomentService(offset, limit) {
    try {
      const sql = `
        select m.id,content,(select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
       from user as u where u.userId=m.userId) as user,
       JSON_OBJECT('id',songId,'name',s.name,'publishTime',s.publishTime,'alia',s.alia,'vip',s.vip,
       'artist',(select JSON_OBJECT(
			  'id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl
			 ) FROM artist as ar where ar.id=s.arId),
			 'album',(select JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,'publishTime',al.publishTime,
			         'description',al.description)
			   FROM album as al where al.id=s.alId)) as song,
       createTime,m.updateTime,picUrl
       from moment as  m
       INNER JOIN song as s on s.id=m.songId
       ORDER BY m.createTime desc
       limit ?,?`;
      const result = await connection.execute(sql, [offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取热门动态
  async getHotMomentService() {
    try {
      const sql = `
        select id,content,(select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
                   FROM user as u where m.userId=u.userId) as user,
       (select JSON_OBJECT('id',m.songId,'name',s.name,'publishTime',s.publishTime,
			                     'album',(select JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,
													                             'description',al.description)
													          FROM album as al where al.id=s.alId),
													  'artist',(select JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,
														                             'avatarUrl',ar.avatarUrl)
														          FROM artist as ar where ar.id=s.arId) )
			  FROM song as s where s.id=m.songId) as song,
			 m.createTime,m.updateTime,picUrl
       from moment as m
       LEFT JOIN thumb as t on t.momentId=m.id
       GROUP BY id
       ORDER BY count(id) desc
       limit 0,10`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new MomentService();

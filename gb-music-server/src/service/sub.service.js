const connection = require('../app/database');
class SubService {
  async subMusicService(userId, id, key) {
    try {
      const sql = `insert into subscriber(userId,${key}) values(?,?)`;
      const result = await connection.execute(sql, [userId, id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //取消收藏
  async cancelSubService(userId, id, key) {
    try {
      const sql = `delete from subscriber where userId=? and ${key}=?`;
      const result = await connection.execute(sql, [userId, id]);
    } catch (e) {
      console.log(e);
    }
  }
  async getMusicByIdService(userId, id, key) {
    try {
      const sql = `select * from subscriber where userId=? and ${key}=?`;
      const result = await connection.execute(sql, [userId, id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户收藏
  async getUserSubService(userId) {
    try {
      const sql = `
        select JSON_OBJECT('userId',sub.userId,'name',userName,'avatarUrl',user.avatarUrl) AS user,
       (select JSON_ARRAYAGG(JSON_OBJECT('id',s.alId,'name',al.name,'coverUrl',al.coverUrl,
			  'publishTime',al.publishTime,'description',al.description))
				from album as al INNER JOIN subscriber as s on s.alId=al.id WHERE sub.userId=s.userId) as album,
				(select JSON_ARRAYAGG(JSON_OBJECT('id',s.arId,'name',ar.name,'avatarUrl',ar.avatarUrl,
				        'description',ar.description))
				 FROM artist as ar INNER JOIN subscriber as s on s.arId=ar.id where sub.userId=s.userId) as artist,
				 (select JSON_ARRAYAGG(json_object('id',s.vId,'name',v.name,'coverUrl',v.coverUrl,
				        'playCount',v.playCount,'dt',v.dt,'createTime',v.createTime,'updateTime',v.updateTime,
								'user',(select JSON_OBJECT('userId',v.userId,'userName',user.userName,'avatarUrl',user.avatarUrl)
								FROM user where user.userId=v.userId)))
				  from video as v INNER JOIN subscriber as s on s.vId=v.vid  where sub.userId=s.userId) as video,
					(select JSON_ARRAYAGG(JSON_OBJECT('id',s.pId,'name',p.name,'description',p.description,'playCount',p.playCount,
				        'createTime',p.createTime,'updateTime',p.updateTime,'coverUrl',p.coverUrl,
								'user',(select JSON_OBJECT('userId',p.userId,'userName',user.userName,'avatarUrl',user.avatarUrl)
								FROM user where user.userId=p.userId )))
				 FROM playlist as p INNER JOIN subscriber as s on s.pId=p.id where sub.userId=s.userId) as playlist
            from subscriber as sub
            LEFT JOIN user on user.userId=sub.userId
            GROUP BY sub.userId
            HAVING sub.userId=?`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  /*获取用户收藏*/
  async getUserSubAlbumService(userId, offset, limit) {
    try {
      const sql = `
      select alId as id,name,coverUrl,publishTime,description,(
       select JSON_OBJECT('id',al.arId,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl)
			 FROM artist as ar where ar.id=al.arId
			 ) as artist
       from subscriber as sub
       LEFT JOIN album as al on al.id=alId
       where sub.userId=? and alId is not null
       limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `
       select count(alId) as count
              from subscriber as sub
              LEFT JOIN album as al on al.id=alId
              where sub.userId=? and alId is not null`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        album: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getUserSubArtistService(userId, offset, limit) {
    try {
      const sql = `
        select arId as id,name,description,avatarUrl,(
       select JSON_OBJECT('id',area,'name',ac.name)
			 from artist_cate as ac where area=ac.id) as area,
			 (select JSON_OBJECT('id',type,'name',at.name)
			  FROM artist_type as at where at.id=type) AS type
       from subscriber as sub
       LEFT JOIN artist as ar on ar.id=sub.arId
       where sub.userId=? and arId is not null
       limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getUserSubVideoService(userId, offset, limit) {
    try {
      const sql = `
        select sub.vId as id,name,v.type,if(v.type=0,(select JSON_OBJECT('userId',v.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
                           FROM user as u where u.userId=v.userId),(
                           select JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl)
          FROM song inner join artist as ar on ar.id=song.arId
           where song.id=v.songId
                           )) as user,
       coverUrl,(select JSON_OBJECT('id',v.cateId,'name',vc.name)
			           FROM video_cate as vc
								 where vc.id=v.cateId) as category,playCount,type,createTime,updateTime,description,dt
       from subscriber as sub
       LEFT JOIN video as v on v.vid=sub.vId
       where sub.userId=? and sub.vId is not null
       limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }

  //获取用户收藏歌单
  async getUserPlaylistService(userId, offset, limit) {
    try {
      const sql = `select sub.pId as id,p.name,p.description,p.playCount,p.createTime,p.updateTime,p.coverUrl,
       (select count(ps.songId) from playlist_song as ps where ps.pId=p.id) as count
        from playlist as p
        LEFT JOIN subscriber as sub
        on sub.pId=p.id
        where sub.userId=?
        limit ?,?
        `;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `
        select count(sub.pId) as count
               from playlist as p
               LEFT JOIN subscriber as sub
               on sub.pId=p.id
               where sub.userId=?`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        playlist: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户收藏电台
  async getUserChannelService(userId, offset, limit) {
    try {
      const sql = `
        select id,name,(select JSON_OBJECT('userId',cc.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
                FROM user as u where u.userId=cc.userId) as user,
			 coverUrl,description,createTime,updateTime,
			(select JSON_OBJECT('id',cc.cId,'name',c.name) FROM channel AS c where c.id=cc.cId) as channel
        from subscriber as sub
        LEFT JOIN channel_content as cc on cc.id=sub.cId
        where sub.userId=? and sub.cId is not null
        limit ?,?
        `;
      const result = await connection.execute(sql, [userId, offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new SubService();

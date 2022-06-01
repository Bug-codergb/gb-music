const connection = require('../app/database');
class MessageService {
  async publishAlbumService(arId, content, alId) {
    try {
      const id = new Date().getTime();
      const sql = `insert into message(id,arId,content,alId) values(?,?,?,?)`;
      const result = await connection.execute(sql, [id, arId, content, alId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async createPlaylistService(userId, content, pId) {
    try {
      const id = new Date().getTime();
      const sql = `insert into message(id,userId,content,pId) values(?,?,?,?)`;
      const result = await connection.execute(sql, [id, userId, content, pId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async thumbCommentService(userId, cId, content) {
    try {
      const id = new Date().getTime();
      const sql = `insert into message(id,userId,content,cId) values(?,?,?,?)`;
      const result = await connection.execute(sql, [id, userId, content, cId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async publishVideoService(userId, vId, content) {
    try {
      const id = new Date().getTime();
      const sql = `insert into message(id,userId,content,vId) values(?,?,?,?)`;
      const result = await connection.execute(sql, [id, userId, content, vId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async publishChannelService(userId, ccId, content) {
    try {
      const id = new Date().getTime();
      const sql = `insert into message(id,userId,content,ccId) values(?,?,?,?)`;
      const result = await connection.execute(sql, [id, userId, content, ccId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取发布了视频，创建了歌单，发布了生音
  async getMessageService(userId) {
    try {
      const sql = `
      select m.id,(select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
           FROM user as u where u.userId=m.userId) as user,checkout,m.createTime,m.updateTime,content,
				(
				  select JSON_OBJECT(
					 'id',m.vid,'name',v.name,'coverUrl',v.coverUrl,'playCount',v.playCount,'type',v.type,
					 'createTime',v.createTime,'updateTime',v.updateTime,'dt',v.dt,'description',v.description,
					 'user',(select JSON_OBJECT(
					   'userId',v.userId,'userName',u.userName,'avatarUrl',u.avatarUrl
					 ) FROM user as u where u.userId=v.userId),
					 'category',(select JSON_OBJECT() FROM video_cate as vc where vc.id=v.cateId)
					)
					from video as v where v.vid=m.vId
				) as video,
				(
				  select JSON_OBJECT(
					 'id',m.pId,'name',p.name,'description',p.description,'playCount',p.playCount,'createTime',p.createTime,
					 'updateTime',p.updateTime,'coverUrl',p.coverUrl,'user',(
					   select JSON_OBJECT(
						  'userId',p.userId,'userName',u.userName,'avatarUrl',u.avatarUrl
						 ) FROM user AS u where u.userId=p.userId
					 )
					)
					FROM playlist as p where p.id=m.pId
				) as playlist,
				(select JSON_OBJECT(
				 'id',m.ccId,'name',cc.name,'coverUrl',cc.coverUrl,'description',cc.description,
				 'createTime',cc.createTime,'updateTime',cc.updateTime,'user',(
				  select JSON_OBJECT(
					 'userId',cc.userId,'userName',u.userName,'avatarUrl',u.avatarUrl
					) FROM user as u where u.userId=cc.userId
				 )
				) FROM channel_content as cc where cc.id=m.ccId) as channel
      from message as m
      LEFT JOIN fans as f on m.userId=f.upId
      where f.userId=? and m.checkout=0`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //点赞了评论
  async thumbCommentMsgService(userId) {
    try {
      const sql = `
      select id,(select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
           FROM user as u where u.userId=m.userId) as user,checkout,createTime,updateTime,content,(select JSON_OBJECT(
				  'id',m.cId,'content',c.content,'user',(
					  SELECT JSON_OBJECT('userId',c.userId,'userName',user.userName,'avatarUrl',user.avatarUrl)
						from user where user.userId=c.userId
					),'createTime',c.createTime,'updateTime',c.updateTime
				) FROM comment as c where c.id=m.cId and c.userId=?) as comment
      from message as m
      where m.cId is not null and m.checkout=0`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //发布了专辑
  async publishAlbumMsgService(userId) {
    try {
      const sql = `
       select id,checkout,createTime,updateTime,content,
        (select JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,'publishTime',al.publishTime,
	   		                     'description',al.description,'category',(
	   												   select JSON_OBJECT('id',al.cateId,'name',ac.name) FROM albumcate as ac where ac.id=al.cateId),
	   												  'artist',(
	   														 select JSON_OBJECT(
	   		  'id',al.arId,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl,
	   			'area',(select JSON_OBJECT('id',ar.area,'name',ac.name) FROM artist_cate as ac where ac.id=ar.area),
	   			'type',(select JSON_OBJECT('id',at.id,'name',at.name) FROM artist_type as at where at.id=ar.type)
	   		 ) FROM artist as ar where al.arId=ar.id
	   													)
	   												)
	   		  FROM album as al where al.id=m.alId) as album,
	   			(select JSON_OBJECT(
	   		  'id',m.arId,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl,
	   			'area',(select JSON_OBJECT('id',ar.area,'name',ac.name) FROM artist_cate as ac where ac.id=ar.area),
	   			'type',(select JSON_OBJECT('id',at.id,'name',at.name) FROM artist_type as at where at.id=ar.type)
	   		 ) FROM artist as ar INNER JOIN subscriber as sub on sub.arId=m.arId
	   		   where ar.id=m.arId and sub.userId=?) as artist
       from message as m
       where alId is not null and m.checkout=0 `;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //一键已读
  async readMessageService(id) {
    try {
      for (let item of id) {
        const sql = `update message set checkout=1 where id=?`;
        const result = await connection.execute(sql, [item]);
      }
      return {
        code: 200,
        message: '更新成功'
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getMessageVideoService(userId, offset, limit) {
    try {
      const sql = `select DISTINCT(m.id),(select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
             FROM user as u where u.userId=m.userId) as user,
			 checkout,content,m.createTime,JSON_OBJECT('id',v.vid,'name',v.name,'coverUrl',v.coverUrl,
			 'playCount',v.playCount,'createTime',v.createTime,'updateTime',v.updateTime,'type',v.type,
			 'dt',v.dt,'description',v.description)	AS video
            from message as m
            LEFT JOIN fans as f on f.upId=m.userId
            INNER JOIN video as v on v.vid=m.vId
            where f.userId=?
            limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `
         select count(DISTINCT(m.id)) as count
         from message as m
         LEFT JOIN fans as f on f.upId=m.userId
         INNER JOIN video as v on v.vid=m.vId
         where f.userId=?`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        message: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getThumbCommentService(userId, offset, limit) {
    try {
      const sql = `
          select m.id,(select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
             FROM user as u where u.userId=m.userId) as user,checkout,m.content,m.cId,m.createTime,m.updateTime,
			 JSON_OBJECT('id',c.id,'content',c.content,'user',
			 (select JSON_OBJECT('userId',c.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			   FROM user as u where  u.userId=c.userId ),'createTime',c.createTime,'updateTime',c.updateTime)		as comment
          from message as m
          LEFT JOIN comment as c on c.id=m.cId
          where m.cId is not null and c.userId=?
          limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);

      const countSQL = `
              select count(m.id) as count
              from message as m
              LEFT JOIN comment as c on c.id=m.cId
              where m.cId is not null and c.userId=?`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        message: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getAlbumMsgService(userId, offset, limit) {
    try {
      const sql = `
      select m.id,
			(select JSON_OBJECT('id',m.arId,'name',ar.name,'avatarUrl',ar.avatarUrl,'description',ar.description)
			 FROM artist as ar where ar.id=m.arId) as artist,
			m.checkout,m.content,
			(select JSON_OBJECT('id',m.alId,'name',al.name,'coverUrl',al.coverUrl,'publishTime',al.publishTime,
			                     'description',al.description)
			 FROM album as al where al.id=m.alId) as album,m.createTime,m.updateTime
      from message as m
      LEFT JOIN subscriber as sub on sub.arId=m.arId
      where sub.userId=?
      limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `
             SELECT count(m.id) as count
             from message as m
             LEFT JOIN subscriber as sub on sub.arId=m.arId
             where sub.userId=?`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        message: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getPlaylistMsgService(userId, offset, limit) {
    try {
      const sql = `
         select DISTINCT(m.id),(select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
             FROM user as u where u.userId=m.userId) as user,m.checkout,m.content,m.createTime,m.updateTime,
			JSON_OBJECT('id',p.id,'name',p.name,'description',p.description,'user',
			(select JSON_OBJECT('userId',p.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			 FROM user as u where u.userId=p.userId ),'playCount',p.playCount,'createTime',p.createTime,
			  'updateTime',p.updateTime,'coverUrl',p.coverUrl) as playlist
         from message as m
         LEFT JOIN playlist as p on p.id=m.pId
         LEFT JOIN fans as f on f.upId=m.userId
         where f.userId=? and m.pId is not null
         limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `select count(DISTINCT(m.id)) as count
         from message as m
         LEFT JOIN playlist as p on p.id=m.pId
         LEFT JOIN fans as f on f.upId=m.userId
         where f.userId=? and m.pId is not null`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        message: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getChannelMsgService(userId, offset, limit) {
    try {
      const sql = `
        select DISTINCT(m.id),m.checkout,m.content,
       (select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			  from user as u where u.userId=m.userId) AS user,m.createTime,m.updateTime,
				JSON_OBJECT('id',cc.id,'name',cc.name,'coverUrl',cc.coverUrl,'description',cc.description,
				            'createTime',cc.createTime,'updateTime',cc.updateTime) AS channel
        from message as m
        LEFT JOIN channel_content as cc on cc.id=m.ccId
        LEFT JOIN fans as f on f.upId=m.userId
        where m.ccId is not null and f.userId=?
        limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `
          select count(DISTINCT(m.id)) as count
          from message as m
          LEFT JOIN channel_content as cc on cc.id=m.ccId
          LEFT JOIN fans as f on f.upId=m.userId
          where m.ccId is not null and f.userId=?`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        message: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //删除消息
  async deleteMsgService(id) {
    try {
      const sql = `delete from message where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //已读消息(一条)
  async readSingleMsgService(id) {
    try {
      const sql = `update message set checkout=1 where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new MessageService();

const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class UserService {
  //头像上传
  async createService(userId, originalname, mimetype, destination, filename, size) {
    try {
      const id = new Date().getTime();
      const sql =
        'insert into avatar(id,userId,originalname,mimetype,dest,filename,size) values(?,?,?,?,?,?,?)';
      const result = await connection.execute(sql, [
        id,
        userId,
        originalname,
        mimetype,
        destination,
        filename,
        size
      ]);

      const url = `${APP_HOST}:${APP_PORT}/user/avatar?id=${userId}`;
      const state = `update user set avatarUrl=? where userId=?`;
      await connection.execute(state, [url, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户头像
  async getUserAvatarService(id) {
    try {
      const sql = `select * from avatar where userId=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //用户喜欢歌曲
  async setUserFavoriteService(id, userId) {
    try {
      const sql = `insert into favorite(songId,userId) values(?,?)`;
      const result = await connection.execute(sql, [id, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //是否已经加入喜欢列表
  async isFavoriteService(id, userId) {
    try {
      const sql = `select * from favorite where songId=? and userId=?`;
      const result = await connection.execute(sql, [id, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户喜欢歌曲
  async getUserFavoriteService(userId, offset, limit) {
    try {
      const sql = `
        select (select JSON_OBJECT('userId',f.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
        FROM user as u where u.userId=f.userId) as user,
				JSON_OBJECT('id',s.id,'name',s.name,'publishTime',s.publishTime,'alia',s.alia,'vip',s.vip,
         'video',(select JSON_OBJECT('id',v.vid,'name',v.name) FROM video as v where v.songId=s.id),'duration',(
				 select dt from songsource as ss where ss.songId=s.id
				),'artist',(select JSON_OBJECT(
				 'id',a.id,'name',a.name,'description',a.description,'avatarUrl',a.avatarUrl
				) FROM artist as a where a.id=s.arId ),'album',(select JSON_OBJECT(
				  'id',al.id,'name',al.name,'coverUrl',al.coverUrl,'publishTime',al.publishTime,'description',al.description
					) FROM album as al where al.id=s.alId )) as song,
				f.createTime
        from favorite as f
        INNER JOIN song as s on s.id=f.songId
        where f.userId=?
        ORDER BY f.createTime desc
        limit ?,?`;
      const countSQL = `select count(songId) as count
                        from favorite
                        where userId=?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        songs: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //用户取消喜欢
  async cancelFavoriteService(songId, userId) {
    try {
      const sql = `
        delete from favorite as f where songId=? and userId=?;`;
      const result = await connection.execute(sql, [songId, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户详情
  async getUserDetailService(userId) {
    try {
      const sql = `
        select u.userId,userName,u.avatarUrl,JSON_OBJECT(
			 'album',JSON_ARRAYAGG((select JSON_OBJECT('id',sub.alId,'name',al.name)
			 FROM album as al where al.id=sub.alId)),
			 'artist',JSON_ARRAYAGG((select JSON_OBJECT('id',sub.arId,'name',ar.name)
			 FROM artist as ar where ar.id=sub.arId)),
			 'video',JSON_ARRAYAGG((select JSON_OBJECT('id',sub.vId,'name',v.name)
			 FROM video as v where v.vid=sub.vId)),
			 'playlist',JSON_ARRAYAGG((select JSON_OBJECT('id',sub.pId,'name',p.name)
			 FROM playlist as p where p.id=sub.pId)),
			 'channel',JSON_ARRAYAGG((select JSON_OBJECT('id',sub.cId,'name',cc.name)
			 FROM channel_content as cc where cc.id=sub.cId))
       ) AS subscriber,
			 JSON_OBJECT('video',
			             (select JSON_ARRAYAGG(t.vId) from thumb as t where t.userId=u.userId and t.vId is not null),
									 'moment',(select JSON_ARRAYAGG(t.momentId)
									             FROM thumb as t where t.userId=u.userId and t.momentId is not null),
									  'comment',(select JSON_ARRAYAGG(t.commentId)
										            FROM thumb AS t where t.userId=u.userId and t.commentId is not null)
			 ) as thumb,
			 (select JSON_ARRAYAGG(JSON_OBJECT('userId',upId)) FROM fans as f where f.userId=u.userId) as follow,
			 (select JSON_ARRAYAGG(JSON_OBJECT('songId',f.songId)) FROM favorite as f where f.userId=u.userId) as love
       from user as u
       LEFT JOIN subscriber as sub on sub.userId=u.userId
       GROUP BY u.userId
       having u.userId=?`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取其他用户详情
  async getOtherUserDetailService(userId) {
    try {
      const sql = `
      select u.userId,userName,u.avatarUrl,JSON_OBJECT(
			 'album',JSON_ARRAYAGG((select JSON_OBJECT('id',sub.alId,'name',al.name,'coverUrl',al.coverUrl,
			                                           'publishTime',al.publishTime,'description',al.description,
																								 'artist',(select JSON_OBJECT('id',al.arId,'name',a.name,
																								                              'avatarUrl',a.avatarUrl,
																																							'description',a.description)
																								           from artist as a where a.id=al.arId))
			 FROM album as al where al.id=sub.alId)),
			 'artist',JSON_ARRAYAGG((select JSON_OBJECT('id',sub.arId,'name',ar.name,'avatarUrl',ar.avatarUrl,
			                                            'description',ar.description)
			 FROM artist as ar where ar.id=sub.arId)),
			 'video',JSON_ARRAYAGG((select JSON_OBJECT('id',sub.vId,'name',v.name,
			              'user',(select JSON_OBJECT('userId',v.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
										        FROM user as u where u.userId=v.userId),
										'coverUrl',v.coverUrl,'category',(select JSON_OBJECT('id',v.cateId,'name',vc.name)
										                                  FROM video_cate AS vc where vc.id=v.cateId),
										'playCount',v.playCount,'type',v.type,'createTime',v.createTime,'updateTime',v.updateTime,
										'dt',v.dt,'desacription',v.description)
			 FROM video as v where v.vid=sub.vId)),
			 'playlist',JSON_ARRAYAGG((select JSON_OBJECT('id',sub.pId,'name',p.name,'description',p.description,
			                          'user',(select JSON_OBJECT('userId',p.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
																        from user as u where u.userId=p.userId),'playCount',p.playCount,
															 'createTime',p.createTime,'updateTime',p.updateTime,'coverUrl',p.coverUrl)
			 FROM playlist as p where p.id=sub.pId))
       ) AS subscriber,
			 JSON_OBJECT('video',
			             (select JSON_ARRAYAGG(t.vId) from thumb as t where t.userId=u.userId and t.vId is not null),
									 'moment',(select JSON_ARRAYAGG(t.momentId)
									             FROM thumb as t where t.userId=u.userId and t.momentId is not null),
									  'commment',(select JSON_ARRAYAGG(t.commentId)
										            FROM thumb AS t where t.userId=u.userId and t.commentId is not null)
			 ) as thumb
       from user as u
       LEFT JOIN subscriber as sub on sub.userId=u.userId
       GROUP BY u.userId
       having u.userId=?`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getUserChannelService(userId, offset, limit) {
    try {
      const sql = `
        select cc.id,cc.name,cc.coverUrl,cc.createTime,cc.updateTime,
        (select JSON_OBJECT('userId',cc.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			  FROM user as u where u.userId=cc.userId) as user,cc.description,
				if(sum(p.playCount) is null,0,sum(p.playCount) ) as playCount,
				(select JSON_OBJECT('id',cc.cId,'name',c.name) from channel as c where c.id=cc.cId) as channel
       from channel_content as cc
       LEFT JOIN program as p on p.cId=cc.id
       where cc.userId=?
       GROUP BY cc.id
       limit ?,?`;
      const result = await connection.execute(sql, [userId, offset.toString(), limit.toString()]);
      const countSql = `select count(cc.id) as count
                       from channel_content as cc
                       where cc.userId=?`;
      const count = await connection.execute(countSql, [userId]);
      return {
        count: count[0][0].count,
        channel: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户视频数据
  async getUserVioDataService(userId) {
    try {
      const sql = `
        select v.vid,(select JSON_OBJECT('userId',v.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
                 from user as u where u.userId=v.userId) as user,
			playCount,
			count(c.id) as comment,
			(select count(t.userId) from thumb as t where t.vId=v.vid)	as thumb
        from video as v
        left join comment as c on c.vId=v.vid
        where v.userId=? and type=0
        GROUP BY v.vid`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户动态数据
  async getUserMomentDataService(userId) {
    try {
      const sql = `
       select count(DISTINCT(m.id)) as count,count(t.userId) as thumb,
       (select count(c.id) as count
			 from comment as c
			 LEFT JOIN moment as mm on mm.id=c.mId
			 where c.mId=mm.id and c.mId is not null and mm.userId=?) as comment
        from moment as m
        LEFT JOIN thumb as t on t.momentId=m.id
        where m.userId=? and t.momentId is not null `;
      const result = await connection.execute(sql, [userId, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户视频列表
  async getUserVioListService(userId, offset, limit) {
    try {
      const sql = `
        select v.vid as id,v.name,v.coverUrl,(select JSON_OBJECT('userId',v.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
                 from user as u where u.userId=v.userId) as user,v.createTime,v.updateTime,v.dt,v.type,
			v.description,playCount,
			count(c.id) as comment,
			(select count(t.userId) from thumb as t where t.vId=v.vid)	as thumb
        from video as v
        left join comment as c on c.vId=v.vid
        where v.userId=? and type=0
        GROUP BY v.vid
        limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `select count(vid) as count
                        from video
                        where userId=? and type=0`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        video: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户声音列表
  async getUserProgramService(userId, offset, limit) {
    try {
      const sql = `
        select cc.id,JSON_OBJECT('id',cc.cId,'name',c.name) AS channel,
        cc.name,(select JSON_OBJECT('userId',cc.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			          from user as u where u.userId=cc.userId) as user,
			 coverUrl,description,cc.createTime,cc.updateTime,
			 (select SUM(p.playCount) from program as p where p.cId=cc.id GROUP BY p.cId) as playCount,
			 (select count(c.userId) from  program as p LEFT JOIN comment as c on c.cId=p.id and p.cId=cc.id ) as comment
        from channel_content as cc
        LEFT JOIN channel as c on c.id=cc.cId
        where cc.userId=?
        GROUP BY cc.id
        limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `select count(id) as count
                        from channel_content as cc
                        where cc.userId=?`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        channel: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getUserFansService(userId, offset, limit) {
    try {
      const sql = `
        select f.id,JSON_OBJECT('userId',f.userId,'userName',u.userName,'avatarUrl',u.avatarUrl) as user,
        (select count(v.vid) from video as v where v.userId=f.userId) as videoCount,
			 (select count(cc.id) from channel_content as cc where cc.userId=f.userId) as channelCount,
			 (SELECT count(p.id) from playlist as p where p.userId=f.userId) as playlistCount,
			 (select count(m.id) from moment as m where m.userId=f.userId) as momentCount
       from fans as f
       LEFT JOIN user as u on u.userId=f.userId
       where upId=?
       limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `select count(userId) as count
                       from fans
                       where upId=?`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0],
        fans: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getManageVioService(userId, offset, limit) {
    try {
      const sql = `select vid as id,v.name,coverUrl,v.playCount,v.type,JSON_OBJECT('id',v.cateId,'name',vc.name) AS category,
        dt,description,v.createTime,v.updateTime
        from video as v
        LEFT JOIN video_cate as vc on vc.id=v.cateId
        where v.userId=? and v.type=0
        limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `select count(vid) as count
                        from video
                        where userId=? and type=0`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        video: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户全部评论
  async getUserAllCommentService(userId, offset, limit) {
    try {
      const sql = `
        select c.id,c.content,c.songId,c.pId,c.alId,c.vId,c.mId,c.tId,c.cId,c.replyId,
         createTime,updateTime, (select JSON_OBJECT(
           'userId',c.userId,'userName',u.userName,'avatarUrl',u.avatarUrl
         ) FROM user as u where u.userId=c.userId) as user,
			  if(c.songId is not null,(
				    select JSON_object('id',c.songId,'name',s.name) from song as s where s.id=c.songId
				   ),if(pId is not null,(
					    select JSON_OBJECT('id',c.pId,'name',p.name,'coverUrl',p.coverUrl) FROM playlist as p where p.id=c.pId
					 ),if(alId is not null,(
					   select JSON_OBJECT('id',c.alId,'name',al.name,'coverUrl',al.coverUrl) from album as al where al.id=c.alId
					 ),if(vId is not null,(
					   select JSON_OBJECT('id',c.vId,'name',v.name,'coverUrl',v.coverUrl) FROM video as v where v.vid=c.vId
					 ),if(mId is not null,(
					   select JSON_OBJECT('id',c.mId,'name',m.content,'coverUrl',m.picUrl) FROM moment as m where m.id=c.mId
					 ),if(tId is not null,(
					   select JSON_OBJECT('id',c.tId,'name',t.name,'coverUrl',t.coverUrl) FROM toplist as t where t.id=c.tId
					 ),if(cId is not null,(
					   select JSON_OBJECT('id',cc.id,'name',pro.name,'coverUrl',cc.coverUrl)
						 FROM program as pro
						 LEFT JOIN channel_content as cc on pro.cId=cc.id
						 where pro.id=c.cId
					 ),if(replyId is not null,(
					   select JSON_OBJECT('id',c.replyId,'name',com.content) FROM comment as com where com.id=c.replyId
					 ),null)))))))) as source
          from comment as c
          where userId=?
          limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `
        select count(c.id) as count
        FROM comment as c
        where c.userId=?`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        comment: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getUserCountService() {
    try {
      const totalSQL = `SELECT count(userId) as count
                        FROM user`;
      const vipSQL = `select count(userId) as count
                      FROM user
                      where auth=1`;
      const noVipSQL = `select count(userId) as count
                        FROM user
                        where auth=0`;
      const manageSQL = `select count(userId) as count
                          FROM user
                          where manage=1`;
      const total = await connection.execute(totalSQL);
      const vip = await connection.execute(vipSQL);
      const noVip = await connection.execute(noVipSQL);
      const manage = await connection.execute(manageSQL);
      return {
        total: total[0][0].count,
        vip: vip[0][0].count,
        noVip: noVip[0][0].count,
        manage: manage[0][0].count
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getUserListService(vip, manage, keyword, offset, limit) {
    try {
      let keywordSQL = `${keyword.length === 0 ? '' : `and u.userName like '%${keyword}%'`}`;
      let exec = ``;
      if (vip === -1 && manage === -1 && keyword.length !== 0) {
        exec = `where u.userName like '%${keyword}%'`;
      } else if (vip !== -1 && manage !== -1) {
        exec = `where auth=? and manage=? ${keywordSQL}`;
      } else if (vip === -1 && manage !== -1) {
        exec = `where manage=? ${keywordSQL} `;
      } else if (vip !== -1 && manage === -1) {
        exec = `where auth=? ${keywordSQL} `;
      }
      const sql = `
      select u.userId,u.userName,u.avatarUrl,u.createTime,u.updateTime,u.cId,auth,expireTime,manage,
       (select count(p.id) from playlist as p where p.userId=u.userId) playlist,
			 (select count(m.id) from moment as m where m.userId=u.userId) moment,
			 (SELECT count(cc.id) from channel_content as cc where cc.userId=u.userId) as channel,
			 (select count(f.userId) from fans as f where f.upId=u.userId) as fan
       from user as u
       ${exec}
       limit ?,?`;

      const countSQL = `select count(userId) as count
                      FROM user as u
                      ${exec}`;
      let result = [],
        count = [];
      if (vip === -1 && manage === -1 && keyword.length !== 0) {
        result = await connection.execute(sql, [offset, limit]);
        count = await connection.execute(countSQL);
      } else if (vip !== -1 && manage !== -1) {
        result = await connection.execute(sql, [vip, manage, offset, limit]);
        count = await connection.execute(countSQL, [vip, manage]);
      } else if (vip === -1 && manage !== -1) {
        result = await connection.execute(sql, [manage, offset, limit]);
        count = await connection.execute(countSQL, [manage]);
      } else if (vip !== -1 && manage === -1) {
        result = await connection.execute(sql, [vip, offset, limit]);
        count = await connection.execute(countSQL, [vip]);
      } else {
        result = await connection.execute(sql, [offset, limit]);
        count = await connection.execute(countSQL);
      }
      return {
        count: count[0][0].count,
        user: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取用户VIP信息
  async getUserVIPService(userId) {
    try {
      const sql = `select userId,userName,auth,expireTime
                    from user
                    where userId=? `;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async updateUserExpireService(userId) {
    try {
      const sql = `update user set auth=0,expireTime=0,cId=null where userId=?`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async updateUserMsgService(userId, vip, name, manage, expireTime, combo) {
    try {
      const sql = `update user set auth=?,userName=?,manage=?,expireTime=?,cId=? where userId=?`;
      const result = await connection.execute(sql, [vip, name, manage, expireTime, combo, userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getUserMomentService(userId, offset, limit) {
    try {
      const sql = `
           select m.id,content,(select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
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
		    	  where m.userId=?
           ORDER BY m.createTime desc
           limit ?,?`;
      const result = await connection.execute(sql, [userId, offset, limit]);
      const countSQL = `
           select count(m.id) as count
           from moment as m
           where m.userId=?`;
      const count = await connection.execute(countSQL, [userId]);
      return {
        count: count[0][0].count,
        moment: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getSystemDataService() {
    try {
      const mSQL = `select count(m.id) as count
                   from moment as m`;
      const sSQL = `select count(s.id) as count
                   from song as s`;
      const mvSQL = `
       SELECT count(v.vid) as count
        from video as v
        WHERE v.type=1`;
      const pSQL = `
       select count(p.id) as count
       from program as p`;

      let tmp = '`order`';
      const oSQL = `
       select count(o.id) as count
       from ${tmp} as o
       where o.delete=0 and o.status=1`;

      const uSQL = `
       select count(u.userId) as count
       from user as u`;
      const mCount = await connection.execute(mSQL);
      const sCount = await connection.execute(sSQL);
      const mvCount = await connection.execute(mvSQL);
      const pCount = await connection.execute(pSQL);
      const oCount = await connection.execute(oSQL);
      const uCount = await connection.execute(uSQL);
      return {
        moment: mCount[0][0].count,
        song: sCount[0][0].count,
        mv: mvCount[0][0].count,
        program: pCount[0][0].count,
        order: oCount[0][0].count,
        user: uCount[0][0].count
      };
    } catch (e) {
      console.log(e);
    }
  }
  async getUserFileService(userId) {
    try {
      const sql = `
        select userId,originalname,mimetype,dest,filename from avatar where userId=?`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除用户
  async deleteUserService(userId) {
    try {
      const sql = `delete from user where userId=?`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getSimpleInfoService(userId) {
    const sql = `select (select JSON_OBJECT('userId',m.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
        FROM user as u where u.userId=m.userId) as user,count(m.id) as moment,
       (select count(f.upId) from fans as f where f.userId=m.userId) as pay,
			 (select count(f.userId) from fans as f where f.upId=m.userId) as fans
       from moment as m
       where m.userId=?
       GROUP BY m.userId`;
    const result = await connection.execute(sql, [userId]);
    return result[0];
  }
}
module.exports = new UserService();

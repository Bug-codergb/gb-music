const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class VideoService {
  async addVideoCateService(name, type) {
    try {
      const id = new Date().getTime();
      const sql = `insert into video_cate(id,name,type) values(?,?,?)`;
      const result = await connection.execute(sql, [id, name, type]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //添加视频
  async addVideoService(name, description, userId, cateId, type, songId) {
    try {
      const id = new Date().getTime();
      const url = `${APP_HOST}:${APP_PORT}/video?id=${id}`;
      const coverUrl = `${APP_HOST}:${APP_PORT}/video/cover?id=${id}`;
      const sql = `insert into video(vid,name,userId,coverUrl,url,cateId,type,description,songId) values(?,?,?,?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [
        id,
        name,
        userId,
        coverUrl,
        url,
        cateId,
        type,
        description,
        songId
      ]);
      return id;
    } catch (e) {
      console.log(e);
    }
  }
  //上传视频
  async uploadVideoService(dt, vid, originalname, mimetype, dest, filename, size) {
    try {
      const sql = `update video set originalname=?,mimetype=?,dest=?,filename=?,size=?,dt=?
                 where vid=? `;
      const result = await connection.execute(sql, [
        originalname,
        mimetype,
        dest,
        filename,
        size,
        dt,
        vid
      ]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取视频
  async getVideoSourceService(vid) {
    try {
      const sql = `select originalname,mimetype,dest,filename,size from video where vid=?`;
      const result = await connection.execute(sql, [vid]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //上传视频封面
  async uploadCoverService(vid, originalname, mimetype, destination, filename, size) {
    try {
      const id = new Date().getTime();
      const sql = `insert into video_cover(id,vid,originalname,mimetype,dest,filename,size) values(?,?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [
        id,
        vid,
        originalname,
        mimetype,
        destination,
        filename,
        size
      ]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取视频封面
  async getVideoCoverService(id) {
    try {
      const sql = `select originalname,mimetype,dest,filename,size from video_cover where vid=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取视频分类
  async getAllCateService(type) {
    try {
      const sql = `select id,name
                 from video_cate as vc
                 where type=?`;
      const result = await connection.execute(sql, [type]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取分类下视频
  async getCateVideoService(cateId, type, offset, limit, keyword) {
    try {
      const countSQL = `select vc.id,vc.name,count(v.vid) as count
                    from video_cate as vc
                    LEFT JOIN video as v on v.cateId=vc.id
                    where vc.type=? and vc.id=? ${
                      keyword.length !== 0 ? `and v.name like '%${keyword}%'` : ''
                    }
                    `;
      const countRes = await connection.execute(countSQL, [type, cateId]);
      const vidSQL = `
      select vid as id,v.name,coverUrl,v.playCount,v.createTime,v.updateTime,v.description,v.dt,
       if(v.type=0,(select JSON_OBJECT('userId',v.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			  FROM user as u where u.userId=v.userId),
				(select JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl)
				  FROM song inner join artist as ar on ar.id=song.arId
				 where song.id=v.songId)) as user,
				  JSON_OBJECT('id',vc.id,'name',vc.name) as category
       from video as v
       LEFT JOIN video_cate as vc on v.cateId=vc.id
			 LEFT JOIN song as s on s.id=v.songId
       where vc.type=? and vc.id=? ${keyword.length !== 0 ? `and v.name like '%${keyword}%' ` : ''}
       ORDER BY s.publishTime*1 DESC,v.playCount desc
       limit ?,?`;
      const videoRes = await connection.execute(vidSQL, [type, cateId, offset, limit]);
      return {
        count: countRes[0][0].count,
        category: {
          id: countRes[0][0].id,
          name: countRes[0][0].name
        },
        videos: videoRes[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取视频播放地址
  async getVideoURLService(id) {
    try {
      const sql = `
      select vid,name,url,dt
      from video
      where vid=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取视频详情
  async getVideoDetailService(id) {
    try {
      const sql = `
      select vid as id,name,description,coverUrl,
       (select JSON_OBJECT('id',cateId,'name',vc.name) FROM video_cate as vc where vc.id=cateId) as category,
       playCount,type,v.createTime,v.updateTime,dt,songId,
       if(type=0,JSON_OBJECT('userId',v.userId,'userName',u.userName,'avatarUrl',u.avatarUrl),
			    (select JSON_OBJECT('id',s.arId,'name',a.name,'description',a.description,'avatarUrl',a.avatarUrl)
					 from song as s LEFT JOIN artist as a on s.arId=a.id where s.id=v.songId)) as user
       from video as v
       LEFT JOIN user as u on u.userId=v.userId
       where vid=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除视频
  async delVideoService(id) {
    try {
      const sql = `delete from video where vid=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取相似视频
  async getSimilarVideoService(id) {
    try {
      const sql = `
      select vid as id,name,coverUrl,createTime,updateTime,description,dt,playCount,video.type,
       type,if(video.type=0,(select JSON_OBJECT('userId',video.userId,'userName',u.userName,'avatarUrl',u.avatarUrl) from user as u
			       where u.userId=video.userId),(
			       select JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl)
				   FROM song inner join artist as ar on ar.id=song.arId
				   where song.id=video.songId
			       )) as user
       from video
       where cateId=?
       ORDER BY playCount desc
       limit 0,10`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //添加视频播放量
  async addPlayCountService(id) {
    try {
      const sql = `select playCount from video where vid=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async updatePlayCountService(id, playCount) {
    try {
      const sql = `update video set playCount=? where vid=?`;
      const result = await connection.execute(sql, [playCount, id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取mv排行
  async getVideoRankService(cateId, offset, limit) {
    try {
      const sql = `
        select vid as id,v.name,coverUrl,v.playCount,type,v.createTime,v.updateTime,description,dt,cateId,
       JSON_OBJECT('userId',v.userId,'userName',u.userName,'avatarUrl',u.avatarUrl) as user,
			 JSON_OBJECT('id',v.songId,'name',s.name,'publishTime',s.publishTime,'alia',s.alia,
			              'album',(select JSON_OBJECT(
																		'id',al.id,'name',al.name,'coverUrl',al.coverUrl,'publishTime',al.publishTime
										                ) from album as al where al.id=s.alId),
										'artist',(select JSON_OBJECT(
																		'id',ar.id,'name',ar.name,'avatarUrl',ar.avatarUrl
										                ) from artist as ar where ar.id=s.arId
										)) as song
        from video as v
        LEFT JOIN song as s on s.id=v.songId
        LEFT JOIN user as u on u.userId=v.userId
        where type=1 and cateId=?
        order by playCount desc
        limit ?,?`;
      const result = await connection.execute(sql, [cateId, offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async updateVideoService(id, name, desc, cate) {
    try {
      const sql = `update video set name=?,description=?,cateId=? where vid=?`;
      const result = await connection.execute(sql, [name, desc, cate, id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取视频数据
  async getVideoDataService() {
    try {
      const sql = `select vc.id,vc.name,count(v.vid) as count,
       if(sum(v.playCount) is null,0,sum(v.playCount)) as playCount,
			 sum((select count(t.userId)
			         from thumb as t where t.vId=v.vid)) AS thumb,
			sum((select count(sub.userId)
			    from subscriber as sub where sub.vId=v.vid)) AS subscriber
        from video_cate	as vc
        LEFT JOIN video as v on v.cateId=vc.id
        where vc.type=0
        GROUP BY vc.id`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getMVDataService() {
    try {
      const sql = `
      select vc.id,vc.name,count(v.vid) as count,if(sum(v.playCount) is null,0,sum(v.playCount)) as playCount
      from video_cate as vc
      LEFT JOIN video as v on v.cateId=vc.id
      where vc.type=1
      GROUP BY vc.id;`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getRecUserListService() {
    try {
      const sql = `
      select JSON_ARRAYAGG(t.vId) AS video,t.userId
      from thumb as t
      WHERE t.vId is not null
      GROUP BY t.userId`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async delVideoCateService(id) {
    try {
      const sql = `delete from video_cate where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new VideoService();

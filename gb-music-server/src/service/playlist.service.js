const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class PlaylistService {
  async createService(name, desc, userId) {
    try {
      const id = new Date().getTime();
      const url = `${APP_HOST}:${APP_PORT}/playlist/cover?id=${id}`;
      const sql = `insert into playlist(id,name,description,userId,coverUrl) values(?,?,?,?,?)`;
      const result = await connection.execute(sql, [id, name, desc, userId, url]);
      return id;
    } catch (e) {
      console.log(e);
    }
  }
  //上传歌单封面
  async uploadCoverService(pId, originalname, mimetype, destination, filename, size) {
    const id = new Date().getTime();
    const sql = `insert into playlist_cover(id,pId,originalname,mimetype,dest,filename,size) values(?,?,?,?,?,?,?)`;
    const result = await connection.execute(sql, [
      id,
      pId,
      originalname,
      mimetype,
      destination,
      filename,
      size
    ]);
    return result[0];
  }
  //获取歌单封面
  async getPlayListCoverService(pId) {
    const sql = `select * from playlist_cover where pId=?`;
    const result = await connection.execute(sql, [pId]);
    return result[0];
  }
  //添加歌单分类
  async addCateService(name) {
    const id = new Date().getTime();
    const sql = `insert into playlist_cate(id,name) values(?,?)`;
    const result = await connection.execute(sql, [id, name]);
    return result[0];
  }
  //获取用户歌单
  async getUserPlaylistService(userId, offset, limit) {
    const sql = `
          select id,name,description,playCount,createTime,updateTime,coverUrl,
        count(ps.songId) as count
        from playlist as p
        LEFT JOIN playlist_song as ps on ps.pId=p.id
        where userId=?
        GROUP BY id
        limit ?,?`;
    const result = await connection.execute(sql, [userId, offset, limit]);
    const countSQL = `select count(id) as count
                        from playlist as p
                        where userId=?`;
    const count = await connection.execute(countSQL, [userId]);
    return {
      count: count[0][0].count,
      playlist: result[0]
    };
  }
  //获取推荐歌单
  async getRecPlaylistService(offset, limit) {
    const sql = `
        select id,name,description,coverUrl,playCount,p.createTime,p.updateTime,
        JSON_OBJECT('userId',p.userId,'userName',userName,'avatarUrl',avatarUrl) as creator
        from playlist as p
        LEFT JOIN user on p.userId=user.userId
        ORDER BY playCount DESC
        limit ?,?`;
    const result = await connection.execute(sql, [offset, limit]);
    return result[0];
  }
  //歌单是否存在歌曲
  async getPlayBySongService(pId, songId) {
    const sql = `select * from playlist_song where songId=? and pId=?`;
    const result = await connection.execute(sql, [songId, pId]);
    return result[0];
  }
  //为歌单添加歌曲
  async addSongToPlayService(pId, songId) {
    const sql = `insert into playlist_song(pId,songId) values(?,?)`;
    const result = await connection.execute(sql, [pId, songId]);
    return result[0];
  }
  //判断歌单分类是否已经添加
  async judgePlaylistCateService(pId, cateId) {
    const sql = `select * from playlist_category where pId=? and cateId=?`;
    const result = await connection.execute(sql, [pId, cateId]);
    return result[0];
  }
  //为歌单添加分类
  async addCateForPlayService(pId, cateId) {
    const sql = `insert into playlist_category(pId,cateId) values(?,?)`;
    const result = await connection.execute(sql, [pId, cateId]);
    return result[0];
  }
  //限制歌单分类个数
  async limitPlayCate(pId) {
    const sql = `select count(pc.cateId) as count
                   from playlist_category as pc
                   where pc.pId=?`;
    const result = await connection.execute(sql, [pId]);
    return result[0][0];
  }
  //获取歌单详情
  async getPlayDetailService(id) {
    const sql = `
        select p.id,p.name,p.description,playCount,p.createTime,p.updateTime,p.coverUrl,
        JSON_ARRAYAGG(JSON_OBJECT('id',pc.cateId,'name',playlist_cate.name)) AS category,
        (select JSON_OBJECT('userId',p.userId,'userName',user.userName,'avatarUrl',avatarUrl)
                from user where user.userId=p.userId)  as user,
        (SELECT JSON_ARRAYAGG(JSON_OBJECT('id',ps.songId,'name',song.name,'publishTime',song.publishTime,
            'duration',(select dt from songsource as s where s.songId=song.id),
            'artist',
           (select JSON_OBJECT('id',a.id,'name',a.name,'avatarUrl',a.avatarUrl) from artist as a where a.id=song.arId),
           'album',(SELECT JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,'publishTime',al.publishTime)
                 from album as al where al.id=song.alId),'vip',vip,
          'video',(select JSON_OBJECT('id',v.vid,'name',v.name) FROM video as v where v.songId=ps.songId)
       ))
          from playlist_song as ps
          LEFT JOIN song on song.id=ps.songId
          where ps.pId=p.id) as songs
          from playlist as p
          LEFT JOIN playlist_category as pc on pc.pId=p.id
          INNER JOIN playlist_cate on playlist_cate.id=pc.cateId
          GROUP BY p.id
          HAVING p.id=?`;
    const result = await connection.execute(sql, [id]);
    return result[0];
  }
  //获取所有歌单分类
  async getAllCateService(offset, limit) {
    try{
      const sql = `select id,name from playlist_cate limit ?,?`;
      const result = await connection.execute(sql, [offset, limit]);
      return result[0];
    }catch(e){
      console.log(e)
    }
  }
  //获取分类下歌单
  async getCateDetailService(cateId, offset, limit) {
    const sql = `select pc.id,pc.name,if(pId is null,null,
       JSON_OBJECT('id',pId,'name',p.name,'coverUrl',p.coverUrl,'playCount',p.playCount,
                               'description',p.description,'createTime',p.createTime,
                                 'updateTime',p.updateTime,
                                 'user',(select JSON_OBJECT('userId',p.userId,'userName',userName,'avatarUrl',avatarUrl)
                             from user where user.userId=p.userId) )) as playlist
       from playlist_cate as pc
       LEFT JOIN playlist_category as pcy on pcy.cateId=pc.id
       LEFT JOIN playlist as p on p.id=pcy.pId
       where pc.id=?
       limit ?,?`;
    const result = await connection.execute(sql, [cateId, offset, limit]);
    const countSQL = `select count(pc.id) as count
                        from playlist_cate as pc
                        LEFT JOIN playlist_category as pcy on pcy.cateId=pc.id
                        where pc.id=?`;
    const count = await connection.execute(countSQL, [cateId]);
    return {
      count: count[0][0].count,
      playlists: result[0]
    };
  }
  //获取歌单数量
  async getPlayListCountService(keyword) {
    const sql = `select count(id) as count from playlist
                   ${keyword.length !== 0 ? `where playlist.name like '%${keyword}%'` : ''}`;
    const result = await connection.execute(sql);
    return result[0];
  }
  //获取所有歌单
  async getAllPlaylistService(offset, limit, keyword) {
    const sql = `
        select p.id,p.name,description,playCount,createTime,updateTime,coverUrl,
       (select JSON_OBJECT('userId',p.userId,'userName',userName,'avatarUrl',avatarUrl)
			 FROM user where p.userId=user.userId) as user,
			 if(pc.cateId is null,null,JSON_ARRAYAGG(JSON_OBJECT('id',pc.cateId,'name',pct.name))) as category
        from playlist as p
        left join playlist_category as pc on pc.pId=id
        LEFT JOIN playlist_cate as pct on pct.id=pc.cateId
        ${keyword.length !== 0 ? `where p.name like '%${keyword}%'` : ''}
        GROUP BY p.id
        limit ?,?`;
    const result = await connection.execute(sql, [offset, limit]);
    return result[0];
  }
  //删除歌单
  async delPlaylistService(id) {
    const sql = `delete from playlist where id=?`;
    const result = await connection.execute(sql, [id]);
    return result[0];
  }
  //获取歌单封面文件
  async getPlaylistCoverFileService(id) {
    const sql = `
        select p.id,p.name,pc.originalname,pc.dest,pc.filename,pc.size
        from playlist as p
        LEFT JOIN playlist_cover as pc on pc.pId=p.id
        where p.id=?`;
    const result = await connection.execute(sql, [id]);
    return result[0];
  }
  //获取歌单收藏者
  async getSubUserService(id, offset, limit) {
    try {
      const sql = `
            select pId,JSON_OBJECT('userId',sub.userId,'userName',u.userName,'avatarUrl',u.avatarUrl) as user
            from subscriber as sub
            LEFT JOIN user as u on u.userId=sub.userId
            where pId=?
            limit ?,?`;
      const result = await connection.execute(sql, [id, offset, limit]);
      const countSQL = `
            select count(pId) as count
             from subscriber as sub
             LEFT JOIN user as u on u.userId=sub.userId
             where pId=?`;
      const count = await connection.execute(countSQL, [id]);
      return {
        count: count[0][0].count,
        user: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌单简略信息
  async getPlaylistService(id) {
    const sql = `select id,name,description,playCount,createTime,updateTime,coverUrl from playlist where id=?`;
    const result = await connection.execute(sql, [id]);
    return result[0];
  }
  //更新歌单播放量
  async updatePlayCountService(playCount, id) {
    const sql = `update playlist set playCount=? where id=?`;
    const result = await connection.execute(sql, [playCount, id]);
    return result[0];
  }
  //包含这首歌的歌单
  async getIncludePlaylistService(id) {
    const sql = `
        select id,name,description,
        (select JSON_OBJECT('userId',userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			  from user as u
				where u.userId=p.userId) as user,
				playCount,createTime,updateTime,coverUrl
        from playlist_song as ps
        LEFT JOIN playlist as p on p.id=ps.pId
        where ps.songId=?
        limit 0,8`;
    const result = await connection.execute(sql, [id]);
    return result[0];
  }
  //获取热门歌单
  async getHotPlaylistService() {
    const sql = `
        select p.id,name,description,(select JSON_OBJECT('userId',p.userId,'userName',userName,'avatarUrl',avatarUrl)
                              from user where user.userId=p.userId) as user,
               playCount,coverUrl,p.createTime,p.updateTime,count(c.id) as count
        from comment as c
        INNER JOIN playlist as p on p.id=c.pId
        GROUP BY c.pid
        ORDER BY count desc
        limit 0,10`;
    const result = await connection.execute(sql);
    return result[0];
  }
  async getPlaylistDataService() {
    const sql = `
        select pc.id,pc.name,count(pcy.pId) as count,sum(p.playCount) as playCount,
       sum((select count(ps.songId) from playlist_song as ps where ps.pId=pcy.pId)) as song
       from playlist_cate as pc
       LEFT JOIN playlist_category as pcy on pcy.cateId=pc.id
       LEFT JOIN playlist as p on p.id=pcy.pId
       GROUP BY pc.id `;
    const result = await connection.execute(sql);
    return result[0];
  }
  async updatePlaylistService(id, name, desc, cate) {
    try {
      const sql = `update playlist set name=?,description=? where id=?`;
      const result = await connection.execute(sql, [name, desc, id]);

      const cateDelSQL = `delete from playlist_category as pc where pc.pId=?`;
      await connection.execute(cateDelSQL, [id]);

      for (let item of cate) {
        const insertSQL = `insert into playlist_category (pId,cateId) values(?,?)`;
        await connection.execute(insertSQL, [id, item]);
      }
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async delPlaylistCateService(id) {
    try {
      const sql = `delete from playlist_cate where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new PlaylistService();

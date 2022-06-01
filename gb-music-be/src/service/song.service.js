const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class SongService {
  //添加歌曲信息
  async createService(name, arId, alId, publishTime, alia) {
    try {
      const id = new Date().getTime();
      const url = `${APP_HOST}:${APP_PORT}/song/source?id=${id}`;
      const sql = `insert into song(id,name,arId,alId,publishTime,alia,mp3Url) values(?,?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [id, name, arId, alId, publishTime, alia, url]);
      return id;
    } catch (e) {
      console.log(e);
    }
  }
  //获取song的source
  async getSongSourceService(songId) {
    try {
      const sql = `select * from songsource where songId=?`;
      const result = await connection.execute(sql, [songId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //上传歌曲
  async uploadSongService(songId, originalname, mimetype, destination, filename, size, dt) {
    try {
      const id = new Date().getTime();
      const sql = `insert into songsource(id,songId,originalname,mimetype,dest,filename,size,dt) values(?,?,?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [
        id,
        songId,
        originalname,
        mimetype,
        destination,
        filename,
        size,
        dt
      ]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取推荐歌曲
  async getRecSongService(offset, limit) {
    try {
      const sql = `select song.id,song.name,alia,song.playCount,JSON_OBJECT('id',artist.id,'name',artist.name,'avatarUrl',artist.avatarUrl) as artist,
       JSON_OBJECT('id',album.id,'name',album.name,'coverUrl',album.coverUrl,'publishTime',album.publishTime,
      'description',album.description) as album,song.publishTime,vip,
      (select JSON_OBJECT('id',vid,'name',name) from video where video.songId=song.id) as video
        from song
        LEFT JOIN artist on artist.id=arId
        LEFT JOIN album on album.id=alId
        ORDER BY song.publishTime*1 desc,song.playCount*1 desc
        limit ?,?`;
      const result = await connection.execute(sql, [offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌曲URL
  async getSongURL(id) {
    try {
      const sql = `select id,name,publishTime,mp3Url
        from song
        where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌曲详情
  async getSongDetailService(id) {
    try {
      const sql = `select s.id,s.name,s.publishTime,alia,vip,
        JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl) AS artist,
        JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,
             'publishTime',al.publishTime,'description',al.description) AS album,
        (select dt from songsource as ss where ss.songId=s.id) as duration,
        (select JSON_OBJECT('id',v.vid,'name',v.name) from video as v where s.id=v.songId) as video
        from song as s
        LEFT JOIN artist as ar on ar.id=arId
        LEFT JOIN album as al on al.id=alId
        where s.id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌曲数量
  async getSongCuntService(keyword) {
    try {
      const sql = `select count(song.id) as count from song where song.name like '%${keyword}%'`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取全部歌曲
  async getAllSongService(offset, limit, keyword) {
    try {
      const sql = `
        select s.id,s.name,s.publishTime,s.alia,s.vip,
       JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl) as artist,
			 JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,'publishTime',al.publishTime,
			 'description',al.description) as album,
			 (select JSON_ARRAYAGG(JSON_OBJECT('id',ps.pId,'name',p.name))
			  from playlist_song as ps LEFT JOIN playlist as p on p.id=ps.pId where ps.songId=s.id) as playlist
       from song as s
       LEFT JOIN artist as ar on ar.id=s.arId
       left JOIN album as al on al.id=s.alId
       where s.name like '%${keyword}%'
       limit ?,?`;
      const result = await connection.execute(sql, [offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //上传歌词
  async addLyricService(id, lyric) {
    try {
      const sql = `
      update song set lyric=? where id=?`;
      const result = await connection.execute(sql, [lyric, id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌词
  async getLyricService(id) {
    try {
      const sql = `
        select id,name,alia,lyric from song where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌曲播放量
  async getSongPlayCount(id) {
    try {
      const sql = `
        select id,name,playCount
        from song
        where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //添加歌曲播放量
  async addPlayCountService(id, count) {
    try {
      const sql = `
       update song set playCount=? where id=?`;
      const result = await connection.execute(sql, [count, id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //更新vip信息
  async updateSongVipService(vip, id) {
    try {
      const sql = `update song set vip=? where id=?`;
      const result = await connection.execute(sql, [vip, id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌曲简略信息
  async getSongMsgService(id) {
    try {
      const sql = `
            select s.id,s.name,s.publishTime,alia,s.vip,s.playCount,
                   ss.originalname,ss.mimetype,ss.dest,ss.filename,ss.size
            from song as s
            LEFT JOIN songsource as ss on ss.songId=s.id
            where s.id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除歌曲
  async deleteSongService(id) {
    try {
      const sql = `delete from song where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //更新歌曲信息
  async updateSongService(id, name, alia, publishTime, vip) {
    try {
      const sql = `update song set name=?,alia=?,publishTime=?,vip=? where id=?`;
      const result = await connection.execute(sql, [name, alia, publishTime, vip, id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //更新歌词信息
  async updateLyricService(id, lyric) {
    try {
      const sql = `update song set lyric=? where id=?`;
      const result = await connection.execute(sql, [lyric, id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new SongService();

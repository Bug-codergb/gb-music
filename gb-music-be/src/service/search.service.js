const connection = require('../app/database');
class SearchService {
  async userSearchService(keyword) {
    try {
      const sql = `
        select userId,userName,avatarUrl,createTime,updateTime,auth
        from user
        where userName like '%${keyword}%'`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async albumSearchService(keyword) {
    try {
      const sql = `
        select al.id,al.name,coverUrl,publishTime,al.description,JSON_OBJECT(
          'id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl
       ) as artist
        from album as al
        LEFT JOIN artist as ar on ar.id=al.arId
        where al.name like '%${keyword}%'`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async playlistSearchService(keyword) {
    try {
      const sql = `
        select id,name,description,coverUrl,
       JSON_OBJECT('userId',p.userId,'userName',u.userName,'avatarUrl',u.avatarUrl) AS user,
       playCount,p.createTime,p.updateTime
        from playlist as p
        LEFT JOIN user as u on u.userId=p.userId
        where name like '%${keyword}%'`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async artistSearchService(keyword) {
    try {
      const sql = `
        select ar.id,ar.name,description,avatarUrl,JSON_OBJECT('id',ac.id,'area',ac.name) as area
        from artist as ar
        LEFT JOIN artist_cate as ac on ac.id=area
         where ar.name like '%${keyword}%'`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async videoSearchService(keyword) {
    try {
      const sql = `
        select vid as id,name,if(v.type=0,JSON_OBJECT('userId',v.userId,'userName',u.userName,'avatarUrl',
       u.avatarUrl),(select JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,
			                                  'avatarUrl',ar.avatarUrl)
			               from song as s
										 LEFT JOIN artist as ar on ar.id=s.arId
										 where v.songId=s.id)
			 ) as user,
        coverUrl,playCount,type,v.createTime,v.updateTime,dt,description
        from video as v
        LEFT JOIN user as u on u.userId=v.userId
        where name like '%${keyword}%'`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async songSearchService(keyword) {
    try {
      const sql = `
        select s.id,s.name,s.publishTime,alia,
       JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,'publishTime',
			              al.publishTime,'description',al.description) AS album,
       JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl) AS artist,
			 (select dt from songsource as ss where ss.songId=s.id) as duration,s.vip,
       (select JSON_OBJECT('id',v.vid,'name',v.name) FROM video AS v where v.songId=s.id) as video
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
  async getSearchMatchService(keyword) {
    try {
      const user = await new SearchService().userSearchService(keyword);
      const playlist = await new SearchService().playlistSearchService(keyword);
      const album = await new SearchService().albumSearchService(keyword);
      const artist = await new SearchService().artistSearchService(keyword);
      const video = await new SearchService().videoSearchService(keyword);
      const song = await new SearchService().songSearchService(keyword);
      return {
        user,
        playlist,
        album,
        artist,
        video,
        song
      };
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new SearchService();

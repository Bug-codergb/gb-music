const connection = require('../app/database');
const client = require('../app/redis');
const { formatTime } = require('../utils/formatTime');
const { APP_PORT, APP_HOST } = require('../app/config');
class ToplistService {
  async createToplistService(name, desc,type) {
    try {
      const id = new Date().getTime();
      const url = `${APP_HOST}:${APP_PORT}/toplist/cover?tId=${id}`;
      const sql = `insert into toplist(id,name,description,coverUrl,type) values(?,?,?,?,?)`;
      const result = await connection.execute(sql, [id, name, desc, url,type]);
      return id;
    } catch (e) {
      console.log(e);
    }
  }
  //上传歌单封面
  async uploadCoverService(tId, originalname, destination, filename, size, mimetype) {
    try {
      const id = new Date().getTime();
      const sql = `insert into toplist_cover(id,tId,originalname,dest,filename,size,mimetype) values(?,?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [
        id,
        tId,
        originalname,
        destination,
        filename,
        size,
        mimetype
      ]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取榜单封面
  async getToplistCoverService(id) {
    try {
      const sql = `select * from toplist_cover where tId=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取官方榜单
  async getOfficialTopService() {
    try {
      const sql = `select id,name,t.createTime,t.updateTime,coverUrl,description,type,playCount,
       JSON_OBJECT('userId',t.userId,'userName',userName,'avatarUrl',avatarUrl) as user
       from toplist as t
       LEFT JOIN user on user.userId=t.userId
       where type=1`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //歌曲是否存在与榜单
  async getSongOfficialService(tId, songId) {
    try {
      const sql = `select * from toplist_song where songId=? and tId=?`;
      const result = await connection.execute(sql, [songId, tId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  /*将歌曲加入排行榜*/
  async addSongToTopService(tId, songId) {
    try {
      const sql = `insert into toplist_song(tId,songId) values(?,?)`;
      const result = await connection.execute(sql, [tId, songId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //添加diff
  async addSongMsgToTop(tId, songId, diff) {
    try {
      const sql = `insert into toplist_song(tId,songId,diff) values(?,?,?)`;
      const result = await connection.execute(sql, [tId, songId, diff]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取榜单简略信息
  async getToplistSimpleService(id) {
    try {
      const sql = 'select id,name from toplist where id=?';
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取飙升榜详情
  async getSoarListService(id) {
    try {
      const sql = `select t.id,t.name,t.createTime,t.updateTime,coverUrl,description,type,t.playCount,
        (select JSON_OBJECT('userId',t.userId,'userName',userName,'avatarUrl',avatarUrl)
			  from user where userId=t.userId)	as user,
			  JSON_OBJECT('id',ts.songId,'name',s.name,'publishTime',s.publishTime,'alia',alia,'diff',ts.diff,
			  'duration',(select dt from songsource as ss where ss.songId=ts.songId),
			  'album',(select JSON_OBJECT('id',a.id,'name',a.name,'coverUrl',a.coverUrl,
				'publishTime',a.publishTime,'description',a.description)
				 from album as a where a.id=alId),
				'artist',(select JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl)
				  from artist as ar where ar.id=arId),'vip',s.vip,
        'video',(select JSON_OBJECT('id',v.vid,'name',v.name) FROM video as v where v.songId=ts.songId)	) as song
        from toplist as t
        LEFT JOIN toplist_song as ts on ts.tId=id
        LEFT JOIN song as s on s.id=ts.songId
        where t.id=?
		order BY ts.diff desc
		limit 0,50`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取榜单详情
  async getToplistDetailService(id) {
    try {
      const sql = `
        select t.id,t.name,t.createTime,t.updateTime,coverUrl,description,type,t.playCount,
       (select JSON_OBJECT('userId',t.userId,'userName',userName,'avatarUrl',avatarUrl)
			  from user where userId=t.userId)	as user,
			 JSON_ARRAYAGG(JSON_OBJECT('id',ts.songId,'name',s.name,'publishTime',s.publishTime,'alia',alia,'diff',ts.diff,
			  'duration',(select dt from songsource as ss where ss.songId=ts.songId),
			  'album',(select JSON_OBJECT('id',a.id,'name',a.name,'coverUrl',a.coverUrl,
				'publishTime',a.publishTime,'description',a.description)
				 from album as a where a.id=alId),
				'artist',(select JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',ar.avatarUrl)
				  from artist as ar where ar.id=arId),'vip',s.vip,
        'video',(select JSON_OBJECT('id',v.vid,'name',v.name) FROM video as v where v.songId=ts.songId)	)) as songs
        from toplist as t
        LEFT JOIN toplist_song as ts on ts.tId=id
        LEFT JOIN song as s on s.id=ts.songId
        GROUP BY t.id
        HAVING t.id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取其它榜单
  async getHotToplistService() {
    try {
      const sql = `select id,name,t.createTime,t.updateTime,coverUrl,description,type,playCount,
       JSON_OBJECT('userId',t.userId,'userName',userName,'avatarUrl',avatarUrl) as user
       from toplist as t
       LEFT JOIN user on user.userId=t.userId
       where type=0`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //移除排行榜中歌曲
  async removeSongService(tId, sId) {
    try {
      const sql = `
        delete from toplist_song as ts where ts.tId=? and songId=?`;
      const result = await connection.execute(sql, [tId, sId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取热门榜单
  async hotToplistService(id) {
    try {
      const sql = `
        select s.id,s.name,s.playCount
        from song as s
        LEFT JOIN artist as ar on ar.id=s.arId
        LEFT JOIN artist_cate as ac on ar.area=ac.id
        where ac.id=?
        order BY playCount desc
        limit 0,50 `;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除排行榜歌曲
  async deleteSongService(tId) {
    try {
      const sql = `delete from toplist_song where tId=?`;
      const result = await connection.execute(sql, [tId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除排行榜歌曲根据songId
  async deleteSongBySidService(tId, songId) {
    try {
      const sql = `delete from toplist_song as ts where ts.tId=? and ts.songId=?`;
      const result = await connection.execute(sql, [tId, songId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getCateSongService(id) {
    try {
      const sql = `
        select s.id,s.name,s.playCount
        from song as s
        LEFT JOIN artist as ar on ar.id=s.arId
        LEFT JOIN artist_cate as ac on ar.area=ac.id
        where ac.id=?
        order BY playCount desc`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //新歌榜
  async getNewToplistService() {
    const sql = `
        select s.id,s.name,al.publishTime,s.playCount
        from song as s
        LEFT JOIN album as al on al.id=s.alId
        ORDER BY al.publishTime+0 desc
        limit 0,50`;
    const result = await connection.execute(sql);
    return result[0];
  }
  //热歌榜
  async getHotSongToplistService() {
    try {
      const sql = `select s.id,s.name,al.publishTime,s.playCount
                   from song as s
                   LEFT JOIN album as al on al.id=s.alId
                   ORDER BY s.playCount*1 desc
                   limit 0,50`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //流行榜
  async getPopularToplistService() {
    try {
      const sql = `
        select s.id,s.name,s.playCount,count(c.songId) as count
        from song as s
        LEFT JOIN comment as c on c.songId=s.id
        GROUP BY s.id
        ORDER BY count desc
        limit 0,50`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //批量排行榜
  async exportSongService() {
    try {
      const sql = 'select id,name from artist_cate';
      const cate = await connection.execute(sql);
      const topSQL = 'select id,name from toplist';
      const top = await connection.execute(topSQL);
      for (let item of top[0]) {
        switch (item.name) {
          case '韩语榜':
            await new ToplistService().deleteSongService(item.id);
            for (let it of cate[0]) {
              if (it.name === '韩国') {
                const res = await new ToplistService().getCateSongService(it.id);
                if (res.length !== 0) {
                  for (let iten of res.slice(0, 50)) {
                    await new ToplistService().addSongToTopService(item.id, iten.id);
                  }
                }
              }
            }
            break;
          case '日语榜':
            await new ToplistService().deleteSongService(item.id);
            for (let it of cate[0]) {
              if (it.name === '日本') {
                const res = await new ToplistService().getCateSongService(it.id);
                if (res.length !== 0) {
                  for (let iten of res.slice(0, 50)) {
                    await new ToplistService().addSongToTopService(item.id, iten.id);
                  }
                }
              }
            }
            break;
          case '欧美热歌榜':
            await new ToplistService().deleteSongService(item.id);
            for (let it of cate[0]) {
              if (it.name === '欧美') {
                const res = await new ToplistService().getCateSongService(it.id);
                if (res.length !== 0) {
                  for (let iten of res.slice(0, 50)) {
                    await new ToplistService().addSongToTopService(item.id, iten.id);
                  }
                }
              }
            }
            break;
          case '新歌榜':
            await new ToplistService().deleteSongService(item.id);
            const res = await new ToplistService().getNewToplistService();
            if (res.length !== 0) {
              for (let iten of res.slice(0, 50)) {
                await new ToplistService().addSongToTopService(item.id, iten.id);
              }
            }
            break;
          case '热歌榜':
            await new ToplistService().deleteSongService(item.id);
            const hot = await new ToplistService().getHotSongToplistService();
            if (hot.length !== 0) {
              for (let iten of hot.slice(0, 50)) {
                await new ToplistService().addSongToTopService(item.id, iten.id);
              }
            }
            break;
          case '流行榜':
            await new ToplistService().deleteSongService(item.id);
            const popular = await new ToplistService().getPopularToplistService();
            if (popular.length !== 0) {
              for (let iten of popular.slice(0, 50)) {
                await new ToplistService().addSongToTopService(item.id, iten.id);
              }
            }
            break;
          case '飙升榜':
            //await new ToplistService().deleteSongService(item.id);
            const currentTime = formatTime(new Date().getTime(), 'yyyy-MM-dd');
            const yesterday = formatTime(new Date().getTime() - 86400000, 'yyyy-MM-dd');
            const currentSongs = await client.get(currentTime);
            const yesterdaySongs = await client.get(yesterday);
            /*if(!currentSongs){
                          const top=await new ToplistService().getHotSongToplistService();
                          if(top.length!==0){
                              for(let iten of hot.slice(0,50)){
                                  await new ToplistService().addSongToTopService(item.id,iten.id);
                              }
                          }
                       }*/
            if (currentSongs) {
              const current = JSON.parse(currentSongs);
              const prev = JSON.parse(yesterdaySongs) || [];
              const endSong = current.map((iten, index) => {
                const yesterday = prev.find((it, i) => {
                  return it.id === iten.id;
                });
                if (yesterday) {
                  //找到了
                  return {
                    songId: iten.id,
                    tId: item.id,
                    diff: iten.playCount - yesterday.playCount,
                    currentPlayCount: iten.playCount,
                    prevPlayCount: yesterday.playCount
                  };
                } else {
                  //未找到
                  return {
                    songId: iten.id,
                    tId: item.id,
                    diff: iten.curPlayCount,
                    currentPlayCount: iten.playCount,
                    prevPlayCount: 0
                  };
                }
              });
              for (let it of endSong) {
                await new ToplistService().deleteSongBySidService(it.tId, it.songId);
              }
              endSong.sort((cur, prev) => {
                return prev.diff - cur.diff;
              });
              for (let it of endSong.slice(0, 50)) {
                await new ToplistService().addSongMsgToTop(it.tId, it.songId, it.diff);
              }
            }
            break;
        }
      }
    } catch (e) {
      console.log(e);
    }
  }
  //获取相关榜单
  async getSimiToplistService() {
    try {
      const sql = `
          select id,name,coverUrl,description,playCount,createTime,
          updateTime
          from toplist`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除榜单
  async deleteToplistService(id) {
    try {
      const sql = `delete from toplist where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取榜单全部信息
  async getAllToplistMsgService(id) {
    try {
      const sql = `
       select t.id,t.name,t.createTime,t.updateTime,coverUrl,
       description,type,playCount,tc.originalname,tc.dest,tc.filename,tc.mimetype
       from toplist as t
       LEFT JOIN toplist_cover as tc on tc.tId=t.id
       where t.id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //更新排行榜播放量
  async updatePlayCountService(id, playCount) {
    try {
      const sql = `update toplist set playCount=? where id=?`;
      const result = await connection.execute(sql, [playCount, id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new ToplistService();

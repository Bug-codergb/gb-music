const errorType = require('../constants/errorType');
const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class AlbumService {
  //添加专辑分类
  async createService(name) {
    try {
      const id = new Date().getTime();
      const sql = `insert into albumcate(id,name) values(?,?)`;
      const result = await connection.execute(sql, [id, name]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取专辑
  async getAlbumService(id) {
    try {
      const sql = `select * from album where name=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取专辑封面
  async getAlbumCoverService(id) {
    try {
      const sql = `select * from albumcover where alId=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //添加专辑
  async addAlbumService(name, publishTime, description, arId, cateId) {
    try {
      const id = new Date().getTime();
      const url = `${APP_HOST}:${APP_PORT}/album/cover?id=${id}`;
      const sql = `insert into album(id,name,coverUrl,publishTime,description,arId,cateId) VALUES(?,?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [
        id,
        name,
        url,
        publishTime,
        description,
        arId,
        cateId
      ]);
      return id;
    } catch (e) {
      throw e;
    }
  }
  //上传专辑封面
  async uploadCoverService(alId, originalname, mimetype, destination, filename, size) {
    try {
      const id = new Date().getTime();
      const sql = `insert into albumcover(id,alId,originalname,mimetype,dest,filename,size) values(?,?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [
        id,
        alId,
        originalname,
        mimetype,
        destination,
        filename,
        size
      ]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //获取专辑分类
  async getAlbumCateService() {
    const sql = 'select * from albumcate order by sort_by desc';
    const result = await connection.execute(sql);
    return result[0];
  }
  //获取所有专辑
  async getAllAlbumService(offset, limit) {
    try {
      const sql = `
          select album.id,album.name,coverUrl,publishTime,album.description,JSON_OBJECT('id',arId,'name',artist.name) as artist,
        JSON_OBJECT('id',album.cateId,'name',ac.name) as category
        from album
        LEFT JOIN artist on artist.id=arId
        LEFT JOIN albumcate as ac on ac.id=album.cateId
        LIMIT ?,?`;
      const result = await connection.execute(sql, [offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取专辑详情
  async getAlbumDetailService(id) {
    try {
      const sql = `select album.id,album.name,coverUrl,album.publishTime,album.description,
        JSON_OBJECT('id',arId,'name',artist.name,'avatarUrl',avatarUrl) as artist,
        JSON_OBJECT('id',album.cateId,'name',ac.name) as category,
        (select JSON_ARRAYAGG(
          JSON_OBJECT('id',s.id,'name',s.name,'alia',s.alia,'dt',(
         select dt from songsource as so where so.songId=s.id
          ),'vip',s.vip,'video',(select JSON_OBJECT(
           'id',v.vid,'name',v.name
         ) FROM video as v where v.songId=s.id) )
         ) FROM song as s where s.alId=album.id) as songs
         from album
        LEFT JOIN artist on artist.id=arId
        LEFT JOIN albumcate as ac on ac.id=album.cateId
        where album.id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取推荐专辑
  async getRecAlbumService(offset, limit) {
    try {
      const sql = `select album.id,album.name,coverUrl,publishTime,album.description,
        JSON_OBJECT('id',arId,'name',artist.name,'avatarUrl',avatarUrl) as artist,
       JSON_OBJECT('id',album.cateId,'name',ac.name) as category,
       (select count(s.alId) from subscriber as s where s.alId=album.id) as subscriber
       from album
       LEFT JOIN artist on artist.id=arId
       LEFT JOIN albumcate as ac on ac.id=album.cateId
       ORDER BY subscriber desc
       LIMIT ?,?;`;
      const result = await connection.execute(sql, [offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取专辑个数
  async getCateAlbumCountService(id, keyword) {
    try {
      const sql = `select count(a.id) as count
                   from albumcate as ac
                   LEFT JOIN album as a on a.cateId=ac.id
                   where ${id!==undefined && id!==null ? `ac.id=?`:''} ${keyword.length !== 0 ? ` and a.name like '%${keyword}%'` : ''}`;
      const result = await connection.execute(sql, [id]);

      return result[0][0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取分类下专辑
  async getCateAlbumDetailService(id, keyword, offset, limit) {
    try {
      const sql = `select ac.id,ac.name,if(a.id is null,null,JSON_OBJECT('id',a.id,'name',a.name,'coverUrl',a.coverUrl,
            'publishTime',a.publishTime,'description',a.description,'artist',(
                select JSON_OBJECT('id',artist.id,'name',artist.name,'description',a.description,'avatarUrl',avatarUrl)
        FROM artist where artist.id=arId
        ),'count',(select count(s.id) as count from song as s where s.alId=a.id)
        )) as album
        from albumcate as ac
        LEFT JOIN album as a on a.cateId=ac.id
        where ac.id=? ${keyword.length !== 0 ? ` and a.name like '%${keyword}%'` : ''}
        order by a.createTime desc
		limit ?,?`;
      const result = await connection.execute(sql, [id, offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除专辑
  async delAlbumService(id) {
    try {
      const sql = `delete from album where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取去专辑封面
  async getCoverByIdService(id) {
    try {
      const sql = `select originalname,dest,filename,size from albumcover where alId=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取专辑下歌曲源信息
  async getSourceByAlbumService(id) {
    try {
      const sql = `
        select a.id,a.name,s.id as songId,s.name as songName,ss.originalname,ss.dest,ss.filename,ss.size
        from album as a
        INNER JOIN song as s on s.alId=a.id
        LEFT JOIN songsource as ss on ss.songId=s.id
        where a.id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除专辑下歌曲
  async delAlbumSongService(songId, alId) {
    try {
      const sql = `delete from song where id=? and alId=?`;
      const result = await connection.execute(sql, [songId, alId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取专辑下歌曲source信息
  async getSongSourceService(songId, alId) {
    try {
      const sql = `
        select s.id,s.name,ss.originalname,ss.dest,ss.filename,ss.size
        from song as s
        LEFT JOIN songsource as ss on ss.songId=s.id
        where s.id=? and s.alId=?`;
      const result = await connection.execute(sql, [songId, alId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getSubUserService(id, offset, limit) {
    try {
      const sql = `
       select alId,JSON_OBJECT('userId',sub.userId,'userName',u.userName,'avatarUrl',u.avatarUrl) as user
        from subscriber as sub
        LEFT JOIN user as u on u.userId=sub.userId
        where alId=?
        limit ?,?`;
      const result = await connection.execute(sql, [id, offset, limit]);
      const countSQL = `
        select count(sub.userId) as count
        from subscriber as sub
        LEFT JOIN user as u on u.userId=sub.userId
        where alId=?`;
      const count = await connection.execute(countSQL, [id]);
      return {
        count: count[0][0].count,
        user: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //湖区热门专辑
  async getHotAlbumService() {
    try {
      const sql = `
        select a.id,a.name,a.publishTime,a.coverUrl,a.description,count(c.id) as count
        from comment as c
        INNER JOIN album as a on a.id=c.alId
        GROUP BY c.alId
        ORDER BY count desc
        limit 0,10`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取专辑信息
  async getAlbumDataService() {
    try {
      const sql = `
        select JSON_OBJECT('count',count(al.cateId),'name',ac.name) as album
                from albumcate as ac
                LEFT JOIN album  as al on ac.id=al.cateId
                GROUP BY al.cateId`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //更新专辑信息
  async updateAlbumService(alId, name, desc, publishTime) {
    try {
      const sql = `update album set ${
        name.length === 0
          ? ''
          : `${desc.length === 0 && publishTime.length === 0 ? 'name=?' : 'name=?,'}`
      }
                                      ${
                                        desc.length === 0
                                          ? ''
                                          : `${
                                              publishTime.length === 0
                                                ? 'description=?'
                                                : 'description=?,'
                                            }`
                                      }
                                      ${publishTime.length === 0 ? '' : 'publishTime=?'}
                 where id=?`;
      let result = {};

      if (name.length === 0 && desc.length !== 0 && publishTime.length !== 0) {
        result = await connection.execute(sql, [desc, publishTime, alId]);
      } else if (name.length !== 0 && desc === 0 && publishTime !== 0) {
        result = await connection.execute(sql, [name, publishTime, alId]);
      } else if (name.length !== 0 && desc.length !== 0 && publishTime.length === 0) {
        result = await connection.execute(sql, [name, desc, alId]);
      } else if (name.length !== 0 && desc.length === 0 && publishTime.length === 0) {
        result = await connection.execute(sql, [name, alId]);
      } else if (name.length === 0 && desc.length !== 0 && publishTime.length === 0) {
        result = await connection.execute(sql, [desc, alId]);
      } else if (name.length === 0 && desc.length === 0 && publishTime.length !== 0) {
        result = await connection.execute(sql, [publishTime, alId]);
      } else {
        result = await connection.execute(sql, [name, desc, publishTime, alId]);
      }
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async delAlbumCateService(id) {
    try {
      const sql = `delete from albumcate where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new AlbumService();

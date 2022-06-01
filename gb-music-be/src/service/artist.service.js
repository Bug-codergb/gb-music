const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class ArtistService {
  //添加歌手
  async createService(name, desc, area) {
    try {
      const id = new Date().getTime();
      const url = `${APP_HOST}:${APP_PORT}/artist/avatar?id=${id}`;
      const sql = `insert into artist(id,name,description,avatarUrl,area) values(?,?,?,?,?)`;
      const result = await connection.execute(sql, [id, name, desc, url, area]);
      return {
        id,
        name
      };
    } catch (e) {
      console.log(e);
    }
  }
  //头像信息
  async getAvatarService(arId) {
    try {
      const sql = `select * from artistavatar where arId=?`;
      const result = await connection.execute(sql, [arId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //上传头像
  async uploadAvatarService(arId, originalname, mimetype, destination, filename, size) {
    try {
      const id = new Date().getTime();
      const sql = `insert into artistavatar(id,arId,originalname,mimetype,dest,filename,size) values(?,?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [
        id,
        arId,
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
  //添加歌手分类
  async addArtistCateService(name) {
    try {
      const id = new Date().getTime();
      const sql = `insert into artist_cate(id,name) values(?,?)`;
      const result = await connection.execute(sql, [id, name]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌手分类
  async getArtistCateService() {
    try {
      const sql = `select * from artist_cate`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //设置歌手cate
  async setArtistCateService(arId, cateId) {
    try {
      const sql = `update artist set area=? where id=?`;
      const result = await connection.execute(sql, [cateId, arId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取所有歌手
  async getAllArtistService(offset, limit) {
    try {
      const sql = `select * from artist limit ?,?`;
      const result = await connection.execute(sql, [offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取分类下歌手
  async getCateArtistService(offset, limit, area = '0', type = '0', letter, keyword) {
    try {
      const sql = `select id,name,description,avatarUrl,area,type,
       (select count(s.id) from song as s where s.arId=ar.id) as song,
        (select count(al.id) from album as al where al.arId=ar.id) as album
        from artist as ar ${type === '0' && area === '0' ? '' : 'where'}
                    ${area === '0' ? '' : 'area=?'} ${area !== '0' && type !== '0' ? 'and' : ''} ${
        type === '0' ? '' : 'type=?'
      }
                    ${
                      type === '0' && area === '0' && keyword.length !== 0
                        ? `where ar.name like '%${keyword}%'`
                        : ''
                    }
                    ${
                      (type === '0' || area === '0') && keyword.length !== 0
                        ? `and ar.name like '%${keyword}%'`
                        : ''
                    }
                   limit ?,?`;
      const countSQL = `select count(*) as count from artist as ar ${
        type === '0' && area === '0' ? '' : 'where'
      }
                    ${area === '0' ? '' : 'area=?'} ${area !== '0' && type !== '0' ? 'and' : ''} ${
        type === '0' ? '' : 'type=?'
      }
                    ${
                      type === '0' && area === '0' && keyword.length !== 0
                        ? `where ar.name like '%${keyword}%'`
                        : ''
                    }
                    ${
                      (type === '0' || area === '0') && keyword.length !== 0
                        ? `and ar.name like '%${keyword}%'`
                        : ''
                    }
                    `;
      let count = 0;
      let result = null;
      if (area === '0' && type !== '0') {
        result = await connection.execute(sql, [type, offset, limit]);
        count = await connection.execute(countSQL, [type]);
      } else if (area !== '0' && type === '0') {
        result = await connection.execute(sql, [area, offset, limit]);
        count = await connection.execute(countSQL, [area]);
      } else if (area === '0' && type === '0') {
        result = await connection.execute(sql, [offset, limit]);
        count = await connection.execute(countSQL);
      } else {
        result = await connection.execute(sql, [area, type, offset, limit]);
        count = await connection.execute(countSQL, [area, type]);
      }
      let tmpCount = count[0][0].count;
      return {
        count: tmpCount,
        result: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取推荐歌手
  async getRecArtistService(offset, limit) {
    try {
      const sql = `
        select a.id,a.name,a.description,avatarUrl,count(album.id) as albumCount
        from artist as a
        LEFT JOIN album on a.id=album.arId
        GROUP BY a.id
        ORDER BY albumCount desc
        limit ?,?`;
      const result = await connection.execute(sql, [offset, limit]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌手详情
  async getArtistDetailService(id) {
    try {
      const sql = `
         select a.id,a.name,a.description,a.avatarUrl,a.area,(select JSON_OBJECT('id',a.area,'name',ac.name) from artist_cate as ac where ac.id=a.area) as category,count(al.id) as albumCount,
       if(al.id is null,null,JSON_ARRAYAGG(JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,
			 'publishTime',al.publishTime, 'description',al.description,'songs',(
			  select JSON_ARRAYAGG(JSON_OBJECT('id',s.id,'name',s.name,'publishTime',s.publishTime,'alia',s.alia,
				'dt',(select dt from songsource as ss where ss.songId=s.id),'vip',s.vip,'video',(
				 select JSON_OBJECT('id',v.vid,'name',v.name) FROM video as v where v.songId=s.id
				) ))
			  FROM song as s where s.alId=al.id
			))) )as album
        from artist as a
        LEFT JOIN album as al on al.arId=a.id
        group by a.id
        having a.id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除歌手
  async delArtistService(id) {
    try {
      const sql = `delete from artist where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌手头像
  async getArtistAvatarService(id) {
    try {
      const sql = `select id,originalname,dest,filename,size from artistavatar where arId=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌手MV
  async getArtistMVService(id) {
    try {
      const sql = `
        select vid as id,v.name,v.coverUrl,v.playCount,v.type,v.createTime,v.updateTime,v.dt,
       JSON_OBJECT('id',s.arId,'name',a.name,'description',a.description,'avatarUrl',a.avatarUrl) AS artist
        from video as v
        LEFT JOIN song as s on s.id=v.songId
        LEFT JOIN artist as a on a.id=s.arId
        where v.type=1 and s.arId=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取相似歌手
  async getSimiArtistService(area, offset, limit) {
    try {
      const sql = `
         select id,name,description,avatarUrl
         from artist as ar
         where area=?
         limit ?,? `;
      const result = await connection.execute(sql, [area, offset, limit]);
      const countSQL = `select count(ar.id) as count from artist as ar where ar.area=?`;
      const count = await connection.execute(countSQL, [area]);
      return {
        count: count[0][0].count,
        artist: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //添加歌手type
  async addArtistTypeService(name) {
    try {
      const id = new Date().getTime();
      const sql = `insert into artist_type (id,name) values(?,?)`;
      const result = await connection.execute(sql, [id, name]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //设置歌手type
  async setArtistTypeService(arId, id) {
    try {
      const sql = `update artist set type=? where id=?`;
      const result = await connection.execute(sql, [id, arId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌手type
  async getArtistTypeService() {
    try {
      const sql = `select id,name from artist_type`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌手专辑
  async getArtistAlbumService(id, offset, limit) {
    try {
      const sql = `
                 select id,name,coverUrl,publishTime,description,
                (select JSON_OBJECT('id',al.cateId,'name',ac.name)
			             FROM albumcate as ac where ac.id=al.cateId) as category
                from album as al
                where al.arId=?
                limit ?,?`;
      const result = await connection.execute(sql, [id, offset, limit]);
      const countSQL = `
                        select count(id) as count
                        from album as al
                        where al.arId=?`;
      const count = await connection.execute(countSQL, [id]);
      return {
        albums: result[0],
        count: count[0][0].count
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取歌手歌曲
  async getArtistSongService(id, offset, limit) {
    try {
      const sql = `
        select s.id,s.name,s.publishTime,s.alia,s.vip,s.playCount,
        (select dt from songsource as ss where ss.songId=s.id) as duration,
			 JSON_OBJECT('id',s.alId,'name',al.name,'coverUrl',al.coverUrl,'publishTime',al.publishTime,
			             'description',al.description,'category',(
									  select JSON_OBJECT(
										'id',al.cateId,'name',ac.name
										) FROM albumcate as ac where ac.id=al.cateId
									 )) AS album
       from song as s
       LEFT JOIN album as al on al.id=s.alId
       where s.arId=?
       limit ?,?`;
      const result = await connection.execute(sql, [id, offset, limit]);
      const countSQL = `
       select count(s.id) as count
       from song as s
       where s.arId=?`;
      const count = await connection.execute(countSQL, [id]);
      return {
        count: count[0][0].count,
        songs: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //更新歌手信息
  async updateUserMsgService(arId, name, desc) {
    try {
      let flag = true;
      if ((name.length === 0 && desc.length !== 0) || (name.length !== 0 && desc.length === 0)) {
        flag = false;
      }
      const sql = `update artist set ${name.length === 0 ? '' : 'name=?'}
                                     ${flag ? ',' : ''}
                                     ${desc.length === 0 ? '' : 'description=?'} where id=?`;
      let result;
      if (name.length === 0) {
        result = await connection.execute(sql, [desc, arId]);
      } else if (desc.length === 0) {
        result = await connection.execute(sql, [name, arId]);
      } else {
        result = await connection.execute(sql, [name, desc, arId]);
      }
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getArtistDataService() {
    try {
      const cateSQL = `
      select ac.id,ac.name,count(ar.id) as count
      from artist_cate as ac
      LEFT JOIN artist as ar on ar.area=ac.id
      GROUP BY ac.id`;
      const cateResult = await connection.execute(cateSQL);
      for (let item of cateResult[0]) {
        const typeSQL = `
          SELECT at.id,at.name,count(at.id) as count
           FROM artist_type as at
           LEFT JOIN artist as art on at.id=art.type
           LEFT JOIN artist_cate as ac on ac.id=art.area
           where art.area=?
           GROUP BY at.id`;
        const result = await connection.execute(typeSQL, [item.id]);
        item.type = result[0];
      }
      return cateResult;
    } catch (e) {
      console.log(e);
    }
  }
  async getHotArtistService() {
    try {
      const sql = `
      SELECT (select JSON_OBJECT('id',sub.arId,'name',ar.name,'description',ar.description,
                           'avatarUrl',ar.avatarUrl)
              from artist as ar
				      where ar.id=sub.arId) as artist,(count(DISTINCT(al.id))+count(DISTINCT(sub.userId))) as sub
      from subscriber as sub
      INNER JOIN album as al on al.arId=sub.arId
      where sub.arId is not null
      GROUP BY sub.arId
      ORDER BY sub desc
      limit 0,8`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除歌手categories。
  async deleteCateService(cateId) {
    try {
      const sql = `delete from artist_cate as ac where id=?`;
      const result = await connection.execute(sql, [cateId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除歌手type
  async deleteArtistTypeService(id) {
    try {
      const sql = `delete from artist_type as at where id=? `;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new ArtistService();

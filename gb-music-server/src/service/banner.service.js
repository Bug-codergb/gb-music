const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class BannerService {
  async createService(key, id, type) {
    try {
      const bId = new Date().getTime();
      const picUrl = `${APP_HOST}:${APP_PORT}/banner?id=${bId}`;
      const sql = `insert banner (id,picUrl,${key},type) values(?,?,?,?)`;
      const result = await connection.execute(sql, [bId, picUrl, id, type]);
      return bId;
    } catch (e) {
      console.log(e);
    }
  }
  //上传banner封面
  async uploadImgService(key, id, originalname, mimetype, dest, filename, size) {
    try {
      const sql = `update banner set
                  originalname=?,mimetype=?,dest=?,filename=?,size=?
                  where ${key}=?`;
      const result = await connection.execute(sql, [
        originalname,
        mimetype,
        dest,
        filename,
        size,
        id
      ]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取banner图片
  async getBannerImgService(id) {
    try {
      const sql = `select originalname,mimetype,dest,filename,size from banner where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取banner
  async getRecBannerService() {
    try {
      const sql = `
        select id,picUrl,songId,vId,alId,type,createTime,updateTime
        from banner
        ORDER BY createTime desc
        limit 0,8`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取banner详细信息（list）
  async getBannerListService() {
    try {
      const sql = `
        select id,picUrl,(select JSON_OBJECT('id',banner.songId,'name',s.name,'publishTime',s.publishTime,'alia',s.alia,
                                     'album',(select JSON_OBJECT('id',al.id,'name',al.name,'coverUrl',al.coverUrl,                                              'description',al.description,'artist',
																		 (select JSON_OBJECT('id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',                                                          ar.avatarUrl)
																		 FROM artist as ar where ar.id=al.arId) )
																	FROM album as al where al.id=s.alId),
																	'artist',(select JSON_OBJECT(
																	    'id',ar.id,'name',ar.name,'description',ar.description,'avatarUrl',                                                          ar.avatarUrl
																	) FROM artist as ar where ar.id=s.arId)
																	)
                  from song as s
									where s.id=banner.songId ) as song,
									(select JSON_OBJECT(
									  'id',banner.vId,'name',v.name,'coverUrl',v.coverUrl,'playCount',v.playCount,'type',v.type,
										'createTime',v.createTime,'updateTime',v.updateTime,'duration',v.dt,'description',v.description,
										'user',(select JSON_OBJECT('userId',v.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
										        from user as u where u.userId=v.userId)
									) FROM video as v where v.vid=banner.vId) as video,
									(select JSON_OBJECT(
									  'id',al.id,'name',al.name,'coverUrl',al.coverUrl,'publishTime',al.publishTime,
										'description',al.description,'artist',(
										  select JSON_OBJECT('id',ar.id,'name',ar.name,'avatarUrl',ar.avatarUrl,'description',ar.description)
											from artist as ar where ar.id=banner.alId
										)
									) FROM album as al where al.id=banner.alId) as album,
        type,createTime,updateTime
        from banner
        ORDER BY createTime desc`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //获取banner文件信息
  async getBannerFileMsgService(id) {
    try {
      const sql = `select id,originalname,mimetype,dest,filename,size from banner where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  //删除banner信息
  async deleteBannerService(id) {
    try {
      const sql = `delete from banner where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}

module.exports = new BannerService();

const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class ChannelService {
  async createService(content, originalname, mimetype, destination, filename, size) {
    try {
      const id = new Date().getTime();
      const picUrl = `${APP_HOST}:${APP_PORT}/channel/cover?id=${id}`;
      const sql = `insert into channel(id,name,originalname,mimetype,dest,filename,size,picUrl) values(?,?,?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [
        id,
        content,
        originalname,
        mimetype,
        destination,
        filename,
        size,
        picUrl
      ]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  async getChannelCoverService(id) {
    try {
      const sql = `select id,name,createTime,updateTime,picUrl,originalname,mimetype,dest,filename,size from channel where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async updateCoverService(id, originalname, mimetype, destination, filename, size) {
    try {
      const picUrl = `${APP_HOST}:${APP_PORT}/channel/cover?id=${id}`;
      const sql = `update channel set originalname=?,mimetype=?,dest=?,filename=?,size=?,picUrl=? where id=?`;
      const result = await connection.execute(sql, [
        originalname,
        mimetype,
        destination,
        filename,
        size,
        picUrl,
        id
      ]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  async getChannelFileService(id) {
    const sql = `select id,name,originalname,mimetype,dest,filename,size
               from channel
               where id=?`;
    const result = await connection.execute(sql, [id]);
    return result[0];
  }
  async delChannelService(id) {
    try {
      const sql = `delete from channel where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  async addContentService(cId, name, description, userId) {
    try {
      const id = new Date().getTime();
      const coverUrl = `${APP_HOST}:${APP_PORT}/channel/content/cover?id=${id}`;
      const sql = `
        insert into channel_content(id,cId,name,userId,coverUrl,description) values(?,?,?,?,?,?)`;
      const result = await connection.execute(sql, [id, cId, name, userId, coverUrl, description]);
      return id;
    } catch (e) {
      throw e;
    }
  }
  async uploadContentCoverService(id, originalname, mimetype, destination, filename, size) {
    try {
      const sql = `
        update channel_content set originalname=?,mimetype=?,dest=?,filename=?,size=? where id=?`;
      const result = await connection.execute(sql, [
        originalname,
        mimetype,
        destination,
        filename,
        size,
        id
      ]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  async getContentCoverService(id) {
    try {
      const sql = 'select originalname,mimetype,dest,filename,size from channel_content where id=?';
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //获取所有频道内容
  async getAllChannelService() {
    try {
      const sql = `select c.id,c.name,c.createTime,c.updateTime,count(cc.id) as count,picUrl
                   from channel as c
                   LEFT JOIN channel_content as cc on cc.cId=c.id
                   GROUP BY c.id
                   ORDER BY createTime asc`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //获取频道内容
  async getContentService(id, offset, limit) {
    try {
      const sql = `
        select JSON_OBJECT('id',c.id,'name',c.name,'createTime',c.createTime,'updateTime',c.updateTime) AS channel,
        cc.id,cc.name,cc.coverUrl,cc.createTime,cc.updateTime,cc.description,
        (select JSON_OBJECT('userId',cc.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
           from user as u where u.userId=cc.userId) as user,
           (select count(pro.id) from program as pro where pro.cId=cc.id) as count,
        (select sum(pro.playCount) from program as pro where pro.cId=cc.id) as playCount
        from channel as c
        INNER JOIN channel_content as cc on cc.cId=c.id
        where c.id=?
        limit ?,?`;
      const result = await connection.execute(sql, [id, offset, limit]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //获取频道内容个数
  async getContentCountService(id) {
    try {
      const sql = `
        select count(cc.id) as count
        from channel as c
        left join channel_content as cc on cc.cId=c.id
        where c.id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //上传program
  async addProgramService(name, userId, cId) {
    try {
      const id = new Date().getTime();
      const url = `${APP_HOST}:${APP_PORT}/channel/program?id=${id}`;
      const sql = `
        insert into program(id,name,userId,cId,url) values(?,?,?,?,?)`;
      const result = await connection.execute(sql, [id, name, userId, cId, url]);
      return id;
    } catch (e) {
      throw e;
    }
  }
  //上传program源文件
  async addProgramSourceService(id, mimetype, destination, filename, originalname, size, dt) {
    try {
      const sql = `update program set mimetype=?,dest=?,filename=?,originalname=?,size=?,dt=? where id=?`;
      const result = await connection.execute(sql, [
        mimetype,
        destination,
        filename,
        originalname,
        size,
        dt,
        id
      ]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //获取program
  async getProgramService(id) {
    try {
      const sql = `select mimetype,dest,filename,size from program where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //获取电台详情
  async getChannelDetailService(id, offset, limit) {
    try {
      const sql = `
       select p.id,p.name,playCount,
       JSON_OBJECT('id',cc.id,'name',cc.name,'coverUrl',cc.coverUrl,'description',cc.description,
			             'createTime',cc.createTime,'updateTime',cc.updateTime,'user',(
									  select JSON_OBJECT('userId',cc.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
										FROM user as u where u.userId=cc.userId
									 )) as channel,p.dt,
			 p.createTime
       from program as p
       RIGHT JOIN channel_content as cc on cc.id=p.cId
       where cc.id=?
       limit ?,?`;
      const result = await connection.execute(sql, [id, offset, limit]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  async getUserChannelService(userId, cId, offset, limit) {
    try {
      const sql = `
        select cc.id,cc.name,
			 (select JSON_OBJECT(
			   'id',cc.cId,'name',c.name,'createTime',c.createTime,'updateTime',c.updateTime
			 ) from channel as c where c.id=cc.cId) as channel,
       (select JSON_OBJECT('userId',cc.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			  FROM user as u where u.userId=cc.userId) as user,
			 coverUrl,cc.description,cc.createTime,cc.updateTime,
       JSON_ARRAYAGG(
			   JSON_OBJECT('id',p.id,'name',p.name,'playCount',p.playCount,
				             'createTime',p.createTime,'dt',p.dt)
			 ) AS programs
       from channel_content as cc
       left join program as p on p.cId=cc.id
       where cc.userId=? and cc.cId=?
       group by cc.id
       limit ?,?`;
      const result = await connection.execute(sql, [userId, cId, offset, limit]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //获取用户电台数据
  async getUserChannelCountService(userId) {
    try {
      const sql = `
        select cId as id,c.name,count(cId) as count,JSON_ARRAYAGG(
         JSON_OBJECT('id',cc.id,'name',cc.name)
            ) as channels
        from channel_content as cc
        LEFT JOIN channel as c on c.id=cc.cId
        where userId=?
        GROUP BY cc.cId`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //为电台添加播放量
  async addPlayCountService(id) {
    try {
      const sql = `select id,name,playCount,createTime
                    from program
                    where id=?`;
      const playCountMsg = await connection.execute(sql, [id]);
      const { playCount } = playCountMsg[0][0];
      const update = `update program set playCount=? where id=?`;
      const result = await connection.execute(update, [parseInt(playCount) + 1, id]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //获取热门电台
  async getHotChannelService() {
    try {
      const sql = `
            select cc.id,
            (select JSON_OBJECT('id',cc.cId,'name',c.name) from channel as c where c.id=cc.cId ) as channel,
			         cc.name,
            (select JSON_OBJECT('userId',cc.userId,'userName',u.userName,'avatarUrl',u.avatarUrl) from user as u
			          where u.userId=cc.userId) as user,
            coverUrl,description,cc.createTime,cc.updateTime,
            sum(p.playCount) as playCount
        from channel_content as cc
        left join program as p on cc.id=p.cId
        GROUP BY cc.id
        order by playCount desc
        limit 0,8`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  async getChannelHotContentService() {
    try {
      const cateSql = 'select id,name from channel';
      const channelCate = await connection.execute(cateSql);
      //return channelCate[0];
      const sql = `
      select c.id,c.name,
       JSON_OBJECT('id',cc.id,'name',cc.name,
		                     'user',(select JSON_OBJECT('userId',cc.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
												         from user as u where u.userId=cc.userId),
		                     'coverUrl',cc.coverUrl,'description',cc.description,
												 'createTime',cc.createTime,'updateTime',cc.updateTime) as channel,
			(select sum(p.playCount)
			 FROM program as p where p.cId=cc.id GROUP BY cc.id) as playCount
       from channel as c
       left join channel_content as cc on cc.cId=c.id
       where cc.id is not null and c.id=?
       ORDER BY playCount desc
       limit 0,4`;
      const res = [];
      if (channelCate[0].length !== 0) {
        for (let item of channelCate[0]) {
          const result = await connection.execute(sql, [item.id]);
          if (result[0].length !== 0) {
            const id = result[0][0].id;
            const name = result[0][0].name;
            result[0].forEach((it, index) => {
              delete it.playCount;
              delete it.id;
              delete it.name;
              result[0][index] = it.channel;
            });
            res.push({
              id: id,
              name: name,
              channels: result[0]
            });
          }
        }
        return res;
      }
    } catch (e) {
      throw e;
    }
  }
  async getProgramDetailService(id) {
    try {
      const sql = `
        select id,name,playCount,(select JSON_OBJECT('userId',p.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
                          from user as u where u.userId=p.userId) as user,
			 (select JSON_OBJECT(
			  'id',p.cId,'name',cc.name,'coverUrl',cc.coverUrl,'description',cc.description,
				'createTime',cc.createTime,'updateTime',cc.updateTime,
				'category',(select JSON_OBJECT('id',cc.cId,'name',c.name) from channel as c where c.id=cc.cId)
			 ) FROM channel_content AS cc where cc.id=p.cId) as channel,dt as duration
        from program as p
        where p.id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  async getProgramURLService(id) {
    try {
      const sql = `
        SELECT id,name,playCount,url
        from program
        where id=?
       `;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //获取电台收藏者
  async getChannelSubUserService(cId, offset, limit) {
    try {
      const sql = `
        select sub.userId,u.userName,u.avatarUrl
        from subscriber as sub
        INNER JOIN channel_content as cc on cc.id=sub.cId
        LEFT JOIN user as u on u.userId=sub.userId
        where cc.id=?
        limit ?,?`;
      const result = await connection.execute(sql, [cId, offset, limit]);
      const countSQL = `
        select count(sub.userId) as count
        from subscriber as sub
        INNER JOIN channel_content as cc on cc.id=sub.cId
        LEFT JOIN user as u on u.userId=sub.userId
        where cc.id=?`;
      const count = await connection.execute(countSQL, [cId]);
      return {
        count: count[0][0].count,
        user: result[0]
      };
    } catch (e) {
      console.log(e);
    }
  }
  //获取电台数据
  async getChannelDataService() {
    try {
      const sql = `
        select c.id,c.name,count(cc.id) as count
        from channel as c
        LEFT JOIN channel_content as cc on cc.cId=c.id
        GROUP BY c.id;`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //更新电台信息
  async updateChannelService(id, name, desc, cate) {
    try {
      const sql = `update channel_content as cc set name=?,description=?,cId=? where id=?`;
      const result = await connection.execute(sql, [name, desc, cate, id]);
      return result[0];
    } catch (e) {
      throw e;
    }
  }
  //获取电台文件信息
  async getChannelContentFileService(id) {
    try {
      const sql = `select originalname,mimetype,dest,filename,size from channel_content where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async deleteChannelContentService(id) {
    try {
      const sql = `delete from channel_content where id=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getUserProgramListService(userId) {
    try {
      const sql = `
        select p.id,p.name,p.playCount,
        JSON_OBJECT('id',c.id,'name',c.name,'coverUrl',c.coverUrl,
				            'user',
										(select JSON_OBJECT('userId',p.userId,'userName',u.userName,'avatarUrl',u.avatarUrl)
			               FROM user as u where u.userId=p.userId) ,
				            'description',c.description,'createTime',c.createTime,
										 'updateTime',c.updateTime,'channel',(
										  select JSON_OBJECT('id',c.cId,'name',ch.name)
											FROM channel as ch
											where ch.id=c.cId
										 )) as category,
              p.createTime,p.dt
        from program as p
        LEFT JOIN channel_content as c on c.id=p.cId
        where p.userId=?
        order by p.playCount*1 desc`;
      const result = await connection.execute(sql, [userId]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async deleteProgramService(id){
    try{
      const sql=`delete from program where id=?`;
      const res = await connection.execute(sql, [id]);
      return res[0];
    }catch (e){

    }
  }
  async getUserChannelDetailService(userId){
    const sql=`
    select cc.id,cc.name,coverUrl,cc.description,cc.createTime,cc.updateTime,
      JSON_OBJECT('userId',u.userId,'userName',u.userName,'avatarUrl',u.avatarUrl) as user,
      \t\t\t(select JSON_OBJECT('id',cc.cId,'name',c.name) from channel as c WHERE c.id = cc.cId) as channel
      from channel_content as cc
      LEFT JOIN user as u on u.userId = cc.userId
      where u.userId = ?`;
    const result = await connection.execute(sql,[userId]);
    return result[0];
  }
}
module.exports = new ChannelService();

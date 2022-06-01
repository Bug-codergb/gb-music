const connection = require('../app/database');
const { APP_PORT, APP_HOST } = require('../app/config');
class VerifyService {
  async createService(originalname, mimetype, destination, filename, size, innerId) {
    try {
      const id = new Date().getTime();
      const url = `${APP_HOST}:${APP_PORT}/verify/img?id=${id}`;
      const sql = `
               insert into verifyimg(outId,picUrl,originalname,mimetype,
                                     dest,filename,size${
                                       innerId ? ',innerId' : ''
                                     }) values(?,?,?,?,?,?,?${innerId ? ',?' : ''})`;
      let result = [];
      if (!innerId) {
        result = await connection.execute(sql, [
          id,
          url,
          originalname,
          mimetype,
          destination,
          filename,
          size
        ]);
      } else {
        result = await connection.execute(sql, [
          id,
          url,
          originalname,
          mimetype,
          destination,
          filename,
          size,
          innerId
        ]);
      }
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getVerifyImgService(id) {
    try {
      const sql = `
        select outId,picUrl,originalname,mimetype,dest,filename,size,innerId from verifyimg where outId=?`;
      const result = await connection.execute(sql, [id]);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
  async getAllVerifyImgService() {
    try {
      const sql = `
        select outV.outId,outV.picUrl as outPicUrl,innerV.outId as innerId,innerV.picUrl as innerPicUrl,innerV.scale
        from verifyimg as outV
        INNER JOIN verifyimg as innerV on outV.outId=innerV.innerId`;
      const result = await connection.execute(sql);
      return result[0];
    } catch (e) {
      console.log(e);
    }
  }
}
module.exports = new VerifyService();

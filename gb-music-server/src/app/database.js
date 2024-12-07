const mysql = require('mysql2');
const {
  DATABASE_HOST,
  DATABASE_NAME,
  DATABASE_USER,
  DATABASE_PORT,
  PASSWORD
} = require('./config');
const connection = mysql.createPool({
  host: DATABASE_HOST,
  database: DATABASE_NAME,
  user: DATABASE_USER,
  port: DATABASE_PORT,
  password: PASSWORD
});
connection.getConnection((err, connect) => {
  if(!err){
    connect.connect((err) => {
      if (err) {
        console.log('MySQL 连接失败');
      } else {
        console.log('MySQL 连接成功');
      }
    });
  }else{
    console.log(err);
  }

});
let initSQL=` SET @@GLOBAL.sql_mode="STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION";`
let rawInitSQL = `SET sql_mode="STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION";`;
module.exports = connection.promise();

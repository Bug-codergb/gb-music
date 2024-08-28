const path = require('path');
const fs = require('fs');

const ALIPAY_PUBLIC_KEY = fs.readFileSync(path.resolve(__dirname, './alipay/public.txt'), 'utf-8');
const ALIPAY_PRIVATE_KEY = fs.readFileSync(
  path.resolve(__dirname, './alipay/private.txt'),
  'utf-8'
);

const ALIPAY_APPLY_PUBLIC_KEY = fs.readFileSync(
  path.resolve(__dirname, './alipay/alipay_public.txt'),
  'utf-8'
);

const PRIVATE_KEY = fs.readFileSync(path.resolve(__dirname, './key/private.key'));
const PUBLIC_KEY = fs.readFileSync(path.resolve(__dirname, './key/public.key'));

const MEDIA_PUBLIC_KEY = fs.readFileSync(path.resolve(__dirname, './media/public.key'));
const MEDIA_PRIVATE_KEY = fs.readFileSync(path.resolve(__dirname, './media/private.key'));
//服务
const APP_PORT = 8200;
const APP_HOST = 'http://localhost';
//redis
const REDIS_URL = 'redis://127.0.0.1:6379';
//mySQL数据库
const DATABASE_HOST = 'localhost';
const DATABASE_NAME = 'cloud-music';
const DATABASE_USER = 'root';
const DATABASE_PORT = '3306';
const PASSWORD = 'guobin250520';
//前端
const WEBFONT_HOST = 'http://localhost';
const WEBFONT_PORT = 3000;
const WS_PORT = 8201;

module.exports = {
  ALIPAY_PRIVATE_KEY,
  ALIPAY_PUBLIC_KEY,
  ALIPAY_APPLY_PUBLIC_KEY,
  PRIVATE_KEY,
  PUBLIC_KEY,
  APP_PORT,
  APP_HOST,
  MEDIA_PUBLIC_KEY,
  MEDIA_PRIVATE_KEY,
  REDIS_URL,

  DATABASE_HOST,
  DATABASE_NAME,
  DATABASE_USER,
  DATABASE_PORT,
  PASSWORD,

  WEBFONT_HOST,
  WEBFONT_PORT,

  WS_PORT
};

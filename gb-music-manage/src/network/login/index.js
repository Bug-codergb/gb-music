import request from '../request';
//注册
export function register(userName, password) {
  return request({
    url: '/register',
    method: 'post',
    data: {
      userName,
      password
    }
  });
}
//登录
export function login(userName, password) {
  return request({
    url: '/login',
    method: 'post',
    data: {
      userName,
      password
    }
  });
}

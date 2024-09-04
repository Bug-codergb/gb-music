import request from '../request';
//登录
export function login(userName: string, password: string) {
  return request({
    url: '/login',
    method: 'post',
    data: {
      userName,
      password
    }
  });
}
//注册
export function register(userName: string, password: string) {
  return request({
    url: '/register',
    method: 'post',
    data: {
      userName,
      password
    }
  });
}

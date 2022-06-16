import request from '../request';
export function getAllVerifyImg() {
  return request({
    url: '/verify/img/cover'
  });
}

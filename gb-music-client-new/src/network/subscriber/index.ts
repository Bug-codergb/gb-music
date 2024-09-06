import request from '../request';
import store from '../../store';
//收藏
export function sub(id: string, key: string) {
  return request({
    url: '/sub',
    method: 'post',
    headers: {
    },
    data: {
      [key]: id
    }
  });
}
//取消收藏
export function cancelSub(id: string, key: string) {
  return request({
    url: '/sub/cancel',
    method: 'post',
    headers: {
    },
    data: {
      [key]: id
    }
  });
}

import request from '../request';
import store from '../../store';
//获取全部评论
export function getUserAllComment(offset: number, limit: number) {
  return request({
    url: '/user/comment/all',
    method: 'post',
    params: {
      offset,
      limit
    },
    headers: {
    }
  });
}

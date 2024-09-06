import request from '../request';
import store from '../../store';
export function getUserFans(offset: number, limit: number) {
  return request({
    url: '/user/fans',
    method: 'post',
    headers: {

    },
    params: {
      offset,
      limit
    }
  });
}

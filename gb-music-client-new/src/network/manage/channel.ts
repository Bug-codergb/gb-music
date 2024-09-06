import request from '../request';
import store from '../../store';
export function getProgramList(offset: number, limit: number) {
  return request({
    url: '/user/program/list',
    method: 'post',
    headers: {

    },
    params: {
      offset,
      limit
    }
  });
}

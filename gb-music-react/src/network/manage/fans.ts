import request from '../request';
import store from '../../store';
export function getUserFans(offset: number, limit: number) {
  return request({
    url: '/user/fans',
    method: 'post',
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    },
    params: {
      offset,
      limit
    }
  });
}

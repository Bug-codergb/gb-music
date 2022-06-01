import request from '../request';
import store from '../../store';
//关注用户
export function payUser(upId: string) {
  return request({
    url: '/fans',
    method: 'post',
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    },
    data: {
      upId
    }
  });
}

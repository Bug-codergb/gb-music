import request from '../request';
import store from '../../store';
//点赞
export function thumb(key: string, id: string) {
  return request({
    url: '/thumb',
    method: 'post',
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    },
    data: {
      [key]: id
    }
  });
}
//取消点赞
export function cancelThumb(key: string, id: string) {
  return request({
    url: '/thumb/cancel',
    method: 'post',
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    },
    data: {
      [key]: id
    }
  });
}

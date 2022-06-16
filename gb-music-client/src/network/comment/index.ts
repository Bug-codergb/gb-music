import request from '../request';
import store from '../../store';

//发表评论
export function publishComment(content: string, key: string, id: string) {
  return request({
    url: '/comment',
    method: 'post',
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    },
    data: {
      content,
      [key]: id
    }
  });
}
//回复评论
export function replyComment(id: string, content: string) {
  return request({
    url: '/comment/reply',
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    },
    method: 'post',
    data: {
      content,
      id
    }
  });
}
//获取歌单评论
export function getAllComment<T>(id: string, key: string, offset: number, limit: number) {
  return request<T>({
    url: '/comment/all',
    params: {
      [key]: id,
      offset,
      limit
    }
  });
}
//删除评论
export function deleteComment(id: string) {
  return request({
    url: '/comment/delete',
    method: 'post',
    data: {
      id
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}

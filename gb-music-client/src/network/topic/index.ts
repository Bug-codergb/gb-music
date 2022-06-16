import request from '../request';
import store from '../../store';
//添加话题
export function createTopic(name: string, description: string) {
  return request({
    url: '/topic',
    method: 'post',
    data: {
      name,
      description
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//上传专题封面
export function uploadCover(id: string, formData: FormData) {
  return request({
    url: '/topic/upload/cover',
    method: 'post',
    params: {
      id
    },
    data: formData,
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token,
      'Content-Type': 'multipart/from-data'
    }
  });
}
//获取热门话题
export function getHotTopic<T>() {
  return request<T>({
    url: '/topic/hot'
  });
}
//获取话题详情
export function getTopicDetail<T>(id: string, offset: string, limit: string) {
  return request<T>({
    url: '/topic/detail',
    params: {
      id,
      offset,
      limit
    }
  });
}
//获取全部话题
export function getAllTopic() {
  return request({
    url: '/topic/all'
  });
}

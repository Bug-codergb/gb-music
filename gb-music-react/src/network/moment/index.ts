import request from '../request';
import store from '../../store';
//获取搜索歌曲
export function getSearchSong(keyword: string) {
  return request({
    url: '/moment/search/song',
    params: {
      keyword
    }
  });
}
//添加动态
export function addMoment(content: string, songId: string, tId: string) {
  return request({
    url: '/moment',
    method: 'post',
    data: {
      content,
      songId,
      tId
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//上传动态图片
export function uploadMomentPic(id: string, formData: FormData) {
  return request({
    url: '/moment/upload/picture',
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
//获取所有动态
export function getAllMoment<T>(offset: number, limit: number) {
  return request<T>({
    url: '/moment/all',
    params: {
      offset,
      limit
    }
  });
}
//删除动态
export function delMoment(id: string) {
  return request({
    url: '/moment/delete',
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

//获取热门动态
export function getHotMoment() {
  return request({
    url: '/moment/hot'
  });
}

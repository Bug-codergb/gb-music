import request from '../request';
import store from '../../store';
//获取视频分类
export function getVideoCate<T>(type: number) {
  return request<T>({
    url: '/video/cate/all',
    params: {
      type
    }
  });
}
//获取分类下视频
export function getCateVideo<T>(cateId: string, type: number, offset: string, limit: string) {
  return request<T>({
    url: '/video/cate/detail',
    params: {
      cateId,
      type,
      offset,
      limit
    }
  });
}
//获取视频播放地址
export function getVideoURL(id: string) {
  return request({
    url: '/video/url',
    params: {
      vid: id
    }
  });
}
//获取视频详情
export function getVideoDetail<T>(id: string) {
  return request<T>({
    url: '/video/detail',
    params: {
      id
    }
  });
}
//获取相似视频
export function getSimiVideo(id: string) {
  return request({
    url: '/video/similar',
    params: {
      id
    }
  });
}
//添加视频播放量
export function updatePlayCount(id: string) {
  return request({
    url: '/video/playCount',
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
//添加视频
export function addVideo(name: string, desc: string, type: number, cateId: string, songId: string | undefined) {
  return request({
    url: '/video',
    method: 'post',
    data: {
      name,
      desc,
      type,
      cateId,
      songId
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//上传视频
export function uploadVideo(formData: FormData, vid: string) {
  return request({
    url: '/video/upload',
    method: 'post',
    data: formData,
    params: {
      vid
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token,
      'Content-type': 'multipart/form-data'
    }
  });
}
//上传视频封面
export function uploadCover(formData: FormData, vid: string) {
  return request({
    url: '/video/cover/upload',
    method: 'post',
    data: formData,
    params: {
      id: vid
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token,
      'Content-type': 'multipart/form-data'
    }
  });
}
//删除视频
export function deleteVideo(id: string) {
  return request({
    url: '/video/delete',
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
//推荐视频
export function recommendVideo<T>() {
  return request<T>({
    url: '/video/recommend',
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}

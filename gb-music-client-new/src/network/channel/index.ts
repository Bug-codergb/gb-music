import request from '../request';
import store from '../../store';
//获取所有频道
export function getAllChannel() {
  return request({
    url: '/channel/all'
  });
}
//获取频道下内容
export function getContent(id: string, offset: number, limit: number) {
  return request({
    url: '/channel/content',
    params: {
      id,
      offset,
      limit
    }
  });
}
//获取频道详情
export function getChannelDetail(id: string, offset: number, limit: number) {
  return request({
    url: '/channel/detail',
    params: {
      id,
      offset,
      limit
    }
  });
}
//添加频道内容
export function addContent(cId: string, name: string, description: string) {
  return request({
    url: '/channel/content/add',
    method: 'post',
    data: {
      cId,
      name,
      description
    },
    headers: {

    }
  });
}
//上传频道内容图片
export function uploadContentCover(formData: FormData) {
  return request({
    url: '/channel/content/upload',
    data: formData,
    method: 'post',
    headers: {
      'Content-type': 'multipart/form-data',
    }
  });
}
//获取用户电台数据
export function getUserChannelCount(userId: string) {
  return request({
    url: '/channel/count',
    params: {
      userId
    }
  });
}
//获取用户电台
export function getUserChannel(userId: string, cId: string, offset: number, limit: number) {
  return request({
    url: '/channel/user',
    params: {
      userId,
      cId,
      offset,
      limit
    }
  });
}
//添加节目
export function addProgram(name: string, cId: string) {
  return request({
    url: '/channel/program',
    method: 'post',
    data: {
      name,
      cId
    },
    headers: {
    }
  });
}
//上传节目
export function addProgramSource(id: string, formData: FormData) {
  return request({
    url: '/channel/program/source',
    method: 'post',
    params: {
      id
    },
    data: formData,
    headers: {
      'Content-type': 'multipart/form-data',
    }
  });
}
//为节目添加播放量
export function addProgramPlayCount(id: string) {
  return request({
    url: '/channel/playCount',
    method: 'post',
    data: {
      id
    },
    headers: {
    }
  });
}
//获取热门电台
export function getHotChannel<T>() {
  return request<T>({
    url: '/channel/hot'
  });
}
//获取热门电台内容(电台页)
export function getHotChannelContent() {
  return request({
    url: '/channel/content/hot'
  });
}

//获取节目详情(播放)
export function getProgramDetail(id: string) {
  return request({
    url: '/channel/program/detail',
    params: {
      id
    }
  });
}
//获取节目URL
export function getProgramURL(id: string) {
  return request({
    url: '/channel/program/url',
    params: {
      id
    }
  });
}
//获取电台收藏者
export function getChannelSubUser(cId: string, offset: number, limit: number) {
  return request({
    url: '/channel/sub/user',
    params: {
      cId,
      offset,
      limit
    }
  });
}
//获取用户播单
export function getUserChannelPlaylist<T>() {
  return request<T>({
    url: '/channel/program/list',
    method: 'post',
    data: {},
    headers: {
    }
  });
}

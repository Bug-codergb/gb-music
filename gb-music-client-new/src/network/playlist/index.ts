import request from '../request';
import store from '../../store/index';
//创建歌单
export function createPlayList(name: string, desc: string) {
  return request({
    url: '/playlist',
    method: 'post',
    headers: {
    },
    data: {
      name,
      desc
    }
  });
}
//上传歌单封面
export function uploadPlayCover(formData: FormData, pId: string) {
  return request({
    url: '/playlist/cover',
    method: 'post',
    headers: {

    },
    params: {
      pId
    },
    data: formData
  });
}
//获取用户歌单
export function getUserPlaylist(userId: string, offset: number = 0, limit: number = 30) {
  return request({
    url: '/playlist/user',
    params: {
      userId,
      offset,
      limit
    }
  });
}
//获取推荐歌单
export function getRecPlaylist<T>(offset: number = 0, limit: number = 30) {
  return request<T>({
    url: '/playlist/recommend',
    params: {
      offset,
      limit
    }
  });
}
//为歌单添加歌曲
export function addSongToPlay(pId: string, songId: string) {
  return request({
    url: '/playlist/song',
    method: 'post',
    data: {
      pId,
      songId
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//获取歌单详情
export function getPlaylistDetail<T>(pId: string) {
  return request<T>({
    url: '/playlist/detail',
    params: {
      id: pId
    }
  });
}
//获取所有歌单分类
export function getAllCate<T>(offset: number = 0, limit: number = 30) {
  return request<T>({
    url: '/playlist/cate',
    params: {
      offset,
      limit
    }
  });
}
//获取分类下歌单
export function getCatePlaylist<T>(cateId: string, offset: number, limit: number) {
  return request<T>({
    url: '/playlist/cate/detail',
    params: {
      cateId,
      offset,
      limit
    }
  });
}
//获取歌单收藏者
export function getPlaylistSub(id: string, offset: number, limit: number) {
  return request({
    url: '/playlist/sub/user',
    params: {
      id,
      offset,
      limit
    }
  });
}
//为歌单添加播放量
export function addPlayCount(id: string) {
  return request({
    url: '/playlist/playCount/add',
    method: 'post',
    data: {
      id
    },
    headers: {

    }
  });
}
//包含这首歌的歌单
export function getIncludePlaylist(id: string) {
  return request({
    url: '/playlist/song/include',
    params: {
      id
    }
  });
}
//获取热门歌单
export function getHotPlaylist() {
  return request({
    url: '/playlist/hot'
  });
}

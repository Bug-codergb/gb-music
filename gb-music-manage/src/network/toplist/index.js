import request from '../request';
import store from '@/store';
//添加榜单
export function addToplist(name, desc) {
  return request({
    url: '/toplist',
    method: 'post',
    data: {
      name,
      desc
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//添加榜单封面
export function uploadCover(formData, tId) {
  return request({
    url: '/toplist/upload',
    method: 'post',
    data: formData,
    params: {
      tId
    },
    headers: {
      authorization: store.state.userMsg.token,
      'Content-type': 'multipart/form-data'
    }
  });
}
//获取官方榜单
export function getOfficialTop() {
  return request({
    url: '/toplist/official '
  });
}
//获取其它榜单
export function getHotToplist() {
  return request({
    url: '/toplist/hot'
  });
}
//将歌曲加入排行榜
export function addSongToTop(tId, songId) {
  return request({
    url: '/toplist/song',
    method: 'post',
    data: {
      tId,
      songId
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取榜单详情
export function getToplistDetail(id) {
  return request({
    url: '/toplist/detail',
    params: {
      id
    }
  });
}
//移除排行榜中的歌曲
export function removeSong(tId, sId) {
  return request({
    url: '/toplist/song/remove',
    method: 'post',
    data: {
      tId,
      sId
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}

//刷新飙升榜
export function refreshRank() {
  return request({
    url: '/toplist/export',
    method: 'post'
  });
}
//删除排行榜
export function deleteToplist(id) {
  return request({
    url: '/toplist/delete',
    method: 'post',
    data: {
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}

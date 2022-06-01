import request from '../request';
import store from '../../store';
export function addSong(name, arId, alId, publishTime, alia) {
  return request({
    url: '/song',
    data: {
      name,
      arId,
      alId,
      publishTime,
      alia
    },
    method: 'post',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//上传歌曲
export function uploadSong(formData, songId) {
  return request({
    url: '/song/upload',
    params: {
      songId
    },
    data: formData,
    method: 'post',
    headers: {
      authorization: store.state.userMsg.token,
      'Content-type': 'multipart/form-data'
    }
  });
}
//获取所有歌曲
export function getAllSong(offset = 0, limit = 30, keyword) {
  return request({
    url: '/song/all',
    params: {
      offset,
      limit,
      keyword
    }
  });
}
//上传歌曲歌词
export function uploadLyric(songId, lyric) {
  return request({
    url: '/song/lyric',
    method: 'post',
    data: {
      id: songId,
      lyric
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//更新歌曲vip信息
export function updateSongVip(id, vip) {
  return request({
    url: '/song/vip/update',
    method: 'post',
    data: {
      vip,
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//删除歌曲
export function deleteSong(id) {
  return request({
    url: '/song/delete',
    method: 'post',
    data: {
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取歌手mv
export function getArtistMV(id) {
  return request({
    url: '/artist/mv',
    params: {
      id
    }
  });
}
//获取歌词
export function getLyric(id) {
  return request({
    url: '/song/lyric',
    params: {
      id
    }
  });
}
//更新歌曲信息
export function updateSong(id, name, alia, publishTime, vip, lyric) {
  return request({
    url: '/song/update',
    method: 'post',
    data: {
      id,
      name,
      alia,
      publishTime,
      vip,
      lyric
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}

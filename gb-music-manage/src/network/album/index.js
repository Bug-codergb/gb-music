import request from '../request';
import store from '../../store';
//获取专辑分类
export function getAlbumCate() {
  return request({
    url: '/album/cate'
  });
}
//添加专辑分类
export function addAlbumCate(name) {
  return request({
    url: '/album/cate',
    data: {
      name
    },
    method: 'post',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//添加专辑
export function addAlbum(name, description, publishTime, arId, cateId) {
  return request({
    url: '/album',
    data: {
      name,
      description,
      publishTime,
      arId,
      cateId
    },
    method: 'post',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//上传专辑封面
export function uploadAlbumCover(formData, alId) {
  return request({
    url: '/album/upload/cover',
    data: formData,
    method: 'post',
    params: {
      id: alId
    },
    headers: {
      'Content-type': 'multipart/form-data',
      authorization: store.state.userMsg.token
    }
  });
}
//获取全部专辑
export function getAllAlbum(offset = 0, limit = 30) {
  return request({
    url: '/album/all',
    params: {
      offset,
      limit
    }
  });
}
//获取专辑详情
export function getAlbumDetail(albumId) {
  return request({
    url: '/album/detail',
    params: {
      albumId
    }
  });
}
//获取分类下专辑
export function getCateAlbum(cateId, keyword, offset, limit) {
  return request({
    url: '/album/cate/detail',
    params: {
      id: cateId,
      offset,
      limit,
      keyword
    }
  });
}
//删除专辑
export function delAlbum(id) {
  return request({
    url: '/album/delete',
    data: {
      id
    },
    method: 'post',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//删除专辑下歌曲
export function delAlbumSong(songId, alId) {
  return request({
    url: '/album/song/delete',
    method: 'post',
    headers: {
      authorization: store.state.userMsg.token
    },
    data: {
      songId,
      alId
    }
  });
}
//获取专辑data
export function getAlbumData() {
  return request({
    url: '/album/data'
  });
}
//更新专辑
export function updateAlbum(alId, name, desc, publishTime) {
  return request({
    url: '/album/update',
    method: 'post',
    data: {
      alId,
      name,
      desc,
      publishTime
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//删除专辑分类
export function delAlbumCate(id){
  return request({
    url:"/album/cate/delete",
    method:"post",
    data:{
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  })
}

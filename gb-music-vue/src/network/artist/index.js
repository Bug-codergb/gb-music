import request from '../request';
import store from '../../store';
//获取歌手分类
export function getArtistCate() {
  return request({
    url: '/artist/cate'
  });
}
//添加歌手
export function addArtist(name, desc, area) {
  return request({
    url: '/artist',
    method: 'post',
    data: {
      name,
      desc,
      area
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//上传歌手头像
export function uploadArtistAvatar(arId, formData) {
  return request({
    url: '/artist/upload/avatar',
    params: {
      arId
    },
    method: 'post',
    data: formData,
    headers: {
      'Content-type': 'multipart/form-data',
      authorization: store.state.userMsg.token
    }
  });
}
//获取所有歌手
export function getAllArtist(offset = 0, limit = 30) {
  return request({
    url: '/artist',
    params: {
      offset,
      limit
    }
  });
}
//获取分类下歌手
export function getCateArtistDetail(area, letter = '全部', keyword, offset = 0, limit = 8) {
  return request({
    url: '/artist/cate/detail',
    params: {
      area,
      keyword,
      letter,
      offset,
      limit
    }
  });
}
//删除歌手
export function delArtist(id) {
  return request({
    url: '/artist/delete',
    method: 'post',
    data: {
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取歌手type
export function getArtistType() {
  return request({
    url: '/artist/type'
  });
}
//设置歌手type
export function setArtistType(arId, type) {
  return request({
    url: '/artist/type/set',
    method: 'post',
    data: {
      arId,
      type
    }
  });
}
//设置歌手cate
export function setArtistCate(arId, cateId) {
  return request({
    url: '/artist/cate/set',
    method: 'post',
    data: {
      arId,
      cateId
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取歌手详情
export function getArtistDetail(id) {
  return request({
    url: '/artist/detail',
    params: {
      id
    }
  });
}
//获取歌手专辑
export function getArtistAlbum(id, offset, limit) {
  return request({
    url: '/artist/album',
    params: {
      arId: id,
      offset,
      limit
    }
  });
}
//获取歌手歌曲
export function getArtistSong(id, offset, limit) {
  return request({
    url: '/artist/song',
    params: {
      id,
      offset,
      limit
    }
  });
}
//添加歌手cate
export function addArtistCate(name) {
  return request({
    url: '/artist/cate',
    method: 'post',
    data: {
      name
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//添加歌手type
export function addArtistType(name) {
  return request({
    url: '/artist/type',
    method: 'post',
    data: {
      name
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//更新歌手信息
export function updateArtist(arId, name, desc) {
  return request({
    url: '/artist/update',
    method: 'post',
    data: {
      arId,
      name,
      desc
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取歌手数据
export function getArtistData() {
  return request({
    url: '/artist/data',
    method: 'get',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//删除歌手cate
export function deleteArtistCate(id){
  return request({
    url:"/artist/cate/delete",
    method:"post",
    data:{
      cateId:id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  })
}
//删除歌手type
export function deleteArtistType(id){
  return request({
    url:"/artist/type/delete",
    method:"post",
    data:{
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  })
}

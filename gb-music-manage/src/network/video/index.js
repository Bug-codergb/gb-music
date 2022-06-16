import request from '../request';
import store from '../../store';
//获取视频分类
export function getVideoCate(type) {
  return request({
    url: '/video/cate/all',
    params: {
      type
    }
  });
}
//添加视频
export function addVideo(name, desc, type, cateId = 0, songId) {
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
      authorization: store.state.userMsg.token
    }
  });
}
//上传视频
export function uploadVideo(formData, vid) {
  return request({
    url: '/video/upload',
    method: 'post',
    data: formData,
    params: {
      vid
    },
    headers: {
      authorization: store.state.userMsg.token,
      'Content-type': 'multipart/form-data'
    }
  });
}
//上传视频封面
export function uploadCover(formData, vid) {
  return request({
    url: '/video/cover/upload',
    method: 'post',
    data: formData,
    params: {
      id: vid
    },
    headers: {
      authorization: store.state.userMsg.token,
      'Content-type': 'multipart/form-data'
    }
  });
}
//获取分类下视频
export function getCateVideo(cateId, type = 0, keyword, offset, limit) {
  return request({
    url: '/video/cate/detail',
    params: {
      cateId,
      type,
      offset,
      limit,
      keyword
    }
  });
}
//删除视频
export function delVideo(id) {
  return request({
    url: '/video/delete',
    method: 'post',
    data: {
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//添加视频分类
export function addVideoCate(type, name) {
  return request({
    url: '/video/cate',
    method: 'post',
    data: {
      type,
      name
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//更新视频信息
export function updateVideo(id, name, desc, cate) {
  return request({
    url: '/video/update',
    method: 'post',
    data: {
      id,
      name,
      desc,
      cate
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取视频数据
export function getVideoData() {
  return request({
    url: '/video/data',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取MV数据
export function getMVData() {
  return request({
    url: '/video/mv/data',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取视频详情
export function getVideoDetail(id){
  return request({
    url:"/video/detail",
    method:"get",
    params:{
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  })
}
//获取视频url
export function getVideoURL(id){
  return request({
    url:"/video/url",
    params:{
      vid:id
    }
  })
}
//删除视频分类
export function delVideoCate(id){
  return request({
    url:"/video/cate/delete",
    method:"post",
    data:{
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  })
}

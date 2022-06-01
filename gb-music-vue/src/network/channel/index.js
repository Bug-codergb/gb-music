import request from '../request';
import store from '@/store';
//获取所有频道
export function getAllChannel() {
  return request({
    url: '/channel/all'
  });
}
//删除频道
export function delChannel(id) {
  return request({
    url: '/channel/delete',
    method: 'post',
    data: {
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//创建频道
export function addChannel(formData) {
  return request({
    url: '/channel',
    method: 'post',
    data: formData,
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//上传频道内容
export function addContent(cId, name, description) {
  return request({
    url: '/channel/content/add',
    method: 'post',
    data: {
      cId,
      name,
      description
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//上传频道内容图片
export function uploadContentCover(formData) {
  return request({
    url: '/channel/content/upload',
    data: formData,
    method: 'post',
    headers: {
      'Content-type': 'multipart/form-data',
      authorization: store.state.userMsg.token
    }
  });
}
//获取频道下内容
export function getChannelContent(id, offset, limit) {
  return request({
    url: '/channel/content',
    params: {
      id,
      offset,
      limit
    }
  });
}
//获取电台数据
export function getChannelData() {
  return request({
    url: '/channel/data',
    method: 'get',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//更新电台信息
export function updateChannel(id, name, desc, cate) {
  return request({
    url: '/channel/content/update',
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
//删除电台信息
export function deleteChannel(id) {
  return request({
    url: '/channel/content/delete',
    method: 'post',
    data: {
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}

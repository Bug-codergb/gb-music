import request from '../request';
import store from '@/store';
export function getAllBanner() {
  return request({
    url: '/banner/recommend'
  });
}
//添加banner
export function addBanner(key, id) {
  return request({
    url: '/banner',
    data: {
      [key]: id
    },
    method: 'post',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//上传banner图片
export function uploadBanner(formData, key, id) {
  console.log(formData);
  return request({
    url: '/banner/img',
    method: 'post',
    data: formData,
    params: {
      [key]: id
    },
    headers: {
      'Content-type': 'multipart/form-data',
      authorization: store.state.userMsg.token
    }
  });
}
//获取banner list
export function getBannerList() {
  return request({
    url: '/banner/list'
  });
}
//删除banner
export function deleteBanner(id) {
  return request({
    url: '/banner/delete',
    method: 'post',
    data: {
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}

import request from '../request';
import store from '../../store';
//获取视频数据
export function getVioData() {
  return request({
    url: '/user/data/video',
    method: 'post',
    headers: {

    }
  });
}
//获取视频列表
export function getUserVioList(offset: number, limit: number) {
  return request({
    url: '/user/video/list',
    method: 'post',
    headers: {

    },
    params: {
      offset,
      limit
    }
  });
}
//获取视频管理 视频列表
export function getManageVio(offset: number, limit: number) {
  return request({
    url: '/user/manage/video',
    method: 'post',
    headers: {

    },
    params: {
      offset,
      limit
    }
  });
}

import request from '../request';
import store from '../../store';
//获取所有vip价格类型
export function getAllCombo() {
  return request({
    url: '/combo/all',
    method: 'get',
    headers: {
    }
  });
}
//开通VIP
export function joinVIP(cId: string, name: string, orderId: string) {
  return request({
    url: '/pay/join',
    method: 'post',
    data: {
      name,
      cId,
      orderId
    },
    headers: {
    }
  });
}
//获取vip信息
export function getVipMessage() {
  return request({
    url: '/vip',
    headers: {
    }
  });
}
//获取VIP历史信息
export function getVipHistory() {
  return request({
    url: '/vip/history',
    method: 'post',
    headers: {

    }
  });
}
//删除VIP历史记录
export function deleteVIPHistory(id: string) {
  return request({
    url: '/vip/history/delete',
    method: 'post',
    data: {
      id
    },
    headers: {

    }
  });
}

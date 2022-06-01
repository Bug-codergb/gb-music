import request from '@/network/request';
import store from '@/store';
//获取VIP订单信息
export function getVipOrderData() {
  return request({
    url: '/vip/order/data',
    method: 'get',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}

import request from '../request';
import store from '../../store';
export function payMoney(price: number, name: string, comboId: string) {
  return request({
    url: '/pay',
    method: 'post',
    data: {
      price,
      name,
      cId: comboId
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//订单状态查询
export function queryOrderAlipay(orderId: string) {
  return request({
    url: '/pay/query',
    method: 'post',
    data: {
      orderId
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//订单状态查询
export function closeOrderAlipay(orderId: string) {
  return request({
    url: '/pay/close',
    method: 'post',
    data: {
      orderId
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}

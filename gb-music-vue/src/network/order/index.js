import request from "@/network/request";
import store from "@/store";
//获取所有订单
export function getAllOrder(order,status,offset,limit){
  return request({
    url:"/order/all",
    method:"post",
    data:{
      order,
      status,
      offset:`${offset}`,
      limit:`${limit}`
    },
    headers:{
      authorization: store.state.userMsg.token
    }
  })
}
export function getAllCombo(){
  return request({
    url:"/combo/all",
    headers:{
      authorization: store.state.userMsg.token
    }
  })
}

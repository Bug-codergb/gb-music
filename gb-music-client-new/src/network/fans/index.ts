import request from '../request';
import store from '../../store';
//关注用户
export function payUser(upId: string) {
  return request({
    url: '/fans',
    method: 'post',
    headers: {
    },
    data: {
      upId
    }
  });
}

export function cancelPayUser(userId:string,upId:string){
  return request({
    url:"/fans/cancel",
    method:"post",
    data:{
      userId,
      upId
    }
  })
}
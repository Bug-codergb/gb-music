import request from '../request';
//获取官方榜单
export function getOfficial<T>() {
  return request<T>({
    url: '/toplist/official'
  });
}
//获取其他榜单
export function getHotToplist() {
  return request({
    url: '/toplist/hot'
  });
}
//获取榜单详情
export function getToplistDetail<T>(id: string) {
  return request<T>({
    url: '/toplist/detail',
    params: {
      id
    }
  });
}
//导入
export function exportToplist() {
  return request({
    url: '/toplist/export',
    method: 'post'
  });
}
//获取相关榜单
export function getSimiToplist() {
  return request({
    url: '/toplist/simi'
  });
}
//添加排行榜播放量
export function addToplistPlayCount(id:string){
  return request({
    url:"/toplist/playCount/add",
    method:"post",
    data:{
      id
    },
  })
}

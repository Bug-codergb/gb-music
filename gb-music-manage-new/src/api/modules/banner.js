import http from "../index"
export function getBannerListApi(data){
  return http.get("/banner/list",data)
}

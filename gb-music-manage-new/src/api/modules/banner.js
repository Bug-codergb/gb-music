import http from "../index"
export function getBannerListApi(data){
  return http.get("/banner/list",data)
}
export function addBannerApi(key,id){
  return http.post("/banner",{
    [key]:id
  })
}
export function uploadBannerApi(formData,key,id){
  return http.post("/banner/img",formData,{
    params:{
      [key]:id
    }
  })
}
export function deleteBannerApi(data){
  return http.post("/banner/delete",data);
}

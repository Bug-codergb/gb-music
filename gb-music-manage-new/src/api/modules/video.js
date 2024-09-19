import http from "@/api/index";
//视频
export function getVideoListApi(data) {
  return http.get("/video/cate/detail", data);
}
//视频分类
export function getVideoCateApi(data) {
  return http.get("/video/cate/all", data);
}
export function createVideoCateApi(data){
  return http.post("/video/cate",data);
}
export function deleteVideoCateApi(data){
  return http.post("/video/cate/delete",data);
}

export function createVideoApi(data){
  return http.post("/video",data);
}
export function updateVideoSourceApi(id,data){
  return http.post(`/video/upload?vid=${id}`,data)
}
export function updateVideoCoverApi(id,data){
  return http.post(`/video/cover/upload?id=${id}`,data)
}
//获取mv
export function getMVListApi(params){
  return http.get("/video/cate/all",params);
}
//添加歌曲mv
export function addSongMVApi(data){
  return http.post("/video",data);
}

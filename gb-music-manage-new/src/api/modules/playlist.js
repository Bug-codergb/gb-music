import http from "@/api";
export function getAllPlaylistApi(params){
  return http.get("/playlist/all",params);
}
export function getPlaylistCateApi(params){
  return http.get("/playlist/cate",params);
}
export function batchSetPlaylistCateApi(params){
  return http.post("/playlist/cate/set/batch",params);
}
export function deletePlaylistCateApi(data){
  return http.post("/playlist/cate/delete",data);
}
export function createPlaylistCateApi(data){
  return http.post("/playlist/cate",data);
}
export function getPlaylistDataApi() {
  return http.get('/playlist/data');
}
export function deletePlaylistApi(data){
  return http.post("/playlist/delete",data);
}

export function createPlaylistApi(data){
  return http.post("/playlist",data);
}
export function uploadPlaylistCoverApi(id,data){
  return http.post(`/playlist/cover?pId=${id}`,data);
}
export function updatePlaylistApi(data){
  return http.post("/playlist/update",data);
}

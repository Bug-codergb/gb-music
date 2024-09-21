import http from "@/api/index"
//专辑分类
export function getAlbumTypeListApi(data) {
  return http.get("/album/cate", data);
}
export function deleteAlbumTypeApi(data) {
  return http.post("/album/cate/delete", data);
}
export function addAlbumTypeApi(data) {
  return http.post("/album/cate", data);
}

//专辑
export function getAlbumListApi(params) {
  return http.get("/album/cate/detail",params)
}
export function addAlbumApi(params) {
  return http.post("/album", params);
}
export function uploadAlbumAvatarApi(id,params) {
  return http.post(`/album/upload/cover?id=${id}`, params);
}
//删除专辑
export function deleteAlbumApi(data) {
  return http.post("/album/delete", data);
}
export function getAlbumDataApi() {
  return http.get('/album/data');
}

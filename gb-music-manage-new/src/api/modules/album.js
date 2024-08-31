import http from "@/api/index"
//专辑分类
export function getAlbumTypeListApi(data) {
  return http.get("/album/cate", data);
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
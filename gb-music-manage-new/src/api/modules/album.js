import http from "@/api/index"
//专辑分类
export function getAlbumTypeList(data) {
  return http.get("/album/cate", data);
}
//专辑
export function getAlbumList(params) {
  return http.get("/album/cate/detail",params)
}
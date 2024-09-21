import http from "@/api/index";
//语种
export function getArtistLangApi() {
  return http.get("/artist/cate")
}
export function addArtistLangApi(data) {
  return http.post("/artist/cate", data);
}
export function deleteArtistLangApi(data) {
  return http.post("/artist/cate/delete", data);
}
//分类
export function getArtistTypeApi() {
  return http.get("/artist/type")
}
export function addArtistTypeApi(data) {
  return http.post("/artist/type", data);
}
export function deleteArtistTypeApi(data) {
  return http.post("/artist/type/delete", data);
}
//歌手
export function createArtistApi(data) {
  return http.post("/artist", data);
}
export function uploadArtistAvatarApi(id,formData) {
  return http.post(`/artist/upload/avatar?arId=${id}`,formData);
}
export function getArtistListApi(params) {
  return http.get("/artist/cate/detail", params);
}
export function deleteArtistApi(params) {
  return http.post("/artist/delete", params);
}
//type
export function setArtistLangApi(data){
  return http.post("/artist/cate/set",data);
}
export function setArtistTypeApi(data){
  return http.post("/artist/type/set",data);
}
export function getArtistDataApi() {
  return http.get('/artist/data');
}

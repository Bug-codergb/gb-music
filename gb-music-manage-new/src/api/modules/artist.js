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
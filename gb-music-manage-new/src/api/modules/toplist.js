import http from "@/api/index"
export function getHotToplistApi(params) {
  return http.get("/toplist/hot",params)
}
export function getOfficialToplistApi(params) {
  return http.get("/toplist/official", params);
}

//新建榜单
export function createToplistApi(data) {
  return http.post("/toplist", data);
}
export function uploadToplistCoverApi(id,data) {
  return http.post(`/toplist/upload?tId=${id}`, data);
}
export function deleteToplistApi(data) {
  return http.post("/toplist/delete", data);
}
export function updateToplistApi(data) {
  return http.post("/toplist/export", data);
}
export function getToplistDetailApi(data){
  return http.get("/toplist/detail", data);
}
export function getToplistTypeCount(data){
  return http.post("/toplist/type/count",data);
}

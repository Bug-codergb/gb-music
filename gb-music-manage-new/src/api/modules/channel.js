import http from "@/api/index";
export function getChannelListApi(data) {
  return http.get("/channel/all", data);
}
export function addChannelTypeApi(data) {
  return http.post("/channel", data);
}
export function deleteChannelTypeApi(data) {
  return http.post("/channel/delete", data);
}

export function getChannelDetaiApi(data) {
  return http.get("/channel/content", data);
}
export function addChannelDetailApi(data) {
  return http.post("/channel/content/add", data);
}
export function uploadChannelDetailApi(data) {
  return http.post("/channel/content/upload", data);
}
export function deleteChanneDetail(data) {
  return http.post("/channel/content/delete",data)
}
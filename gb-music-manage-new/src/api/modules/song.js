import http from "@/api/index";
export function getSongListApi(data) {
  return http.get("/song/all", data);
}
export function createSongApi(data){
  return http.post("/song",data);
}
export function uploadSongApi(id,data){
  return http.post(`/song/upload?songId=${id}`,data);
}

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
//获取歌手歌曲
export function getArtistSongApi(params){
  return http.get("/artist/song",params)
}
export function updateSongVipApi(data){
  return http.post("/song/vip/update",data);
}
export function updateSongApi(data){
  return http.post("/song/update",data)
}

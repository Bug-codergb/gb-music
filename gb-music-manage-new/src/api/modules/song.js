import http from "@/api/index";
export function getSongListApi(data) {
  return http.get("/song/all", data);
}
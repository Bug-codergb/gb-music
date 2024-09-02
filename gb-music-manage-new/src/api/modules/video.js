import http from "@/api/index";
//视频
export function getVideoListApi(data) {
  return http.get("/video/cate/detail", data);
}
//视频分类
export function getVideoCateApi(data) {
  return http.get("/video/cate/all", data);
}
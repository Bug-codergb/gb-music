import http from "@/api/index"
export function getUserListApi(data) {
  return http.post("/user/list", data);
}
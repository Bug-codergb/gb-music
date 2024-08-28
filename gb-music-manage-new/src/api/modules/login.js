import http from "@/api";
export function loginApi(data) {
  return http.post("/login", data);
}
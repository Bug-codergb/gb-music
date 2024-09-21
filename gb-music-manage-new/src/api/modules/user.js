import http from "@/api/index"
export function getUserListApi(data) {
  return http.post("/user/list", data);
}
export function getAllComboApi() {
  return http.get('/combo/all')
}
export function getVipOrderDataApi() {
  return http.get('/vip/order/data');
}
export function getSystemDataApi() {
  return http.post('/user/system/data')
}

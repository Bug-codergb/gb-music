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
export function createUserApi(data){
  return http.post("/user/add",data);
}
export function deleteUserApi(data){
  return http.post("/user/delete",data);
}

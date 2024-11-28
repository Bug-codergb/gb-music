import http from "@/api/index";
export function getAllComboApi(data){
  return http.get("/combo/all",data);
}
export function createComboApi(data){
  return http.post("/combo",data);
}
export function deleteComboApi(data){
  return http.post("/combo/delete",data);
}

import http from "@/api";
export function getOrderListApi(data) {
  return http.post("/order/all",data)
}

import http from "../index"
export function getSearchMatchApi(params){
  return http.get("/search",params)
}

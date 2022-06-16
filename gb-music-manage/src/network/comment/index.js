import request from "@/network/request";
export function getAllComment(id, key, offset, limit) {
  return request({
    url: '/comment/all',
    params: {
      [key]: id,
      offset,
      limit
    }
  });
}

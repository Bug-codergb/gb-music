import request from '../request';
export function getBanner<T>() {
  return request<T>({
    url: '/banner/recommend'
  });
}

import request from '@/network/request';
export function getSearchMatch(keyword) {
  return request({
    url: '/search',
    params: {
      keyword
    },
    timeout: 10000
  });
}

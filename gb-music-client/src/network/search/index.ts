import request from '../request';
//获取搜索匹配
export function getSearchMatch(keyword: string) {
  return request({
    url: '/search',
    params: {
      keyword
    }
  });
}

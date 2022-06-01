import request from '../../request';
//获取mv排行
export function getMvToplist<T>(cateId: string, offset: number, limit: number) {
  return request<T>({
    url: '/video/toplist',
    params: {
      cateId,
      offset,
      limit
    }
  });
}

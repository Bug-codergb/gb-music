import request from '../request';
//获取推荐歌手
export function getRecArtist<T>(offset: number = 0, limit: number = 30) {
  return request<T>({
    url: '/artist/recommend',
    params: {
      offset,
      limit
    }
  });
}
//获取歌手分类
export function getArtistCate<T>() {
  return request<T>({
    url: '/artist/cate'
  });
}
//获取分类下歌手
export function getCateArtist<T>(area: string, type: string, letter: string, offset: number = 0, limit: number = 30) {
  return request<T>({
    url: '/artist/cate/detail',
    params: {
      area,
      type,
      letter,
      offset,
      limit
    }
  });
}
//获取歌手详情
export function getArtistDetail<T>(id: string) {
  return request<T>({
    url: '/artist/detail',
    params: {
      id
    }
  });
}
//获取歌手MV
export function getArtistMV(id: string) {
  return request({
    url: '/artist/mv',
    params: {
      id
    }
  });
}
//获取相似歌手
export function getSimiArtist(area: string, offset: number, limit: number) {
  return request({
    url: '/artist/simi',
    params: {
      area,
      offset,
      limit
    }
  });
}
//获取歌手type
export function getArtistType<T>() {
  return request<T>({
    url: '/artist/type'
  });
}
//获取热门歌手
export function getHotArtist() {
  return request({
    url: '/artist/hot'
  });
}

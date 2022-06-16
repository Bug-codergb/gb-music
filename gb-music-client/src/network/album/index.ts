import request from '../request';
//获取推荐专辑
export function getRecAlbum<T>(offset: number = 0, limit: number = 30) {
  return request<T>({
    url: '/album/recommend',
    params: {
      offset,
      limit
    }
  });
}
//获取专辑详情
export function getAlbumDetail(albumId: string) {
  return request({
    url: '/album/detail',
    params: {
      albumId
    }
  });
}
//获取专辑分类
export function getAlbumCate<T>() {
  return request<T>({
    url: '/album/cate'
  });
}
//获取分类下专辑
export function getCateAlbumDetail<T>(id: string, offset: number, limit: number) {
  return request<T>({
    url: '/album/cate/detail',
    params: {
      id,
      offset,
      limit
    }
  });
}
//获取专辑收藏者
export function getAlbumSub(id: string, offset: number, limit: number) {
  return request({
    url: '/album/sub/user',
    params: {
      id,
      offset,
      limit
    }
  });
}
//获取热门专辑
export function getHotAlbum() {
  return request({
    url: '/album/hot'
  });
}

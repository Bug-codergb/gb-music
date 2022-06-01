import request from '@/network/request';
import store from '@/store';
export function publishMessage(uri, content, key, id) {
  return request({
    url: `/message/${uri}`,
    method: 'post',
    data: {
      content,
      [key]: id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//歌手发布专辑
export function publishAlbum(arId, content, alId) {
  return request({
    url: '/message/album',
    method: 'post',
    headers: {
      authorization: store.state.userMsg.token
    },
    data: {
      arId,
      content,
      alId
    }
  });
}

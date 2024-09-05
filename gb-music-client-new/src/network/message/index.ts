import request from '../request';
import store from '../../store';
//创建消息
export function publishMessage(uri: string, content: string, key: string, id: string) {
  return request({
    url: `/message/${uri}`,
    method: 'post',
    data: {
      content,
      [key]: id
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//歌手发布专辑
export function publishAlbum(arId: string, content: string, alId: string) {
  return request({
    url: '/message/album',
    method: 'post',
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    },
    data: {
      arId,
      content,
      alId
    }
  });
}
//获取所有通知
export function getAllMsg() {
  return request({
    url: '/message',
    headers: {
      // @ts-ignore
     // authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//一键已读
export function readMessage(ids: string[]) {
  return request({
    url: '/message/read',
    method: 'post',
    data: {
      id: ids
    },
    headers: {
      // @ts-ignore
      //authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//获取所有视频通知
export function getVideoMsg(offset: string, limit: string) {
  return request({
    url: '/message/detail/video',
    method: 'post',
    data: {
      offset,
      limit
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//获取所有评论通知
export function getCommentMsg(offset: string, limit: string) {
  return request({
    url: '/message/detail/comment',
    method: 'post',
    data: {
      offset,
      limit
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//获取所有发布专辑通知
export function getAlbumMsg<T>(offset: string, limit: string) {
  return request<T>({
    url: '/message/detail/album',
    method: 'post',
    data: {
      offset,
      limit
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//获取所有创建通知
export function getPlaylistMsg(offset: string, limit: string) {
  return request({
    url: '/message/detail/playlist',
    method: 'post',
    data: {
      offset,
      limit
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//获取所有声音
export function getChannelMsg(offset: string, limit: string) {
  return request({
    url: '/message/detail/channel',
    method: 'post',
    data: {
      offset,
      limit
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//删除消息通知
export function deleteMsg(id: string) {
  return request({
    url: '/message/delete',
    method: 'post',
    data: {
      id
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}
//已读消息
export function readSingleMsg(id: string) {
  return request({
    url: '/message/read/single',
    method: 'post',
    data: {
      id
    },
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token
    }
  });
}

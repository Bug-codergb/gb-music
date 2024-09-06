import request from '../request';
import store from '../../store/index';
//用户喜欢歌曲
export function setUserFavorite(id: string) {
  return request({
    url: '/user/favorite',
    method: 'post',
    data: {
      id
    },
    headers: {

    }
  });
}
//获取用户喜欢歌曲
export function getUserFavorite(offset: number, limit: number) {
  return request({
    url: '/user/favorite',
    params: {
      offset,
      limit
    },
    headers: {
    }
  });
}
//取消用户喜欢
export function cancelFavorite(songId: string) {
  return request({
    url: '/user/favorite/cancel',
    method: 'post',
    data: {
      songId: songId
    },
    headers: {
    }
  });
}
//获取用户收藏
export function getUserSub(url: string, offset: number, limit: number) {
  return request({
    url: `/sub/user/${url}`,
    params: {
      offset,
      limit
    },
    headers: {
    }
  });
}
//获取当前登录用户详情
export function getUserDetail() {
  return request({
    url: '/user/detail',
    headers: {
    }
  });
}
//上传用户头像
export function uploadAvatar(formData: FormData) {
  return request({
    url: '/user/upload/avatar',
    method: 'post',
    headers: {
      'Content-Type': 'multipart/form-data'
    },
    data: formData
  });
}
//获取其它用户详情
export function getOtherUserDetail<T>(userId: string) {
  return request<T>({
    url: '/user/other/detail',
    method: 'post',
    data: {
      userId
    },
    headers: {
    }
  });
}

//获取用户创建的电台
export function getUserChannel(userId: string, offset: number, limit: number) {
  return request({
    url: '/user/channel',
    method: 'post',
    data: {
      userId,
      offset,
      limit
    },
    headers: {
    }
  });
}

//获取用户收藏的歌单
export function getUserSubPlaylist<T>(userId: string, offset: number, limit: number) {
  return request<T>({
    url: '/sub/user/playlist',
    method: 'post',
    params: {
      offset,
      limit
    },
    data: {
      userId
    }
  });
}
//用户VIP是否·过期
export function updateUserExpire(token: string) {
  return request({
    url: '/user/expire',
    method: 'post',
    headers: {
      // @ts-ignore
      authorization: token
    }
  });
}
//获取用户动态数据
export function getUserMomentData() {
  return request({
    url: '/user/data/moment',
    method: 'post',
    headers: {
    }
  });
}
//获取用户全部动态
export function getUserAllMoment(offset: string, limit: string) {
  return request({
    url: '/user/moment',
    method: 'post',
    data: {
      offset,
      limit
    },
    headers: {
    }
  });
}
//获取用户简略信息
export function getSimpleUserInfo<T>(userId: string) {
  return request<T>({
    url: '/user/simple',
    params: {
      userId
    },
    headers: {

    }
  });
}

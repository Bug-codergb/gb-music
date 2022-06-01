import request from '@/network/request';
import store from '@/store';
//获取系统用户人数
export function getUserCount() {
  return request({
    url: '/user/count',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取用户列表
export function getUserList(vip, manage, keyword, offset, limit) {
  return request({
    url: '/user/list',
    method: 'post',
    data: {
      vip,
      manage,
      keyword,
      offset,
      limit
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
export function getAllCombo() {
  return request({
    url: '/combo/all',
    method: 'get',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//更新用户信息
export function updateUserMsg(userId, vip, name, manage, expireTime, combo) {
  return request({
    url: '/user/update',
    method: 'post',
    data: {
      userId,
      vip,
      name,
      manage,
      expireTime,
      combo
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取系统总数居
export function getSystemData() {
  return request({
    url: '/user/system/data',
    method: 'post',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//删除用户
export function deleteUserRequest(userId) {
  return request({
    url: '/user/delete',
    method: 'post',
    data: {
      userId
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取当前在线人数
export function getLineCount() {
  return request({
    url: '/line/count',
    method: 'post',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}

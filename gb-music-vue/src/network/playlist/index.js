import request from '../request';
import store from '@/store';
//获取所有歌单
export function getAllPlaylist(offset = 0, limit = 50, keyword) {
  return request({
    url: '/playlist/all',
    params: {
      offset,
      limit,
      keyword
    }
  });
}
//获取所有歌单分类
export function getPlaylistCate(offset, limit) {
  return request({
    url: 'playlist/cate',
    params: {
      offset,
      limit
    }
  });
}
//为歌单设置分类
export function addCateForPlay(pId, cateId) {
  return request({
    url: '/playlist/cate/add',
    method: 'post',
    data: {
      pId,
      cateId
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//删除歌单
export function delPlaylist(id) {
  return request({
    url: '/playlist/delete',
    method: 'post',
    data: {
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//添加歌单分类
export function addPlaylistCate(name) {
  return request({
    url: '/playlist/cate',
    method: 'post',
    data: {
      name
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//获取歌单数据
export function getPlaylistData() {
  return request({
    url: '/playlist/data',
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}

//更新歌单
export function updatePlaylist(id, name, desc, cate) {
  return request({
    url: '/playlist/update',
    method: 'post',
    data: {
      id,
      name,
      desc,
      cate
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  });
}
//删除歌单分类
export function delPlaylistCate(id){
  return request({
    url:"/playlist/cate/delete",
    method:"post",
    data:{
      id
    },
    headers: {
      authorization: store.state.userMsg.token
    }
  })
}

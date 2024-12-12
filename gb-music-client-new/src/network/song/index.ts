import request from '../request';
import store from '../../store';
// @ts-ignore
import streamSaver from 'streamsaver';
import { HOST_NAME } from '../../config';

//获取推荐歌曲
export function getRecSong<T>(offset: number = 0, limit: number = 30) {
  return request<T>({
    url: '/song/recommend',
    params: {
      offset,
      limit
    }
  });
}
//获取歌曲播放地址
export function getSongURL(id: string) {
  return request({
    url: '/song/url',
    params: {
      id
    }
  });
}
//获取歌曲详情
export function getSongDetail(id: String) {
  return request({
    url: '/song/detail',
    params: {
      id
    }
  });
}
//获取歌词
export function getLyric(id: string) {
  return request({
    url: '/song/lyric',
    params: {
      id
    }
  });
}
//为歌曲添加播放量
export function addSongPlayCount(id: string) {
  return request({
    url: '/song/playCount',
    method: 'post',
    data: {
      id
    }
  });
}
//下载歌曲
export function downloadSong(id: string, name: string) {
  fetch(`${HOST_NAME}/song/download`, {
    method: 'post',
    headers: {
      // @ts-ignore
      authorization: store.getState().getIn(['loginReducer', 'login', 'userMsg']).token,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ id })
  }).then((res) => {
    const fileStream = streamSaver.createWriteStream(name + '.mp3', {
      size: res.headers.get('content-length')
    });
    const readableStream = res.body;
    // @ts-ignore
    if (window.WritableStream && readableStream.pipeTo) {
      // @ts-ignore
      return readableStream.pipeTo(fileStream).then(() => {});
    }
    // @ts-ignore
    window.writer = fileStream.getWriter();
    // @ts-ignore
    const reader = res.body.getReader();
    // @ts-ignore
    const pump = () =>
      reader.read().then((res) =>
        // @ts-ignore
        res.done ? window.writer.close() : window.writer.write(res.value).then(pump)
      );
    pump();
  });
}
export function getAllSongApi(keyword:string,offset:number,limit:number){
  return request({
    url:"/song/all",
    method:"get",
    params:{
      keyword,
      offset,
      limit
    }
  })
}
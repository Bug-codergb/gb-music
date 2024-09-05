import { createSlice } from "@reduxjs/toolkit"
import { HOST_NAME } from '../../../../config';
import {
  changeCurrentLyricIndex,
  changeLyric,
  changeLyricLine, changePlayMode,
  changeSongDetail,
  changeSongURL
} from './actionCreators';
const songSlice = createSlice({
  name:"song",
  initialState:{
    songUrl: `${HOST_NAME}/song/source?id=1643938595197`,
    songDetail: {
      id: '1643938595197',
      vip: 0,
      album: {
        id: '1643938531634',
        name: '一路生花',
        coverUrl: `${HOST_NAME}/album/cover?id=1643938531634`
      },
      channel: {},
      video: {},
      artist: {
        name: '温奕心',
        id: '1643938461386'
      },
      user: { userName: '', avatarUrl: '', userId: '' },
      name: '一路生花',
      duration: 256287
    },
    lyric: [{ index: 1, duration: 0, content: '' }],
    lyricLine: '',
    currentLyricIndex: 0,
    //播放列表
    playlist: [],
    currentIndex: 0,
    playMode: 0 //0 列表循环 1 随机播放 2 单曲循环
  },
  reducers:{
    changeSongURL(){

    },
    changeSongDetail(){

    },
    changeLyric(){

    },
    changeLyricLine(){

    },
    changeCurrentLyricIndex(){

    },
    changePlaylist(){

    },
    changeCurrentIndex(){

    },
    changePlayMode(){

    }
  }
})

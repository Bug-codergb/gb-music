import { createSlice } from "@reduxjs/toolkit"
import { HOST_NAME } from '../../../../config';
import { changeSongDetailAction } from "./asyncThunk"
const songSlice = createSlice({
  name:"song",
  initialState:{
    songUrl: ``,
    songDetail: {
      id: '',
      vip: 0,
      album: {
        id: '',
        name: '',
        coverUrl: ``
      },
      channel: {},
      video: {},
      artist: {
        name: '',
        id: ''
      },
      user: { userName: '', avatarUrl: '', userId: '' },
      name: '',
      duration: 0
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
    changeSongURL(state,{payload}){
      state.songUrl=payload
    },
    changeSongDetail(state,{payload}){
      state.songDetail=payload
    },
    changeLyric(state,{payload}){
      state.lyric=payload
    },
    changeLyricLine(state,{payload}){
      state.lyricLine=payload
    },
    changeCurrentLyricIndex(state,{payload}){
      state.currentLyricIndex=payload
    },
    changePlaylist(state,{payload}){
      state.playlist=payload
    },
    changeCurrentIndex(state, { payload }) {
      state.currentIndex=payload
    },
    changePlayMode(state,{payload}){
      state.playMode=payload
    }
  },
  extraReducers:(builder)=>{

  }
})
const reducer = songSlice.reducer;
const {
  changeSongURL,
  changeSongDetail,
  changeLyric,
  changeLyricLine,
  changeCurrentLyricIndex,
  changePlaylist,
  changeCurrentIndex,
  changePlayMode
} =songSlice.actions
export {
  reducer,
  changeSongURL,
  changeSongDetail,
  changeLyric,
  changeLyricLine,
  changeCurrentLyricIndex,
  changePlaylist,
  changeCurrentIndex,
  changePlayMode
}

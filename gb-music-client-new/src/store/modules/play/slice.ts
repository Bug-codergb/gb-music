import { createSlice } from "@reduxjs/toolkit"
const playSlice = createSlice({
  name:"play",
  initialState:{
    isPlayMusic:false,
    isPlayVideo:false,
  },
  reducers:{
    changePlayMusic(state,{payload}){
      state.isPlayMusic = payload;
    },
    changePlayVideo(state,{payload}){
      state.isPlayVideo = payload;
    }
  }
})
const reducer = playSlice.reducer;
const { changePlayMusic,changePlayVideo } = playSlice.actions
export {
  reducer,
  changePlayMusic,
  changePlayVideo
}
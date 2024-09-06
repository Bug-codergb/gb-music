import { createSlice } from "@reduxjs/toolkit"
const videoSlice = createSlice({
  name: "video",
  initialState:{
    video: {
      id: '',
      name: '',
      description: '',
      coverUrl: '',
      category: { id: '', name: '' },
      playCount: 0,
      type: 0,
      createTime: '',
      updateTime: '',
      dt: 0,
      songId: '',
      user: { id: '', name: '', avatarUrl: '' }
    }
  },
  reducers:{
    changeVideoDetail(state, action){
      state.video = action.payload
    }
  }
})
const reducer = videoSlice.reducer;
const {changeVideoDetail}=videoSlice.actions;
export {
  reducer,
  changeVideoDetail
}

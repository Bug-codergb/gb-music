import { createSlice } from "@reduxjs/toolkit"
const playTypeSlice = createSlice({
  name: "playType",
  initialState:{
    playType:0
  },
  reducers:{
    changePlayType(state,{payload}){
      state.playType= payload;
    }
  }
})
const reducer = playTypeSlice.reducer;
const {
  changePlayType
} = playTypeSlice.actions

export {
  reducer,
  changePlayType
}

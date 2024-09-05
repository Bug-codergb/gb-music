import { createSlice } from "@reduxjs/toolkit"
const showMsgSlice=createSlice({
  name:"showMsg",
  initialState:{
    message:"",
    dt:1000
  },
  reducers:{
    changeShow(state,payload:any){
      state.dt=payload.dt;
      state.message = payload.message
    }
  }
})
const reducer = showMsgSlice.reducer;
const {changeShow} = showMsgSlice.actions;
export {
  reducer,
  changeShow
}

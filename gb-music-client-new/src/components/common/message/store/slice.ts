import {createSlice} from "@reduxjs/toolkit"
const messageSlice = createSlice({
  name:"message",
  initialState:{
    isShow: false,
    resolve: null,
    reject: null
  },
  reducers:{
    changeMsgShow(state,{payload}){
      state.isShow = payload.isShow
    },
    changeResolve(state,{payload}){
      state.resolve = payload.resolve;
    },
    changeReject(state,{payload}){
      state.reject = payload.reject
    }
  }
})
const reducer = messageSlice.reducer;
const {changeReject,changeResolve,changeMsgShow} = messageSlice.actions
export {
  reducer,
  changeMsgShow,
  changeReject,
  changeResolve
}

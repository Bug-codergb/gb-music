import {createSlice} from '@reduxjs/toolkit';
import {loginAsyncThunk} from "./asyncThunk"
const loginSlice = createSlice({
  name:"login",
  initialState:{
    userMsg: JSON.parse(window.localStorage.getItem('userMsg') as string),
    loginType: JSON.parse(window.localStorage.getItem('loginType') as string),
    userDetail:
      window.localStorage.getItem('userDetail') === 'undefined'
        ? {}
        : JSON.parse(window.localStorage.getItem('userDetail') as string)
  },
  reducers:{
    changeUserMsg(){},
    changeLoginType(){},
    changeUserDetail(){}
  },
  extraReducers:(builder)=>{
    builder.addCase(loginAsyncThunk.pending,()=>{}).addCase(loginAsyncThunk.fulfilled,()=>{})
  }
})
const {changeUserMsg,changeUserDetail,changeLoginType} = loginSlice.actions
const reducer = loginSlice.reducer
export {
  changeUserMsg,changeUserDetail,changeLoginType,
  reducer
}

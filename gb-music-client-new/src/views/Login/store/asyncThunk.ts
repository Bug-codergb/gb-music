import { createAsyncThunk } from '@reduxjs/toolkit';
import {changeUserDetail,changeUserMsg,changeLoginType} from "./slice"
import { login } from '../../../network/login';

import { getUserDetail, updateUserExpire } from '../../../network/user';
//import { changeShow } from '../../../components/common/toast/store/actionCreators';
import { ILoginUserAction } from './type';
import { IUserDetail, IUserMsg } from '../../../constant/store/login';

export const loginAsyncThunk = createAsyncThunk("loginAsyncThunk",async (extraInfo,{dispatch,getState})=>{
  const {userName,password,navigate} = extraInfo as any;
  const data: any = await login(userName, password);
  if (data) {
    const { token } = data;
    const res: any = await updateUserExpire(token);
    if (res.code * 1 === 200) {
     // dispatch(changeShow('您的VIP已经过期，开通VIP后畅想', 3500));
      data.auth = 0;
      delete data.vip;
    }
    await dispatch(changeUserMsg(data));
    await dispatch(changeLoginType(1));
    window.localStorage.setItem('userMsg', JSON.stringify(data));
    window.localStorage.setItem('loginType', '1');
    await dispatch(changeUserDetailAction());
    navigate("/Home");
  }
})
export const changeUserDetailAction = createAsyncThunk("changeUserDetailAction",async (extraInfo,{dispatch})=>{
  const res:any = await getUserDetail();
  const {love,follow} = res;
  if(!love){
    res.love =[]
  }
  if(!follow){
    res.follow = []
  }
  window.localStorage.setItem("userDetail",JSON.stringify(res));
  dispatch(changeUserDetail(res));
})
export const logoutAction=createAsyncThunk("logoutAction",(extraInfo,{dispatch})=>{
  window.localStorage.clear();
  dispatch(changeLoginType(0));

})

import { createAsyncThunk } from "@reduxjs/toolkit"
import { getVideoDetail } from '@/network/video';
import { IVideoStore } from '@/constant/store/video';

import {changeVideoDetail} from "./slice"
export const changeVideoDetailAction=createAsyncThunk("videoDetailAction",(extraInfo:any,{dispatch,getState})=>{
  const { id } = extraInfo
  getVideoDetail<IVideoStore>(id).then((data: IVideoStore) => {
    dispatch(changeVideoDetail(data));
  });
})

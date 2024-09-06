import { createAsyncThunk } from "@reduxjs/toolkit"

import { getProgramDetail, getProgramURL } from '../../../../../../../network/channel';
import {changeProgramURL,changeProgramDetail} from "./slice"
const changeProgramDetailAction=createAsyncThunk("programDetail",async (extraInfo,{dispatch,getState})=>{
  const {id} = extraInfo as any;
  const res = await getProgramDetail(id);
  dispatch(changeProgramDetail(res));

  const ret:any = await getProgramURL(id);
  dispatch(changeProgramURL(ret.url));
})
export {
  changeProgramDetailAction,
}

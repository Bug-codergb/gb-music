import { createAsyncThunk } from "@reduxjs/toolkit"
import { changeLyric } from "@/components/content/playCoin/store/slice"
import {changePlayVideo,changePlayMusic} from "@/store/modules/play/slice"
import { getProgramDetail, getProgramURL } from '../../../../../../../network/channel';
import { changeSongDetail,changeSongURL } from "@/components/content/playCoin/store";
import {changeProgramURL,changeProgramDetail} from "./slice"
import { changePlayType } from "@/store/playType/slice"
const changeProgramDetailAction=createAsyncThunk("programDetail",async (extraInfo,{dispatch,getState})=>{
  const {id} = extraInfo as any;
  const res = await getProgramDetail(id);
  dispatch(changeProgramDetail(res));
  dispatch(changeSongDetail(res));

  dispatch(changePlayType(1))
  const ret:any = await getProgramURL(id);
  dispatch(changePlayVideo(false));
  dispatch(changePlayMusic(true));

  dispatch(changeProgramURL(ret.url));
  
  dispatch(changeSongURL(ret.url));
  dispatch(changeLyric('暂无歌词'));
})
export {
  changeProgramDetailAction,
}

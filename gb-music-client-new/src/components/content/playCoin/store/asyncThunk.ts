import { createAsyncThunk } from "@reduxjs/toolkit"
import { addSongPlayCount, getLyric, getSongDetail, getSongURL } from '../../../../network/song';
import { ISong } from '../../../../constant/song';
import { getRandom } from '../../../../utils/getRandom';
import { changePlayType } from '../../../../store/playType/actionCreators';
import { getFormatLyric } from '../../../../utils/formatLyric';
import { verifyURL } from '../../../../utils/verify';
import { ISongStore } from '../../../../constant/store/song';
import { changePlaylist, changeCurrentIndex, changeSongDetail, changeSongURL, changeLyric } from './slice';


export const changeSongDetailAction = createAsyncThunk("songDetailAction",async (extraInfo:any,{dispatch,getState})=>{
  const {id} = extraInfo
  const state:any = getState();
  const { playlist } = state['songReducer'];
  let flag = playlist.findIndex((item: ISong, index: number) => {
    return item.id === id;
  });
  dispatch(changePlayType(0));
  //播放列表中不存在
  if (flag === -1) {
    getSongDetail(id).then((data: any) => {
      dispatch(changeSongDetail(data));
      dispatch(changeSongURLAction(id));
      dispatch(changeSongLyric(id));
      const newPlaylist = [...playlist];
      newPlaylist.push(data);
      dispatch(changePlaylist(newPlaylist));
      dispatch(changeCurrentIndex(newPlaylist.length - 1));
    });
    addSongPlayCount(id);
  }
  //播放列表中存在
  if (flag !== -1) {
    dispatch(changeCurrentIndex(flag));
    dispatch(changeSongDetail(playlist[flag]));
    dispatch(changeSongURLAction(id));
    dispatch(changeSongLyric(id));
    await addSongPlayCount(id);
  }
})
export const changeCurrentSongAction = createAsyncThunk("currentSongAction",(extraInfo:any,{dispatch,getState})=>{
  const state:any = getState()
  const {tag} =extraInfo
  const { playMode }: ISongStore = state['songReducer'];
  const { playlist }: ISongStore = state['songReducer'];
  let { currentIndex }: ISongStore = state['songReducer'];
  switch (playMode) {
    case 1:
      if (playlist.length !== 1) {
        let rand = getRandom(0, playlist.length - 1);
        while (rand === currentIndex) {
          rand = getRandom(0, playlist.length - 1);
        }
        currentIndex = rand;
      } else if (playlist.length === 1 || playlist.length === 0) {
        currentIndex = 0;
      }
      break;
    default:
      currentIndex += tag;
      if (currentIndex < 0) currentIndex = playlist.length - 1;
      if (currentIndex > playlist.length - 1) currentIndex = 0;
  }
  dispatch(changeCurrentIndex(currentIndex));
  dispatch(changeSongDetail(playlist[currentIndex]));
  dispatch(changeSongURLAction(playlist[currentIndex].id));
})
export const changeSongURLAction = createAsyncThunk("songUrlAction",(extraInfo:any,{dispatch,getState})=>{
  const {id} = extraInfo;
  getSongURL(id).then((data: any) => {
    const { mp3Url } = data;
    const url = verifyURL(mp3Url);
    dispatch(changeSongURL(url));
  });
})
export const changeSongLyric=createAsyncThunk("songLyric,lyric",(extraInfo:any,{dispatch,getState})=>{
  const {id} = extraInfo;
  getLyric(id).then((data: any) => {
    if (data.lyric) {
      dispatch(changeLyric(getFormatLyric(data.lyric)));
    } else {
      dispatch(changeLyric('暂无歌词'));
    }
  });
})

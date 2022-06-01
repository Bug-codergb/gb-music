import { addSongPlayCount, getLyric, getSongDetail, getSongURL } from '../../../../network/song';
import { ISong } from '../../../../constant/song';
import { getRandom } from '../../../../utils/getRandom';
import { changePlayType } from '../../../../store/playType/actionCreators';
import { getFormatLyric } from '../../../../utils/formatLyric';
import { verifyURL } from '../../../../utils/verify';
import { ISongStore } from '../../../../constant/store/song';

export function changeSongURL(res: string) {
  return {
    type: 'changeSongURL',
    songUrl: res
  };
}
export function changeSongDetail(res: any) {
  document.title = `${res.name} - ${res.artist ? res.artist.name : res.channel.name} - gb-music`;
  return {
    type: 'changeSongDetail',
    songDetail: res
  };
}
export function changeLyric(res: any) {
  return {
    type: 'changeLyric',
    lyric: res
  };
}
export function changeLyricLine(lyric: string) {
  return {
    type: 'changeLyricLine',
    lyricLine: lyric
  };
}
export function changeCurrentLyricIndex(index: number) {
  return {
    type: 'changeCurrentLyricIndex',
    currentLyricIndex: index
  };
}
//添加到播放列表
function changePlaylist(res: ISong[]) {
  return {
    type: 'changePlaylist',
    playlist: res
  };
}
//播放列表中歌曲索引
function changeCurrentIndex(res: number) {
  return {
    type: 'changeCurrentIndex',
    currentIndex: res
  };
}
//改变播放模式
export function changePlayMode(res: number) {
  return {
    type: 'changePlayMode',
    playMode: res
  };
}
export function changeSongDetailAction(id: string) {
  return (dispatch: any, getState: any) => {
    const { playlist } = getState().getIn(['songReducer', 'song']);
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
      addSongPlayCount(id);
    }
  };
}
export function changeCurrentSongAction(tag: number) {
  return (dispatch: any, getState: any) => {
    const { playMode }: ISongStore = getState().getIn(['songReducer', 'song']);
    const { playlist }: ISongStore = getState().getIn(['songReducer', 'song']);
    let { currentIndex }: ISongStore = getState().getIn(['songReducer', 'song']);
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
  };
}
export function changeSongURLAction(id: string) {
  return (dispatch: any) => {
    getSongURL(id).then((data: any) => {
      const { mp3Url } = data;
      const url = verifyURL(mp3Url);
      dispatch(changeSongURL(url));
    });
  };
}
export function changeSongLyric(id: string) {
  return (dispatch: any) => {
    getLyric(id).then((data: any) => {
      if (data.lyric) {
        dispatch(changeLyric(getFormatLyric(data.lyric)));
      } else {
        dispatch(changeLyric('暂无歌词'));
      }
    });
  };
}

import React, { memo, FC, ReactElement, useState, MouseEvent, useRef, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";


import { Slider } from 'antd';
import { formatTime } from '../../../utils/format';
import { CenterContent, PlayCoinWrapper } from './style';
import {
  changeCurrentLyricIndex,

  changeLyricLine,
  changePlayMode
} from './store/slice';
import {changeCurrentSongAction} from "./store/asyncThunk"
import Playlist from './childCpn/playlist';
import { CSSTransition } from 'react-transition-group';
import { getFileBlob } from '../../../network/media';
import { ILogin, IUserMsg } from '../../../constant/store/login';
import { ISongStore } from '../../../constant/store/song';

interface IProps  {}
const PlayCoin: FC<IProps> = (props): ReactElement => {
  const navigate = useNavigate()
  const [isPlay, setIsPlay] = useState<boolean>(false);
  const [currentTime, setCurrentTime] = useState<number>(0);
  const [isDrag, setIsDrag] = useState<boolean>(false);
  const [isShow, setIsShow] = useState<boolean>(false);
  const [isShowCurLyric, setIsShowLyric] = useState<boolean>(false);
  //redux-hook
  const dispatch = useAppDispatch();
  const { userMsg } = useAppSelector((state) => ({
    userMsg: state['loginReducer']
  }));
  const { song } = useAppSelector((state) => ({
    song: state['songReducer']
  }));
  const audioRef = useRef<HTMLAudioElement>(null);
  //react-hook
  useEffect(() => {
    setIsPlay(false);
    getFileBlob(song.songUrl).then((data) => {
      if (audioRef.current) {
        audioRef.current.src = song.songUrl;
        audioRef.current.volume = 0.2;
        audioRef.current.play();
        setIsPlay(true);
      }
    });
  }, [song.songUrl]);
  const play = (): void => {
    setIsPlay(!isPlay);
    isPlay ? audioRef.current?.pause() : audioRef.current?.play();
  };
  //获取当前时间
  const getCurrentTime = (e: any) => {
    if (!isDrag) {
      setCurrentTime(e.target.currentTime * 1000);
      if (e.target.currentTime * 1000 > song.songDetail.duration * 0.2) {
        if (userMsg.auth * 1 === 0 && song.songDetail.vip === 1) {
          if (audioRef.current) {
            audioRef.current.currentTime = 0;
          }
        }
      }
    }
    if (song.lyric && Array.isArray(song.lyric) && song.lyric.length !== 0) {
      let songIndex: number = 0;
      for (let index in song.lyric) {
        if (song.lyric[index].duration > e.target.currentTime * 1000) {
          songIndex = parseInt(index);
          break;
        }
      }
      if (song.lyric[songIndex - 1] && song.lyricLine !== song.lyric[songIndex - 1].content) {
        dispatch(changeCurrentLyricIndex(songIndex - 1));
        dispatch(changeLyricLine(song.lyric[songIndex - 1].content));
      }
    }
  };
  const changeProgress = (val: number) => {
    setIsDrag(true);
    setCurrentTime((val / 100) * song.songDetail.duration);
  };
  const changeEnd = (val: number) => {
    setIsDrag(false);
    if (audioRef.current) {
      audioRef.current.currentTime = currentTime / 1000;
    }
  };
  //切歌
  const changeSong = (tag: number) => {
    dispatch(changeCurrentSongAction(tag));
  };
  const endHandle = () => {
    if (song.playMode === 2 && audioRef.current) {
      audioRef.current.currentTime = 0;
      audioRef.current.play();
      dispatch(changeCurrentLyricIndex(0));
    } else {
      setIsPlay(false);
      dispatch(changeCurrentLyricIndex(0));
    }
  };
  const changeVolume = useCallback((val) => {
    if (audioRef.current) {
      audioRef.current.volume = val / 100;
    }
  }, []);
  const playCoin = () => {
    navigate('/Home/playPage')
  };
  //改变播放模式
  const changeMode = () => {
    let tempMode: number = song.playMode + 1;
    if (tempMode > 2) {
      tempMode = 0;
    }
    dispatch(changePlayMode(tempMode));
  };
  //切换播放列表
  const playlistClick = (e: MouseEvent<HTMLDivElement>) => {
    e.stopPropagation();
    setIsShow(!isShow);
  };
  useEffect(() => {
    document.addEventListener('click', changeShowFn);
  }, []);
  const changeShowFn = () => {
    setIsShow(false);
  };
  useEffect(() => {
    return () => {
      document.removeEventListener('click', changeShowFn);
    };
  }, []);
  const lyricControl = () => {
    setIsShowLyric(!isShowCurLyric);
  };
  return (
    <PlayCoinWrapper>
      <CenterContent>
        <div className="msg">
          <div className="img-container" onClick={(e) => playCoin()}>
            <img
              src={song.songDetail.album ? song.songDetail.album.coverUrl : song.songDetail.channel.coverUrl}
              alt=""
            />
            <div className="mask"> </div>
          </div>
          <div className="right-msg">
            <div className="song-name-outer">
              <p className="song-name text-nowrap">{song.songDetail.name}</p>
              {song.songDetail.vip === 1 && <p className="vip">VIP</p>}
            </div>
            <p className="artist-name text-nowrap">
              {song.songDetail.artist ? song.songDetail.artist.name : song.songDetail.user.userName}
            </p>
          </div>
        </div>
        <div className="control">
          <div className="control-btn">
            <div className="mode" onClick={(e) => changeMode()}>
              <i className="iconfont icon-liebiaoxunhuan" style={{ display: song.playMode === 0 ? 'block' : 'none' }}>
                {' '}
              </i>
              <i className="iconfont icon-suijibofang" style={{ display: song.playMode === 1 ? 'block' : 'none' }}>
                {' '}
              </i>
              <i className="iconfont icon-danquxunhuan" style={{ display: song.playMode === 2 ? 'block' : 'none' }}>
                {' '}
              </i>
            </div>
            <div className="prev" onClick={(e) => changeSong(-1)}>
              <i className="iconfont icon-skipnext"> </i>
            </div>
            <div className="play-or-pause" onClick={(e: MouseEvent<HTMLDivElement>) => play()}>
              {!isPlay && <i className="iconfont icon-custom-play"> </i>}
              {isPlay && <i className="iconfont icon-pause"> </i>}
            </div>
            <div className="next" onClick={(e) => changeSong(1)}>
              <i className="iconfont icon-skipnext"> </i>
            </div>
            <div className={`lyric ${isShowCurLyric ? 'active' : ''}`} onClick={(e) => lyricControl()}>
              词
            </div>
          </div>
          <div className="progress">
            <div className="current-time">{formatTime(currentTime, 'mm:ss')}</div>
            <div className="progress-bar">
              <Slider
                defaultValue={0}
                onChange={(val: number) => changeProgress(val)}
                onAfterChange={(val: number) => changeEnd(val)}
                value={(currentTime / song.songDetail.duration) * 100}
                tooltipVisible={false}
              />
            </div>
            <div className="dt">{formatTime(parseInt(song.songDetail.duration.toString()), 'mm:ss')}</div>
          </div>
        </div>
        <div className="operator">
          <div className="volume">
            <i className="iconfont icon-yangshengqi"> </i>
            <div className="volume-bar">
              <Slider defaultValue={30} onChange={(val) => changeVolume(val)} tooltipVisible={false} />
            </div>
          </div>
          <div className="playlist" onClick={(e: MouseEvent<HTMLDivElement>) => playlistClick(e)} title="播放列表">
            <CSSTransition in={isShow} timeout={500} unmountOnExit={true} classNames="playlist">
              <Playlist />
            </CSSTransition>
            <i className="iconfont icon-play-list-2-fill"> </i>
          </div>
        </div>
        <audio style={{ display: 'none' }} ref={audioRef} onTimeUpdate={(e) => getCurrentTime(e)} onEnded={endHandle} />
        {song.lyricLine && (
          <CSSTransition in={isShowCurLyric} timeout={500} unmountOnExit={true} classNames="lyric">
            <div className="cur-lyric">{song.lyricLine}</div>
          </CSSTransition>
        )}
      </CenterContent>
    </PlayCoinWrapper>
  );
};
export default memo(PlayCoin);

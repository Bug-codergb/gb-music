import React, { memo, FC, ReactElement, useEffect, useState, useRef, useCallback, MouseEvent } from 'react';

import { useAppDispatch, useAppSelector } from '@/store/hooks';
import { useNavigate, useLocation } from 'react-router-dom';
import { CenterContent, VideoDetailWrapper, LeftContent, RightContent } from './style';
import { getVideoURL, updatePlayCount } from '../../../../network/video';
import { Slider, Spin } from 'antd';

import { formatTime } from '../../../../utils/format';
import { changeVideoDetailAction } from './store/asyncThunk';

import Comment from './childCpn/comment';
import ControlBtn from './childCpn/controlBtn';
import VideoInfo from './childCpn/videoInfo';
import SimiVideo from './childCpn/simiVideo';
import { IVideo } from '../../../../constant/video';
import { CSSTransition } from 'react-transition-group';
import { getFileBlob } from '../../../../network/media';
import { verifyURL } from '../../../../utils/verify';
import useBackTop from '../../../../hooks/useBackTop';
import { IVideoStore } from '../../../../constant/store/video';
import { Dispatch } from 'redux';
import { IVideoDetailAction } from './store/type';

const VideoDetail: FC<{ id: string }> = memo((props): ReactElement => {
  const location = useLocation();
  const { id } = location.state;

  const [vid, setVid] = useState<string>(id);
  const [url, setURL] = useState<string>('');
  const [isPlay, setIsPlay] = useState<boolean>(false);
  const [isDrag, setIsDrag] = useState<boolean>(false);
  const [currentTime, setCurrentTime] = useState<number>(0);
  const [liveIndex, setLiveIndex] = useState<number>(1);
  const [isShowRate, setIsShowRate] = useState<boolean>(false);
  const videoDetail = useAppSelector((state) => {
    return state['videoReducer']['video'];
  });
  const videoRef = useRef<HTMLVideoElement>(null);
  const dispatch = useAppDispatch();
  useBackTop();
  useEffect(() => {
    dispatch(changeVideoDetailAction({ id: vid }));
    getVideoURL(vid).then((data: any) => {
      getFileBlob(verifyURL(data.url)).then(() => {
        //const url = URL.createObjectURL(data);
        setURL(verifyURL(data.url));
      });
    });
    setIsPlay(true);
    if (videoRef.current) {
      videoRef.current.volume = 0.1;
    }
  }, [dispatch, vid]);
  useEffect(() => {
    updatePlayCount(id);
  }, [id]);
  useEffect(() => {
    document.addEventListener('click', changeShowFn);
  }, []);
  const changeShowFn = () => {
    setIsShowRate(false);
  };
  useEffect(() => {
    return () => {
      document.removeEventListener('click', changeShowFn);
    };
  }, []);
  const play = () => {
    setIsPlay(!isPlay);
    isPlay ? videoRef.current?.pause() : videoRef.current?.play();
  };
  const getCurrentTime = (e: any) => {
    if (!isDrag) {
      setCurrentTime(e.target.currentTime * 1000);
    }
  };
  const getChangeTime = useCallback(
    (val) => {
      setIsDrag(true);
      setCurrentTime((val / 100) * videoDetail.dt);
    },
    [videoDetail.dt]
  );

  const getChangeEndTime = useCallback(
    (val) => {
      if (videoRef.current) {
        videoRef.current.currentTime = ((val / 100) * videoDetail.dt) / 1000;
        setIsDrag(false);
      }
    },
    [videoDetail.dt]
  );
  //修改音量
  const changeVolume = useCallback((val) => {
    if (videoRef.current) {
      videoRef.current.volume = val / 100;
    }
  }, []);
  //播放相关视频
  const playSimiVideo = (item: IVideo) => {
    //console.log(item);
    setURL('');
    dispatch(changeVideoDetailAction(item.id));
    getVideoURL(item.id).then((data: any) => {
      setURL(data.url);
    });
    setVid(item.id);
  };
  const fullScreen = () => {
    const vio = document.getElementById('vio');
    // @ts-ignore
    if (vio.requestFullscreen) {
      // @ts-ignore
      vio.requestFullscreen();
    }
  };
  const videoEnd = () => {
    setIsPlay(false);
  };
  const rateClick = (item: string, index: number) => {
    setLiveIndex(index);
    const rate = item.substring(0, item.lastIndexOf('x'));
    if (videoRef.current) {
      videoRef.current.playbackRate = parseFloat(rate);
    }
  };
  const rightClick = (e: MouseEvent<HTMLVideoElement>) => {
    // @ts-ignore
    e.returnValue = false;
    e.preventDefault();
    return false;
  };
  const changeShowRate = (e: MouseEvent<HTMLSpanElement>) => {
    e.stopPropagation();
    setIsShowRate(!isShowRate);
  };
  return (
    <VideoDetailWrapper>
      <CenterContent>
        <LeftContent>
          {videoDetail && videoDetail.id && (
            <Spin size={'large'} tip={'...视频正在加载'} spinning={url === undefined || url.trim().length === 0}>
              <div
                className="video-header"
                style={{ height: url === undefined || url.trim().length === 0 ? '400px' : 'auto' }}
              >
                <div className="video-container">
                  <video
                    src={url}
                    autoPlay
                    id="vio"
                    onTimeUpdate={(e) => getCurrentTime(e)}
                    onEnded={(e) => videoEnd()}
                    ref={videoRef}
                    onContextMenu={(e) => rightClick(e)}
                  >
                    {' '}
                  </video>
                  <div className="control">
                    <div className="progress">
                      <Slider
                        value={(currentTime / videoDetail.dt) * 100}
                        onChange={(val) => getChangeTime(val)}
                        onAfterChange={(val) => getChangeEndTime(val)}
                        tooltipVisible={false}
                      />
                    </div>
                    <div className="control-btn">
                      <div className="btn-dt">
                        <div className="play-or-pause" onClick={(e) => play()}>
                          <span style={{ display: isPlay ? 'none' : 'block' }}>
                            <i className="iconfont icon-custom-play"> </i>
                          </span>
                          <span style={{ display: isPlay ? 'block' : 'none' }}>
                            <i className="iconfont icon-pause"> </i>
                          </span>
                        </div>
                        <div className="dt">
                          {formatTime(currentTime, 'mm:ss')} / {formatTime(videoDetail.dt, 'mm:ss')}
                        </div>
                      </div>
                      <div style={{ display: 'flex', alignItems: 'center' }}>
                        <div className="rate">
                          <span onClick={(e) => changeShowRate(e)}>倍速</span>
                          <CSSTransition in={isShowRate} timeout={1000} classNames="rate" unmountOnExit={true}>
                            <ul className="rate-list">
                              {['2.0x', '1.0x', '0.5x'].map((item, index) => {
                                return (
                                  <li
                                    key={item}
                                    className={`${liveIndex === index ? 'active' : ''}`}
                                    onClick={(e) => rateClick(item, index)}
                                  >
                                    {item}
                                  </li>
                                );
                              })}
                            </ul>
                          </CSSTransition>
                        </div>
                        <div className="volume">
                          <div className="volume-icon">
                            <i className="iconfont icon-yangshengqi"> </i>
                          </div>
                          <div className="volume-progress">
                            <Slider defaultValue={20} tooltipVisible={false} onChange={(val) => changeVolume(val)} />
                          </div>
                        </div>
                        <div className="full-screen" onClick={(e) => fullScreen()}>
                          <i className="iconfont icon-quanping"> </i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </Spin>
          )}
          {/*视频信息*/}
          {videoDetail && videoDetail.id && <VideoInfo />}
          <ControlBtn vid={vid} />
          <div className="video-comment">
            <Comment vid={vid} />
          </div>
        </LeftContent>
        <RightContent>
          {videoDetail.category?.id && vid && (
            <SimiVideo id={videoDetail.category.id} vid={vid} onClick={(item: IVideo) => playSimiVideo(item)} />
          )}
        </RightContent>
      </CenterContent>
    </VideoDetailWrapper>
  );
});
export default VideoDetail;

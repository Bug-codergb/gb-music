import React, { memo, FC } from 'react';
import { useAppDispatch, useAppSelector } from '@/store/hooks';
import { useNavigate } from 'react-router-dom';

import { SongListItemWrapper } from './style';
import { formatTime } from '../../../utils/format';
import { cancelFavorite, setUserFavorite } from '../../../network/user';
import { changeUserDetailAction } from '../../../views/Login/store/asyncThunk';

import VipMv from '../../common/vip-mv';
import {ILogin, IUserDetail, IUserMsg} from '../../../constant/store/login';
//import { changeShow } from '../../common/toast/store/actionCreators';
import {changeIsShowAction} from "../vip/store/slice";
import {downloadSong} from "../../../network/song";

interface IProps {
  id: string;
  index: number;
  state: string;
  creator?: string;
  alName: string;
  arId: string;
  alId: string;
  time: string;
  dt: number;
  operator?: any;
  vip: number;
  video?: any;
  diff?: number;
  onClick: (id: string) => void;
  isShowUp: boolean;
}
const SongListItem: FC<IProps> = (props) => {
  const navigate = useNavigate();
  const { index, id, state, creator, alName, dt, onClick, arId, alId, vip, video, isShowUp, diff } = props;
  const { userDetail } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const dispatch = useAppDispatch();
  const play = (id: string) => {
    console.log(id)
    onClick(id);
  };
  const isLove = () => {
    const isExists = userDetail.love.findIndex((item: { songId: string }, index: number) => {
      return item.songId === id;
    });
    return isExists !== -1;
  };
  const loveClick = () => {
    if (!isLove()) {
      setUserFavorite(id).then((data) => {
        dispatch(changeUserDetailAction());
        //dispatch(changeShow('已添加到我喜欢的音乐', 2500));
      });
    } else {
      cancelFavorite(id).then((data) => {
        dispatch(changeUserDetailAction());
      });
    }
  };
  const userRouter = () => {
    navigate('/Home/artistDetail',{
      state: {
        id: arId
      }
    });
  };
  const albumRouter = () => {
    navigate('/Home/albumDetail',{
      state: {
        id: alId
      }
    });
  };
  const videoRouter = () => {
    navigate('/Home/videoDetail',{
      state: {
        id: video.id
      }
    });
  };
  const downloadSongHandle=()=>{
    if(userMsg && userMsg.auth*1==0){
      dispatch(changeIsShowAction(true));
    }else{
      downloadSong(id,state)
    }
  }
  return (
    <SongListItemWrapper>
      <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
      <div className="control-btn">
        <i className="iconfont icon-download" onClick={e=>downloadSongHandle()}> </i>
        {!isLove() && (
          <i className="iconfont icon-love" onClick={(e) => loveClick()}>
            {' '}
          </i>
        )}
        {isLove() && (
          <i className="iconfont icon-loveit" onClick={(e) => loveClick()}>
            {' '}
          </i>
        )}
      </div>
      {isShowUp && (
        <div className="up">
          <i className={`iconfont icon-data-arrow-up ${diff !== undefined && diff < 0 ? 'down' : ''}`}> </i>
          <span>{Math.abs(diff || 0)}</span>
        </div>
      )}
      <div className="name text-nowrap" onClick={(e) => play(id)}>
        <span className="song-name">{state}</span>
        <VipMv isShowVip={vip === 1} isShowMv={video} onClick={() => videoRouter()} />
      </div>
      <div className="creator text-nowrap" onClick={(e) => userRouter()}>
        {creator}
      </div>
      <div className="al-name text-nowrap" onClick={(e) => albumRouter()}>
        {alName}
      </div>
      <div className="dt">{formatTime(dt, 'mm:ss')}</div>
    </SongListItemWrapper>
  );
};
export default memo(SongListItem);

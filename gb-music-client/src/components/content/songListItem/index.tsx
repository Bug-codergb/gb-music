import React, { memo, FC } from 'react';
import { Map } from 'immutable';
import { useDispatch, useSelector } from 'react-redux';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { SongListItemWrapper } from './style';
import { formatTime } from '../../../utils/format';
import { cancelFavorite, setUserFavorite } from '../../../network/user';
import { changeUserDetailAction } from '../../../views/Login/store/actionCreators';

import VipMv from '../../common/vip-mv';
import {ILogin, IUserDetail, IUserMsg} from '../../../constant/store/login';
import { changeShow } from '../../common/toast/store/actionCreators';
import {changeIsShowAction} from "../vip/store/actionCreators";
import {downloadSong} from "../../../network/song";

interface IProps extends RouteComponentProps {
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
  const { index, id, state, creator, alName, dt, onClick, arId, alId, vip, video, isShowUp, diff } = props;
  const { userDetail } = useSelector<Map<string, ILogin>, { userDetail: IUserDetail }>((state) => ({
    userDetail: state.getIn(['loginReducer', 'login', 'userDetail'])
  }));
  const { userMsg } = useSelector<Map<string, ILogin>, { userMsg: IUserMsg }>((state) => ({
    userMsg: state.getIn(['loginReducer', 'login', 'userMsg'])
  }));
  const dispatch = useDispatch();
  const play = (id: string) => {
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
        dispatch(changeShow('已添加到我喜欢的音乐', 2500));
      });
    } else {
      cancelFavorite(id).then((data) => {
        dispatch(changeUserDetailAction());
      });
    }
  };
  const userRouter = () => {
    props.history.push({
      pathname: '/Home/artistDetail',
      state: {
        id: arId
      }
    });
  };
  const albumRouter = () => {
    props.history.push({
      pathname: '/Home/albumDetail',
      state: {
        id: alId
      }
    });
  };
  const videoRouter = () => {
    props.history.push({
      pathname: '/Home/videoDetail',
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
        <span>{state}</span>
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
export default withRouter(memo(SongListItem));

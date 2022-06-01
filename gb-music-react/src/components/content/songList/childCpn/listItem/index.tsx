import React, { memo, FC } from 'react';
import { Map } from 'immutable';
import { ListItemWrapper } from './style';
import { formatTime } from '../../../../../utils/format';
import VipMv from '../../../../common/vip-mv';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { cancelFavorite, setUserFavorite } from '../../../../../network/user';
import { changeUserDetailAction } from '../../../../../views/Login/store/actionCreators';
import { changeShow } from '../../../../common/toast/store/actionCreators';
import { useDispatch, useSelector } from 'react-redux';
import { ILogin, IUserDetail } from '../../../../../constant/store/login';

interface IProps extends RouteComponentProps {
  id: string;
  index: number;
  name: string;
  createName?: string;
  alName: string;
  time: string;
  operator?: string;
  play: (id: string, name: string) => void;
  vip?: number;
  video?: { id: string; name: string };
  arId: string;
}
const ListItem: FC<IProps> = (props) => {
  const { index, id, name, createName, alName, time, play, vip, video, arId } = props;
  const { userDetail } = useSelector<Map<string, ILogin>, { userDetail: IUserDetail }>((state) => ({
    userDetail: state.getIn(['loginReducer', 'login', 'userDetail'])
  }));
  const dispatch = useDispatch();
  const playClick = (id: string, name: string) => {
    play(id, name);
  };
  const isLove = (id: string) => {
    const isExists = userDetail.love.findIndex((item: { songId: string }, index: number) => {
      return item.songId === id;
    });
    return isExists !== -1;
  };
  const loveClick = (id: string) => {
    if (!isLove(id)) {
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
  const videoRouter = () => {
    if (video) {
      props.history.push({
        pathname: '/Home/videoDetail',
        state: {
          id: video.id
        }
      });
    }
  };
  const artistRouter = () => {
    if (arId) {
      props.history.push({
        pathname: '/Home/artistDetail',
        state: {
          id: arId
        }
      });
    }
  };
  return (
    <ListItemWrapper>
      <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
      <div className="love">
        <i className="iconfont icon-download"> </i>
        {!isLove(id) && (
          <i className="iconfont icon-love" onClick={(e) => loveClick(id)}>
            {' '}
          </i>
        )}
        {isLove(id) && (
          <i className="iconfont icon-loveit" onClick={(e) => loveClick(id)}>
            {' '}
          </i>
        )}
      </div>
      <div className="name" onClick={(e) => playClick(id, name)}>
        <span className="text-nowrap">{name}</span>
        <VipMv
          isShowVip={vip !== undefined && vip === 1}
          isShowMv={video !== undefined && video !== null}
          onClick={() => videoRouter()}
        />
      </div>
      <div className="create-name" onClick={(e) => artistRouter()}>
        {createName}
      </div>
      <div className="al-name text-nowrap">{alName}</div>
      <div className="time">{formatTime(parseInt(time), 'mm:ss')}</div>
    </ListItemWrapper>
  );
};
export default withRouter(memo(ListItem));

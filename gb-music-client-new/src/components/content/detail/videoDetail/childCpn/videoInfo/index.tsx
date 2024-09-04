import React, { memo, FC, ReactElement } from 'react';
import { Map } from 'immutable';
import { VideoInfoWrapper } from './style';
import { useSelector } from 'react-redux';
import UserMsg from '../../../../../common/userMsg';
import { formatTime } from '../../../../../../utils/format';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { IVideoStore } from '../../../../../../constant/store/video';
const VideoInfo: FC<RouteComponentProps> = (props): ReactElement => {
  const videoDetail = useSelector<Map<string, IVideoStore>, IVideoStore>((state) => {
    return state.getIn(['videoReducer', 'video']);
  });
  const userRouter = (id: string) => {
    if (videoDetail.type === 1 && 'id' in videoDetail.user) {
      props.history.push({
        pathname: '/Home/artistDetail',
        state: {
          id: videoDetail.user.id
        }
      });
    } else if (videoDetail.type === 0) {
      props.history.push({
        pathname: '/Home/userDetail',
        state: {
          userId: id
        }
      });
    }
  };
  return (
    <VideoInfoWrapper>
      {videoDetail && videoDetail.user && (
        <UserMsg
          userId={'name' in videoDetail.user ? videoDetail.user.id : videoDetail.user.userId}
          userName={'userName' in videoDetail.user ? videoDetail.user.userName : videoDetail.user.name}
          avatarUrl={videoDetail.user.avatarUrl}
          imgWidth="70px"
          onClick={(id) => userRouter(id)}
        />
      )}
      <div className="play-time">
        <div className="create-time">
          <span>发布于:</span>
          <span>{formatTime(videoDetail.createTime, 'yyyy-MM-dd hh:mm:ss')}</span>
        </div>
        <div className="play-count">
          <span>播放量:</span>
          <span>{videoDetail.playCount} 次</span>
        </div>
      </div>
      {videoDetail && videoDetail.description && <div className="desc">{videoDetail.description}</div>}
    </VideoInfoWrapper>
  );
};
export default withRouter(memo(VideoInfo));

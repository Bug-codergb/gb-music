import React, { memo, FC, ReactElement } from 'react';
import { useNavigate } from 'react-router-dom';
import { VideoWrapper } from './style';
import {  useAppSelector} from '@/store/hooks';
import MsgItem from '../../../../msgItem';
import { IVideo } from '../../../../../../constant/video';
import { holder } from '../../../../../../utils/holder';
import { Empty } from 'antd';
import { ISearchStore } from '../../../../../../constant/store/search';
const Video: FC = (props): ReactElement => {

  const navigate = useNavigate();
  const { video } = useAppSelector((state) => {
    return state['searchReducer']['searchResult'];
  });
  const videoRouter = (item: IVideo, index: number): void => {
    navigate('/Home/videoDetail',{
      state: {
        id: item.id
      }
    });
  };
  const userRouter = (item: IVideo) => {
    if (item.type === 0) {
      if ('userId' in item.user) {
        navigate('/Home/userDetail',{
          state: {
            userId: item.user.userId
          }
        });
      }
    } else if (item.type === 1) {
      if ('id' in item.user) {
        navigate('/Home/artistDetail',{
          state: {
            id: item.user.id
          }
        });
      }
    }
  };
  return (
    <VideoWrapper>
      {video &&
        video.length !== 0 &&
        video.map((item: IVideo, index: number) => {
          return (
            <li key={item.id}>
              <MsgItem
                state={<span>{item.name}</span>}
                img={<img src={item.coverUrl} alt={item.name} onClick={(e) => videoRouter(item, index)} />}
                isShowPlayCount={true}
                playCount={item.playCount}
                scale={0.6}
                itemWidth="190px"
                userName={'userName' in item.user ? item.user.userName : item.user.name}
                onClick={() => userRouter(item)}
                dt={item.dt}
              />
            </li>
          );
        })}
      {video &&
        video.length !== 0 &&
        holder(video.length, 4).map((item: number) => {
          return <li key={item}> </li>;
        })}
      {video.length === 0 && (
        <div
          style={{
            height: '350px',
            width: '100%',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center'
          }}
        >
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无视频'} />
        </div>
      )}
    </VideoWrapper>
  );
};
export default memo(Video);

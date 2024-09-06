import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { Empty } from 'antd';
import { IVideo } from '../../../../../../constant/video';

import { VideoWrapper } from './style';
import MsgItem from '../../../../../../components/content/msgItem';
import { getUserSub } from '../../../../../../network/user';
import { useNavigate } from 'react-router-dom';
import { holder } from '../../../../../../utils/holder';

const Video: FC = (props): ReactElement => {
  const navigate = useNavigate()
  const [video, setVideo] = useState<IVideo[]>([]);
  useEffect(() => {
    getUserSub('video', 0, 30).then((data: any) => {
      setVideo(data);
    });
  }, []);
  const videoRouter = (item: IVideo, index: number) => {
    navigate('/Home/videoDetail',{
      state: {
        id: item.id
      }
    });
  };
  const userRouter = (item: IVideo, type?: number) => {
    if (type !== undefined) {
      if (type === 0) {
        if ('userId' in item.user) {
          navigate('/Home/userDetail',{
            state: {
              userId: item.user.userId
            }
          });
        }
      } else {
        if ('id' in item.user) {
          navigate('/Home/artistDetail',{
            state: {
              id: item.user.id
            }
          });
        }
      }
    }
  };
  return (
    <VideoWrapper>
      <ul>
        {video &&
          video.length !== 0 &&
          video.map((item, index) => {
            return (
              <li key={item.id}>
                <MsgItem
                  img={<img src={item.coverUrl} alt="" onClick={(e) => videoRouter(item, index)} />}
                  state={<span>{item.name}</span>}
                  itemWidth="210px"
                  isShowPlayCount={true}
                  playCount={item.playCount}
                  scale={0.6}
                  userName={'userName' in item.user ? item.user.userName : item.user.name}
                  onClick={() => userRouter(item, item.type)}
                />
              </li>
            );
          })}
        {video &&
          holder(video.length, 5).map((item: number) => {
            return <li key={item}> </li>;
          })}
      </ul>
      {video && video.length === 0 && (
        <div className="empty-tip">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="您还未收藏视频" />
        </div>
      )}
    </VideoWrapper>
  );
};
export default memo(Video);

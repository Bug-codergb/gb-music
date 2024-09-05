import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { RecVideoWrapper } from './style';
import { recommendVideo } from '../../../../../../../network/video';
import { IVideo } from '../../../../../../../constant/video';
import { Image } from 'antd';
import placeholder from '../../../../../../../assets/img/holder/video-placeholder.png';

const RecVideo: FC = (props): ReactElement => {
  const navigate = useNavigate()
  const [video, setVideo] = useState<IVideo[]>([]);
  useEffect(() => {
    recommendVideo<IVideo[]>().then((data) => {
      setVideo(data);
    });
  }, []);
  const videoRouter = (item: IVideo) => {
    navigate('/Home/videoDetail',{
      state: {
        id: item.id
      }
    });
  };
  const userRouter = (item: IVideo) => {
    if (item.type === 1) {
      if ('id' in item.user) {
        navigate('/Home/artistDetail',{
          state: {
            id: item.user.id
          }
        });
      }
    } else if (item.type === 0) {
      if ('userId' in item.user) {
        navigate('/Home/userDetail',{
          state: {
            userId: item.user.userId
          }
        });
      }
    }
  };
  return (
    <RecVideoWrapper>
      {video && Array.isArray(video) && video.length !== 0 && <h3 className="rev-video-title">推荐视频</h3>}
      <ul className="video-list">
        {video &&
          Array.isArray(video) &&
          video.length !== 0 &&
          video.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="img-container" onClick={(e) => videoRouter(item)}>
                  <Image
                    width={110}
                    height={70}
                    src={item.coverUrl + '&w=110'}
                    preview={false}
                    placeholder={<Image preview={false} src={placeholder} width={110} height={70} />}
                  />
                </div>
                <div className="right-msg">
                  <div className="video-name text-nowrap" title={item.name}>
                    {item.name}
                  </div>
                  <div className="creator" onClick={(e) => userRouter(item)}>
                    {item.type === 1 && <span>{'name' in item.user ? item.user.name : 'gb'}</span>}
                    {item.type === 0 && <span>{'userName' in item.user ? item.user.userName : 'gb'}</span>}
                  </div>
                </div>
              </li>
            );
          })}
      </ul>
    </RecVideoWrapper>
  );
};
export default memo(RecVideo);

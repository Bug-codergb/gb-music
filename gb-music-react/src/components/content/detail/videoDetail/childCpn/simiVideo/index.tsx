import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { SimiVideoWrapper } from './style';
import { getSimiVideo } from '../../../../../../network/video';
import { IVideo } from '../../../../../../constant/video';
import SimiItem from '../../../../../common/simiItem';
import { RouteComponentProps, withRouter } from 'react-router-dom';
interface IProps extends RouteComponentProps {
  vid: string;
  id: string; //分类ID
  onClick: (item: IVideo) => void;
}
const SimiVideo: FC<IProps> = memo((props): ReactElement => {
  const { id, vid, onClick } = props;
  const [simiVideo, setSimiVideo] = useState<IVideo[]>([]);
  useEffect(() => {
    getSimiVideo(id).then((data: any) => {
      console.log(data);
      setSimiVideo(data);
    });
  }, [id]);
  const playVideo = (item: IVideo) => {
    onClick(item);
  };
  const userRouter = (item: IVideo) => {
    if (item.type !== undefined) {
      if (item.type === 0) {
        if ('userId' in item.user) {
          props.history.push({
            pathname: '/Home/userDetail',
            state: {
              userId: item.user.userId
            }
          });
        }
      } else {
        if ('id' in item.user) {
          props.history.push({
            pathname: '/Home/artistDetail',
            state: {
              id: item.user.id
            }
          });
        }
      }
    }
  };
  return (
    <SimiVideoWrapper>
      {simiVideo &&
        simiVideo.length !== 0 &&
        simiVideo.map((item, index) => {
          return (
            item.id !== vid && (
              <li key={item.id}>
                <SimiItem
                  itemWidth="130px"
                  userName={'userName' in item.user ? item.user.userName : item.user.name}
                  userId={'userId' in item.user ? item.user.userId : item.user.name}
                  state={
                    <span className="simi-video-state" title={item.name}>
                      {item.name}
                    </span>
                  }
                  img={<img src={item.coverUrl} alt="" onClick={(e) => playVideo(item)} />}
                  dt={item.dt}
                  playCount={item.playCount}
                  onClick={() => userRouter(item)}
                />
              </li>
            )
          );
        })}
    </SimiVideoWrapper>
  );
});
export default withRouter(SimiVideo);

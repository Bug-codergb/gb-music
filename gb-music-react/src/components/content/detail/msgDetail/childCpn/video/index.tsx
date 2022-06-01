import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { VideoWrapper } from './style';
import { deleteMsg, getVideoMsg, readSingleMsg } from '../../../../../../network/message';
import { IUser } from '../../../../../../constant/user';
import { IVideo } from '../../../../../../constant/video';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { Empty, Pagination } from 'antd';
import { changeMsgAction } from '../../../../../common/message/store/actionCreators';
import { changeShow } from '../../../../../common/toast/store/actionCreators';
import { useDispatch } from 'react-redux';
interface IMsgVideo {
  id: string;
  checkout: number;
  createTime: string;
  content: string;
  user: IUser;
  video: IVideo;
}
const Video: FC<RouteComponentProps> = (props): ReactElement => {
  const [count, setCount] = useState<number>(0);
  const [videoMsg, setVideoMsg] = useState<IMsgVideo[]>([]);
  const dispatch = useDispatch();
  useEffect(() => {
    getVideoMsg(`${0}`, `${5}`).then((data: any) => {
      setCount(data.count);
      setVideoMsg(data.message);
    });
  }, []);
  const videoRouter = (item: IMsgVideo) => {
    readSingleMsg(item.id).then((data) => {
      props.history.push({
        pathname: '/Home/videoDetail',
        state: {
          id: item.video.id
        }
      });
    });
  };
  const changePage = (val: number) => {
    getVideoMsg(`${(val - 1) * 5}`, `${5}`).then((data: any) => {
      setCount(data.count);
      setVideoMsg(data.message);
    });
  };
  const deleteMessage = (item: IMsgVideo) => {
    // @ts-ignore
    dispatch(changeMsgAction(true)).then((data) => {
      if (data) {
        deleteMsg(item.id).then((data) => {
          dispatch(changeShow('删除成功', 1500));
          getVideoMsg(`0`, `${5}`).then((data: any) => {
            setCount(data.count);
            setVideoMsg(data.message);
          });
        });
      }
    });
  };
  const userRouter = (item: IUser) => {
    props.history.push({
      pathname: '/Home/userDetail',
      state: {
        userId: item.userId
      }
    });
  };
  return (
    <VideoWrapper>
      <ul className="video-msg-list">
        {videoMsg.length !== 0 &&
          videoMsg.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="video-msg-content">
                  <div className="left-content">
                    <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                    {item.checkout === 0 && <div className="is-read"> </div>}
                    <div className="img-container" onClick={(e) => userRouter(item.user)}>
                      <img src={item.user.avatarUrl} alt={item.user.userName} />
                    </div>
                  </div>
                  <div className="right-content">
                    <div className="video-msg-info">
                      <div className="user-name" onClick={(e) => userRouter(item.user)}>
                        {item.user.userName}
                      </div>
                      <div className="operator">{item.content}</div>
                      <div className="video-name">{item.video.name}</div>
                    </div>
                    <div className="video-cover" onClick={(e) => videoRouter(item)}>
                      <img src={item.video.coverUrl} alt={item.video.name} />
                    </div>
                  </div>
                </div>
                <div className="delete-msg" onClick={(e) => deleteMessage(item)}>
                  <i className="iconfont icon-huishouzhan"> </i>
                </div>
              </li>
            );
          })}
      </ul>
      {count > 5 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={5}
            showTitle={false}
            onChange={(val: number) => changePage(val)}
          />
        </div>
      )}
      {count === 0 && (
        <div className="empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无通知'} />
        </div>
      )}
    </VideoWrapper>
  );
};
export default withRouter(memo(Video));

import React, { memo, FC, ReactElement } from 'react';
import { IUser } from '../../../../../../../constant/user';
import { VideoWrapper } from './style';
import { Empty } from 'antd';
type video = {
  coverUrl: string;
  createTime: string;
  updateTime: string;
  dt: number;
  type: number;
  user: IUser;
  playCount: number;
  description: string;
  id: string;
  name: string;
};
interface IVideos {
  checkout: number;
  content: string;
  id: string;
  createTime: string;
  updateTime: string;
  user: IUser;
  video: video;
}
interface IProps {
  video: IVideos[];
}
const Video: FC<IProps> = (props): ReactElement => {
  const { video } = props;
  return (
    <VideoWrapper>
      <ul className="video-msg-list">
        {video &&
          video.length !== 0 &&
          video.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="symbol"> </div>
                <div className="video-right-msg">
                  <div className="img-container">
                    <img src={item.user.avatarUrl} alt="cover" />
                  </div>
                  <div className="right-msg">
                    <span>{item.user.userName}</span>
                    发布了
                    <span className="video-name">{item.video.name}</span>
                    <div className="cover">
                      <img src={item.video.coverUrl} alt="cover" />
                    </div>
                  </div>
                </div>
              </li>
            );
          })}
      </ul>
      {video.length === 0 && (
        <div className="empty">
          <Empty description="暂无新通知" />
        </div>
      )}
    </VideoWrapper>
  );
};
export default memo(Video);

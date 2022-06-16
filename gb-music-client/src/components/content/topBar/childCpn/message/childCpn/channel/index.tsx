import React, { memo, FC, ReactElement } from 'react';
import { ChannelWrapper } from './style';
import { IUser } from '../../../../../../../constant/user';
import { Empty } from 'antd';
type channel = {
  coverUrl: string;
  createTime: string;
  updateTime: string;
  id: string;
  name: string;
  description: string;
  user: IUser;
};
interface IChannel {
  checkout: number;
  content: string;
  createTime: string;
  updateTime: string;
  user: IUser;
  id: string;
  channel: channel;
}
interface IProps {
  channel: IChannel[];
}
const Channel: FC<IProps> = (props): ReactElement => {
  const { channel } = props;
  return (
    <ChannelWrapper>
      <ul className="channel-list">
        {channel &&
          channel.length !== 0 &&
          channel.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="symbol"> </div>
                <div className="right-channel-msg">
                  <div className="img-container">
                    <img src={item.user.avatarUrl} alt={item.user.userName} />
                  </div>
                  <div className="right-msg">
                    <span>{item.user.userName}</span>发布了
                    <span>{item.channel.name}</span>
                    <div className="cover">
                      <img src={item.channel.coverUrl} alt="cover" />
                    </div>
                  </div>
                </div>
              </li>
            );
          })}
      </ul>
      {channel.length === 0 && (
        <div className="empty">
          <Empty description="暂无新通知" />
        </div>
      )}
    </ChannelWrapper>
  );
};
export default memo(Channel);

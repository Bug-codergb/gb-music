import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { getUserChannelPlaylist } from '../../../../../network/channel';
import { ChannelPlayWrapper } from './style';
import { IChannel } from '../../../../../constant/channel';
import { formatTime } from '../../../../../utils/format';
import { Empty } from 'antd';

interface IChannelPlaylist {
  id: string;
  name: string;
  playCount: string;
  createTime: string;
  dt: string;
  category: IChannel;
}
const ChannelPlay: FC<RouteComponentProps> = (props): ReactElement => {
  const [channel, setChannel] = useState<IChannelPlaylist[]>([]);
  useEffect(() => {
    getUserChannelPlaylist<IChannelPlaylist[]>().then((data) => {
      setChannel(data);
    });
  }, []);
  const channelRouter = (item: IChannelPlaylist) => {
    props.history.push({
      pathname: '/Home/channelDetail',
      state: {
        id: item.category.id
      }
    });
  };
  return (
    <ChannelPlayWrapper>
      <ul className="program-list">
        {channel &&
          channel.length !== 0 &&
          channel.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                <div className="img-container" onClick={(e) => channelRouter(item)}>
                  <img src={item.category.coverUrl} alt={item.category.name} />
                </div>
                <div className="name text-nowrap" onClick={(e) => channelRouter(item)}>
                  {item.name}
                </div>
                <div className="channel-name">{item.category.name}</div>
                <div className="cate">{item.category.channel?.name}</div>
                <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd hh:mm')}</div>
                <div className="play-count">
                  <i className="iconfont icon-play2"> </i>
                  <span>{item.playCount}</span>
                </div>
              </li>
            );
          })}
      </ul>
      {channel && channel.length < 1 && (
        <div className="empty">
          <Empty description={'暂无声音'} />
        </div>
      )}
    </ChannelPlayWrapper>
  );
};
export default withRouter(memo(ChannelPlay));

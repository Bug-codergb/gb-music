import React, { memo, ReactElement, FC, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Empty } from 'antd';
import { CreatedChannelWrapper } from './style';
import { getUserChannel } from '@/network/user';
import { IChannel } from '@/constant/channel';
import { formatTime } from '@/utils/format';
import { Pagination } from 'antd';

interface IProps {
  id: string | undefined;
}
const CreatedChannel: FC<IProps> = (props): ReactElement => {
  const navigate = useNavigate();
  const { id } = props;
  const [channel, setChannel] = useState<IChannel[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    if (id) {
      getUserChannel(id, 0, 5).then((data: any) => {
        setCount(data.count);
        setChannel(data.channel);
      });
    }
  }, [id]);
  const changePage = (val: number) => {
    if (id) {
      getUserChannel(id, (val - 1) * 5, 5).then((data: any) => {
        setCount(data.count);
        setChannel(data.channel);
      });
    }
  };
  const channelRouter = (item: IChannel) => {
    navigate('/Home/channelDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <CreatedChannelWrapper>
      <h2 className="title">Ta创建的电台({count})</h2>
      <ul className="channels">
        {channel.length !== 0 &&
          channel.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="img-container">
                  <img src={item.coverUrl} alt={item.name} onClick={(e) => channelRouter(item)} />
                </div>
                <div className="channel-name" title={item.name} onClick={(e) => channelRouter(item)}>
                  {item.name}
                </div>
                <div className="play-count">播放 {item.playCount}</div>
                <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd')}</div>
              </li>
            );
          })}
      </ul>
      {count > 5 && (
        <div className="page">
          <Pagination defaultCurrent={1} total={count} pageSize={5} onChange={(val) => changePage(val)} />
        </div>
      )}
      {count === 0 && (
        <div className="empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="空空如也" />
        </div>
      )}
    </CreatedChannelWrapper>
  );
};
export default memo(CreatedChannel);

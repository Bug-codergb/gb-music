import React, { memo, FC, ReactElement, useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { ChannelWrapper } from './style';
import { IChannel } from '../../../../../../constant/channel';
import { getUserSub } from '../../../../../../network/user';
import { Empty } from 'antd';
import MsgItem from '../../../../../../components/content/msgItem';
import { holder } from '../../../../../../utils/holder';

const Channel: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [channel, setChannel] = useState<IChannel[]>([]);
  useEffect(() => {
    getUserSub('channel', 0, 50).then((data: any) => {
      setChannel(data);
    });
  }, []);
  const channelRouter = (item: IChannel) => {
    navigate('/Home/channelDetail',{
      state: {
        id: item.id
      }
    });
  };
  const userRouter = (id: string) => {
    navigate('/Home/userDetail',{
      state: {
        userId: id
      }
    });
  };
  return (
    <ChannelWrapper>
      <ul className="channel-list">
        {channel &&
          channel.length !== 0 &&
          channel.map((item, index) => {
            return (
              <li key={item.id}>
                <MsgItem
                  img={
                    <img src={item.coverUrl} alt={item.name} title={item.name} onClick={(e) => channelRouter(item)} />
                  }
                  isShowPlayCount={false}
                  scale={1}
                  state={<span>{item.name}</span>}
                  itemWidth="150px"
                  userName={item.user?.userName}
                  onClick={() => userRouter(item.user?.userId)}
                />
              </li>
            );
          })}
        {channel &&
          holder(channel.length, 7).map((item: number) => {
            return <li key={item}> </li>;
          })}
      </ul>
      {channel && channel.length === 0 && (
        <div className="empty-tip">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="您还未收藏电台" />
        </div>
      )}
    </ChannelWrapper>
  );
};
export default memo(Channel);

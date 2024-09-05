import React, { memo, ReactElement, FC, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {Empty, Image} from 'antd';
import { HotChannelWrapper } from './style';
import { getHotChannel } from '../../../../../../../network/channel';
import placeholder from '../../../../../../../assets/img/holder/music-placeholder.png';
import { IChannel } from '../../../../../../../constant/channel';

const HotChannel: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [channel, setChannel] = useState<IChannel[]>([]);
  useEffect(() => {
    getHotChannel<IChannel[]>().then((data) => {
      setChannel(data);
    });
  }, []);
  const radioRouter = (item: IChannel) => {
    navigate('/Home/channelDetail',{
      state: {
        id: item.id
      }
    });
  };
  const userRouter = (item: IChannel) => {
    navigate('/Home/userDetail',{
      state: {
        userId: item.user.userId
      }
    });
  };
  return (
    <HotChannelWrapper>
      <h3 className="title">热门电台</h3>
      <ul className="hot-channel-list">
        {channel &&
          channel.length !== 0 &&
          channel.map((item: IChannel, index: number) => {
            return (
              <li key={item.id}>
                <div className="left-content">
                  <div className="img-container" onClick={(e) => radioRouter(item)}>
                    <Image
                      width={50}
                      height={50}
                      src={item.coverUrl + '&w=50'}
                      preview={false}
                      placeholder={<Image preview={false} src={placeholder} width={50} height={50} />}
                    />
                  </div>
                  <div className="right-msg">
                    <p className="name text-nowrap" onClick={(e) => radioRouter(item)}>
                      {item.name}
                    </p>
                    <div className="user-channel">
                      <span className="user-name" onClick={(e) => userRouter(item)}>
                        {item.user.userName}
                      </span>
                    </div>
                  </div>
                </div>
                <div className="right-content">
                  <p className="channel-name">{item.channel?.name}</p>
                </div>
              </li>
            );
          })}
        {
          channel && channel.length===0 &&<Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={"暂无热门电台"}/>
        }
      </ul>
    </HotChannelWrapper>
  );
};
export default memo(HotChannel);

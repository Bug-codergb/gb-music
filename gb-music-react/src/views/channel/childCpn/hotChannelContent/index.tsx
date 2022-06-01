/*
@Name guobin
@Description gb-music
@author guobin
@date 2022/4/22
*/
import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { Image } from 'antd';
import { HotChannelContentWrapper } from './style';
import { getHotChannelContent } from '../../../../network/channel';
import placeholder from '../../../../assets/img/holder/placeholder.png';
import { IChannel } from '../../../../constant/channel';

interface ChannelContent {
  id: string;
  name: string;
  channels: IChannel[];
}
const HotChannelContent: FC<RouteComponentProps> = (props): ReactElement => {
  const [channels, setChannels] = useState<ChannelContent[]>([]);
  useEffect(() => {
    getHotChannelContent().then((data: any) => {
      setChannels(data);
    });
  }, []);
  const channelRouter = (item: IChannel) => {
    props.history.push({
      pathname: '/Home/channelDetail',
      state: {
        id: item.id
      }
    });
  };
  return (
    <HotChannelContentWrapper>
      <ul className="channels">
        {channels.length !== 0 &&
          channels.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="title">{item.name}</div>
                <div className="channel-content-list">
                  {item.channels &&
                    item.channels.length !== 0 &&
                    item.channels.map((item, index) => {
                      return (
                        <div className="channel-content">
                          <div className="img-container" onClick={(e) => channelRouter(item)}>
                            <Image
                              width={130}
                              height={130}
                              src={item.coverUrl}
                              preview={false}
                              placeholder={<Image preview={false} src={placeholder} width={130} height={130} />}
                            />
                          </div>
                          <div className="right-msg">
                            <div className="name" onClick={(e) => channelRouter(item)}>
                              {item.name}
                            </div>
                            <div className="desc text-nowrap">{item.description}</div>
                          </div>
                        </div>
                      );
                    })}
                </div>
              </li>
            );
          })}
      </ul>
    </HotChannelContentWrapper>
  );
};
export default withRouter(memo(HotChannelContent));

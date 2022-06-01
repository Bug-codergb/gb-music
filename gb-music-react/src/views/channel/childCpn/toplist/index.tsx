/*
@Name guo'bin
@Description gb-music
@author guo'bin
@date 2021/12/23
*/
import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { ToplistWrapper } from './style';
import ChannelBar from '../../../../components/content/channel';
import { getContent } from '../../../../network/channel';
import { IChannel } from '../../../../constant/channel';
import UserMsg from '../../../../components/common/userMsg';
import { Empty, Image } from 'antd';
import placeholder from '../../../../assets/img/holder/placeholder.png';

interface IProps extends RouteComponentProps {
  id: string;
}
const Toplist: FC<IProps> = (props): ReactElement => {
  const { id } = props;
  const [channel, setChannel] = useState<IChannel[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    if (id) {
      getContent(id, 0, 10).then((data: any) => {
        if (data) {
          setCount(data.count);
          setChannel(data.channel);
        }
      });
    }
  }, [id]);
  const channelRouter = (item: IChannel, index: number) => {
    //console.log(item)
    props.history.push({
      pathname: '/Home/channelDetail',
      state: {
        id: item.id
      }
    });
  };
  const userRouter = (id: string) => {
    props.history.push({
      pathname: '/Home/userDetail',
      state: {
        userId: id
      }
    });
  };
  return (
    <ToplistWrapper>
      <div className="rank">
        <ChannelBar title="电台排行榜" bar={<div className="tip">最热电台</div>} />
      </div>
      <ul className="channel-list">
        {channel.length !== 0 &&
          channel.map((item: IChannel, index: number) => {
            return (
              <li key={item.id}>
                <div className="img-container" onClick={(e) => channelRouter(item, index)}>
                  <Image
                    width={170}
                    height={170}
                    src={item.coverUrl}
                    preview={false}
                    placeholder={<Image preview={false} src={placeholder} width={170} height={170} />}
                  />
                </div>
                <div className="right-msg">
                  <p className="title">{item.name}</p>
                  <UserMsg
                    userId={item.user.userId}
                    userName={item.user.userName}
                    avatarUrl={item.user.avatarUrl}
                    onClick={(id: string) => userRouter(id)}
                    imgWidth="30px"
                  />
                </div>
              </li>
            );
          })}
      </ul>
      {channel.length < 1 && (
        <div className="empty">
          <Empty description="暂无电台" />
        </div>
      )}
    </ToplistWrapper>
  );
};
export default memo(withRouter(Toplist));

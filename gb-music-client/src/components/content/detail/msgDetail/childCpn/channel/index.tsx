import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { ChannelWrapper } from './style';

import { deleteMsg, getChannelMsg, readSingleMsg } from '../../../../../../network/message';
import { IChannel } from '../../../../../../constant/channel';
import { IUser } from '../../../../../../constant/user';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { Empty } from 'antd';
import { useDispatch } from 'react-redux';
import { changeShow } from '../../../../../common/toast/store/actionCreators';
import { changeMsgAction } from '../../../../../common/message/store/actionCreators';

interface IChannelMsg {
  id: string;
  content: string;
  checkout: number;
  createTime: string;
  updateTime: string;
  channel: IChannel;
  user: IUser;
}
const Channel: FC<RouteComponentProps> = (props): ReactElement => {
  const [total, setTotal] = useState<number>(0);
  const [channelMsg, setChannelMsg] = useState<IChannelMsg[]>([]);
  const dispatch = useDispatch();
  useEffect(() => {
    getChannelMsg('0', '15').then((data: any) => {
      setTotal(data.count);
      setChannelMsg(data.message);
    });
  }, []);
  const channelRouter = (item: IChannelMsg) => {
    readSingleMsg(item.id).then((data) => {
      props.history.push({
        pathname: '/Home/channelDetail',
        state: {
          id: item.channel.id
        }
      });
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
  const deleteMessage = (item: IChannelMsg) => {
    // @ts-ignore
    dispatch(changeMsgAction(true)).then((data) => {
      if (data) {
        deleteMsg(item.id).then((data) => {
          dispatch(changeShow('删除成功', 1500));
          getChannelMsg('0', '15').then((data: any) => {
            setTotal(data.count);
            setChannelMsg(data.message);
          });
        });
      }
    });
  };
  return (
    <ChannelWrapper>
      <ul className="video-msg-list">
        {channelMsg.length !== 0 &&
          channelMsg.map((item, index) => {
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
                      <div className="video-name">{item.channel.name}</div>
                    </div>
                    <div className="video-cover" onClick={(e) => channelRouter(item)}>
                      <img src={item.channel.coverUrl} alt={item.channel.name} />
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
      {total === 0 && (
        <div className="empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无通知'} />
        </div>
      )}
    </ChannelWrapper>
  );
};
export default withRouter(memo(Channel));

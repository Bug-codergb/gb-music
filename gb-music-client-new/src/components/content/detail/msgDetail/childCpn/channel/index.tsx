import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { ChannelWrapper } from './style';

import { deleteMsg, getChannelMsg, readSingleMsg } from '../../../../../../network/message';
import { IChannel } from '../../../../../../constant/channel';
import { IUser } from '../../../../../../constant/user';
import { useNavigate } from 'react-router-dom';
import { Empty,message } from 'antd';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts"


interface IChannelMsg {
  id: string;
  content: string;
  checkout: number;
  createTime: string;
  updateTime: string;
  channel: IChannel;
  user: IUser;
}
const Channel: FC = (props): ReactElement => {
  const navigate = useNavigate()
  const [total, setTotal] = useState<number>(0);
  const [channelMsg, setChannelMsg] = useState<IChannelMsg[]>([]);
  const dispatch = useAppDispatch();
  useEffect(() => {
    getChannelMsg('0', '15').then((data: any) => {
      setTotal(data.count);
      setChannelMsg(data.message);
    });
  }, []);
  const channelRouter = (item: IChannelMsg) => {
    readSingleMsg(item.id).then((data) => {
      navigate('/Home/channelDetail',{
        state: {
          id: item.channel.id
        }
      });
    });
  };
  const userRouter = (item: IUser) => {
    navigate('/Home/userDetail',{
      state: {
        userId: item.userId
      }
    });
  };
  const deleteMessage = (item: IChannelMsg) => {
    
    deleteMsg(item.id).then((data) => {
      message.success("删除成功")
      getChannelMsg('0', '15').then((data: any) => {
        setTotal(data.count);
        setChannelMsg(data.message);
      });
    });
    /*dispatch(changeMsgAction(true)).then((data) => {
      if (data) {
        
      }
    });*/
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
export default memo(Channel);

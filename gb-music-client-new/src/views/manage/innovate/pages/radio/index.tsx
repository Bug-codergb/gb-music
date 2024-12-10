import React, { memo, FC, ReactElement, useEffect, useState, MouseEvent } from 'react';
import { useAppSelector } from '@/store/hooks';
import { getAllChannel, getUserChannelCount } from '../../../../../network/channel';
import { useNavigate } from 'react-router-dom';
import { RadioWrapper } from './style';
import { ILogin, IUserMsg } from '../../../../../constant/store/login';

interface IUserChannel {
  id: string;
  name: string;
  count: number;
  channels: { id: string; name: string }[];
}
const Radio: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [channel, setChannel] = useState<{ id: string; name: string; picUrl: string }[]>([]);
  const [userChannel, setUserChannel] = useState<IUserChannel[]>([]);
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer'];
  });
  useEffect(() => {
    getAllChannel().then((data: any) => {
      setChannel(data);
    });
  }, []);
  useEffect(() => {
    getUserChannelCount(userMsg.userId).then((data: any) => {
      setUserChannel(data);
    });
  }, [userMsg.userId]);
  const liClick = (
    e: MouseEvent<HTMLDivElement> | MouseEvent<HTMLSpanElement>,
    item: { id: string; name: string; count?: number },
    index: number
  ) => {
    e.stopPropagation();
    navigate('/innovate/innovateCon', {
      state: {
        id: item.id
      }
    });
  };
  return (
    <RadioWrapper>
      <div className="table-box">
        <ul className="channel-list">
          {channel.length !== 0 &&
            channel.map((item, index) => {
              return (
                <li key={item.id}>
                  <div>
                    <div style={{ backgroundImage: `url(${item.picUrl})` }} className="img-container"></div>
                    <p className="channel-name">{item.name}</p>
                  </div>
                  <div className="right-msg" onClick={(e) => liClick(e, item, index)}>
                    {userChannel
                      .filter((iten, index) => {
                        return iten.id === item.id;
                      })
                      .map((it, index) => {
                        return (
                          <span className="msg" key={it.id} onClick={(e) => liClick(e, it, index)}>
                            共有{it.count}个声音
                          </span>
                        );
                      })}
                  </div>
                </li>
              );
            })}
        </ul>
      </div>
    </RadioWrapper>
  );
};
export default memo(Radio);

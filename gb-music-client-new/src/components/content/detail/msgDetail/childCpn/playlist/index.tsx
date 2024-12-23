import React, { memo, FC, ReactElement, useState, useEffect } from 'react';
import { PlaylistWrapper } from './style';
import { IPlaylist } from '../../../../../../constant/playlist';
import { IUser } from '../../../../../../constant/user';
import { deleteMsg, getPlaylistMsg, readSingleMsg } from '../../../../../../network/message';
import { useNavigate } from 'react-router-dom';
import { Empty,message } from 'antd';

import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts"
interface IPlayMsg {
  id: string;
  content: string;
  createTime: string;
  updateTime: string;
  checkout: number;
  playlist: IPlaylist;
  user: IUser;
}
const Playlist: FC = (props): ReactElement => {
  const navigate = useNavigate()
  const [total, setTotal] = useState<number>(0);
  const [playMsg, setPlayMsg] = useState<IPlayMsg[]>([]);
  const dispatch = useAppDispatch();
  useEffect(() => {
    getPlaylistMsg('0', '15').then((data: any) => {
      setTotal(data.count);
      setPlayMsg(data.message);
    });
  }, []);
  const playlistRouter = (item: IPlayMsg) => {
    readSingleMsg(item.id).then((data) => {
      navigate('/Home/playlistDetail',{
        state: {
          id: item.playlist.id
        }
      });
    });
  };
  const deleteMessage = (item: IPlayMsg) => {
    deleteMsg(item.id).then((data) => {
      message.success('删除成功');
      getPlaylistMsg('0', '15').then((data: any) => {
        setTotal(data.count);
        setPlayMsg(data.message);
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
  return (
    <PlaylistWrapper>
      <ul className="video-msg-list">
        {playMsg &&
          playMsg.length !== 0 &&
          playMsg.map((item, index) => {
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
                      <div className="video-name">{item.playlist.name}</div>
                    </div>
                    <div className="video-cover-desc">
                      <div className="video-cover" onClick={(e) => playlistRouter(item)}>
                        <img src={item.playlist.coverUrl} alt={item.playlist.name} />
                      </div>
                      <div className="desc">{item.playlist.description}</div>
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
    </PlaylistWrapper>
  );
};
export default memo(Playlist);

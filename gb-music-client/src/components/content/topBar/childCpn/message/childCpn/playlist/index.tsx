import React, { memo, FC, ReactElement } from 'react';
import { PlaylistWrapper } from './style';
import { IUser } from '../../../../../../../constant/user';
import { Empty } from 'antd';
type playlist = {
  coverUrl: string;
  createTime: string;
  updateTime: string;
  id: string;
  name: string;
  playCount: number;
  user: IUser;
};
interface IPlaylist {
  checkout: number;
  content: string;
  createTime: string;
  updateTime: string;
  id: string;
  user: IUser;
  playlist: playlist;
}
interface IProps {
  playlist: IPlaylist[];
}
const Playlist: FC<IProps> = (props): ReactElement => {
  const { playlist } = props;
  return (
    <PlaylistWrapper>
      <ul className="playlist-msg-list">
        {playlist &&
          playlist.length !== 0 &&
          playlist.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="symbol"> </div>
                <div className="playlist-right-msg">
                  <div className="img-container">
                    <img src={item.user.avatarUrl} alt={item.user.userName} />
                  </div>
                  <div className="right-msg">
                    <span>{item.user.userName}</span>
                    发布了
                    <span>{item.playlist.name}</span>
                    <div className="cover">
                      <img src={item.playlist.coverUrl} alt="cover" />
                    </div>
                  </div>
                </div>
              </li>
            );
          })}
      </ul>
      {playlist.length === 0 && (
        <div className="empty">
          <Empty description="暂无新通知" />
        </div>
      )}
    </PlaylistWrapper>
  );
};
export default memo(Playlist);

import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { Empty } from 'antd';

import { PlaylistWrapper } from './style';
import { IPlaylist } from '../../../../../../constant/playlist';
import MsgItem from '../../../../../../components/content/msgItem';
import { useNavigate } from 'react-router-dom';
import { getUserSubPlaylist } from '../../../../../../network/user';
import { useAppSelector } from '@/store/hooks';
import { holder } from '../../../../../../utils/holder';
import { ILogin, IUserMsg } from '../../../../../../constant/store/login';

const Playlist: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [playlist, setPlaylist] = useState<IPlaylist[]>([]);
  const { userMsg } = useAppSelector((state) => {
    return  state['loginReducer']
  });
  useEffect(() => {
    getUserSubPlaylist(userMsg.userId, 0, 50).then((data: any) => {
      setPlaylist(data.playlist);
    });
  }, [userMsg.userId]);
  const playlistRouter = (item: IPlaylist) => {
    navigate('/Home/playlistDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <PlaylistWrapper>
      <ul className="sub-playlist">
        {playlist &&
          playlist.length !== 0 &&
          playlist.map((item, index) => {
            return (
              <li key={item.id}>
                <MsgItem
                  img={<img src={item.coverUrl} alt="" title={item.name} onClick={(e) => playlistRouter(item)} />}
                  state={<span>{item.name}</span>}
                  itemWidth="150px"
                  isShowPlayCount={true}
                  playCount={item.playCount}
                  scale={1}
                />
              </li>
            );
          })}
        {playlist &&
          holder(playlist.length, 7).map((item: number) => {
            return <li key={item}> </li>;
          })}
      </ul>
      {playlist && playlist.length === 0 && (
        <div className="empty-tip">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="您还未收藏专辑" />
        </div>
      )}
    </PlaylistWrapper>
  );
};
export default memo(Playlist);

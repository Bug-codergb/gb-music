import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Empty, Pagination } from 'antd';
import { CreatedPlaylistWrapper } from './style';
import { getUserPlaylist } from '../../../../../../network/playlist';
import { IPlaylist } from '../../../../../../constant/playlist';
import { holder } from '../../../../../../utils/holder';

interface IProps {
  id: string | undefined;
}
const CreatedPlaylist: FC<IProps> = (props): ReactElement => {
  const navigate = useNavigate();

  const { id } = props;
  const [playlist, setPlaylist] = useState<IPlaylist[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    if (id) {
      getUserPlaylist(id, 0, 8).then((data: any) => {
        setCount(data.count);
        setPlaylist(data.playlist);
      });
    }
  }, [id]);
  const changePage = (val: number) => {
    if (id) {
      getUserPlaylist(id, (val - 1) * 8, 8).then((data: any) => {
        setCount(data.count);
        setPlaylist(data.playlist);
      });
    }
  };
  const playlistRouter = (item: IPlaylist) => {
    navigate('/Home/playlistDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <CreatedPlaylistWrapper>
      <h2 className="title">Ta创建的歌单({count})</h2>
      <ul className="play-list">
        {playlist.length !== 0 &&
          playlist.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="img-container" title={item.name}>
                  <img src={item.coverUrl} alt={item.name} onClick={(e) => playlistRouter(item)} />
                </div>
                <div className="playlist-name" onClick={(e) => playlistRouter(item)}>
                  {item.name}
                </div>
                <div className="play-count">
                  <i className="iconfont icon-play"> </i>
                  <span>{item.playCount}</span>
                </div>
                <div className="song-count">{item.count}首歌</div>
              </li>
            );
          })}
        {playlist &&
          holder(playlist.length, 5).map((item: number) => {
            return <li key={item}> </li>;
          })}
      </ul>
      {count > 8 && (
        <div className="page">
          <Pagination defaultCurrent={1} total={count} pageSize={8} onChange={(val) => changePage(val)} />
        </div>
      )}
      {count === 0 && (
        <div className="empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="空空如也" />
        </div>
      )}
    </CreatedPlaylistWrapper>
  );
};
export default memo(CreatedPlaylist);

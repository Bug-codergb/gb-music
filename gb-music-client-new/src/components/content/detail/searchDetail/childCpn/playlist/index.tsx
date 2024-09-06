import React, { memo, FC, ReactElement } from 'react';
import { useNavigate } from 'react-router-dom';

import { Empty } from 'antd';
import { useSelector } from 'react-redux';
import { PlaylistWrapper } from './style';
import { IPlaylist } from '../../../../../../constant/playlist';
import { formatTime } from '../../../../../../utils/format';
import { ISearchStore } from '../../../../../../constant/store/search';

const Playlist: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const { playlist } = useSelector((state) => {
    return state.getIn(['searchReducer', 'searchResult']);
  });
  const playlistRouter = (item: IPlaylist, index: number) => {
    navigate('/Home/playlistDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <PlaylistWrapper>
      {playlist.length !== 0 &&
        playlist.map((item: IPlaylist, index: number) => {
          return (
            <li key={item.id}>
              <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
              <div className="img-container" onClick={(e) => playlistRouter(item, index)}>
                <img src={item.coverUrl} alt="歌单" />
              </div>
              <div className="name" onClick={(e) => playlistRouter(item, index)}>
                {item.name}
              </div>
              <div className="createTime">{formatTime(item.createTime, 'yyyy-MM-dd')}</div>
              {item.user && <div className="creator">{item.user.userName}</div>}
            </li>
          );
        })}
      {playlist.length === 0 && (
        <div
          style={{
            height: '350px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center'
          }}
        >
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无歌单'} />
        </div>
      )}
    </PlaylistWrapper>
  );
};
export default memo(Playlist);

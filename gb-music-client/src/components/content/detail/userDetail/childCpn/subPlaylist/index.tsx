import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { SubPlaylistWrapper } from './style';
import { getUserSubPlaylist } from '../../../../../../network/user';
import { IPlaylist } from '../../../../../../constant/playlist';
import { holder } from '../../../../../../utils/holder';
import { Empty, Pagination } from 'antd';

interface IProps extends RouteComponentProps {
  userId?: string;
}
const SubPlaylist: FC<IProps> = (props): ReactElement => {
  const { userId } = props;
  const [subPlaylist, setSubPlaylist] = useState<IPlaylist[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    if (userId) {
      getUserSubPlaylist<{ count: number; playlist: IPlaylist[] }>(userId, 0, 8).then((data) => {
        setCount(data.count);
        setSubPlaylist(data.playlist);
      });
    }
  }, [userId]);
  const changePage = (val: number) => {
    if (userId) {
      getUserSubPlaylist(userId, (val - 1) * 8, 8).then((data: any) => {
        setCount(data.count);
        setSubPlaylist(data.playlist);
      });
    }
  };
  const playlistRouter = (item: IPlaylist) => {
    props.history.push({
      pathname: '/Home/playlistDetail',
      state: {
        id: item.id
      }
    });
  };
  return (
    <SubPlaylistWrapper>
      <h2 className="title">Ta收藏的歌单({count})</h2>
      <ul className="sub-playlist">
        {subPlaylist.length !== 0 &&
          subPlaylist.map((item, index) => {
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
        {subPlaylist &&
          holder(subPlaylist.length, 4).map((item: number) => {
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
    </SubPlaylistWrapper>
  );
};
export default withRouter(memo(SubPlaylist));

import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { Empty } from 'antd';
import { Map } from 'immutable';
import { PlaylistWrapper } from './style';
import { IPlaylist } from '../../../../../../constant/playlist';
import MsgItem from '../../../../../../components/content/msgItem';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { getUserSubPlaylist } from '../../../../../../network/user';
import { useSelector } from 'react-redux';
import { holder } from '../../../../../../utils/holder';
import { ILogin, IUserMsg } from '../../../../../../constant/store/login';

const Playlist: FC<RouteComponentProps> = (props): ReactElement => {
  const [playlist, setPlaylist] = useState<IPlaylist[]>([]);
  const { userMsg } = useSelector<Map<string, ILogin>, { userMsg: IUserMsg }>((state) => {
    return {
      userMsg: state.getIn(['loginReducer', 'login', 'userMsg'])
    };
  });
  useEffect(() => {
    getUserSubPlaylist(userMsg.userId, 0, 30).then((data: any) => {
      setPlaylist(data.playlist);
    });
  }, [userMsg.userId]);
  const playlistRouter = (item: IPlaylist) => {
    props.history.push({
      pathname: '/Home/playlistDetail',
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
export default withRouter(memo(Playlist));

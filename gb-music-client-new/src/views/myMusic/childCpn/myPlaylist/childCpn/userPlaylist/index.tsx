//用户歌单
import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { Empty } from 'antd';

import { useNavigate } from 'react-router-dom';
import { useAppSelector } from '@/store/hooks';
import { getUserPlaylist } from '../../../../../../network/playlist';

//组件
import MsgItem from '../../../../../../components/content/msgItem';
//样式
import { UserPlaylistWrapper } from './style';
import { holder } from '../../../../../../utils/holder';
import { ILogin, IUserMsg } from '../../../../../../constant/store/login';

interface IPlaylist {
  id: string;
  creatTime: string;
  name: string;
  playCount: number;
  updateTime: string;
  coverUrl: string;
}
const UserPlaylist: FC = memo((props): ReactElement => {
  const navigate = useNavigate()
  const [userPlaylist, setUserPlay] = useState<IPlaylist[]>([]);
  //redux-hook
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  useEffect(() => {
    getUserPlaylist(userMsg.userId, 0, 30).then((data: any) => {
      if (data && data.playlist !== 0) {
        setUserPlay(data.playlist);
      }
    });
  }, [userMsg.userId]);
  const playlistRouter = (item: IPlaylist, index: number) => {
    navigate('/Home/playlistDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <UserPlaylistWrapper>
      <ul className="play-list">
        {userPlaylist.length !== 0 &&
          userPlaylist.map((item, index) => {
            return (
              <li key={item.id} className="play-list-item">
                <MsgItem
                  img={<img src={item.coverUrl} alt="" onClick={(e) => playlistRouter(item, index)} />}
                  state={<span>{item.name}</span>}
                  playCount={item.playCount}
                  isShowPlayCount={true}
                  itemWidth="150px"
                  scale={1}
                />
              </li>
            );
          })}
        {userPlaylist &&
          holder(userPlaylist.length, 7).map((item: number) => {
            return <li key={item}> </li>;
          })}
      </ul>
      {userPlaylist.length === 0 && (
        <div className="empty-tip">
          <Empty description="暂无歌单" />
        </div>
      )}
    </UserPlaylistWrapper>
  );
});
export default UserPlaylist;

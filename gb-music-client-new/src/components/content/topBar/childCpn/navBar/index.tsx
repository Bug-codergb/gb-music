import React, { memo, useEffect, useState } from 'react';
import { useAppSelector } from '@/store/hooks';
import { BarsOutlined } from '@ant-design/icons';

import { useNavigate } from 'react-router-dom';
import { useLocation } from 'react-router';
import { navList } from '@/constant/NavList';
import { NavBarWrapper } from './style';
import { navListType } from '@/constant/NavList';
import { myMusic } from '@/constant/myMusic';
import { IPlaylist } from '@/constant/playlist';
import { getUserSubPlaylist } from '@/network/user';

const NavBar: React.FC = (props) => {
  const navigate = useNavigate();
  const [currentIndex, setCurrentIndex] = useState(0);
  const pathname = useLocation().pathname;
  const liClick = (item: navListType, index: number) => {
    setCurrentIndex(index);
    navigate(item.path);
  };
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer'];
  });
  const [userPlaylist, setUserPlaylist] = useState<IPlaylist[]>([]);
  useEffect(() => {
    getUserSubPlaylist(userMsg.userId, 0, 30).then((res: any) => {
      setUserPlaylist(res.playlist);
    });
  }, [userMsg]);
  const playlistClick = (item: IPlaylist, index: number) => {
    setCurrentIndex(index);
    navigate(`/Home/playlist/${item.id}`);
  };
  return (
    <NavBarWrapper>
      <ul className="nav-list">
        {navList &&
          navList.map((item, index: number) => {
            return (
              <li
                key={item.name}
                onClick={(e) => liClick(item, index)}
                className={currentIndex === index ? 'active' : ''}
              >
                <div className="nav-icon">{item.icon}</div>
                <span className="nav-name">{item.name}</span>
              </li>
            );
          })}
        <p className="nav-label">我的音乐</p>
      </ul>
      <ul className="nav-list">
        {myMusic &&
          myMusic.map((item, index: number) => {
            return (
              <li
                key={item.name}
                onClick={(e) => liClick(item, index + navList.length)}
                className={currentIndex === index + navList.length ? 'active' : ''}
              >
                <div className={'nav-icon'}>{item.icon}</div>
                <span className="nav-name">{item.name}</span>
              </li>
            );
          })}
        <p className="nav-label">收藏的歌单</p>
      </ul>
      <ul className="nav-list">
        {userPlaylist.map((item, index) => {
          return (
            <li
              key={item.id}
              onClick={(e) => playlistClick(item, index + myMusic.length + navList.length)}
              className={currentIndex === index + myMusic.length + navList.length ? 'active' : ''}
            >
              <div className={'nav-icon'}>
                <BarsOutlined />
              </div>
              <span className="nav-name">{item.name}</span>
            </li>
          );
        })}
      </ul>
    </NavBarWrapper>
  );
};
export default memo(NavBar);

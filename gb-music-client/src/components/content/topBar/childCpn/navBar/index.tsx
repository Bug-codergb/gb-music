import React, { memo, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { useLocation } from 'react-router';
import { navList } from '../../../../../constant/NavList';
import { NavBarWrapper } from './style';
import { navListType } from '../../../../../constant/NavList';
import {myMusic} from "../../../../../constant/myMusic";

const NavBar: React.FC<RouteComponentProps> = (props) => {
  const [currentIndex, setCurrentIndex] = useState(0);
  const pathname = useLocation().pathname;
  const liClick = (item: navListType, index: number) => {
    setCurrentIndex(index);
    props.history.push({
      pathname: item.path
    });
  };
  return (
    <NavBarWrapper>
      <ul className="nav-list">
        {navList && navList.map((item, index: number) => {
          return (
            <li
              key={item.name}
              onClick={(e) => liClick(item, index)}
              className={currentIndex === index ? 'active' : ''}
            >
              <i className={'nav-icon '+item.icon}> </i>
              <span className="nav-name">{item.name}</span>
            </li>
          );
        })}
        <p className="nav-label">我的音乐</p>
      </ul>
      <ul className="nav-list">
        {myMusic && myMusic.map((item, index: number) => {
          return (
            <li
              key={item.name}
              onClick={(e) => liClick(item, index+navList.length)}
              className={currentIndex === index+navList.length ? 'active' : ''}
            >
              <i className={'nav-icon '+item.icon+` ${item.name==='我的收藏'?'icon-sub':''}`}> </i>
              <span className="nav-name">{item.name}</span>
            </li>
          );
        })}
      </ul>
    </NavBarWrapper>
  );
};
export default withRouter(memo(NavBar));

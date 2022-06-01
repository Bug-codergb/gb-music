import React, { memo, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { useLocation } from 'react-router';
import { navList } from '../../../../../constant/NavList';
import { NavBarWrapper } from './style';
import { navListType } from '../../../../../constant/NavList';

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
        {navList.map((item, index: number) => {
          return (
            <li
              key={item.name}
              onClick={(e) => liClick(item, index)}
              className={currentIndex === index ? 'active' : ''}
            >
              {item.name}
            </li>
          );
        })}
      </ul>
    </NavBarWrapper>
  );
};
export default withRouter(memo(NavBar));

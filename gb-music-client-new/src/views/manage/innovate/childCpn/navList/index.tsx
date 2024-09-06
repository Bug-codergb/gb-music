import React, { memo, FC, ReactElement, useState } from 'react';
import { useNavigate } from 'react-router-dom';

import navlist from './constant/index';
import { NavListWrapper } from './style';

const NavList: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const [liveIndex, setLiveIndex] = useState<number>(0);
  const liClick = (item: { name: string; path: string }, i: number, index: number) => {
    setCurrentIndex(index);
    setLiveIndex(i);
    navigate(item.path);
  };
  const btnClick = () => {
    navigate('/innovate/publish');
  };
  return (
    <NavListWrapper>
      <button className="publish" onClick={(e) => btnClick()}>
        发布作品
      </button>
      {navlist.map((item, index) => {
        return (
          <div key={item.title}>
            <div className="title">
              <i className={`iconfont ${item.font}`}> </i>
              {item.title}
            </div>
            <ul>
              {item.list.map((item, i) => {
                return (
                  <li
                    key={item.name}
                    className={`nav-item ${currentIndex === index && liveIndex === i ? 'active' : ''}`}
                    onClick={(e) => liClick(item, i, index)}
                  >
                    {item.name}
                  </li>
                );
              })}
            </ul>
          </div>
        );
      })}
    </NavListWrapper>
  );
};
export default memo(NavList);

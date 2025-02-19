import React, { memo, useState,useEffect } from 'react';
import { useNavigate, Outlet ,useLocation} from 'react-router-dom';

import { DiscoverWrapper } from './style';
import { disCoverList, navListType } from '../../constant/NavList';


const Discover = () => {
  const navigate = useNavigate()
  const location = useLocation();

  useEffect(()=>{
    console.log(location)
    const index = disCoverList.findIndex((item)=>item.path === location.pathname)
    
    index!==-1 && setCurrentIndex(index);
  },[location.pathname])

  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: navListType, index: number): void => {
    setCurrentIndex(index);
    navigate(item.path)
  };
  return (
    <DiscoverWrapper>
      <div className="list-outer">
        <ul className="discover-list">
          {disCoverList.length !== 0 &&
            disCoverList.map((item, index) => {
              return (
                <li
                  key={item.path}
                  onClick={(e) => liClick(item, index)}
                  className={currentIndex === index ? 'active' : ''}
                >
                  <span>{item.name}</span>
                </li>
              );
            })}
        </ul>
      </div>
      <div className={'discover-content'}>
        <Outlet/>
      </div>
    </DiscoverWrapper>
  );
};
export default memo(Discover);

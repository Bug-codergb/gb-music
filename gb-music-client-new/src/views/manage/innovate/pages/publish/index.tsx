import React, { memo, FC, ReactElement, useState,useEffect } from 'react';

import { PublishWrapper } from './style';
import { path } from './constant';
import { Outlet, useNavigate ,useLocation} from 'react-router-dom';

const Publish: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const location = useLocation();
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: { name: string; path: string }, index: number) => {
    setCurrentIndex(index);

    navigate(item.path);
  };
  useEffect(()=>{
    const index = path.findIndex((item)=>item.path === location.pathname)
    index!==-1 && setCurrentIndex(index)
  },[location.pathname])
  return (
    <PublishWrapper>
      <div className="table-box">
        <ul className="path">
          {path.map((item, index) => {
            return (
              <li key={item.name} className="path-item" onClick={(e) => liClick(item, index)}>
                <span className={`${currentIndex === index ? 'active' : ''}`}>{item.name}</span>
              </li>
            );
          })}
        </ul>
        <div className="publish-content">
          <Outlet />
        </div>
      </div>
    </PublishWrapper>
  );
};
export default memo(Publish);

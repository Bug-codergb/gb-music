import React, { memo, FC, ReactElement, useState } from 'react';

import { PublishWrapper } from './style';
import { path } from './constant';
import { Outlet, useNavigate } from 'react-router-dom';

const Publish: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: { name: string; path: string }, index: number) => {
    setCurrentIndex(index);

      navigate(item.path);

  };
  return (
    <PublishWrapper>
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
        <Outlet/>
      </div>
    </PublishWrapper>
  );
};
export default memo(Publish);

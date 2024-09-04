import React, { memo, FC, ReactElement, useState } from 'react';
import { CenterContentWrapper, MsgDetailWrapper } from './style';
import navList from '../../../../constant/message/navList';

import { useNavigate ,Outlet} from 'react-router-dom';

const MsgDetail: FC = (props): ReactElement => {
  const navigate = useNavigate()
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: { name: string; path: string }, index: number) => {
    setCurrentIndex(index);
    navigate(item.path);

  };
  return (
    <MsgDetailWrapper>
      <CenterContentWrapper>
        <ul className="msg-nav-list">
          {navList.map((item, index) => {
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
        <div className="msg-detail-content">
          <Outlet/>
        </div>
      </CenterContentWrapper>
    </MsgDetailWrapper>
  );
};
export default memo(MsgDetail);

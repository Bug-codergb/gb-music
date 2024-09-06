import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { getAllChannel } from '../../../../network/channel';

import { NavWrapper } from './style';
interface IProps {
  navClick: (item: { id: string; name: string }, index: number) => void;
}
const Nav: FC<IProps> = (props): ReactElement => {
  const { navClick } = props;
  const [channel, setChannel] = useState<{ id: string; name: string; picUrl: string }[]>([]);
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  useEffect(() => {
    getAllChannel().then((data: any) => {
      setChannel(data);
    });
  }, []);
  const liClick = (item: { id: string; name: string }, index: number) => {
    setCurrentIndex(index);
    navClick(item, index);
  };
  return (
    <NavWrapper>
      <ul className="channel-list">
        {channel.length !== 0 &&
          channel.map((item, index) => {
            return (
              <li
                key={item.id}
                onClick={(e) => liClick(item, index)}
                className={`${currentIndex === index ? 'active' : ''}`}
              >
                <div className={`img-container`} style={{ backgroundImage: `url(${item.picUrl})` }}>
                  {' '}
                </div>
                <p className="title">{item.name}</p>
              </li>
            );
          })}
      </ul>
    </NavWrapper>
  );
};
export default memo(Nav);

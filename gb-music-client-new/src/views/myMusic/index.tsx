import React, { memo, FC, ReactElement, useState } from 'react';
import { RouteComponentProps } from 'react-router-dom';
import { myMusic } from '../../constant/myMusic';
import { navListType } from '../../constant/NavList';
import { MyMusicWrapper } from './style';
import { renderRoutes } from 'react-router-config';

interface Iprops extends RouteComponentProps {
  route: any;
}
const MyMusic: FC<Iprops> = (Iprops): ReactElement => {
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liCLick = (item: navListType, index: number): void => {
    setCurrentIndex(index);
    Iprops.history.push({
      pathname: item.path
    });
  };
  return (
    <MyMusicWrapper>
      <div className="my-music-list-outer">
        {/*<ul className="my-music-list center-content">
          {myMusic.map((item: navListType, index: number) => {
            return (
              <li
                key={item.name}
                onClick={(e) => liCLick(item, index)}
                className={currentIndex === index ? 'active' : ''}
              >
                <span>{item.name}</span>
              </li>
            );
          })}
        </ul>*/}
      </div>
      {/*<div className="my-music-content center-content">{renderRoutes(Iprops.route.routes)}</div>*/}
    </MyMusicWrapper>
  );
};
export default memo(MyMusic);

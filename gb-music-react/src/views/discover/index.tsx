import React, { memo, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { renderRoutes } from 'react-router-config';
import { DiscoverWrapper } from './style';
import { disCoverList, navListType } from '../../constant/NavList';

interface IProps extends RouteComponentProps {
  route: any;
}
const Discover: React.FC<IProps> = (props) => {
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: navListType, index: number): void => {
    setCurrentIndex(index);
    props.history.push({
      pathname: item.path
    });
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
      <div>{renderRoutes(props.route.routes)}</div>
    </DiscoverWrapper>
  );
};
export default withRouter(memo(Discover));

import React, { memo, FC, ReactElement, useState } from 'react';
import { RouteComponentProps } from 'react-router-dom';
import { PublishWrapper } from './style';
import { path } from './constant';
import { renderRoutes } from 'react-router-config';
interface IProps extends RouteComponentProps {
  route: any;
}
const Publish: FC<IProps> = (props): ReactElement => {
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: { name: string; path: string }, index: number) => {
    setCurrentIndex(index);
    console.log(item.path);
    props.history.push({
      pathname: item.path
    });
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
      <div className="publish-content">{renderRoutes(props.route.routes)}</div>
    </PublishWrapper>
  );
};
export default memo(Publish);

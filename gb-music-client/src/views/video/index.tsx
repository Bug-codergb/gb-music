import React, { memo, FC, ReactElement, useState } from 'react';
import { renderRoutes } from 'react-router-config';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { VideoWrapper } from './style';
interface IProps extends RouteComponentProps {
  route: any;
}

const Video: FC<IProps> = (props): ReactElement => {
  const list: string[] = ['视频', 'MV'];
  const path: string[] = ['/Home/video/vision', '/Home/video/mv'];
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: string, index: number) => {
    setCurrentIndex(index);
    props.history.push({
      pathname: path[index]
    });
  };
  return (
    <VideoWrapper>
      <div className="video-content">
        <ul className="video-nav-list">
          {list.map((item, index) => {
            return (
              <li key={item} onClick={(e) => liClick(item, index)} className={currentIndex === index ? 'active' : ''}>
                <span>{item}</span>
              </li>
            );
          })}
        </ul>
        <div className="body-content">{renderRoutes(props.route.routes)}</div>
      </div>
    </VideoWrapper>
  );
};
export default withRouter(memo(Video));

import React, { memo, FC, ReactElement, useState } from 'react';
import { renderRoutes } from 'react-router-config';
import { useNavigate, Outlet } from 'react-router-dom';
import { VideoWrapper } from './style';
interface IProps  {

}

const Video: FC<IProps> = (props): ReactElement => {
  const navigate = useNavigate()
  const list: string[] = ['视频', 'MV'];
  const path: string[] = ['/Home/video/vision', '/Home/video/mv'];
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: string, index: number) => {
    setCurrentIndex(index);
    navigate(path[index])
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
        <div className="body-content">
          <Outlet/>
        </div>
      </div>
    </VideoWrapper>
  );
};
export default memo(Video);

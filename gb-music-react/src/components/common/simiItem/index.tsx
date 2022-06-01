import React, { memo, FC, ReactElement } from 'react';
import { SimiItemWrapper } from './style';
import { formatTime } from '../../../utils/format';
interface IProps {
  playCount?: number;
  dt?: number;
  itemWidth: string;
  userName: string;
  userId: string;
  state: ReactElement;
  img: ReactElement;
  onClick?: () => void;
}
const SimiItem: FC<IProps> = memo((props): ReactElement => {
  const { playCount, dt, itemWidth, userName, state, img, onClick } = props;
  const userRouter = () => {
    if (onClick) {
      onClick();
    }
  };
  return (
    <SimiItemWrapper itemWidth={itemWidth}>
      <div className="img-container">
        {img}
        {playCount !== undefined && (
          <span className="play-count">
            <i className="iconfont icon-play"> </i>
            {playCount}
          </span>
        )}
        {dt && <span className="dt">{formatTime(dt, 'mm:ss')}</span>}
      </div>
      <div className="msg ">
        <div className="simi-state text-nowrap">{state}</div>
        <div className="user-name text-nowrap" title={userName} onClick={(e) => userRouter()}>
          by {userName}
        </div>
      </div>
    </SimiItemWrapper>
  );
});
export default SimiItem;

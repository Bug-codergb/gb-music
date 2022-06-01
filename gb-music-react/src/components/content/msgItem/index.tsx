import React, { memo, FC, ReactElement } from 'react';
//样式
import { MsgItemWrapper } from './style';
import { formatTime } from '../../../utils/format';
interface IProps {
  img: ReactElement;
  state: ReactElement;
  playCount?: number;
  isShowPlayCount: boolean;
  itemWidth: string;
  scale: number;
  dt?: number;
  userName?: string;
  cover?: ReactElement;
  onClick?: () => void;
}
const MsgItem: FC<IProps> = ({
  img,
  state,
  playCount,
  isShowPlayCount,
  itemWidth,
  scale,
  dt,
  userName,
  cover,
  onClick
}): ReactElement => {
  const userRouter = () => {
    if (onClick) {
      onClick();
    }
  };
  return (
    <MsgItemWrapper widthProps={itemWidth} scale={scale}>
      <div className="img-container">
        {cover}
        {img}
        {dt && <div className="dt">{formatTime(dt, 'mm:ss')}</div>}
      </div>
      <div className="state text-nowrap">{state}</div>
      <div className="play-count">
        {isShowPlayCount && <i className="iconfont icon-play"> </i>}
        {playCount}
      </div>
      {userName && (
        <div className="user-name" onClick={(e) => userRouter()}>
          {userName}
        </div>
      )}
    </MsgItemWrapper>
  );
};
export default memo(MsgItem);

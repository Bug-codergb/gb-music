import React, { memo, FC, ReactElement } from 'react';
import { ChannelWrapper } from './style';
interface IData {
  playCount?: number;
  comment?: number;
  count: number;
}
const Channel: FC<IData> = (props): ReactElement => {
  const { playCount, comment, count } = props;
  return (
    <ChannelWrapper>
      <ul className="data-list">
        <li>
          <div className="name">总声音数</div>
          <div className="value">{count}</div>
        </li>
        <li>
          <div className="name">总播放数</div>
          <div className="value">{playCount}</div>
        </li>
        <li>
          <div className="name">总评论数</div>
          <div className="value">{comment}</div>
        </li>
      </ul>
    </ChannelWrapper>
  );
};
export default memo(Channel);

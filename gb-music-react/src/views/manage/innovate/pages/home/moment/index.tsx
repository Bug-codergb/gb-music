import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { MomentWrapper } from './style';
import { getUserMomentData } from '../../../../../../network/user';

const Moment: FC = (): ReactElement => {
  const [data, setData] = useState<{ count: number; thumb: number; comment: number }>();
  useEffect(() => {
    getUserMomentData().then((data: any) => {
      setData(data);
    });
  }, []);
  return (
    <MomentWrapper>
      <ul className="data-list">
        <li>
          <div className="name">总动态数</div>
          <div className="value">{data?.count}</div>
        </li>
        <li>
          <div className="name">总点赞数</div>
          <div className="value">{data?.thumb}</div>
        </li>
        <li>
          <div className="name">总评论数</div>
          <div className="value">{data?.comment}</div>
        </li>
      </ul>
    </MomentWrapper>
  );
};
export default memo(Moment);

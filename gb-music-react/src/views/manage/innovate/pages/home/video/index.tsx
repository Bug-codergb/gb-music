import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { VideoDataWrapper } from './style';
import { getVioData } from '../../../../../../network/manage/video';
interface DataType {
  playCount: number;
  thumb: number;
  comment: number;
  video: number;
}
const VideoData: FC = (): ReactElement => {
  const [data, setData] = useState<DataType>();
  useEffect(() => {
    getVioData().then((data: any) => {
      setData(data);
    });
  }, []);
  return (
    <VideoDataWrapper>
      <ul className="data-list">
        <li>
          <div className="name">总视频数</div>
          <div className="value">{data?.video}</div>
        </li>
        <li>
          <div className="name">总播放数</div>
          <div className="value">{data?.playCount}</div>
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
    </VideoDataWrapper>
  );
};
export default memo(VideoData);

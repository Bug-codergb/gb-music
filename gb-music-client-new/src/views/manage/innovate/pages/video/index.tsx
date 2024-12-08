import React, { memo, FC, ReactElement, useEffect, useState } from 'react';

import { useNavigate } from 'react-router-dom';
import { VideoWrapper } from './style';
import { getManageVio } from '../../../../../network/manage/video';
import { formatTime } from '../../../../../utils/format';
import MsgItem from '../../../../../components/content/msgItem';
import { holder } from '../../../../../utils/holder';
import { Empty, Pagination } from 'antd';
import { useAppDispatch } from '@/store/hooks';
import { deleteVideo } from '../../../../../network/video';

const Video: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [video, setVideo] = useState<any[]>([]);
  const [count, setCount] = useState<number>(0);
  const dispatch = useAppDispatch();
  useEffect(() => {
    getManageVio(0, 15).then((data: any) => {
      console.log(data);
      const { count } = data;
      const { video } = data;
      setCount(count);
      setVideo(video);
    });
  }, []);
  const chChange = (val: number) => {
    console.log(val)
    getManageVio((val - 1) * 15, 15).then((data: any) => {
      setCount(data.count);
      setVideo(data.video);
    });
  };
  const deleteVio = (item: any, index: number) => {
    /*dispatch(changeMsgAction(true)).then((data) => {
      if (data) {
        deleteVideo(item.id).then((data) => {
          getManageVio(0, 10).then((data: any) => {
            const { count } = data;
            const { video } = data;
            setCount(count);
            setVideo(video);
          });
        });
      }
    });*/
  };
  const videoRouter = (it: any) => {
    navigate('/Home/videoDetail', {
      state: {
        id: it.id
      }
    });
  };
  return (
    <VideoWrapper>
      <div className="table-box">
        <ul className='vio-list'>
          {video.map((item: any, index: number) => {
            return (
              <li key={item.id}>
                <MsgItem
                  isShowPlayCount={true}
                  dt={item.dt}
                  img={<img src={item.coverUrl} alt={item.description} onClick={() => videoRouter(item)} />}
                  itemWidth="175px"
                  scale={0.6}
                  state={<span>{item.name}</span>}
                  playCount={item.playCount}
                />
                <div className="del" onClick={(e) => deleteVio(item, index)}>
                  <i className="iconfont icon-huishouzhan"> </i>
                </div>
              </li>
            );
          })}
        </ul>
        {count > 15 && (
          <div style={{ display: 'flex', justifyContent: 'center', marginTop: '15px' }}>
            <Pagination
              defaultCurrent={1}
              total={count}
              pageSize={15}
              showTitle={false}
              onChange={(val: number) => chChange(val)}
            />
          </div>
        )}
      </div>

      {count < 1 && (
        <div className="vio-empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无视频'} />
        </div>
      )}
    </VideoWrapper>
  );
};
export default memo(Video);

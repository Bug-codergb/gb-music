import React, { memo, FC, ReactElement, useEffect, useState } from 'react';

import { RouteComponentProps, withRouter } from 'react-router-dom';
import { VideoWrapper } from './style';
import { getManageVio } from '../../../../../network/manage/video';
import { formatTime } from '../../../../../utils/format';
import MsgItem from '../../../../../components/content/msgItem';
import { holder } from '../../../../../utils/holder';
import { Empty, Pagination } from 'antd';
import { useDispatch } from 'react-redux';
import { changeMsgAction } from '../../../../../components/common/message/store/actionCreators';
import { deleteVideo } from '../../../../../network/video';

const Video: FC<RouteComponentProps> = (props): ReactElement => {
  const [video, setVideo] = useState<any[]>([]);
  const [count, setCount] = useState<number>(0);
  const dispatch = useDispatch();
  useEffect(() => {
    getManageVio(0, 10).then((data: any) => {
      const { count } = data;
      const { video } = data;
      setCount(count);
      setVideo(video);
    });
  }, []);
  const chChange = (val: number) => {
    getManageVio((val - 1) * 10, 10).then((data: any) => {
      setCount(count);
      setVideo(video);
    });
  };
  const deleteVio = (item: any, index: number) => {
    // @ts-ignore
    dispatch(changeMsgAction(true)).then((data) => {
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
    });
  };
  const videoRouter = (it: any) => {
    props.history.push({
      pathname: '/Home/videoDetail',
      state: {
        id: it.id
      }
    });
  };
  return (
    <VideoWrapper>
      <ul>
        {video.map((item: any, index: number) => {
          return (
            <li key={item.updateTime} className="video-time">
              <p className="create-time">{formatTime(item.updateTime, 'yyyy-MM-dd')} 创建</p>
              <ul className="vio-list">
                {item.video &&
                  item.video.length !== 0 &&
                  item.video.map((it: any, i: number) => {
                    return (
                      <li key={it.id}>
                        <MsgItem
                          isShowPlayCount={true}
                          dt={it.dt}
                          img={<img src={it.coverUrl} alt={it.description} onClick={() => videoRouter(it)} />}
                          itemWidth="175px"
                          scale={0.6}
                          state={<span>{it.name}</span>}
                          playCount={it.playCount}
                        />
                        <div className="del" onClick={(e) => deleteVio(it, i)}>
                          <i className="iconfont icon-huishouzhan"> </i>
                        </div>
                      </li>
                    );
                  })}
                {item.video &&
                  item.video.length !== 0 &&
                  holder(item.video.length, 6).map((item: number) => {
                    return <li key={item}> </li>;
                  })}
              </ul>
            </li>
          );
        })}
      </ul>
      {count > 10 && (
        <div style={{ display: 'flex', justifyContent: 'center', marginTop: '15px' }}>
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={10}
            showTitle={false}
            onChange={(val: number) => chChange(val)}
          />
        </div>
      )}
      {count < 1 && (
        <div className="vio-empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无视频'} />
        </div>
      )}
    </VideoWrapper>
  );
};
export default withRouter(memo(Video));

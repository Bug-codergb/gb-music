import React, { memo, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import placeholder from '../../../../assets/img/holder/video-placeholder.png';

import { getCateVideo, getVideoCate } from '../../../../network/video';
import { ICategory } from '../../../../constant/category';
import CateTitle from '../../../../components/common/cateTitle';
import { VideoWrapper } from './style';
import { IVideo } from '../../../../constant/video';
import MsgItem from '../../../../components/content/msgItem';
import { holder } from '../../../../utils/holder';
import { Empty, Image, Pagination } from 'antd';

const Video: React.FC<RouteComponentProps> = (props) => {
  const [cate, setCate] = useState<ICategory[]>([]);
  const [video, setVideo] = useState<IVideo[]>([]);
  const [count, setCount] = useState<number>(0);
  const [cateId, setCateId] = useState<string>('');
  useEffect(() => {
    getVideoCate<ICategory[]>(0).then((data) => {
      if(data.length!==0){
        setCate(data);
        cateClick(data[0], 0);
      }
    });
  }, []);
  const cateClick = (item: ICategory, index: number) => {
    setCateId(item.id);
    getCateVideo<{ videos: IVideo[]; count: number }>(item.id, 0, '0', '20').then((data) => {
      setCount(data.count);
      setVideo(data.videos);
    });
  };
  const videoRouter = (item: IVideo, index: number) => {
    props.history.push({
      pathname: '/Home/videoDetail',
      state: {
        id: item.id
      }
    });
  };
  const userRouter = (id: string) => {
    props.history.push({
      pathname: '/Home/userDetail',
      state: {
        userId: id
      }
    });
  };
  const changePage = (val: number) => {
    getCateVideo<{ videos: IVideo[]; count: number }>(cateId, 0, ((val - 1) * 20).toString(), '20').then((data) => {
      setCount(data.count);
      setVideo(data.videos);
    });
  };
  return (
    <VideoWrapper>
      <div className="new-title">
        <CateTitle title="最新视频" list={cate} cateClick={(item, index) => cateClick(item, index)} />
        <ul className="video-list">
          {video &&
            video.length !== 0 &&
            video.map((item, index) => {
              return (
                <li key={item.id}>
                  <MsgItem
                    playCount={item.playCount}
                    isShowPlayCount={true}
                    itemWidth="180px"
                    img={
                      <Image
                        width={180}
                        height={95}
                        src={item.coverUrl}
                        preview={false}
                        fallback={placeholder}
                        placeholder={<Image preview={false} src={placeholder} width={180} height={95} />}
                        onClick={(e) => videoRouter(item, index)}
                      />
                    }
                    state={<span>{item.name}</span>}
                    scale={0.53}
                    dt={item.dt}
                    userName={'userName' in item.user ? item.user.userName : item.user.name}
                    onClick={() => userRouter('userId' in item.user ? item.user.userId : item.user.id)}
                  />
                </li>
              );
            })}
          {video &&
            video.length !== 0 &&
            holder(video.length, 5).map((item: number) => {
              return <li key={item}> </li>;
            })}
        </ul>
      </div>
      {count > 20 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={20}
            showTitle={false}
            onChange={(val: number) => changePage(val)}
          />
        </div>
      )}
      {video && video.length === 0 && (
        <div className="empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'空空如也'} />
        </div>
      )}
    </VideoWrapper>
  );
};
export default withRouter(memo(Video));

import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router-dom';
import { MVWrapper } from './style';
import { ICategory } from '../../../../constant/category';
import { IVideo } from '../../../../constant/video';
import { getCateVideo, getVideoCate } from '../../../../network/video';
import CateTitle from '../../../../components/common/cateTitle';
import MsgItem from '../../../../components/content/msgItem';
import Toplist from './childCpn/toplist';
import { holder } from '../../../../utils/holder';
import { Empty, Image, Pagination } from 'antd';
import placeholder from '../../../../assets/img/holder/video-placeholder.png';

const MV: FC<RouteComponentProps> = (props): ReactElement => {
  const [cate, setCate] = useState<ICategory[]>([]);
  const [video, setVideo] = useState<IVideo[]>([]);
  const [count, setCount] = useState<number>(0);
  const [cateId, setCateId] = useState<string>('');
  useEffect(() => {
    getVideoCate<ICategory[]>(1).then((data) => {
      setCate(data);
      cateClick(data[0], 0);
    });
  }, []);
  const cateClick = (item: ICategory, index: number): void => {
    setCateId(item.id);
    getCateVideo<{ videos: IVideo[]; count: number }>(item.id, 1, '0', '15').then((data) => {
      setVideo(data.videos);
      setCount(data.count);
    });
  };
  const videoRouter = (item: IVideo, index: number): void => {
    props.history.push({
      pathname: '/Home/videoDetail',
      state: {
        id: item.id
      }
    });
  };
  const userRouter = (id: string): void => {
    props.history.push({
      pathname: '/Home/artistDetail',
      state: {
        id
      }
    });
  };
  const changePage = (val: number) => {
    getCateVideo<{ videos: IVideo[]; count: number }>(cateId, 1, `${(val - 1) * 15}`, '15').then((data) => {
      setVideo(data.videos);
      setCount(data.count);
    });
  };
  return (
    <MVWrapper>
      <CateTitle title="最新mv" list={cate} cateClick={(item, index) => cateClick(item, index)} />
      <ul className="mv-list">
        {video &&
          video.length !== 0 &&
          video.map((item, index) => {
            return (
              <li key={item.id}>
                <MsgItem
                  playCount={item.playCount}
                  itemWidth="200px"
                  isShowPlayCount={true}
                  img={
                    <Image
                      width={200}
                      height={120}
                      src={item.coverUrl}
                      preview={false}
                      placeholder={<Image preview={false} src={placeholder} width={200} height={120} />}
                      onClick={(e) => videoRouter(item, index)}
                    />
                  }
                  state={<span>{item.name}</span>}
                  scale={0.6}
                  dt={item.dt}
                  userName={'name' in item.user ? item.user.name : item.user.userName}
                  onClick={() => userRouter('id' in item.user ? item.user.id : item.user.userId)}
                />
              </li>
            );
          })}
        {video &&
          video.length !== 0 &&
          holder(video.length, 5).map((iten: number) => {
            return <li key={iten}> </li>;
          })}
      </ul>
      {count > 15 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={15}
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
      <Toplist />
    </MVWrapper>
  );
};
export default memo(MV);

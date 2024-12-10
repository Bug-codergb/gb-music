import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { Tabs, Pagination, Empty } from 'antd';
import { HomeWrapper, UserMomentWrapper } from './style';
import VideoData from './video';
import { getUserVioList } from '../../../../../network/manage/video';
import { IVideo } from '../../../../../constant/video';
import { formatTime } from '../../../../../utils/format';
import { getProgramList } from '../../../../../network/manage/channel';
import { IChannel } from '../../../../../constant/channel';
import Channel from './channel';
import Moment from './moment/index';
import { IMoment } from '../../../../../constant/moment';
import { getUserAllMoment } from '../../../../../network/user';
import { useNavigate } from 'react-router-dom';
interface IVioList extends IVideo {
  playCount: number;
  comment: number;
  thumb: number;
}
interface IChannelList extends IChannel {
  playCount: number;
  comment: number;
  thumb: number;
}
interface IData {
  playCount: number;
  comment: number;
}
const Home: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const { TabPane } = Tabs;
  const [key, setKey] = useState<string>('1');
  const [vioCount, setVioCount] = useState<number>(0);
  const [vioList, setVioList] = useState<IVioList[]>([]);
  const [momentList, setMomentList] = useState<IMoment[]>([]);

  const [chCount, setChCount] = useState<number>(0);
  const [channelList, setChannelList] = useState<IChannelList[]>([]);
  const [channelData, setChannelData] = useState<IData>();
  const [momentCount, setMomentCount] = useState<number>(0);
  useEffect(() => {
    getUserVioList(0, 5).then((data: any) => {
      setVioCount(data.count);
      setVioList(data.video);
    });
    getProgramList(0, 5).then((data: any) => {
      const { count, playCount, comment, channel } = data;
      setChCount(count);
      setChannelData({
        playCount,
        comment
      });
      setChannelList(channel);
    });
  }, []);
  useEffect(() => {
    getUserAllMoment('0', '5').then((data: any) => {
      setMomentCount(data.count);
      setMomentList(data.moment);
    });
  }, []);
  //tab handle
  const tabClick = (key: string) => {
    setKey(key);
  };
  //vio handle
  const vioChange = (val: number) => {
    getUserVioList((val - 1) * 5, 5).then((data: any) => {
      setVioCount(data.count);
      setVioList(data.video);
    });
  };
  const chChange = (val: number) => {
    getProgramList((val - 1) * 5, 5).then((data: any) => {
      const { count, channel } = data;
      setChCount(count);
      setChannelList(channel);
    });
  };
  const momentChange = (e: number) => {
    getUserAllMoment(`${(e - 1) * 5}`, '5').then((data: any) => {
      setMomentCount(data.count);
      setMomentList(data.moment);
    });
  };
  const videoRouter = (item: IVioList) => {
    navigate('/Home/videoDetail',{
      state: {
        id: item.id
      }
    });
  };
  const channelRouter = (item: IChannelList) => {
    navigate('/Home/channelDetail',{
      state: {
        id: item.id
      }
    });
  };
  const momentRouter = () => {
    navigate('/Home/moment');
  };
  return (
    <HomeWrapper>
      <div className="card-container">
        <Tabs type="card" onTabClick={(key: string) => tabClick(key)}>
          <TabPane tab="视频" key="1">
            <VideoData />
          </TabPane>
          <TabPane tab="声音" key="2">
            <Channel comment={channelData?.comment} playCount={channelData?.playCount} count={chCount} />
          </TabPane>
          <TabPane tab="动态" key="3">
            <Moment />
          </TabPane>
        </Tabs>
      </div>
      {key === '1' && (
        <ul className="vio-list">
          {vioList &&
            vioList.length !== 0 &&
            vioList.map((item, index) => {
              return (
                <li key={item.id}>
                  <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                  <div className="img-container" onClick={(e) => videoRouter(item)}>
                    <img src={item.coverUrl} alt={item.name} />
                  </div>
                  <div className="state text-nowrap">{item.name}</div>
                  <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd')}</div>
                  <div className="play-count">
                    <i className="iconfont icon-play2"> </i>
                    {item.playCount}
                  </div>
                  <div className="comment">
                    <i className="iconfont icon-pinglun1"> </i>
                    {item.comment}
                  </div>
                  <div className="thumb">
                    <i className="iconfont icon-dianzan"> </i>
                    {item.thumb}
                  </div>
                </li>
              );
            })}
          {vioCount > 5 && (
            <li style={{ display: 'flex', justifyContent: 'center', marginTop: '15px' }}>
              <Pagination
                defaultCurrent={1}
                total={vioCount}
                showTotal={(total)=>`共 ${total} 条数据`}
                pageSize={5}
                showTitle={false}
                onChange={(val: number) => vioChange(val)}
              />
            </li>
          )}
          {vioCount < 1 && (
            <li className="vio-empty">
              <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无视频'} />
            </li>
          )}
        </ul>
      )}
      {key === '2' && (
        <ul className="channel-list">
          {channelList &&
            channelList.length !== 0 &&
            channelList.map((item, index) => {
              return (
                <li key={item.id}>
                  <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                  <div className="img-container" onClick={(e) => channelRouter(item)}>
                    <img src={item.coverUrl} alt={item.name} />
                  </div>
                  <div className="state">{item.name}</div>
                  <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd')}</div>
                  <div className="play-count">
                    <i className="iconfont icon-play2"> </i>
                    {item.playCount ? item.playCount : 0}
                  </div>
                  <div className="comment">
                    <i className="iconfont icon-pinglun1"> </i>
                    {item.comment}
                  </div>
                </li>
              );
            })}
          {chCount > 5 && (
            <li style={{ display: 'flex', justifyContent: 'center', marginTop: '15px' }}>
              <Pagination
                defaultCurrent={1}
                total={chCount}
                pageSize={5}
                showTitle={false}
                onChange={(val: number) => chChange(val)}
              />
            </li>
          )}
          {chCount < 1 && (
            <li className="ch-empty">
              <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无视频'} />
            </li>
          )}
        </ul>
      )}
      {key === '3' && (
        <UserMomentWrapper>
          <ul>
            {momentList &&
              momentList.length !== 0 &&
              momentList.map((item, index) => {
                return (
                  <li key={item.id}>
                    <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                    <div className="img-container" onClick={(e) => momentRouter()}>
                      <img src={item.picUrl} alt={item.content} />
                    </div>
                    <div className="content text-nowrap">{item.content}</div>
                    <div className="user-name">{item.user.userName}</div>
                    <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd hh:mm')}</div>
                  </li>
                );
              })}
          </ul>
          {momentCount > 5 && (
            <div style={{ display: 'flex', justifyContent: 'center', marginTop: '15px' }}>
              <Pagination
                defaultCurrent={1}
                total={momentCount}
                pageSize={5}
                showTitle={false}
                onChange={(val: number) => momentChange(val)}
              />
            </div>
          )}
          {momentCount < 1 && (
            <li className="m-empty">
              <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无动态'} />
            </li>
          )}
        </UserMomentWrapper>
      )}
    </HomeWrapper>
  );
};
export default memo(Home);

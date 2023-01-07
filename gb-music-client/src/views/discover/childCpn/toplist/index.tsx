import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { Skeleton, Image, Spin } from 'antd';
import { ToplistWrapper } from './style';
import {addToplistPlayCount, getOfficial, getToplistDetail} from '../../../../network/toplist/toplist';
import { IToplist } from '../../../../constant/toplist';
import { ISong } from '../../../../constant/song';
import HotToplist from './childCpn/hotToplist';
import { changeSongDetailAction } from '../../../../components/content/playCoin/store/actionCreators';
import placeholder from '../../../../assets/img/holder/placeholder.png';
import VipMv from '../../../../components/common/vip-mv';
import { IArtist } from '../../../../constant/artist';

interface IDetail extends IToplist {
  songs: ISong[];
}
const Toplist: FC<RouteComponentProps> = (props): ReactElement => {
  const [official, setOfficial] = useState<IToplist[]>([]);
  const [detail, setDetail] = useState<IDetail[]>([]);

  const dispatch = useDispatch();

  useEffect(() => {
    getOfficial<IToplist[]>().then((data) => {
      setOfficial(data);
      const promise = official.map((item, index) => {
        return getToplistDetail<IDetail>(item.id);
      });
      if (promise.length) {
        Promise.all(promise).then((data) => {
          if (data.length) {
            setDetail(data);
          }
        });
      }
    });
  }, [official.length]);
  const toplistRouter = (item: IToplist, index: number): void => {
    props.history.push({
      pathname: '/Home/toplistDetail',
      state: {
        id: item.id,
        name: item.name
      }
    });
  };
  const playSong = (item: IToplist,it:ISong) => {
    dispatch(changeSongDetailAction(it.id));
    addToplistPlayCount(item.id).then(()=>{}).catch(()=>{})
  };
  const videoRouter = (item: { id: string; name: string }) => {
    props.history.push({
      pathname: '/Home/videoDetail',
      state: {
        id: item.id
      }
    });
  };
  const artistRouter = (item: IArtist) => {
    if (item) {
      props.history.push({
        pathname: '/Home/artistDetail',
        state: {
          id: item.id
        }
      });
    }
  };
  return (
    <ToplistWrapper className="center-content">
      <ul className="toplist">
        {official &&
          official.length !== 0 &&
          official.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="img-container" onClick={(e) => toplistRouter(item, index)}>
                  <Image
                    width={170}
                    height={170}
                    src={item.coverUrl}
                    preview={false}
                    fallback={placeholder}
                    placeholder={<Image preview={false} src={placeholder} width={170} height={170} />}
                    onClick={(e) => toplistRouter(item, index)}
                  />
                </div>
                <ul className="toplist-song-list">
                  {
                    <Skeleton
                      active={true}
                      loading={
                        !detail ||
                        detail.length === 0 ||
                        !detail[index] ||
                        !detail[index].songs ||
                        detail[index].songs.length === 0
                      }
                    />
                  }
                  {detail[index] &&
                    detail[index].songs &&
                    detail[index].songs.length !== 0 &&
                    detail[index].songs.slice(0, 5).map((it, index) => {
                      return (
                        <li key={it.id}>
                          <div className="song-name-container">
                            <div className="index">{index + 1}</div>
                            {item.name === '飙升榜' && (
                              <div className="up">
                                <i className="iconfont icon-data-arrow-up"> </i>
                                <span>{it.diff}</span>
                              </div>
                            )}
                            <div className="song-name-vip-mv" onClick={(e) => playSong(item,it)}>
                              <div
                                className={`song-name text-nowrap ${item.name === '飙升榜' ? 'top' : ''}`}
                                title={it.name}
                              >
                                {it.name}
                              </div>
                              <VipMv
                                isShowVip={it.vip === 1}
                                isShowMv={it.video}
                                onClick={() => videoRouter(it.video)}
                              />
                            </div>
                          </div>
                          <div className="artist-name" onClick={(e) => artistRouter(it.artist)}>
                            {it.artist?.name}
                          </div>
                        </li>
                      );
                    })}
                </ul>
              </li>
            );
          })}
        {official && official.length < 1 && (
          <div className="empty-toplist-outer">
            <div className="empty-toplist">
              <Spin size={'large'} tip={'音乐加载中...'} spinning={official.length < 1} />
            </div>
          </div>
        )}
      </ul>
      <HotToplist />
    </ToplistWrapper>
  );
};
export default withRouter(memo(Toplist));

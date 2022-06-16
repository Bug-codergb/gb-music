import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { HotToplistWrapper } from './style';
import { getHotToplist, getToplistDetail } from '../../../../../../network/toplist/toplist';
import { IToplist } from '../../../../../../constant/toplist';
import { ISong } from '../../../../../../constant/song';
import { changeSongDetailAction } from '../../../../../../components/content/playCoin/store/actionCreators';
import { useDispatch } from 'react-redux';
import VipMv from '../../../../../../components/common/vip-mv';
import { IArtist } from '../../../../../../constant/artist';
import { Image, Skeleton } from 'antd';
import placeholder from '../../../../../../assets/img/holder/placeholder.png';
interface IDetail extends IToplist {
  songs: ISong[];
}

const HotToplist: FC<RouteComponentProps> = (props): ReactElement => {
  const [hotToplist, setToplist] = useState<IToplist[]>([]);
  const [detail, setDetail] = useState<IDetail[]>([]);
  const dispatch = useDispatch();
  useEffect(() => {
    getHotToplist().then((data: any) => {
      setToplist(data);
      const promise = hotToplist.map((item, index) => {
        return getToplistDetail(item.id);
      });
      if (promise.length) {
        Promise.all(promise).then((data: any) => {
          if (data.length) {
            setDetail(data);
            console.log(data);
          }
        });
      }
    });
  }, [hotToplist.length]);
  const toplistRouter = (item: IToplist, index: number): void => {
    props.history.push({
      pathname: '/Home/toplistDetail',
      state: {
        id: item.id
      }
    });
  };
  const playSong = (item: ISong) => {
    dispatch(changeSongDetailAction(item.id));
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
    <HotToplistWrapper>
      <p className="title">热门榜单</p>
      <ul className="hot-toplist">
        {hotToplist.length !== 0 &&
          hotToplist.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="img-container" onClick={(e) => toplistRouter(item, index)}>
                  <Image
                    width={170}
                    height={170}
                    src={item.coverUrl}
                    preview={false}
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
                            <div className="song-name-vip" onClick={(e) => playSong(it)}>
                              <div className="song-name text-nowrap" title={it.name}>
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
      </ul>
    </HotToplistWrapper>
  );
};
export default withRouter(memo(HotToplist));

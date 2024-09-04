import React, { FC, memo, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';

import { CheckOutlined } from '@ant-design/icons';
import {
  ArtistDetailWrapper,
  ArtistHeader,
  RightContent,
  LeftContent,
  AlbumDetailContent,
  CenterContent
} from './style';
import { getArtistDetail } from '../../../../network/artist';
import { cancelSub, sub } from '../../../../network/subscriber';

import { IArtist } from '../../../../constant/artist';
import { IAlbum } from '../../../../constant/album';
import { ISong } from '../../../../constant/albumDetail';

import TabControl from '../../../common/tabControl';
import MV from './childCpn/mv/index';
import Albums from './childCpn/albums';

import { changeUserDetailAction } from '../../../../views/Login/store/actionCreators';

import Similar from './childCpn/similar';
import Desc from './childCpn/desc';
import HotArtist from './childCpn/hotArtist';

interface IAlbums extends IAlbum {
  songs: ISong[];
}
interface IArtistDetail extends IArtist {
  album: IAlbums[];
}
const ArtistDetail: FC<RouteComponentProps<any, any, { id: string }>> = memo((props): ReactElement => {
  const { id } = props.location.state;

  const [arId, setArId] = useState<string>(id);
  const [artistDetail, setArtist] = useState<IArtistDetail>();

  const dispatch = useDispatch();
  const { userDetail } = useSelector((state) => ({
    // @ts-ignore
    userDetail: state.getIn(['loginReducer', 'login', 'userDetail'])
  }));
  useEffect(() => {
    getArtistDetail<IArtistDetail>(arId).then((data) => {
      setArtist(data);
    });
  }, [arId]);
  //function handle
  const subArtist = (): void => {
    if (!isSub()) {
      sub(arId, 'arId').then((data) => {
        dispatch(changeUserDetailAction());
      });
    } else if (isSub()) {
      cancelSub(arId, 'arId').then((data) => {
        dispatch(changeUserDetailAction());
      });
    }
  };
  const isSub = (): boolean => {
    let flag: number = -1;
    if (userDetail.subscriber && userDetail.subscriber.artist) {
      flag = userDetail.subscriber.artist.findIndex((item: { id: string; name: string }, index: number) => {
        if (item) return item.id === arId;
        else {
          return false;
        }
      });
    }
    return flag !== -1;
  };
  const simiClick = (id: string) => {
    setArId(id);
  };
  return (
    <ArtistDetailWrapper>
      <CenterContent>
        <LeftContent>
          {artistDetail && (
            <ArtistHeader>
              <div className="img-container">
                <img src={artistDetail.avatarUrl} alt="" />
              </div>
              <div className="msg">
                <div className="artist-name">{artistDetail.name}</div>
                <div className={`sub ${isSub() ? 'active' : ''}`} onClick={(e) => subArtist()}>
                  {!isSub() && <i className="iconfont icon-xinjianshoucangjia"> </i>}
                  {isSub() && <CheckOutlined className="already" />}
                  {!isSub() && <span>收藏</span>}
                  {isSub() && <span>已收藏</span>}
                </div>
                <div className="count">
                  <div>
                    <span>专辑数:</span>
                    {artistDetail.albumCount}
                  </div>
                </div>
              </div>
            </ArtistHeader>
          )}
          {artistDetail && artistDetail.album && (
            <AlbumDetailContent>
              <TabControl
                list={['专辑', 'MV', '歌手详情', '相似歌手']}
                contentName={['album', 'mv', 'artistDesc', 'similar']}
                album={<Albums albums={artistDetail.album} />}
                mv={<MV id={artistDetail.id} />}
                artistDesc={<Desc desc={artistDetail.description} />}
                similar={<Similar area={artistDetail.area} onClick={(id: string) => simiClick(id)} />}
              />
            </AlbumDetailContent>
          )}
        </LeftContent>
        <RightContent>
          <HotArtist id={arId} onClick={(id: string) => simiClick(id)} />
        </RightContent>
      </CenterContent>
    </ArtistDetailWrapper>
  );
});
export default withRouter(ArtistDetail);

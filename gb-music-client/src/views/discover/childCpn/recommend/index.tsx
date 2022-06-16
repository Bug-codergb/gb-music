import React, { memo, FC, ReactElement } from 'react';
import { RouteComponentProps } from 'react-router-dom';

import RecPlaylist from './childCpn/recPlaylist';
import RecAlbum from './childCpn/recAlbum';
import RecArtist from './childCpn/recArtist';
import RecSong from './childCpn/recSong';
import Banner from './childCpn/banner';
import { RecommendWrapper, LeftContent, RightContent } from './style';
import HotChannel from './childCpn/rightBar/hotChannel';
import RecVideo from './childCpn/rightBar/recVideo';
interface IProps extends RouteComponentProps {}
const Recommend: FC<IProps> = (props): ReactElement => {
  const playlistRouter = (): void => {
    props.history.push({
      pathname: '/Home/discover/playlist'
    });
  };
  const albumRouter = (): void => {
    props.history.push({
      pathname: '/Home/discover/album'
    });
  };
  const artistRouter = (): void => {
    props.history.push({
      pathname: '/Home/discover/artist'
    });
  };
  return (
    <RecommendWrapper>
      <Banner />
      <div className="rec-content">
        <LeftContent>
          <div className="title-name" onClick={(e) => playlistRouter()}>
            热门歌单
            <i className="iconfont icon-arrow-right"> </i>
          </div>
          <RecPlaylist />
          <div className="title-name" onClick={(e) => albumRouter()}>
            最热专辑
            <i className="iconfont icon-arrow-right"> </i>
          </div>
          <RecAlbum />
          <div className="title-name" onClick={(e) => artistRouter()}>
            热门歌手
            <i className="iconfont icon-arrow-right"> </i>
          </div>
          <RecArtist />
          <div className="title-name">
            新歌上架
            <i className="iconfont icon-arrow-right"> </i>
          </div>
          <RecSong />
        </LeftContent>
        <RightContent>
          <HotChannel />
          <RecVideo />
        </RightContent>
      </div>
    </RecommendWrapper>
  );
};
export default memo(Recommend);

import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";
import { SearchMatchWrapper } from './style';
//import { changeSearchResult } from './store/actionCreators';

import { getSearchMatch } from '../../../../../network/search';
import { ISong } from '../../../../../constant/song';
import { IAlbum } from '../../../../../constant/album';
import { IArtist } from '../../../../../constant/artist';
import { IPlaylist } from '../../../../../constant/playlist';
//import { changeSongDetailAction } from '../../../playCoin/store/actionCreators';
import { useNavigate } from 'react-router-dom';

interface IProps {
  keyword: string;
}
const SearchMatch: FC<IProps> = (props): ReactElement => {
  const { keyword } = props;
  const navigate = useNavigate();
  const [song, setSong] = useState<ISong[]>([]);
  const [album, setAlbum] = useState<IAlbum[]>([]);
  const [artist, setArtist] = useState<IArtist[]>([]);
  const [playlist, setPlaylist] = useState<IPlaylist[]>([]);
  const dispatch = useAppDispatch();
  useEffect(() => {
    if (keyword.trim().length !== 0) {
      getSearchMatch(keyword).then((data: any) => {
        if (data) {
          // dispatch(changeSearchResult(data));
          // const { song, artist, album, playlist } = data;
          // setSong(song);
          // setAlbum(album);
          // setArtist(artist);
          // setPlaylist(playlist);
        }
      });
    }
  }, [keyword, dispatch]);
  const songClick = (item: ISong) => {
    //dispatch(changeSongDetailAction(item.id));
  };
  const artistRouter = (item: IArtist) => {
    navigate("/Home/artistDetail",{
      state:{
        id: item.id
      }
    })

  };
  const playlistRouter = (item: IPlaylist) => {

    navigate("/Home/playlistDetail",{
      state:{
        id: item.id
      }
    })

  };
  const albumRouter = (item: IAlbum) => {
    navigate("/Home/albumDetail",{
      state:{
        id: item.id
      }
    })

  };
  return (
    <SearchMatchWrapper>
      {song.length !== 0 && (
        <div className="search-title">
          <i className="iconfont icon-yinfu"> </i>
          歌曲
        </div>
      )}
      <ul className="list">
        {song.length !== 0 &&
          song.slice(0, 4).map((item, index) => {
            return (
              <li key={item.id} onClick={(e) => songClick(item)}>
                {item.name}
              </li>
            );
          })}
      </ul>
      {artist.length !== 0 && (
        <div className="search-title">
          <i className="iconfont icon-ttpodicon"> </i>
          歌手
        </div>
      )}
      <ul className="list">
        {artist.length !== 0 &&
          artist.slice(0, 4).map((item, index) => {
            return (
              <li key={item.id} onClick={(e) => artistRouter(item)}>
                {item.name}
              </li>
            );
          })}
      </ul>
      {playlist.length !== 0 && (
        <div className="search-title">
          <i className="iconfont icon-yinle-liebiao"> </i>
          歌单
        </div>
      )}
      <ul className="list">
        {playlist.length !== 0 &&
          playlist.slice(0, 4).map((item, index) => {
            return (
              <li key={item.id} onClick={(e) => playlistRouter(item)}>
                {item.name}
              </li>
            );
          })}
      </ul>
      {album.length !== 0 && (
        <div className="search-title">
          <i className="iconfont icon-zhuanji"> </i>
          专辑
        </div>
      )}
      <ul className="list">
        {album.length !== 0 &&
          album.slice(0, 4).map((item, index) => {
            return (
              <li key={item.id} onClick={(e) => albumRouter(item)}>
                {item.name}
              </li>
            );
          })}
      </ul>
      {album.length === 0 && playlist.length === 0 && song.length === 0 && artist.length === 0 && (
        <div className="no-tip">
          <i className="iconfont icon-xiangzidakai"> </i>
          <p>暂无结果</p>
        </div>
      )}
    </SearchMatchWrapper>
  );
};
export default memo(SearchMatch);

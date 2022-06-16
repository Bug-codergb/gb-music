import React, { memo, FC, ReactElement } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { RouteComponentProps } from 'react-router-dom';
import { Map } from 'immutable';
import { SongWrapper } from './style';
import { ISong } from '../../../../../../constant/song';
import { formatTime } from '../../../../../../utils/format';

import { changeSongDetailAction } from '../../../../playCoin/store/actionCreators';
import { Empty } from 'antd';
import VipMv from '../../../../../common/vip-mv';
import { ISearchStore } from '../../../../../../constant/store/search';

const Song: FC<RouteComponentProps> = (props): ReactElement => {
  const { song } = useSelector<Map<string, ISearchStore>, ISearchStore>((state) => {
    return state.getIn(['searchReducer', 'searchResult']);
  });
  const dispatch = useDispatch();
  const songPlay = (item: ISong, index: number): void => {
    dispatch(changeSongDetailAction(item.id));
  };
  const artistRouter = (item: ISong, index: number) => {
    props.history.push({
      pathname: '/Home/artistDetail',
      state: {
        id: item.artist.id
      }
    });
  };
  const albumRouter = (item: ISong, index: number): void => {
    props.history.push({
      pathname: '/Home/albumDetail',
      state: {
        id: item.album.id
      }
    });
  };
  const videoRouter = (item: ISong) => {
    props.history.push({
      pathname: '/Home/videoDetail',
      state: {
        id: item.video.id
      }
    });
  };
  return (
    <SongWrapper>
      {song &&
        song.length !== 0 &&
        song.map((item: ISong, index: number) => {
          return (
            <li key={item.id}>
              <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
              <div className="name text-nowrap" onClick={(e) => songPlay(item, index)}>
                <span className="text-nowrap">{item.name}</span>
                <VipMv isShowVip={item.vip === 1} isShowMv={item.video} onClick={() => videoRouter(item)} />
              </div>
              <div className="artist-name" onClick={(e) => artistRouter(item, index)}>
                {item.artist.name}
              </div>
              <div className="album-name" onClick={(e) => albumRouter(item, index)}>
                {item.album.name}
              </div>
              <div className="dt">{formatTime(item.duration!, 'mm:ss')}</div>
            </li>
          );
        })}
      {song && song.length === 0 && (
        <div
          style={{
            height: '350px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center'
          }}
        >
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无歌曲'} />
        </div>
      )}
    </SongWrapper>
  );
};
export default memo(Song);

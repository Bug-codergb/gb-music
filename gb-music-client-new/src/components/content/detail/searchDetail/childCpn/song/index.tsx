import React, { memo, FC, ReactElement } from 'react';
import { useAppSelector,useAppDispatch } from "@/store/hooks"
import { useNavigate } from 'react-router-dom';
import { SongWrapper } from './style';
import { ISong } from '../../../../../../constant/song';
import { formatTime } from '../../../../../../utils/format';

import { changeSongDetailAction } from '../../../../playCoin/store/asyncThunk';
import { Empty } from 'antd';
import VipMv from '../../../../../common/vip-mv';
import { ISearchStore } from '../../../../../../constant/store/search';
import moment from "moment";
const Song: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const { song } = useAppSelector((state) => {
    return state['searchReducer']['searchResult'];
  });
  const dispatch = useAppDispatch();
  const songPlay = (item: ISong, index: number): void => {
    dispatch(changeSongDetailAction({id:item.id}));
  };
  const artistRouter = (item: ISong, index: number) => {
    navigate('/Home/artistDetail',{
      state: {
        id: item.artist.id
      }
    });
  };
  const albumRouter = (item: ISong, index: number): void => {
    navigate('/Home/albumDetail',{
      state: {
        id: item.album.id
      }
    });
  };
  const videoRouter = (item: ISong) => {
    navigate('/Home/videoDetail',{
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
              <div className="album-name mle" onClick={(e) => albumRouter(item, index)}>
                {item.album.name}
              </div>
              <div className="dt">{moment(item.duration).format('mm:ss')}</div>
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

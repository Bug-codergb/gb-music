import React, { memo, FC, ReactElement, useRef, useEffect, MouseEvent } from 'react';
import { PlaylistWrapper } from './style';
import { useAppDispatch, useAppSelector } from '@/store/hooks';
import { ISong } from '../../../../../constant/song';
import { formatTime } from '../../../../../utils/format';
import { changeSongDetailAction } from '../../store/asyncThunk';
import { ISongStore } from '../../../../../constant/store/song';
const Playlist: FC = (): ReactElement => {
  const { playlist, currentIndex } = useAppSelector((state) => {
    return state['songReducer'];
  });
  const songList = useRef<HTMLUListElement>(null);
  const dispatch = useAppDispatch();
  useEffect(() => {
    if (songList.current && songList.current?.offsetHeight >= 450) {
      songList.current.style.height = 450 + 'px';
      songList.current.style.overflowY = 'scroll';
    }
  }, [songList.current?.offsetHeight]);
  const playSong = (e: MouseEvent<HTMLDivElement>, item: ISong, index: number) => {
    e.stopPropagation();
    dispatch(changeSongDetailAction({ id: item.id }));
  };
  return (
    <PlaylistWrapper>
      <p className="title">当前播放</p>
      <div className="g-control">
        <div className="total">总{playlist.length}首</div>
        <div className="sub-all">
          <i className="iconfont icon-jiarushoucang"> </i>
          <span>收藏全部</span>
        </div>
      </div>
      <ul className="play-list-song" ref={songList}>
        {playlist.length !== 0 &&
          playlist.map((item: ISong, index: number) => {
            return (
              <li key={item.id}>
                <div className="play-icon">
                  <i className="iconfont icon-pause" style={{ opacity: index === currentIndex ? '1' : '0' }}>
                    {' '}
                  </i>
                </div>
                <div
                  className={`name text-nowrap ${currentIndex === index ? 'active' : ''}`}
                  onClick={(e: MouseEvent<HTMLDivElement>) => playSong(e, item, index)}
                >
                  {item.name}
                </div>
                <div className={`artist-name text-nowrap ${currentIndex === index ? 'active' : ''}`}>
                  {item.artist.name}
                </div>
                <div className="dt">{formatTime(parseInt(item.duration!.toString()), 'mm:ss')}</div>
              </li>
            );
          })}
      </ul>
    </PlaylistWrapper>
  );
};
export default memo(Playlist);

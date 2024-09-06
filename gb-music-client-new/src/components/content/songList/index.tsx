import React, { memo, ReactElement, FC } from 'react';
import { useAppSelector, useAppDispatch } from '@/store/hooks';

import { SongListWrapper } from './style';
import { IAlbumDetail, ISong } from '../../../constant/albumDetail';
import ListItem from './childCpn/listItem';
import { changeSongDetailAction } from '../playCoin/store/asyncThunk';
//import { changeShow } from '../../common/toast/store/actionCreators';
import { ILogin, IUserMsg } from '../../../constant/store/login';

interface IProps {
  albumDetail: IAlbumDetail;
}
const SongList: FC<IProps> = ({ albumDetail }): ReactElement => {
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const dispatch = useAppDispatch();
  const play = (item: ISong, id: string, name: string) => {
    const { vip } = item;
    const { auth } = userMsg;
    if (vip === 1 && auth * 1 === 0) {
      //dispatch(changeShow('您正在试听VIP歌曲，开通VIP后畅想', 3000));
    }
    dispatch(changeSongDetailAction(id));
  };
  return (
    <SongListWrapper>
      <ul className="song-list">
        {albumDetail.songs &&
          albumDetail.songs.map((item, index) => {
            return (
              <li key={item.id}>
                <ListItem
                  index={index}
                  id={item.id}
                  name={item.name}
                  alName={albumDetail.name}
                  createName={albumDetail.artist.name}
                  time={item.dt!}
                  play={(id: string, name: string) => play(item, id, name)}
                  vip={item.vip}
                  arId={albumDetail.artist?.id}
                  video={item.video}
                />
              </li>
            );
          })}
      </ul>
    </SongListWrapper>
  );
};
export default memo(SongList);

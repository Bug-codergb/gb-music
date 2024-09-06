import React, { memo, FC } from 'react';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts"

import { changeSongDetailAction } from '../../../../playCoin/store/asyncThunk';
import Album from './childCpn/album';
import { ISong } from '../../../../../../constant/albumDetail';
import { IAlbum } from '../../../../../../constant/album';
import { AlbumsWrapper } from './style';
import { changeShow } from '../../../../../common/toast/store/index';
import { ILogin, IUserMsg } from '../../../../../../constant/store/login';

interface IAlbums extends IAlbum {
  songs: ISong[];
}
interface IProps {
  albums: IAlbums[];
}
const Albums: FC<IProps> = ({ albums }) => {
  const dispatch = useAppDispatch();
  const { userMsg } = useAppSelector((state) =>{
    return state['loginReducer']
  });
  const play = (item: ISong, index: number) => {
    const { vip } = item;
    const { auth } = userMsg;
    if (vip === 1 && auth * 1 === 0) {
      dispatch(changeShow('您正在试听VIP歌曲，开通VIP后畅想', 3000));
    }
    dispatch(changeSongDetailAction({id:item.id}));
  };
  return (
    <AlbumsWrapper>
      <ul className="album-song-list">
        {albums.length !== 0 &&
          albums.map((item, index) => {
            return (
              <li key={item.id}>
                <Album album={item} play={(item: ISong, index: number) => play(item, index)} />
              </li>
            );
          })}
      </ul>
    </AlbumsWrapper>
  );
};
export default memo(Albums);

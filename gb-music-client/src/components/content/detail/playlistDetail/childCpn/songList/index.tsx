import React, { memo, FC, ReactElement } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Map } from 'immutable';
import { changeSongDetailAction } from '../../../../playCoin/store/actionCreators';
import { ISong } from '../../../../../../constant/song';
import { SongListWrapper } from './style';
import SongListItem from '../../../../songListItem';
import { addPlayCount } from '../../../../../../network/playlist';
import { changeShow } from '../../../../../common/toast/store/actionCreators';
import { ILogin, IUserMsg } from '../../../../../../constant/store/login';
import {addToplistPlayCount} from "../../../../../../network/toplist/toplist";

interface IProps {
  songs: Array<ISong>;
  pId?: string;
  isShowUp: boolean;
  tId?:string
}
const SongList: FC<IProps> = ({ songs, pId, isShowUp,tId }): ReactElement => {
  const { userMsg } = useSelector<Map<string, ILogin>, { userMsg: IUserMsg }>((state) => ({
    userMsg: state.getIn(['loginReducer', 'login', 'userMsg'])
  }));
  const dispatch = useDispatch();
  const playSong = (item: ISong, id: string): void => {
    dispatch(changeSongDetailAction(id));
    const { vip } = item;
    const { auth } = userMsg;
    if (vip === 1 && auth * 1 === 0) {
      dispatch(changeShow('您正在试听VIP歌曲，开通VIP后畅想', 3000));
    }
    if (pId) {
      addPlayCount(pId).then(()=>{}).catch(()=>{})
    }
    if(tId){
      addToplistPlayCount(tId).then(()=>{}).catch(()=>{});
    }
  };
  return (
    <SongListWrapper>
      <ul className="song-list">
        {songs &&
          songs.length !== 0 &&
          songs.map((item, index) => {
            return (
              <li key={item.id}>
                <SongListItem
                  index={index}
                  state={item.name}
                  id={item.id}
                  creator={item.artist?.name}
                  alName={item.album?.name}
                  alId={item.album?.id}
                  arId={item.artist?.id}
                  time={item.publishTime}
                  dt={item.duration!}
                  vip={item.vip}
                  video={item.video}
                  isShowUp={isShowUp}
                  diff={item.diff}
                  onClick={(id: string) => playSong(item, id)}
                />
              </li>
            );
          })}
      </ul>
    </SongListWrapper>
  );
};
export default memo(SongList);

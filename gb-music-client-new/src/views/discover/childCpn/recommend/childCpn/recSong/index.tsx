import React, { memo, FC, ReactElement, useEffect, useState, MouseEvent } from 'react';
import { useNavigate } from 'react-router-dom';

import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";
import { getRecSong } from '../../../../../../network/song';
import { Image, Spin } from 'antd';
import { RecSongWrapper } from './style';

import ListInfo from '../../../../../../components/content/listInfo';
import { changeSongDetailAction } from '../../../../../../components/content/playCoin/store/asyncThunk';
import VipMv from '../../../../../../components/common/vip-mv';

//import { changeShow } from '../../../../../../components/common/toast/store/actionCreators';
import { IArtist } from '../../../../../../constant/artist';
import { ISong } from '../../../../../../constant/song';
import { ILogin, IUserMsg } from '../../../../../../constant/store/login';
import placeholder from '../../../../../../assets/img/holder/music-placeholder.png';

const RecSong: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [recSong, setRecSong] = useState<ISong[]>([]);
  const { userMsg } = useAppSelector((state) => {
    return  state['loginReducer']
  });
  useEffect(() => {
    getRecSong<ISong[]>(0, 8).then((data) => {
      setRecSong(data);
    });
  }, []);
  //redux-hook
  const dispatch = useAppDispatch();
  const playSong = (item: ISong) => {
    const { vip } = item;
    const { auth } = userMsg;
    if (vip === 1 && auth * 1 === 0) {
      //dispatch(changeShow('您正在试听VIP歌曲，开通VIP后畅想', 3000));
    }
    dispatch(changeSongDetailAction({id:item.id}));
  };
  const videoRouter = (item: ISong) => {
    if (item.video) {
      navigate('/Home/videoDetail',{
        state: {
          id: item.video.id
        }
      });
    }
  };
  const artistRouter = (item: IArtist) => {
   navigate('/Home/artistDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <Spin size={'large'} tip={'加载中...'} spinning={recSong.length === 0} style={{ backgroundColor: '#fef9f9' }}>
      <RecSongWrapper style={{ height: recSong.length === 0 ? '300px' : 'auto' }}>
        <ul className="song-list">
          {recSong.length !== 0 &&
            recSong.map((item, index) => {
              return (
                <li key={item.id}>
                  <ListInfo
                    img={
                      <Image
                        width={60}
                        height={60}
                        src={item.album.coverUrl + '&w=60'}
                        preview={false}
                        onClick={(e: MouseEvent<HTMLDivElement>) => playSong(item)}
                        fallback={placeholder}
                        placeholder={<Image preview={false} src={placeholder} width={60} height={60} />}
                      />
                    }
                    state={
                      <div className="state-outer">
                        <span className="text-nowrap state-span">{item.name}</span>
                        <VipMv isShowVip={item.vip === 1} isShowMv={item.video} onClick={() => videoRouter(item)} />
                      </div>
                    }
                    creator={item.artist.name}
                    imgWidth="60px"
                    onClick={() => artistRouter(item.artist)}
                  />
                  <div className="hot">
                    <i className="iconfont icon-redu"> </i>
                    {item.playCount}
                  </div>
                </li>
              );
            })}
        </ul>
      </RecSongWrapper>
    </Spin>
  );
};
export default memo(RecSong);

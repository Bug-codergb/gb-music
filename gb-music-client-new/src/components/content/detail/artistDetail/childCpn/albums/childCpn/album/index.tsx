import React, { FC, memo, ReactElement } from 'react';
import { message } from "antd"
import { AlbumWrapper } from './style';
import { IAlbum } from '../../../../../../../../constant/album';
import { ISong } from '../../../../../../../../constant/albumDetail';
import { formatTime } from '../../../../../../../../utils/format';
import VipMv from '../../../../../../../common/vip-mv';
import { useNavigate } from 'react-router-dom';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts"
import { cancelFavorite, setUserFavorite } from '../../../../../../../../network/user';
import { changeUserDetailAction } from '../../../../../../../../views/Login/store/asyncThunk';
//import { changeShow } from '../../../../../../../common/toast/store/actionCreators';
import { ILogin, IUserDetail } from '../../../../../../../../constant/store/login';
import {Image} from "antd";
import placeholder from "../../../../../../../../assets/img/holder/placeholder.png";
import { downloadSong } from '@/network/song';

interface IAlbumItem extends IAlbum {
  songs: ISong[];
}
interface IProps {
  album: IAlbumItem;
  play: (item: ISong, index: number) => void;
}
const Album: FC<IProps> = (props): ReactElement => {
  const { album, play } = props;
  const navigate = useNavigate()
  const { userDetail } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const dispatch = useAppDispatch();
  const playSong = (item: ISong, index: number): void => {
    play(item, index);
  };
  const isLove = (id: string) => {
    const isExists = userDetail.love.findIndex((item: { songId: string }, index: number) => {
      return item.songId === id;
    });
    return isExists !== -1;
  };
  const loveClick = (id: string) => {
    if (!isLove(id)) {
      setUserFavorite(id).then((data) => {
        dispatch(changeUserDetailAction());
        //dispatch(changeShow('已添加到我喜欢的音乐', 2500));
      });
    } else {
      cancelFavorite(id).then((data) => {
        dispatch(changeUserDetailAction());
      });
    }
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
  const albumRouter = () => {
    if (album) {
      navigate('/Home/albumDetail',{
        state: {
          id: album.id
        }
      });
    }
  };
  const handleDownload=async (item:ISong)=>{
    if(userMsg && userMsg.auth*1==0){
      message.warning("您还未开通VIP，开通后畅想")
    }else{
      //downloadSong(id,state)
      const res = await downloadSong(item.id,item.name);
      const link = document.createElement('a')
      const blob = new Blob([res])


      link.href = URL.createObjectURL(blob)
      link.setAttribute('download', `${item.name}.mp3`) // 自定义文件名
      document.body.appendChild(link)
      link.click()
      document.body.removeChild(link)
    }
  }
  return (
    <AlbumWrapper>
      <div className="img-container" onClick={(e) => albumRouter()}>
        {/*<img src={album.coverUrl} alt="" />*/}
        <Image
          width={148}
          height={148}
          src={album.coverUrl}
          preview={false}
          placeholder={<Image preview={false} src={placeholder} width={148} height={148} />}
        />
        <div className="mask"> </div>
      </div>
      <ul className="song-list">
        <div className="album-name">{album.name}</div>
        {album.songs &&
          album.songs.length !== 0 &&
          album.songs.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                <div className="love">
                  <i className="iconfont icon-download" onClick={()=>handleDownload(item)}> </i>
                  {!isLove(item.id) && (
                    <i className="iconfont icon-love" onClick={(e) => loveClick(item.id)}>
                      {' '}
                    </i>
                  )}
                  {isLove(item.id) && (
                    <i className="iconfont icon-loveit" onClick={(e) => loveClick(item.id)}>
                      {' '}
                    </i>
                  )}
                </div>
                <div className="song-name text-nowrap" onClick={(e) => playSong(item, index)}>
                  <span className="text-nowrap">{item.name}</span>
                  <VipMv
                    isShowVip={item.vip === 1}
                    isShowMv={item.video !== undefined && item.video !== null}
                    onClick={() => videoRouter(item)}
                  />
                </div>
                <div className="dt">{formatTime(item.dt!, 'mm:ss')}</div>
              </li>
            );
          })}
      </ul>
    </AlbumWrapper>
  );
};
export default memo(Album);

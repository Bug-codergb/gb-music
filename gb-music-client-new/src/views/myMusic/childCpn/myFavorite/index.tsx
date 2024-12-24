import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAppDispatch, useAppSelector } from '@/store/hooks';

import { Empty, Pagination,message } from 'antd';
import { cancelFavorite, getUserFavorite, setUserFavorite } from '../../../../network/user';
import { MyFavoriteWrapper } from './style';
import { ISong } from '../../../../constant/song';
import { formatTime } from '../../../../utils/format';

import { changeSongDetailAction } from '../../../../components/content/playCoin/store/asyncThunk';

import VipMv from '../../../../components/common/vip-mv';
//import { changeShow } from '../../../../components/common/toast/store/actionCreators';
import { ILogin, IUserMsg } from '../../../../constant/store/login';
import { downloadSong } from '@/network/song';
import { changeUserDetailAction } from '@/views/Login/store/asyncThunk';

interface IUserSong {
  createTime: string;
  song: ISong;
}
const MyFavorite: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [songs, setSongs] = useState<IUserSong[]>([]);
  const [count, setCount] = useState<number>(0);
  const dispatch = useAppDispatch();
  const { userMsg,userDetail } = useAppSelector((state) => {
    return state['loginReducer']
  });
  useEffect(() => {
    getUserFavorite(0, 10).then((data: any) => {
      setSongs(data.songList.songs);
      setCount(data.songList.count);
    });
  }, []);
  //播放歌曲
  const playSong = (item: IUserSong) => {
    const { vip } = item.song;
    const { auth } = userMsg;
    if (vip === 1 && auth * 1 === 0) {
      //dispatch(changeShow('您正在试听VIP歌曲，开通VIP后畅想', 3000));
      message.warning('您正在试听VIP歌曲，开通VIP后畅想')
    }
    dispatch(changeSongDetailAction({id:item.song.id}));
  };
  const albumRouter = (item: IUserSong) => {
    navigate('/Home/albumDetail',{
      state: {
        id: item.song.album.id
      }
    });
  };
  const artistRouter = (item: IUserSong) => {
    navigate('/Home/artistDetail',{
      state: {
        id: item.song.artist.id
      }
    });
  };
  const videoRouter = (item: IUserSong) => {
    if (item.song.video) {
      navigate('/Home/videoDetail',{
        state: {
          id: item.song.video.id
        }
      });
    }
  };
  const changePage = (val: number) => {
    getUserFavorite((val - 1) * 10, 10).then((data: any) => {
      setSongs(data.songList.songs);
      setCount(data.songList.count);
    });
  };

  const handleDownload=async(item:ISong)=>{
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
  const isLove = (song:ISong) => {
    const isExists = userDetail.love.findIndex((item: { songId: string }, index: number) => {
      return item.songId === song.id;
    });
    return isExists !== -1;
  };

  const loveClick = (song:ISong
  ) => {
    if (!isLove(song)) {
      setUserFavorite(song.id).then((data) => {
        dispatch(changeUserDetailAction());
        message.success("添加到我喜欢的音乐")
      });
    } else {
      cancelFavorite(song.id).then((data) => {
        dispatch(changeUserDetailAction());
      });
    }
  };
  
  return (
    <MyFavoriteWrapper>
      <ul className="user-favorite-list">
        {songs.length !== 0 &&
          songs.map((item, index) => {
            return (
              <li key={item.song.id}>
                <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                <div className="control-btn">
                {!isLove(item.song) && (
          <i className="iconfont icon-love" onClick={(e) => loveClick(item.song)}>
            {' '}
          </i>
        )}
        {isLove(item.song) && (
          <i className="iconfont icon-loveit" onClick={(e) => loveClick(item.song)}>
            {' '}
          </i>
        )}
                  <i className="iconfont icon-download" onClick={()=>handleDownload(item.song)}> </i>
                </div>
                <div className="img-container" onClick={(e) => playSong(item)}>
                  <img src={item.song.album.coverUrl} alt="" />
                </div>
                <div className="song-name text-nowrap" onClick={(e) => playSong(item)}>
                  <span className="text-nowrap" title={item.song.name}>
                    {item.song.name}
                  </span>
                  <VipMv isShowVip={item.song.vip === 1} isShowMv={item.song.video} onClick={() => videoRouter(item)} />
                </div>
                <div className="album-name text-nowrap" onClick={(e) => albumRouter(item)}>
                  {item.song.album.name}
                </div>
                <div className="artist-name text-nowrap" onClick={(e) => artistRouter(item)}>
                  {item.song.artist.name}
                </div>
                <div className="dt">{formatTime(item.song.duration!, 'mm:ss')}</div>
                <div className="time">{formatTime(item.createTime, 'yyyy-MM-dd hh:mm:ss')}</div>
              </li>
            );
          })}
      </ul>
      {songs && songs.length === 0 && (
        <div className="empty-tip">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="您还未加入喜爱歌曲" />
        </div>
      )}
      {count > 10 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={10}
            showTitle={false}
            showSizeChanger={false}
            onChange={(val: number) => changePage(val)}
          />
        </div>
      )}
    </MyFavoriteWrapper>
  );
};
export default memo(MyFavorite);

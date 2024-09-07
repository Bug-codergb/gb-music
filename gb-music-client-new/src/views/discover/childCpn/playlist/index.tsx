import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { getAllCate, getCatePlaylist } from '../../../../network/playlist';
import { ICategory } from '../../../../constant/category';
import { PlaylistWrapper } from './style';
import CateList from '../../../../components/common/cateList';
import MsgItem from '../../../../components/content/msgItem';

import { IPlaylist } from '@/constant/playlist';
import { IUser } from '@/constant/user';
import { holder } from '../../../../utils/holder';
import { Image, Pagination } from 'antd';
import placeholder from '../../../../assets/img/holder/placeholder.png';

interface playlist extends IPlaylist {
  user: IUser;
}
interface ICatePlaylist {
  playlist: playlist;
  category: ICategory;
}
const Playlist: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [cate, setCate] = useState<ICategory[]>([]);
  const [cateName, setCateName] = useState<string>('流行');
  const [cateId, setCateId] = useState<string>('');
  const [catePlay, setCatePlay] = useState<ICatePlaylist[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    getAllCate<ICategory[]>(0, 10).then((data) => {
      if(data.length!==0){
        setCate(data);
        cateClick(data[0], 0);
      }
    });
  }, []);
  const cateClick = (item: ICategory, index: number) => {
    setCateName(item.name);
    setCateId(item.id);
    getCatePlaylist<{ playlists: ICatePlaylist[]; count: number }>(item.id, 0, 28).then((data) => {
      setCatePlay(data.playlists);
      setCount(data.count);
    });
  };
  const changePage = (val: number) => {
    getCatePlaylist<{ playlists: ICatePlaylist[]; count: number }>(cateId, (val - 1) * 28, 28).then((data: any) => {
      setCatePlay(data.playlists);
      setCount(data.count);
    });
  };
  const playlistRouter = (item: playlist, index: number) => {
    navigate('/Home/playlistDetail',{
      state: {
        id: item.id
      }
    });
  };
  const userRouter = (user: IUser) => {
    navigate('/Home/userDetail',{
      state: {
        userId: user.userId
      }
    });
  };
  return (
    <PlaylistWrapper className="center-content">
      <div className="header">
        <div className="current-cate">{cateName}</div>
        <CateList cateList={cate} cateClick={(item: ICategory, index: number) => cateClick(item, index)} />
      </div>
      <div className="cate-play-list">
        <ul>
          {catePlay &&
            catePlay.length !== 0 &&
            catePlay.map((item, index) => {
              return (
                <li key={item.playlist?.id}>
                  <MsgItem
                    isShowPlayCount={true}
                    img={
                      <Image
                        width={150}
                        height={150}
                        src={item.playlist?.coverUrl}
                        preview={false}
                        onClick={(e) => playlistRouter(item.playlist, index)}
                        className="cover-img"
                        fallback={placeholder}
                        placeholder={<Image preview={false} src={placeholder} width={150} height={150} />}
                      />
                    }
                    state={<span>{item.playlist?.name}</span>}
                    playCount={item.playlist?.playCount}
                    itemWidth="150px"
                    scale={1}
                  />
                  <div className="user-msg" onClick={(e) => userRouter(item.playlist.user)}>
                    <i className="iconfont icon-ttpodicon"> </i>
                    <span>{item.playlist?.user.userName}</span>
                  </div>
                </li>
              );
            })}
        </ul>
      </div>
      {count > 28 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={28}
            showTitle={false}
            showSizeChanger={false}
            onChange={(val: number) => changePage(val)}
          />
        </div>
      )}
    </PlaylistWrapper>
  );
};
export default memo(Playlist);

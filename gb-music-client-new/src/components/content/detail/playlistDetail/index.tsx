import React, { memo, FC, useEffect, useState } from 'react';
import { useNavigate,useLocation } from 'react-router-dom';
import { CheckOutlined } from '@ant-design/icons';
import UserMsg from '../../../common/userMsg';
import SongList from './childCpn/songList';
import Subscriber from './childCpn/subscriber';
import {
  PlaylistDetailWrapper,
  CenterContentWrapper,
  DetailHeader,
  ContentBody,
  LeftContent,
  RightContent
} from './style';
import { getPlaylistDetail } from '../../../../network/playlist';
import { formatTime } from '../../../../utils/format';
import { IPlaylist } from '../../../../constant/playlist';
import { ICategory } from '../../../../constant/category';
import { ISong } from '../../../../constant/song';
import { IUser } from '../../../../constant/user';
import TabControl from '../../../common/tabControl';
import Comment from './childCpn/comment';
import { cancelSub, sub } from '../../../../network/subscriber';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts"
import { changeUserDetailAction } from '../../../../views/Login/store/actionCreators';
import HotPlaylist from './childCpn/hotPlaylist';

interface IPlaylistDetail extends IPlaylist {
  category: ICategory[];
  songs: ISong[];
  user: IUser;
}
const PlaylistDetail: FC<{ id: string; userId: string }> = memo((props) => {
  const location = useLocation();
  const navigate = useNavigate();
  const { id } =location.state;
  const [pId, setPid] = useState<string>(id);
  const [playlistDetail, setPlaylist] = useState<IPlaylistDetail>();

  const dispatch = useAppDispatch();
  const { userDetail } = useAppSelector((state) => {
    return state['loginReducer']
  });
  useEffect(() => {
    getPlaylistDetail<IPlaylistDetail>(pId).then((data) => {
      setPlaylist(data);
    });
  }, [pId]);
  //收藏歌单
  const subPlayList = (): void => {
    if (playlistDetail) {
      if (!isSub()) {
        sub(playlistDetail.id, 'pId').then((data) => {
          dispatch(changeUserDetailAction());
        });
      }
      if (isSub()) {
        cancelSub(playlistDetail.id, 'pId').then((data) => {
          dispatch(changeUserDetailAction());
        });
      }
    }
  };
  const isSub = (): boolean => {
    let flag = -1;
    if (userDetail.subscriber && userDetail.subscriber.playlist) {
      flag = userDetail.subscriber.playlist.findIndex((item: { id: string; name: string }, index: number) => {
        if (item) return item.id === pId;
        else {
          return false;
        }
      });
    }
    return flag !== -1;
  };
  //热门歌单
  const hotClick = (id: string) => {
    setPid(id);
  };
  //用户详情页路由
  const userClick = (id: string) => {
    navigate('/Home/userDetail',{
      state: {
        userId: id,
        id: ''
      }
    });
  };
  const playlistRouter = () => {
    navigate('/Home/discover/playlist')
  };
  return (
    <PlaylistDetailWrapper>
      <CenterContentWrapper>
        <LeftContent>
          {playlistDetail && playlistDetail.user! && (
            <DetailHeader>
              <div className="img-container">
                <img src={playlistDetail!.coverUrl} alt="" />
              </div>
              <div className="msg">
                <div className="title">{playlistDetail.name}</div>
                <div className="user-msg">
                  <UserMsg
                    userId={playlistDetail.user.userId}
                    userName={playlistDetail.user.userName}
                    avatarUrl={playlistDetail.user.avatarUrl}
                    imgWidth="25px"
                    onClick={(id) => userClick(id)}
                  />
                  <div className="time">
                    <span>创建时间:</span>
                    {formatTime(playlistDetail.createTime, 'yyyy-MM-dd')}
                  </div>
                </div>
                <div className={`sub ${isSub() ? 'active' : ''}`} onClick={(e) => subPlayList()}>
                  {!isSub() && <i className="iconfont icon-xinjianshoucangjia"> </i>}
                  {isSub() && <CheckOutlined className="already" />}
                  {!isSub() && <span>收藏</span>}
                  {isSub() && <span>已收藏</span>}
                </div>
                {/*分类*/}
                <div className="cate">
                  <span>分类:</span>
                  <ul className="cate-list" onClick={(e) => playlistRouter()}>
                    {playlistDetail.category.length !== 0 &&
                      playlistDetail.category.map((item, index) => {
                        return <li key={item.id}>{item.name}</li>;
                      })}
                  </ul>
                </div>
                {/*歌曲，播放量*/}
                <div className="song-play">
                  <div className="song-count">
                    <span>歌曲:</span>
                    {playlistDetail.songs ? playlistDetail.songs.length : 0}
                  </div>
                  <div className="play-count">
                    <span>播放量:</span>
                    {playlistDetail.playCount}
                  </div>
                </div>
                {/*简介*/}
                <div className="desc">
                  <span>简介:</span>
                  {playlistDetail.description}
                </div>
              </div>
            </DetailHeader>
          )}
          {playlistDetail && (
            <ContentBody>
              <TabControl
                list={['歌曲列表', '评论', '收藏者']}
                contentName={['songList', 'comment', 'sub']}
                songList={<SongList songs={playlistDetail!.songs} pId={playlistDetail.id} isShowUp={false} />}
                comment={<Comment id={playlistDetail.id} />}
                sub={<Subscriber id={playlistDetail.id} />}
              />
            </ContentBody>
          )}
        </LeftContent>
        <RightContent>
          {playlistDetail && <HotPlaylist id={playlistDetail.id} onClick={(id: string) => hotClick(id)} />}
        </RightContent>
      </CenterContentWrapper>
    </PlaylistDetailWrapper>
  );
});
export default withRouter(PlaylistDetail);

import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { useAppSelector, useAppDispatch } from '@/store/hooks';
import { Modal,Empty,message } from 'antd';
import { useNavigate } from 'react-router-dom';

import { PlayPageWrapper, CenterContent } from './style';

import { addSongToPlay, getUserPlaylist } from '../../../network/playlist';
import { cancelFavorite, setUserFavorite } from '../../../network/user';
import { getAllComment, publishComment } from '../../../network/comment';
import { downloadSong } from '../../../network/song';

import { formatTime } from '../../../utils/format';

import Reply from '../../common/reply';
import Comment from '../../common/comment';
import IncludePlaylist from './childCpn/includePlaylist';
import ListInfo from '../listInfo';

import { changeUserDetailAction } from '../../../views/Login/store/asyncThunk';
import { changeIsShowAction } from '../vip/store/slice';

import { ILogin, IUserDetail, IUserMsg } from '../../../constant/store/login';
import { IComment } from '../../../constant/comment';
import { IPlaylist } from '../../../constant/playlist';
import { ISongStore } from '../../../constant/store/song';


const PlayPage: FC = memo((props): ReactElement => {
  const navigate = useNavigate();
  const [userAlbum, setAlbum] = useState<IPlaylist[]>([]);
  const [isShow, setIsShow] = useState<boolean>(false);
  const [comment, setComment] = useState<IComment[]>([]);
  const [total, setTotal] = useState<number>(0);
  const { songDetail, lyric, currentLyricIndex } = useAppSelector((state) => {
    return state['songReducer'];
  });
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer'];
  });
  const { userDetail } = useAppSelector((state) => {
    return state['loginReducer'];
  });
  const playType = useAppSelector((state) => {
    return state['playModeTypeReducer']['playType'];
  });
  const dispatch = useAppDispatch();
  useEffect(() => {
    getUserPlaylist(userMsg.userId).then((data: any) => {
      setAlbum(data.playlist);
    });
  }, [userMsg.userId]);
  //获取所有评论
  useEffect(() => {
    let id = 'songId';
    if (playType === 1) {
      id = 'cId';
    }
    getAllComment(songDetail.id, id, 0, 10).then((data: any) => {
      setComment(data.comments);
      setTotal(data.count);
    });
  }, [songDetail.id, playType]);

  const albumRouter = () => {
    if (playType === 0) {
      navigate('/Home/albumDetail', {
        state: {
          id: songDetail.album.id
        }
      });
    } else if (playType === 1) {
      navigate('/Home/channelDetail', {
        state: {
          id: songDetail.channel.id
        }
      });
    }
  };
  const artistRouter = () => {
    if (playType === 0) {
      navigate('/Home/artistDetail', {
        state: {
          id: songDetail.artist.id
        }
      });
    } else if (playType === 1) {
      navigate('/Home/userDetail', {
        state: {
          userId: songDetail.user.userId
        }
      });
    }
  };
  //收藏歌曲
  const subSong = () => {
    setIsShow(!isShow);
  };
  const handleCloseModal=()=>{
    setIsShow(false)
  }
  //为歌单添加歌曲
  const addSong = (item: IPlaylist, index: number) => {
    addSongToPlay(item.id, songDetail.id).then((data) => {
      setIsShow(false);
    }).finally(()=>{
      setIsShow(false);
    });
  };
  //用户喜欢歌曲
  const loveClick = () => {
    if (!isLove()) {
      setUserFavorite(songDetail.id).then((data: any) => {
        dispatch(changeUserDetailAction());
      });
    } else {
      cancelFavorite(songDetail.id).then((data: any) => {
        dispatch(changeUserDetailAction());
      });
    }
  };
  //发布
  const publish = (content: string): void => {
    if (content.trim().length !== 0 && songDetail.id) {
      if (playType === 0) {
        publishComment(content, 'songId', songDetail.id).then((data) => {
          getAllComment(songDetail.id, 'songId', 0, 10).then((data: any) => {
            setComment(data.comments);
            setTotal(data.count);
          });
        });
      } else if (playType === 1) {
        publishComment(content, 'cId', songDetail.id).then((data) => {
          getAllComment(songDetail.id, 'cId', 0, 10).then((data: any) => {
            setComment(data.comments);
            setTotal(data.count);
          });
        });
      }
    }
  };
  //回复
  const reply = () => {
    if (playType === 0) {
      getAllComment(songDetail.id, 'songId', 0, 10).then((data: any) => {
        setComment(data.comments);
        setTotal(data.count);
      });
    } else if (playType === 1) {
      getAllComment(songDetail.id, 'cId', 0, 10).then((data: any) => {
        setComment(data.comments);
        setTotal(data.count);
      });
    }
  };
  const handlePageChange = (e: number) => {
    getAllComment(songDetail.id, playType === 1 ? 'cId' : 'songId', (e - 1) * 10, 10).then((data: any) => {
      setComment(data.comments);
      setTotal(data.count);
    });
  };
  const isLove = (): boolean => {
    const index = userDetail.love.findIndex((item: { songId: string }, index: number) => {
      return item.songId === songDetail.id;
    });
    return index !== -1;
  };
  const payClick = () => {
    //dispatch(changeIsShowAction(true));
  };
  const videoRouter = () => {
    if (songDetail && songDetail.video) {
      navigate('/Home/videoDetail', {
        state: {
          id: songDetail.video.id
        }
      });
    }
  };
  const download = async () => {
    if (userMsg && userMsg.auth === 0) {
      message.warning("您还未开通VIP，开通后畅想")
    } else {
      const res = await downloadSong(songDetail.id, songDetail.name);
      const link = document.createElement('a')
      const blob = new Blob([res])


      link.href = URL.createObjectURL(blob)
      link.setAttribute('download', `${songDetail.name}.mp3`) // 自定义文件名
      document.body.appendChild(link)
      link.click()
      document.body.removeChild(link)

    }
  };
  return (
    <PlayPageWrapper>
      <CenterContent>
        <div className="play">
          <div className="play-album">
            <div className="rotate-album">
              <img src={songDetail.album ? songDetail.album.coverUrl : songDetail.channel.coverUrl} alt="cover" />
            </div>
            {playType === 0 && (
              <div className="control-btn">
                <ul>
                  <li onClick={(e) => loveClick()}>
                    {!isLove() && <i className="iconfont icon-love"> </i>}
                    {isLove() && (
                      <i className="iconfont icon-loveit" style={{ color: '#ec4141' }}>
                        {' '}
                      </i>
                    )}
                  </li>
                  <li title="收藏" onClick={(e) => subSong()}>
                    <i className="iconfont icon-xinjianshoucangjia"> </i>
                  </li>
                  <li onClick={(e) => download()}>
                    <i className="iconfont icon-download"> </i>
                  </li>
                </ul>
              </div>
            )}
          </div>
          {/* {isShow && (
            
          )} */}
          <Modal title={'添加至歌单'} open={isShow} footer={null} onCancel={handleCloseModal}>
            <div className="user-album g-user-playlist-container">
              
              {
                userAlbum && userAlbum.length!==0 && <ul className=''>
                {userAlbum.length !== 0 &&
                  userAlbum.map((item, index) => {
                    return (
                      <li key={item.id} onClick={(e) => addSong(item, index)}>
                        <ListInfo
                          img={<img src={item.coverUrl} alt="" />}
                          state={item.name}
                          creator={formatTime(item.createTime, 'yyyy-MM-dd')}
                          imgWidth="60px"
                        />
                      </li>
                    );
                  })}
              </ul>
              }
              {
                (!userAlbum || userAlbum.length===0) && <div className='g-playlist-no-empty-container'>
                  <Empty image={Empty.PRESENTED_IMAGE_SIMPLE}  description={"暂无歌单，请在 “我的歌单” 创建"}/>
                </div>
              }
            </div>
          </Modal>
          <div className="song-msg">
            <div className="song-name">
              <span className="mle">{songDetail.name}</span>
              <div className="tag">
                {songDetail && songDetail.vip === 1 && (
                  <span className="vip" onClick={(e) => payClick()}>
                    VIP
                  </span>
                )}
                {songDetail && songDetail.video && (
                  <span className="mv" onClick={(e) => videoRouter()}>
                    MV
                  </span>
                )}
              </div>
            </div>
            <ul>
              <li className="album-name text-nowrap">
                专辑:
                <span onClick={(e) => albumRouter()}>
                  {songDetail.album ? songDetail.album.name : songDetail.channel.name}
                </span>
              </li>
              <li className="artist-name text-nowrap">
                歌手:
                <span onClick={(e) => artistRouter()}>
                  {songDetail.artist ? songDetail.artist.name : songDetail.user.userName}
                </span>
              </li>
            </ul>
            <div className="lyric">
              <ul>
                {lyric &&
                  lyric !== '暂无歌词' &&
                  Array.isArray(lyric) &&
                  lyric.map((item: any, index: number) => {
                    return (
                      <li key={item.duration} className={index === currentLyricIndex ? 'active' : ''}>
                        {item.content}
                      </li>
                    );
                  })}
              </ul>
              {lyric === '暂无歌词' ? <div className="no-tip">{lyric}</div> : ''}
            </div>
          </div>
        </div>
        {/*评论信息*/}
        <div className="play-content">
          <div className="play-left">
            <p className="comment-title">歌曲评论</p>
            <Reply isShowPublish={true} isShowBtn={false} onClick={(content: string) => publish(content)} />
            <br />
            <Comment
              cols={70}
              repCols={65}
              comments={comment}
              pageClick={(e) => handlePageChange(e)}
              onClick={() => reply()}
              isPage={true}
              total={total}
            />
          </div>
          <div className="play-right">
            <IncludePlaylist id={songDetail.id} />
          </div>
        </div>
      </CenterContent>
    </PlayPageWrapper>
  );
});
export default PlayPage;

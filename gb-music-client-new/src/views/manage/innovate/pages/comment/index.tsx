import React, { memo, FC, ReactElement, useEffect, useState, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { CommentWrapper } from './style';
import { getUserAllComment } from '../../../../../network/manage/comment';
import { IUser } from '../../../../../constant/user';
import { formatTime } from '../../../../../utils/format';
import { Empty, Pagination } from 'antd';
import { holder } from '../../../../../utils/holder';
//import { changeMsgAction } from '../../../../../components/common/message/store/asyncThunk';
import { useDispatch } from 'react-redux';
import { deleteComment } from '../../../../../network/comment';

interface IUserComment {
  id: string;
  content: string;
  createTime: string;
  updateTime: string;
  user: IUser;
  alId: string;
  cId: string;
  mId: string;
  pId: string;
  replyId: string;
  songId: string;
  tId: string;
  vId: string;
  source: any;
}
const Comment: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [count, setCount] = useState<number>(0);
  const [userComment, setUserComment] = useState<IUserComment[]>([]);
  useEffect(() => {
    getUserAllComment(0, 5).then((data: any) => {
      setCount(data.count);
      setUserComment(data.comment);
    });
  }, []);
  const dispatch = useDispatch();
  const topRef = useRef<HTMLDivElement>(null);
  const backToTop = () => {
    if (topRef.current && topRef.current.parentNode) {
      let timber = setInterval(() => {
        let parent = topRef.current?.parentNode as Element;
        if (parent) {
          parent.scrollTop -= 150;
          if (parent.scrollTop <= 0) {
            clearInterval(timber);
          }
        }
      }, 10);
    }
  };
  const changePage = (val: number) => {
    backToTop();
    getUserAllComment((val - 1) * 5, 5).then((data: any) => {
      setCount(data.count);
      setUserComment(data.comment);
    });
  };
  const albumRouter = (item: IUserComment) => {
    navigate('/Home/albumDetail',{
      state: {
        id: item.source.id
      }
    });
  };
  const channelRouter = (item: IUserComment) => {
    navigate('/Home/channelDetail',{
      state: {
        id: item.source.id
      }
    });
  };
  const momentRouter = () => {
    navigate('/Home/moment');
  };
  const playlistRouter = (item: IUserComment) => {
    navigate('/Home/playlistDetail',{
      state: {
        id: item.pId
      }
    });
  };
  const toplistRouter = (item: IUserComment) => {
    navigate('/Home/toplistDetail',{
      state: {
        id: item.tId
      }
    });
  };
  const videoRouter = (item: IUserComment) => {
    navigate('/Home/videoDetail',{
      state: {
        id: item.vId
      }
    });
  };
  const deleteCom = (item: IUserComment) => {
    // @ts-ignore
    // dispatch(changeMsgAction(true)).then((data) => {
    //   if (data) {
    //     deleteComment(item.id).then((data) => {
    //       getUserAllComment(0, 5).then((data: any) => {
    //         setCount(data.count);
    //         setUserComment(data.comment);
    //       });
    //     });
    //   }
    // });
  };
  return (
    <CommentWrapper ref={topRef}>
      <h3>你的精彩评论({count})</h3>
      <ul className="comment-list">
        {userComment &&
          userComment.length !== 0 &&
          userComment.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="comment-content">
                  <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                  <div className="content text-nowrap">{item.content}</div>
                  <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd hh:mm')}</div>
                  <div className="del-btn" onClick={(e) => deleteCom(item)}>
                    <i className="iconfont icon-huishouzhan"> </i>
                  </div>
                </div>
                {item.alId && (
                  <div className="album-container">
                    <div className="source">评论来自专辑</div>
                    <div className="info">
                      <div className="img-container" onClick={(e) => albumRouter(item)}>
                        <img src={item.source.coverUrl} alt={'专辑'} />
                      </div>
                      <div className="name" onClick={(e) => albumRouter(item)}>
                        {item.source.name}
                      </div>
                    </div>
                  </div>
                )}
                {item.cId && (
                  <div className="channel-container">
                    <div className="source">评论来自电台</div>
                    <div className="info">
                      <div className="img-container" onClick={(e) => channelRouter(item)}>
                        <img src={item.source.coverUrl} alt={'电台'} />
                      </div>
                      <div className="name" onClick={(e) => channelRouter(item)}>
                        {item.source.name}
                      </div>
                    </div>
                  </div>
                )}
                {item.mId && (
                  <div className="moment-container">
                    <div className="source">评论来自动态</div>
                    <div className="info">
                      <div className="img-container" onClick={(e) => momentRouter()}>
                        <img src={item.source.coverUrl} alt={'动态'} />
                      </div>
                      <div className="name" onClick={(e) => momentRouter()}>
                        {item.source.name}
                      </div>
                    </div>
                  </div>
                )}
                {item.pId && (
                  <div className="playlist-container">
                    <div className="source">评论来自歌单</div>
                    <div className="info">
                      <div className="img-container" onClick={(e) => playlistRouter(item)}>
                        <img src={item.source.coverUrl} alt={'歌单'} />
                      </div>
                      <div className="name" onClick={(e) => playlistRouter(item)}>
                        {item.source.name}
                      </div>
                    </div>
                  </div>
                )}
                {item.replyId && (
                  <div className="comment-container">
                    <div className="source">评论来自回复评论</div>
                    <div className="reply-name">{item.source.name}</div>
                  </div>
                )}
                {item.songId && (
                  <div className="song-container">
                    <div className="source">评论来自歌曲</div>
                    <div className="name">{item.source.name}</div>
                  </div>
                )}
                {item.tId && (
                  <div className="toplist-container">
                    <div className="source">评论来自榜单</div>
                    <div className="info">
                      <div className="img-container" onClick={(e) => toplistRouter(item)}>
                        <img src={item.source.coverUrl} alt={'榜单'} />
                      </div>
                      <div className="name" onClick={(e) => toplistRouter(item)}>
                        {item.source.name}
                      </div>
                    </div>
                  </div>
                )}
                {item.vId && (
                  <div className="video-container">
                    <div className="source">评论来自视频</div>
                    <div className="info">
                      <div className="img-container" onClick={(e) => videoRouter(item)}>
                        <img src={item.source.coverUrl} alt={'视频'} />
                      </div>
                      <div className="name" onClick={(e) => videoRouter(item)}>
                        {item.source.name}
                      </div>
                    </div>
                  </div>
                )}
              </li>
            );
          })}
        {holder(userComment.length, 5).map((item, index) => {
          return (
            <li key={item} className="holder" style={{ border: 'none' }}>
              {' '}
            </li>
          );
        })}
      </ul>
      {count > 5 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={5}
            showSizeChanger={false}
            onChange={(val) => changePage(val)}
          />
        </div>
      )}
      {count < 1 && (
        <div className="comment-empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无评论'} />
        </div>
      )}
    </CommentWrapper>
  );
};
export default memo(Comment);

import React, { memo, FC, ReactElement, useEffect, useState, MouseEvent } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Map } from 'immutable';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { MomentsWrapper } from './style';
import { delMoment, getAllMoment } from '../../../../network/moment';
import { formatTime } from '../../../../utils/format';
import { Pagination, Skeleton } from 'antd';
import Reply from '../../../../components/common/reply';
import { getAllComment, publishComment } from '../../../../network/comment';
import { cancelThumb, thumb as thumbMoment } from '../../../../network/thumbs';
import Comment from '../../../../components/common/comment';

import { changeUserDetailAction } from '../../../Login/store/actionCreators';
import { changeSongDetailAction } from '../../../../components/content/playCoin/store/actionCreators';
import { changeShow } from '../../../../components/common/toast/store/actionCreators';
import { changeMsgAction } from '../../../../components/common/message/store/actionCreators';
import { IUser } from '../../../../constant/user';
import { ILogin, IUserMsg } from '../../../../constant/store/login';
import { IComment } from '../../../../constant/comment';
import { IMoment } from '../../../../constant/moment';

const Moments: FC<RouteComponentProps> = memo((props): ReactElement => {
  const [moments, setMoments] = useState<IMoment[]>([]);
  const [count, setCount] = useState<number>(0);
  const [comment, setComment] = useState<IComment[]>([]);
  const [totalCom, setTotalCom] = useState<number>(0);
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const [liveIndex, setLiveIndex] = useState<number>(-1);

  const { userMsg } = useSelector<Map<string, ILogin>, { userMsg: IUserMsg }>((state) => ({
    userMsg: state.getIn(['loginReducer', 'login', 'userMsg'])
  }));
  const dispatch = useDispatch();
  useEffect(() => {
    getAllMoment<{ moments: IMoment[]; count: number }>(0, 6).then((data) => {
      setMoments(data.moments);
      setCount(data.count);
    });
  }, []);
  useEffect(() => {
    document.addEventListener('click', () => {
      setLiveIndex(-1);
    });
  }, []);
  //function handle
  const publish = (content: string, item: IMoment) => {
    publishComment(content, 'mId', item.id).then((data) => {
      getAllComment<{ comments: IComment[]; count: number }>(item.id, 'mId', 0, 10).then((data) => {
        setComment(data.comments);
        setTotalCom(data.count);
      });
    });
  };
  const thumb = (item: IMoment) => {
    thumbMoment('momentId', item.id).then((data) => {
      dispatch(changeUserDetailAction());
    });
  };
  //取消点赞
  const cancelClick = (item: IMoment) => {
    cancelThumb('momentId', item.id).then((data) => {
      dispatch(changeUserDetailAction());
    });
  };
  const showComment = (item: IMoment, index: number) => {
    setCurrentIndex(index);
    getAllComment<{ comments: IComment[]; count: number }>(item.id, 'mId', 0, 10).then((data) => {
      setComment(data.comments);
      setTotalCom(data.count);
    });
  };
  const reply = (item: IMoment) => {
    getAllComment<{ comments: IComment[]; count: number }>(item.id, 'mId', 0, 30).then((data) => {
      setComment(data.comments);
      setTotalCom(data.count);
    });
  };
  const pageChange = (e: number, item: IMoment) => {
    getAllComment<{ comments: IComment[]; count: number }>(item.id, 'mId', (e - 1) * 10, 10).then((data) => {
      setComment(data.comments);
      setTotalCom(data.count);
    });
  };

  const playSong = (item: IMoment) => {
    const { vip } = item.song;
    const { auth } = userMsg;
    if (vip === 1 && auth * 1 === 0) {
      dispatch(changeShow('您正在试听VIP歌曲，开通VIP后畅想', 3000));
    }
    dispatch(changeSongDetailAction(item.song.id));
  };
  //删除动态
  const deleteMom = (item: IMoment, index: number) => {
    // @ts-ignore
    dispatch(changeMsgAction(true)).then((data) => {
      if (data) {
        delMoment(item.id).then((data) => {
          dispatch(changeShow('删除成功', 1500));
          getAllMoment<{ moments: IMoment[]; count: number }>(0, 6).then((data) => {
            setMoments(data.moments);
            setCount(data.count)
          });
        });
      }
    });
  };
  //删除按钮显示
  const delClick = (e: MouseEvent<HTMLDivElement>, item: IMoment, index: number): void => {
    e.stopPropagation();
    setLiveIndex(index);
  };
  const changePage = (val: number) => {
    setCurrentIndex(-1);
    getAllMoment(6 * (val - 1), 6).then((data: any) => {
      setMoments(data.moments);
      setCount(data.count);
    });
  };
  const userRouter = (item: IUser) => {
    props.history.push({
      pathname: '/Home/userDetail',
      state: {
        userId: item.userId
      }
    });
  };
  return (
    <MomentsWrapper>
      {moments &&
        moments.length !== 0 &&
        Array.isArray(moments) &&
        moments.map((item: IMoment, index: number) => {
          return (
            <li key={item.id}>
              <div className="avatar" onClick={(e) => userRouter(item.user)}>
                <img src={item.user.avatarUrl} alt="" />
              </div>
              <div className="msg">
                <div className="time-name">
                  <div className="name">
                    <div className="user-name">{item.user.userName}</div>
                    <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd hh:mm:ss')}</div>
                  </div>
                  <div className="operator" onClick={(e) => delClick(e, item, index)}>
                    <i className="iconfont icon-MoreVertical"> </i>
                    <div
                      className="del-outer"
                      style={{ display: liveIndex === index ? 'block' : 'none' }}
                      onClick={(e) => deleteMom(item, index)}
                    >
                      <i className="iconfont icon-huishouzhan"> </i>
                    </div>
                  </div>
                </div>
                <div className="content">{item.content}</div>
                <div className="music">
                  <div className="img-container" onClick={(e) => playSong(item)}>
                    <img src={item.song.album.coverUrl} alt="" />
                  </div>
                  <div className="song-info">
                    <div className="vip-song-name">
                      <div className="song-name">{item.song.name}</div>
                      {item.song.vip === 1 && <div className="is-vip">VIP</div>}
                    </div>
                    <div className="artist-name">{item.song.artist.name}</div>
                  </div>
                </div>
                <div className="picture">
                  <img src={item.picUrl} alt="" />
                </div>
                {
                  <Reply
                    isShowBtn={true}
                    isShowPublish={false}
                    onClick={(content: string) => publish(content, item)}
                    thumbClick={() => thumb(item)}
                    cancelThumb={() => cancelClick(item)}
                    showCommentClick={() => showComment(item, index)}
                    id={item.id}
                  />
                }
                {currentIndex === index && (
                  <Comment
                    comments={comment}
                    onClick={() => reply(item)}
                    total={totalCom}
                    isPage={true}
                    pageClick={(e) => pageChange(e, item)}
                  />
                )}
              </div>
            </li>
          );
        })}
      {count > 6 && (
        <li id="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={6}
            showTitle={false}
            onChange={(val: number) => changePage(val)}
          />
        </li>
      )}
      {count < 1 && (
        <li style={{ display: 'block' }}>
          <Skeleton avatar paragraph={{ rows: 4 }} />
          <br />
          <br />
          <Skeleton avatar paragraph={{ rows: 4 }} />
          <br />
          <br />
          <Skeleton avatar paragraph={{ rows: 4 }} />
          <br />
          <br />
        </li>
      )}
    </MomentsWrapper>
  );
});
export default withRouter(Moments);

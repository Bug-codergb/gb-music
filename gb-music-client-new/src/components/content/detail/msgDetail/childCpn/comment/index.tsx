import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { CommentWrapper } from './style';
import { deleteMsg, getCommentMsg, readSingleMsg } from '../../../../../../network/message';
import { IUser } from '../../../../../../constant/user';
import { IComment } from '../../../../../../constant/comment';
import { Empty, Pagination } from 'antd';
import { useDispatch } from 'react-redux';
import { changeMsgAction } from '../../../../../common/message/store/actionCreators';
import { changeShow } from '../../../../../common/toast/store/actionCreators';

interface IMsgComment {
  id: string;
  checkout: number;
  createTime: string;
  content: string;
  user: IUser;
  comment: IComment;
  updateTime: string;
}
const Comment: FC<RouteComponentProps> = (props): ReactElement => {
  const [count, setCount] = useState<number>(0);
  const [commentMsg, setCommentMsg] = useState<IMsgComment[]>([]);
  const dispatch = useDispatch();
  useEffect(() => {
    getCommentMsg('0', '10').then((data: any) => {
      setCount(data.count);
      setCommentMsg(data.message);
    });
  }, []);
  const changePage = (val: number) => {
    getCommentMsg(`${(val - 1) * 10}`, '10').then((data: any) => {
      setCount(data.count);
      setCommentMsg(data.message);
    });
  };
  const deleteMessage = (item: IMsgComment) => {
    // @ts-ignore
    dispatch(changeMsgAction(true)).then((data) => {
      if (data) {
        deleteMsg(item.id).then((data) => {
          dispatch(changeShow('删除成功', 1500));
          getCommentMsg('0', '10').then((data: any) => {
            setCount(data.count);
            setCommentMsg(data.message);
          });
        });
      }
    });
  };
  const readMsg = (item: IMsgComment) => {
    dispatch(changeShow('消息已读', 1500));
    readSingleMsg(item.id).then((data) => {
      getCommentMsg('0', '10').then((data: any) => {
        setCount(data.count);
        setCommentMsg(data.message);
      });
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
    <CommentWrapper>
      <ul className="video-msg-list">
        {commentMsg.length !== 0 &&
          commentMsg.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="video-msg-content">
                  <div className="left-content">
                    <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                    {item.checkout === 0 && <div className="is-read"> </div>}
                    <div className="img-container" onClick={(e) => userRouter(item.user)}>
                      <img src={item.user.avatarUrl} alt={item.user.userName} />
                    </div>
                  </div>
                  <div className="right-content">
                    <div className="video-msg-info">
                      <div className="user-name" onClick={(e) => userRouter(item.user)}>
                        {item.user.userName}
                      </div>
                      <div className="operator">{item.content}</div>
                      <div className="video-name" onClick={(e) => readMsg(item)}>
                        {item.comment.content}
                      </div>
                    </div>
                    <div className="video-cover">{/*<img src={item.video.coverUrl} alt={item.vid.name}/>*/}</div>
                  </div>
                </div>
                <div className="delete-msg" onClick={(e) => deleteMessage(item)}>
                  <i className="iconfont icon-huishouzhan"> </i>
                </div>
              </li>
            );
          })}
      </ul>
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
      {count === 0 && (
        <div className="empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无通知'} />
        </div>
      )}
    </CommentWrapper>
  );
};
export default withRouter(memo(Comment));

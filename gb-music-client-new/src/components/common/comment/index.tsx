import React, { memo, FC, ReactElement } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts"

import { Pagination } from 'antd';

import { CommentWrapper } from './style';
import { IComment } from '../../../constant/comment';
import { formatTime } from '../../../utils/format';
import Reply from '../reply';
import { deleteComment, replyComment } from '../../../network/comment';
import { cancelThumb, thumb as thumbComment } from '../../../network/thumbs';
import { changeUserDetailAction } from '../../../views/Login/store/asyncThunk';

import { publishMessage } from '../../../network/message';
import placeholder from "../../../assets/img/holder/user-placehoder.png";
import { IUser } from '../../../constant/user';

interface IProps  {
  isPage: boolean;
  total: number;
  comments: IComment[];
  onClick: () => void;
  pageClick?: (count: number) => void;
}
const Comment: FC<IProps> = memo((props): ReactElement => {
  const navigate = useNavigate()
  const { comments, onClick, isPage, total, pageClick } = props;
  const dispatch = useAppDispatch();
  const reply = (content: string, item: IComment): void => {
    if (content.trim().length !== 0) {
      replyComment(item.id, content).then((data) => {
        onClick();
      });
    }
  };
  const thumb = (item: IComment): void => {
    thumbComment('commentId', item.id).then((data) => {
      publishMessage('/comment', '点赞了', 'cId', item.id).then(()=>{}).catch(()=>{});
      dispatch(changeUserDetailAction());
    });
  };
  const cancelThumbs = (item: IComment) => {
    cancelThumb('commentId', item.id).then((data) => {
      dispatch(changeUserDetailAction());
    });
  };
  const pageChange = (e: number) => {
    if (pageClick) {
      pageClick(e);
    }
  };
  const deleteCom = (item: IComment) => {
    // @ts-ignore
   /* dispatch(changeMsgAction(true)).then((data) => {
      if (data) {
        deleteComment(item.id).then((data: any) => {
          onClick();
        });
      }
    });*/
  };
  const userRouter = (item: IUser) => {
    navigate('/Home/userDetail',{
      state: {
        userId: item.userId
      }
    });
  };
  return (
    <CommentWrapper>
      {comments && comments.length !== 0 && <h3 className="title">精彩评论（{total}）</h3>}
      <ul className="comment-list">
        {comments &&
          comments.length !== 0 &&
          comments.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="img-container" onClick={(e) => userRouter(item.user)}>
                  {
                    item.user.avatarUrl&&<img src={item.user.avatarUrl} alt="" />
                  }
                  {
                    !item.user.avatarUrl&&<img src={placeholder} alt=""/>
                  }
                </div>
                <div className="msg">
                  <div className="user-name">{item.user.userName}:</div>
                  <div className="content">{item.content}</div>
                  <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd hh:mm:ss')}</div>
                  <div className="reply-comment-btn">
                    <Reply
                      onClick={(content: string) => reply(content, item)}
                      isShowBtn={true}
                      isShowPublish={false}
                      thumbClick={() => thumb(item)}
                      cancelThumb={() => cancelThumbs(item)}
                      delComment={() => deleteCom(item)}
                      id={item.id}
                      userId={item.user.userId}
                    />
                  </div>
                  <ul className="reply">
                    {item.reply &&
                      item.reply.map((item, index) => {
                        return (
                          <li key={item.id}>
                            <div className="reply-msg">
                              <div className="re-avatar" onClick={(e) => userRouter(item.user)}>
                                {
                                  item.user.avatarUrl&&<img src={item.user.avatarUrl} alt="" />
                                }
                                {
                                  !item.user.avatarUrl&&<img src={placeholder} alt=""/>
                                }
                              </div>
                            </div>
                            <div>
                              <div className="reply-user-name">{item.user.userName}</div>
                              <div className="reply-content">{item.content}</div>
                              <div className="reply-time">{formatTime(item.createTime, 'yyyy-MM-dd hh:mm:ss')}</div>
                              <div className="reply-reply-comment-btn">
                                <Reply
                                  onClick={(content: string) => reply(content, item)}
                                  isShowBtn={true}
                                  isShowPublish={false}
                                  thumbClick={() => thumb(item)}
                                  cancelThumb={() => cancelThumbs(item)}
                                  delComment={() => deleteCom(item)}
                                  id={item.id}
                                  userId={item.user.userId}
                                />
                              </div>
                            </div>
                          </li>
                        );
                      })}
                  </ul>
                </div>
              </li>
            );
          })}
      </ul>
      {comments && comments.length !== 0 && total > 10 && (
        <div className="page">
          <Pagination defaultCurrent={1} total={total} pageSize={10} onChange={(e) => pageChange(e)} />
        </div>
      )}
    </CommentWrapper>
  );
});
export default memo(Comment);

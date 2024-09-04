import React, { memo, FC, ReactElement } from 'react';
import { Empty } from 'antd';
import { IUser } from '../../../../../../../constant/user';
import { CommentWrapper } from './style';
type comment = {
  content: string;
  createTime: string;
  updateTime: string;
  id: string;
  user: IUser;
};
interface IComment {
  checkout: number;
  content: string;
  id: string;
  updateTime: string;
  createTime: string;
  user: IUser;
  comment: comment;
}
interface IProps {
  comment: IComment[];
}
const Comment: FC<IProps> = (props): ReactElement => {
  const { comment } = props;
  return (
    <CommentWrapper>
      <ul className="comment-list">
        {comment &&
          comment.length !== 0 &&
          comment.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="symbol"> </div>
                <div className="comment-content">
                  <div className="img-container">
                    <img src={item.user.avatarUrl} alt={item.user.userName} />
                  </div>
                  <div className="right-comment-content">
                    <div className="user-name">
                      <span>{item.user.userName}</span>
                      赞了你的评论
                    </div>
                    <div className="content text-nowrap" title={item.comment.content}>
                      {item.comment.content}
                    </div>
                  </div>
                </div>
              </li>
            );
          })}
      </ul>
      {comment.length === 0 && (
        <div className="empty">
          <Empty description="暂无新通知" />
        </div>
      )}
    </CommentWrapper>
  );
};
export default memo(Comment);

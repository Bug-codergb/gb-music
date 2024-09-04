import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { CommentWrapper } from './style';
import Reply from '../../../../../common/reply';
import AlbumComment from '../../../../../common/comment/index';
import { getAllComment, publishComment } from '../../../../../../network/comment';
import { IComment } from '../../../../../../constant/comment';

interface IProps {
  id: string;
}
const Comment: FC<IProps> = (props): ReactElement => {
  const { id } = props;
  const [total, setTotal] = useState<number>(0);
  const [comment, setComment] = useState<IComment[]>([]);
  useEffect(() => {
    getAllComment<{ comments: IComment[]; count: number }>(id, 'alId', 0, 30).then((data) => {
      setComment(data.comments);
      setTotal(data.count);
    });
  }, [id]);
  //发表专辑评论
  const publish = (content: string) => {
    publishComment(content, 'alId', id).then((data) => {
      getAllComment<{ comments: IComment[]; count: number }>(id, 'alId', 0, 30).then((data) => {
        setComment(data.comments);
        setTotal(data.count);
      });
    });
  };
  //回复评论
  const reply = () => {
    getAllComment<{ comments: IComment[]; count: number }>(id, 'alId', 0, 30).then((data) => {
      setComment(data.comments);
      setTotal(data.count);
    });
  };
  return (
    <CommentWrapper>
      <div className="publish-comment">
        <Reply onClick={(content: string) => publish(content)} isShowBtn={false} isShowPublish={true} />
      </div>
      <p>专辑评论</p>
      <AlbumComment comments={comment} onClick={() => reply()} total={total} isPage={true} />
    </CommentWrapper>
  );
};
export default memo(Comment);

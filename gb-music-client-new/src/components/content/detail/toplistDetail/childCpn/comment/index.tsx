import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { CommentWrapper } from './style';
import Reply from '../../../../../common/reply';
import ToplistComment from '../../../../../common/comment/index';
import { getAllComment, publishComment } from '../../../../../../network/comment';
import { IComment } from '../../../../../../constant/comment';
interface IProps {
  id: string;
}
const Comment: FC<IProps> = memo((props): ReactElement => {
  const { id } = props;
  const [comments, setComment] = useState<IComment[]>([]);
  const [total, setTotal] = useState<number>(0);
  useEffect(() => {
    getAllComment(id, 'tId', 0, 30).then((data: any) => {
      setComment(data.comments);
      setTotal(data.count);
    });
  }, [id]);
  const publish = (content: string) => {
    publishComment(content, 'tId', id).then((data) => {
      getAllComment(id, 'tId', 0, 30).then((data: any) => {
        setComment(data.comments);
        setTotal(data.count);
      });
    });
  };
  const reply = () => {
    getAllComment(id, 'tId', 0, 30).then((data: any) => {
      setComment(data.comments);
      setTotal(data.count);
    });
  };
  return (
    <CommentWrapper>
      <Reply isShowBtn={false} isShowPublish={true} id={id} onClick={(content: string) => publish(content)} />

      <ToplistComment comments={comments} onClick={() => reply()} isPage={true} total={total} />
    </CommentWrapper>
  );
});
export default Comment;

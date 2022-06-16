import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { CommentWrapper } from './style';
import Reply from '../../../../../common/reply';
import PlayListComment from '../../../../../common/comment/index';
import { getAllComment, publishComment } from '../../../../../../network/comment';
import { IComment } from '../../../../../../constant/comment';
interface IProps {
  id: string;
}
const Comment: FC<IProps> = ({ id }): ReactElement => {
  const [comment, setComment] = useState<IComment[]>([]);
  const [total, setTotal] = useState<number>(0);
  //获取所有评论
  useEffect(() => {
    getAllComment(id, 'pId', 0, 30).then((data: any) => {
      //console.log(data);
      setComment(data.comments);
      setTotal(data.count);
    });
  }, [id]);
  //发布歌单评论
  const publish = (content: string) => {
    publishComment(content, 'pId', id).then((data) => {
      getAllComment(id, 'pId', 0, 30).then((data: any) => {
        setComment(data.comments);
        setTotal(data.count);
      });
    });
  };
  //回复评论
  const reply = () => {
    getAllComment(id, 'pId', 0, 30).then((data: any) => {
      setComment(data.comments);
      setTotal(data.total);
    });
  };
  return (
    <CommentWrapper>
      <div className="publish-comment">
        <Reply onClick={(content: string) => publish(content)} isShowBtn={false} isShowPublish={true} />
        <p>歌单评论:</p>
        <PlayListComment comments={comment} onClick={() => reply()} isPage={true} total={total} />
      </div>
    </CommentWrapper>
  );
};
export default memo(Comment);

import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { CommentWrapper } from './style';
import Reply from '../../../../../common/reply';
import { getAllComment, publishComment } from '../../../../../../network/comment';
import VideoComment from '../../../../../common/comment/index';
import { IComment } from '../../../../../../constant/comment';
interface IProps {
  vid: string;
}
const Comment: FC<IProps> = (props): ReactElement => {
  const { vid } = props;
  const [comment, setComment] = useState<IComment[]>([]);
  const [total, setTotal] = useState<number>(0);
  useEffect(() => {
    getAllComment(vid, 'vId', 0, 30).then((data: any) => {
      setComment(data.comments);
      setTotal(data.count);
    });
  }, [vid]);
  const publish = (content: string) => {
    publishComment(content, 'vId', vid).then((data) => {
      getAllComment(vid, 'vId', 0, 30).then((data: any) => {
        setComment(data.comments);
        setTotal(data.count);
      });
    });
  };
  const reply = (): void => {
    getAllComment(vid, 'vId', 0, 30).then((data: any) => {
      setComment(data.comments);
      setTotal(data.total);
      console.log(data.total);
    });
  };
  return (
    <CommentWrapper>
      <h3>视频评论</h3>
      <Reply onClick={(content: string) => publish(content)} isShowPublish={true} isShowBtn={false} />
      <div className="video-comment">
        <VideoComment comments={comment} onClick={() => reply()} total={total} isPage={true} />
      </div>
    </CommentWrapper>
  );
};
export default memo(Comment);

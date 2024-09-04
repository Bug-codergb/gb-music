import React, { memo, FC, ReactElement, useState, FormEvent } from 'react';
import { Map } from 'immutable';
import { ReplyWrapper } from './style';
import { useSelector } from 'react-redux';
import { ILogin, IUserDetail } from '../../../constant/store/login';

interface IProps {
  id?: string;
  userId?: string;
  onClick: (content: string) => void;
  thumbClick?: () => void;
  cancelThumb?: () => void;
  delComment?: () => void;
  showCommentClick?: () => void;
  isShowBtn: boolean;
  isShowPublish: boolean;
}
const Reply: FC<IProps> = (props): ReactElement => {
  const { onClick, thumbClick, isShowBtn, isShowPublish, showCommentClick, id, userId, delComment, cancelThumb } =
    props;
  const [content, setContent] = useState<string>('');
  const [isShow, setIsShow] = useState<boolean>(false);
  const { userDetail } = useSelector<Map<string, ILogin>, { userDetail: IUserDetail }>((state) => ({
    userDetail: state.getIn(['loginReducer', 'login', 'userDetail'])
  }));
  const publish = () => {
    onClick(content);
    setContent('');
    setIsShow(false);
  };
  const thumb = () => {
    if (thumbClick && cancelThumb) {
      if (!isThumb()) {
        thumbClick();
      } else {
        cancelThumb();
      }
    }
  };
  const changeContent = (e: FormEvent<HTMLTextAreaElement>) => {
    setContent(e.currentTarget.value);
  };
  const liClick = () => {
    setIsShow(!isShow);
    if (showCommentClick) {
      showCommentClick();
    }
  };
  const isThumb = (): boolean => {
    let momentFlag = -1;
    let commentFlag = -1;
    let videoFlag = -1;
    if (userDetail.thumb && userDetail.thumb.moment) {
      momentFlag = userDetail.thumb.moment.findIndex((item: string, index: number) => {
        return id === item;
      });
    }
    if (userDetail.thumb && userDetail.thumb.comment) {
      commentFlag = userDetail.thumb.comment.findIndex((item: string, index: number) => {
        return id === item;
      });
    }
    if (userDetail.thumb && userDetail.thumb.video) {
      videoFlag = userDetail.thumb.video.findIndex((item: string, index: number) => {
        return id === item;
      });
    }
    return momentFlag !== -1 || commentFlag !== -1 || videoFlag !== -1;
  };
  const deleteCom = () => {
    if (delComment) {
      delComment();
    }
  };
  return (
    <ReplyWrapper>
      {isShowBtn && (
        <ul className="control-btn">
          <li onClick={(e) => thumb()} className={isThumb() ? 'active' : ''}>
            <i className="iconfont icon-dianzan"> </i>
          </li>
          <li onClick={(e) => liClick()}>
            <i className="iconfont icon-pinglun1"> </i>
          </li>
          {userDetail.userId === userId && (
            <li onClick={(e) => deleteCom()}>
              <i className="iconfont icon-huishouzhan"> </i>
            </li>
          )}
        </ul>
      )}
      {(isShow || isShowPublish) && (
        <div className="publish">
          <textarea cols={80} rows={3} onInput={(e) => changeContent(e)} value={content} />
          <div className="reply-btn" onClick={(e) => publish()}>
            发表评论
          </div>
        </div>
      )}
    </ReplyWrapper>
  );
};
export default memo(Reply);

import React, { memo, FC, ReactElement, useState, useEffect,FormEvent } from 'react';

import { ReplyWrapper } from './style';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts"
import { ILogin, IUserDetail } from '../../../constant/store/login';
import { Modal } from 'antd';
import { useNavigate } from 'react-router-dom';

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
  cols?:number,
  isReply?:boolean
}
const Reply: FC<IProps> = (props): ReactElement => {
  const [modal, contextHolder] = Modal.useModal();
  const navigate = useNavigate();
  const { onClick, thumbClick, isShowBtn, isShowPublish,cols = 80,isReply=true, showCommentClick, id, userId, delComment, cancelThumb } =
    props;
  const [content, setContent] = useState<string>('');
  const [isShow, setIsShow] = useState<boolean>(false);
  const { userDetail } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const publish = () => {
    if(!userDetail || Object.keys(userDetail).length === 0) {
      modal.confirm({
        type:"warning",
        title:"提示",
        content:"您还未登录，登录后享受更多内容，去登录？"
      }).then((ret)=>{
        if(ret){
          navigate("/Login")
        }
      })
      return
    }
    onClick(content);
    setContent('');
    setIsShow(false);
  };
  const thumb = () => {
    if(!userDetail || Object.keys(userDetail).length === 0) {
      modal.confirm({
        type:"warning",
        title:"提示",
        content:"您还未登录，登录后享受更多内容，去登录？"
      }).then((ret)=>{
        if(ret){
          navigate("/Login")
        }
      })
      return
    }
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
    if(!userDetail || Object.keys(userDetail).length === 0) {
      modal.confirm({
        type:"warning",
        title:"提示",
        content:"您还未登录，登录后享受更多内容，去登录？"
      }).then((ret)=>{
        if(ret){
          navigate("/Login")
        }
      })
      return
    }
    setIsShow(!isShow);
    if (showCommentClick) {
      showCommentClick();
    }
  };

  const isThumb = (): boolean => {
    let momentFlag = -1;
    let commentFlag = -1;
    let videoFlag = -1;
    if (userDetail && userDetail.thumb && userDetail.thumb.moment) {
      momentFlag = userDetail.thumb.moment.findIndex((item: string, index: number) => {
        return id === item;
      });
    }
    if (userDetail && userDetail.thumb && userDetail.thumb.comment) {
      commentFlag = userDetail.thumb.comment.findIndex((item: string, index: number) => {
        return id === item;
      });
    }
    if (userDetail && userDetail.thumb && userDetail.thumb.video) {
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

          {
            isReply && <li onClick={(e) => liClick()}>
            <i className="iconfont icon-pinglun1"> </i>
          </li>
          }
          {userDetail && userDetail.userId === userId && (
            <li onClick={(e) => deleteCom()}>
              <i className="iconfont icon-huishouzhan"> </i>
            </li>
          )}
        </ul>
      )}
      {(isShow || isShowPublish) && (
        <div className="publish">
          <textarea cols={cols} rows={3} onInput={(e) => changeContent(e)} value={content} />
          <div className="reply-btn" onClick={(e) => publish()}>
            发表评论
          </div>
        </div>
      )}
      {
        contextHolder
      }
    </ReplyWrapper>
  );
};
export default memo(Reply);

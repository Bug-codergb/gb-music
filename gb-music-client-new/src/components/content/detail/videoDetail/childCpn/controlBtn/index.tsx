import React, { memo, FC, ReactElement } from 'react';

import { CheckOutlined } from '@ant-design/icons';
import { cancelSub, sub } from '../../../../../../network/subscriber';
import { cancelThumb, thumb as thumbVideo } from '../../../../../../network/thumbs';
import { ControlBtnWrapper } from './style';
import { useAppSelector,useAppDispatch } from "@/store/hooks"
import { changeUserDetailAction } from '../../../../../../views/Login/store/actionCreators';
import { ILogin, IUserDetail } from '../../../../../../constant/store/login';

interface IProps {
  vid: string;
}
const ControlBtn: FC<IProps> = memo((props): ReactElement => {
  const { vid } = props;
  const dispatch = useAppDispatch();
  const { userDetail } = useAppSelector((state) => {
    return  state['loginReducer']
  });
  const subVideo = (): void => {
    if (!isSub()) {
      sub(vid, 'vId').then((data) => {
        dispatch(changeUserDetailAction());
      });
    } else if (isSub()) {
      cancelSub(vid, 'vId').then((data) => {
        dispatch(changeUserDetailAction());
      });
    }
  };
  const thumb = () => {
    if (!isThumb()) {
      thumbVideo('vId', vid).then((data) => {
        dispatch(changeUserDetailAction());
      });
    } else if (isThumb()) {
      cancelThumb('vId', vid).then((data) => {
        dispatch(changeUserDetailAction());
      });
    }
  };
  const isThumb = (): boolean => {
    let flag = -1;
    if (userDetail.thumb && userDetail.thumb.video) {
      flag = userDetail.thumb.video.findIndex((item: string, index: number) => {
        return item === vid;
      });
    }
    return flag !== -1;
  };
  const isSub = (): boolean => {
    let flag = -1;
    if (userDetail.subscriber && userDetail.subscriber.video) {
      flag = userDetail.subscriber.video.findIndex((item: { id: string; name: string }, index: number) => {
        if (item) return item.id === vid;
        else {
          return false;
        }
      });
    }
    return flag !== -1;
  };
  return (
    <ControlBtnWrapper>
      <div className={`thumb ${isThumb() ? 'active' : ''}`} onClick={(e) => thumb()}>
        <i className="iconfont icon-dianzan"> </i>
        <span>赞</span>
      </div>
      <div className={`sub-video ${isSub() ? 'active' : ''}`} onClick={(e) => subVideo()}>
        {!isSub() && <i className="iconfont icon-jiarushoucang"> </i>}
        {isSub() && <CheckOutlined className="already" />}
        {!isSub() && <span>收藏</span>}
        {isSub() && <span>已收藏</span>}
      </div>
    </ControlBtnWrapper>
  );
});
export default ControlBtn;

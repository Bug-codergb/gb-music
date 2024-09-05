import React, { memo, useEffect, useState, MouseEvent } from 'react';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";
import { CSSTransition } from 'react-transition-group';
import { UserMsgWrapper } from './style';

import UserInfo from './childCpn/userInfo';
import Profile from './childCpn/profile';
import { ILogin, IUserMsg } from '../../../../../constant/store/login';

const UserMsg: React.FC = () => {
  const [isShow, setIsShow] = useState<boolean>(false);
  const [isShowProfile, setIsShowProfile] = useState<boolean>(false);
  const { loginType } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const docClick = () => {
    setIsShow(false);
  };
  useEffect(() => {
    document.addEventListener('click', docClick);
  }, []);
  useEffect(() => {
    return () => {
      document.removeEventListener('click', docClick);
    };
  }, []);
  const changeShow = (e: MouseEvent<HTMLDivElement>) => {
    e.stopPropagation();
    setIsShow(!isShow);
  };
  const infoClick = (): void => {
    setIsShowProfile(true);
  };
  const exit = (): void => {
    setIsShowProfile(false);
  };
  return (
    <UserMsgWrapper>
      <div className="avatar" onClick={(e) => changeShow(e)}>
        {loginType === 0 ? (
          <i className="iconfont icon-user1"> </i>
        ) : userMsg.avatarUrl ? (
          <img src={userMsg?.avatarUrl + '&w=42'} alt="暂无头像" />
        ) : (
          <i className="iconfont icon-user1"> </i>
        )}
      </div>
      <div className="user-name" onClick={(e) => changeShow(e)}>
        {loginType === 0 ? <span>未登录</span> : <span>{userMsg.userName}</span>}
      </div>
      {userMsg && userMsg.auth === 1 && <div className="is-vip">VIP</div>}
      <CSSTransition in={isShow} timeout={1000} unmountOnExit={true} classNames="userInfo">
        <UserInfo onClick={() => infoClick()} />
      </CSSTransition>
      <CSSTransition timeout={1000} in={isShowProfile} unmountOnExit={true} classNames="profile">
        <Profile onClick={exit} />
      </CSSTransition>
    </UserMsgWrapper>
  );
};
export default memo(UserMsg);

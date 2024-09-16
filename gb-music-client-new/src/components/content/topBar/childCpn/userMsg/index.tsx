import React, { memo, useEffect, useState, MouseEvent, useRef } from 'react';
import { Dropdown, Space } from 'antd';
import type { MenuProps } from 'antd';
import { useNavigate } from 'react-router-dom';
import { logoutAction } from '@/views/Login/store/asyncThunk';
import { PoweroffOutlined, PoundCircleOutlined, UserOutlined } from '@ant-design/icons';

import { useAppDispatch, useAppSelector } from '@/store/hooks';
import { CSSTransition } from 'react-transition-group';
import { UserMsgWrapper } from './style';

import UserInfo from './childCpn/userInfo';
import Profile from './childCpn/newProfile/index';
import { ILogin, IUserMsg } from '../../../../../constant/store/login';

const UserMsg: React.FC = () => {
  const navigate = useNavigate();
  const [isShow, setIsShow] = useState<boolean>(false);
  const [isShowProfile, setIsShowProfile] = useState<boolean>(false);
  const { loginType } = useAppSelector((state) => {
    return state['loginReducer'];
  });
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer'];
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
  const dispatch = useAppDispatch();
  const profileRef = useRef();
  const items: MenuProps['items'] = [
    {
      key: 'user',
      label: <div>用户信息</div>,
      icon: <UserOutlined />
    },
    {
      key: 'vip',
      label: <div>vip信息</div>,
      icon: <PoundCircleOutlined />
    },
    {
      type: 'divider'
    },
    {
      key: 'exit',
      label: <div>退出登录</div>,
      icon: <PoweroffOutlined />
    }
  ];
  const onClick: MenuProps['onClick'] = ({ key }) => {
    switch (key) {
      case 'user':
        console.log(profileRef.current);
        profileRef.current && profileRef.current.showModal();
        break;
      case 'vip':
        navigate('/Home/member');
        break;
      case 'exit':
        dispatch(logoutAction());
        // dispatch(
        //   changeUserMsg({
        //     token: '',
        //     userName: '',
        //     userId: '',
        //     avatarUrl: '',
        //     createTime: '',
        //     updateTime: '',
        //     manage: -1,
        //     auth: -1
        //   })
        //);
        navigate('/Login');
        break;
    }
  };
  return (
    <UserMsgWrapper>
      <Dropdown menu={{ items, onClick }} placement={'topCenter'} trigger={['click']} arrow={true}>
        <div className="avatar" onClick={(e) => changeShow(e)}>
          {loginType === 0 ? (
            <i className="iconfont icon-user1"> </i>
          ) : userMsg.avatarUrl ? (
            <img src={userMsg?.avatarUrl + '&w=42'} alt="暂无头像" />
          ) : (
            <i className="iconfont icon-user1"> </i>
          )}
        </div>
      </Dropdown>
      <div className="user-name" onClick={(e) => changeShow(e)}>
        {loginType === 0 ? <span>未登录</span> : <span>{userMsg.userName}</span>}
      </div>
      {userMsg && userMsg.auth === 1 && <div className="is-vip">VIP</div>}
      {/*<CSSTransition in={isShow} timeout={1000} unmountOnExit={true} classNames="userInfo">*/}
      {/*  <UserInfo onClick={() => infoClick()} />*/}
      {/*</CSSTransition>*/}
      <CSSTransition timeout={1000} in={isShowProfile} unmountOnExit={true} classNames="profile">
        <Profile onClick={exit} />
      </CSSTransition>
      <Profile ref={profileRef} />
    </UserMsgWrapper>
  );
};
export default memo(UserMsg);

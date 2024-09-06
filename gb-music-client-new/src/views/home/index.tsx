import React, { memo, Suspense, useEffect, useState } from 'react';
import { Outlet, Navigate, } from 'react-router-dom';
import logo from '@/assets/img/logo.png';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";

import { Skeleton } from 'antd';
import { VerticalAlignTopOutlined } from '@ant-design/icons';
import TopBar from '../../components/content/topBar';
import { HOST_NAME } from '../../constant/host';
import '../../constant/global/index';
import { HomeWrapper } from './style';
import PlayCoin from '../../components/content/playCoin';
import VipOuter from '../../components/content/vip';
import { ILogin, IUserMsg } from '../../constant/store/login';
import useAuth from '../../hooks/useAuth/index';

import { Layout } from 'antd';
import NavBar from "../../components/content/topBar/childCpn/navBar";

const { Header, Footer, Sider, Content } = Layout;

const Home: React.FC = (props) => {
  let { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const isShow = useAppSelector((state) => {
    return state['vipReducer'];
  });
  const [isShowBack, setIsShowBack] = useState<boolean>(false);
  useEffect(() => {
    if (userMsg && userMsg.userId) {
      // @ts-ignore
      //global.constant.socket = new WebSocket(`${HOST_NAME}/line/user?userId=${userMsg.userId}`);
      // @ts-ignore
      //global.constant.socket.onopen = function (e) {
        // @ts-ignore
      //   global.constant.socket.send(userMsg.userId);
      //   console.log('websocket open');
      // };
      // @ts-ignore
      // global.constant.socket.onmessage = function (e) {
      //   console.log(e.data);
      // };
      // @ts-ignore
      // global.constant.socket.onclose = function (e) {
      //   console.log('websocket close');
      // };
      // @ts-ignore
      // global.constant.socket.onerror = function (e) {
      //   console.log('websocket error');
      // };
    }
  }, [userMsg]);
  const backToTop = () => {
    let html = document.documentElement;
    let body = document.body;
    let timber = setInterval(() => {
      body.scrollTop -= 100;
      html.scrollTop -= 100;
      if (body.scrollTop <= 0 && html.scrollTop <= 0) {
        clearInterval(timber);
      }
    }, 10);
  };
  window.onscroll = function () {
    if (window.pageYOffset >= 1240) {
      setIsShowBack(true);
    } else {
      setIsShowBack(false);
    }
  };
  if (!userMsg || !userMsg.token) {
    console.log(userMsg)
    console.log(userMsg.token)
    return <Navigate to={'/Login'} />;
  } else {
    return (
      <HomeWrapper>
        {(!userMsg || !userMsg.token) && <Navigate to={'/Login'} />}

        {isShow && false && <VipOuter />}
        <Layout>
          <Header className="gb-music-header">
            <TopBar />
          </Header>
          <Layout>
            <Sider className={"gb-music-sider"}>
              <NavBar/>
            </Sider>
            <Content className="gb-music-content">
              <div className="content-body">
                <Suspense
                  fallback={
                    <div className="router-loading">
                      <Skeleton active paragraph={{ rows: 15 }} />
                    </div>
                  }
                >
                  <Outlet/>
                </Suspense>
              </div>
            </Content>
          </Layout>
          <Footer className={"gb-music-footer"}>
            <PlayCoin />
            {isShowBack && (
              <div className="back-to-top" onClick={(e) => backToTop()}>
                <VerticalAlignTopOutlined />
                top
              </div>
            )}
          </Footer>
        </Layout>
      </HomeWrapper>
    );
  }
};
export default memo(Home);

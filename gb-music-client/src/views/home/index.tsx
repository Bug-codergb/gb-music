/*
@Name guo'bin
@Description gb-music
@author guo'bin
@date 2021/9/25
*/
import React, { memo, Suspense, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { renderRoutes } from 'react-router-config';
import { useSelector } from 'react-redux';
import { Map } from 'immutable';

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
import { Redirect } from 'react-router';
import { Layout } from 'antd';
import NavBar from "../../components/content/topBar/childCpn/navBar";
const { Header, Footer, Sider, Content } = Layout;
interface RouterType extends RouteComponentProps {
  route: any;
}
const Home: React.FC<RouterType> = (props) => {
  let { userMsg } = useSelector<Map<string, ILogin>, { userMsg: IUserMsg }>((state) => ({
    userMsg: state.getIn(['loginReducer', 'login', 'userMsg'])
  }));
  const isShow = useSelector<Map<string, boolean>>((state) => {
    return state.getIn(['vipReducer', 'isShow']);
  });
  const [isShowBack, setIsShowBack] = useState<boolean>(false);
  useEffect(() => {
    if (userMsg && userMsg.userId) {
      // @ts-ignore
      global.constant.socket = new WebSocket(`${HOST_NAME}/line/user?userId=${userMsg.userId}`);
      // @ts-ignore
      global.constant.socket.onopen = function (e) {
        // @ts-ignore
        global.constant.socket.send(userMsg.userId);
        console.log('websocket open');
      };
      // @ts-ignore
      global.constant.socket.onmessage = function (e) {
        console.log(e.data);
      };
      // @ts-ignore
      global.constant.socket.onclose = function (e) {
        console.log('websocket close');
      };
      // @ts-ignore
      global.constant.socket.onerror = function (e) {
        console.log('websocket error');
      };
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
    return <Redirect to={'/Login'} />;
  } else {
    return (
      <HomeWrapper>
        {(!userMsg || !userMsg.token) && <Redirect to={'/Login'} />}

        {isShow && <VipOuter />}
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
                  {renderRoutes(props.route.routes)}
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
export default withRouter(memo(Home));

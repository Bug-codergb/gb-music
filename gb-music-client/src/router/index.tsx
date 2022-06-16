/*
@Name guo'bin
@Description gb-music
@author guo'bin
@date 2021/10/7
*/
import { Redirect } from 'react-router';
import { lazy } from 'react';
import store from '../store';

import myMusicRoutes from './myMusic/index';
import {
  playPageRouter,
  albumRouter,
  playlistRouter,
  artistRouter,
  toplistRouter,
  videoRouter,
  searchRouter,
  channelRouter,
  userRouter,
  topicRouter,
  successRouter,
  memberRouter,
  msgRouter
} from './detail/index';
import discoverRoutes from './discover';
import { routerType } from '../constant/routerType';

//创作者中心页面
import innovateChild from './manage/index';

const Login = lazy(() => import('../views/Login/index'));
const Register = lazy(() => import('../views/register/index'));
const Home = lazy(() => import('../views/home/index'));
const discover = lazy(() => import('../views/discover/index'));
const myMusic = lazy(() => import('../views/myMusic/index'));
const video = lazy(() => import('../views/video/index'));
const moment = lazy(() => import('../views/moment/index'));
const innovation = lazy(() => import('../views/innovation/index'));
const channel = lazy(() => import('../views/channel/index'));

//视频子路由
const visionRouter = lazy(() => import('../views/video/childCpn/video/index'));
const mvRouter = lazy(() => import('../views/video/childCpn/mv/index'));

//创作者中心详情
const innovateRouter = lazy(() => import('../views/manage/innovate/index'));

const routes: routerType[] = [
  {
    path: '/',
    exact: true,
    render: () => {
      return <Redirect to="/Login" />;
    }
  },
  {
    path: '/Login',
    exact: true,
    render: () => {
      // @ts-ignore
      const userMsg = store.getState().getIn(['loginReducer', 'login', 'userMsg']);
      if (!userMsg || !userMsg.token) {
        return <Login />;
      } else {
        return <Redirect to="/Home" />;
      }
    }
  },
  {
    path: '/Login',
    component: Login
  },
  {
    path: '/Register',
    component: Register
  },
  {
    path: '/Home',
    component: Home,
    routes: [
      {
        path: '/Home',
        exact: true,
        render: () => {
          return <Redirect to="/Home/discover" />;
        }
      },
      {
        path: '/Home/discover',
        component: discover,
        routes: discoverRoutes
      },
      {
        path: '/Home/video',
        component: video,
        routes: [
          {
            path: '/Home/video',
            exact: true,
            render: () => {
              return <Redirect to="/Home/video/vision" />;
            }
          },
          {
            path: '/Home/video/vision',
            component: visionRouter
          },
          {
            path: '/Home/video/mv',
            component: mvRouter
          }
        ]
      },
      {
        path: '/Home/myMusic',
        component: myMusic,
        routes: myMusicRoutes
      },
      {
        path: '/Home/moment',
        component: moment
      },
      {
        path: '/Home/innovation',
        component: innovation
      },
      {
        path: '/Home/channel',
        component: channel
      },
      albumRouter,
      playPageRouter,
      playlistRouter,
      artistRouter,
      toplistRouter,
      videoRouter,
      searchRouter,
      channelRouter,
      userRouter,
      topicRouter,
      successRouter,
      memberRouter,
      msgRouter
    ]
  },
  {
    path: '/innovate',
    component: innovateRouter,
    routes: innovateChild
  }
];

export default routes;

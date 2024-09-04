import { Navigate ,type RouteObject} from 'react-router-dom';
import { lazy,Suspense } from 'react';
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


//创作者中心页面
import innovateChild from './manage/index';

const Login = lazy(() => import('../views/Login/index'));
const Register = lazy(() => import('../views/register/index'));
const Home = lazy(() => import('../views/home/index'));
const Discover = lazy(() => import('../views/discover/index'));
const myMusic = lazy(() => import('../views/myMusic/index'));
const Video = lazy(() => import('../views/video/index'));
const Moment = lazy(() => import('../views/moment/index'));
const Innovation = lazy(() => import('../views/innovation/index'));
const Channel = lazy(() => import('../views/channel/index'));

//视频子路由
const VisionRouter = lazy(() => import('../views/video/childCpn/video/index'));
const MvRouter = lazy(() => import('../views/video/childCpn/mv/index'));

//创作者中心详情
const InnovateRouter = lazy(() => import('../views/manage/innovate/index'));

const routes: RouteObject[] = [
  {
    path: '/',
    element:<Navigate to="/Login" />
  },
  {
    path: '/Login',
    element: <Suspense><Login /></Suspense>
  },
  {
    path: '/Register',
    element: <Suspense>
      <Register/>
    </Suspense>
  },
  {
    path: '/Home',
    element: <Home/>,
    children: [
      {
        path: '/Home',
        element:<Navigate to="/Home/discover" />
      },
      {
        path: '/Home/discover',
        element: <Suspense><Discover/></Suspense>,
        children: discoverRoutes
      },
      {
        path: '/Home/video',
        element: <Suspense><Video/></Suspense>,
        children: [
          {
            path: '/Home/video',
            element:<Navigate to="/Home/video/vision" />
          },
          {
            path: '/Home/video/vision',
            element: <Suspense><VisionRouter/></Suspense>
          },
          {
            path: '/Home/video/mv',
            element: <Suspense><MvRouter/></Suspense>
          }
        ]
      },
      /*{
        path: '/Home/myMusic',
        component: myMusic,
        routes: myMusicRoutes
      }*/
      {
        path: '/Home/moment',
        element: <Suspense><Moment/></Suspense>
      },
      {
        path: '/Home/innovation',
        element: <Suspense><Innovation/></Suspense>
      },
      {
        path: '/Home/channel',
        element: <Suspense><Channel/></Suspense>
      },
      ...myMusicRoutes,
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
    element: <InnovateRouter/>,
    children: innovateChild
  }
];

export default routes;

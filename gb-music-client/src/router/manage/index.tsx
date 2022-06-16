import { RouteConfig } from 'react-router-config';
import { lazy } from 'react';
import { Redirect } from 'react-router';

const home = lazy(() => import('../../views/manage/innovate/pages/home/index'));

const fans = lazy(() => import('../../views/manage/innovate/pages/fans/index'));
const comment = lazy(() => import('../../views/manage/innovate/pages/comment/index'));
const video = lazy(() => import('../../views/manage/innovate/pages/video/index'));
const radio = lazy(() => import('../../views/manage/innovate/pages/radio/index'));
const publish = lazy(() => import('../../views/manage/innovate/pages/publish/index'));
const channelPlay = lazy(() => import('../../views/manage/innovate/pages/channelPlay/index'));
const publishVideo = lazy(() => import('../../views/manage/innovate/pages/publish/childCpn/video/index'));
const publishRadio = lazy(() => import('../../views/manage/innovate/pages/publish/childCpn/radio/index'));

const innovateCon = lazy(() => import('../../components/content/detail/manage/innovate/innovateCon/index'));
const innovateDetail = lazy(() => import('../../components/content/detail/manage/innovate/innovateDetail/index'));
const router: RouteConfig = [
  {
    path: '/innovate',
    exact: true,
    render: () => {
      return <Redirect to="/innovate/home" />;
    }
  },
  {
    path: '/innovate/home',
    component: home
  },
  {
    path: '/innovate/fans',
    component: fans
  },
  {
    path: '/innovate/comment',
    component: comment
  },
  {
    path: '/innovate/video',
    component: video
  },
  {
    path: '/innovate/radio',
    component: radio,
    exact: true
  },
  {
    path: '/innovate/radio/play',
    component: channelPlay,
    exact: true
  },
  {
    path: '/innovate/publish',
    component: publish,
    routes: [
      {
        path: '/innovate/publish',
        exact: true,
        render: () => {
          return <Redirect to="/innovate/publish/video" />;
        }
      },
      {
        path: '/innovate/publish/video',
        component: publishVideo
      },
      {
        path: '/innovate/publish/radio',
        component: publishRadio
      }
    ]
  },
  {
    path: '/innovate/innovateCon',
    component: innovateCon
  },
  {
    path: '/innovate/detail',
    component: innovateDetail
  }
];
export default router;

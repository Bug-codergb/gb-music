import { lazy,Suspense } from 'react';
import { type RouteObject,Navigate } from 'react-router-dom';


const Home = lazy(() => import('../../views/manage/innovate/pages/home/index'));

const Fans = lazy(() => import('../../views/manage/innovate/pages/fans/index'));
const Comment = lazy(() => import('../../views/manage/innovate/pages/comment/index'));
const Video = lazy(() => import('../../views/manage/innovate/pages/video/index'));
const Radio = lazy(() => import('../../views/manage/innovate/pages/radio/index'));
const Publish = lazy(() => import('../../views/manage/innovate/pages/publish/index'));
const ChannelPlay = lazy(() => import('../../views/manage/innovate/pages/channelPlay/index'));
const PublishVideo = lazy(() => import('../../views/manage/innovate/pages/publish/childCpn/video/index'));
const PublishRadio = lazy(() => import('../../views/manage/innovate/pages/publish/childCpn/radio/index'));

const InnovateCon = lazy(() => import('../../components/content/detail/manage/innovate/innovateCon/index'));
const InnovateDetail = lazy(() => import('../../components/content/detail/manage/innovate/innovateDetail/index'));
const router: RouteObject[] = [
  {
    path: '/innovate',
    element: <Navigate to="/innovate/home" />
  },
  {
    path: '/innovate/home',
    element: <Suspense><Home/></Suspense>
  },
  {
    path: '/innovate/fans',
    element: <Suspense><Fans/></Suspense>
  },
  {
    path: '/innovate/comment',
    element: <Suspense><Comment/></Suspense>
  },
  {
    path: '/innovate/video',
    element: <Suspense><Video/></Suspense>
  },
  {
    path: '/innovate/radio',
    element: <Suspense><Radio/></Suspense>,

  },
  {
    path: '/innovate/radio/play',
    element: <Suspense><ChannelPlay/></Suspense>,
  },
  {
    path: '/innovate/publish',
    element: <Suspense><Publish/></Suspense>,
    children: [
      {
        path: '/innovate/publish',

      element:<Navigate to="/innovate/publish/video" />
      },
      {
        path: '/innovate/publish/video',
        element: <Suspense><PublishVideo/></Suspense>
      },
      {
        path: '/innovate/publish/radio',
        element: <Suspense><PublishRadio/></Suspense>
      }
    ]
  },
  {
    path: '/innovate/innovateCon',
    element: <Suspense><InnovateCon/></Suspense>
  },
  {
    path: '/innovate/detail',
    element: <Suspense><InnovateDetail/></Suspense>
  }
];
export default router;

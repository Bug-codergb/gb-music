import { lazy,Suspense } from 'react';
import { type RouteObject,Navigate } from 'react-router-dom';

const Recommend = lazy(() => import('../../views/discover/childCpn/recommend/index'));
const Playlist = lazy(() => import('../../views/discover/childCpn/playlist/index'));
const Toplist = lazy(() => import('../../views/discover/childCpn/toplist/index'));
const Artist = lazy(() => import('../../views/discover/childCpn/artist/index'));
const Album = lazy(() => import('../../views/discover/childCpn/album/index'));

const routes: RouteObject[] = [
  {
    path: '/Home/discover',
    element:<Navigate to="/Home/discover/recommend" />
  },
  {
    path: '/Home/discover/recommend',
    element: <Suspense><Recommend/></Suspense>
  },
  {
    path: '/Home/discover/playlist',
    element: <Suspense><Playlist/></Suspense>
  },
  {
    path: '/Home/discover/toplist',
    element: <Suspense><Toplist/></Suspense>
  },
  {
    path: '/Home/discover/artist',
    element: <Suspense><Artist/></Suspense>
  },
  {
    path: '/Home/discover/album',
    element: <Suspense><Album/></Suspense>
  }
];
export default routes;

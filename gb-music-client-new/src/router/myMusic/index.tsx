import { lazy,Suspense } from 'react';
import { type RouteObject,Navigate } from 'react-router-dom';

const MyFavorite = lazy(() => import('../../views/myMusic/childCpn/myFavorite/index'));
const MyPlaylist = lazy(() => import('../../views/myMusic/childCpn/myPlaylist/index'));
const MySubscribe = lazy(() => import('../../views/myMusic/childCpn/mySubscribe/index'));
const MyRadio=lazy(()=>import("@/views/myMusic/childCpn/myRadio/index"))
const routes: RouteObject[] = [
  {
    path: '/Home/myMusic',
    element:<Navigate to="/Home/myMusic/myPlaylist" />
  },
  {
    path: '/Home/myMusic/myFavorite',
    element: <Suspense><MyFavorite/></Suspense>
  },
  {
    path: '/Home/myMusic/myPlaylist',
    element: <Suspense><MyPlaylist/></Suspense>
  },
  {
    path: '/Home/myMusic/mySubscribe',
    element: <Suspense><MySubscribe/></Suspense>
  },
  {
    path:'/Home/myMusic/myRadio',
    element: <Suspense><MyRadio/></Suspense>
  }
];
export default routes;

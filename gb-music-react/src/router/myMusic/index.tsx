import { lazy } from 'react';
import { Redirect } from 'react-router';
import { RouteConfig } from 'react-router-config';

const myFavorite = lazy(() => import('../../views/myMusic/childCpn/myFavorite/index'));
const myPlaylist = lazy(() => import('../../views/myMusic/childCpn/myPlaylist/index'));
const mySubscribe = lazy(() => import('../../views/myMusic/childCpn/mySubscribe/index'));
const routes: RouteConfig[] = [
  {
    path: '/Home/myMusic',
    exact: true,
    render: () => {
      return <Redirect to="/Home/myMusic/myPlaylist" />;
    }
  },
  {
    path: '/Home/myMusic/myFavorite',
    component: myFavorite
  },
  {
    path: '/Home/myMusic/myPlaylist',
    component: myPlaylist
  },
  {
    path: '/Home/myMusic/mySubscribe',
    component: mySubscribe
  }
];
export default routes;

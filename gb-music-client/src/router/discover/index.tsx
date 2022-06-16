import { Redirect } from 'react-router';
import { lazy } from 'react';
import { RouteConfig } from 'react-router-config';
const recommend = lazy(() => import('../../views/discover/childCpn/recommend/index'));
const playlist = lazy(() => import('../../views/discover/childCpn/playlist/index'));
const toplist = lazy(() => import('../../views/discover/childCpn/toplist/index'));
const artist = lazy(() => import('../../views/discover/childCpn/artist/index'));
const album = lazy(() => import('../../views/discover/childCpn/album/index'));

const routes: RouteConfig[] = [
  {
    path: '/Home/discover',
    exact: true,
    render: () => {
      return <Redirect to="/Home/discover/recommend" />;
    }
  },
  {
    path: '/Home/discover/recommend',
    component: recommend
  },
  {
    path: '/Home/discover/playlist',
    component: playlist
  },
  {
    path: '/Home/discover/toplist',
    component: toplist
  },
  {
    path: '/Home/discover/artist',
    component: artist
  },
  {
    path: '/Home/discover/album',
    component: album
  }
];
export default routes;

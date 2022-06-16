import { routerType } from '../../constant/routerType';
import { lazy } from 'react';
import { RouteConfig } from 'react-router-config';
import { Redirect } from 'react-router';

const albumDetail = lazy(() => import('../../components/content/detail/albumDetail/index'));
const playPage = lazy(() => import('../../components/content/playPage/index'));
const playlistDetail = lazy(() => import('../../components/content/detail/playlistDetail/index'));
const artistDetail = lazy(() => import('../../components/content/detail/artistDetail/index'));
const toplistDetail = lazy(() => import('../../components/content/detail/toplistDetail/index'));
const videoDetail = lazy(() => import('../../components/content/detail/videoDetail/index'));
const channelDetail = lazy(() => import('../../components/content/detail/channelDetail/index'));
const userDetail = lazy(() => import('../../components/content/detail/userDetail/index'));
const topicDetail = lazy(() => import('../../components/content/detail/topicDetail/index'));

const msgDetail = lazy(() => import('../../components/content/detail/msgDetail/index'));
const albumMsg = lazy(() => import('../../components/content/detail/msgDetail/childCpn/album/index'));
const commentMsg = lazy(() => import('../../components/content/detail/msgDetail/childCpn/comment/index'));
const playlistMsg = lazy(() => import('../../components/content/detail/msgDetail/childCpn/playlist/index'));
const channelMsg = lazy(() => import('../../components/content/detail/msgDetail/childCpn/channel/index'));
const videoMsg = lazy(() => import('../../components/content/detail/msgDetail/childCpn/video/index'));

const searchDetail = lazy(() => import('../../components/content/detail/searchDetail/index'));
const searchSong = lazy(() => import('../../components/content/detail/searchDetail/childCpn/song/index'));
const searchAlbum = lazy(() => import('../../components/content/detail/searchDetail/childCpn/album/index'));
const searchVideo = lazy(() => import('../../components/content/detail/searchDetail/childCpn/video/index'));
const searchPlaylist = lazy(() => import('../../components/content/detail/searchDetail/childCpn/playlist/index'));
const searchUser = lazy(() => import('../../components/content/detail/searchDetail/childCpn/user/index'));
const searchArtist = lazy(() => import('../../components/content/detail/searchDetail/childCpn/artist/index'));

const success = lazy(() => import('../../views/success/index'));
const member = lazy(() => import('../../components/content/member/index'));
const albumRouter: RouteConfig = {
  path: '/Home/albumDetail',
  component: albumDetail
};
const playPageRouter: RouteConfig = {
  path: '/Home/playPage',
  component: playPage
};
const playlistRouter: RouteConfig = {
  path: '/Home/playlistDetail',
  component: playlistDetail
};
const artistRouter: RouteConfig = {
  path: '/Home/artistDetail',
  component: artistDetail
};
const toplistRouter: RouteConfig = {
  path: '/Home/toplistDetail',
  component: toplistDetail
};
const videoRouter: RouteConfig = {
  path: '/Home/videoDetail',
  component: videoDetail
};
const channelRouter: RouteConfig = {
  path: '/Home/channelDetail',
  component: channelDetail
};
//用户详情页
const userRouter: RouteConfig = {
  path: '/Home/userDetail',
  component: userDetail
};
//专题详情页
const topicRouter: RouteConfig = {
  path: '/Home/topicDetail',
  component: topicDetail
};

const msgRoutes: RouteConfig[] = [
  {
    path: '/Home/msgDetail',
    exact: true,
    render: () => {
      return <Redirect to="/Home/msgDetail/comment" />;
    }
  },
  {
    path: '/Home/msgDetail/comment',
    component: commentMsg
  },
  {
    path: '/Home/msgDetail/album',
    component: albumMsg
  },
  {
    path: '/Home/msgDetail/video',
    component: videoMsg
  },
  {
    path: '/Home/msgDetail/channel',
    component: channelMsg
  },
  {
    path: '/Home/msgDetail/playlist',
    component: playlistMsg
  }
];
//消息通知详情
const msgRouter: routerType = {
  path: '/Home/msgDetail',
  component: msgDetail,
  routes: msgRoutes
};
const routes: RouteConfig[] = [
  {
    path: '/Home/searchDetail/song',
    component: searchSong
  },
  {
    path: '/Home/searchDetail/album',
    component: searchAlbum
  },
  {
    path: '/Home/searchDetail/video',
    component: searchVideo
  },
  {
    path: '/Home/searchDetail/playlist',
    component: searchPlaylist
  },
  {
    path: '/Home/searchDetail/user',
    component: searchUser
  },
  {
    path: '/Home/searchDetail/artist',
    component: searchArtist
  }
];
const searchRouter: routerType = {
  path: '/Home/searchDetail',
  component: searchDetail,
  routes: routes
};
const successRouter: RouteConfig = {
  path: '/Home/success',
  component: success
};
const memberRouter: RouteConfig = {
  path: '/Home/member',
  component: member
};
export {
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
};

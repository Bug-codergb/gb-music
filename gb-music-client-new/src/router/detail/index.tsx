import { lazy,Suspense } from 'react';
import { type RouteObject,Navigate } from 'react-router-dom';

const AlbumDetail = lazy(() => import('../../components/content/detail/albumDetail/index'));
const PlayPage = lazy(() => import('../../components/content/playPage/index'));
const PlaylistDetail = lazy(() => import('../../components/content/detail/playlistDetail/index'));
const ArtistDetail = lazy(() => import('../../components/content/detail/artistDetail/index'));
const ToplistDetail = lazy(() => import('../../components/content/detail/toplistDetail/index'));
const VideoDetail = lazy(() => import('../../components/content/detail/videoDetail/index'));
const ChannelDetail = lazy(() => import('../../components/content/detail/channelDetail/index'));
const UserDetail = lazy(() => import('../../components/content/detail/userDetail/index'));
const TopicDetail = lazy(() => import('../../components/content/detail/topicDetail/index'));

const MsgDetail = lazy(() => import('../../components/content/detail/msgDetail/index'));
const AlbumMsg = lazy(() => import('../../components/content/detail/msgDetail/childCpn/album/index'));
const CommentMsg = lazy(() => import('../../components/content/detail/msgDetail/childCpn/comment/index'));
const PlaylistMsg = lazy(() => import('../../components/content/detail/msgDetail/childCpn/playlist/index'));
const ChannelMsg = lazy(() => import('../../components/content/detail/msgDetail/childCpn/channel/index'));
const VideoMsg = lazy(() => import('../../components/content/detail/msgDetail/childCpn/video/index'));

const SearchDetail = lazy(() => import('../../components/content/detail/searchDetail/index'));
const SearchSong = lazy(() => import('../../components/content/detail/searchDetail/childCpn/song/index'));
const SearchAlbum = lazy(() => import('../../components/content/detail/searchDetail/childCpn/album/index'));
const SearchVideo = lazy(() => import('../../components/content/detail/searchDetail/childCpn/video/index'));
const SearchPlaylist = lazy(() => import('../../components/content/detail/searchDetail/childCpn/playlist/index'));
const SearchUser = lazy(() => import('../../components/content/detail/searchDetail/childCpn/user/index'));
const SearchArtist = lazy(() => import('../../components/content/detail/searchDetail/childCpn/artist/index'));

const Success = lazy(() => import('../../views/success/index'));
const Member = lazy(() => import('../../components/content/member/index'));
const albumRouter: RouteObject = {
  path: '/Home/albumDetail',
  element: <Suspense><AlbumDetail/></Suspense>
};
const playPageRouter: RouteObject = {
  path: '/Home/playPage',
  element: <Suspense><PlayPage/></Suspense>
};
const playlistRouter: RouteObject = {
  path: '/Home/playlistDetail',
  element: <Suspense><PlaylistDetail/></Suspense>
};
const artistRouter: RouteObject = {
  path: '/Home/artistDetail',
  element: <Suspense><ArtistDetail/></Suspense>
};
const toplistRouter: RouteObject = {
  path: '/Home/toplistDetail',
  element: <Suspense><ToplistDetail/></Suspense>
};
const videoRouter: RouteObject = {
  path: '/Home/videoDetail',
  element: <Suspense><VideoDetail/></Suspense>
};
const channelRouter: RouteObject = {
  path: '/Home/channelDetail',
  element: <Suspense><ChannelDetail/></Suspense>
};
//用户详情页
const userRouter: RouteObject = {
  path: '/Home/userDetail',
  element: <Suspense><UserDetail/></Suspense>
};
//专题详情页
const topicRouter: RouteObject = {
  path: '/Home/topicDetail',
  element: <Suspense><TopicDetail/></Suspense>
};

const msgRoutes: RouteObject[] = [
  {
    path: '/Home/msgDetail',
    element:<Navigate to="/Home/msgDetail/comment" />
  },
  {
    path: '/Home/msgDetail/comment',
    element: <Suspense><CommentMsg/></Suspense>
  },
  {
    path: '/Home/msgDetail/album',
    element: <Suspense><AlbumMsg/></Suspense>
  },
  {
    path: '/Home/msgDetail/video',
    element: <Suspense><VideoMsg/></Suspense>
  },
  {
    path: '/Home/msgDetail/channel',
    element: <Suspense><ChannelMsg/></Suspense>
  },
  {
    path: '/Home/msgDetail/playlist',
    element: <Suspense><PlaylistMsg/></Suspense>
  }
];
//消息通知详情
const msgRouter: RouteObject = {
  path: '/Home/msgDetail',
  element: <Suspense><MsgDetail/></Suspense>,
  children: msgRoutes
};
const routes: RouteObject[] = [
  {
    path: '/Home/searchDetail/song',
    element: <Suspense><SearchSong/></Suspense>
  },
  {
    path: '/Home/searchDetail/album',
    element: <Suspense><SearchAlbum/></Suspense>
  },
  {
    path: '/Home/searchDetail/video',
    element: <Suspense><SearchVideo/></Suspense>
  },
  {
    path: '/Home/searchDetail/playlist',
    element: <Suspense><SearchPlaylist/></Suspense>
  },
  {
    path: '/Home/searchDetail/user',
    element: <Suspense><SearchUser/></Suspense>
  },
  {
    path: '/Home/searchDetail/artist',
    element: <Suspense><SearchArtist/></Suspense>
  }
];
const searchRouter: RouteObject = {
  path: '/Home/searchDetail',
  element: <Suspense><SearchDetail/></Suspense>,
  children: routes
};
const successRouter: RouteObject = {
  path: '/Home/success',
  element: <Suspense><Success/></Suspense>
};
const memberRouter: RouteObject = {
  path: '/Home/member',
  element:<Suspense> <Member/></Suspense>
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

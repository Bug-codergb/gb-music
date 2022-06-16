import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../views/Home.vue';
Vue.use(VueRouter);

//登录
const Login = () => import('../views/login/Login');
const Register = () => import('../views/register/Register');

const song = () => import('../views/song/Song');
const album = () => import('../views/album/Album');
const video = () => import('../views/video/Video');
const mv = () => import('../views/mv/MV');
const artist = () => import('../views/artist/Artist');
const playlist = () => import('../views/playlist/PlayList');
const toplist = () => import('../views/toplist/Toplist');
const banner = () => import('../views/banner/Banner');
const channel = () => import('../views/channel/Channel');
const billboard = () => import('../views/billboard/Billboard');
const user = () => import('../views/user/User');
const order=()=>import("../views/order/Order")
const originalPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch((err) => err);
};

//详情
//专辑详情
const albumDetail = () => import('../components/content/detail/albumDetail/DetailAlbum');
const toplistDetail = () => import('../components/content/detail/toplistDetail/ToplistDetail');
const channelDetail = () => import('../components/content/detail/channelDetail/ChannelDetail');
const artistDetail = () => import('../components/content/detail/artistDetail/ArtistDetail');
const videoDetail=()=>import("../components/content/detail/videoDetail/VideoDetail")
const routes = [
  {
    path: '/',
    redirect: '/Login'
  },
  {
    path: '/Login',
    name: 'login',
    component: Login
  },
  {
    path: '/Register',
    name: 'register',
    component: Register
  },
  {
    path: '/Home',
    name: 'home',
    component: Home,
    children: [
      {
        path: '/Home',
        redirect: '/Home/artist',
      },
      {
        path: 'song',
        name: 'song',
        component: song,
        meta:{
          title:'歌曲信息'
        }
      },
      {
        path: 'album',
        name: 'album',
        component: album,
        meta:{
          title:'专辑信息'
        }
      },
      {
        path: 'video',
        name: 'video',
        component: video,
        meta:{
          title:"视频信息"
        }
      },
      {
        path: 'mv',
        name: 'mv',
        component: mv,
        meta:{
          title:'MV信息'
        }
      },
      {
        path: 'artist',
        name: 'artist',
        component: artist,
        meta:{
          title:'歌手信息'
        }
      },
      {
        path: 'playlist',
        name: 'playlist',
        component: playlist,
        meta:{
          title:'歌单信息'
        }
      },
      {
        path: 'toplist',
        name: 'toplist',
        component: toplist,
        meta:{
          title:'排行榜信息'
        }
      },
      {
        path: 'banner',
        name: 'banner',
        component: banner,
        meta:{
          title:'banner信息'
        }
      },
      {
        path: 'channel',
        name: 'channel',
        component: channel,
        meta:{
          title:'电台信息'
        }
      },
      {
        path: 'billboard',
        name: 'billboard',
        component: billboard,
        meta:{
          title:'音乐看板'
        }
      },
      {
        path: 'user',
        name: 'user',
        component: user,
        meta:{
          title:'用户信息'
        }
      },
      {
        path:"order",
        name:'order',
        component:order,
        meta:{
          title:"订单信息"
        }
      },
      /*专辑详情*/
      {
        path: 'album/detail',
        name: 'albumDetail',
        component: albumDetail,
        meta:{
          title:'专辑详情'
        }
      },
      {
        path: 'toplistDetail',
        name: 'toplistDetail',
        component: toplistDetail,
        meta:{
          title:'排行榜详情'
        }
      },
      {
        path: 'channelDetail',
        name: 'channelDetail',
        component: channelDetail,
        meta:{
          title:'电台详情'
        }
      },
      {
        path: 'artistDetail',
        name: 'artistDetail',
        component: artistDetail,
        meta:{
          title:'歌手详情'
        }
      },
      {
        path:"videoDetail",
        name:"videoDetail",
        component:videoDetail,
        meta:{
          title:"视频详情"
        }
      }
    ]
  }
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
});

export default router;

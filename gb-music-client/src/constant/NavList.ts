interface navListType {
  path: string;
  name: string;
}
const navList: navListType[] = [
  {
    path: '/Home/discover',
    name: '发现音乐'
  },
  {
    path: '/Home/video',
    name: '视频'
  },
  {
    path: '/Home/channel',
    name: '播客'
  },
  {
    path: '/Home/moment',
    name: '动态'
  },
  {
    path: '/Home/myMusic',
    name: '我的音乐'
  }
];
const disCoverList: navListType[] = [
  {
    path: '/Home/discover/recommend',
    name: '热门音乐'
  },
  {
    path: '/Home/discover/playlist',
    name: '歌单'
  },
  {
    path: '/Home/discover/toplist',
    name: '排行榜'
  },
  {
    path: '/Home/discover/artist',
    name: '歌手'
  },
  {
    path: '/Home/discover/album',
    name: '专辑'
  }
];
export { navList, disCoverList };
export type { navListType };

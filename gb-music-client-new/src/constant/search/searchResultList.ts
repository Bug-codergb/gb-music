interface resultItem {
  name: string;
  path: string;
}
const searchResultList: resultItem[] = [
  {
    name: '歌曲',
    path: '/Home/searchDetail/song'
  },
  {
    name: '专辑',
    path: '/Home/searchDetail/album'
  },
  {
    name: '歌手',
    path: '/Home/searchDetail/artist'
  },
  {
    name: '歌单',
    path: '/Home/searchDetail/playlist'
  },
  {
    name: '视频',
    path: '/Home/searchDetail/video'
  },
  {
    name: '用户',
    path: '/Home/searchDetail/user'
  }
];
export type { resultItem };
export { searchResultList };

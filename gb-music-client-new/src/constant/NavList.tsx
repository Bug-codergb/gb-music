import {FlagOutlined,PlaySquareOutlined,FundOutlined,ContactsOutlined} from '@ant-design/icons';
import { ReactElement } from 'react';
interface navListType {
  path: string;
  name: string;
  tag:number,
  icon:ReactElement
}
const navList: navListType[] = [
  {
    path: '/Home/discover',
    name: '发现音乐',
    tag:1,
    icon:<FlagOutlined/>
  },
  {
    path: '/Home/video',
    name: '视频',
    tag:1,
    icon:<PlaySquareOutlined />
  },
  {
    path: '/Home/channel',
    name: '播客',
    tag:1,
    icon:<FundOutlined />
  },
  {
    path: '/Home/moment',
    name: '动态',
    tag:1,
    icon:<ContactsOutlined />
  },
  /*{
    path: '/Home/myMusic',
    name: '我的音乐',
    tag:0
  }*/
];
const disCoverList: navListType[] = [
  {
    path: '/Home/discover/recommend',
    name: '热门音乐',
    tag:1,
    icon:""
  },
  {
    path: '/Home/discover/playlist',
    name: '歌单',
    tag:1,
    icon:""
  },
  {
    path: '/Home/discover/toplist',
    name: '排行榜',
    tag:1,
    icon:""
  },
  {
    path: '/Home/discover/artist',
    name: '歌手',
    tag:1,
    icon:""
  },
  {
    path: '/Home/discover/album',
    name: '专辑',
    tag:1,
    icon:""
  }
];
export { navList, disCoverList };
export type { navListType };

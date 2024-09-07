import { navListType } from './NavList';
import {HeartOutlined,SolutionOutlined,StarOutlined,CustomerServiceOutlined} from "@ant-design/icons"
const myMusic: navListType[] = [
  {
    path: '/Home/myMusic/myFavorite',
    name: '我喜欢的音乐',
    tag:1,
    icon:<HeartOutlined />
  },
  {
    path: '/Home/myMusic/myPlaylist',
    name: '我的歌单',
    tag:1,
    icon:<SolutionOutlined />
  },
  {
    path: '/Home/myMusic/mySubscribe',
    name: '我的收藏',
    tag:1,
    icon:<StarOutlined />
  },
  {
    path: '/Home/myMusic/myRadio',
    name: '我的播客',
    tag:1,
    icon:<CustomerServiceOutlined />
  }
];
export { myMusic };

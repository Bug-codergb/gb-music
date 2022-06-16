interface NavType {
  title: string;
  list: { name: string; path: string }[];
  font: string;
}
const navList: NavType[] = [
  {
    title: '综合',
    font: 'icon-zongheguanli',
    list: [
      {
        name: '首页',
        path: '/innovate/home'
      },
      {
        name: '粉丝中心',
        path: '/innovate/fans'
      },
      {
        name: '评论管理',
        path: '/innovate/comment'
      }
    ]
  },
  {
    title: 'Mlog',
    list: [
      {
        name: '视频管理',
        path: '/innovate/video'
      }
    ],
    font: 'icon-video-l'
  },
  {
    title: '声音',
    list: [
      {
        name: '声音管理',
        path: '/innovate/radio'
      },
      {
        name: '播单管理',
        path: '/innovate/radio/play'
      }
    ],
    font: 'icon-bxs-radio'
  }
];
export default navList;

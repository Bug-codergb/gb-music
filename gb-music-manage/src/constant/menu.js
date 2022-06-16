const menu = [
  {
    name: '歌手信息',
    icon: 'iconfont icon-ttpodicon',
    index: '1',
    children: [
      {
        index:'11-1',
        name: '歌手',
        path: '/Home/artist'
      }
    ]
  },
  {
    name: '专辑信息',
    icon: 'iconfont icon-zhuanji',
    index: '2',
    children: [
      {
        index:"21",
        name: '专辑',
        path: '/Home/album'
      }
    ]
  },
  {
    name: '歌单信息',
    icon: 'iconfont icon-yinle-liebiao',
    index: '4',
    children: [
      {
        index: '41',
        name: '歌单',
        path: '/Home/playlist'
      },
      {
        index:"42",
        name: '歌曲',
        path: '/Home/song'
      }
    ]
  },
  {
    name: '视频信息',
    icon: 'iconfont icon-video',
    index: '5',
    children: [
      {
        index:"51",
        name: '视频',
        path: '/Home/video'
      },
      {
        index:"52",
        name: 'MV',
        path: '/Home/mv'
      }
    ]
  },
  {
    name: '排行榜信息',
    icon: 'iconfont icon-paixingbang',
    index: '6',
    children: [
      {
        index:"61",
        name: '排行榜',
        path: '/Home/toplist'
      }
    ]
  },
  {
    name: '电台信息',
    icon: 'iconfont icon-radio',
    index: '7',
    children: [
      {
        index:"71",
        name: '电台',
        path: '/Home/channel'
      }
    ]
  },
  {
    name: 'banner',
    icon: 'iconfont icon-shuffling-banner',
    index: '8',
    children: [
      {
        index:"81",
        name: 'banner',
        path: '/Home/banner'
      }
    ]
  },
  {
    name: '用户管理',
    icon: 'iconfont icon-ttpodicon',
    index: '9',
    children: [
      {
        index:"91",
        name: '用户',
        path: '/Home/user'
      }
    ]
  },
  {
    name:'订单管理',
    icon:"iconfont icon-dingdan",
    index:'10',
    children: [
      {
        index:'101',
        name:"订单",
        path:"/Home/order"
      }
    ]
  },
  {
    name: '音乐看板',
    icon: 'iconfont icon-shujukanban',
    index: '11',
    children: [
      {
        index:"111",
        name: 'billboard',
        path: '/Home/billboard'
      }
    ]
  }
];
export { menu };

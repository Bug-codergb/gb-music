const menu = [
  {
    name: '歌手信息',
    icon: 'iconfont icon-ttpodicon',
    index: '1',
    children: [
      {
        index:'1-1',
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
        index:"2-1",
        name: '专辑',
        path: '/Home/album'
      }
    ]
  },
  {
    name: '歌单信息',
    icon: 'iconfont icon-yinle-liebiao',
    index: '3',
    children: [
      {
        index: '3-1',
        name: '歌单',
        path: '/Home/playlist'
      },
      {
        index:"3-2",
        name: '歌曲',
        path: '/Home/song'
      }
    ]
  },
  {
    name: '视频信息',
    icon: 'iconfont icon-video',
    index: '4',
    children: [
      {
        index:"4-1",
        name: '视频',
        path: '/Home/video'
      },
      {
        index:"4-2",
        name: 'MV',
        path: '/Home/mv'
      }
    ]
  },
  {
    name: '排行榜信息',
    icon: 'iconfont icon-paixingbang',
    index: '5',
    children: [
      {
        index:"5-1",
        name: '排行榜',
        path: '/Home/toplist'
      }
    ]
  },
  {
    name: '电台信息',
    icon: 'iconfont icon-radio',
    index: '6',
    children: [
      {
        index:"6-1",
        name: '电台',
        path: '/Home/channel'
      }
    ]
  },
  {
    name: 'banner',
    icon: 'iconfont icon-shuffling-banner',
    index: '7',
    children: [
      {
        index:"7-1",
        name: 'banner',
        path: '/Home/banner'
      }
    ]
  },
  {
    name: '用户管理',
    icon: 'iconfont icon-ttpodicon',
    index: '8',
    children: [
      {
        index:"8-1",
        name: '用户',
        path: '/Home/user'
      }
    ]
  },
  {
    name:'订单管理',
    icon:"iconfont icon-dingdan",
    index:'9',
    children: [
      {
        index:'9-1',
        name:"订单",
        path:"/Home/order"
      }
    ]
  },
  {
    name: '音乐看板',
    icon: 'iconfont icon-shujukanban',
    index: '10',
    children: [
      {
        index:"10-1",
        name: 'billboard',
        path: '/Home/billboard'
      }
    ]
  }
];
export { menu };

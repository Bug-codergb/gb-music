import http from "@/api";
export function getMenuListApi(params) {
  return new Promise((resolve, reject) => {
    resolve([
      {
        path: "/artist",
        component: "/artist/index",
        title: "歌手信息",
        redirect: "/artist/index",
        meta: {
          title: "歌手管理",
          icon: "UserFilled"
        },
        children: [
          {
            path: "/artist/index",
            component: "/artist/index",
            meta: {
              title: "歌手信息",
              icon: "Menu"
            },
            children: [
              {
                path:"/artist/:id",
                component:"/detail/artist-detail/index",///Users/guobin/vscode projecy/gb-music/gb-music-manage-new/src/views/detail/artist-detail/index.vue
                meta:{
                  title:"歌手详情",
                  icon:"Menu",
                  isHide:true,
                  activeMenu:"/artist/index"
                }
              }
            ]
          },
        ]
      },
      {
        path: "/album",
        component: "/album/index",
        title: "专辑信息",
        redirect: "/album/index",
        meta: {
          title: "专辑管理",
          icon: "List"
        },
        children: [
          {
            path: "/album/index",
            component: "/album/index",
            meta: {
              title: "专辑信息",
              icon: "Menu"
            },
            children: [
              {
                path:"/album/:id",
                component:"/detail/album-detail/index",
                meta:{
                  isHide: true,
                  title:"专辑详情",
                  icon:"Menu",
                  activeMenu: "/album/index"
                }
              }
            ]
          },
        ]
      },
      {
        path: "/playlist",
        component: "/playlist/index",
        title: "歌单管理",
        redirect: "/playlist/index",
        meta: {
          title: "歌单管理",
          icon: "List"
        },
        children: [
          {
            path: "/playlist/index",
            component: "/playlist/index/index",
            meta: {
              title: "歌单信息",
              icon: "Menu"
            }
          },
          {
            path: "/playlist/song",
            component: "/playlist/song/index",
            meta: {
              title: "歌曲信息",
              icon: "Menu"
            }
          },
          {
            path:"/playlist/detail/:id",
            component:"/detail/playlist-detail/index",
            meta:{
              title:"歌单详情",
              icon:"Menu",
              activeMenu:"/playlist/index",
              isHide: true,
            }
          }
        ]
      },
      {
        path: "/video",
        component: "/video/index",
        title: "视频信息",
        redirect: "/video/index",
        meta: {
          title: "视频信息",
          icon:"Platform"
        },
        children: [
          {
            path: "/video/index",
            component: "/video/index",
            meta: {
              title: "视频管理",
              icon: "Menu"
            }
          },
          {
            path: "/mv/index",
            component: "/video/components/MV/index",
            meta: {
              title: "MV管理",
              icon: "Menu"
            }
          },
        ]
      },
      {
        path: "/toplist",
        component: "/toplist/index",
        title: "排行榜信息",
        redirect: "/toplist/index",
        meta: {
          title: "排行榜信息",
          icon:"Histogram"
        },
        children: [
          {
            path: "/toplist/index",
            component: "/toplist/index",
            meta: {
              title: "排行榜管理",
              icon: "Menu"
            }
          }
        ]
      },
      {
        path: "/channel",
        component: "/channel/index",
        title: "电台信息",
        redirect: "/channel/index",
        meta: {
          title: "电台信息",
          icon:"VideoCameraFilled"
        },
        children: [
          {
            path: "/channel/index",
            component: "/channel/index",
            meta: {
              title: "电台管理",
              icon: "Menu"
            }
          },
          {
            path: "/channel/detail/:id",
            component: "/channel/components/channelDetail/index",
            meta: {
              title: "电台内容",
              icon: "Menu",
              activeMenu: "/channel/index",
              isHide:true
            },
          },
          {
            path:"/program/:id",
            component: "/detail/program-detail/index",
            meta:{
              title:"声音",
              icon:"Menu",
              activeMenu: "/channel/index",
              isHide: true
            }
          }
        ]
      },
      {
        path: "/user",
        component: "/user/index",
        title: "用户信息",
        redirect: "/user/index",
        meta: {
          title: "用户管理",
          icon: "UserFilled"
        },
        children: [
          {
            path: "/user/index",
            component: "/user/index",
            title: "用户信息",
            meta: {
              title: "用户管理",
              icon: "Menu"
            },
          }
        ]
      },
      {
        path:"/dashboard/index",
        component:"/dashboard/index",
        title:"看板",
        meta:{
          title:"看板",
          icon:"TrendCharts"
        }
      },
      {
        path: "/setting/index",
        component: "/setting/index",
        title: "系统设置",
        redirect:"/role/index",
        children: [
          {
            path: "/role/index",
            component: "/role/index",
            meta: {
              title: "角色管理",
              icon: "Menu"
            }
          },
          {
            path: "/account/index",
            component: "/account/index",
            meta: {
              title: "账户管理",
              icon: "Menu"
            },
            redirect:"/personal/index",
            children:[
              {
                path:"/personal/index",
                component:"/account/personal/index",
                meta:{
                  title:"个人账户",
                  icon:"House"
                }
              },
              {
                path:"/system/index",
                component:"/account/system/index",
                meta:{
                  title:"系统账户",
                  icon:"House"
                }
              }
            ]
          },
          {
            path:"/banner",
            component:"/banner/index",
            meta:{
              title:"banner图",
              icon: "Menu"
            }
          }
        ],
        meta: {
          title: "系统设置",
          icon: "Menu"
        }
      },
      {
        path: "/menu/index",
        component: "/menu/index",
        meta: {
          title: "菜单管理",
          icon: "Menu"
        }
      }
    ])
  })
}

import http from "@/api";
export function getMenuListApi(params) {
  return new Promise((resolve, reject) => {
    resolve([
      {
        path: "/home/index",
        component: "/home/index",
        title: "首页",
        children: [
          {
            path: "/user/index",
            component: "/user/index",
            title: "用户详情",
            meta: {
              title: "用户详情",
              isHide: true,
              activeMenu:"/home/index"
            }
          }
        ],
        meta: {
          title: "首页",
          icon: "HomeFilled"
        }
      },
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
            }
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
            }
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
          icon:"TrendCharts"
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

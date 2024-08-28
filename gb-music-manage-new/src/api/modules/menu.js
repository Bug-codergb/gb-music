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
          icon: "Menu"
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
          }
        ],
        meta: {
          title: "系统设置",
          icon: "Menu"
        }
      },
      {
        path: "/data/index",
        component: "/data/index",
        meta: {
          title: "数据管理",
          icon: "Menu"
        }
      },
      {
        path: "/vendor/index",
        component: "/vendor/index",
        meta: {
          title: "供应商管理",
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

import { createRouter, createWebHashHistory } from "vue-router";
import { staticRouter } from "./modules/staticRouter";

import { LOGIN_URL} from "@/config/index"
import { initDynamicRouter } from "./modules/dynamicRouter";
import useAuthStore from "../stores/modules/auth";
import { useUserStore } from "../stores/modules/user"
import NProgress from "@/config/nprogress";

const router = createRouter({
  history: createWebHashHistory(),
  routes: [...staticRouter],
  strict: false,
  scrollBehavior: () => ({ left: 0, top: 0 })
});
router.beforeEach(async (to, from, next) => {
  const authStore = useAuthStore();
  const userStore = useUserStore();

  NProgress.start();
  

  if (to.path.toLocaleLowerCase() === LOGIN_URL) {
    if (userStore.token) return next(from.fullPath);
    return next();
  }

  if (!userStore.token) {
    return next({path:LOGIN_URL,replace:true})
  }

  if (!authStore.authMenuListGet.length) {
    await initDynamicRouter();

    return next({ ...to });
  }
  next();
});
router.afterEach(() => {
  NProgress.done();
});
export default router;

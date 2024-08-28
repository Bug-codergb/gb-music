import { defineStore } from "pinia";
import { DEFAULT_PRIMARY } from "@/config";
import piniaPersistConfig from "@/stores/helper/persist";
export const useGlobalStore = defineStore({
  id: "admin-global",
  state: () => ({
    iconList:[],
    isCollapse: false,
    breadcrumbIcon: true,
    // 深色模式
    isDark: false,
    // 灰色模式
    isGrey: false,
    // 色弱模式
    isWeak: false,
    primary: DEFAULT_PRIMARY,
  }),
  actions: {
    setGlobalState(...args) {
      this.$patch({ [args[0]]: args[1] });
    }
  },
  persist: piniaPersistConfig("admin-global")
});

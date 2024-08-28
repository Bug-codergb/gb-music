import { defineStore } from "pinia";
import piniaPersistConfig from "@/stores/helper/persist";

export const useUserStore = defineStore({
  id: "admin-user",
  state: () => {
    return {
      token: "",
      userInfo:{name:""}
    }
  },
  actions: {
    setToken(token) {
      this.token = token;
    },
    serUserInfo(userInfo) {
      this.userInfo = userInfo;
    }
  },
  persist:piniaPersistConfig("admin-user")
})
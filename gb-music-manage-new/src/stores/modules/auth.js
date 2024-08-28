import { defineStore } from "pinia";
import { getFlatMenuList } from "@/utils/index.js";
import { getMenuListApi } from "../../api/modules/menu";
import {getAllBreadcrumbList,getShowMenuList} from "@/utils"
const useAuthStore = defineStore({
  id: "auth",
  state: () => {
    return {
      authMenuList: [],
      authButtonList: []
    };
  },
  getters: {
    authMenuListGet: state => state.authMenuList,
    showMenuListGet: state => state.authMenuList,
    flatMenuListGet: state => getFlatMenuList(state.authMenuList),
    showMenuListGet: state => getShowMenuList(state.authMenuList),

    authButtonListGet: state => state.authButtonList,

    breadcrumbListGet: state => getAllBreadcrumbList(state.authMenuList)
  },
  actions: {
    async getAuthMenuList() {
      this.authMenuList = await getMenuListApi();
    }
  }
});
export default useAuthStore;

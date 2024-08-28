<template>
  <el-container class="layout">
    <el-aside>
      <div class="aside-box" :style="{ width: isCollapse ? '65px' : '210px' }">
        <div class="logo flx-center">
          <img class="logo-img" src="../../assets/logo.svg" />
          <span v-show="!isCollapse" class="logo-text">Admin</span>
        </div>
        <el-scrollbar>
          <el-menu :router="false" :collapse="isCollapse" :default-active="activeMenu">
            <SubMenu :menu-list="menuList" />
          </el-menu>
        </el-scrollbar>
      </div>
    </el-aside>
    <el-container>
      <el-header>
        <ToolBarLeft />
        <ToolBarRight />
      </el-header>
      <Main />
    </el-container>
  </el-container>
</template>
<script setup name="layoutVertical">
import { computed, ref } from "vue";
import { useRoute } from "vue-router";
import SubMenu from "../components/Menu/SubMenu.vue";
import Main from "../components/Main/index.vue";
import ToolBarLeft from "@/layouts/components/Header/ToolBarLeft.vue";
import ToolBarRight from "@/layouts/components/Header/ToolBarRight.vue";
import useAuthStore from "@/stores/modules/auth.js";

import { useGlobalStore } from "@/stores/modules/global";
const authStore = useAuthStore();
const menuList = computed(() => authStore.showMenuListGet);

const globalStore = useGlobalStore();
const isCollapse = computed(() => globalStore.isCollapse);

const route = useRoute();
const activeMenu = computed(() => (route.meta.activeMenu ? route.meta.activeMenu : route.path));
</script>
<style>
.el-menu {
  border-right: none;
}
.el-aside {
  border-right: 1px solid #dcdfe6;
}
</style>
<style scoped lang="scss">
@import "./index";
</style>

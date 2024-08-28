<template>
  <el-drawer v-model="drawerVisible" title="布局设置" size="290px">
    <el-divider class="divider" content-position="center">
      <el-icon><ColdDrink /></el-icon>
      全局主题
    </el-divider>
    <div class="theme-item">
      <span>主题颜色</span>
      <el-color-picker v-model="primary" :predefine="colorList" @change="changePrimary" />
    </div>
    <div class="theme-item">
      <span>暗黑模式</span>
      <!-- <SwitchDark /> -->
    </div>
    <div class="theme-item">
      <span>灰色模式</span>
      <el-switch v-model="isGrey" @change="e => changeGreyOrWeak('grey', e)" />
    </div>
    <div class="theme-item mb40">
      <span>色弱模式</span>
      <el-switch v-model="isWeak" @change="e => changeGreyOrWeak('weak')" />
    </div>
  </el-drawer>
</template>
<script setup>
import { ref } from "vue";
import { storeToRefs } from "pinia";
import mittBus from "@/utils/mittBus";
import { DEFAULT_PRIMARY } from "@/config";
import { useGlobalStore } from "@/stores/modules/global";
import { useTheme } from "@/hooks/useTheme";
//import SwitchDark from "@/components/SwitchDark/index.vue";

const drawerVisible = ref(false);
mittBus.on("openThemeDrawer", () => ((drawerVisible.value = true), console.log(12)));

const globalStore = useGlobalStore();
const { primary, isGrey, isWeak } = storeToRefs(globalStore);
const colorList = [
  DEFAULT_PRIMARY,
  "#daa96e",
  "#0c819f",
  "#409eff",
  "#27ae60",
  "#ff5c93",
  "#e74c3c",
  "#fd726d",
  "#f39c12",
  "#9b59b6"
];
const { changePrimary, changeGreyOrWeak } = useTheme();
</script>
<style lang="scss" scoped>
@import "./index";
</style>

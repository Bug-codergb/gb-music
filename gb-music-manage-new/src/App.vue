<script setup name="App">
import { computed } from "vue";

import en from "element-plus/es/locale/lang/en";
import zhCn from "element-plus/es/locale/lang/zh-cn";

import { useTheme } from "@/hooks/useTheme";
const { initTheme } = useTheme();

import { useGlobalStore } from "@/stores/modules/global.js";
const globalStore = useGlobalStore();
const locale = computed(() => {
  if (globalStore.language == "zh") return zhCn;
  if (globalStore.language == "en") return en;
  return zhCn;
});
initTheme();
</script>
<template>
  <el-config-provider :locale="locale">
    <router-view></router-view>
  </el-config-provider>
</template>

<style scoped></style>

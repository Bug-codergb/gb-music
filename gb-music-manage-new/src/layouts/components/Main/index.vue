<template>
  <el-main>
    <router-view v-slot="{ Component, route }">
      <component :is="Component" />
    </router-view>
  </el-main>
</template>
<script setup name="Main">
import { ref, onBeforeUnmount } from "vue";
import { storeToRefs } from "pinia";
import { useDebounceFn } from "@vueuse/core";
const globalStore = useGlobalStore();
import { useGlobalStore } from "@/stores/modules/global";

const { isCollapse } = storeToRefs(globalStore);
// 监听窗口大小变化，折叠侧边栏
const screenWidth = ref(0);
const listeningWindow = useDebounceFn(() => {
  screenWidth.value = document.body.clientWidth;
  if (!isCollapse.value && screenWidth.value < 1200) globalStore.setGlobalState("isCollapse", true);
  if (isCollapse.value && screenWidth.value > 1200) globalStore.setGlobalState("isCollapse", false);
}, 100);
window.addEventListener("resize", listeningWindow, false);
onBeforeUnmount(() => {
  window.removeEventListener("resize", listeningWindow);
});
</script>
<style scoped>
.el-main {
  box-sizing: border-box;
  padding: 10px 12px;
  overflow-x: hidden;
  background-color: var(--el-bg-color-page);
}
</style>

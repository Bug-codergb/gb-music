<script setup>
import Fullscreen from "./components/Fullscreen.vue";
import ThemeSetting from "./components/ThemeSetting.vue";
import Avatar from "./components/Avatar.vue";
</script>

<template>
  <div class="tool-bar-ri">
    <div class="header-icon">
      <ThemeSetting id="themeSetting" />
      <Fullscreen />
    </div>
    <span class="username">Admin</span>
    <Avatar />
  </div>
</template>

<style scoped lang="scss">
.tool-bar-ri {
  display: flex;
  align-items: center;
  justify-content: center;
  padding-right: 25px;
  .header-icon {
    display: flex;
    align-items: center;
    & > * {
      margin-left: 21px;
      color: var(--el-header-text-color);
    }
  }
  .username {
    margin: 0 20px;
    font-size: 15px;
    color: var(--el-header-text-color);
  }
}
</style>

<template>
  <div id="app">
    <router-view />
  </div>
</template>

<style></style>
<script>
import Login from './views/login/Login';
export default {
  components: { Login }
};
</script>
<style scoped lang="less">
@import './assets/css/base.css';
@import './assets/font/iconfont.css';
</style>

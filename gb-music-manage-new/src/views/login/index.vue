<template>
  <div class="login-container flx-center">
    <div class="login-box">
      <div class="login-left">
        <img class="login-left-img" src="@/assets/images/bgc.gif" alt="login" />
      </div>
      <div class="login-form">
        <div class="login-logo">
          <img class="login-icon" src="@/assets/logo.svg" alt="" />
          <h2 class="logo-text">Admin-System</h2>
        </div>
        <LoginForm />
      </div>
    </div>
  </div>
</template>
<script setup>
import LoginForm from "./components/LoginForm.vue";
import { initDynamicRouter } from "@/router/modules/dynamicRouter";
import { useRouter } from "vue-router";
import { HOME_URL } from "@/config/index";
const router = useRouter();
const login = async () => {
  await initDynamicRouter();
  router.push({
    path: HOME_URL
  });
};
</script>
<style scoped lang="scss">
@import "./index";
</style>

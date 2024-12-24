<template>
  <el-form ref="loginFormRef" :model="loginForm" :rules="loginRules" size="large">
    <el-form-item prop="username">
      <el-input v-model="loginForm.username" placeholder="请输入用户名">
        <template #prefix>
          <el-icon class="el-input__icon">
            <user />
          </el-icon>
        </template>
      </el-input>
    </el-form-item>
    <el-form-item prop="password">
      <el-input v-model="loginForm.password" type="password" placeholder="请输入密码" show-password autocomplete="new-password">
        <template #prefix>
          <el-icon class="el-input__icon">
            <lock />
          </el-icon>
        </template>
      </el-input>
    </el-form-item>
  </el-form>
  <div class="login-btn">
    <el-button :icon="CircleClose" round size="large" @click="resetForm(loginFormRef)"> 重置 </el-button>
    <el-button :icon="UserFilled" round size="large" type="primary" :loading="loading" @click="login(loginFormRef)">
      登录
    </el-button>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, onBeforeUnmount } from "vue";
import { useRouter } from "vue-router";

import { useUserStore } from "@/stores/modules/user";

import { loginApi } from "@/api/modules/login.js";
import { HOME_URL } from "@/config/index";

import { initDynamicRouter } from "@/router/modules/dynamicRouter";
import { CircleClose, UserFilled } from "@element-plus/icons-vue";
import {ElMessage} from "element-plus";

const router = useRouter();
const userStore = useUserStore();

const loginFormRef = ref();
const loginRules = reactive({
  username: [{ required: true, message: "请输入用户名", trigger: "blur" }],
  password: [{ required: true, message: "请输入密码", trigger: "blur" }]
});

const loading = ref(false);
const loginForm = reactive({
  username: "",
  password: ""
});

// login
const login = formEl => {
  if (!formEl) return;
  formEl.validate(async valid => {
    if (!valid) return;
    loading.value = true;
    try {
      const res = await loginApi({
        userName: loginForm.username,
        password: loginForm.password
      });
      if(res.manage === 1){
        userStore.token = res.token;
        userStore.userInfo = res;

        await initDynamicRouter();
        router.push(HOME_URL);
      }else{
        ElMessage.closeAll();
        ElMessage.warning("您当前无权限访问，请联系管理员")
      }

    } finally {
      loading.value = false;
    }
  });
};

// resetForm
const resetForm = formEl => {
  if (!formEl) return;
  formEl.resetFields();
};

onMounted(() => {
  // 监听 enter 事件（调用登录）
  document.onkeydown = e => {
    if (e.code === "Enter" || e.code === "enter" || e.code === "NumpadEnter") {
      if (loading.value) return;
      login(loginFormRef.value);
    }
  };
});

onBeforeUnmount(() => {
  document.onkeydown = null;
});
</script>

<style scoped lang="scss">
@import "../index";
</style>

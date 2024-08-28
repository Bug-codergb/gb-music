<template>
  <div class="card home">
    home
    <button @click="handleUser">用户详情</button>
  </div>
</template>
<script name="home" setup>
import { useRouter } from "vue-router";
const router = useRouter();
const handleUser = () => {
  router.push({
    path: "/user/index"
  });
};
</script>
<style scoped lang="scss">
.home {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
}
</style>
, useRoute

<template>
  <div class="create-artist">
    <ProDrawer v-model="isShow" title="添加歌手" width="50%">
      <ProForm />
    </ProDrawer>
  </div>
</template>
<script setup>
import { ref } from "vue";
import ProDrawer from "@/components/ProDrawer/index.vue";
import ProForm from "@/components/ProForm/index.vue";
const isShow = ref(true);
</script>

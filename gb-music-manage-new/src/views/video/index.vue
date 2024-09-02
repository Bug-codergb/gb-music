<template>
  <div class="card table-box">
    <el-tabs v-model="activeName">
      <el-tab-pane label="视频" name="first">
        <VideoCpn />
      </el-tab-pane>
      <el-tab-pane label="分类" name="second">
        <MV />
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script setup>
import { ref } from "vue";
import VideoCpn from "./components/video/index.vue";
import MV from "./components/MV/index.vue";
const activeName = ref("first");
</script>

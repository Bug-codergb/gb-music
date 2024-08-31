<template>
  <div class="card table-box">
    <el-tabs v-model="activeName">
      <el-tab-pane label="专辑信息" name="first">
        <AlbumIndex />
      </el-tab-pane>
      <el-tab-pane label="类别" name="third">
        <AlbumType />
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script setup>
import { ref } from "vue";
const activeName = ref("first");
import AlbumIndex from "./components/album/index.vue";
import AlbumType from "./components/albumType/index.vue";
</script>

<template>
  <div class="table-box card">
    <el-tabs v-model="activeName">
      <el-tab-pane label="歌单" name="first">
        <Playlist/>
      </el-tab-pane>
      <el-tab-pane label="歌单分类" name="second">
        <PlaylistCate/>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script setup>
import { ref,reactive } from "vue";
import Playlist from "./components/playlist/index.vue"
import PlaylistCate from "./components/playlistCate/index.vue"
const activeName = ref("first");
</script>

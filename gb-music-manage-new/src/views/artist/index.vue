<template>
  <div class="card table-box">
    <el-tabs v-model="activeName">
      <el-tab-pane label="歌手信息" name="first">
        <ArtistCpn />
      </el-tab-pane>
      <el-tab-pane label="语种" name="second">
        <ArtistLang />
      </el-tab-pane>
      <el-tab-pane label="类别" name="third">
        <ArtistType />
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script setup>
import { ref } from "vue";
import ArtistCpn from "./components/artist/index.vue";
import ArtistLang from "./components/artist-lang/index.vue";
import ArtistType from "./components/artist-type/index.vue";
const activeName = ref("first");
</script>

<script setup>
import { useRoute } from "vue-router"
import { getArtistDetailApi } from "@/api/modules/artist"
import {ref,reactive} from "vue";
import SongList from "./components/songList/index.vue"
import MvList from "./components/mvList/index.vue"
import AlbumList from "./components/albumList/index.vue"
const route = useRoute();
const artistDetail = ref({});
getArtistDetailApi({id:route.params.id}).then((res)=>{
  artistDetail.value = res;
})
const activeName = ref("song");
</script>
<template>
  <div class="table-box">
    <div class="card header-info">
      <el-row :gutter="12">
        <el-col :span="4">
          <el-image :src="artistDetail.avatarUrl" fit="contain" style="width:140px"/>
        </el-col>
        <el-col :span="20">
          <el-form class="artist-base-info">
            <el-form-item label="名称">{{artistDetail.name}}</el-form-item>
            <el-form-item label="分类">{{artistDetail.category?.name}}</el-form-item>
            <el-form-item label="简介">{{artistDetail.description}}</el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </div>
    <div class="table-box card">
      <el-tabs v-model="activeName">
        <el-tab-pane label="ta的歌曲" name="song">
          <SongList/>
        </el-tab-pane>
        <el-tab-pane label="ta的专辑" name="album">
          <AlbumList/>
        </el-tab-pane>
        <el-tab-pane label="ta的mv" name="mv">
          <MvList/>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<style scoped lang="scss">
.header-info{
  margin: 0 0 12px 0;
}
.artist-base-info{
  :deep(.el-form-item){
    margin:0 0 10px 0!important
  }
}
</style>

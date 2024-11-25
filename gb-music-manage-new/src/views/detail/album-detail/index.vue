<script setup>
import { ref,reactive } from "vue";
import CreateSong from "@/views/playlist/song/components/createSong.vue";
import SongList from "./components/SongList.vue"
import { useRoute } from "vue-router"
import {getAlbumDetailApi} from "@/api/modules/album";

import moment from "moment";

const route = useRoute();
const searchParams = reactive({
  albumId:route.params.id
})
const albumDetail = ref({});

const createSongRef = ref();
const handleUploadSong=()=>{
  createSongRef.value && createSongRef.value.showDrawer(undefined,{
    album:albumDetail.value,
  })
}
const activeName = ref("name");
const search=()=>{
  getAlbumDetailApi(searchParams).then((res)=>{
    albumDetail.value = res;
  })
}
search();
</script>

<template>
  <div class="table-box">
    <div class="card header-info">
      <el-row :gutter="16">
        <el-col :span="4">
          <el-image :src="albumDetail.coverUrl" fit="contain" style="width:140px"/>
        </el-col>
        <el-col :span="20">
          <el-form class="album-detail-form">
            <el-row :gutter="24">
              <el-col :span="12">
                <el-form-item label="名称:">{{albumDetail.name}}</el-form-item>
                <el-form-item label="歌手:">
                  <el-space>
                    <el-avatar :size="40" :src="albumDetail.artist?.avatarUrl"></el-avatar>
                    <span>{{albumDetail.artist?.name}}</span>
                  </el-space>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="handleUploadSong">上传歌曲</el-button>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="发行时间:">
                  {{ moment(albumDetail.publishTime).format("yyyy-MM-DD") }}
                </el-form-item>
                <el-form-item label="简介:">
                  <el-tooltip placement="top" :content="albumDetail.description" :show-after="500">
                    <span class="mle">
                      {{albumDetail.description}}
                    </span>
                  </el-tooltip>
                </el-form-item>
              </el-col>
            </el-row>

          </el-form>
        </el-col>
      </el-row>
      <CreateSong ref="createSongRef" @success="search" :is-album-detail="true"/>
    </div>
    <div class="card table-box">
      <el-tabs v-model="activeName">
        <el-tab-pane label="歌曲列表" name="name">
          <SongList v-if="albumDetail && albumDetail.songs"
                    :album="albumDetail"
                    :songs="albumDetail.songs || []"
                    @success="search"/>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<style scoped lang="scss">
  .header-info{
    margin:0 0 12px 0;
  }
  .album-detail-form{
    .el-form-item{
      margin:0 0 10px 0
    }
  }
</style>

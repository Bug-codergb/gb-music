<script setup>
import { ref,reactive } from "vue";
import moment from "moment";
import {useRoute} from "vue-router";
import {getVideoDetailApi,getVideoUrlApi} from "@/api/modules/video"

const route = useRoute();
const videoDetail = ref({});
getVideoDetailApi({id:route.params.id}).then((res)=>{
  videoDetail.value = res;
})
const url = ref("")
getVideoUrlApi({vid:route.params.id}).then((res)=>{
  url.value = res.url;
})
</script>

<template>
  <div class="card table-box">
    <el-row :gutter="0">

      <el-col :span="24">
        <el-descriptions :column="3" border class="video-detail-description">
          <el-descriptions-item label="源文件" :span="3">
            <video class="video-source" controls :src="url"/>
          </el-descriptions-item>
          <el-descriptions-item label="名称" :span="3">{{videoDetail.name}}</el-descriptions-item>
          <el-descriptions-item label="创建人" :span="3">
            <el-space v-if="videoDetail.user">
              <el-avatar :src="videoDetail.user.avatarUrl"/>
              <span>{{videoDetail.user.userName}}</span>
            </el-space>
          </el-descriptions-item>
          <el-descriptions-item label="分类" :span="3">{{ videoDetail.category?.name }}</el-descriptions-item>
          <el-descriptions-item label="创建时间" :span="3">{{moment(videoDetail.createTime).format("yyyy-MM-DD HH:mm")}}</el-descriptions-item>
          <el-descriptions-item label="播放量" :span="3">{{videoDetail.playCount||0}}</el-descriptions-item>
          <el-descriptions-item label="简介" :span="3">
            {{videoDetail.description}}
          </el-descriptions-item>

        </el-descriptions>
      </el-col>
    </el-row>
  </div>
</template>
<style lang="scss">

.video-detail-description{
  .el-descriptions__label{
    white-space: nowrap;
  }
}
</style>
<style scoped lang="scss">
.video-source{
  width: 40%;
  display: block;

  object-fit: contain;
  background-color: #fff
}
</style>

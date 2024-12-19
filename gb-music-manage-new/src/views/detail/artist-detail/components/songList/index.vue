<script setup lang="jsx">
import {ref,reactive} from "vue"
import { useRoute } from "vue-router"
import { formatTime } from "@/utils/time"
import {getArtistSongApi} from "@/api/modules/song"
import ProTable from "@/components/ProTable/index.vue"
import PlayContainer from "@/components/PlayContainer/index.vue";

const route = useRoute();
const columns = reactive([
  {
    label:"歌曲名称",
    prop:"name",
    isShow:true,
    render:(scope)=>{
      return <el-link type="primary" onClick={()=>handlePlay(scope.row)}>{scope.row.name}</el-link>
    }
  },
  {
    label:"专辑名称",
    prop:"album",
    isShow:true,
    render:(scope)=>{
      return <span>{scope.row.album.name}</span>
    }
  },
  {
    label:"时长",
    prop:"duration",
    isShow:true,
    render:(scope)=>{
      return formatTime(scope.row.duration,"mm:ss");
    }
  },
  {
    label:"是否为会员",
    prop:"vip",
    isShow:true
  },
  {
    label:"操作",
    prop:"action"
  }
])
const searchParams = reactive({
  id:route.params.id
})
const playContainerRef = ref();
const handlePlay=(row)=>{
  playContainerRef.value && playContainerRef.value.showDialog(row.id);
}
</script>

<template>
  <div class="table-box">
    <ProTable :init-param="searchParams" :request-api="getArtistSongApi" :pagination="true" :columns="columns" data-alias="songs"/>
    <PlayContainer ref="playContainerRef" />
  </div>
</template>

<style scoped lang="scss">

</style>

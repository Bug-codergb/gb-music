<script setup lang="jsx">
import { reactive } from "vue"
import { useRoute ,useRouter} from "vue-router"
import moment from "moment"
import ProTable from "@/components/ProTable/index"
import {getArtistMVApi} from "@/api/modules/artist"

const route = useRoute();
const router = useRouter();
const searchParams=reactive({
  id:route.params.id
})
const columns = reactive([
  {
    label:"mv名称",
    prop:"name",
    isShow:true,
    render:(scope)=>{
      return <el-link type="primary" onClick={()=>handeToVideoDetail(scope.row)}>
        {scope.row.name}
      </el-link>
    }
  },
  {
    label:"创建时间",
    prop:"createTime",
    isShow:true,
    render:(scope)=>{
      return moment(scope.row.createTime).format("yyyy-MM-DD HH:mm")
    }
  },
  {
    label:"播放量",
    prop:"playCount",
    isShow:true
  },
  {
    label:"时长",
    prop:"dt",
    isShow:true,
    render: (scope)=>{
      return moment(scope.row.dt).format("mm:ss")
    }
  }
])
const handeToVideoDetail=(item)=>{
  router.push(`/video/${item.id}`);
}
</script>

<template>
  <div class="table-box">
    <ProTable :columns="columns" :requestApi="getArtistMVApi" :pagination="false" :initParam="searchParams" :toolButton="false"/>
  </div>
</template>

<style scoped lang="scss">

</style>

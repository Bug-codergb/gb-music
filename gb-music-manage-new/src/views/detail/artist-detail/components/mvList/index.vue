<script setup>
import { reactive } from "vue"
import { useRoute } from "vue-router"
import moment from "moment"
import ProTable from "@/components/ProTable/index"
import {getArtistMVApi} from "@/api/modules/artist"

const route = useRoute();
const searchParams=reactive({
  id:route.params.id
})
const columns = reactive([
  {
    label:"mv名称",
    prop:"name",
    isShow:true
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
</script>

<template>
  <div class="table-box">
    <ProTable :columns="columns" :requestApi="getArtistMVApi" :pagination="false" :initParam="searchParams" :toolButton="false"/>
  </div>
</template>

<style scoped lang="scss">

</style>

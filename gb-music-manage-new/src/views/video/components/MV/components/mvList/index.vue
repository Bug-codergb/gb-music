<script setup lang="tsx">
import { ref,reactive } from "vue";
import moment from "moment";
import { formatTime } from "@/utils/time"
import {getVideoCateApi, getVideoListApi} from "@/api/modules/video"
import ProTable from "@/components/ProTable/index.vue"
const columns = reactive( [
  {
    label:"封面",
    prop:"coverUrl",
    isShow:true,
    render:(scope)=>{
      return <el-image src={scope.row.coverUrl} preview-src-list={[scope.row.coverUrl]} preview-teleported={true}/>
    }
  },
  {
    label:"名称",
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
    label:"时长",
    prop:"dt",
    isShow:true,
    render:(scope)=>{
      return formatTime(scope.row.dt,"mm:ss")
    }
  },
  {
    label:"播放量",
    prop:"playCount",
    isShow:true
  },
  {
    label:"操作",
    prop:"action",
    isShow:true,
    render:(scope)=>{
      return <el-space size="large">
        <el-link type="primary">查看</el-link>
        <el-link type="primary">编辑</el-link>
        <el-link type="danger">删除</el-link>
      </el-space>
    }
  },
])
const searchParams = reactive({
  keyword: "",
  cateId: "",
  type: 1
});
const tableRef = ref()
const cateList = ref([]);
getVideoCateApi({ type: 1 }).then(res => {
  cateList.value = res.map(item => {
    return {
      label: item.name,
      value: item.id
    };
  });
  searchParams.cateId = res[0].id;
  tableRef.value && tableRef.value.search();
});
</script>

<template>
  <div class="table-box">
    <ProTable ref="tableRef" data-alias="videos" :init-param="searchParams" :columns="columns" :request-auto="false" :pagination="true" :request-api="getVideoListApi"/>
  </div>
</template>

<style scoped lang="scss">

</style>

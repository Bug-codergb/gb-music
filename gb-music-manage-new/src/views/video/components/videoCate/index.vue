<template>
  <div class="table-box">
    <ProTable :columns="columns" :requestApi="getVideoCateApi" />
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import { getVideoCateApi } from "@/api/modules/video.js";
import ProTable from "@/components/ProTable/index";
const columns = reactive([
  {
    label: "名称",
    prop: "name",
    isShow: true
  },
  {
    label: "操作",
    prop: "action",
    isShow: true,
    render: scope => {
      return <el-link type="danger">删除</el-link>;
    }
  }
]);
</script>

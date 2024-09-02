<template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      :requestApi="getSongListApi"
      :requestAuto="true"
      dataAlias="songs"
      :initParam="searchParams"
      :pagination="true"
    >
      <template #tableHeader>
        <el-form>
          <el-form-item>
            <el-input
              v-model="searchParams.keyword"
              placeholder="请输入歌曲名称"
            />
          </el-form-item>
        </el-form>
      </template>
      <template #toolButton>
        <el-button type="primary">添加歌曲</el-button>
      </template>
    </ProTable>
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import { getSongListApi } from "@/api/modules/song.js";
import ProTable from "@/components/ProTable/index";
const columns = reactive([
  {
    label: "歌曲名称",
    prop: "name",
    isShow: true
  },
  {
    label: "专辑",
    prop: "album.name",
    isShow: true
  },
  {
    label: "歌手",
    prop: "artist.name",
    isShow: true
  },
  {
    label: "操作",
    prop: "action",
    isShow: true,
    render: scope => {
      return (
        <el-space size="large">
          <el-link type="primary">添加mv</el-link>
          <el-link type="success">上传歌词</el-link>
          <el-link type="warning">编辑</el-link>
          <el-link type="danger">删除</el-link>
        </el-space>
      );
    }
  }
]);
const searchParams = reactive({
  keyword: ""
});
</script>

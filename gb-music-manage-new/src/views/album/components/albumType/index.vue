<template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      :requestApi="getAlbumTypeListApi"
      :requestAuto="true"
      ref="tableRef"
    >
      <template #tableHeader>
        <div style="font-size:14px;color:#919398">
          注意，删除分类会关联删除分类下专辑
        </div>
      </template>
      <template #toolButton>
        <el-button type="primary" @click="handleCreateAlbumType"
          >新增</el-button
        >
      </template>
    </ProTable>
    <CreateAlbumType ref="createAlbumTypeRef" @success="search" />
  </div>
</template>
<script setup lang="jsx">
import { reactive, ref } from "vue";
import { ElMessageBox, ElMessage } from "element-plus";
import ProTable from "@/components/ProTable/index.vue";
import CreateAlbumType from "../createAlbumType/index.vue";
import {
  getAlbumTypeListApi,
  deleteAlbumTypeApi
} from "@/api/modules/album.js";
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
      return (
        <el-link
          type="danger"
          onClick={() => handleDeleteAlbumType(scope.row)}
        >
          删除
        </el-link>
      );
    }
  }
]);
const handleDeleteAlbumType = item => {
  ElMessageBox.confirm("确认删除么？", "提示", {
    type: "warning"
  }).then(async () => {
    const ret = await deleteAlbumTypeApi({
      id: item.id
    });
    ElMessage.success("删除成功");
    search();
  });
};
const tableRef = ref();
const search = () => {
  tableRef.value && tableRef.value.search();
};

const createAlbumTypeRef = ref();
const handleCreateAlbumType = () => {
  createAlbumTypeRef.value && createAlbumTypeRef.value.showDrawer();
};
</script>

<template>
  <div class="table-box card">
    <ProTable
      :requestApi="getChannelListApi"
      :pagination="false"
      :columns="columns"
      ref="tableRef"
    >
      <template #toolButton>
        <el-button type="primary" @click="handleCreate"
          >新增电台分类</el-button
        >
      </template>
    </ProTable>
    <CreateChannelCate ref="createChannelCateRef" @success="search" />
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import { useRouter } from "vue-router";
import { ElMessageBox, ElMessage } from "element-plus";
import moment from "moment";
import ProTable from "@/components/ProTable/index";
import CreateChannelCate from "./components/createChannelCate/index.vue";
import {
  getChannelListApi,
  deleteChannelTypeApi
} from "@/api/modules/channel.js";

const router = useRouter();

const columns = reactive([
  {
    label: "电台分类名称",
    prop: "name",
    isShow: true
  },
  {
    label: "创建时间",
    prop: "createTime",
    isShow: true,
    render: scope => {
      return moment(scope.row.createTime).format("yyyy-MM-DD HH:mm");
    }
  },
  {
    label: "电台数",
    prop: "count",
    isShow: true
  },
  {
    label: "操作",
    prop: "action",
    isShow: true,
    render: scope => {
      return (
        <el-space size="large">
          <el-link
            type="primary"
            onClick={() => handleDetail(scope.row)}
          >
            查看
          </el-link>
          <el-link
            type="danger"
            onClick={() => handleDelete(scope.row)}
          >
            删除
          </el-link>
        </el-space>
      );
    }
  }
]);
const tableRef = ref();
const createChannelCateRef = ref();
const handleCreate = () => {
  createChannelCateRef.value &&
    createChannelCateRef.value.showDrawer();
};
const search = () => {
  console.log(1);
  tableRef.value && tableRef.value.search();
};
const handleDelete = item => {
  ElMessageBox.confirm("确认删除么?", "提示", {
    type: "warning"
  }).then(async () => {
    await deleteChannelTypeApi({ id: item.id });
    ElMessage.success("删除成功");
    search();
  });
};
const handleDetail = item => {
  router.push({
    path: `/channel/detail/${item.id}`
  });
};
</script>

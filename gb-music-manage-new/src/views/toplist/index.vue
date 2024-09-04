<template>
  <div class="table-box">
    <div class="table-box">
      <h4>官方榜单</h4>
      <ProTable
        key="hot"
        :columns="hotColumns"
        :requestApi="getOfficialToplistApi"
      />
    </div>
    <div class="table-box hot">
      <div class="header flx-justify-between">
        <h4>热门榜单</h4>
        <el-link type="primary" @click="handleCreate">新增</el-link>
      </div>
      <ProTable
        ref="tableRef"
        key="official"
        :columns="hotColumns"
        :requestApi="getHotToplistApi"
      />
    </div>
    <CreateToplist ref="createToplistRef" @success="search" />
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import moment from "moment";
import { ElMessageBox, ElMessage } from "element-plus";
import {
  getHotToplistApi,
  getOfficialToplistApi,
  deleteToplistApi
} from "@/api/modules/toplist.js";
import ProTable from "@/components/ProTable/index";
import CreateToplist from "./components/createToplist/index.vue";
const hotColumns = reactive([
  {
    label: "封面",
    prop: "coverUrl",
    isShow: true,
    render: scope => {
      return (
        <el-image
          src={scope.row.coverUrl}
          style={{ width: "100px" }}
        />
      );
    }
  },
  {
    label: "名称",
    prop: "name",
    isShow: true
  },
  {
    label: "创建者",
    prop: "user.userName",
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
    label: "操作",
    prop: "action",
    isShow: true,
    render: scope => {
      return (
        <el-space size="large">
          <el-link type="primary">查看</el-link>
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
const createToplistRef = ref();
const handleCreate = () => {
  createToplistRef.value && createToplistRef.value.showDrawer();
};

const tableRef = ref();
const search = () => {
  tableRef.value && tableRef.value.search();
};

const handleDelete = item => {
  ElMessageBox.confirm("确认删除么?", "提示", {
    type: "warning"
  }).then(async () => {
    const ret = await deleteToplistApi({ id: item.id });
    ElMessage.success("删除成功");
    search();
  });
};
</script>
<style lang="scss" scoped>
.hot {
  margin: 12px 0 0;
}
h4 {
  margin: 10px 0;
}
</style>

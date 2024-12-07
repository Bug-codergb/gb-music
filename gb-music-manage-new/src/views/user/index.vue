<template>
  <div class="table-box">
    <ProTable
      :requestApi="getUserListApi"
      :columns="columns"
      :initParam="searchParams"
      dataAlias="user"
      ref="tableRef"
      :pagination="true"
    >
      <template #toolButton>
        <el-button type="primary" @click="handleCreateUser">添加用户</el-button>
      </template>
    </ProTable>
    <CreateUser ref="createUserRef" @success="handleSearch"/>
  </div>
</template>
<script setup lang="jsx">
import CreateUser from "./components/createUser/index.vue"
import { reactive, ref } from "vue";
import {ElMessage, ElMessageBox} from "element-plus"
import moment from "moment";
import { getUserListApi,deleteUserApi } from "@/api/modules/user.js";
import ProTable from "@/components/ProTable/index";
const columns = reactive([
  {
    label: "用户名称",
    prop: "userName",
    isShow: true
  },
  {
    label: "创建时间",
    prop: "createTime",
    isShow: true,
    width: 180,
    render: scope => {
      return moment(scope.row).format("yyyy-MM-DD HH:mm");
    }
  },
  {
    label: "会员类型",
    prop: "auth",
    isShow: true,
    render: scope => {
      return scope.row.auth === 1 ? "会员" : "非会员";
    }
  },
  {
    label: "会员到期时间",
    prop: "expireTime",
    isShow: true,
    render: scope => {
      return scope.row.auth === 1
        ? moment(scope.row.expireTime).format("yyyy-MM-DD HH:mm")
        : "--";
    }
  },
  {
    label: "角色",
    prop: "manage",
    isShow: true,
    render: scope => {
      return scope.row.manage === 1 ? "管理员" : "普通用户";
    }
  },
  {
    label: "歌单数",
    prop: "playlist",
    isShow: true
  },
  {
    label: "声音作品",
    prop: "channel",
    isShow: true
  },
  {
    label: "动态",
    prop: "moment",
    isShow: true
  },
  {
    label: "操作",
    prop: "action",
    isShow: true,
    fixed: "right",
    width:200,
    render: scope => {
      return (
        <el-space size="large">
          <el-link type="primary">编辑</el-link>
          <el-link type="danger" onClick={()=>handleDelete(scope.row)}>删除</el-link>
        </el-space>
      );
    }
  }
]);
const searchParams = reactive({
  keyword: "",
  manage: -1,
  vip: -1
});
const createUserRef = ref()
const handleCreateUser  =()=>{
  createUserRef.value && createUserRef.value.showDrawer();
}
const tableRef = ref();
const handleSearch=()=>{
  tableRef.value && tableRef.value.search();
}
const handleDelete=(item)=>{
  ElMessageBox.confirm("确认删除该用户么?","提示",{
    type:"warning"
  }).then(async ()=>{
    const res = deleteUserApi({userId:item.userId})
    handleSearch();
    ElMessage.success("删除成功")
  })
}
</script>

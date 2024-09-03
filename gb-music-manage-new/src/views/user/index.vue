<template>
  <div class="table-box">
    <ProTable
      :requestApi="getUserListApi"
      :columns="columns"
      :initParam="searchParams"
      dataAlias="user"
    ></ProTable>
  </div>
</template>
<script setup lang="jsx">
import { reactive, ref } from "vue";
import moment from "moment";
import { getUserListApi } from "@/api/modules/user.js";
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
    render: scope => {
      return (
        <el-space size="large">
          <el-link type="primary">编辑</el-link>
          <el-link type="danger">删除</el-link>
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
</script>

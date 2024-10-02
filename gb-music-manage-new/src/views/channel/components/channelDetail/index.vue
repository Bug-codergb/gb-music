<template>
  <div class="table-box">
    <ProTable
      :requestApi="getChannelDetaiApi"
      :initParam="searchParams"
      :columns="columns"
      dataAlias="channel"
      ref="formRef"
      :pagination="true"
    >
      <template #toolButton>
        <el-button @click="handleCreate" type="primary"
          >新增内容</el-button
        >
      </template>
    </ProTable>
    <CreateChannelContent
      ref="createChannelContentRef"
      @success="search"
    />
    <CreateProgram ref="createProgramRef" @success="search"/>
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import { useRouter } from "vue-router"
import moment from "moment";
import { ElMessage, ElMessageBox } from "element-plus";
import CreateChannelContent from "../createChannelContent/index";
import CreateProgram from "../createProgram/index.vue"
import { useRoute } from "vue-router";
import ProTable from "@/components/ProTable/index";
import {
  getChannelDetaiApi,
  deleteChanneDetail
} from "@/api/modules/channel.js";
const route = useRoute();

const searchParams = reactive({
  id: route.params.id
});
const columns = reactive([
  {
    label: "电台封面",
    prop: "name",
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
    label: "电台名称",
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
    label: "播放量",
    prop: "playCount",
    isShow: true,
    render: scope => {
      return scope.row.playCount === null
        ? "--"
        : scope.row.playCount;
    }
  },
  {
    label: "声音数",
    prop: "count",
    isShow: true
  },
  {
    label: "操作",
    prop: "action",
    isShow: true,
    width:260,
    render: scope => {
      return (
        <el-space size="large">
          <el-link type="primary" onClick={()=>handleEdit(scope.row)}>编辑</el-link>
          <el-link type="success" onClick={()=>handleCreateChannel(scope.row)}>添加声音</el-link>
          <el-link type="warning" onClick={()=>handleDetail(scope.row)}>查看</el-link>
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
const createChannelContentRef = ref();
const handleCreate = () => {
  createChannelContentRef.value &&
    createChannelContentRef.value.showDrawer();
};
const handleEdit=(item)=>{
  createChannelContentRef.value &&
  createChannelContentRef.value.showDrawer(item);
}
const router = useRouter();
const handleDetail=(item)=>{
  router.push(`/program/${item.id}`)
}
const formRef = ref();
const search = () => {
  formRef.value && formRef.value.search();
};

const handleDelete = item => {
  ElMessageBox.confirm("确认删除么?", "提示", {
    type: "warning"
  }).then(async () => {
    await deleteChanneDetail({ id: item.id });
    search();
    ElMessage.success("删除成功");
  });
};
const createProgramRef = ref()
const handleCreateChannel=(item)=>{
  createProgramRef.value && createProgramRef.value.showDrawer(item)
}
</script>

<template>
  <div class="table-box">
    <ProTable :columns="columns" :requestApi="getVideoCateApi" ref="tableRef">
      <template #toolButton>
        <el-button type="primary" @click="handleCreate">新增</el-button>
      </template>
    </ProTable>
    <CreateVideoCate ref="createVideoCateRef" @success="search"/>
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import {ElMessageBox,ElMessage} from "element-plus"
import { getVideoCateApi ,deleteVideoCateApi} from "@/api/modules/video.js";
import ProTable from "@/components/ProTable/index";
import CreateVideoCate from "../createVideoCate/index.vue"
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
      return <el-link type="danger" onClick={()=>handleDelete(scope.row)}>删除</el-link>;
    }
  }
]);
const createVideoCateRef = ref();
const handleCreate=()=>{
  createVideoCateRef.value && createVideoCateRef.value.showDrawer()
}
const tableRef = ref();
const search=()=>{
  tableRef.value && tableRef.value.search();
}
const handleDelete=async (item)=>{
  ElMessageBox.confirm("确认删除么?","提示",{
    type:"warning"
  }).then(async ()=>{
    const res = await deleteVideoCateApi({id:item.id});
    ElMessage.success("删除成功")
    search();
  })

}
</script>

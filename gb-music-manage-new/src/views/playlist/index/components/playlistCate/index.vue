<script setup lang="jsx">
import { reactive,ref } from "vue";
import { ElMessage,ElMessageBox } from "element-plus"
import { getPlaylistCateApi,deletePlaylistCateApi} from "@/api/modules/playlist"
import ProTable from "@/components/ProTable/index.vue"
import CreatePlaylistCate from "../createPlaylistCate/index.vue"
const columns = reactive([
  {
    label:"名称",
    isShow:true,
    prop:"name",
  },
  {
    label:"操作",
    isShow:true,
    prop:"action",
    render:(scope)=>{
      return <el-link type="danger" onClick={()=>handleDelete(scope.row)}>删除</el-link>
    }
  }
])
const tableRef = ref();
const search=()=>{
  tableRef.value && tableRef.value.search();
}
const handleDelete=(item)=>{
  ElMessageBox.confirm("确认删除么？","提示",{
    type:"warning"
  }).then(async ()=>{
    const res = await deletePlaylistCateApi({id:item.id});
    ElMessage.success("删除成功")
    search();
  })
}
const createPlaylistCateRef=ref();
const handleCreate=()=>{
  createPlaylistCateRef.value && createPlaylistCateRef.value.showDrawer();
}
</script>

<template>
  <div class="table-box">
    <ProTable :columns="columns" ref="tableRef" :request-api="getPlaylistCateApi" :request-auto="true" :pagination="false">
      <template #toolButton>
        <el-button type="primary" @click="handleCreate">新增分类</el-button>
      </template>
    </ProTable>
    <CreatePlaylistCate ref="createPlaylistCateRef" @success="search"/>
  </div>
</template>

<style scoped lang="scss">

</style>

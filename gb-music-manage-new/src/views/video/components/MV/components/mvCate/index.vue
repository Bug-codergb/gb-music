<script setup lang="jsx">
import {ref,reactive} from "vue"
import {ElMessage,ElMessageBox} from "element-plus";
import ProTable from "@/components/ProTable/index.vue"
import CreateMVCate from "../createMVCate/index.vue"
import {deleteVideoCateApi, getMVListApi} from "@/api/modules/video"

const tableRef = ref();
const columns = reactive([
  {
    label:"分类名称",
    prop:"name",
    isShow:true
  },
  {
    label:"操作",
    prop:"action",
    isShow:true,
    render:(scope)=>{
      return <el-link type="danger" onClick={()=>handleDelete(scope.row)}>删除</el-link>
    }
  }
])
const search=()=>{
  tableRef.value && tableRef.value.search();
}
const handleDelete=(item)=>{
  ElMessageBox.confirm("确认删除么?","提示",{
    type:"warning"
  }).then(async ()=>{
    const res = await deleteVideoCateApi({id:item.id});
    search();
    ElMessage.success("删除成功")
  })
}
const createMVCateRef = ref();
const handleCreate=()=>{
  createMVCateRef.value && createMVCateRef.value.showDrawer();
}
const searchParams = reactive({
  type:1
})
</script>

<template>
  <div class="table-box">
    <ProTable :init-param="searchParams" ref="tableRef" :columns="columns" :request-api="getMVListApi" :request-auto="true" :pagination="false">
      <template #tableHeader>
        <div style="font-size:14px;color:#919398">
          注意，删除分类会关联删除分类下MV
        </div>
      </template>
      <template #toolButton>
        <el-button type="primary" @click="handleCreate">新增分类</el-button>
      </template>
    </ProTable>
    <CreateMVCate ref="createMVCateRef" @success="search"/>
  </div>
</template>

<style scoped lang="scss">

</style>

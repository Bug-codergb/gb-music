<script setup lang="jsx">
import {ref,reactive} from "vue"
import {ElMessage,ElMessageBox} from "element-plus";
import ProTable from "@/components/ProTable/index.vue"
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
</script>

<template>
  <div class="table-box">
    <ProTable ref="tableRef" :columns="columns" :request-api="getMVListApi" :request-auto="true" :pagination="false"/>
  </div>
</template>

<style scoped lang="scss">

</style>

<script setup lang="jsx">
import {reactive,ref } from "vue";
import moment from "moment";
import { ElMessageBox,ElMessage } from "element-plus"
import { getAllComboApi ,deleteComboApi} from "@/api/modules/combo"
import ProTable from "@/components/ProTable/index"
import CreateCombo from "./components/createCombo.vue"
const columns = reactive([
  {
    label:"套餐名称",
    prop:"name",
    isShow:true
  },
  {
    label:"套餐价格",
    prop:"price",
    isShow:true
  },
  {
    label:"创建时间",
    prop:"createTime",
    isShow:true,
    render:(scope)=>{
      return moment(scope.row.createTime).format("yyyy-MM-DD HH:mm")
    }
  },
  {
    label:"操作",
    prop:"action",
    isShow:true,
    render:(scope)=>{
      return <el-space>
        <el-link type="primary">编辑</el-link>
        <el-link type="danger" onClick={()=>handleDelete(scope.row)}>删除</el-link>
      </el-space>
    }
  }
])
const createComboRef = ref();
const handleCreate=()=>{
  createComboRef.value && createComboRef.value.showDrawer()
}
const tableRef = ref();
const search=()=>{
  tableRef.value && tableRef.value.search();
}
const handleDelete=async (item)=>{
  ElMessageBox.confirm("确认删除吗","提示",{
    type:"warning"
  }).then(async ()=>{
    const res = await deleteComboApi({id:item.id});
    ElMessage.success("删除成功");
    search();
  })
}
</script>

<template>
  <div class="table-box">
    <ProTable :columns="columns" ref="tableRef" :request-api="getAllComboApi" :request-auto="true">
      <template #toolButton>
        <el-button type="primary" @click="handleCreate">新增</el-button>
      </template>
    </ProTable>
    <CreateCombo ref="createComboRef" @success="search"/>
  </div>
</template>

<style scoped lang="scss">

</style>

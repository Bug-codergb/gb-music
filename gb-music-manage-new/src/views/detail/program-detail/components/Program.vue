<script setup lang="jsx">
import {reactive} from "vue"
import moment from "moment"
import { formatTime } from "@/utils/time"
import ProTable from "@/components/ProTable/index.vue"
import { ElMessage,ElMessageBox } from "element-plus"
import {deleteProgram} from "@/api/modules/channel"
const emit = defineEmits(['success']);
const props = defineProps({
  program:{
    type:Array,
    default(){
      return []
    }
  }
})
const columns = reactive([
  {
    label:"名称",
    prop:"name",
    isShow:true
  },
  {
    label:"创建时间",
    prop:"name",
    isShow:true,
    render:(scope)=>{
      return moment(scope.row.createTime).format("yyyy-MM-DD")
    }
  },
  {
    label:"时长",
    prop:"dt",
    isShow:true,
    render:(scope)=>{
      return formatTime(Number(scope.row.dt||0),"mm:ss")
    }
  },
  {
    label:"播放量",
    prop:"playCount",
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
const handleDelete=(item)=>{
  ElMessageBox.confirm("确认删除么?","提示",{
    type:"warning"
  }).then(async ()=>{
    await deleteProgram(item.id);
    emit("success");
  }).catch(()=>{

  })
}
</script>

<template>
  <div class="table-box">
    <ProTable :columns="columns" :data="program" :pagination="false" :request-auto="false"/>
  </div>
</template>

<style scoped lang="scss">

</style>

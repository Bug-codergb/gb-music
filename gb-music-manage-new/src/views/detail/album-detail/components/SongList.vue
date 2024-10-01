<script setup lang="jsx">
import { reactive,ref } from "vue";
import { ElMessage,ElMessageBox } from "element-plus"
import { formatTime } from "@/utils/time"
import ProTable from "@/components/ProTable/index.vue";
import {deleteAlbumSongApi} from "@/api/modules/album"

const emit = defineEmits(['success']);
const props = defineProps({
  songs:{
    type:Array,
    default(){
      return []
    }
  },
  album:{
    type:Object,
    default(){
      return {}
    }
  }
})
const columns = reactive([
  {
    label:"歌曲名称",
    prop:"name",
    isShow:true
  },
  {
    label:"简介",
    prop:"alia",
    isShow:true
  },
  {
    label:"时长",
    prop:"dt",
    isShow:true,
    render:(scope)=>{
      return formatTime(scope.row.dt,"mm:ss")
    }
  },
  {
    label:"是否为vip歌曲",
    prop:"vip",
    isShow: true,
    render:(scope)=>{
      const isVip = scope.row.vip === 1;
      return <el-tag type={ isVip ? 'success' :'primary'}>{isVip ? '是':'否'}</el-tag>
    }
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
  ElMessageBox.confirm("确认删除吗?","提示",{
    type:"warning"
  }).then(async ()=>{
    const res = await deleteAlbumSongApi({
      alId:props.album.id,
      songId:item.id
    })
    ElMessage.success("删除成功");
    emit("success")
  }).catch(()=>{

  })
}
</script>

<template>
  <div class="table-box">
    <ProTable :columns="columns" :request-auto="false" :pagination="false" :data="songs"/>
  </div>
</template>

<style scoped lang="scss">

</style>

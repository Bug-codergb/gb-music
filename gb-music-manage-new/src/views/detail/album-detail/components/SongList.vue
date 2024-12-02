<script setup lang="jsx">
import { reactive,ref } from "vue";
import { useRouter } from "vue-router";
import { ElMessage,ElMessageBox } from "element-plus"
import { formatTime } from "@/utils/time"
import ProTable from "@/components/ProTable/index.vue";
import CreateMv from "@/views/playlist/song/components/createMV.vue"
import {deleteAlbumSongApi} from "@/api/modules/album"

const emit = defineEmits(['success']);
const router = useRouter()
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
    isShow:true,
    width: 260,
    render:(scope)=>{
      return <el-space>
        <el-link type="primary">{scope.row.name}</el-link>
        {scope.row.video && scope.row.video.id && <div className="g-mv-container" onClick={()=>handleRouterVideo(scope.row)}>MV</div>}
      </el-space>
    }
  },
  {
    label:"简介",
    prop:"alia",
    isShow:true,
    render:(scope)=>{
      return <el-tooltip placement="top" content={scope.row.alia} show-after={500}>
        <span class="mle">{scope.row.alia}</span>
      </el-tooltip>
    }
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
    width:150,
    render:(scope)=>{
      return <el-space size="large">
        <el-link type="primary" disabled={scope.row.video} onClick={()=>handleUploadMV(scope.row)}>上传MV</el-link>
        <el-link type="danger" onClick={() => handleDelete(scope.row)}>删除</el-link>
      </el-space>
    }
  }
])

const handleRouterVideo = (item) => {
  router.push({
    path:"/video/"+item.video.id,
  })
}

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
const createMVRef = ref();
const handleUploadMV=(item)=>{
  createMVRef.value && createMVRef.value.showDrawer({
    id:item.id,
    name:item.name,
    album:{
      description:props.album?.description
    }
  })
}
const search=()=>{
  emit("success")
}
</script>

<template>
  <div class="table-box">
    <ProTable :columns="columns" :request-auto="false" :pagination="false" :data="songs"/>
    <CreateMv ref="createMVRef" @success="search"/>
  </div>
</template>

<style lang="scss">
.g-mv-container{
  border: 2px solid #ec4141!important;
  color:#ec4141;
  line-height:12px;
  font-size: 12px;
  padding: 2px 5px;
  border-radius: 4px;
  font-weight: bolder;
  margin: 0 0 0 4px;
  transform: scale(0.85);
  cursor:pointer;
}
</style>

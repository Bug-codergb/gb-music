<script setup lang="jsx">
import { reactive,ref } from "vue"
import {ElMessageBox,ElMessage} from "element-plus"
import ProTable from "@/components/ProTable/index.vue"
import CreateBanner from "./components/CreateBanner.vue"
import {getBannerListApi,deleteBannerApi} from "@/api/modules/banner"
const columns = reactive([
  {
    label:"封面",
    prop:"picUrl",
    isShow:true,
    render:(scope)=>{
      return <el-image src={scope.row.picUrl} style={{width:"150px"}} preview-teleported={true} preview-src-list={[scope.row.picUrl]}/>
    }
  },
  {
    label:"名称",
    prop:"name",
    isShow:true,
    render:(scope)=>{
      return <div>
        {
          scope.row.album && scope.row.album.name
        }
        {
          scope.row.video && scope.row.video.name
        }
        {
          scope.row.song && scope.row.song.name
        }
      </div>
    }
  },
  {
    label:"类型",
    prop:"id",
    isShow:true,
    render:(scope)=>{
      return <el-tag>
        {
          scope.row.album && scope.row.album.name&&"专辑"
        }
        {
          scope.row.video && scope.row.video.name&&"视频"
        }
        {
          scope.row.song && scope.row.song.name&&"歌曲"
        }
      </el-tag>
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
const createBanner = ref();
const handleCreateBanner=()=>{
  createBanner.value && createBanner.value.showDrawer()
}
const tableRef = ref();
const search=()=>{
  tableRef.value && tableRef.value.search();
}
const handleDelete=async (item)=>{
  try{
    ElMessageBox.confirm("确认删除么?","提示",{
      type:"warning"
    }).then(async()=>{
      const res = await deleteBannerApi({id:item.id});
      ElMessage.success("删除成功");
      search();
    }).catch(()=>{

    })
  }catch (e) {

  }
}
</script>

<template>
  <div class="table-box">
    <ProTable :request-api="getBannerListApi" ref="tableRef" :columns="columns">
      <template #toolButton>
        <el-button type="primary" @click="handleCreateBanner">添加banner</el-button>
      </template>
    </ProTable>
    <CreateBanner ref="createBanner" @success="search"/>
  </div>
</template>

<style scoped lang="scss">

</style>

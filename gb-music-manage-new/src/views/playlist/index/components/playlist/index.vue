<template>
  <div class="table-box">
    <ProTable :columns="columns" ref="tableRef"
              data-alias="playlists"
              :init-param="searchParams"
              :request-api="getAllPlaylistApi"
              :request-auto="true"
              :pagination="true">
      <template #tableHeader>
        <el-form inline>
          <el-form-item>
            <el-input clearable v-model="searchParams.keyword" placeholder="请输入歌单名称" @input="handleSearch"/>
          </el-form-item>
        </el-form>
      </template>
      <template #toolButton>
        <el-button type="primary" @click="handleCreate">添加歌单</el-button>
      </template>
    </ProTable>
    <SetPlaylistCate ref="setPlaylistCateRef" @success="handleSearch"/>
    <CreatePlaylist ref="createPlaylistRef" @success="handleSearch"/>
  </div>
</template>
<script setup lang="jsx">
import moment from "moment";
import debounce from "lodash/debounce"
import {getAllPlaylistApi} from "@/api/modules/playlist"
import ProTable from "@/components/ProTable/index.vue"
import SetPlaylistCate from "../setPlaylistCate/index.vue"
import { reactive,ref } from "vue";
import { ElMessage,ElMessageBox } from "element-plus"
import {deletePlaylistApi} from "@/api/modules/playlist"
import CreatePlaylist from "../createPlaylist/index.vue"
const columns = reactive([
  {
    label:"封面",
    prop:"coverUrl",
    isShow:true,
    render:(scope)=>{
      return <el-image src={scope.row.coverUrl} style={{width:"90px"}}/>
    }
  },
  {
    label:"名称",
    prop:"name",
    isShow:true
  },
  {
    label:"简介",
    prop:"description",
    isShow:true,
    render:(scope)=>{
      return <el-tooltip show-after={500} placement={'top'} content={scope.row.description}>
        <span class="mle">{scope.row.description}</span>
      </el-tooltip>
    }
  },
  {
    label:"分类",
    prop:"category",
    isShow:true,
    width:180,
    render:(scope)=>{
      return scope.row.category ? <el-space wrap={true}>
        {
          scope.row.category.map((item)=><el-tag>{item.name}</el-tag>)
        }
      </el-space> :'--'
    },
  },
  {
    label:"创建者",
    prop:"user.userName",
    isShow:true,
    width: 120
  },
  {
    label:"创建时间",
    prop:"createTime",
    isShow:true,
    render:(scope)=>{
      return moment(scope.createTime).format("yyyy-MM-DD HH:mm")
    }
  },
  {
    label:"操作",
    prop:"action",
    isShow:true,
    render:(scope)=>{
      return <el-space size="large">
        <el-link type="success" onClick={()=>handleSetPlaylistCate(scope.row)}>分类</el-link>
        <el-link type="primary" onClick={()=>handleEdit(scope.row)}>编辑</el-link>
        <el-link type="danger" onClick={()=>handleDelete(scope.row)}>删除</el-link>
      </el-space>
    }
  }
])
const searchParams = reactive({
  keyword:""
})
const tableRef = ref();

const handleSearch=debounce(()=>{
  tableRef.value && tableRef.value.search();
},500)

const setPlaylistCateRef = ref();
const handleSetPlaylistCate=(item)=>{
  setPlaylistCateRef.value && setPlaylistCateRef.value.showDrawer(item);
}
const handleDelete=(item)=>{
  ElMessageBox.confirm("确认删除歌单么?","提示",{
    type:"warning"
  }).then(async ()=>{
    const res = await deletePlaylistApi({id:item.id});
    await handleSearch();
    ElMessage.success("删除成功");
  }).catch(()=>{})
}
const createPlaylistRef=ref();
const handleCreate=()=>{
  createPlaylistRef.value && createPlaylistRef.value.showDrawer()
}
const handleEdit=(item)=>{
  createPlaylistRef.value && createPlaylistRef.value.showDrawer(item)
}
</script>

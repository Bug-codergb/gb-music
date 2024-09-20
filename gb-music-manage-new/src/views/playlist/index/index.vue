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
    </ProTable>
    <SetPlaylistCate ref="setPlaylistCateRef" @success="handleSearch"/>
  </div>
</template>
<script setup lang="jsx">
import moment from "moment";
import debounce from "lodash/debounce"
import {getAllPlaylistApi} from "@/api/modules/playlist"
import ProTable from "@/components/ProTable/index.vue"
import SetPlaylistCate from "./components/setPlaylistCate/index.vue"
import { reactive,ref } from "vue";
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
    isShow:true
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
        <el-link type="primary">编辑</el-link>
        <el-link type="danger">删除</el-link>
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
</script>

<template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      :requestApi="getSongListApi"
      :requestAuto="true"
      dataAlias="songs"
      :initParam="searchParams"
      :pagination="true"
      ref="tableRef"
    >
      <template #tableHeader>
        <el-form>
          <el-form-item>
            <el-input
              clearable
              v-model="searchParams.keyword"
              placeholder="请输入歌曲名称"
              @input="handleSearch"
            />
          </el-form-item>
        </el-form>
      </template>
      <template #toolButton>
        <el-button type="primary" @click="handleCreate">添加歌曲</el-button>
      </template>
    </ProTable>
    <CreateSong ref="createSongRef" @success="search"/>
    <CreateMV ref="createMVRef"/>
    <PlayContainer ref="playContainerRef" />
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import moment from "moment";
import { ElMessage,ElMessageBox } from "element-plus";
import debounce from "lodash/debounce"
import { getSongListApi,updateSongVipApi } from "@/api/modules/song.js";
import ProTable from "@/components/ProTable/index";
import CreateSong from "./components/createSong.vue"
import CreateMV from "./components/createMV.vue";
import PlayContainer from "@/components/PlayContainer/index.vue"
import { deleteSongApi } from "@/api/modules/song"
const columns = reactive([
  {
    label: "歌曲名称",
    prop: "name",
    isShow: true,
    render:(scope)=>{
      return <el-link type="primary" onClick={()=>handlePlay(scope.row)}>{scope.row.name}</el-link>
    }
  },
  {
    label: "专辑",
    prop: "album.name",
    isShow: true
  },
  {
    label: "歌手",
    prop: "artist.name",
    isShow: true
  },
  {
    label:"是否为vip",
    prop:"vip",
    isShow:true,
    render:(scope)=>{
      return <el-select v-model={scope.row.vip} style={{width:"120px"}} onChange={()=>handleVIPChange(scope.row)}>
        <el-option label="非会员" value={0}></el-option>
        <el-option label="会员" value={1}></el-option>
      </el-select>
    }
  },
  {
    label:"发布时间",
    prop:"publishTime",
    isShow:true,
    render:(scope)=>{
      return moment(scope.row.publishTime).format("yyyy-MM-DD")
    }
  },
  {
    label: "操作",
    prop: "action",
    isShow: true,
    width:250,
    fixed:'right',
    render: scope => {
      return (
        <el-space size="large">
          <el-link type="primary" onClick={()=>handleCreateMV(scope.row)}>添加mv</el-link>
          <el-link type="success">上传歌词</el-link>
          <el-link type="warning" onClick={()=>handleEdit(scope.row)}>编辑</el-link>
          <el-link type="danger" onClick={()=>handleDelete(scope.row)}>删除</el-link>
        </el-space>
      );
    }
  }
]);
const searchParams = reactive({
  keyword: ""
});
const createSongRef = ref()
const handleCreate=()=>{
  createSongRef.value && createSongRef.value.showDrawer();
}
const handleEdit=(item)=>{
  createSongRef.value && createSongRef.value.showDrawer(item);
}

const playContainerRef = ref();
const handlePlay=(row)=>{
  playContainerRef.value && playContainerRef.value.showDialog(row.id);
}
const tableRef = ref()
const search=()=>{
  tableRef.value && tableRef.value.search();
}
const handleSearch=debounce(()=>{
  search();
},500)

const createMVRef = ref();
const handleCreateMV=(item)=>{
  createMVRef.value && createMVRef.value.showDrawer(item);
}
const handleVIPChange=async (item)=>{
  await updateSongVipApi({
    id:item.id,
    vip:item.vip
  })
  ElMessage.success("vip更新成功");
  handleSearch();
}
const handleDelete=(row)=>{
  ElMessageBox.confirm("确认删除吗?",'提示',{
    type:"warning"
  }).then(async ()=>{
    const res = await deleteSongApi({id:row.id});
    await handleSearch();
    ElMessage.success("添加成功");
  })
}
</script>

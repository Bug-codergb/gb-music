<script setup lang="tsx">
import { ref,reactive } from "vue";
import { useRouter } from "vue-router";
import debounce from "lodash/debounce"
import moment from "moment";
import { formatTime } from "@/utils/time"
import {getVideoCateApi, getVideoListApi,deleteVideoApi} from "@/api/modules/video"
import ProTable from "@/components/ProTable/index.vue"
import CreateMV from "@/views/playlist/song/components/createMV"
import {ElMessageBox,ElMessage} from "element-plus";

const router = useRouter();
const columns = reactive( [
  {
    label:"视频ID",
    prop:"id",
    isShow: true,
    width:130
  },
  {
    label:"封面",
    prop:"coverUrl",
    isShow:true,
    render:(scope)=>{
      return <el-image src={scope.row.coverUrl} preview-src-list={[scope.row.coverUrl]} preview-teleported={true}/>
    }
  },
  {
    label:"名称",
    prop:"name",
    isShow:true,
    'min-width':100,
    render:(scope)=>{
      return <el-tooltip content={scope.row.name} show-after={500} placement="top">
        <el-link type="primary" onClick={()=>handleVideo(scope.row)}>
          <span class="mle">
            {scope.row.name}
          </span>
        </el-link>
      </el-tooltip>
    }
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
    label:"时长",
    prop:"dt",
    isShow:true,
    render:(scope)=>{
      return formatTime(scope.row.dt,"mm:ss")
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
      return <el-space size="large">
        <el-link type="primary" onClick={()=>handleVideo(scope.row)}>查看</el-link>
        <el-link type="primary" onClick={()=>handleEdit(scope.row)}>编辑</el-link>
        <el-link type="danger" onClick={()=>handleDelete(scope.row)}>删除</el-link>
      </el-space>
    }
  },
])
const searchParams = reactive({
  keyword: "",
  cateId: "",
  type: 1
});
const tableRef = ref()
const cateList = ref([]);
getVideoCateApi({ type: 1 }).then(res => {
  cateList.value = res.map(item => {
    return {
      label: item.name,
      value: item.id
    };
  });
  searchParams.cateId = res[0].id;
  tableRef.value && tableRef.value.search();
});

const createMVRef = ref();
const handleEdit=(item)=>{
  let data={
    ...item,
    isUpdate:true
  }
  createMVRef.value && createMVRef.value.showDrawer(data);
}
const search=()=>{
  tableRef.value && tableRef.value.search();
}
const handleSearch=debounce(()=>{
  search();
},500)

const handleVideo=(item)=>{
  router.push(`/video/${item.id}`);
}
const handleDelete=async (item)=>{
  ElMessageBox.confirm("确认删除吗?","提示",{
    type:"warning"
  }).then(async ()=>{
    const res = await deleteVideoApi({id:item.id});
    ElMessage.success("删除成功");
    search();
  }).catch(()=>{})
}
</script>

<template>
  <div class="table-box">
    <ProTable ref="tableRef" data-alias="videos" :init-param="searchParams" :columns="columns" :request-auto="false" :pagination="true" :request-api="getVideoListApi">
      <template #tableHeader>
        <el-form inline>
          <el-form-item>
            <el-input clearable v-model="searchParams.keyword" placeholder="请输入mv名称" @input="handleSearch"/>
          </el-form-item>
          <el-form-item>
            <el-select style="width:160px" v-model="searchParams.cateId" @change="search">
              <el-option v-for="item in cateList" :label="item.label" :key="item.value" :value="item.value"></el-option>
            </el-select>
          </el-form-item>
        </el-form>

      </template>
    </ProTable>
    <CreateMV ref="createMVRef" @success="search"/>
  </div>
</template>

<style scoped lang="scss">

</style>

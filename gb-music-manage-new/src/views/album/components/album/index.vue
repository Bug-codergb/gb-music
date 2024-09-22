<template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      :requestAuto="false"
      ref="tableRef"
      :requestApi="getAlbumListApi"
      :initParam="searchParams"
      dataAlias="album"
      :pagination="true"
      :isSingleSelect="isSongPage"
    >
      <template #tableHeader>
        <el-form inline>
          <el-form-item label="分类">
            <el-select
              v-model="searchParams.id"
              style="width: 200px"
              @change="search"
            >
              <el-option
                v-for="item in typeList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="专辑名称">
            <el-input
              v-model="searchParams.keyword"
              clearable
              placeholder="请输入专辑名称"
              @input="handleSearch"
            />
          </el-form-item>
        </el-form>
      </template>
      <template #toolButton v-if="!isSongPage">
        <el-button type="primary" @click="handleCreate"
          >新增</el-button
        >
      </template>
    </ProTable>
    <CreateAlbum ref="createAlbumRef" @success="search" />
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import { useRouter } from "vue-router"
import { ElMessageBox, ElMessage } from "element-plus";
import debounce from "lodash/debounce";
import moment from "moment";
import {
  getAlbumListApi,
  getAlbumTypeListApi,
  deleteAlbumApi
} from "@/api/modules/album.js";
import ProTable from "@/components/ProTable/index.vue";
import CreateAlbum from "../createAlbum";

const router = useRouter();
const props = defineProps({
  isSongPage:{
    type:Boolean,
    default:false
  }
})

const searchParams = reactive({
  id: "",
  keyword: ""
});
const columns = reactive([
  {
    type:"selection",
    isShow: props.isSongPage
  },
  {
    label: "封面",
    prop: "cover",
    isShow: true,
    render: scope => {
      return (
        <el-image
          src={scope.row.coverUrl}
          style={{ width: "80px" }}
          fit="cover"
        />
      );
    }
  },
  {
    label: "名称",
    prop: "name",
    isShow: true
  },
  {
    label: "歌手",
    prop: "artist.name",
    isShow: true
  },
  {
    label: "歌曲数",
    prop: "count",
    isShow: true
  },
  {
    label: "发布时间",
    prop: "publishTime",
    isShow: true,
    render: scope => {
      return scope.row.publishTime
        ? moment(scope.row.publishTime).format("yyyy-MM-DD")
        : "--";
    }
  },
  {
    label: "操作",
    prop: "action",
    isShow: true,
    render: scope => {
      return (
        <el-space size="large">
          <el-link type="primary" onClick={()=>handleCheck(scope.row)}>查看</el-link>
          <el-link type="primary">编辑</el-link>
          <el-link
            type="danger"
            onClick={() => handleDeleteAlbum(scope.row)}
          >
            删除
          </el-link>
        </el-space>
      );
    }
  }
]);

const tableRef = ref();
const typeList = ref([]);
getAlbumTypeListApi().then(res => {
  typeList.value = res;
  if (res.length !== 0) {
    searchParams.id = res[0].id;
    tableRef.value && tableRef.value.search();
  }
});

const search = () => {
  tableRef.value && tableRef.value.search();
};

const handleSearch = debounce(() => {
  search();
}, 500);

const createAlbumRef = ref();
const handleCreate = () => {
  createAlbumRef.value && createAlbumRef.value.showDrawer();
};

const handleDeleteAlbum = item => {
  ElMessageBox.confirm("确认删除该专辑么?", "提示", {
    type: "warning"
  }).then(async () => {
    const res = await deleteAlbumApi({ id: item.id });
    ElMessage.success("删除成功");
    handleSearch();
  });
};
const handleCheck=(item)=>{
  router.push({
    path:`/album/${item.id}`
  })
}
defineExpose({
  tableRef:tableRef
})
</script>

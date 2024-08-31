<template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      :requestAuto="false"
      ref="tableRef"
      :requestApi="getAlbumList"
      :initParam="searchParams"
      dataAlias="album"
      :pagination="true"
    >
      <template #tableHeader>
        <el-form inline>
          <el-form-item label="分类">
            <el-select v-model="searchParams.id" style="width: 200px" @change="search">
              <el-option v-for="item in typeList" :key="item.id" :label="item.name" :value="item.id"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="专辑名称">
            <el-input v-model="searchParams.keyword" clearable placeholder="请输入专辑名称" @input="handleSearch" />
          </el-form-item>
        </el-form>
      </template>
      <template #toolButton>
        <el-button type="primary" @click="handleCreate">新增</el-button>
      </template>
    </ProTable>
    <CreateAlbum ref="createAlbumRef" />
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import debounce from "lodash/debounce";
import moment from "moment";
import { getAlbumList, getAlbumTypeList } from "@/api/modules/album.js";
import ProTable from "@/components/ProTable/index.vue";
import CreateAlbum from "../createAlbum";
const searchParams = reactive({
  id: "",
  keyword: ""
});
const columns = reactive([
  {
    label: "封面",
    prop: "cover",
    isShow: true,
    render: scope => {
      return <el-image src={scope.row.coverUrl} style={{ width: "80px" }} fit="cover" />;
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
      return scope.row.publishTime ? moment(Number(scope.row.publishTime)).format("yyyy-MM-DD") : "--";
    }
  }
]);

const tableRef = ref();
const typeList = ref([]);
getAlbumTypeList().then(res => {
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
</script>

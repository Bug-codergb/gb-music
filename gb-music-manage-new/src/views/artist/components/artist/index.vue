<template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      ref="tableRef"
      :pagination="true"
      :requestApi="getArtistListApi"
      :initParam="searchParams"
      dataAlias="artists"
    >
      <template #tableHeader>
        <el-form inline>
          <el-form-item>
            <el-input v-model="searchParams.keyword" clearable placeholder="请输入歌手名称" @input="handleSearch" />
          </el-form-item>
        </el-form>
      </template>
      <template #toolButton>
        <el-button type="primary" @click="handleCreate">添加歌手</el-button>
      </template>
    </ProTable>
    <CreateArtist ref="createArtistRef" @success="search" />
  </div>
</template>
<script setup lang="jsx">
import { reactive, ref } from "vue";
import { ElMessageBox, ElMessage } from "element-plus";
import debounce from "lodash/debounce";
import CreateArtist from "./components/createArtist.vue";
import ProTable from "@/components/ProTable/index.vue";
import { useRouter } from "vue-router";
import { getArtistListApi, getArtistLangApi,
  getArtistTypeApi, deleteArtistApi,setArtistLangApi,setArtistTypeApi } from "@/api/modules/artist.js";
const langList = ref([]);
const typeList = ref([]);
const router = useRouter();
getArtistLangApi().then(res => {
  langList.value = res.filter(item=>item.name!=='全部');
});
getArtistTypeApi().then(res => {
  typeList.value = res.filter((item)=>item.name!=='全部');
});
const columns = reactive([
  {
    label: "名称",
    prop: "name",
    isShow: true
  },
  {
    label: "头像",
    prop: "avatar",
    isShow: true,
    width: 130,
    render: scope => {
      return <el-avatar shape="square" src={scope.row.avatarUrl} size={70} fit={"cover"} />;
    }
  },
  {
    label: "语种",
    prop: "name",
    isShow: true,
    width: 200,
    render: scope => {
      return (
        <el-select v-model={scope.row.area} onChange={()=>handleArtistLangChange(scope.row)}>
          {langList.value.length !== 0 &&
            langList.value.map(item => {
              return <el-option label={item.name} value={item.id} key={item.id}></el-option>;
            })}
        </el-select>
      );
    }
  },
  {
    label: "类型",
    prop: "avatar",
    isShow: true,
    width: 200,
    render: scope => {
      return (
        <el-select v-model={scope.row.type} onChange={()=>handleArtistTypeChange(scope.row)}>
          {typeList.value.length !== 0 &&
            typeList.value.map(item => {
              return <el-option label={item.name} value={item.id} key={item.id}></el-option>;
            })}
        </el-select>
      );
    }
  },
  {
    label: "专辑数",
    prop: "album",
    isShow: true
  },
  {
    label: "歌曲数",
    prop: "song",
    isShow: true
  },
  {
    label: "操作",
    prop: "action",
    isShow: true,
    fixed: "right",
    render: scope => {
      return (
        <el-space size="large">
          <el-link type="primary" onClick={()=>handleCheck(scope.row)}>查看</el-link>
          <el-link type="primary" onClick={()=>handleEdit(scope.row)}>编辑</el-link>
          <el-link type="danger" onClick={() => handleDelete(scope.row)}>
            删除
          </el-link>
        </el-space>
      );
    }
  }
]);

const searchParams = reactive({
  keyword: "",
  letter: "全部",
  area: "0"
});

const createArtistRef = ref();
const handleCreate = () => {
  createArtistRef.value && createArtistRef.value.showDrawer();
};

const tableRef = ref();

const search = () => {
  tableRef.value && tableRef.value.search();
};

const handleSearch = debounce(() => {
  search();
}, 500);

const handleDelete = item => {
  ElMessageBox.confirm("确认删除么?", "提示", {
    type: "warning"
  })
    .then(async () => {
      const res = await deleteArtistApi({ id: item.id });
      ElMessage.success("删除成功");
      search();
    })
    .catch(e => {});
};
const handleEdit=(item)=>{
  createArtistRef.value && createArtistRef.value.showDrawer(item);
}
const handleCheck=(item)=>{
  router.push({
    path:`/artist/${item.id}`
  })
}
const handleArtistLangChange=async (item)=>{
  const res = await setArtistLangApi({
    arId:item.id,
    cateId:item.area
  })
  ElMessage.success("歌手语种更新成功");
  tableRef.value && tableRef.value.getTableList();
}
const handleArtistTypeChange=async (item)=>{
  const res = await setArtistTypeApi({
    arId:item.id,
    type:item.type
  })
  ElMessage.success("歌手分类更新成功");
  tableRef.value && tableRef.value.getTableList();
}
</script>

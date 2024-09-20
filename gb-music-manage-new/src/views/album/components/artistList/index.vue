<template>
  <div>
    <ProDrawer
      v-model="isShow"
      width="60%"
      title="选择歌手"
      @confirm="handleConfirm"
    >
      <ProTable
        ref="tableRef"
        :columns="columns"
        :requestAuto="false"
        :requestApi="getArtistListApi"
        :pagination="true"
        dataAlias="artists"
        :initParam="searchParams"
        :isSingleSelect="true"
      />
    </ProDrawer>
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive, nextTick } from "vue";
import ProDrawer from "@/components/ProDrawer/index";
import ProTable from "@/components/ProTable/index";
import {
  getArtistListApi,
  getArtistLangApi,
  getArtistTypeApi
} from "@/api/modules/artist.js";

const emit = defineEmits(["confirm"]);

const typeList = ref([]);
const langList = ref([]);
getArtistLangApi().then(res => {
  langList.value = res;
});
getArtistTypeApi().then(res => {
  typeList.value = res;
});
const searchParams = reactive({
  keyword: "",
  letter: "全部",
  area: "0"
});
const columns = reactive([
  {
    isShow:true,
    type: "selection",
    width:80
  },
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
      return (
        <el-avatar
          shape="square"
          src={scope.row.avatarUrl}
          size={70}
          fit={"cover"}
        />
      );
    }
  },
  {
    label: "语种",
    prop: "name",
    isShow: true,
    width: 200,
    render: scope => {
      return (
        <el-select v-model={scope.row.area} disabled={true}>
          {langList.value.length !== 0 &&
            langList.value.map(item => {
              return (
                <el-option
                  label={item.name}
                  value={item.id}
                  key={item.id}
                ></el-option>
              );
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
        <el-select v-model={scope.row.type} disabled={true}>
          {typeList.value.length !== 0 &&
            typeList.value.map(item => {
              return (
                <el-option
                  label={item.name}
                  value={item.id}
                  key={item.id}
                ></el-option>
              );
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
  }
]);
const isShow = ref(false);
const tableRef = ref();
const showDrawer = () => {
  isShow.value = true;
  nextTick(() => {
    tableRef.value && tableRef.value.search();
  });
};
const getSelectionRows = () => {
  return tableRef.value && tableRef.value.getSelectionRows();
};

const handleConfirm = () => {
  const row = getSelectionRows();
  emit("confirm", row);
  isShow.value = false;
};
defineExpose({
  showDrawer,
  getSelectionRows
});
</script>

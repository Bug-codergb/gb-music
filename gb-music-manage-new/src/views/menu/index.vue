<template>
  <div class="table-box">
    <ProTable :columns="columns"
              :border="true"
              :requestApi="getMenuListApi"
              :pagination="false"
              :initParam="{}"
              rowKey="path"
              :default-expand-all="true"
              ref="tableRef">
      <template #icon="scope">

        <el-icon v-if="scope.row.meta && scope.row.meta.icon">
          <component :is="scope.row.meta.icon" />
        </el-icon>
      </template>
    </ProTable>
  </div>
</template>
<script setup lang="jsx">
import { ref, nextTick } from "vue";
import ProTable from "@/components/ProTable/index.vue";
import { getMenuListApi } from "@/api/modules/menu.js";
import { useGlobalStore } from "@/stores/modules/global";

const icon = ref("");
const tableRef = ref();
nextTick(() => {
  tableRef.value && tableRef.value.search();
});
const globalStore = useGlobalStore();
const { iconList } = globalStore;
const columns = ref([
  {
    label: "路由名称",
    prop: "title",
    isShow: true,
    render:(scope)=>{
      return scope.row.meta ? scope.row.meta.title : scope.row.title;
    }
  },
  {
    label: "图标",
    prop: "icon",
    isShow: true,
  },
  {
    label: "页面url",
    prop: "path",
    isShow: true
  },
  {
    label: "组件路径",
    prop: "component",
    isShow: true
  },

]);
getMenuListApi().then(res=>{
  console.log(res);
})
</script>

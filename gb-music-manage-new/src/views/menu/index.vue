<template>
  <div class="table-box">
    <ProTable :columns="columns" :border="true" :requestApi="getMenuListApi" :pagination="false" :initParam="{}" ref="tableRef">
      <template #tableHeader>
        <el-form inline>
          <el-form-item label="图标">
            <div>
              <el-select v-model="icon" placeholder="请输入">
                <el-option v-for="item in iconList" :key="item" :label="item" :value="item"></el-option>
              </el-select>
            </div>
          </el-form-item>
          <el-form-item label="图标">
            <el-input />
          </el-form-item>
          <el-form-item label="图标">
            <el-date-picker v-model="icon" type="date" placeholder="Pick a date" style="width: 100%" />
          </el-form-item>
        </el-form>
      </template>
      <template #icon="scope">
        <el-icon>
          <component :is="scope.row.icon" />
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
    label: "页面url",
    prop: "path",
    isShow: true
  },
  {
    label: "组件路径",
    prop: "component",
    isShow: true
  },
  {
    label: "路由名称",
    prop: "name",
    isShow: true
  },
  {
    label: "图标",
    prop: "icon",
    isShow: true
  }
]);
</script>

<template>
  <div class="card table-main">
    <div class="table-header">
      <div class="header-button-lf">
        <slot name="tableHeader" />
      </div>
      <div v-if="toolButton" class="header-button-ri">
        <slot name="toolButton"> </slot>
      </div>
    </div>
    <el-table
      ref="tableRef"
      :data="data ?? tableData"
      :border="border"
      @select="handleSelect"
      @select-all="handleSelect"
    >
      <slot></slot>
      <template v-for="item in tableColumns" :key="item">
        <!-- 特殊列 -->
        <el-table-column
          v-if="
            item.type &&
            ['selection', 'index', 'expand'].includes(item.type)
          "
          v-bind="item"
          :align="item.align ?? 'left'"
        >
          <template v-if="item.type === 'expand'" #default="scope">
            <component
              :is="item.render"
              v-bind="scope"
              v-if="item.render"
            ></component>
            <slot v-else :name="item.type" v-bind="scope" />
          </template>
        </el-table-column>

        <TableColumn
          v-if="!item.type && item.prop && item.isShow"
          :column="item"
        >
          <template
            v-for="slot in Object.keys($slots)"
            #[slot]="scope"
          >
            <slot :name="slot" v-bind="scope"></slot>
          </template>
        </TableColumn>
      </template>
    </el-table>
    <slot name="pagination">
      <Pagination
        v-if="pagination"
        :pageable="pageable"
        :handle-size-change="handleSizeChange"
        :handle-current-change="handleCurrentChange"
      />
    </slot>
  </div>
</template>
<script setup name="ProTable" lang="jsx">
import { defineProps, ref, onMounted, defineExpose } from "vue";
import TableColumn from "./components/TableColumn.vue";
import Pagination from "./components/Pagination.vue";
import { useTable } from "@/hooks/useTable.js";

const emit = defineEmits(["select"]);
const props = defineProps({
  columns: {
    type: Array,
    default() {
      return [];
    }
  },
  data: {
    type: Array,
    default: null
  },
  requestApi: {
    type: Function,
    default() {
      return () => {};
    }
  },
  requestAuto: {
    type: Boolean,
    default: true
  },
  dataCallback: {
    type: Function,
    default: null
  },
  pagination: {
    type: Boolean,
    default: false
  },
  initParam: {
    type: Object,
    default() {
      return {};
    }
  },
  border: {
    type: Boolean,
    default: false
  },
  toolButton: {
    type: Boolean,
    default: true
  },
  rowKey: {
    type: String,
    default: "id"
  },
  searchCol: {
    type: Number,
    default: 1
  },
  dataAlias: {
    type: String,
    default: ""
  },
  isSingleSelect: {
    type: Boolean,
    default: false
  }
});
const {
  tableData,
  pageable,
  searchParam,
  searchInitParam,
  getTableList,
  search,
  handleSizeChange,
  handleCurrentChange
} = useTable(
  props.requestApi,
  props.initParam,
  props.pagination,
  props.dataCallback,
  undefined,
  props.dataAlias
);
const tableRef = ref();
onMounted(() => {
  props.requestAuto && getTableList();
});

const tableColumns = ref(props.columns);

const handleSelect = e => {
  if (props.isSingleSelect) {
    const row = e[e.length - 1] || null;
    tableRef.value && tableRef.value.clearSelection();
    tableRef.value && tableRef.value.toggleRowSelection(row, true);
    emit("select", row);
  } else {
    emit("select", e);
  }
};
const getSelectionRows = () => {
  return tableRef.value && tableRef.value.getSelectionRows();
};
defineExpose({
  search,
  tableRef,
  getSelectionRows
});
</script>
<style lang="scss" scoped>
.header-button-ri {
  margin: 0 0 15px !important;
}
.header-button-lf {
  margin: 0 0 15px !important;
  :deep(.el-form-item) {
    margin-bottom: 0;
  }
}
</style>

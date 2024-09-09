<template>
  <!-- 分页组件 -->
  <el-pagination
    :background="true"
    :page-size="pageable.limit"
    :current-page="pageable.pageNum"
    :page-sizes="[10, 25, 50, 100]"
    :total="pageable.total"
    layout="total, sizes, prev, pager, next, jumper"
    @size-change="handleSizeChange"
    @current-change="handleCurrentChange"
  ></el-pagination>
</template>

<script setup lang="js" name="Pagination">
const props = defineProps({
  pageable: {
    type: Object,
    default: () => {
      return {
        pageNum: 1,
        pageSize: 10,
        total: 0
      };
    }
  },
  handleSizeChange: {
    type: Function,
    default: () => {}
  },
  handleCurrentChange: {
    type: Function,
    default: () => {}
  }
});
</script>

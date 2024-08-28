<template>
  <RenderTableColumn v-bind="column" />
</template>
<script setup lang="jsx" name="TableColumn">
import { useSlots } from "vue";
const slots = useSlots();
const props = defineProps({
  column: {
    type: Object,
    default() {
      return {};
    }
  }
});
const RenderTableColumn = item => {
  return (
    <>
      {item.isShow && (
        <el-table-column {...item} align={item.align ?? "center"}>
          {{
            default: scope => {
              if (item.render) return item.render(scope);
              if (slots[item.prop]) return slots[item.prop](scope);
            }
          }}
        </el-table-column>
      )}
    </>
  );
};
</script>
<style scoped></style>

<template>
  <el-drawer
    v-model="drawer"
    :size="width"
    :title="title"
    :direction="direction"
    :close-on-click-modal="false"
    :modal="true"
    :destroy-on-close="true"
  >
    <template #footer>
      <el-button @click="handleCancel">取消</el-button>
      <el-button type="primary" @click="handleConfirm"
        >确定</el-button
      >
    </template>
    <slot></slot>
  </el-drawer>
</template>
<script setup lang="jsx">
import { ref, computed } from "vue";

const emit = defineEmits(["update:modelValue", "cancel", "confirm"]);
const props = defineProps({
  modelValue: {
    type: Boolean,
    default: false
  },
  title: {
    type: String,
    default: ""
  },
  width: {
    type: String,
    default: "30%"
  }
});
const direction = ref("rtl");
const drawer = computed({
  get() {
    return props.modelValue;
  },
  set(newVal) {
    emit("update:modelValue", newVal);
  }
});
const handleCancel = () => {
  drawer.value = false;
  emit("cancel");
};
const handleConfirm = () => {
  try {
    emit("confirm");
  } catch (e) {
    console.log(e);
  }
};
</script>

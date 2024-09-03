<template>
  <ProDrawer
    title="新增分类"
    v-model="isShow"
    width="30%"
    @confirm="handleConfirm"
  >
    <ProForm
      :config="config"
      v-model="formData"
      ref="formRef"
      aspectRatio="1"
      :realWidth="140"
    ></ProForm>
  </ProDrawer>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import { ElMessage } from "element-plus";
import { addChannelTypeApi } from "@/api/modules/channel.js";
import ProDrawer from "@/components/ProDrawer/index";
import ProForm from "@/components/ProForm/index";
const emit = defineEmits(["success"]);
const config = reactive([
  [
    {
      label: "分类名称",
      tag: "input",
      placeholder: "请输入分类名称",
      prop: "name",
      required: true
    }
  ],
  [
    {
      label: "分类封面",
      tag: "cover",
      placeholder: "请选择分类封面",
      prop: "cover",
      required: true
    }
  ]
]);
const isShow = ref(false);
const formData = ref({
  name: "",
  cover: ""
});
const showDrawer = () => {
  isShow.value = true;
};
const formRef = ref();
const handleConfirm = () => {
  formRef.value &&
    formRef.value.formRef.validate(async e => {
      if (e) {
        let fileData = new FormData();
        fileData.append("content", formData.value.name);
        fileData.append("channel", formData.value.cover);
        const ret = await addChannelTypeApi(fileData);
        isShow.value = false;
        ElMessage.success("添加成功");
        emit("success");
      }
    });
};
defineExpose({
  showDrawer
});
</script>

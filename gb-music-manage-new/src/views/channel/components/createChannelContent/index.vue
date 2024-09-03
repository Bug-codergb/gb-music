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
      :realWidth="200"
    ></ProForm>
  </ProDrawer>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import { useRoute } from "vue-router";
import { ElMessage } from "element-plus";
import {
  addChannelDetailApi,
  uploadChannelDetailApi
} from "@/api/modules/channel.js";
import ProDrawer from "@/components/ProDrawer/index";
import ProForm from "@/components/ProForm/index";
const emit = defineEmits(["success"]);
const route = useRoute();
const config = reactive([
  [
    {
      label: "电台名称",
      tag: "input",
      placeholder: "请输入电台名称",
      prop: "name",
      required: true
    }
  ],
  [
    {
      label: "电台简介",
      tag: "input",
      placeholder: "请输入电台简介",
      prop: "description",
      required: true,
      attrs: {
        clearable: true,
        type: "textarea"
      }
    }
  ],
  [
    {
      label: "电台封面",
      tag: "cover",
      placeholder: "请选择电台封面",
      prop: "cover",
      required: true
    }
  ]
]);
const isShow = ref(false);
const formData = ref({
  name: "",
  cover: "",
  description: ""
});
const showDrawer = () => {
  isShow.value = true;
};
const formRef = ref();
const handleConfirm = () => {
  formRef.value &&
    formRef.value.formRef.validate(async e => {
      if (e) {
        const ret = await addChannelDetailApi({
          cId: route.params.id,
          name: formData.value.name,
          description: formData.value.description
        });
        const f = new FormData();
        f.append("cover", formData.value.cover);
        f.append("id", ret.id);
        uploadChannelDetailApi(f);
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

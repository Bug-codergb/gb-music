<template>
  <div class="create-album-type">
    <ProDrawer
      v-model="isShow"
      title="添加分类"
      width="30%"
      @confirm="handleConfirm"
    >
      <ProForm
        v-model="formData"
        :config="config"
        ref="formRef"
      ></ProForm>
    </ProDrawer>
  </div>
</template>
<script setup>
import { ref, reactive } from "vue";
import { ElMessage } from "element-plus";
import { addAlbumTypeApi } from "@/api/modules/album.js";
import ProDrawer from "@/components/ProDrawer/index";
import ProForm from "@/components/ProForm/index";

const emit = defineEmits(["success"]);

const isShow = ref(false);
const config = reactive([
  [
    {
      label: "名称",
      prop: "name",
      tag: "input",
      required: true,
      placeholder: "请输入专辑分类名称",
      attrs: {
        clearable: true
      }
    }
  ]
]);
const formData = ref({
  name: ""
});
const showDrawer = () => {
  isShow.value = true;
};
const formRef = ref();
const handleConfirm = () => {
  formRef.value &&
    formRef.value.formRef.validate(async e => {
      if (e) {
        const res = await addAlbumTypeApi(formData.value);
        ElMessage.success("新增成功");
        isShow.value = false;
        emit("success");
      }
    });
};
defineExpose({
  showDrawer
});
</script>

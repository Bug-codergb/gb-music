<template>
  <div class="create-toplist">
    <ProDrawer
      v-model="isShow"
      title="新增榜单（热门榜单）"
      @confirm="handleConfirm"
    >
      <ProForm
        v-model="formData"
        ref="formRef"
        :config="config"
        :aspectRatio="1"
        :realWidth="200"
      ></ProForm>
    </ProDrawer>
  </div>
</template>
<script setup>
import { ref, reactive } from "vue";
import { ElMessage } from "element-plus";
import ProDrawer from "@/components/ProDrawer/index";
import ProForm from "@/components/ProForm/index";
import {
  createToplistApi,
  uploadToplistCoverApi
} from "@/api/modules/toplist.js";

const emit = defineEmits(["success"]);
const isShow = ref(false);

const formData = ref({
  name: "",
  desc: "",
  cover: null,
  type:0
});
const config = reactive([
  [
    {
      label: "名称",
      tag: "input",
      prop: "name",
      required: true,
      placeholder: "请输入榜单名称",
      attrs: {
        clearable: true
      }
    }
  ],
  [
    {
      label: "简介",
      tag: "input",
      prop: "desc",
      required: true,
      placeholder: "请输入榜单简介",
      attrs: {
        clearable: true,
        type: "textarea"
      }
    }
  ],
  [
    {
      label: "封面",
      tag: "cover",
      prop: "cover",
      required: true,
      placeholder: "",
      attrs: {}
    }
  ]
]);
const showDrawer = (type) => {
  formData.value.name = "";
  formData.value.desc = "";
  formData.value.cover = null;
  formData.value.type =type;
  isShow.value = true;
};
const formRef = ref();
const handleConfirm = () => {
  formRef.value &&
    formRef.value.formRef.validate(async e => {
      if (e) {
        const ret = await createToplistApi({
          name: formData.value.name,
          desc: formData.value.desc,
          type:formData.value.type
        });
        const f = new FormData();
        f.append("cover", formData.value.cover);
        await uploadToplistCoverApi(ret.tId, f);
        isShow.value = false;
        emit("success");
        ElMessage.success("新增成功");
      }
    });
};
defineExpose({
  showDrawer
});
</script>

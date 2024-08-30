<template>
  <div class="create-artist">
    <ProDrawer v-model="isShow" title="添加歌手" width="35%" @confirm="handleConfirm">
      <ProForm v-model="formData" :config="config" :formData="formData" ref="proFormRef" :aspectRatio="1" :realWidth="200" />
    </ProDrawer>
  </div>
</template>
<script setup>
import { ref, reactive } from "vue";
import { ElMessage } from "element-plus";
import { getArtistLangApi, createArtistApi, uploadArtistAvatarApi } from "@/api/modules/artist.js";
import ProDrawer from "@/components/ProDrawer/index.vue";
import ProForm from "@/components/ProForm/index.vue";

const emit = defineEmits(["success"]);
const isShow = ref(false);
const showDrawer = () => {
  isShow.value = true;
};
const formData = ref({
  name: "",
  desc: "",
  area: "",
  cover: null
});
const config = ref([
  [
    {
      label: "姓名",
      prop: "name",
      tag: "input",
      required: true,
      placeholder: "请输入歌手姓名"
    }
  ],
  [
    {
      label: "简介",
      prop: "desc",
      tag: "input",
      attrs: {
        type: "textarea"
      },
      required: true,
      placeholder: "请输入歌手简介"
    }
  ],
  [
    {
      label: "语种",
      prop: "area",
      required: true,
      tag: "select",
      options: []
    }
  ],
  [
    {
      label: "歌手头像",
      prop: "cover",
      tag: "cover",
      required: true
    }
  ]
]);
getArtistLangApi().then(res => {
  const artistLang = res.map(item => {
    return {
      value: item.id,
      label: item.name
    };
  });
  for (let item of config.value) {
    if (item[0].prop === "area") {
      item[0].options = artistLang;
    }
  }
});
const proFormRef = ref();
const handleConfirm = () => {
  proFormRef.value.formRef.validate(async e => {
    if (e) {
      const res = await createArtistApi(formData.value);
      const cover = new FormData();
      cover.append("artist_avatar", formData.value.cover);
      await uploadArtistAvatarApi(res.id, cover);
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

<template>
  <div class="create-artist">
    <ProDrawer v-model="isShow" :title="title" width="35%" @confirm="handleConfirm">
      <ProForm v-model="formData" :config="config"  ref="proFormRef" :aspectRatio="1" :realWidth="200" />
    </ProDrawer>
  </div>
</template>
<script setup>
import { ref, computed,toValue } from "vue";
import { ElMessage } from "element-plus";
import { getArtistLangApi,updateArtistApi, createArtistApi, uploadArtistAvatarApi } from "@/api/modules/artist.js";
import ProDrawer from "@/components/ProDrawer/index.vue";
import ProForm from "@/components/ProForm/index.vue";

const emit = defineEmits(["success"]);
const isShow = ref(false);
const title = ref("添加歌手");
const isUpdate = ref(false);
const showDrawer = (data) => {
  isShow.value = true;
  isUpdate.value = Boolean(data);
  title.value= isUpdate.value ? '编辑歌手':'添加歌手'
  initFormData(data,isUpdate);
};
const initFormData=(data,isUpdate)=>{
  isUpdate = toValue(isUpdate);
  formData.value={
    name:isUpdate ? data.name : "",
    desc:isUpdate ? data.description : "",
    area:"",
    cover:null,
    id:isUpdate ? data.id : undefined
  }
}
const formData = ref({
  name: "",
  desc: "",
  area: "",
  cover: null
});
const config = computed(()=>[
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
      options: [],
      isShow:!isUpdate.value
    }
  ],
  [
    {
      label: "歌手头像",
      prop: "cover",
      tag: "cover",
      required: true,
      isShow:!isUpdate.value
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
      if(!isUpdate.value){
        const res = await createArtistApi(formData.value);
        const cover = new FormData();
        cover.append("artist_avatar", formData.value.cover);
        await uploadArtistAvatarApi(res.id, cover);
      }else{
        await updateArtistApi({...formData.value,arId:formData.value.id});
      }
      isShow.value = false;
      ElMessage.success(isUpdate?'编辑成功':"添加成功");
      emit("success");
    }
  });
};
defineExpose({
  showDrawer
});
</script>

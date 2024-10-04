<script setup>
import ProDrawer from "@/components/ProDrawer/index.vue";
import ProForm from "@/components/ProForm/index.vue"
import {ref, reactive,computed} from "vue";
import {ElMessage, ElMessageBox} from "element-plus"
import { createPlaylistApi ,uploadPlaylistCoverApi,updatePlaylistApi} from "@/api/modules/playlist"

const emit = defineEmits(['success'])
const isShow= ref(false);
const formData = ref({
  name:"",
  desc:"",
  cover:null
})
const isUpdate = ref(false);
const title = ref("添加歌单")
const showDrawer=(data)=>{
  isUpdate.value = Boolean(data);
  isShow.value = true;
  resetFormData(isUpdate.value,data);
}
const resetFormData=(isUpdate,data)=>{
  formData.value={
    id:isUpdate ? data.id:undefined,
    name:isUpdate ? data.name:"",
    desc:isUpdate ? data.description:"",
    cover:null
  }
}
const config = computed(()=>[
  [
    {
      label:"名称",
      prop:"name",
      tag:"input",
      placeholder:"请输入歌单名称",
      required:true,
      attrs:{
        clearable:true
      }
    }
  ],
  [
    {
      label:"简介",
      prop:"desc",
      tag:"input",
      required:true,
      placeholder: "请输入简介",
      attrs:{
        type:"textarea",
        clearable:true
      }
    }
  ],
  [
    {
      label:"封面",
      prop:"cover",
      tag:"cover",
      placeholder:"请选择封面",
      required:true,
      isShow:!isUpdate.value,
      attrs:{

      }
    }
  ]
])
const formRef = ref();
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate(async (e)=>{
    if(e){
      const { cover,...rest } = formData.value;
      if(!isUpdate.value){
        const res = await createPlaylistApi(rest);
        let f = new FormData();
        f.append("cover",formData.value.cover);
        await uploadPlaylistCoverApi(res.id,f);
      }else{
        await updatePlaylistApi(formData.value);
      }
      ElMessage.success(isUpdate ? '更新成功' : "添加成功");
      isShow.value = false;
      emit("success");
    }
  })
}
defineExpose({
  showDrawer
})
</script>

<template>
  <ProDrawer v-model="isShow" :title="title" @confirm="handleConfirm">
    <ProForm :config="config" v-model="formData" :aspectRatio="1" ref="formRef"></ProForm>
  </ProDrawer>
</template>

<style scoped lang="scss">

</style>

<script setup>
import ProForm from "@/components/ProForm/index.vue";
import ProDrawer from "@/components/ProDrawer/index.vue"
import { ref,reactive } from "vue"
import { createPlaylistCateApi } from "@/api/modules/playlist"
import { ElMessage } from "element-plus"

const emit = defineEmits(['success']);
const isShow = ref(false);
const showDrawer = ()=>{
  formData.value.name = "";
  isShow.value = true
}
const config = reactive([
  [
    {
      label:"名称",
      prop:"name",
      tag:"input",
      required:true,
      placeholder:"请输入歌单分类名称"
    }
  ]
])
const formData = ref({
  name:""
})
const formRef = ref();
const handleConfirm=()=>{
  formRef.value&&formRef.value.formRef.validate(async (e)=>{
    if(e){
      await createPlaylistCateApi(formData.value);
      ElMessage.success("创建成功")
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
  <ProDrawer v-model="isShow" @confirm="handleConfirm" title="创建歌单分类" width="30%">
    <ProForm :config="config" ref="formRef" v-model="formData"></ProForm>
  </ProDrawer>
</template>

<style scoped lang="scss">

</style>

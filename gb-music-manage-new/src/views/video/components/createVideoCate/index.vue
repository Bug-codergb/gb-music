<script setup>
import { ref,reactive } from "vue"
import { ElMessage } from "element-plus"
import ProDrawer from "@/components/ProDrawer/index.vue"
import ProForm from "@/components/ProForm/index.vue"
import {createVideoCateApi} from "@/api/modules/video";
const emit = defineEmits(['success'])
const isShow = ref(false);
const formData = ref({
  name:""
})
const config = reactive([
  [
    {
      label:"名称",
      prop:"name",
      tag:"input",
      required:true,
      placeholder:"请输入视频分类名称",
      attrs:{
        clearable:true
      }
    }
  ]
])
const showDrawer=()=>{
  formData.value.name = ""
  isShow.value = true;
}
const formRef = ref()
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate(async (e)=>{
    if(e){
      const params = {
        name:formData.value.name,
        type:0
      }
      const res =  await createVideoCateApi(params);
      isShow.value = false;
      emit("success");
      ElMessage.success("新增成功")
    }
  })
}
defineExpose({
  showDrawer
})
</script>

<template>
  <div class="create-video-cate">
    <ProDrawer v-model="isShow" @confirm="handleConfirm" title="新增视频分类">
      <ProForm :config="config" v-model="formData" ref="formRef"></ProForm>
    </ProDrawer>
  </div>
</template>

<style scoped lang="scss">

</style>

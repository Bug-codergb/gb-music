<script setup>
import { ref,computed } from "vue"
import { useRoute } from "vue-router"
import {ElMessage} from "element-plus";
import ProDrawer from "@/components/ProDrawer/index.vue"
import ProForm from "@/components/ProForm/index.vue";
import { createProgramApi,uploadProgramApi } from "@/api/modules/channel"
import {getAudioDuration} from "@/utils/songUtils"
const route = useRoute();
const emit = defineEmits(['success']);
const isShow = ref(false);
const formData = ref({
  cId:"",
  name:"",
  file:null
})
const config=computed(()=>[
  [
    {
      label:"名称",
      prop:"name",
      tag:"input",
      required:true,
      placeholder:"请输入声音名称",
      attrs:{
        clearable:true
      }
    }
  ],
  [
    {
      label:"源文件",
      prop:"file",
      tag:"file",
      placeholder:"请选择源文件",
      attrs:{
        accept:['mp3']
      }
    }
  ]
])
const showDrawer=(data)=>{
  isShow.value = true;
  formData.value.cId = data.id;
  formData.value.name = "";
  formData.value.file= null;
}
const formRef = ref();
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate(async (e)=>{
    if(e){
      const res = await createProgramApi({
        cId:formData.value.cId,
        name:formData.value.name
      })
      const f= new FormData();
      f.append("program",formData.value.file);
      const dt = await getAudioDuration(formData.value.file);
      f.append("dt",dt);
      await uploadProgramApi(res.id,f);
      ElMessage.success("添加成功");
      emit("success")
      isShow.value = false;
    }
  })
}
defineExpose({
  showDrawer
})
</script>

<template>
  <ProDrawer v-model="isShow" title="添加声音" width="30%" @confirm="handleConfirm">
    <ProForm :config="config" v-model="formData" ref="formRef"></ProForm>
  </ProDrawer>
</template>

<style scoped lang="scss">

</style>

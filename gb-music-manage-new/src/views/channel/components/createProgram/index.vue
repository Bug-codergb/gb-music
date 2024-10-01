<script setup>
import { ref,computed } from "vue"
import ProDrawer from "@/components/ProDrawer/index.vue"
import ProForm from "@/components/ProForm/index.vue";

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
const showDrawer=()=>{
  isShow.value = true
}
const formRef = ref();
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate((e)=>{

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

<script setup>
import ProDrawer from "@/components/ProDrawer/index.vue"
import ProForm from "@/components/ProForm/index.vue"
import {createComboApi} from "@/api/modules/combo"
import { ref } from "vue"
import {ElMessage} from "element-plus";

const emit = defineEmits(['success']);
const isShow = ref(false);
const formData = ref({
  name:"",
  price:undefined,
})
const config = ref([
  [
    {
      label:"套餐名称",
      prop:"name",
      tag:"input",
      placeholder:"请输入套餐名称",
      required:true,
      attrs:{
        clearable:true
      }
    },
  ],
  [
    {
      tag:"input-number",
      label:"套餐价格",
      prop:"price",
      placeholder: "请输入套餐价格",
      required:true,
      attrs:{
        clearable:true,
        style:"width:100%",
        precision:2,
        min:0
      }
    }
  ]
])
const formRef = ref();
const showDrawer=()=>{
  formData.value.name="";
  formData.value.price = undefined;
  isShow.value=true;
}
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate(async (e)=>{
    if(e){
      const res = await createComboApi(formData.value);
      ElMessage.success("创建成功");
      emit("success");
      isShow.value = false;
    }
  })
}
const handleCancel=()=>{}
defineExpose({
  showDrawer
})
</script>

<template>
  <ProDrawer v-model="isShow" title="创建套餐" @confirm="handleConfirm" @cancel="handleCancel">
    <ProForm v-model="formData" ref="formRef" :config="config"/>
  </ProDrawer>
</template>

<style scoped lang="scss">

</style>

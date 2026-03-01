<script setup>
import ProDrawer from "@/components/ProDrawer/index.vue"
import ProForm from "@/components/ProForm/index.vue"
import {createComboApi,updateComboApi} from "@/api/modules/combo"
import { ref } from "vue"
import {ElMessage} from "element-plus";

const emit = defineEmits(['success']);
const isShow = ref(false);
const isUpdate = ref(false);
const formData = ref({
  name:"",
  price:undefined,
  id:undefined
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
const showDrawer=(row)=>{
  isUpdate.value = Boolean(row);
  formData.value.name= isUpdate.value ? row.name: "";
  formData.value.price = isUpdate.value ? row.price:undefined;
  formData.value.id = isUpdate.value ? row.id:undefined;
  isShow.value=true;
}
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate(async (e)=>{
    if(e){
      console.log(isUpdate.value)
      const res = isUpdate.value ? await updateComboApi(formData.value) : await createComboApi(formData.value);
      ElMessage.success(isUpdate.value?"编辑成功":"创建成功");
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
  <ProDrawer v-model="isShow" :title="isUpdate?'编辑套餐':'创建套餐'" @confirm="handleConfirm" @cancel="handleCancel">
    <ProForm v-model="formData" ref="formRef" :config="config"/>
  </ProDrawer>
</template>

<style scoped lang="scss">

</style>

<script setup>
import { ref,reactive } from "vue"
import {createUserApi } from "@/api/modules/user"
import ProDrawer from "@/components/ProDrawer/index.vue"
import ProForm from "@/components/ProForm/index.vue"
import {ElMessage} from "element-plus";

const emit = defineEmits(["success"])
const isShow = ref(false)
const showDrawer=()=>{
  formData.value.manage = 0;
  formData.value.userName = "";
  isShow.value = true
}
const formData = ref({
  userName: "",
  manage:1
})
const config = ref([
  [
    {
      label:"用户名",
      tag:"input",
      prop:"userName",
      placeholder:"请输入用户名",
      required:true,
      attrs:{
        clearable:true,
      }
    }
  ],
  [
    {
      label:"是否为管理员",
      tag:"radio",
      prop:"manage",
      required:true,
      options:[
        {
          label:"是",
          value:1
        },
        {
          label:"否",
          value:0
        }
      ]
    }
  ]
])
const formRef = ref();
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate(async (e)=>{
    if(e){
      const res = await createUserApi(formData.value);
      emit("success");
      isShow.value = false
      ElMessage.success("添加成功")
    }
  })
}
const handleCancel=()=>{
  isShow.value = false
}
defineExpose({
  showDrawer
})
</script>

<template>
  <div class="create-user">
    <ProDrawer title="添加用户" v-model="isShow" @confirm="handleConfirm" @cancel="handleCancel">
      <ProForm :config="config" ref="formRef" v-model="formData"/>
    </ProDrawer>
  </div>
</template>

<style scoped lang="scss">

</style>

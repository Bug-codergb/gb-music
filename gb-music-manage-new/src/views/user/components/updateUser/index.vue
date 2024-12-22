<script setup>
import { ref,reactive } from "vue"
import {getAllComboApi} from "@/api/modules/combo";
import moment from "moment"
import ProDrawer from "@/components/ProDrawer/index.vue"
import {updateUserApi} from "@/api/modules/user";
import {ElMessage} from "element-plus";
const emit = defineEmits(["success"])
const isShow = ref(false);
const detail = ref({})

const comboList = ref([])
const showDrawer = (data)=>{
  isShow.value = true;
  detail.value = data || {}
  formData.name = data.userName || ""
  formData.userId = data.userId || ""
  formData.vip = data.auth || 0;
  formData.manage = data.manage || ""
  formData.combo = data.cId || ""
  formData.expireTime =  data.auth === 1 ?  (moment(data.expireTime).format("yyyy-MM-DD HH:mm")) : moment().format("YYYY-MM-DD HH:mm")
  getAllComboApi().then((res)=>{
    comboList.value = res;
  })
}
const formData = reactive({
  userId:"",
  name:"",
  manage:1,
  vip:0,
  expireTime:moment().format("YYYY-MM-DD HH:mm:ss"),
  combo:""
})

const handleComboChange=()=>{
  const combo = comboList.value.find(item=>item.id === formData.combo);
  if(combo){
    const num = parseInt(combo.name);
    if(Number.isInteger(num)){
      formData.expireTime = moment().add(num,"month").format("YYYY-MM-DD HH:mm");
    }
  }
}
const formRef = ref();
const handleConfirm=()=>{
  formRef.value && formRef.value.validate(async (e)=>{
    if(e){
      const res = await updateUserApi(formData);
      ElMessage.success("更新成功");
      emit("success");
      isShow.value = false
    }
  })
}
defineExpose({
  showDrawer
})
</script>

<template>
  <ProDrawer v-model="isShow" title="编辑用户信息" @confirm="handleConfirm">
    <el-form ref="formRef" :model="formData" label-position="top">
      <el-form-item label="用户名" prop="name" :rules="{required:true,message:'用户名称不能为空',trigger:'blur'}">
        <el-input v-model="formData.name" placeholder="请输入用户名"/>
      </el-form-item>
      <el-form-item label="是否为管理员" prop="manage">
        <el-radio-group v-model="formData.manage">
          <el-radio :label="1">是</el-radio>
          <el-radio :label="0">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="是否为VIP" prop="vip">
        <el-radio-group v-model="formData.vip">
          <el-radio :label="1">是</el-radio>
          <el-radio :label="0">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="套餐类型" prop="combo" v-if="formData.vip === 1" :rules="{required:true,message:'套餐不能为空',trigger:'change'}">
        <el-select v-model="formData.combo" placeholder="请选择套餐类型" @change="handleComboChange">
          <el-option v-for="item in comboList" :value="item.id" :label="item.name" :key="item.id">
            ¥{{item.price}} / {{item.name}}
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="过期时间" v-if="formData.combo && formData.vip === 1">
        {{ formData.expireTime }}
      </el-form-item>
    </el-form>
  </ProDrawer>
</template>

<style scoped lang="scss">

</style>

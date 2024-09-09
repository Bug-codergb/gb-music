<script setup>
import { useAttrs,ref,computed } from 'vue'
import {ElMessage} from "element-plus"
import {Document,Delete} from "@element-plus/icons-vue"
const props = defineProps({
  modelValue:{
    type:Object,
    default(){
      return null;
    }
  }
})
const emit = defineEmits(["update:modelValue"])
const attrs = useAttrs()
const isShowPrev=ref(false);
const uploadFile = ref(null);
const handleFileChange=(e)=>{
  if(e.currentTarget.files){
    const file = e.currentTarget.files[0];
    const suffix = file.name.substring(file.name.lastIndexOf(".")+1);
    if(attrs.accept && suffix && !attrs.accept.includes(suffix)){
      ElMessage.warning(`请上传${attrs.accept.join(",")}文件`);
      return;
    }
    isShowPrev.value = true;
    uploadFile.value = file;
    emit("update:modelValue",file);
  }
}
const handleDelete=()=>{
  isShowPrev.value = false;
  uploadFile.value = null
  emit("update:modelValue",null);
}
</script>

<template>
  <div class="form-file-container">
    <template v-if="!isShowPrev">
      <el-icon><Document /></el-icon>
      <input type="file" @change="handleFileChange"/>
    </template>
    <template v-if="isShowPrev">
      <span class="label">{{uploadFile.name}}</span>
      <div class="mask" @click="handleDelete" title="删除文件">
        <el-icon><Delete /></el-icon>
      </div>
    </template>
  </div>
</template>

<style scoped lang="scss">
.form-file-container{
  height:140px;
  background-color: #f2f2f2;
  width: 100%;
  overflow: hidden;
  position: relative;
  display:flex;
  align-items: center;
  justify-content: center;
  border-radius: 4px;
  input{
    width: 100%;
    height: 100%;
    opacity: 0;
    cursor: pointer;
    position: absolute;
    z-index:10
  }
  .el-icon{
    font-size: 28px;
    position: absolute;
    left: 50%;
    top:50%;
    transform: translate(-50%,-50%);
    z-index: 9;
  }
  .mask{
    width:100%;
    height:100%;
    position: absolute;
    left: 0;
    top:0;
    background-color: rgba(0,0,0,.3);
    color:#fff;
    z-index:900;
    cursor:pointer;
    display: none;
    transition: all 0.3s;
  }
  .label{
    color:var(--el-color-primary);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  &:hover{
    .mask{
      display: block;
    }
  }
}
</style>

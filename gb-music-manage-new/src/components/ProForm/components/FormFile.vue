<script setup>
import { useAttrs,ref,computed } from 'vue'
import {ElMessage} from "element-plus"
import {Document,Delete,VideoCamera,VideoPlay} from "@element-plus/icons-vue"
const props = defineProps({
  fileType:{
    type:String,
    default:""
  },
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

const videoURL = ref("")
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
    if(props.fileType==="video"){
      videoURL.value = URL.createObjectURL(file);
    }
    emit("update:modelValue",file);
  }
}
const handleDelete=()=>{
  isShowPrev.value = false;
  uploadFile.value = null
  emit("update:modelValue",null);
}
const videoRef = ref();
const isPlay = ref(false);
const handlePlay=()=>{
  isPlay.value = true;
}
const handlePause=()=>{
  isPlay.value = false;
}
const handleVideoAction=(action)=>{
  switch(action){
    case "play":videoRef.value.play();break;
    case "pause":videoRef.value.pause();break;
    default:
      return;
  }
}
</script>

<template>
  <div class="form-file-container">
    <template v-if="!isShowPrev">
      <el-icon class="upload-icon">
        <VideoCamera v-if="fileType==='video'" />
        <Document v-else/>
      </el-icon>
      <input type="file" @change="handleFileChange"/>
    </template>
    <template v-if="isShowPrev">
      <div class="video-container" v-if="fileType==='video'">
        <video :controls="false" :src="videoURL" ref="videoRef" @play="handlePlay" @pause="handlePause"/>
      </div>
      <span class="label" v-else>{{uploadFile.name}}</span>
      <div class="mask" @click="handleDelete" title="删除文件">
        <template v-if="fileType ==='video'">
          <el-icon v-if="isPlay" style="margin:0 15px 0 0" @click.stop="handleVideoAction('pause')"><VideoPause /></el-icon>
          <el-icon v-if="!isPlay" style="margin:0 15px 0 0" @click.stop="handleVideoAction('play')">
            <VideoPlay />
          </el-icon>
        </template>
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
  .upload-icon.el-icon{
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

    align-items: center;
    justify-content: center;
    .el-icon{
      font-size: 28px;
    }
  }
  .label{
    color:var(--el-color-primary);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  &:hover{
    .mask{
      display: flex;
    }
  }
  .video-container{
    width: 100%;
    height: 100%;
    video{
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
  }
}
</style>

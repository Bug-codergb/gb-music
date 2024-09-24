<template>
  <div class="create-video">
    <ProDrawer v-model="isShow" :title="title" width="35%" @confirm="handleConfirm">
      <ProForm v-model="formData" :config="config" ref="formRef"></ProForm>
    </ProDrawer>
  </div>
</template>
<script setup>
import { ref,toValue,computed } from "vue"
import { ElMessage } from "element-plus"
import ProDrawer from "@/components/ProDrawer/index.vue"
import ProForm from "@/components/ProForm/index.vue"
import {getVideoDuration} from "@/utils/videoUtils"
import { getVideoCateApi,createVideoApi,updateVideoSourceApi,updateVideoCoverApi ,updateVideoApi} from "@/api/modules/video.js";
const emit = defineEmits(['success'])
const videoCateList = ref([]);
getVideoCateApi().then((res)=>{
  videoCateList.value = res.map((item)=>{
    return {
      label:item.name,
      value:item.id
    }
  })
  const c = [...config.value];
  for(const item of c){
    if(item[0].prop === "cateId"){
      item[0].options = videoCateList.value;
      break;
    }
  }
  config.value  =c;
})
const isShow = ref(false);
const formData = ref({
  cateId:"",
  desc:"",
  name:"",
  type:0,
  video:null,
  cover:null,
})
const config = computed({
  get(){
    let arr =  [
      [
        {
          label:"名称",
          prop:"name",
          tag:"input",
          required:true,
          placeholder:"请输入名称",
          attrs:{
            clearable:true
          }
        }
      ],
      [
        {
          label:"简介",
          prop:"desc",
          tag:"input",
          required:true,
          placeholder:"请输入简介",
          attrs:{
            type:"textarea",
            clearable:true
          }
        }
      ],
      [
        {
          label:"分类",
          prop:"cateId",
          tag:"select",
          required:true,
          placeholder:"请选择分类",
          options:[],
          attrs: {
            clearable: true
          }
        }
      ],
      [
        {
          label:"视频封面",
          prop:"cover",
          placeholder:"请选择视频封面",
          required:true,
          tag:"cover",
          isShow:!isUpdate.value
        }
      ],
      [
        {
          label:"视频源文件",
          prop:"video",
          placeholder:"请选择视频源文件",
          required:true,
          tag:"video",
          isShow:!isUpdate.value
        }
      ]
    ]
    for(let item of arr){
      if(item[0].prop === "cateId"){
        item[0].options = videoCateList.value;
        break;
      }
    }
    return arr;
  },
  set(newVal){
    console.log(newVal)
  }
})
const title = ref("添加视频");
const isUpdate = ref(false);
const showDrawer=(data)=>{
  isShow.value = true;
  isUpdate.value = Boolean(data);
  title.value = isUpdate.value ? "编辑视频":"添加视频";
  initFormData(isUpdate,data);
}
const initFormData=(isUpdate,data)=>{
  isUpdate = toValue(isUpdate);
  formData.value={
    id:isUpdate ? data.id : undefined,
    cateId: isUpdate ? data.category.id : "",
    desc:isUpdate ? data.description : "",
    name:isUpdate ? data.name : "",
    type:0,
    video:null,
    cover:null
  }
}
const formRef = ref();
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate(async (e)=>{
    if(e){
      if(!isUpdate.value){
        const res = await createVideoApi({
          cateId:formData.value.cateId,
          desc:formData.value.desc,
          name:formData.value.name,
          type:0
        })
        const video = new FormData();
        video.append('video',formData.value.video)
        const dt = await getVideoDuration(formData.value.video);
        video.append("dt",dt);
        await updateVideoSourceApi(res.id,video);

        const cover = new FormData();
        cover.append("cover",formData.value.cover);
        await updateVideoCoverApi(res.id,cover)
      }else{
        await updateVideoApi({
          ...formData.value,
          cate:formData.value.cateId,
        })
      }
      ElMessage.success("视频上传成功");
      isShow.value=false;
      emit("success")
    }
  })
  console.log(formData.value)
}
defineExpose({
  showDrawer
})
</script>



<style scoped lang="scss">

</style>

<script setup>
import {ref,computed} from "vue"
import {ElMessage} from "element-plus"
import {getVideoDuration} from "@/utils/videoUtils"
import ProDrawer from "@/components/ProDrawer/index.vue";
import ProForm from "@/components/ProForm/index.vue";
import {addSongMVApi, getVideoCateApi, updateVideoCoverApi,updateVideoApi, updateVideoSourceApi} from "@/api/modules/video";
const emit = defineEmits(['success'])
const isShow = ref(false);

const isUpdate = ref(false);
const showDrawer=(data)=>{
  isShow.value = true;

  isUpdate.value = Boolean(data && data.isUpdate);

  initFormData(isUpdate.value,data);
}
const formData=ref({
  cateId:"",
  desc:"",
  name:"",
  songId:"",
  type:1,
  cover:null,
  source:null
})
const initFormData=(isUpdate,data)=>{
  formData.value={
    id:isUpdate ? data.id : undefined,
    cateId:isUpdate ? data.category.id : "",
    desc:isUpdate ? data.description : data.album.description,
    name:isUpdate ? data.name : data.name,
    songId:isUpdate ? "":data.id,
    type:1,
    cover:null,
    source:null
  }
}
const config = computed(()=>{
  let arr = [
    [
      {
        label:"名称",
        prop:"name",
        tag:"input",
        required:true,
        placeholder:"请输入名称",
        attrs:{
          clearable:true
        },
        isShow:isUpdate.value
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
          clearable:true
        },
        isShow:isUpdate.value
      }
    ],
    [
      {
        label:"MV分类",
        prop:"cateId",
        tag:"select",
        options:[],
        placeholder:"请选择mv分类",
        required:true,
        attrs:{
          clearable:true,
        }
      }
    ],
    [
      {
        label:"MV封面",
        prop:"cover",
        tag:"cover",
        options:[],
        placeholder:"请选择mv封面",
        required:true,
        attrs:{
          clearable:true,
        },
        isShow:!isUpdate.value
      }
    ],
    [
      {
        label:"MV源文件",
        prop:"source",
        tag:"video",
        options:[],
        placeholder:"请选择mv分类",
        required:true,
        attrs:{
          clearable:true,
          accept:["mp4",'mkv','rmv']
        },
        isShow:!isUpdate.value
      }
    ]
  ]
  for(let item of arr){
    if(item[0].prop==="cateId"){
      item[0].options = cateList.value;
    }
  }
  return arr;
})

const cateList = ref([]);
getVideoCateApi({ type: 1 }).then(res => {
  cateList.value = res.map(item => {
    return {
      label: item.name,
      value: item.id
    };
  });
  for(let item of config.value){
    if(item[0].prop==="cateId"){
      item[0].options = cateList.value;
    }
  }
});
const formRef = ref();
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate(async (e)=>{
    if(e){
      if(!isUpdate.value){
        const res = await addSongMVApi(formData.value)
        const s= new FormData();
        s.append("video",formData.value.source);
        const dt = await getVideoDuration(formData.value.source);
        s.append("dt",dt);
        await updateVideoSourceApi(res.id,s);

        const c = new FormData();
        c.append("cover",formData.value.cover);
        await updateVideoCoverApi(res.id,c);
      }else{
        await updateVideoApi({
          cate:formData.value.cateId,
          id:formData.value.id,
          desc:formData.value.desc,
          name:formData.value.name
        })
      }
      ElMessage.success(`MV${isUpdate.value?'更新':'添加'}成功`)
      emit("success");
      isShow.value = false;
    }
  })
}
defineExpose({
  showDrawer
})
</script>

<template>
  <ProDrawer v-model="isShow" title="添加歌曲MV" @confirm="handleConfirm">
    <ProForm :config="config" v-model="formData" ref="formRef"/>
  </ProDrawer>
</template>

<style scoped lang="scss">

</style>

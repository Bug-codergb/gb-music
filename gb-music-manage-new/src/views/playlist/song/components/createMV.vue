<script setup>
import {ref,reactive} from "vue"
import {ElMessage} from "element-plus"
import {getVideoDuration} from "@/utils/videoUtils"
import ProDrawer from "@/components/ProDrawer/index.vue";
import ProForm from "@/components/ProForm/index.vue";
import {addSongMVApi, getVideoCateApi, updateVideoCoverApi, updateVideoSourceApi} from "@/api/modules/video";
const isShow = ref(false);
const showDrawer=(data)=>{
  isShow.value = true;
  formData.value.desc = data.album.description;
  formData.value.name = data.name;
  formData.value.songId = data.id;
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
const config = ref([
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
      }
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
      }
    }
  ]
])

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
      console.log(formData.value);
      const res = await addSongMVApi(formData.value)
      const s= new FormData();
      s.append("video",formData.value.source);
      const dt = await getVideoDuration(formData.value.source);
      s.append("dt",dt);
      await updateVideoSourceApi(res.id,s);

      const c = new FormData();
      c.append("cover",formData.value.cover);
      await updateVideoCoverApi(res.id,c);
      ElMessage.success("MV添加成功")
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

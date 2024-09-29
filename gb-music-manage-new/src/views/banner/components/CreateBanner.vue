<script setup>
import { ref,reactive } from "vue"
import { ElMessage } from "element-plus"
import { getSearchMatchApi } from "@/api/modules/search"
import { addBannerApi,uploadBannerApi } from "@/api/modules/banner"
import ProDrawer from "@/components/ProDrawer/index"
import ProForm from "@/components/ProForm/index.vue"

const emit = defineEmits(['success']);
const isShow = ref(false);
const showDrawer=()=>{
  isShow.value = true;
  formData.value.id="";
  formData.value.key="";
  formData.value.cover = null;
  formData.value.label = ""
}
const cateList = reactive([
  {
    label:"视频",
    value:"video"
  },
  {
    label:"专辑",
    value:"album"
  },
  {
    label:"歌曲",
    value:"song"
  }
])
const createFilter=(queryString)=> {
  return (restaurant) => {
    return restaurant.value.toLowerCase().includes(queryString.toLowerCase());
  };
}
const handleQuerySearch=(queryString, cb)=>{
  getSearchMatchApi({
    keyword:queryString
  }).then((data)=>{
    if (formData.value.key === 'video') {
      const res  = data.video.map((item, index) => {
        return {
          value: item.name,
          id: item.id
        };
      });
      const results = queryString ? res.filter(createFilter(queryString)) : res;
      cb(results);
    } else if (formData.value.key === 'album') {
      const res = data.album.map((item, index) => {
        return {
          value: item.name,
          id: item.id
        };
      });
      const results = queryString ? res.filter(createFilter(queryString)) : res;
      cb(results);
    } else if (formData.value.key === 'song') {
      const res = data.song.map((item, index) => {
        return {
          value: item.name,
          id: item.id
        };
      });
      const results = queryString ? res.filter(createFilter(queryString)) : res;
      cb(results);
    } else {
      ElMessage({
        message: '请选择类型',
        type: 'warning'
      });
    }
  })
}
const handleSelect=(item)=>{
  formData.value.id=item.id;
}
const config=ref([
  [
    {
      label:"分类",
      prop:"key",
      tag:"select",
      options:cateList,
      required:true
    }
  ],
  [
    {
      prop:"label",
      label:"名称",
      tag:"autocomplete",
      required:true,
      placeholder:"请输入视频/专辑/歌曲",
      attrs:{
        style:"width:100%",
        'fetch-suggestions':handleQuerySearch
      },
      events:{
        "select":handleSelect
      }
    }
  ],
  [
    {
      label:"封面",
      prop:"cover",
      tag:"cover",
      required:true
    }
  ]
])
const formData = ref({
  key:"",
  cover:null,
  id:"",
  label:""
})
const formRef = ref();
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate(async (e)=>{
    if(e){
      const key = formData.value.key==="song" ? "songId":formData.value.key==="album" ? "alId":"vId";
      const res = await addBannerApi(key,formData.value.id);
      let f = new FormData();
      f.append("banner",formData.value.cover);

      uploadBannerApi(f,key,formData.value.id)
      ElMessage({
        type:"success",
        message:"添加成功"
      })
      isShow.value = false;
      emit("success");
    }
  })
}
defineExpose({
  showDrawer
})
</script>

<template>
  <ProDrawer v-model="isShow" title="添加banner" @confirm="handleConfirm">
    <ProForm :config="config" ref="formRef" v-model="formData" :realWidth="1250" :aspectRatio="5.208333"></ProForm>
  </ProDrawer>
</template>

<style scoped lang="scss">

</style>

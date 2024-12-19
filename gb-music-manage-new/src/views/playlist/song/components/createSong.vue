<template>
  <div>
    <ProDrawer v-model="isShow" :title="title" width="30%" @confirm="handleConfirm">
      <ProForm :config="config" v-model="formData" ref="formRef">
        <template #album>
          <el-space size="large">
            <span v-if="formData.album" >{{formData.album.name}}</span>
            <el-button type="primary" @click="handleShowAlbum">选择专辑</el-button>
          </el-space>
        </template>
      </ProForm>
    </ProDrawer>
    <AlbumList ref="albumListRef" @select="handleSelectAlbum"/>
  </div>
</template>
<script setup>
import { ref,computed } from "vue"
import {ElMessage} from "element-plus"
import {getAudioDuration} from "@/utils/songUtils"
import ProDrawer from "@/components/ProDrawer/index.vue"
import ProForm from "@/components/ProForm/index.vue"
import AlbumList from "./albumList.vue"
import { createSongApi,uploadSongApi ,updateSongApi} from "@/api/modules/song"

const props = defineProps({
  isAlbumDetail:{
    type:Boolean,
    default:false
  }
})
const emit = defineEmits(['success'])
const isShow = ref(false);

const isUpdate = ref(false);
const title = ref("上传歌曲")
const showDrawer=(data,info=null)=>{
  isUpdate.value = Boolean(data);
  title.value = isUpdate.value ? "编辑歌曲":"上传歌曲"
  isShow.value = true;
  initFormData(isUpdate.value,data,info);
}
const initFormData=(isUpdate,data,info=null)=>{
  formData.value = {
    name:isUpdate ? data.name :"",
    alId:"",
    alia:isUpdate ? data.alia : "",
    arId:"",
    publishTime:isUpdate ? data.publishTime : '',
    source:null,
    album:info ? info.album : null,
    artist:  "",
    lyric:isUpdate ? data.lyric:"",
    vip:isUpdate ? data.vip:0,
    id:isUpdate ? data.id : undefined
  }
}
const formData =ref({
  name:"",
  alId:"",
  alia:"",
  arId:"",
  publishTime:'',
  source:null,
  album:null,
  artist:""
})
const handleSelectAlbum=(val)=>{
  formData.value.album = val;
  formData.value.artist=val.artist.name;
}
const config=computed(()=>[
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
      prop:"alia",
      tag:"input",
      required:true,
      placeholder:"请输入简介",
      attrs:{
        clearable:true,
        type:"textarea"
      }
    }
  ],
  [
    {
      label:"发布时间",
      prop:"publishTime",
      tag:"date",
      required:true,
      placeholder:"请选择时间",
      attrs:{
        clearable:true,
        "value-format": "YYYY-MM-DD"
      }
    }
  ],
  [
    {
      label:"是否为vip",
      prop:"vip",
      tag:"radio",
      isShow:isUpdate.value,
      options:[
        {
          label:"会员",
          value:1
        },
        {
          label:"非会员",
          value:0
        }
      ]
    }
  ],
  [
    {
      label:"歌曲源文件",
      prop:"source",
      tag:"file",
      required:true,
      placeholder:"请选择歌曲源文件",
      attrs:{
        clearable:true,
        accept:["mp3",'flac']
      },
      isShow:!isUpdate.value
    }
  ],
  [
    {
      label:"专辑",
      prop:"album",
      tag:"slot",
      required:true,
      isShow:!isUpdate.value && !props.isAlbumDetail
    }
  ],
  [
    {
      label:"歌手",
      prop:"artist",
      tag:"input",
      required:true,
      placeholder:"请先选择专辑",
      attrs:{
        readonly:true
      },
      isShow:!isUpdate.value && !props.isAlbumDetail
    }
  ],
  [
    {
      label:"歌词",
      prop:"lyric",
      tag:"input",
      isShow: isUpdate.value,
      required:false,
      placeholder: "请输入歌词",
      attrs:{
        type:'textarea',
        autosize:{
          "minRows":8
        }
      }
    }
  ]
])
const albumListRef=ref();
const handleShowAlbum=()=>{
  albumListRef.value && albumListRef.value.showDrawer();
}

const formRef = ref();
const handleConfirm=()=>{
  formRef.value && formRef.value.formRef.validate(async (e)=>{
    if(e){
      if(!isUpdate.value){
        let params = {
          alId:formData.value.album.id,
          alia:formData.value.alia,
          arId:formData.value.album.artist.id,
          name:formData.value.name,
          publishTime:formData.value.publishTime
        }
        const res = await createSongApi(params);
        const dt = await getAudioDuration(formData.value.source);
        const f = new FormData();
        f.append("song",formData.value.source);
        f.append("dt",dt);
        await uploadSongApi(res.songId,f);
      }else{
        await updateSongApi({
          ...formData.value,
        })
      }
      ElMessage.success(`歌曲${isUpdate.value ? "更新":'添加'}成功`)
      isShow.value = false;
      emit("success")
    }
  })
}
defineExpose({
  showDrawer
})
</script>



<style scoped lang="scss">

</style>

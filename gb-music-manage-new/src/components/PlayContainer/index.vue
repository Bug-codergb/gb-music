<script setup>
import { ref } from "vue";
import {getSongDetailApi, getSongUrlApi} from "@/api/modules/song"
const isShow = ref(false);

const title = ref("")
const url = ref("")
const song = ref({album:{}});
const showDialog=async (id)=>{
  isShow.value = true;
  try{
    const res = await getSongDetailApi({id});
    song.value = res;
    title.value = res.name ||""
    const ret = await getSongUrlApi({id})
    url.value = ret.mp3Url;
  }catch (e) {
    song.value = {};
  }
}
defineExpose({
  showDialog
})
</script>

<template>
  <el-dialog :title="title" width="40%" v-model="isShow" :destroy-on-close="true">
    <div class="container">
      <el-image :src="song.album?.coverUrl"/>
      <div class="audio-container">
        <audio controls :src="url"></audio>
      </div>
    </div>
  </el-dialog>
</template>

<style scoped lang="scss">
  .container{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .audio-container{
    width: 100%;
    audio{
      width: 100%;
      margin: 20px 0 0 0;
    }
  }
</style>

<script setup>
import {ref,reactive} from "vue"
import {ElMessage} from "element-plus"
import { getPlaylistCateApi , batchSetPlaylistCateApi} from "@/api/modules/playlist"
import ProDrawer from "@/components/ProDrawer/index.vue"
const isShow = ref(false);
const playlist = ref({});

const emit = defineEmits(['success']);
const showDrawer=async (data)=>{
  isShow.value = true;
  playlist.value = data||{};
  await getPlaylistCate();
  selectList.value = data && data.category ? data.category.map((item)=>item.id):[]
}

const cateList = ref([])
const getPlaylistCate=async()=>{
  try{
    const res = await getPlaylistCateApi({
      offset:0,
      limit:2000
    })
    cateList.value = res;
  }catch (e) {

  }
}
const selectList = ref([])
const handleConfirm=async ()=>{
  const res = await batchSetPlaylistCateApi({
    pId:playlist.value.id,
    cateIds:selectList.value
  })
  ElMessage.success("设置成功")
  isShow.value = false;
  emit("success")
}
defineExpose({
  showDrawer
})
</script>

<template>
  <ProDrawer v-model="isShow" width="660px" title="设置歌单分类" @confirm="handleConfirm">
    <el-transfer :titles="['歌单分类','已选择分类']" v-model="selectList" :props="{
      key: 'id',
      label: 'name',
    }" :data="cateList" />
  </ProDrawer>
</template>

<style scoped lang="scss">

</style>

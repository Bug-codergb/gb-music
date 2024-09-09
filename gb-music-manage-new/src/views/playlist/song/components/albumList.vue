<script setup>
import {ref} from "vue"
import {ElMessage} from "element-plus"
import ProDrawer from "@/components/ProDrawer/index.vue"
import Album from "@/views/album/components/album/index.vue"
const emit= defineEmits(['select'])
const isShow =ref(false);
const showDrawer =()=>{
  isShow.value = true
}
const albumRef = ref()
const handleConfirm=()=>{
  const tableRef = albumRef.value && albumRef.value.tableRef;
  const rows = tableRef.getSelectionRows();
  if(!rows || rows.length===0){
    ElMessage.warning("请选择专辑");
    return;
  }
  emit("select",rows[0])
  isShow.value = false;
}
defineExpose({
  showDrawer
})
</script>

<template>
  <div>
    <ProDrawer v-model="isShow" title="选择专辑" width="80%" @confirm="handleConfirm">
      <Album ref="albumRef" :is-song-page="true"/>
    </ProDrawer>
  </div>
</template>

<style scoped lang="scss">

</style>

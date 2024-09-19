<template>
  <div class="card table-box">
    <el-tabs v-model="activeName">
      <el-tab-pane label="MV" name="first">
        <MVList/>
      </el-tab-pane>
      <el-tab-pane label="MV分类" name="second">
        <MVCate/>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script setup>
import {ref} from "vue";
import MVList from "./components/mvList/index.vue";
import MVCate from "./components/mvCate/index.vue"
const activeName=ref("first")
</script>

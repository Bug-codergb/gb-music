<template>
  <div class="table-box">
    <ProTable :columns="columns" :pagination="true" />
  </div>
</template>
<script setup>
import { reactive } from "vue";

import ProTable from "@/components/ProTable/index.vue";
const columns = reactive([
  {
    label: "名称",
    prop: "name",
    isShow: true
  },
  {
    label: "头像",
    prop: "avatar",
    isShow: true
  },
  {
    label: "语种",
    prop: "name",
    isShow: true
  },
  {
    label: "类型",
    prop: "avatar",
    isShow: true
  },
  {
    label: "专辑数",
    prop: "name",
    isShow: true
  },
  {
    label: "歌曲数",
    prop: "avatar",
    isShow: true
  }
]);
</script>

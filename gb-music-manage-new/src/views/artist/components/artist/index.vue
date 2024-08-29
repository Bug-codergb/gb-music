<template>
  <div class="table-box">
    <ProTable :columns="columns" :pagination="true">
      <template #tableHeader>
        <el-form inline>
          <el-form-item>
            <el-input v-model="searchParam.keyword" placeholder="请输入歌手名称" />
          </el-form-item>
        </el-form>
      </template>
      <template #toolButton>
        <el-button type="primary">添加歌手</el-button>
      </template>
    </ProTable>
    <CreateArtist />
  </div>
</template>
<script setup>
import { reactive } from "vue";
import CreateArtist from "./components/createArtist.vue";
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

const searchParam = reactive({
  keyword: ""
});
</script>
import createArtistVue from "./components/createArtist.vue";

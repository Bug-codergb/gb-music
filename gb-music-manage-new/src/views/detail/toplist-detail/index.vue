<script setup lang="jsx">
import { getToplistDetailApi } from "@/api/modules/toplist"
import moment from "moment";
import {reactive, ref} from "vue";
import { useRoute } from "vue-router";
import ProTable from "@/components/ProTable/index.vue";
import PlayContainer from "@/components/PlayContainer/index.vue";
const route = useRoute();
const id = ref(route.params.id);
const toplist = ref({});

getToplistDetailApi({id:id.value}).then((res)=>{
  toplist.value  =res;
})
const columns = reactive([
  {
    label:"序号",
    type:"index",
    isShow: true,
    width: 80,
  },
  {
    label: "名称",
    prop: "name",
    isShow: true,
    render:(scope)=>{
      return <el-tooltbip content={scope.row.name} show-after={500}>
        <el-link type="primary" onClick={()=>handlePlay(scope.row)}>
          <span class="mle">{scope.row.name}</span>
        </el-link>
      </el-tooltbip>
    }
  },
  {
    label: "歌手",
    prop: "artist",
    isShow: true,
    render: scope => {
      return <span>{scope.row.artist.name}</span>;
    }
  },
  {
    label: "专辑",
    prop: "album",
    isShow: true,
    render: scope => {
      return <span>{scope.row.album.name}</span>;
    }
  },
  {
    label: "时长",
    prop: "duration",
    isShow: true,
    render: scope => {
      return (
        <span>{moment(scope.row.duration).format("mm:ss")}</span>
      );
    }
  },
  {
    label: "是否为vip",
    prop: "vip",
    isShow: true,
    render: scope => {
      return <span>{scope.row.vip === 0 ? "否" : "是"}</span>;
    }
  }
]);
const playContainerRef = ref();
const handlePlay=(item)=>{
  playContainerRef.value && playContainerRef.value.showDialog(item.id)
}
</script>

<template>
  <div class="table-box">
    <div class="card header-info">
      <el-descriptions border :column="3">
        <el-descriptions-item label="名称">{{toplist.name}}</el-descriptions-item>
        <el-descriptions-item label="创建人">
          <el-space v-if="toplist.user">
            <el-avatar :src="toplist.user.avatarUrl"></el-avatar>
            <span>{{toplist.user.userName}}</span>
          </el-space>
        </el-descriptions-item>
        <el-descriptions-item label="播放量">{{toplist.playCount}}</el-descriptions-item>
        <el-descriptions-item label="创建时间">{{ moment(toplist.createTime).format("yyyy-MM-DD HH:mm")}}</el-descriptions-item>
        <el-descriptions-item label="简介" :span="2">{{ toplist.description}}</el-descriptions-item>
      </el-descriptions>
    </div>
    <div class="table-box body">
      <ProTable
        :columns="columns"
        :pagination="false"
        :requestAuto="false"
        :data="toplist.songs"
      />
    </div>
    <PlayContainer ref="playContainerRef" />
  </div>
</template>

<style scoped lang="scss">
.header-info{
  margin: 0 0 12px 0;
}
.body {
  overflow: hidden;
}
</style>

<template>
  <div class="table-box">
    <div class="header-info card">
      <el-row :gutter="1">
        <el-col :span="3">
          <el-descriptions :column="2" border class="g-el-descriptions">
            <el-descriptions-item label="" label-width="0" :span="2" label-class-name="g-playlist-desc-label">
              <el-image
                :src="playlist.coverUrl"
                style="width: 100%;height:100%"
                fit="contain"
              />
            </el-descriptions-item>
          </el-descriptions>
        </el-col>
        <el-col :span="21">
          <el-descriptions :column="3" border class="g-el-descriptions">
            <el-descriptions-item label="名称">{{
              playlist.name
            }}</el-descriptions-item>
            <el-descriptions-item label="创建人">
              <el-space>
                <el-avatar :src="playlist.user?.avatarUrl" />
                <span>{{ playlist.user?.userName }}</span>
              </el-space>
            </el-descriptions-item>
            <el-descriptions-item label="创建时间">
              {{
                moment(playlist.createTime).format("yyyy-MM-DD HH:mm")
              }}
            </el-descriptions-item>
            <el-descriptions-item label="简介">{{
              playlist.description
            }}</el-descriptions-item>

            <el-descriptions-item label="播放量">{{
              playlist.playCount
            }}</el-descriptions-item>
            <el-descriptions-item label="分类">
              {{
                playlist?.category?.map(item => item.name).join(" / ")
              }}
            </el-descriptions-item>
          </el-descriptions>
        </el-col>
      </el-row>
    </div>
    <div class="body table-box">
      <ProTable
        :columns="columns"
        :pagination="false"
        :requestAuto="false"
        :data="playlist.songs"
      />
    </div>
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import ProTable from "@/components/ProTable/index";
import { getPlaylistDetailApi } from "@/api/modules/playlist";
import { useRoute } from "vue-router";
import moment from "moment";

const playlist = ref({});
const route = useRoute();
getPlaylistDetailApi({ id: route.params.id }).then(res => {
  playlist.value = res;
});
const columns = reactive([
  {
    label: "名称",
    prop: "name",
    isShow: true
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
</script>
<style scoped lang="scss">
.header-info {
  margin: 0 0 12px 0;
}
.body {
  overflow: hidden;
}

</style>
<style lang="scss">
.g-playlist-desc-label{
  display: none;
}
.g-el-descriptions{
    height: 100%;
    .el-descriptions__body{
        height: 100%;
        .el-descriptions__table{
            height: 100%
        }
    }
}
</style>

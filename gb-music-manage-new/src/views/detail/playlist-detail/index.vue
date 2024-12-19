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
    <PlayContainer ref="playContainerRef" />
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import ProTable from "@/components/ProTable/index";
import { getPlaylistDetailApi } from "@/api/modules/playlist";
import { useRoute,useRouter } from "vue-router";
import moment from "moment";
import PlayContainer from "@/components/PlayContainer/index.vue";

const playlist = ref({});
const route = useRoute();
const router = useRouter();
getPlaylistDetailApi({ id: route.params.id }).then(res => {
  playlist.value = res;
});
const columns = reactive([
  {
    label: "名称",
    prop: "name",
    isShow: true,
    render:scope=>{
      return <el-space>
        <el-tooltip content={scope.row.name} placement="top" show-after={500}>
          <el-link type="primary" onClick={()=>handlePlay(scope.row)}>
            <span class="mle">{scope.row.name}</span>
          </el-link>
          </el-tooltip>
        {scope.row.video && scope.row.video.id && <div className="g-mv-container" onClick={()=>handleRouterVideo(scope.row)}>MV</div>}

      </el-space>
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
const handleRouterVideo = (item) => {
  router.push({
    path:"/video/"+item.video.id,
  })
}
const playContainerRef = ref();
const handlePlay=(item)=>{
  playContainerRef.value && playContainerRef.value.showDialog(item.id)
}
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
.g-mv-container{
  border: 2px solid #ec4141!important;
  color:#ec4141;
  line-height:12px;
  font-size: 12px;
  padding: 2px 5px;
  border-radius: 4px;
  font-weight: bolder;
  margin: 0 0 0 4px;
  transform: scale(0.85);
  cursor:pointer;
}
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

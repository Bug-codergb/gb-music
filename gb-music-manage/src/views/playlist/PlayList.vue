<template>
  <div class="play-list">
    <div class="left-content">
      <list @change-all="changeAll" :key="keyIndex" />
    </div>
    <div class="right-content">
      <add-msg title="添加歌单" @add-content="addPlaylist">
        <i class="iconfont icon-music-albums icon" slot="icon"></i>
      </add-msg>
      <PlaylistCate />
    </div>
  </div>
</template>

<script>
import AddMsg from '../../components/common/addMsg/AddMsg';
import List from './childCpn/list/List';
import PlaylistCate from '@/views/playlist/childCpn/playlistCate/PlaylistCate';
export default {
  name: 'PlayList',
  components: { PlaylistCate, List, AddMsg },
  data() {
    return {
      keyIndex: 0
    };
  },
  methods: {
    addPlaylist() {},
    changeAll() {
      this.keyIndex += 1;
    }
  }
};
</script>

<style scoped lang="less">
.play-list {
  display: flex;
  width: 100%;
  background-color: #fff;
}
.left-content {
  height: 90vh;
  width: 80%;
  position: relative;
  border: 1px solid #e0e0e0;
  overflow-y: scroll;
  overflow-x: hidden;
  &::-webkit-scrollbar {
    width: 1px;
  }
}
.right-content {
  width: 20%;
  text-align: center;
  padding: 20px 10px;
  height: 90vh;
  overflow-y: scroll;
  .icon {
    font-size: 30px;
  }
}
</style>

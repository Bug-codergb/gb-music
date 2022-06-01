<template>
  <div class="artist">
    <div class="left-content">
      <artist-list />
      <add-artist @cancel="cancel" v-if="isShow" />
    </div>
    <div class="right-content">
      <div class="avatar-outer">
        <i class="iconfont icon-ttpodicon"></i>
      </div>
      <div class="add-artist" @click="addArtist">添加歌手</div>
      <cate-type />
    </div>
  </div>
</template>

<script>
import AddArtist from './childCpn/addArtist/AddArtist';
import ArtistList from './childCpn/artistList/ArtistList';
import CateType from '@/views/artist/childCpn/cateType/CateType';
export default {
  name: 'Artist',
  components: { CateType, ArtistList, AddArtist },
  data() {
    return {
      isShow: false
    };
  },
  methods: {
    cancel() {
      this.isShow = false;
    },
    addArtist() {
      this.isShow = true;
    }
  }
};
</script>

<style scoped lang="less">
.artist {
  position: relative;
  display: flex;
  background-color: #fff;
  .left-content {
    height: 81vh;
    overflow-y: scroll;
    width: 75%;
    border: 1px solid #e0e0e0;
    &::-webkit-scrollbar {
      width: 2px;
    }
  }
  .right-content {
    height: 100%;
    width: 25%;
    text-align: center;
    padding: 0 10px;
    .avatar-outer {
      width: 80px;
      height: 80px;
      background-color: #ec4141;
      margin: 5px auto 15px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 50%;
      opacity: 0.4;
      i {
        font-size: 40px;
        color: #fff;
      }
    }
    .add-artist {
      padding: 8px 20px;
      background-color: #f27a7a;
      color: #fff;
      font-size: 14px;
      border-radius: 3px;
      width: 70%;
      margin: 0 auto;
    }
  }
}
</style>

<template>
  <div class="artist-detail">
    <div class="head">
      <div class="img-container">
        <img :src="artistDetail.avatarUrl" :alt="artistDetail.name" />
      </div>
      <div class="right-msg">
        <div class="artist-name">
          {{ artistDetail.name }}
        </div>
        <div class="desc">
          <span>简介:</span>
          <span>{{ artistDetail.description }}</span>
        </div>
        <div class="cate">
          <span>分类：</span>
          <span>{{ artistDetail.category.name }}</span>
        </div>
      </div>
    </div>
    <div class="body-content">
      <TabControl :list="['ta的歌曲', 'ta的专辑', 'ta的mv']">
        <template v-slot:0>
          <SongList :id="id" />
        </template>
        <template v-slot:1>
          <AlbumList :id="id" />
        </template>
        <template v-slot:2>
          <MvList :id="id" />
        </template>
      </TabControl>
    </div>
  </div>
</template>

<script>
import { getArtistDetail } from '@/network/artist';
import TabControl from '@/components/common/tabControl/TabControl';
import AlbumList from '@/components/content/detail/artistDetail/childCpn/albumList/AlbumList';
import SongList from '@/components/content/detail/artistDetail/childCpn/songList/SongList';
import MvList from '@/components/content/detail/artistDetail/childCpn/MvList/MvList';

export default {
  name: 'ArtistDetail',
  components: { MvList, SongList, AlbumList, TabControl },
  data() {
    return {
      id: '',
      artistDetail: {}
    };
  },
  created() {
    this.id = this.$route.query.id;
    getArtistDetail(this.id).then((data) => {
      this.artistDetail = data;
      console.log(this.artistDetail);
    });
  }
};
</script>

<style scoped lang="less">
.artist-detail {
  background-color: #fff;
  padding: 20px;
  .head {
    display: flex;
    align-items: flex-start;
    margin: 0 0 15px 0;
    .img-container {
      width: 170px;
      overflow: hidden;
      border-radius: 4px;
      img {
        width: 170px;
      }
    }
    .right-msg {
      margin: 0 0 0 20px;
      width: 70%;
      .desc {
        margin: 20px 0 0 0;
        line-height: 22px;
        & > span {
          &:nth-child(1) {
            color: #9b9b9b;
          }
          &:nth-child(2) {
            color: #656565;
          }
        }
      }
      .cate {
        margin: 15px 0 0 0;
        & > span {
          &:nth-child(2) {
            color: #0077aa;
            margin: 0 0 0 4px;
          }
        }
      }
    }
    .artist-name {
      font-weight: bolder;
      font-size: 20px;
    }
  }
}
</style>

<template>
  <div class="album-list">
    <ul>
      <li v-for="(item, index) in albums" :key="item.id">
        <div class="img-container">
          <img :src="item.coverUrl" :alt="item.name" />
        </div>
        <div class="album-name">
          {{ item.name }}
        </div>
      </li>
    </ul>
    <div v-if="albums.length === 0">
      <el-empty description="暂无专辑"></el-empty>
    </div>
  </div>
</template>

<script>
import { getArtistAlbum } from '@/network/artist';

export default {
  name: 'AlbumList',
  data() {
    return {
      albums: [],
      count: 0
    };
  },
  props: {
    id: {
      type: String,
      default: ''
    }
  },
  created() {
    getArtistAlbum(this.id, 0, 10).then((data) => {
      const { count, albums } = data;
      this.count = count;
      this.albums = albums;
    });
  }
};
</script>

<style scoped lang="less">
.album-list {
  & > ul {
    display: grid;
    grid-template-columns: repeat(auto-fill, 170px);
    & > li {
      .img-container {
        width: 140px;
        img {
          width: 100%;
          border-radius: 4px;
        }
      }
      .album-name {
        margin: 10px 0 0 0;
      }
    }
  }
}
</style>

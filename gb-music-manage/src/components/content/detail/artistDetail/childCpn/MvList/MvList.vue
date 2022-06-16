<template>
  <div class="mv-list">
    <ul>
      <li v-for="(item, index) in mv">
        <div class="img-container">
          <img :src="item.coverUrl" :alt="item.name" />
        </div>
        <div class="name">{{ item.name }}</div>
      </li>
    </ul>
    <div v-if="mv.length === 0">
      <el-empty description="暂无MV"></el-empty>
    </div>
  </div>
</template>

<script>
import { getArtistMV } from '@/network/song';

export default {
  name: 'MvList',
  data() {
    return {
      mv: []
    };
  },
  props: {
    id: {
      type: String,
      default: ''
    }
  },
  created() {
    getArtistMV(this.id).then((data) => {
      this.mv = data;
    });
  }
};
</script>

<style scoped lang="less">
.mv-list {
  & > ul {
    display: grid;
    grid-template-columns: repeat(auto-fill, 200px);
    & > li {
      .img-container {
        width: 180px;
        background-color: #9b9b9b;
        border-radius: 4px;
        overflow: hidden;
        height: 113px;
        img {
          width: 100%;
          vertical-align: top;
        }
      }
      .name {
        margin: 5px 0 0 0;
        color: #656565;
        cursor: pointer;
      }
    }
  }
}
</style>

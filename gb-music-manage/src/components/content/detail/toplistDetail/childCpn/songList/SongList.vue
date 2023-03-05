<template>
  <div class="songs">
    <ul>
      <li v-for="(item, index) in songs" :key="item.id">
        <div class="index">{{ (index + 1).toString().padStart(2, '0') }}</div>
        <div class="name">{{ item.name }}</div>
        <div class="artist-name text-nowrap" @click="artistRouter(item)">{{ item.artist.name }}</div>
        <div class="album-name text-nowrap" @click="alumRouter(item)">{{ item.album.name }}</div>
        <div class="dt">
          {{ formDate(item.duration,"mm:ss") }}
        </div>
        <div class="remove">
          <button @click="remove(item, index)">移除</button>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>

import { removeSong } from '@/network/toplist';
import {formatTime} from "@/utils/format"
export default {
  name: 'SongList',
  props: {
    songs: {
      type: Array,
      default() {
        return [];
      }
    },
    tId: {
      type: String,
      default: ''
    }
  },
  methods: {
    remove(item, index) {
      const flag = confirm('确定要删除吗?');
      if (flag) {
        removeSong(this.tId, item.id).then((data) => {
          this.$delete(this.songs, index);
        });
      }
    },
    formDate(time,fm){
      return formatTime(time,fm);
    },
    artistRouter(item){
      this.$router.push({
        path:"/Home/artistDetail",
        query:{
          id:item.artist.id
        }
      })
    },
    alumRouter(item){
      this.$router.push({
        path:"/Home/album/detail",
        query:{
          albumId:item.album.id
        }
      })
    }
  }
};
</script>

<style scoped lang="less">
.songs {
  & > ul {
    li {
      display: flex;
      align-items: center;
      padding: 10px 0;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .index {
        padding: 0 10px;
        color: #cacad9;
      }
      .name {
        color: #0077aa;
        width: 20%;
        margin: 0 0 0 15px;
      }
      .artist-name,
      .album-name {
        width: 15%;
        color: #656565;
        margin: 0 15px 0 0;
      }
      .dt {
        color: #9b9b9b;
        width: 15%;
      }
      .remove {
        button {
          background-color: #a0cfff;
          color: #fff;
          font-size: 13px;
          padding: 4px 15px;
          cursor: pointer;
        }
      }
    }
  }
}
</style>

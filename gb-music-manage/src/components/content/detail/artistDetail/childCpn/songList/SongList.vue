<template>
  <div class="song-list">
    <ul>
      <li v-for="(item, index) in songs" :key="item.id">
        <div class="index">{{ (index + 1).toString().padStart(2, '0') }}</div>
        <div class="name text-nowrap">{{ item.name }}</div>
        <div class="album-name text-nowrap" @click="albumRouter(item)">{{ item.album.name }}</div>
        <div class="dt">{{ formatDate(item.duration, 'mm:ss') }}</div>
        <label>
          <select class="is-vip" @change="vipChange($event, item)">
            <option :value="1" :selected="item.vip === 1">会员</option>
            <option :value="0" :selected="item.vip === 0">非会员</option>
          </select>
        </label>
        <div class="del" @click="delSong(item, index)">删除</div>
      </li>
    </ul>
    <div class="page" v-if="count > 10">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="count"
        :page-size="10"
        @current-change="pageChange"
      >
      </el-pagination>
    </div>
    <div v-if="songs.length === 0">
      <el-empty description="暂无歌曲"></el-empty>
    </div>
  </div>
</template>

<script>
import { getArtistSong } from '@/network/artist';
import { formatTime } from '@/utils/format';
import { deleteSong, updateSongVip } from '@/network/song';

export default {
  name: 'SongList',
  data() {
    return {
      count: 0,
      songs: []
    };
  },
  props: {
    id: {
      type: String,
      default: ''
    }
  },
  created() {
    getArtistSong(this.id, 0, 10).then((data) => {
      this.count = data.count;
      this.songs = data.songs;
    });
  },
  methods: {
    formatDate(time, fm) {
      return formatTime(time, fm);
    },
    vipChange(e, item) {
      updateSongVip(item.id, e.currentTarget.value).then((data) => {
        this.$toast.show('更新成功', 1500);
      });
    },
    pageChange(e) {
      getArtistSong(this.id, (e - 1) * 10, 10).then((data) => {
        this.count = data.count;
        this.songs = data.songs;
      });
    },
    delSong(item, index) {
      this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then((data) => {
          deleteSong(item.id).then((data) => {
            console.log(data);
            this.$delete(this.songs, index);
          });
        })
        .catch((err) => {});
    },
    albumRouter(item){
      this.$router.push({
        path:"/Home/album/detail",
        query:{
          albumId:item.album.id
        }
      });
    }
  }
};
</script>

<style scoped lang="less">
.song-list {
  & > ul {
    & > li {
      display: flex;
      align-items: center;
      padding: 10px 5px;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .index {
        width: 3%;
        font-size: 13px;
        color: #d3d2d9;
      }
      .name {
        width: 20%;
        color: #0086b3;
      }
      .album-name {
        width: 20%;
        color: #656565;
        cursor: pointer;
      }
      .dt {
        color: #9b9b9b;
        font-size: 13px;
        width: 20%;
      }
      .is-vip {
        outline: none;
        border: 1px solid #f56c6c;
        font-size: 13px;
        padding: 2px 5px;
        margin: 0 50px 0 0;
      }
      .del {
        background-color: #f56c6c;
        color: #fff;
        font-size: 13px;
        padding: 3px 15px;
        border-radius: 4px;
        cursor: pointer;
      }
    }
  }
}
.page {
  display: flex;
  justify-content: center;
  padding: 20px 0;
}
</style>

<template>
  <div class="list">
    <div class="header-controller">
      <el-input
        placeholder="请输入歌单名称"
        suffix-icon="el-icon-search"
        v-model="keyword"
        style="width: 214px; margin: 0 30px 0 0"
        @input="searchInp"
      >
      </el-input>
      <!--      <el-select v-model="playlistCate"
                 placeholder="请选择歌单类型"
                 @change="cateChange">
        <el-option
            v-for="item in cate"
            :key="item.id"
            :label="item.name"
            :value="item.id">
        </el-option>
      </el-select>-->
    </div>
    <ul>
      <li v-for="(item, index) in playlist" :key="item.id">
        <div class="index">{{ (index + 1).toString().padStart(2, '0') }}</div>
        <div class="img-container"
             v-lazy-container="{
               selector:'img',
               loading:require('../../../../assets/img/holder/music-placeholder.png'),
               error:require('../../../../assets/img/holder/music-placeholder.png')
               }">
          <img :data-src="item.coverUrl" alt="cover" />
        </div>
        <div class="name text-nowrap">{{ item.name }}</div>
        <div class="desc text-nowrap">{{ item.description }}</div>
        <div class="user-name text-nowrap">{{ item.user ? item.user.userName : '' }}</div>
        <div class="create-time">{{ formatTime(item.createTime, 'yyyy-MM-dd') }}</div>
        <button @click="setCate(item, index)" class="cate-btn">分类</button>
        <!--删除歌单-->
        <button class="del-btn" @click="delPlaylist(item, index)">删除</button>
        <button class="del-btn" @click="editPlaylist(item, index)">编辑</button>
      </li>
    </ul>
    <div class="empty" v-if="playlist.length === 0">
      <el-empty description="暂无歌单"></el-empty>
    </div>
    <!--当前分类-->
    <div class="cate-list" v-show="isShow">
      <div class="exit">
        <i class="iconfont icon-dacha" @click="exit"></i>
      </div>
      <p>当前分类</p>
      <ul class="current-cate">
        <li v-for="(item, index) in currentCate" :key="item.id">{{ item.name }}</li>
      </ul>
      <p>全部分类</p>
      <ul class="all-cate">
        <li v-for="(it, i) in cate" :key="it.id" @click="selectCate(it, i)">
          {{ it.name }}
        </li>
      </ul>
    </div>
    <div class="page" v-if="count > 8">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="count"
        :page-size="8"
        @current-change="change"
      >
      </el-pagination>
    </div>
    <el-drawer
      :direction="direction"
      :visible.sync="drawer"
      :destroy-on-close="true"
      :show-close="false"
    >
      <template v-slot:title>
        <div class="title-control">
          <div class="title">编辑歌单</div>
          <div class="define" @click="defineEdit">确定</div>
        </div>
      </template>
      <edit-playlist v-if="drawer" :playlist="playlistItem" ref="playlistEdit" />
    </el-drawer>
  </div>
</template>
<script>
import {
  addCateForPlay,
  delPlaylist,
  getAllPlaylist,
  getPlaylistCate,
  updatePlaylist
} from '@/network/playlist';
import { formatTime } from '@/utils/format';
import { getAllSong } from '@/network/song';
import { debounce } from '@/utils/debounce';
import EditPlaylist from '@/views/playlist/childCpn/editPlaylist/EditPlaylist';

export default {
  name: 'List',
  components: { EditPlaylist },
  data() {
    return {
      direction: 'rtl',
      playlist: [],
      cate: [],
      cateId: '',
      isShow: false,
      currentCate: [], //当前分类
      currentPlaylist: '',
      count: 0,
      keyword: '',
      playlistCate: '',
      drawer: false,
      playlistItem: {}
    };
  },
  created() {
    getAllPlaylist(0, 8, this.keyword).then((data) => {
      this.playlist = data.playlists;
      this.count = data.count;
    });
    getPlaylistCate(0, 30).then((data) => {
      this.cate = data;
    });
  },
  methods: {
    formatTime(time, ft) {
      return formatTime(time, ft);
    },
    setCate(item, index) {
      this.currentPlaylist = item.id;
      this.isShow = true;
      this.currentCate = item.category;
    },
    selectCate(item, i) {
      addCateForPlay(this.currentPlaylist, item.id).then((data) => {
        getAllPlaylist(0, 10).then((data) => {
          this.playlist = data;
          this.count = data.count;
          this.$emit('change-all');
        });
      });
    },
    delPlaylist(item, index) {
      const flag = confirm('确认永久删除?');
      if (flag) {
        delPlaylist(item.id).then((data) => {
          if (data) {
            this.$delete(this.playlist, index);
            this.$toast.show('删除成功');
          }
        });
      }
    },
    editPlaylist(item, index) {
      this.playlistItem = item;
      this.drawer = true;
    },
    defineEdit() {
      if (this.$refs.playlistEdit) {
        const { name, desc, cate } = this.$refs.playlistEdit.form;
        updatePlaylist(this.playlistItem.id, name, desc, cate).then((data) => {
          getAllPlaylist(0, 8, this.keyword).then((data) => {
            this.playlist = data.playlists;
            this.count = data.count;
          });
          this.drawer = false;
          this.$message({
            message: '更新成功',
            type: 'success'
          });
        });
      }
    },
    change(page) {
      getAllPlaylist((page - 1) * 8, 8, this.keyword).then((data) => {
        this.playlist = data.playlists;
        this.count = data.count;
      });
    },
    exit(index) {
      this.isShow = false;
    },
    searchInp: debounce(
      function () {
        getAllPlaylist(0, 8, this.keyword).then((data) => {
          this.playlist = data.playlists;
          this.count = data.count;
        });
      },
      1000,
      false
    ),
    cateChange() {
      getAllPlaylist(0, 8, this.keyword).then((data) => {
        this.playlist = data.playlists;
        this.count = data.count;
      });
    }
  }
};
</script>

<style scoped lang="less">
.header-controller {
  display: flex;
  align-items: center;
  padding: 20px 0 15px 10px;
  border-bottom: 1px solid #dcdfe6;
}
.list {
  width: 100%;
  ul {
    li {
      display: flex;
      align-items: center;
      padding: 10px 0;
      position: relative;
      &:nth-child(even) {
        background-color: #f9f9f9;
      }
      .img-container {
        width: 45px;
        height: 45px;
        overflow: hidden;
        background-color: #373737;
        border-radius: 4px;
        img {
          height: 100%;
        }
      }
      .index {
        padding: 0 10px;
        font-size: 12px;
        color: #656565;
      }
      .name {
        font-size: 13px;
        width: 20%;
        margin: 0 0 0 20px;
        color: #656565;
      }
      .desc {
        font-size: 13px;
        width: 15%;
        color: #656565;
      }
      .user-name {
        font-size: 12px;
        width: 15%;
        color: #656565;
      }
      .create-time {
        font-size: 12px;
        width: 15%;
        color: #656565;
      }
      .cate-btn {
        background-color: #f56c6c;
        color: #fff;
        font-size: 12px;
        padding: 5px 15px;
        border-radius: 4px;
      }
      .del-btn {
        background-color: #f56c6c;
        color: #fff;
        padding: 5px 15px;
        font-size: 12px;
        border-radius: 4px;
        cursor: pointer;
        margin: 0 0 0 20px;
      }
    }
  }
  .cate-list {
    position: absolute;
    border-radius: 5px;
    z-index: 99999;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    padding: 30px;
    p {
      font-size: 13px;
      margin: 10px 0;
    }
    .current-cate,
    .all-cate {
      display: flex;
      align-items: center;
      flex-wrap: wrap;
      li {
        background-color: #ec4141;
        color: #fff;
        padding: 5px 15px;
        font-size: 12px;
        margin: 0 10px 10px 0;
        border-radius: 4px;
        cursor: pointer;
      }
    }
  }
  .page {
    display: flex;
    justify-content: center;
    padding: 15px 0;
  }
}
.empty {
  padding: 100px 0 0 0;
}
</style>

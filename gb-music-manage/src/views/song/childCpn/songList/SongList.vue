<template>
  <div class="song-list">
    <p class="title">全部歌曲({{ songList.count }})</p>
    <ul>
      <li v-for="(item, index) of songList.songs" :key="item.id" @click="lClick(item, index)">
        <div class="index">{{ (index + 1).toString().padStart(2, '0') }}</div>
        <div class="name text-nowrap" :title="item.name">{{ item.name }}</div>
        <div class="album text-nowrap" :title="item.name">{{ item.album.name }}</div>
        <div class="artist text-nowrap" :title="item.name">{{ item.artist.name }}</div>
        <div class="is-vip">
          <select @change="vipChange($event, item)">
            <option :value="0" :selected="item.vip === 0">非会员</option>
            <option :value="1" :selected="item.vip === 1">会员</option>
          </select>
        </div>
        <div class="control-btn">
          <button class="add-to-toplist add-mv" @click="addMV(item, index)">添加MV</button>
          <button class="add-to-toplist" @click="addLyric(item, index)">上传歌词</button>
          <button class="add-to-toplist edit-delete" @click="edit(item)">编辑</button>
          <button class="add-to-toplist edit-delete" @click="delSong(item)">删除</button>
        </div>
      </li>
    </ul>
    <div class="song-empty" v-if="songList && songList.songs && songList.songs.length === 0">
      <el-empty description="暂无相关歌曲"></el-empty>
    </div>
    <div class="page" v-if="songList && songList.count > 10">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="songList.count"
        :page-size="11"
        @current-change="change"
      >
      </el-pagination>
    </div>
    <div class="toplist" v-show="isShow">
      <ul>
        <li
          v-for="(item, index) in toplist.concat(hotToplist)"
          :key="item.id"
          @click="selectToplist(item, index)"
        >
          <div class="img-container">
            <img :src="item.coverUrl" alt="" />
          </div>
          <div class="state">{{ item.name }}</div>
        </li>
      </ul>
    </div>
    <upload-m-v @define="define" @cancel="cancel" v-if="isShowUpload" />
    <lyric v-if="isShowLyric" @define="defineLyric" @cancel="cancelLyric" :song-id="songId" />
    <el-drawer
      :direction="direction"
      :visible.sync="drawer"
      :destroy-on-close="true"
      :show-close="false"
    >
      <template v-slot:title>
        <div class="title-control">
          <div class="title">编辑歌曲信息</div>
          <div class="define" @click="defineEdit">确定</div>
        </div>
      </template>
      <edit-song v-if="drawer" :song="song" ref="songEdit" />
    </el-drawer>
  </div>
</template>

<script>
import { deleteSong, getAllSong, updateSong, updateSongVip } from "@/network/song";
import { addSongToTop, getHotToplist, getOfficialTop } from '@/network/toplist';
import UploadMV from '@/views/song/childCpn/uploadMV/UploadMV';
import { addVideo, uploadCover, uploadVideo } from '@/network/video';
import Lyric from '@/views/song/childCpn/lyric/Lyric';
import { debounce } from '@/utils/debounce';
import EditSong from '@/views/song/childCpn/editSong/EditSong';

export default {
  name: 'SongList',
  components: { EditSong, Lyric, UploadMV },
  data() {
    return {
      songList: {},
      toplist: [],
      isShow: false,
      songId: '',
      songName: '',
      hotToplist: [],
      isShowUpload: false,
      isShowLyric: false,
      drawer: false,
      direction: 'rtl',
      song: {}
    };
  },
  props: {
    keyword: {
      type: String,
      default: ''
    }
  },
  watch: {
    keyword: {
      handler(newVal, oldVal) {
        const fn = debounce(
          () => {
            getAllSong(0, 11, newVal).then((data) => {
              this.songList = data;
            });
          },
          1000,
          false
        );
        fn();
      }
    }
  },
  created() {
    getAllSong(0, 11, this.keyword).then((data) => {
      console.log(data);
      this.songList = data;
    });
    getOfficialTop().then((data) => {
      this.toplist = data;
    });
    getHotToplist().then((data) => {
      console.log(data);
      this.hotToplist = data;
    });
  },
  methods: {
    addToToplist() {
      this.isShow = !this.isShow;
    },
    vipChange(e, item) {
      updateSongVip(item.id, e.currentTarget.value).then((data) => {
        this.$toast.show('更新成功', 1500);
      });
    },
    selectToplist(item, index) {
      addSongToTop(item.id, this.songId).then((data) => {
        console.log(data);
      });
      this.isShow = false;
    },
    lClick(item, index) {
      this.songId = item.id;
      this.songName = item.name;
    },
    addMV(item, index) {
      this.isShowUpload = true;
      this.song=item;
    },
    addLyric(item, index) {
      this.isShowLyric = true;
      this.songId = item.id;
    },
      define(mv, cover, dt, cateId) {
      if (this.songName && mv && cover && dt) {
        addVideo(this.songName, this.song.name, 1, cateId, this.songId).then((data) => {
          const { id } = data;
          if (id) {
            let mvFormData = new FormData();
            mvFormData.append('video', mv);
            mvFormData.append('dt', dt);
            uploadVideo(mvFormData, id).then((data) => {
              console.log(data);
            });
            let coverFormData = new FormData();
            coverFormData.append('cover', cover);
            uploadCover(coverFormData, id).then((data) => {
              this.isShowUpload = false;
            });
          }
        });
      }
    },
    cancel() {
      this.isShowUpload = false;
    },
    defineLyric() {
      this.isShowLyric = false;
    },
    cancelLyric() {
      this.isShowLyric = false;
    },
    //分页
    change(page) {
      getAllSong((page - 1) * 11, 11, this.keyword).then((data) => {
        this.songList = data;
      });
    },
    edit(item) {
      this.drawer = true;
      this.song = item;
    },
    delSong(item){
      this.$confirm('确定删除该歌曲?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteSong(item.id).then(data=>{
          this.$message({
            type: 'success',
            message: '删除成功!'
          });
        })
      }).catch(() => {

      });
    },
    defineEdit() {
      const { alia, lyric, name, publishTime, vip } = this.$refs.songEdit.form;
      updateSong(this.song.id, name, alia, publishTime, vip, lyric).then((data) => {
        this.drawer = false;
        this.$message({
          message: '修改成功',
          duration: 1500,
          type: 'success'
        });
        getAllSong(0, 11, this.keyword).then((data) => {
          this.songList = data;
        });
      });
    }
  }
};
</script>

<style scoped lang="less">
.title {
  font-weight: bold;
  padding: 5px 0 10px 10px;
  font-size: 14px;
  color: #656565;
  letter-spacing: 2px;
}
.song-list {
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
        color: #cfcfcf;
        font-size: 13px;
      }
      .name {
        width: 18%;
        color: #507db5;
        font-size: 13px;
      }
      .album,
      .artist {
        width: 15%;
        color: #676767;
        font-size: 13px;
      }
      .is-vip {
        width: 15%;
        & > select {
          border: 1px solid #a0cfff;
          font-size: 13px;
          padding: 4px 10px;
          border-radius: 3px;
          color: #656565;
          outline: none;
        }
      }
      .control-btn {
        .add-to-toplist {
          margin: 0 10px 0 0;
          font-size: 12px;
          padding: 5px 15px;
          background-color: #a0cfff;
          color: #fff;
          border-radius: 4px;
        }
        .edit-delete {
          background-color: #a0cfff;
        }
      }
    }
  }
  /*排行榜*/
  .toplist {
    position: absolute;
    padding: 30px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    z-index: 99;
    background-color: #fff;
    top: 10%;
    left: 50%;
    transform: translate(-50%, 0);
    height: 500px;
    overflow-y: scroll;
    li {
      display: flex;
      align-items: center;
      margin: 0 0 5px 0;
      padding: 10px 20px;
      width: 300px;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      &:hover {
        background-color: #f0f1f2;
      }
    }
    .img-container {
      margin: 0 30px 0 0;
      width: 60px;
      height: 60px;
      img {
        width: 100%;
      }
    }
  }
  .page {
    margin: 20px 0 0 0;
    display: flex;
    justify-content: center;
  }
}
.song-empty {
  padding: 100px 0 0 0;
}
</style>

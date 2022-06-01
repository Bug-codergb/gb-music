<template>
  <div class="song">
    <div class="left-content">
      <div class="upload-song">
        <upload
          @titleInp="titleInp"
          @contentInp="contentInp"
          @select-file="change"
          @define="define"
          @cancel="cancel"
          v-show="isShow"
          :artists="artists"
          :albums="allAlbum"
          @select-artist="selectArtist"
          @select-album="selectAlbum"
          show-form="music"
        >
          <span slot="title">名称</span>
          <span slot="desc-name">简介</span>
          <span slot="artistTitle">选择歌手</span>
          <span slot="albumTitle">选择专辑</span>
          <div slot="time" class="album-publish-time">
            <p>选择发布时间</p>
            <el-date-picker
              type="date"
              v-model="publishTime"
              placeholder="选择日期"
              size="small"
              value-format="timestamp"
            >
            </el-date-picker>
          </div>
        </upload>
      </div>
      <div class="search-outer">
        <label>
          <input type="text" placeholder="请输入歌曲名称" v-model.trim="keyword" />
        </label>
        <i class="iconfont icon-search search-icon"></i>
      </div>
      <song-list :keyword="keyword" />
    </div>

    <div class="right-content">
      <add-msg title="添加歌曲" @add-content="addSong">
        <i class="iconfont icon-music add-song-icon" slot="icon"></i>
      </add-msg>
    </div>
  </div>
</template>

<script>
import AddMsg from '../../components/common/addMsg/AddMsg';
import Upload from '../../components/common/upload/Upload';
import { getAllArtist } from '@/network/artist';
import { getAllAlbum } from '@/network/album';
import { addSong, uploadSong } from '../../network/song';
import { getAudioDuration } from '@/utils/songUtils';
import SongList from './childCpn/songList/SongList';
export default {
  name: 'Song',
  components: {
    SongList,
    AddMsg,
    Upload
  },
  data() {
    return {
      title: '',
      alia: '',
      isShow: false,
      artists: [],
      publishTime: '',
      arId: '',
      alId: '',
      song: null,
      allAlbum: [],
      keyword: ''
    };
  },
  created() {
    getAllArtist().then((data) => {
      this.artists = data;
    });
    //获取所有专辑
    getAllAlbum().then((data) => {
      // console.log(data);
      this.allAlbum = data;
    });
  },
  methods: {
    addSong() {
      this.isShow = true;
    },
    titleInp(content) {
      this.title = content;
    },
    contentInp(content) {
      this.alia = content;
    },
    change(file) {
      this.song = file;
    },
    selectArtist(item) {
      this.arId = item.id;
    },
    selectAlbum(item) {
      this.alId = item.id;
    },
    define() {
      if (this.title.trim().length === 0) {
        this.$toast.show('请添加名称', 1500);
      } else if (this.alia.trim().length === 0) {
        this.$toast.show('请添加简介', 1500);
      } else if (this.arId.trim().length === 0) {
        this.$toast.show('请选择歌手', 1500);
      } else if (this.alId.trim().length === 0) {
        this.$toast.show('请选择专辑', 1500);
      } else if (!this.song) {
        this.$toast.show('请选择歌曲', 1500);
      } else if (!this.publishTime) {
        this.$toast.show('请选择歌曲发布时间', 1500);
      } else {
        this.isShow = false;
        addSong(this.title, this.arId, this.alId, this.publishTime, this.alia).then((data) => {
          if (data) {
            const { songId } = data;
            let formData = new FormData();
            formData.append('song', this.song);
            getAudioDuration(this.song).then((data) => {
              if (data) {
                formData.append('dt', data.toString());
                uploadSong(formData, songId).then((data) => {
                  console.log(data);
                });
              }
            });
          }
        });
      }
    },
    cancel() {
      this.isShow = false;
    }
  }
};
</script>

<style scoped lang="less">
.song {
  display: flex;
  flex-wrap: nowrap;
  background-color: #fff;
  .left-content {
    height: 100%;
    width: 80%;
    overflow-y: scroll;
    position: relative;
    border: 1px solid #e0e0e0;
    &::-webkit-scrollbar {
      width: 1px;
    }
    .upload-song {
      position: absolute;
      left: 30%;
      top: 10%;
      overflow: hidden;
      border-radius: 10px;
      box-shadow: 0 0 18px rgba(0, 0, 0, 0.17);
      .album-publish-time {
        p {
          margin: 0 0 10px 0;
        }
      }
    }
    .search-outer {
      padding: 10px 0;
      display: flex;
      justify-content: flex-start;
      position: relative;
      border-bottom: 1px solid #e0e0e0;
      margin: 0 0 0 15px;
      input {
        margin: 0 20px 0 0;
        border: 1px solid #f27a7a;
        padding: 10px 20px;
        border-radius: 4px;
      }
      .search-icon {
        position: absolute;
        left: 20%;
        z-index: 98;
        top: 49%;
        transform: translate(-100%, -50%);
        font-size: 20px;
        color: #f27a7a;
      }
    }
  }
  .right-content {
    height: 100%;
    width: 20%;
    text-align: center;
    padding: 0 20px;
    .add-song-icon {
      font-size: 28px;
    }
  }
}
</style>

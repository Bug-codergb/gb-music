<template>
  <div class="detail-album">
    <div class="header">
      <div class="img-container">
        <img :src="albumDetail.coverUrl" />
      </div>
      <div class="msg">
        <div class="title">{{ albumDetail.name }}</div>
        <div class="artist-msg">
          <div class="avatar">
            <img :src="albumDetail.artist.avatarUrl" />
          </div>
          <div class="artist-name">{{ albumDetail.artist.name }}</div>
        </div>
        <div class="publish-time">
          <span>发行时间:</span>
          <span>{{ formatTime(parseInt(albumDetail.publishTime), 'yyyy-MM-dd') }}</span>
        </div>
        <div class="publish">
          <button @click="uploadSong">上传歌曲</button>
          <div class="upload-song">
            <upload
              show-form="music"
              @titleInp="titleInp"
              @contentInp="contentInp"
              @define="define"
              @cancel="cancel"
              v-if="isShow"
              @select-file="change"
            >
              <span slot="title">名称</span>
              <span slot="desc-name">简介</span>
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
        </div>
      </div>
    </div>

    <div class="content">
      <tab-control :list="['歌曲列表', '专辑详情']">
        <SongList slot="0" :album-detail="albumDetail" />
      </tab-control>
    </div>
  </div>
</template>

<script>
import { getAlbumDetail } from '../../../../network/album';
import { formatTime } from '../../../../utils/format';
import Upload from '../../../common/upload/Upload';
import { addSong, uploadSong } from '../../../../network/song';
import { getAudioDuration } from '../../../../utils/songUtils';
import TabControl from '../../../common/tabControl/TabControl';
import SongList from './childCpn/songList/SongList';
export default {
  name: 'DetailAlbum',
  components: {
    SongList,
    TabControl,
    Upload
  },
  data() {
    return {
      albumDetail: {
        artist: {}
      },
      publishTime: '',
      isShow: false,
      title: '',
      content: '',
      song: null
    };
  },
  created() {
    getAlbumDetail(this.$route.query.albumId).then((data) => {
      this.albumDetail = data;
    });
  },
  methods: {
    formatTime(time, ft) {
      return formatTime(time, ft);
    },
    titleInp(content) {
      this.title = content;
    },
    contentInp(content) {
      this.content = content;
    },
    uploadSong() {
      this.isShow = true;
    },
    change(file) {
      this.song = file;
    },
    define() {
      if (this.title.trim().length === 0) {
        this.$toast.show('歌曲名称不能为空');
      } else if (this.content.trim().length === 0) {
        this.$toast.show('简介不能为空');
      } else if (!this.publishTime) {
        this.$toast.show('请选择发布时间');
      } else if (!this.song) {
        this.$toast.show('请选择歌曲');
      } else {
        addSong(
          this.title,
          this.albumDetail.artist.id,
          this.albumDetail.id,
          this.publishTime,
          this.content
        ).then((data) => {
          if (data) {
            const { songId } = data;
            let formData = new FormData();
            formData.append('song', this.song);
            getAudioDuration(this.song).then((data) => {
              if (data) {
                formData.append('dt', data.toString());
                uploadSong(formData, songId).then((data) => {
                  this.isShow = false;
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
.detail-album {
  background-color: #fff;
  padding: 20px 15px;
  .header {
    display: flex;
    .img-container {
      width: 170px;
      height: 170px;
      img {
        width: 170px;
        border-radius: 5px;
      }
    }
    .msg {
      margin: 0 0 0 30px;
      .title {
        font-size: 26px;
        font-weight: bold;
        color: #373737;
        margin: 0 0 20px 0;
      }
      .artist-msg {
        display: flex;
        align-items: center;
        .avatar {
          width: 25px;
          height: 25px;
          border-radius: 50%;
          overflow: hidden;
          img {
            width: 25px;
          }
        }
        .artist-name {
          color: #507daf;
          font-size: 12px;
          margin: 0 0 0 5px;
        }
      }
    }
    .publish-time {
      margin: 20px 0 0 0;
      span {
        font-size: 13px;
        &:nth-child(1) {
          color: #373737;
          margin: 0 5px 0 0;
        }
        &:nth-child(2) {
          color: #676767;
        }
      }
    }
    .publish {
      margin: 15px 0 0 0;
      position: relative;
      button {
        padding: 5px 15px;
        background-color: #ec4141;
        color: #fff;
        font-size: 13px;
      }
      .upload-song {
        position: absolute;
        top: 0;
        transform: translate(0, -30%);
      }
    }
  }
  .content {
    margin: 20px 0 0 0;
  }
}
</style>

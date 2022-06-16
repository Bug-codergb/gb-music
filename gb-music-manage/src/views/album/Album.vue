<template>
  <div class="album">
    <div class="left-content">
      <div class="upload-album">
        <upload
          :cate-list="albumCate"
          :artists="artists"
          @titleInp="titleInp"
          @contentInp="contentInp"
          @select-file="selectImg"
          @liClick="cateClick"
          @select-artist="selectArtist"
          @cancel="cancel"
          @define="define"
          v-if="isShow"
        >
          <span slot="title">名称</span>
          <span slot="desc-name">简介</span>
          <span slot="upload-name">上传封面</span>
          <span slot="cate">分类</span>
          <span slot="artistTitle">选择歌手</span>
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
      <AlbumList />
    </div>
    <div class="right-content">
      <add-msg title="添加专辑" @add-content="addAlbum">
        <i class="iconfont icon-music-albums icon" slot="icon"></i>
      </add-msg>
      <AddCate />
    </div>
  </div>
</template>

<script>
import Upload from '../../components/common/upload/Upload';
import { addAlbum, getAlbumCate, uploadAlbumCover } from '../../network/album';
import { getAllArtist } from '@/network/artist';
import AddMsg from '../../components/common/addMsg/AddMsg';
import AlbumList from './childCpn/albumList/AlbumList';
import { publishAlbum } from '@/network/message';
import AddCate from '@/views/album/childCpn/addCate/AddCate';
export default {
  name: 'Album',
  components: { AddCate, AlbumList, AddMsg, Upload },
  data() {
    return {
      albumCate: [],
      artists: [],
      title: '',
      content: '',
      arId: '',
      cateId: '',
      cover: null,
      publishTime: '',
      isShow: false
    };
  },
  created() {
    getAlbumCate().then((data) => {
      this.albumCate = data;
    });
    getAllArtist(0, 70000).then((data) => {
      this.artists = data;
    });
  },
  methods: {
    titleInp(content) {
      this.title = content;
    },
    contentInp(content) {
      this.content = content;
    },
    selectImg(file) {
      this.cover = file;
    },
    cateClick(item, index) {
      this.cateId = item.id;
    },
    selectArtist(item, index) {
      this.arId = item.id;
    },
    define() {
      if (this.title.trim().length === 0) {
        this.$toast.show('添加一个名称', 1500);
      } else if (this.content.trim().length === 0) {
        this.$toast.show('添加一些简介', 1500);
      } else if (this.cateId.trim().length === 0) {
        this.$toast.show('请选择分类', 1500);
      } else if (this.arId.trim().length === 0) {
        this.$toast.show('请选择歌手', 1500);
      } else if (!this.cover) {
        this.$toast.show('请选择专辑封面', 1500);
      } else if (!this.publishTime) {
        this.$toast.show('请选择发布日期', 1500);
      } else {
        //添加专辑
        addAlbum(this.title, this.content, this.publishTime, this.arId, this.cateId).then(
          (data) => {
            const { id } = data;
            let formData = new FormData();
            formData.append('album_cover', this.cover);
            uploadAlbumCover(formData, id).then((data) => {
              console.log(data);
              if (data) {
                this.isShow = false;
                this.$toast.show('添加成功', 1500);
              }
            });
            publishAlbum(this.arId, '发布了', id);
          }
        );
      }
    },
    cancel() {
      this.isShow = false;
    },
    addAlbum() {
      this.isShow = true;
    }
  }
};
</script>

<style scoped lang="less">
.album {
  display: flex;
  background-color: #fff;
  .left-content {
    height: 100%;
    width: 80%;
    position: relative;
    border: 1px solid #e0e0e0;
    .upload-album {
      display: flex;
      position: absolute;
      left: 60%;
      top: 0;
      transform: translate(-50%, 0);
      width: 80%;
    }
    .album-publish-time {
      p {
        margin: 0 0 10px 0;
      }
    }
  }
  .right-content {
    height: 100%;
    width: 20%;
    text-align: center;
    padding: 10px 10px 0 10px;
    .icon {
      font-size: 30px;
    }
  }
}
</style>

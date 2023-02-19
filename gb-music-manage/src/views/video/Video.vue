<template>
  <div class="video">
    <div class="left-content">
      <div class="upload-video">
        <upload
          :is-show="isShow"
          :cate-list="cateList"
          @liClick="cateClick"
          @select-file="selectCover"
          @titleInp="titleInp"
          @contentInp="contentInp"
          @define="define"
          @cancel="cancel"
          :key="addKeyIndex"
        >
          <span slot="title">名称:</span>
          <span slot="desc-name">简介:</span>
          <span slot="cate">分类:</span>
          <div class="video-container" slot="vide-content">
            <input type="file" @change="change" v-show="!isShowPreview" />
            <i class="iconfont icon-video" v-show="!isShowPreview"></i>
            <img :src="videoUrl" v-show="isShowPreview" alt="" />
          </div>
        </upload>
      </div>
      <video-list :key="keyIndex"/>
    </div>
    <div class="right-content">
      <add-msg title="添加视频" @add-content="addVideo">
        <i class="iconfont icon-video icon" slot="icon"></i>
      </add-msg>
      <VideoCate />
    </div>
  </div>
</template>

<script>
import AddMsg from '@/components/common/addMsg/AddMsg';
import Upload from '@/components/common/upload/Upload';
import { addVideo, getVideoCate, uploadCover, uploadVideo } from '@/network/video';
import { getVideoBase64, getVideoDuration } from '@/utils/videoUtils';
import VideoList from '@/views/video/childCpn/videoList/VideoList';
import VideoCate from '@/views/video/childCpn/videoCate/VideoCate';
export default {
  name: 'Video',
  components: {
    VideoCate,
    VideoList,
    AddMsg,
    Upload
  },
  data() {
    return {
      cateList: [],
      isShowPreview: false,
      videoUrl: '',
      dt: 0,
      video: null,
      cover: null,
      cateId: '',
      title: '',
      desc: '',
      isShow: false,
      keyIndex:0,
      addKeyIndex:0
    };
  },
  created() {
    getVideoCate(0).then((data) => {
      //console.log(data);
      this.cateList = data;
    });
  },
  methods: {
    addVideo() {
      this.isShow = true;
    },
    //分类
    cateClick(item, index) {
      console.log(item, index);
      this.cateId = item.id;
    },
    //选择视频封面
    selectCover(file) {
      if(file){
        const {type} = file;
        if(!type.includes("image")){
          this.$message({
            message:"请选择图片文件",
            type:"warning"
          })
          return ;
        }
      }
      this.cover = file;
    },
    //选择视频
    change(e) {
      if(e.target.files && e.target.files[0]){
        const {type} = e.target.files[0];
        if(!type.includes("mp4")){
          this.$message({
            message:"请选择MP4视频文件",
            type:"warning"
          })
          return ;
        }
      }
      const url = URL.createObjectURL(e.target.files[0]);
      getVideoBase64(url).then((data) => {
        this.videoUrl = data;
        this.isShowPreview = !this.isShowPreview;
        getVideoDuration(e.target.files[0]).then((data) => {
          this.dt = data;
          this.video = e.target.files[0];
        });
      });
    },
    //设置视频名称
    titleInp(title) {
      this.title = title;
    },
    //设置简介
    contentInp(content) {
      this.desc = content;
    },
    //确定
    define() {
      if (this.title.trim().length === 0) {
        this.$toast.show('请添加名称');
      } else if (this.desc.trim().length === 0) {
        this.$toast.show('请添加简介');
      } else if (!this.video) {
        this.$toast.show('请选择视频');
      } else if (!this.cover) {
        this.$toast.show('请选择视频封面');
      } else if (this.cateId.trim().length === 0) {
        this.$toast.show('请选择视频分类');
      } else {
        //上传视频
        addVideo(this.title, this.desc, 0, this.cateId).then((data) => {
          const { id } = data;
          if (id) {
            let formData = new FormData();
            formData.append('video', this.video);
            formData.append('dt', this.dt);
            uploadVideo(formData, id).then((data) => {

            });
            let coverFormData = new FormData();
            coverFormData.append('cover', this.cover);
            uploadCover(coverFormData, id).then((data) => {

              this.isShow = false;
              this.desc = '';
              this.cateId = '';
              this.video = null;
              this.cover = null;
              this.title = '';
              this.isShowPreview = false;

              this.keyIndex+=1;
              this.addKeyIndex+=1;
            });
          }
        });
      }
    },
    cancel() {
      this.isShow = false;
      this.addKeyIndex+=1;
    }
  }
};
</script>

<style scoped lang="less">
.video {
  display: flex;
  background-color: #fff;
}
.left-content {
  padding: 10px 0;
  height: 100%;
  width: 80%;
  position: relative;
  border: 1px solid #e0e0e0;
  .upload-video {

    .video-container {
      position: relative;
      flex: 1;
      background-color: #f2f2f2;
      border-left: 1px solid #dddddd;
      text-align: center;
      height: 100px;
      line-height: 100px;
      overflow: hidden;
      input {
        position: absolute;
        display: block;
        width: 100%;
        height: 100%;
        opacity: 0;
      }
      i {
        font-size: 30px;
        color: #ea646f;
      }
      img {
        height: 100%;
      }
    }
  }
}
.right-content {
  height: 100%;
  width: 20%;
  text-align: center;
  padding: 20px 10px;
  .icon {
    font-size: 30px;
  }
}
</style>

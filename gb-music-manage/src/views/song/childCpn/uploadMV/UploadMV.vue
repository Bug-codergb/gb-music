<template>
  <div class="upload-mv">
    <div class="mv">
      <div class="mv-source">
        <input type="file" title="选择MV" v-show="!isShowMVPrev" @change="changeMV" />
        <i class="iconfont icon-video" v-show="!isShowMVPrev"></i>
        <img :src="mvURL" alt="" v-show="isShowMVPrev" />
      </div>
      <div class="cover">
        <input type="file" title="选择封面" v-show="!isShowCoverPrev" @change="changeCover" />
        <i class="iconfont icon-tupian" v-show="!isShowCoverPrev"></i>
        <img :src="coverUrl" alt="" v-show="isShowCoverPrev" />
      </div>
    </div>
    <ul class="cate-list">
      <li
        v-for="(item, index) in mvCate"
        :key="item.id"
        :class="{ active: currentIndex === index }"
        @click="liClick(item, index)"
      >
        {{ item.name }}
      </li>
    </ul>
    <div class="control-btn">
      <button @click="define">确定</button>
      <button @click="cancel">取消</button>
    </div>
  </div>
</template>

<script>
import { getVideoBase64, getVideoDuration } from '@/utils/videoUtils';
import { getVideoCate } from '@/network/video';

export default {
  name: 'UploadMV',
  data() {
    return {
      mvURL: '',
      coverUrl: '',
      isShowMVPrev: false,
      isShowCoverPrev: false,
      mv: null,
      cover: null,
      dt: 0,
      cateId: '',
      mvCate: [],
      currentIndex: 0
    };
  },
  created() {
    getVideoCate(1).then((data) => {
      this.cateId = data[0].id;
      this.mvCate = data;
    });
  },
  methods: {
    liClick(item, index) {
      this.currentIndex = index;
      this.cateId = item.id;
    },
    changeMV(e) {
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
      this.mv = e.target.files[0];
      const url = URL.createObjectURL(e.target.files[0]);
      getVideoBase64(url).then((data) => {
        this.mvURL = data;
        this.isShowMVPrev = true;
        getVideoDuration(e.target.files[0]).then((data) => {
          if (data) {
            this.dt = data;
          }
        });
      });
    },
    changeCover(e) {
      if(e.target.files[0]){
        const {type} = e.target.files[0];
        if(!type.includes("image")){
          this.$message({
            message:"请选择图片文件",
            type:"warning"
          })
          return ;
        }
      }
      this.cover = e.target.files[0];
      this.isShowCoverPrev = true;
      this.coverUrl = URL.createObjectURL(e.target.files[0]);
    },
    define() {
      this.$emit('define', this.mv, this.cover, this.dt, this.cateId);
    },
    cancel() {
      this.$emit('cancel');
    }
  }
};
</script>

<style scoped lang="less">
.upload-mv {
  position: fixed;
  z-index: 999;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #fff;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
  padding: 30px;
  width: 500px;
  height: 300px;
  border-radius: 5px;
  .mv {
    height: 60%;
    display: flex;
    align-items: center;
    .mv-source,
    .cover {
      text-align: center;
      line-height: 150px;
      flex: 1;
      background-color: #f2f2f2;
      height: 100%;
      border: 1px dotted #cecece;
      position: relative;
      overflow: hidden;
      img {
        height: 100%;
      }
      input {
        position: absolute;
        display: block;
        opacity: 0;
        width: 100%;
        height: 100%;
      }
      i {
        font-size: 30px;
        color: #ec4141;
      }
    }
  }
  /*分类*/
  .cate-list {
    margin: 10px 0;
    display: flex;
    li {
      margin: 0 15px 0 0;
      background-color: #f7b3b3;
      color: #fff;
      font-size: 13px;
      padding: 5px 15px;
      border-radius: 4px;
      cursor: pointer;
      &.active {
        background-color: #f27a7a;
      }
    }
  }
  .control-btn {
    display: flex;
    justify-content: flex-end;
    button {
      background-color: #ec4141;
      color: #fff;
      padding: 5px 15px;
      font-size: 13px;
      margin: 20px 20px 0 0;
      &:nth-child(2) {
        background-color: #efefef;
        color: #373737;
      }
    }
  }
}
</style>

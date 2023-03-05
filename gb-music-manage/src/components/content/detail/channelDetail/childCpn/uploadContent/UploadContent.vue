<template>
  <div class="upload">
    <div class="name">
      <span>名称:</span>
      <textarea cols="50" rows="2" v-model="content"></textarea>
    </div>
    <div class="desc">
      <span>简介:</span>
      <textarea cols="50" rows="5" v-model="desc"></textarea>
    </div>
    <div class="cover">
      <input type="file" @change="fileChange($event)" v-show="!isShowCover" />
      <i class="iconfont icon-tupian" v-show="!isShowCover"></i>
      <img :src="url" alt="预览" v-show="isShowCover" />
    </div>
    <div class="control-btn">
      <button @click="define">确定</button>
      <button @click="cancel">取消</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'UploadContent',
  data() {
    return {
      content: '',
      desc: '',
      url: '',
      isShowCover: false,
      file: null
    };
  },
  methods: {
    fileChange(e) {
      const file = e.currentTarget.files[0];
      this.file = file;
      this.url = URL.createObjectURL(file);
      this.isShowCover = true;
    },
    define() {
      this.$emit('define', this.content, this.desc, this.file);
    },
    cancel() {
      this.$emit('cancel');
    }
  }
};
</script>

<style scoped lang="less">
.upload {
  padding: 40px 35px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  border-radius: 8px;
  .name,
  .desc {
    display: flex;
    align-items: flex-start;
    margin: 0 0 20px 0;
    span {
      margin: 0 10px 0 0;
    }
  }
  .cover {
    background-color: rgba(0, 0, 0, 0.04);
    height: 120px;
    margin: 0 0 20px 0;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    img {
      height: 100%;
    }
    input {
      position: absolute;
      width: 100%;
      height: 100%;
      opacity: 0;
    }
    i {
      font-size: 40px;
      color: #a0cfff;
    }
  }
  .control-btn {
    display: flex;
    justify-content: flex-end;
    button {
      font-size: 13px;
      padding: 5px 15px;
      margin: 0 0 0 30px;
      cursor: pointer;
      &:nth-child(1) {
        background-color: #a0cfff;
        color: #fff;
      }
    }
  }
}
</style>

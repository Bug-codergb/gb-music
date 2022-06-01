<template>
  <div class="upload">
    <!--标题-->
    <div class="state">
      <div class="title">
        <slot name="title"></slot>
      </div>
      <textarea cols="50" rows="2" @input="titleInp" v-model="title"></textarea>
    </div>
    <!--简介-->
    <div class="desc">
      <div class="desc-name">
        <slot name="desc-name"></slot>
      </div>
      <textarea cols="50" rows="7" @input="contentInp" v-model="content"></textarea>
    </div>
    <div class="time">
      <slot name="time"></slot>
    </div>
    <!--上传文件-->
    <div class="upload-img">
      <div class="upload-name">
        <slot name="upload-name"></slot>
      </div>
      <div class="upload-preview">
        <div class="img-content">
          <input type="file" @change="change" v-show="!isShowPreview" />
          <i class="iconfont icon-tupian" v-show="!isShowPreview && showForm === 'img'"></i>
          <img :src="imgUrl" v-show="isShowPreview && showForm === 'img'" alt="" />
        </div>
        <slot name="vide-content" />
      </div>
    </div>
    <!--分类-->
    <div class="cate" v-if="cateList.length">
      <div class="cate-name">
        <slot name="cate"></slot>
      </div>
      <ul class="cate-outer">
        <li
          v-for="(item, index) in cateList"
          :key="item.id"
          :class="{ active: currentIndex === index }"
          @click="liClick(item, index)"
        >
          {{ item.name }}
        </li>
      </ul>
    </div>
    <!--歌手-->
    <div class="artist-list" v-if="artists.length">
      <div class="artist-title" @click="showArtist">
        <slot name="artistTitle"></slot>
      </div>
      <list
        :list="artists"
        v-show="isShowArtist"
        @defineArtist="defineArtist"
        @select-artist="artistClick"
      />
    </div>
    <!--专辑-->
    <div class="album-list" v-if="albums.length">
      <div class="album-title" @click="showAlbum">
        <slot name="albumTitle"></slot>
      </div>
      <list
        :list="albums"
        v-show="isShowAlbum"
        @defineArtist="defineAlbum"
        @select-artist="albumClick"
      />
    </div>

    <div class="control-btn">
      <button @click="define">确定</button>
      <button @click="cancel">取消</button>
    </div>
  </div>
</template>

<script>
import List from './list/List';
export default {
  name: 'Upload',
  components: { List },
  data() {
    return {
      content: '',
      title: '',
      image: null,
      isShowPreview: false,
      imgUrl: '',
      currentIndex: 0,
      currentArtists: 0,
      isShowArtist: false,
      isShowAlbum: false
    };
  },
  props: {
    cateList: {
      type: Array,
      default() {
        return [];
      }
    },
    artists: {
      type: Array,
      default() {
        return [];
      }
    },
    albums: {
      type: Array,
      default() {
        return [];
      }
    },
    showForm: {
      type: String,
      default: 'img'
    }
  },
  methods: {
    titleInp() {
      this.$emit('titleInp', this.title);
    },
    contentInp() {
      this.$emit('contentInp', this.content);
    },
    change(e) {
      this.imgUrl = URL.createObjectURL(e.target.files[0]);
      this.isShowPreview = !this.isShowPreview;
      this.$emit('select-file', e.target.files[0]);
    },
    liClick(item, index) {
      this.currentIndex = index;
      this.$emit('liClick', item, index);
    },
    artistClick(item, index) {
      this.$emit('select-artist', item);
    },
    albumClick(item, index) {
      this.$emit('select-album', item);
    },
    //显示歌手
    showArtist() {
      this.isShowArtist = true;
    },
    defineArtist() {
      this.isShowArtist = false;
    },
    //显示专辑
    showAlbum() {
      this.isShowAlbum = true;
    },
    defineAlbum() {
      this.isShowAlbum = false;
    },

    define() {
      this.$emit('define');
    },
    cancel() {
      this.$emit('cancel');
    }
  }
};
</script>

<style scoped lang="less">
.upload {
  background-color: #fff;
  z-index: 99;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
  padding: 40px;
  position: relative;
  .state,
  .desc {
    margin: 0 0 15px 0;
    display: flex;
  }
  .state .title,
  .desc .desc-name {
    margin: 0 5px 0 0;
    white-space: nowrap;
  }
  .time {
    margin: 10px 0;
  }
  .upload-img {
    .upload-preview {
      display: flex;
    }
    .img-content {
      overflow: hidden;
      height: 100px;
      flex: 1;
      position: relative;
      text-align: center;
      line-height: 100px;
      background-color: #f2f2f2;
      img {
        height: 100%;
      }
      input {
        position: absolute;
        opacity: 0;
        display: block;
        width: 100%;
        height: 100%;
      }
      i {
        color: #ea646f;
        font-size: 30px;
      }
    }
  }
  /*分类*/
  .cate-name {
    margin: 15px 0;
  }
  .cate-outer {
    display: flex;
    flex-wrap: wrap;
    margin: 0 0 15px 0;
    li {
      padding: 5px 10px;
      background-color: #f7b3b3;
      color: #fff;
      font-size: 13px;
      margin: 0 20px 10px 0;
      border-radius: 3px;
      cursor: pointer;
      &.active {
        background-color: #f27a7a;
      }
    }
  }
  .artist-title,
  .album-title {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 3px;
    background-color: #f27a7a;
    color: #fff;
    margin: 0 0 5px 0;
  }
  .control-btn {
    display: flex;
    justify-content: flex-end;
    margin: 5px 0 0 0;
    button {
      margin: 0 0 0 20px;
      font-size: 13px;
      padding: 5px 10px;
      &:nth-child(1) {
        background-color: #f27a7a;
        color: #fff;
      }
    }
  }
}
</style>

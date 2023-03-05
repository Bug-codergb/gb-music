<template>
  <div class="banner-list">
    <ul class="banners">
      <li v-for="(item, index) in bannerList" :key="item.id">
        <div class="index">
          {{ (index + 1).toString().padStart(2, '0') }}
        </div>
        <div class="img-container">
          <img :src="item.picUrl" :alt="item.name" />
        </div>
        <div v-if="item.album" class="options">
          <div class="name">{{ item.album.name }}</div>
          <div class="cate">专辑</div>
          <div class="create-time">{{ formatDate(item.createTime, 'yyyy-MM-dd') }}</div>
        </div>
        <div v-if="item.video" class="options">
          <div class="name">{{ item.video.name }}</div>
          <div class="cate">视频</div>
          <div class="create-time">{{ formatDate(item.createTime, 'yyyy-MM-dd') }}</div>
        </div>
        <div v-if="item.song" class="options">
          <div class="name">{{ item.song.name }}</div>
          <div class="cate">歌曲</div>
          <div class="create-time">{{ formatDate(item.createTime.toString(), 'yyyy-MM-dd') }}</div>
        </div>
        <div class="control-btn">
          <button @click="delBanner(item)">删除</button>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import { deleteBanner, getBannerList } from '@/network/banner';
import { formatTime } from '@/utils/format';

export default {
  name: 'BannerList',
  data() {
    return {
      bannerList: []
    };
  },
  created() {
    getBannerList().then((data) => {
      this.bannerList = data;
    });
  },
  methods: {
    formatDate(time, ft) {
      return formatTime(time, ft);
    },
    delBanner(item) {
      this.$confirm('确认删除?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          deleteBanner(item.id).then((data) => {
            this.$message({
              type: 'success',
              message: '删除成功!'
            });
            this.$emit('delete');
          });
        })
        .catch(() => {});
    }
  }
};
</script>

<style scoped lang="less">
.banner-list {
  margin: 30px 0 0 0;
  .banners {
    & > li {
      display: flex;
      align-items: center;
      padding: 10px 0;
      border-bottom: 1px solid #ebeef5;
      .index {
        width: 5%;
        text-align: center;
        color: #cacaca;
      }
      .img-container {
        width: 20%;
        img {
          width: 200px;
        }
      }
      .options {
        width: 60%;
        display: flex;
        .name {
          width: 20%;
          font-weight: bold;
          color: #656565;
          font-size: 16px;
        }
        .cate {
          color: #a0cfff;
          width: 20%;
        }
        .create-time {
        }
      }
      .control-btn {
        width: 10%;
        button {
          background-color: #a0cfff;
          color: #fff;
          font-size: 13px;
          padding: 5px 15px;
          border-radius: 4px;
        }
      }
    }
  }
}
</style>

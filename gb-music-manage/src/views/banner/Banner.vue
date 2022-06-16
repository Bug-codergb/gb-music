<template>
  <div class="banner">
    <div class="header-controller">
      <el-autocomplete
        class="inline-input"
        v-model="keyword"
        :fetch-suggestions="querySearch"
        placeholder="请输入内容"
        @select="handleSelect"
      ></el-autocomplete>
      <button class="add" @click="addBanner">添加banner</button>
    </div>
    <div class="upload-outer">
      <upload-banner v-if="isShow" @define="define" @cancel="cancel" />
    </div>
    <banner-list :key="keyIndex" @delete="define" />
  </div>
</template>

<script>
import UploadBanner from '@/views/banner/childCpn/upload/UploadBanner';
import BannerList from '@/views/banner/childCpn/bannerList/BannerList';

export default {
  name: 'Banner',
  components: { BannerList, UploadBanner },
  data() {
    return {
      keyword: '',
      banners: [],
      isShow: false,
      keyIndex: 0
    };
  },
  created() {},
  methods: {
    addBanner() {
      this.isShow = true;
    },
    define() {
      this.isShow = false;
      this.keyIndex += 1;
    },
    cancel() {
      this.isShow = false;
    },
    querySearch(queryString, cb) {
      const restaurants = this.banners;
      const results = queryString
        ? restaurants.filter(this.createFilter(queryString))
        : restaurants;
      // 调用 callback 返回建议列表的数据
      cb(results);
    },
    createFilter(queryString) {
      return (restaurant) => {
        return restaurant.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0;
      };
    },
    handleSelect() {}
  }
};
</script>

<style scoped lang="less">
.banner {
  padding: 30px 0;
  background-color: #fff;
  .header-controller {
    display: flex;
    align-items: center;
    padding: 0 0 0 20px;
    .add {
      margin: 0 0 0 30px;
      background-color: #f56c6c;
      padding: 8px 20px;
      color: #fff;
      border-radius: 4px;
    }
  }
  .upload-outer {
    position: absolute;
    left: 50%;
    top: 25%;
    transform: translate(-50%, 0);
  }
}
</style>

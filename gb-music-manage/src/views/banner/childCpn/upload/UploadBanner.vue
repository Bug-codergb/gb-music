<template>
  <div class="upload">
    <div class="control-btn">
      <button class="define" @click="define">确定</button>
      <button class="cancel" @click="cancel">取消</button>
    </div>
    <div class="img-container">
      <i class="iconfont icon-tupian" v-show="!isPreview"></i>
      <img :src="url" alt="preview" v-show="isPreview" />
      <input type="file" v-show="!isPreview" @change="inpChange" />
    </div>
    <div class="cate">
      <div class="option">
        <el-select v-model="keyword" placeholder="请选择">
          <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </div>
      <div class="option">
        <el-autocomplete
          class="inline-input"
          v-model="name"
          :fetch-suggestions="querySearch"
          placeholder="请输入内容"
          @select="handleSelect"
        ></el-autocomplete>
      </div>
    </div>
  </div>
</template>

<script>
import { getSearchMatch } from '@/network/search';
import { addBanner, uploadBanner } from '@/network/banner';

export default {
  name: 'UploadBanner',
  components: {},
  data() {
    return {
      keyword: '',
      options: [
        {
          label: '视频',
          value: 'video'
        },
        {
          label: '专辑',
          value: 'album'
        },
        {
          label: '歌曲',
          value: 'song'
        }
      ],
      name: '',
      list: [],
      url: '',
      isPreview: false,
      banner: {},
      formData: null
    };
  },
  methods: {
    querySearch(queryString, cb) {
      getSearchMatch(queryString)
        .then((data) => {
          if (data) {
            if (this.keyword === 'video') {
              const res= data.video.map((item, index) => {
                return {
                  value: item.name,
                  id: item.id
                };
              });
              const results = queryString ? res.filter(this.createFilter(queryString)) : res;
              cb(results);
            } else if (this.keyword === 'album') {
              const res = data.album.map((item, index) => {
                return {
                  value: item.name,
                  id: item.id
                };
              });
              const results = queryString ? res.filter(this.createFilter(queryString)) : res;
              cb(results);
            } else if (this.keyword === 'song') {
              const res = data.song.map((item, index) => {
                return {
                  value: item.name,
                  id: item.id
                };
              });
              const results = queryString ? res.filter(this.createFilter(queryString)) : res;
              cb(results);
            } else {
              this.$message({
                showClose: true,
                message: '请选择类型',
                type: 'warning'
              });
            }
          }
        })
        .catch((e) => {});
    },
    createFilter(queryString) {
      return (restaurant) => {
        return restaurant.value.toLowerCase().includes(queryString.toLowerCase());
      };
    },
    handleSelect(item) {
      this.banner = item;
    },
    request(key, id) {
      addBanner(key, id).then((data) => {
        const { id } = data;
        if (this.formData) {
          uploadBanner(this.formData, key, this.banner.id).then((data) => {
            this.$emit('define');
          });
        }
      });
    },
    define() {
      let key = '';
      if (this.keyword === 'album') {
        key = 'alId';
        this.request(key, this.banner.id);
      } else if (this.keyword === 'video') {
        key = 'vId';
        this.request(key, this.banner.id);
      } else if (this.keyword === 'song') {
        key = 'songId';
        this.request(key, this.banner.id);
      } else {
        this.$message({
          showClose: true,
          message: '请选择类型',
          type: 'warning',
          duration: 2000
        });
      }
    },
    cancel() {
      this.$emit('cancel');
    },
    inpChange(e) {
      this.url = URL.createObjectURL(e.target.files[0]);
      this.isPreview = true;
      let formData = new FormData();
      formData.append('banner', e.target.files[0]);
      this.formData = formData;
    }
  }
};
</script>
<style lang="less">
.upload {
  .el-input {
    width: 300px;
    font-size: 13px;
  }
}
</style>
<style scoped lang="less">
.upload {
  width: 450px;
  padding: 40px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  background-color: #fff;
  display: flex;
  flex-wrap: wrap;
  flex-direction: column-reverse;
  align-items: center;
  border-radius: 18px;
  .cate {
    .option {
      margin: 0 0 30px 0;
    }
  }
  .control-btn {
    width: 80%;
    display: flex;
    justify-content: flex-end;
    .define,
    .cancel {
      font-size: 14px;
      padding: 5px 15px;
      margin: 0 0 0 20px;
      border-radius: 4px;
    }
    .define {
      background-color: #a0cfff;
      color: #fff;
    }
  }
  .img-container {
    height: 100px;
    width: 85%;
    background-color: #f2f2f2;
    margin: 0 0 20px 0;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
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
    img {
      height: 100%;
    }
  }
}
</style>

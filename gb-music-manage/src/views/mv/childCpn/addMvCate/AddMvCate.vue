<template>
  <div class="add-mv-cate">
    <div class="cate">
      <p>语种:</p>
      <div class="inp">
        <label>
          <input type="text" v-model="cate" placeholder="请输入语种" />
        </label>
        <button @click="addCate">添加语种</button>
      </div>
      <ul class="cate-list">
        <li v-for="(item, index) in cateList" :key="item.id">
          {{ item.name }}
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import { addVideoCate, getCateVideo, getVideoCate } from '@/network/video';

export default {
  name: 'AddMvCate',
  data() {
    return {
      cateList: [],
      cate: ''
    };
  },
  created() {
    getVideoCate(1).then((data) => {
      this.cateList = data;
    });
  },
  methods: {
    addCate() {
      if (this.cate.length !== 0) {
        addVideoCate('1', this.cate).then((data) => {
          getVideoCate(1).then((data) => {
            this.cateList = data;
            this.cate = '';
            this.$toast.show('添加成功', 1500);
          });
        });
      }
    }
  }
};
</script>

<style scoped lang="less">
.add-mv-cate {
  margin: 20px 0 0 0;
  padding: 10px 20px;
  .cate {
    margin: 0 0 80px 0;
    p {
      text-align: left;
      margin: 0 0 5px 0;
      color: #9b9b9b;
    }
    .cate-list {
      display: flex;
      flex-wrap: wrap;
      margin: 20px 0 0 0;
      & > li {
        font-size: 12px;
        padding: 6px 16px;
        background-color: #f27a7a;
        color: #fff;
        margin: 0 10px 10px 0;
        position: relative;
        border-radius: 3px;
        .del {
          width: 12px;
          height: 12px;
          text-align: center;
          line-height: 12px;
          position: absolute;
          border-radius: 50%;
          background-color: #fff;
          left: 100%;
          top: 0;
          cursor: pointer;
          transform: translate(-50%, -50%);
          border: 1px solid #ec4141;
          i {
            width: 10px;
            height: 10px;
            color: palegoldenrod;
          }
        }
      }
    }
  }
  .inp {
    display: flex;
    align-items: center;
    input {
      border: 1px solid #ec4141;
      padding: 8px 20px;
      font-size: 13px;
      border-radius: 4px;
    }
    button {
      background-color: #ec4141;
      color: #fff;
      font-size: 13px;
      padding: 6px 15px;
      margin: 0 0 0 10px;
      border-radius: 3px;
    }
  }
}
</style>

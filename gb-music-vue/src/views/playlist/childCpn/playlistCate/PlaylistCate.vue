<template>
  <div class="playlist-cate">
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
          <div class="del-cate" @click="deleteCate(item)">
            <i class="el-icon-close"></i>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { addPlaylistCate, delPlaylistCate, getPlaylistCate } from "@/network/playlist";

export default {
  name: 'PlaylistCate',
  data() {
    return {
      cate: '',
      cateList: []
    };
  },
  created() {
    getPlaylistCate(0, 30).then((data) => {
      this.cateList = data;
    });
  },
  methods: {
    addCate() {
      if (this.cate.length !== 0) {
        addPlaylistCate(this.cate).then((data) => {
          getPlaylistCate(0, 30).then((data) => {
            this.cateList = data;
            this.cate = '';
            this.$toast.show('添加成功', 1500);
          });
        });
      }
    },
    deleteCate(item){
      this.$confirm('是否删除歌单类型', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        delPlaylistCate(item.id).then(data=>{
          getPlaylistCate(0, 30).then((data) => {
            this.cateList = data;
          });
          this.$message({
            type: 'success',
            message: '删除成功!'
          });
        })
      }).catch(() => {

      });

    }
  }
};
</script>

<style scoped lang="less">
.playlist-cate {
  margin: 20px 0 0 0;
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
        margin: 0 15px 15px 0;
        position: relative;
        border-radius: 3px;
        .del-cate{
          position: absolute;
          left: 70%;
          top: 0;
          z-index: 9;
          transform: translate(50%,-50%);
          background-color:rgba(245, 108, 108,.7);
          border-radius: 50%;
          border: 2px solid #f56c6c;
          display: flex;
          align-items: center;
          justify-content: center;
          cursor: pointer;
        }
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
    flex-wrap: wrap;
    input {
      border: 1px solid #ec4141;
      padding: 8px 20px;
      font-size: 13px;
      border-radius: 4px;
    }
    button {
      background-color: #f27a7a;
      color: #fff;
      font-size: 13px;
      padding: 6px 15px;
      margin: 20px 0 0 0;
      border-radius: 3px;
    }
  }
}
</style>

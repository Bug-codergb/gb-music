<template>
  <div class="cate-type">
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
    <div class="cate">
      <p>类别:</p>
      <div class="inp">
        <label>
          <input type="text" v-model="type" placeholder="请输入类别" />
        </label>
        <button @click="addType">添加类别</button>
      </div>
      <ul class="cate-list">
        <li v-for="(item, index) in typeList" :key="item.id">
          {{ item.name }}
          <div class="del-cate" @click="deleteType(item)">
            <i class="el-icon-close"></i>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import {
  addArtistCate,
  addArtistType,
  deleteArtistCate,
  deleteArtistType,
  getArtistCate,
  getArtistType
} from "@/network/artist";

export default {
  name: 'CateType',
  data() {
    return {
      cateList: [],
      typeList: [],
      cate: '',
      type: ''
    };
  },
  created() {
    //获取语种 华语
    getArtistCate().then((data) => {
      this.cateList = data;
    });
    //获取类型 男歌手
    getArtistType().then((data) => {
      this.typeList = data;
    });
  },
  methods: {
    addCate() {
      if (this.cate.length !== 0) {
        addArtistCate(this.cate).then((data) => {
          getArtistCate().then((data) => {
            this.cateList = data;
            this.cate = '';
            this.$toast.show('添加cate成功', 1500);
            this.$emit("refresh")
          });
        });
      }
    },
    addType() {
      if (this.type.length !== 0) {
        addArtistType(this.type).then((data) => {
          getArtistType().then((data) => {
            this.typeList = data;
            this.type = '';
            this.$toast.show('添加type成功', 1500);
            this.$emit("refresh")
          });
        });
      }
    },
    deleteCate(item){
      if(item.id*1!==0){
        this.$confirm('是否删除歌手分类', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          deleteArtistCate(item.id).then(data=>{
            getArtistCate().then((data) => {
              this.cateList = data;
              this.cate = '';
              this.$message({
                type: 'success',
                message: '删除成功!'
              });
            });
          })
        }).catch(() => {

        });
      }
    },
    deleteType(item){
      this.$confirm('是否删除歌手类型', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteArtistType(item.id).then(data=>{
          getArtistType().then((data) => {
            this.typeList = data;
            this.type = '';
            this.$message({
              type: 'success',
              message: '删除成功!'
            });
          });
        })
      }).catch(() => {

      });
    }
  }
};
</script>

<style scoped lang="less">
.cate-type {
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
      margin: 15px 0 0 0;
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
      margin: 0 0 0 10px;
      border-radius: 3px;
    }
  }
}
</style>

<template>
  <div class="mv">
    <div class="cate-list-outer">
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
      <div class="controller-outer">
        <div class="search-outer">
          <el-input
            placeholder="请输入视频名称"
            suffix-icon="el-icon-search"
            v-model="keyword"
            @input="searchInp"
          >
          </el-input>
        </div>
        <div class="add-cate" @click="drawer = true">添加分类</div>
      </div>
    </div>
    <!--mv-->
    <ul class="mvs">
      <li v-for="(item, index) in MV" :key="item.id">
        <div class="index">{{ (index + 1).toString().padStart(2, '0') }}</div>
        <div class="img-container">
          <img v-lazy="item.coverUrl" :alt="item.name" />
        </div>
        <div class="name">{{ item.name }}</div>
        <div class="user-name">{{ item.user.userName }}</div>
        <div class="create-time">{{ formatTime(item.createTime, 'yyyy-MM-dd') }}</div>
        <div class="dt">{{ formatTime(item.dt, 'mm:ss') }}</div>
        <div class="play-count">
          <i class="el-icon-video-play"></i>
          {{ item.playCount }}
        </div>
        <div class="del" @click="delMV(item, index)">
          <button>删除</button>
        </div>
        <div class="del" @click="editMV(item, index)">
          <button>编辑</button>
        </div>
        <div class="del" @click="checkoutMV(item, index)">
          <button>查看</button>
        </div>
      </li>
    </ul>
    <div class="empty" v-if="MV.length === 0">
      <el-empty description="暂无MV"></el-empty>
    </div>
    <div class="page" v-if="count > 8">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="count"
        :page-size="8"
        @current-change="pageChange"
      >
      </el-pagination>
    </div>
    <el-drawer title="添加分类" :visible.sync="drawer" :before-close="handleClose">
      <div class="line"></div>
      <AddMvCate />
    </el-drawer>
    <el-drawer
      :direction="direction"
      :visible.sync="isShow"
      :destroy-on-close="true"
      :show-close="false"
    >
      <template v-slot:title>
        <div class="title-control">
          <div class="title">编辑MV信息</div>
          <div class="define" @click="defineEdit">确定</div>
        </div>
      </template>
      <EditMV v-if="isShow" :mv="mvItem" ref="mvEdit" />
    </el-drawer>
  </div>
</template>

<script>
import { getVideoCate, updateVideo } from '@/network/video';
import { delVideo, getCateVideo } from '../../network/video';
import { formatTime } from '@/utils/format';
import { debounce } from '@/utils/debounce';
import AddMvCate from '@/views/mv/childCpn/addMvCate/AddMvCate';
import EditMV from '@/views/mv/childCpn/editMV/EditMV';
export default {
  name: 'MV',
  components: { AddMvCate, EditMV },
  data() {
    return {
      mvCate: [],
      currentIndex: 0,
      MV: [],
      count: 0,
      keyword: '',
      cateId: '',
      drawer: false,
      isShow: false,
      mvItem: {},
      direction: 'rtl'
    };
  },
  created() {
    getVideoCate(1).then((data) => {
      this.mvCate = data;
      this.liClick(data[0], 0);
    });
  },
  methods: {
    liClick(item, index) {
      this.currentIndex = index;
      this.cateId = item.id;
      getCateVideo(item.id, 1, this.keyword, 0, 8).then((data) => {
        if (data && data.videos) {
          this.MV = data.videos;
          this.count = data.count;
        }
      });
    },
    formatTime(time, ft) {
      return formatTime(time, ft);
    },
    delMV(item, index) {
      const flag = confirm('确定要删除吗?');
      if (flag) {
        delVideo(item.id).then((data) => {
          this.$delete(this.MV.videos, index);
        });
      }
    },
    pageChange(page) {
      getCateVideo(this.cateId, 1, this.keyword, (page - 1) * 8, 8).then((data) => {
        if (data && data.videos) {
          this.MV = data.videos;
          this.count = data.count;
        }
      });
    },
    searchInp: debounce(
      function () {
        getCateVideo(this.cateId, 1, this.keyword, 0, 8).then((data) => {
          if (data && data.videos) {
            this.MV = data.videos;
            this.count = data.count;
          }
        });
      },
      1000,
      false
    ),
    handleClose(done) {
      getVideoCate(1).then((data) => {
        this.mvCate = data;
        this.liClick(data[0], 0);
      });
      done();
    },
    editMV(item) {
      this.mvItem = item;
      this.isShow = true;
    },
    checkoutMV(item){
      this.$router.push({
        path:"/Home/videoDetail",
        query:{
          id:item.id
        }
      })
    },
    defineEdit() {
      if (this.$refs.mvEdit) {
        this.$refs.mvEdit.$refs.form.validate((e) => {
          if (e) {
            const { name, cate, desc } = this.$refs.mvEdit.form;
            updateVideo(this.mvItem.id, name, desc, cate).then((data) => {
              this.isShow = false;
              getCateVideo(this.cateId, 1, this.keyword, 0, 8).then((data) => {
                this.MV = data.videos;
                this.count = data.count;
              });
            });
          }
        });
      }
    }
  }
};
</script>

<style scoped lang="less">
.cate-list-outer {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.mv {
  background-color: #fff;
  padding: 30px 0;
  .cate-list {
    display: flex;
    align-items: center;
    padding: 0 0 0 15px;
    li {
      padding: 3px 15px;
      font-size: 13px;
      cursor: pointer;
      border-radius: 5px;
      &.active {
        background-color: #fdf5f5;
        color: #ec4141;
      }
    }
  }
  .mvs {
    margin: 20px 0 0 0;
    & > li {
      padding: 10px 0;
      display: flex;
      align-items: center;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .index {
        padding: 0 20px;
        color: #9b9b9b;
        font-size: 13px;
      }
      .img-container {
        width: 100px;
        margin: 0 20px 0 0;
        img {
          width: 100%;
          border-radius: 5px;
        }
      }
      .name {
        width: 10%;
        font-size: 13px;
      }
      .user-name {
        width: 15%;
        color: #656565;
        font-size: 13px;
      }
      .create-time,
      .dt {
        color: #9b9b9b;
        width: 15%;
        font-size: 13px;
      }
      .play-count {
        display: flex;
        align-items: center;
        color: #9b9b9b;
        margin: 0 50px 0 0;
        width: 8%;
        i {
          margin: 0 5px 0 0;
        }
      }
      .del {
        margin: 0 15px 0 0;
        button {
          background-color: #f27a7a;
          color: #fff;
          font-size: 13px;
          padding: 5px 15px;
          cursor: pointer;
          border-radius: 4px;
        }
      }
    }
  }
}
.empty {
  padding: 150px 0 100px 0;
}
.page {
  display: flex;
  justify-content: center;
}
.controller-outer {
  display: flex;
  justify-content: space-between;
  padding: 0 30px 0 0;
  .add-cate {
    background-color: #f56c6c;
    color: #fff;
    padding: 5px 15px;
    border-radius: 5px;
    margin: 0 0 0 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
  }
}
.line {
  width: 100%;
  height: 1px;
  background-color: #f56c6c;
}
</style>

<template>
  <div class="video-list">
    <div class="cate-list-outer">
      <ul class="cate-list">
        <li
          v-for="(item, index) in cateList"
          :key="item.id"
          @click="cateClick(item, index)"
          :class="{ active: currentIndex === index }"
        >
          {{ item.name }}
        </li>
      </ul>
      <div class="search-outer">
        <el-input
          placeholder="请输入视频名称"
          suffix-icon="el-icon-search"
          v-model="keyword"
          @input="searchInp"
        >
        </el-input>
      </div>
    </div>
    <ul class="videos" v-if="videoList">
      <li v-for="(item, index) of videoList" :key="item.id">
        <div class="index">
          {{ (index + 1).toString().padStart(2, '0') }}
        </div>
        <div class="img-container">
          <img v-lazy="item.coverUrl" :alt="item.name" />
        </div>
        <div class="video-name">
          {{ item.name }}
        </div>
        <div class="dt">{{ formatDate(item.dt, 'mm:ss') }}</div>
        <div class="create-time">{{ formatDate(item.createTime, 'yyyy-MM-dd') }}</div>
        <div class="user-name">by {{ item.user.userName }}</div>
        <button class="del-btn" @click="del(item, index)">删除</button>
        <button class="del-btn" @click="edit(item, index)">编辑</button>
        <button class="del-btn" @click="checkout(item, index)">查看</button>
      </li>
    </ul>
    <div class="empty" v-if="videoList.length === 0">
      <el-empty description="暂无视频"></el-empty>
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
    <el-drawer
      :direction="direction"
      :visible.sync="drawer"
      :destroy-on-close="true"
      :show-close="false"
    >
      <template v-slot:title>
        <div class="title-control">
          <div class="title">编辑视频信息</div>
          <div class="define" @click="defineEdit">确定</div>
        </div>
      </template>
      <edit-video v-if="drawer" :video="video" ref="videoEdit" />
    </el-drawer>
  </div>
</template>

<script>
import { getCateVideo, getVideoCate, updateVideo } from '@/network/video';
import MsgItem from '@/components/common/msgItem/MsgItem';
import { formatTime } from '@/utils/format';
import { delVideo } from '@/network/video';
import { debounce } from '@/utils/debounce';
import EditVideo from '@/views/video/childCpn/editVideo/EditVideo';

export default {
  name: 'VideoList',
  components: { EditVideo, MsgItem },
  data() {
    return {
      currentIndex: 0,
      cateList: [],
      videoList: [],
      count: 0,
      cateId: '',
      keyword: '',
      drawer: false,
      direction: 'rtl',
      video: {}
    };
  },
  created() {
    getVideoCate(0).then((data) => {
      this.cateList = data;
      this.cateId = data[0].id;
      getCateVideo(data[0].id, 0, this.keyword, 0, 8).then((data) => {
        this.videoList = data.videos;
        this.count = data.count;
      });
    });
  },
  methods: {
    cateClick(item, index) {
      this.currentIndex = index;
      this.cateId = item.id;
      getCateVideo(item.id, 0, this.keyword, 0, 8).then((data) => {
        console.log(data);
        this.videoList = data.videos;
        this.count = data.count;
      });
    },
    formatDate(time, ft) {
      return formatTime(time, ft);
    },
    del(item, index) {
      const flag = confirm('确定要删除吗?');
      if (flag) {
        delVideo(item.id).then((data) => {
          this.$delete(this.videoList, index);
        });
      }
    },
    pageChange(page) {
      getCateVideo(this.cateId, 0, this.keyword, (page - 1) * 8, 8).then((data) => {
        this.videoList = data.videos;
        this.count = data.count;
      });
    },
    searchInp: debounce(
      function () {
        getCateVideo(this.cateId, 0, this.keyword, 0, 8).then((data) => {
          this.videoList = data.videos;
          this.count = data.count;
        });
      },
      1000,
      false
    ),
    edit(item, index) {
      this.video = item;
      this.drawer = true;
    },
    checkout(item){
      this.$router.push({
        path:"/Home/videoDetail",
        query:{
          id:item.id
        }
      })
    },
    defineEdit() {
      if (this.$refs.videoEdit) {
        this.$refs.videoEdit.$refs.form.validate((e) => {
          if (e) {
            const { name, cate, desc } = this.$refs.videoEdit.form;
            updateVideo(this.video.id, name, desc, cate).then((data) => {
              this.drawer = false;
              getCateVideo(this.cateId, 0, this.keyword, 0, 8).then((data) => {
                this.videoList = data.videos;
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
  justify-content: space-between;
  flex-wrap: wrap;
  padding: 0 10px 15px 0;
}
.cate-list {
  margin: 10px 0;
  display: flex;
  li {
    margin: 0 10px 0;
    padding: 3px 15px;
    cursor: pointer;
    border-radius: 14px;
    font-size: 13px;
    &.active {
      background-color: #fdf5f5;
      color: #ec4141;
    }
  }
}
.videos {
  li {
    margin: 0 0 20px 0;
    display: flex;
    align-items: center;
    &:nth-child(odd) {
      background-color: #f9f9f9;
    }
    &:hover {
      background-color: #f0f1f2;
    }
    .index {
      font-size: 13px;
      padding: 0 15px;
    }
    .img-container {
      width: 100px;
      margin: 0 20px 0 0;
      img {
        width: 100%;
        border-radius: 5px;
      }
    }
    .video-name {
      font-size: 13px;
      width: 25%;
      color: #0086b3;
    }
    .dt {
      width: 10%;
      color: #656565;
    }
    .create-time,
    .user-name {
      font-size: 13px;
      color: #656565;
      width: 14%;
    }

    .del-btn {
      margin: 10px 10px 0 0;
      background-color: #f27a7a;
      color: #fff;
      padding: 5px 15px;
      font-size: 12px;
      border-radius: 4px;
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
</style>

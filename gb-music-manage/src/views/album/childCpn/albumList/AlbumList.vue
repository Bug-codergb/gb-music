<template>
  <div class="album-list">
    <div class="album-cate-list">
      <cate :list="albumCateList" @cate-click="cateClick" />
      <div class="search-outer">
        <el-input
          placeholder="请输入专辑名称"
          suffix-icon="el-icon-search"
          style="width: 240px"
          @input="inpChange"
          v-model.trim="keyword"
        >
        </el-input>
      </div>
    </div>
    <!--专辑列表-->
    <ul>
      <li v-for="(item, index) in albumList" :key="item.id">
        <div class="index">{{ (index + 1).toString().padStart(2, '0') }}</div>
        <div class="img-container" @click="albumRouter(item, index)"
             v-lazy-container="{selector:'img',
                                error:require('../../../../assets/img/holder/music-placeholder.png'),
                                loading:require('../../../../assets/img/holder/music-placeholder.png')}">
          <img :data-src="item.coverUrl" :atl="item.name" />
        </div>
        <div class="state" @click="albumRouter(item, index)">{{ item.name }}</div>
        <div class="creator">{{ item.artist.name }}</div>
        <div class="album-count">歌曲数: {{ item.count }}</div>
        <div class="time">{{ formatTime(parseInt(item.publishTime), 'yyyy-MM-dd') }}</div>
        <div class="del-btn" @click="albumRouter(item, index)">查看</div>
        <div class="del-btn" @click="delAlbum(item, index)">删除</div>
        <div class="del-btn" @click="editAlbum(item, index)">编辑</div>
      </li>
    </ul>
    <div class="empty" v-if="albumList.length === 0">
      <el-empty description="暂无相关专辑"></el-empty>
    </div>
    <!--分页-->
    <div class="page" v-if="count > 8">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="count"
        :page-size="7"
        @current-change="pageChange"
      >
      </el-pagination>
    </div>
    <el-drawer title="专辑信息" :visible.sync="drawer" :destroy-on-close="true" :show-close="false">
      <template v-slot:title>
        <div class="title-control">
          <div class="title">编辑专辑信息</div>
          <div class="define" @click="define">确定</div>
        </div>
      </template>
      <EditAlbum :album="album" ref="editAlbum" />
    </el-drawer>
  </div>
</template>

<script>
import Cate from '../../../../components/common/cate/Cate';
import {
  delAlbum,
  getAlbumCate,
  getAllAlbum,
  getCateAlbum,
  updateAlbum
} from '../../../../network/album';
import { formatTime } from '@/utils/format';
import { getCateArtistDetail } from '@/network/artist';
import { debounce } from '@/utils/debounce';
import EditAlbum from '@/views/album/childCpn/editAlbum/EditAlbum';
export default {
  name: 'AlbumList',
  components: { EditAlbum, Cate },
  data() {
    return {
      albumCateList: [],
      albumList: [],
      count: 0,
      cateId: '',
      keyword: '',
      drawer: false,
      album: {}
    };
  },
  created() {
    getAlbumCate().then((data) => {
      this.albumCateList = data;
      this.cateClick(data[0]);
    });
  },
  methods: {
    formatTime(time, ft) {
      return formatTime(time, ft);
    },
    cateClick(item) {
      this.cateId = item.id;
      getCateAlbum(item.id, this.keyword, 0, 7).then((data) => {
        this.albumList = data.album;
        this.count = data.count;
      });
    },
    albumRouter(item, index) {
      this.$router.push({
        path: '/Home/album/detail',
        query: {
          albumId: item.id
        }
      });
    },
    delAlbum(item, index) {
      this.$confirm('删除该专辑?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        delAlbum(item.id).then((data) => {
          this.$toast.show('删除成功');
        });
      }).catch(() => {

      });
    },
    inpChange: debounce(
      function () {
        getCateAlbum(this.cateId, this.keyword, 0, 7).then((data) => {
          this.albumList = data.album;
          this.count = data.count;
        });
      },
      1000,
      false
    ),
    pageChange(e) {
      getCateAlbum(this.cateId, this.keyword, (e - 1) * 7, 7).then((data) => {
        this.albumList = data.album;
        this.count = data.count;
      });
    },
    //编辑专辑
    editAlbum(item) {
      this.drawer = true;
      this.album = item;
    },
    define() {
      updateAlbum(
        this.album.id,
        this.$refs.editAlbum.name,
        this.$refs.editAlbum.desc,
        this.$refs.editAlbum.timestamp
      ).then((data) => {
        this.drawer = false;
        getCateAlbum(this.cateId, this.keyword, 0, 7).then((data) => {
          this.albumList = data.album;
          this.count = data.count;
        });
        this.$message({
          message: '更新成功',
          duration: 1500,
          type: 'success'
        });
      });
    }
  }
};
</script>

<style scoped lang="less">
.album-list {

  overflow-y: scroll;
  &::-webkit-scrollbar {
    width: 3px;
  }
  .album-cate-list {
    margin: 20px 0 0 10px;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  ul {
    margin: 20px 0 0 0;
    li {
      display: flex;
      align-items: center;
      padding: 10px 0 10px 5px;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .index {
        color: #9b9b9b;
        font-size: 13px;
        padding: 0 15px;
      }
      .img-container {
        width: 60px;
        height: 60px;
        img {
          width: 100%;
          border-radius: 5px;
        }
      }
      .state {
        width: 25%;
        margin: 0 0 0 30px;
        color: #373737;
      }
      .creator {
        font-size: 13px;
        color: #656565;
        width: 13%;
      }
      .album-count {
        width: 11%;
        color: #9b9b9b;
        font-size: 13px;
      }
      .time {
        font-size: 13px;
        color: #9b9b9b;
        width: 15%;
      }
      .del-btn {
        background-color: #f27a7a;
        color: #fff;
        font-size: 13px;
        padding: 5px 15px;
        cursor: pointer;
        border-radius: 4px;
        margin: 0 10px 0 0;
      }
    }
  }
}
.page {
  display: flex;
  justify-content: center;
  padding: 15px 0;
}
.empty {
  padding: 100px 0 0 0;
}
</style>
